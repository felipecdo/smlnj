(* 294.sml *)
(* include <sigexp> *)

signature S1 =
sig
  datatype s = C
  type t
end;

signature S2 =
sig
  type s
  include S1 where type t = s
end;
