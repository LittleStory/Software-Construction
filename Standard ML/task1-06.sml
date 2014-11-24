(* тип выражения: real * real * real *)
val x = 10;

let
  val A  = real x + 3.0
  val B  = real x + 9.0
  val C  = real x + 5.0
  val rB = B - 1.0
in
  (A * C / B, A * B / rB, rB * C / (C + 2.0))
end;


fun f x =
  let
    val A  = real x + 3.0
    val B  = real x + 9.0
    val C  = real x + 5.0
    val rB = B - 1.0
  in
    (A * C / B, A * B / rB, rB * C / (C + 2.0))
  end;
