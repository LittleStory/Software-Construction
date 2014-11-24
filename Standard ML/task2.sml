fun fib n =
  let
    fun sec (prev, next, cur) =
      if cur = 1 then prev
      else if cur = 2 then next
      else sec (next, prev + next, cur - 1)
  in
    sec (1, 1, n)
  end;