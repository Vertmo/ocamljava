#!/bin/sh

#
# This file is part of OCaml-Java build.
# Copyright (C) 2007-2015 Xavier Clerc.
#
# OCaml-Java build is free software; you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# OCaml-Java build is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#


# deletes the configuration file, if any
if [ -f Makefile.config ]; then
  rm -f Makefile.config
fi

# deletes the build directory, if any
if [ -d _build ]; then
  rm -fr _build
fi
