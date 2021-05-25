obj-m += lkm_example.o

all: build

build:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

test: build
	sudo dmesg -C
	sudo insmod lkm_example.ko
	sudo rmmod lkm_example.ko
	sudo dmesg
