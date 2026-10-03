#include "keyboard.h" 

void shell() {
  print("starkosuser> ");

  while (1) {
    char c = keyboard_getchar();

    if (c)
        print_char(c);
  }
}
