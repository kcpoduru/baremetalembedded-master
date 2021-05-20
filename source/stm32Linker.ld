ENTRY(Reset_Handler)


MEMORY
{
  FLASH(RX)   : ORIGIN = 0x8000000,          LENGTH =1024K
  SRAM(RWX)   : ORIGIN = 0x20000000,         LENGTH =192K + 16K
}




SECTIONS
{
    .text :
    {
      *(.isr_vector)
      *(.text)      /*.text of main.o led.o startup.o */
      *(.text.*)
      *(.init)
      *(.fini)
      *(.rodata)
      . = ALIGN(4);
      _etext  = .;
    }> FLASH AT> FLASH

    _la_data = LOADADDR(.data);

    .data :
    {
      _sdata = .;     /* location counter always tracks for VMA of the section in which it is being used not lma  */
      *(.data)
      *(.data*)
      . = ALIGN(4);
      _edata = .;
    }>SRAM AT >FLASH

    .bss :
    {
      _sbss = .;
      __bss_start__ = _sbss;
      *(.bss)
      *(.bss*)
      *(COMMON)
      . = ALIGN(4);
      _ebss = .;
      __bss_end__ = _ebss;
      . = ALIGN(4);
      end = .;
      __end__ = end;
    } > SRAM

}
