#include <stdlib.h>
#include <windows.h>
int main(int argc, char *argv[])
{
  int sleepTime;
  if (argc < 2) return 0;
  sleepTime = strtol(argv[1], NULL, 10);
  if (sleepTime > 0) Sleep(sleepTime);
  return 0;
}
