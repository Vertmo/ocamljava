(*
 * This file is part of OCaml-Java compiler.
 * Copyright (C) 2007-2015 Xavier Clerc.
 *
 * OCaml-Java compiler is free software; you can redistribute it and/or modify
 * it under the terms of the Q Public License as published by
 * Trolltech (with a change to choice of law).
 *
 * OCaml-Java compiler is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * Q Public License for more details.
 *
 * You should have received a copy of the Q Public License
 * along with this program.  If not, see
 * <http://opensource.org/licenses/QPL-1.0>.
 *)

val make_servlet_class : unit -> string * BaristaLibrary.Bytes.t
(** Compiles the class responsible for initialization, returning class
    name and contents of class file. *)

val make_servlet_aux_class : string -> string * BaristaLibrary.Bytes.t
(** Compiles the auxiliary for package whose name is passed (redirecting
    to the class responsible for initialization), returning class name
    and contents of class file. *)
