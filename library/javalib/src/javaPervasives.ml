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


(* external (|.) : ('a -> 'b) -> 'a -> 'b = "%apply"
 * 
 * external (!@) : string -> _'String java_instance =
 *   "ocamljava_javastring_of_string"
 * 
 * let (^^^) str1 str2 =
 *   Java.make "StringBuilder()" ()
 *   |> Java.call "StringBuilder.append(String):StringBuilder" |. str1
 *   |> Java.call "StringBuilder.append(String):StringBuilder" |. str2
 *   |> Java.call "StringBuilder.toString()" *)
