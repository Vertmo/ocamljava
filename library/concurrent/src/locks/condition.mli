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

(** Lock-base condition. *)


type t
(** The type of conditions, constructed from [Lock] values.

    Operations on conditions should be called only when the lock the
    condition was constructed from is held by the current thread. *)

external await : t -> unit =
  "ocamljava_condition_await"
(** Waits until either the condition is signal, or the current thread is
    interrupted.

    Raises [Invalid_argument] if the current thread does not hold the
    associated lock.

    Raises [Runtime.Interrupted] if the thread is interrupted. *)

external await_time : t -> int64 -> TimeUnit.t -> bool =
  "ocamljava_condition_await_time"
(** [await_time c t u] is similar to [await c], except that the current
    thread will at most wait for [t] (time value whose unit is [u]).
    Returns whether the condition was signaled.

    Raises [Invalid_argument] if the current thread does not hold the
    associated lock.

    Raises [Runtime.Interrupted] if the thread is interrupted. *)

external await_nanos : t -> int64 -> int64 =
  "ocamljava_condition_await_nanos"
(** [await_nanos c n] is similar to [await c], except that the current
    thread will at most wait for [n] nanoseconds. Returns the duration of
    the wait, a negative value if the condition was not signaled.

    Raises [Invalid_argument] if the current thread does not hold the
    associated lock.

    Raises [Runtime.Interrupted] if the thread is interrupted. *)

external await_uninterruptibly : t -> unit =
  "ocamljava_condition_await_uninterruptibly"
(** Similar to [await] except that the thread cannot be interrupted.

    Raises [Invalid_argument] if the current thread does not hold the
    associated lock. *)

external signal : t -> unit =
  "ocamljava_condition_signal"
(** Signals the condition, unblocking one waiting thread.

    Raises [Invalid_argument] if the current thread does not hold the
    associated lock. *)

external signal_all : t -> unit =
  "ocamljava_condition_signal_all"
(** Signals the condition, unblocking all waiting threads.

    Raises [Invalid_argument] if the current thread does not hold the
    associated lock. *)
