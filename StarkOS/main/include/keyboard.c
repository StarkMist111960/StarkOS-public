
#include "keyboard.h"

unsigned char inb(unsigned short port) {
        unsigned char result;

        __asm__ volatile(
                "inb %1, %0"
                : "+a"(result)
                : "Nd"(port)
        );

         return result;
}

char keyboard_map[128] = {
        0,
        27,
        '1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
        '-', '=', '\b',
        '\t',

        'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p',
        '[',']','\n',

        0,

        'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l',
        ';',

        0,

        '`',

        0,

        '\\',

        'z', 'x', 'c', 'v', 'b', 'n', 'm',
        ',', '.', '/',

        0,
        '*',

        0,
        ' '

};

char keyboard_getchar() { 
  while ((inb(0x64) & 1) == 0);

  unsigned char key = inb(0x60);

  if (key & 0x80)
    return 0;

  if (key >= 128)
    return 0;
}
