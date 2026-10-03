#include "keyboard.h" 

void shell() {
  print("Welcome to StarkOS"\n);
  print("Version: Beta 0.7"\n);
  print("starkosuser> ");

  while (1) {
    char c = keyboard_getchar();

    if (c)
        print_char(c);
  }
}
