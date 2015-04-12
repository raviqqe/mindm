#include "pam.h"

int
main(int argc, char **argv) {
  login(argv[1], argv[2], 0);

  return 0;
}
