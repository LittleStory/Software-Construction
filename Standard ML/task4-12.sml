load "Math";

fun y N =
  let
    val rN = real N

    fun iter (i, j, sum, mul) =
      if i > rN then sum
      else if j <= rN then 
        iter (i, j + 1.0, sum, mul * (Math.ln i / Math.ln j))
      else 
        iter (i + 1.0, 2.0, sum + mul, 1.0);
  in
    iter (1.0, 2.0, 0.0, 1.0)
  end;