::  test file
/+  library
=>
|_  [abc=def ghi=jkl]
+|  chapter-1
+$  mold
  $%  [%foo foo=@]
      [%bar bar=(list @ud)]
  ==
+*  this  .
++  $  &
++  arm
  |=  a=@
  a
++  brm
  |=  b=^
  'br\0am\' co\\rd'
++  c-arm
  |=  c=*
  <c>
++  d-arm
  |_  d=*
  ++  $  (c-arm d)
  --
++  e-arm
  "\20 tape \" {(arm 123)} ta\\pe \20"
++  f-arm
  :-  '''
      test \0a
      '''
  """
  test {<(arm 123)>} \0a
  """
++  g-arm
  [%$ %123 %item-g %'item-cool' %'½–½']
++  h-arm
  :~  0  0b0  0x0  0v0  0w0
      123         1.234
      0b1010      0b1.0101
      0x12fe      0x1.2fef
      0v2j.57mhi  0w2.cYmE4
      .1.0  .~1.0  .~~1.0  .~~~1.0
      ~zod  ~2021.2.18
  ==
++  i-arm
  ['a' e-arm 'c']
++  nock-arm
  =/  q  [7 [1 7 1 [0 2] [[1 1] 0 1] 0 7] [0 2] [[1 1] 0 1] 0 7]
  =(q .*(999 q))
++  z-arm
  !!
--
arm
