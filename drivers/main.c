#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/device.h>
#include <linux/platform_device.h>
#include <linux/interrupt.h>

#define INT_NUM 72
#define RAM1_IRQ_NUM 30
#define RAM2_IRQ_NUM 32

MODULE_LICENSE("Dual BSD/GPL");

static irqreturn_t ram1_irq_handler(int irq, void *dev_id)
{
    if (irq != INT_NUM)
        return IRQ_NONE;
    printk(KERN_ALERT "Interrupt %d occured\n", RAM1_IRQ_NUM);
    return IRQ_HANDLED;
}

static irqreturn_t ram2_irq_handler(int irq, void *dev_id)
{
    if (irq != INT_NUM)
        return IRQ_NONE;
    printk(KERN_ALERT "Interrupt %d occured\n", RAM2_IRQ_NUM);
    return IRQ_HANDLED;
}

static int __init init_driver_module(void)
{
    int ret;
    ret = request_irq(RAM1_IRQ_NUM, ram1_irq_handler,
                      0, "ram1_irq_handler", NULL);
    if (ret < 0)
        return ret;
    printk(KERN_ALERT "ram1_irq_handler registed\n");

    ret = request_irq(RAM1_IRQ_NUM, ram2_irq_handler,
                      0, "ram2_irq_handler", NULL);
    if (ret < 0)
        return ret;
    printk(KERN_ALERT "ram2_irq_handler registed\n");

    return 0;
}

static void driver_module_exit(void)
{
    free_irq(INT_NUM, NULL);
    printk(KERN_ALERT "exit from driver test\n");
}

module_init(init_driver_module);
module_exit(driver_module_exit);