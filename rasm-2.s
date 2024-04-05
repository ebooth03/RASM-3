  .global  _start

  .data
qA:  .quad 0



  .text

_start:

exit_sequence:
  mov  x0,#0
  mov  x8,#93
  svc  0

.end
