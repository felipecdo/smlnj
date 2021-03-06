(* t019.sml *)
(* have to turn off matchRedundantError flag for these two functions *)
(* Inexhaustive, with unused rules: *)

Control.MC.matchRedundantError := false;

fun check' f = (if f () then "OK" else "WRONG") handle _ => "EXN";

fun checkres1 f argres = 
    check'(fn _ => List.all (fn (arg, res) => f arg = res) argres)

fun checkres2 f argres = 
    check'(fn _ => List.all (fn (arg1, arg2, res) => f arg1 arg2 = res) argres)
;

fun f2 ([], [])       = 111 
  | f2 (x::xr, y::yr) = 222
  | f2 ([], [])       = 333;

fun f2c []      []      = 111 
  | f2c (x::xr) (y::yr) = 222
  | f2c []      []      = 333;

val test3a = checkres1 f2 [(([], []), 111), (([7], [8]), 222)];
val test3b = (f2 ([], [1]); "WRONG") handle Match => "OK" | _ => "WRONG";
val test3c = (f2 ([2], []); "WRONG") handle Match => "OK" | _ => "WRONG";

val test4a = checkres2 f2c [([], [], 111), ([7], [8], 222)];
val test4b = (f2c [] [1]; "WRONG") handle Match => "OK" | _ => "WRONG";
val test4c = (f2c [2] []; "WRONG") handle Match => "OK" | _ => "WRONG";
