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

(** Atomic containers for arrays of values. *)


type 'a t = java'util'concurrent'atomic'AtomicReferenceArray java_instance
(** The type of atomic containers for arrays values.

    {b WARNING:} physical comparison is used by the container.

    {b CONSEQUENCE 1:} should be used with caution to store [int32],
    [int64], [nativeint], or [double] values as they are wrapped into
    blocks. Hence, comparisons are done on block addresses rather than
    on wrapped values.

    {b CONSEQUENCE 2:} as OCaml-Java uses boxed values for [int] values,
    the container should not be used to store [int] values.

    Any other type can be safely stored (caching of {i some} [int] values
    ensure that sum types are correctly handled). *)

type index = int32
(** The type of array indices. *)

val make : int32 -> 'a -> 'a t
(** Returns a new container holding an array of passed length.

    @raise Java_error if passed length is negative *)

val compare_and_set : 'a t -> index -> 'a -> 'a -> bool
(** [compare_and_set a i e u] atomically sets the value of [a] at index
    [i] to [u] if the current value is [e]. Returns whether the value of
    [a] at index [i] was equal to [e].

    @raise Java_error if passed index is invalid *)

val get : 'a t -> index -> 'a
(** Returns the value at passed index.

    @raise Java_error if passed index is invalid *)

val get_and_set : 'a t -> index -> 'a -> 'a
(** [get_and_set a i x] atomically sets the value of [a] at index [i] to
    [x], and returns the previous value.

    @raise Java_error if passed index is invalid *)

val lazy_set : 'a t -> index -> 'a -> unit
(** [lazy_set a i x] eventually sets the value of [a] at index [i] to
    [x].

    @raise Java_error if passed index is invalid *)

val length : 'a t -> int32
(** Returns the length of the array. *)

val set : 'a t -> index -> 'a -> unit
(** [set a i x] sets the value of [a] at index [i] to [x].

    @raise Java_error if passed index is invalid *)

val weak_compare_and_set : 'a t -> index -> 'a -> 'a -> bool
(** Similar to {!compare_and_set}, with a {i weak} semantics: may be
    faster on some platforms, but does not provide ordering guarantees.

    @raise Java_error if passed index is invalid *)


(** {6 Null value} *)

val null : 'a t
(** The [null] value. *)

external is_null : 'a t -> bool =
  "java is_null"
(** [is_null obj] returns [true] iff [obj] is equal to [null]. *)

external is_not_null : 'a t -> bool =
  "java is_not_null"
(** [is_not_null obj] returns [false] iff [obj] is equal to [null]. *)


(** {6 Miscellaneous} *)

val wrap : 'a t -> 'a t option
(** [wrap obj] wraps the reference [obj] into an option type:
    - [Some x] if [obj] is not [null];
    - [None] if [obj] is [null]. *)

val unwrap : 'a t option -> 'a t
(** [unwrap obj] unwraps the option [obj] into a bare reference:
    - [Some x] is mapped to [x];
    - [None] is mapped to [null]. *)
