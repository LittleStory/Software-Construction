fun y (_, _, 0) = 4.0         (* при N=0 - результат y0 *)
|   y (x, e, N) =             (* иначе определим две дополнительные функции *)
      let
        fun closeEnough a b = abs (a - b) < e
        (* функция yNext - функция вычисления i-го элемента
         * последовательности
         * yPred и yPrePred - i-1-й i-2-й элементы последовательности
         * соответственно *)
        fun yNext yCur i =
            let
              val yPred = yCur
              (* вычисляется yCur - i-й элемент последовательности *)
              val yCur = (x - yPred * yPred * yPred) / 60.0
            in
              if closeEnough yCur yPred then yCur
              (* если i достигло значения N то вернуть yCur как результат
               * в противном случае запускается вычисление i+1-го элемента *)
              else if i >= N then yCur
              else yNext yCur (i + 1)
            end
      in
        (* запуск вычисления 2-го элемента последовательности *)
        yNext (y (x, e, 0)) 1
      end;