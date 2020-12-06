syn match pythonOperator "\(+\|=\|-\|\^\|\*\)"
syn match pythonDelimiter "\(,\|\.\|:\)"
syn keyword pythonSpecialWord self
syn keyword pythonSpecialMethod __init__ __add__ __metaclass__ __slots__ __init__
syn keyword pythonSpecialMethod __abs__ __add__ __and__ __ror__ __rshift__ __concat__
syn keyword pythonSpecialMethod __or__ __lt__ __le__ __eq__ __ne__ __ge__
syn keyword pythonSpecialMethod __gt__ __nonzero__ __len__ __floordiv__

hi link pythonSpecialMethod  Structure
hi link pythonSpecialWord    Special
hi link pythonDelimiter      Delimiter
