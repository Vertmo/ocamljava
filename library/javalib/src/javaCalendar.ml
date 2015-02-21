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

(** Utility functions for Java calendars. *)


(* Instance creation *)

type t = java'util'Calendar java_instance

let now ?(locale = JavaLocale.null) ?(zone = JavaTimeZone.null) () =
  if JavaLocale.is_null locale then begin
    if JavaTimeZone.is_null zone then
      Java.call "java.util.Calendar.getInstance()" ()
    else
      Java.call "java.util.Calendar.getInstance(java.util.TimeZone)" zone
  end else begin
    if JavaTimeZone.is_null zone then
      Java.call "java.util.Calendar.getInstance(java.util.Locale)" locale
    else
      Java.call "java.util.Calendar.getInstance(java.util.TimeZone,java.util.Locale)"
        zone locale
  end


(* Fields *)

type am_pm =
  | AM
  | PM

let java_int_of_am_pm = function
  | AM -> Java.get "java.util.Calendar.AM" ()
  | PM -> Java.get "java.util.Calendar.PM" ()

let am_pm_of_java_int = function
  | 0l -> AM
  | 1l -> PM
  | _  -> invalid_arg "JavaCalendar.am_pm_of_java_int"

type month =
  | January
  | February
  | March
  | April
  | May
  | June
  | July
  | August
  | September
  | October
  | November
  | December
  | Undecimber

let java_int_of_month = function
  | January    -> Java.get "java.util.Calendar.JANUARY"    ()
  | February   -> Java.get "java.util.Calendar.FEBRUARY"   ()
  | March      -> Java.get "java.util.Calendar.MARCH"      ()
  | April      -> Java.get "java.util.Calendar.APRIL"      ()
  | May        -> Java.get "java.util.Calendar.MAY"        ()
  | June       -> Java.get "java.util.Calendar.JUNE"       ()
  | July       -> Java.get "java.util.Calendar.JULY"       ()
  | August     -> Java.get "java.util.Calendar.AUGUST"     ()
  | September  -> Java.get "java.util.Calendar.SEPTEMBER"  ()
  | October    -> Java.get "java.util.Calendar.OCTOBER"    ()
  | November   -> Java.get "java.util.Calendar.NOVEMBER"   ()
  | December   -> Java.get "java.util.Calendar.DECEMBER"   ()
  | Undecimber -> Java.get "java.util.Calendar.UNDECIMBER" ()

let month_of_java_int = function
  | 0l  -> January
  | 1l  -> February
  | 2l  -> March
  | 3l  -> April
  | 4l  -> May
  | 5l  -> June
  | 6l  -> July
  | 7l  -> August
  | 8l  -> September
  | 9l  -> October
  | 10l -> November
  | 11l -> December
  | 12l -> Undecimber
  | _  -> invalid_arg "JavaCalendar.month_of_java_int"

type day =
  | Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday
  | Sunday

let java_int_of_day = function
  | Monday    -> Java.get "java.util.Calendar.MONDAY"    ()
  | Tuesday   -> Java.get "java.util.Calendar.TUESDAY"   ()
  | Wednesday -> Java.get "java.util.Calendar.WEDNESDAY" ()
  | Thursday  -> Java.get "java.util.Calendar.THURSDAY"  ()
  | Friday    -> Java.get "java.util.Calendar.FRIDAY"    ()
  | Saturday  -> Java.get "java.util.Calendar.SATURDAY"  ()
  | Sunday    -> Java.get "java.util.Calendar.SUNDAY"    ()

let day_of_java_int = function
  | 1l -> Sunday
  | 2l -> Monday
  | 3l -> Tuesday
  | 4l -> Wednesday
  | 5l -> Thursday
  | 6l -> Friday
  | 7l -> Saturday
  | _  -> invalid_arg "JavaCalendar.day_of_java_int"

type _ field =
  | Era                  : java_int field
  | Year                 : java_int field
  | Month                : month    field
  | Week_of_month        : java_int field
  | Week_of_year         : java_int field
  | Date                 : java_int field
  | Day_of_month         : java_int field
  | Day_of_week          : day      field
  | Day_of_week_in_month : java_int field
  | Day_of_year          : java_int field
  | AM_PM                : am_pm    field
  | Hour                 : java_int field
  | Hour_of_day          : java_int field
  | Minute               : java_int field
  | Second               : java_int field
  | Millisecond          : java_int field
  | Dst_offset           : java_int field
  | Zone_offset          : java_int field

let java_int_of_field : type a . a field -> java_int = function
  | Era                  -> Java.get "java.util.Calendar.ERA"                  ()
  | Year                 -> Java.get "java.util.Calendar.YEAR"                 ()
  | Month                -> Java.get "java.util.Calendar.MONTH"                ()
  | Week_of_month        -> Java.get "java.util.Calendar.WEEK_OF_MONTH"        ()
  | Week_of_year         -> Java.get "java.util.Calendar.WEEK_OF_YEAR"         ()
  | Date                 -> Java.get "java.util.Calendar.DATE"                 ()
  | Day_of_month         -> Java.get "java.util.Calendar.DAY_OF_MONTH"         ()
  | Day_of_week          -> Java.get "java.util.Calendar.DAY_OF_WEEK"          ()
  | Day_of_week_in_month -> Java.get "java.util.Calendar.DAY_OF_WEEK_IN_MONTH" ()
  | Day_of_year          -> Java.get "java.util.Calendar.DAY_OF_YEAR"          ()
  | AM_PM                -> Java.get "java.util.Calendar.AM_PM"                ()
  | Hour                 -> Java.get "java.util.Calendar.HOUR"                 ()
  | Hour_of_day          -> Java.get "java.util.Calendar.HOUR_OF_DAY"          ()
  | Minute               -> Java.get "java.util.Calendar.MINUTE"               ()
  | Second               -> Java.get "java.util.Calendar.SECOND"               ()
  | Millisecond          -> Java.get "java.util.Calendar.MILLISECOND"          ()
  | Dst_offset           -> Java.get "java.util.Calendar.DST_OFFSET"           ()
  | Zone_offset          -> Java.get "java.util.Calendar.ZONE_OFFSET"          ()


(* Properties *)

let get_time cal =
  Java.call "java.util.Calendar.getTimeInMillis()" cal

let after cal when_ =
  Java.call "java.util.Calendar.after(Object)" cal when_

let before cal when_ =
  Java.call "java.util.Calendar.before(Object)" cal when_

let compare_to cal1 cal2 =
  Java.call "java.util.Calendar.compareTo(java.util.Calendar)" cal1 cal2
  |> Int32.to_int

let get : type a . t -> a field -> a = fun cal f ->
  let f' = java_int_of_field f in
  match f with
  | Era                  -> (Java.call "java.util.Calendar.get(int)" cal f' : java_int :> a)
  | Year                 -> (Java.call "java.util.Calendar.get(int)" cal f' : java_int :> a)
  | Month                -> (Java.call "java.util.Calendar.get(int)" cal f' |> month_of_java_int)
  | Week_of_month        -> (Java.call "java.util.Calendar.get(int)" cal f' : java_int :> a)
  | Week_of_year         -> (Java.call "java.util.Calendar.get(int)" cal f' : java_int :> a)
  | Date                 -> (Java.call "java.util.Calendar.get(int)" cal f' : java_int :> a)
  | Day_of_month         -> (Java.call "java.util.Calendar.get(int)" cal f' : java_int :> a)
  | Day_of_week          -> (Java.call "java.util.Calendar.get(int)" cal f' |> day_of_java_int)
  | Day_of_week_in_month -> (Java.call "java.util.Calendar.get(int)" cal f' : java_int :> a)
  | Day_of_year          -> (Java.call "java.util.Calendar.get(int)" cal f' : java_int :> a)
  | AM_PM                -> (Java.call "java.util.Calendar.get(int)" cal f' |> am_pm_of_java_int)
  | Hour                 -> (Java.call "java.util.Calendar.get(int)" cal f' : java_int :> a)
  | Hour_of_day          -> (Java.call "java.util.Calendar.get(int)" cal f' : java_int :> a)
  | Minute               -> (Java.call "java.util.Calendar.get(int)" cal f' : java_int :> a)
  | Second               -> (Java.call "java.util.Calendar.get(int)" cal f' : java_int :> a)
  | Millisecond          -> (Java.call "java.util.Calendar.get(int)" cal f' : java_int :> a)
  | Dst_offset           -> (Java.call "java.util.Calendar.get(int)" cal f' : java_int :> a)
  | Zone_offset          -> (Java.call "java.util.Calendar.get(int)" cal f' : java_int :> a)

let get_time_zone cal =
  Java.call "java.util.Calendar.getTimeZone()" cal


(* Creation of new calendar values *)

let copy cal =
  Java.call "java.util.Calendar.clone()" cal
  |> Java.cast "java.util.Calendar"

let add : type a . t -> a field -> java_int -> t = fun cal f delta ->
  let cal = copy cal in
  let f' = java_int_of_field f in
  match f with
  | Era                  -> Java.chain "java.util.Calendar.add(int,int)" cal f' delta
  | Year                 -> Java.chain "java.util.Calendar.add(int,int)" cal f' delta
  | Month                -> Java.chain "java.util.Calendar.add(int,int)" cal f' delta
  | Week_of_month        -> Java.chain "java.util.Calendar.add(int,int)" cal f' delta
  | Week_of_year         -> Java.chain "java.util.Calendar.add(int,int)" cal f' delta
  | Date                 -> Java.chain "java.util.Calendar.add(int,int)" cal f' delta
  | Day_of_month         -> Java.chain "java.util.Calendar.add(int,int)" cal f' delta
  | Day_of_week          -> Java.chain "java.util.Calendar.add(int,int)" cal f' delta
  | Day_of_week_in_month -> Java.chain "java.util.Calendar.add(int,int)" cal f' delta
  | Day_of_year          -> Java.chain "java.util.Calendar.add(int,int)" cal f' delta
  | AM_PM                -> Java.chain "java.util.Calendar.add(int,int)" cal f' delta
  | Hour                 -> Java.chain "java.util.Calendar.add(int,int)" cal f' delta
  | Hour_of_day          -> Java.chain "java.util.Calendar.add(int,int)" cal f' delta
  | Minute               -> Java.chain "java.util.Calendar.add(int,int)" cal f' delta
  | Second               -> Java.chain "java.util.Calendar.add(int,int)" cal f' delta
  | Millisecond          -> Java.chain "java.util.Calendar.add(int,int)" cal f' delta
  | Dst_offset           -> Java.chain "java.util.Calendar.add(int,int)" cal f' delta
  | Zone_offset          -> Java.chain "java.util.Calendar.add(int,int)" cal f' delta

let set : type a . t -> a field -> a -> t = fun cal f v ->
  let cal = copy cal in
  let f' = java_int_of_field f in
  match f with
  | Era                  -> Java.chain "java.util.Calendar.set(int,int)" cal f' (v : a :> java_int)
  | Year                 -> Java.chain "java.util.Calendar.set(int,int)" cal f' (v : a :> java_int)
  | Month                -> Java.chain "java.util.Calendar.set(int,int)" cal f' (java_int_of_month v)
  | Week_of_month        -> Java.chain "java.util.Calendar.set(int,int)" cal f' (v : a :> java_int)
  | Week_of_year         -> Java.chain "java.util.Calendar.set(int,int)" cal f' (v : a :> java_int)
  | Date                 -> Java.chain "java.util.Calendar.set(int,int)" cal f' (v : a :> java_int)
  | Day_of_month         -> Java.chain "java.util.Calendar.set(int,int)" cal f' (v : a :> java_int)
  | Day_of_week          -> Java.chain "java.util.Calendar.set(int,int)" cal f' (java_int_of_day v)
  | Day_of_week_in_month -> Java.chain "java.util.Calendar.set(int,int)" cal f' (v : a :> java_int)
  | Day_of_year          -> Java.chain "java.util.Calendar.set(int,int)" cal f' (v : a :> java_int)
  | AM_PM                -> Java.chain "java.util.Calendar.set(int,int)" cal f' (java_int_of_am_pm v)
  | Hour                 -> Java.chain "java.util.Calendar.set(int,int)" cal f' (v : a :> java_int)
  | Hour_of_day          -> Java.chain "java.util.Calendar.set(int,int)" cal f' (v : a :> java_int)
  | Minute               -> Java.chain "java.util.Calendar.set(int,int)" cal f' (v : a :> java_int)
  | Second               -> Java.chain "java.util.Calendar.set(int,int)" cal f' (v : a :> java_int)
  | Millisecond          -> Java.chain "java.util.Calendar.set(int,int)" cal f' (v : a :> java_int)
  | Dst_offset           -> Java.chain "java.util.Calendar.set(int,int)" cal f' (v : a :> java_int)
  | Zone_offset          -> Java.chain "java.util.Calendar.set(int,int)" cal f' (v : a :> java_int)

let clear cal f =
  copy cal
  |> Java.chain "java.util.Calendar.clear(int)" |. (java_int_of_field f)

let clear_all cal =
  copy cal
  |> Java.chain "java.util.Calendar.clear()"

let set_time_zone cal tz =
  copy cal
  |> Java.chain "java.util.Calendar.setTimeZone(java.util.TimeZone)" |. tz


(* Conversions *)

let to_date cal =
  Java.call "java.util.Calendar.getTime()" cal

let of_date date =
  now ()
  |> Java.chain "java.util.Calendar.setTime(java.util.Date)" |. date


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
