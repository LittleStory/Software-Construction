insum(_, N, N, R, R) :- !.
insum(CUR, N, I, R, RESIN) :- INC is I + 1
                            , SUMU is CUR / log(I)
                            , RESOUT is RESIN + SUMU
                            , insum(CUR, N, INC, R, RESOUT).

outsum(N, N, R, R) :- !.
outsum(N, I, R, RES) :- COSIN is cos(I)
                      , insum(COSIN, N, 2, RR, 0)
                      , INC is I + 1
                      , RESOUT is RES + RR
                      , outsum(N, INC, R, RESOUT).

y(N) :- NIN is N + 1
      , outsum(NIN, 1, R, 0)
      , write(R).