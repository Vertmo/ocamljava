(*
 * This file is part of OCaml-Java library.
 * Copyright (C) 2007-2015 Xavier Clerc.
 *
 * OCaml-Java library is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * OCaml-Java library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *)


(* Instance creation *)

type t = java'util'Date java_instance

let now () =
  Java.make "java.util.Date()" ()

let make ms =
  Java.make "java.util.Date(long)" ms


(* Properties *)

let get_time date =
  Java.call "java.util.Date.getTime()" date

let after date when_ =
  Java.call "java.util.Date.after(java.util.Date)" date when_

let before date when_ =
  Java.call "java.util.Date.before(java.util.Date)" date when_

let compare_to date1 date2 =
  Java.call "java.util.Date.compareTo(java.util.Date)" date1 date2
  |> Int32.to_int


(* Null value *)

external null : unit -> 'a java_instance =
  "java null"

let null = null ()

external is_null : 'a java_instance -> bool =
  "java is_null"

external is_not_null : 'a java_instance -> bool =
  "java is_not_null"


(* Miscellaneous *)

let wrap x =
  if is_null x then
    None
  else
    Some x

let unwrap = function
  | Some x -> x
  | None   -> null
