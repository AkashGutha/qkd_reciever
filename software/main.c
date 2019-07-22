#include <stdio.h>
#include <unistd.h>
#include <stdint.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <time.h>

#include "errno.h"
#include "hwlib.h"
#include "soc_cv_av/socal/socal.h"
#include "soc_cv_av/socal/hps.h"
#include "soc_cv_av/socal/alt_gpio.h"

#include "hps.h"
#include "quartus.h"

// pointers for virtual bases
void *h2p_lw_axi_vbase;
void *h2p_hw_axi_vbase;

// pointers for memory banks
void *mem1_bank_on_axi_base;
void *mem2_bank_on_axi_base;

// time variables
clock_t start, end;
double cpu_time_used;

// FILE pointer and other requirements for the input file
FILE *file;
UINT32 buffer[256];

// file descriptor
int fd;
unsigned int i = 0;

int main(int argc, char const *argv[])
{
    // OPEN "/dev/mem" -> Map the device peripherals into a linux vbase
    fd = open("/dev/mem", (O_RDWR | O_SYNC));
    if (fd == -1)
    {
        printf("ERROR: Could not open \"/dev/mem\"...\n");
        return 1;
    }

    // get the base address for the LW axi bridge
    h2p_lw_axi_vbase = mmap(NULL, HW_REGS_SPAN, (PROT_READ | PROT_WRITE), MAP_SHARED, fd, HW_REGS_BASE);

    if (h2p_lw_axi_vbase == MAP_FAILED)
    {
        printf("ERROR: lw axi mmap() failed..................\r\n");
        close(fd);
        return 1;
    }

    // get the base address for the HW axi bridge
    h2p_hw_axi_vbase = mmap(NULL, HW_FPGA_AXI_SPAN, (PROT_READ | PROT_WRITE), MAP_SHARED, fd, ALT_AXI_FPGASLVS_OFST);

    if (h2p_hw_axi_vbase == MAP_FAILED)
    {
        printf("ERROR: hw axi mmap() failed....................\r\n");
        close(fd);
        return 1;
    }

    //-------------------------------------------------------------
    // File open/create process
    //-------------------------------------------------------------
    errno = 0;

    // get the file path from arguments and open the file
    if (argc != 2)
    {
        printf("Please pass in 2 arguments instead of %d arguments\r\n", argc);
        return -1;
    }
    file = fopen(argv[1], "w+");

    if (file == NULL)
    {
        printf("ERROR: Opening the file at %s \r\nError code: %d \r\n", argv[1], errno);
        return -1;
    }

    //-------------------------------------------------------------
    // Write the incoming data using the interrupts
    //-------------------------------------------------------------

    mem1_bank_on_axi_base = h2p_hw_axi_vbase + ((ULONG)MEM1_BASE & (ULONG)HW_FPGA_AXI_MASK);
    mem2_bank_on_axi_base = h2p_hw_axi_vbase + ((ULONG)MEM2_BASE & (ULONG)HW_FPGA_AXI_MASK);

    for (i = 0; i < MEM1_SPAN; i++)
    {
        *((UP32)mem1_bank_on_axi_base + i) = rand();
        *((UP32)mem2_bank_on_axi_base + i) = rand();
    }

    start = clock();
    for (i = 0; i < 100; i++)
    {
        fwrite( (UP32)mem1_bank_on_axi_base, sizeof(UINT16), MEM1_SPAN, file);
        fwrite( (UP32)mem2_bank_on_axi_base, sizeof(UINT16), MEM2_SPAN, file);
    }
    end = clock();

    printf("%.f\r\n", ((double)end-start));

    //-------------------------------------------------------------
    // clean up our memory mapping and exit
    //-------------------------------------------------------------
    if (munmap(h2p_hw_axi_vbase, HW_FPGA_AXI_SPAN) != 0)
    {
        printf("ERROR: axi munmap() failed.............................\r\n");
        close(fd);
        return 1;
    }

    fclose(file);
    close(fd);

    return 0;
}

long GetFileSize(const char *filename)
{
    long size;
    FILE *f;

    f = fopen(filename, "rb");
    if (f == NULL)
        return -1;
    fseek(f, 0, SEEK_END);
    size = ftell(f);
    fclose(f);

    return size;
}
