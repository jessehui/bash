/* dcngettext.c - Implementation of the dcngettext(3) function. */

/* Copyright (C) 1995-1999, 2000, 2001, 2002, 2006-2009 Free Software Foundation, Inc.

   This file is part of GNU Bash.

   Bash is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   Bash is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with Bash.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifdef HAVE_CONFIG_H
# include <config.h>
#endif

#include "gettextP.h"
#ifdef _LIBC
# include <libintl.h>
#else
# include "libgnuintl.h"
#endif

/* @@ end of prolog @@ */

/* Names for the libintl functions are a problem.  They must not clash
   with existing names and they should follow ANSI C.  But this source
   code is also used in GNU C Library where the names have a __
   prefix.  So we have to make a difference here.  */
#ifdef _LIBC
# define DCNGETTEXT __dcngettext
# define DCIGETTEXT __dcigettext
#else
# define DCNGETTEXT libintl_dcngettext
# define DCIGETTEXT libintl_dcigettext
#endif

/* Look up MSGID in the DOMAINNAME message catalog for the current CATEGORY
   locale.  */
char *
DCNGETTEXT (domainname, msgid1, msgid2, n, category)
const char *domainname;
const char *msgid1;
const char *msgid2;
unsigned long int n;
int category;
{
    return DCIGETTEXT (domainname, msgid1, msgid2, 1, n, category);
}

#ifdef _LIBC
/* Alias for function name in GNU C Library.  */
weak_alias (__dcngettext, dcngettext);
#endif
