#!/bin/sh
# Test basic functionality

set -e

proram=$0
TMPDIR=${TMPDIR:-/tmp}
TMPBASE=$TMPDIR/tmp.$$
CURDIR=.

case "$0" in
  */*)
        CURDIR=${0%/*}
        ;;
esac

AtExit ()
{
    rm -f "$TMPBASE"*
}

Run ()
{
    echo "$*"
    shift
    eval "$@"
}

trap AtExit 0 1 2 3 15

# #######################################################################

file="$TMPBASE"
dir="$(cd $CURDIR ; echo $(pwd))"

Run "%% TEST MS office:" "rtf2html '$dir/example-msoffice2010.rtf' > $file"
cat "$file"

Run "%% TEST LibreOffice:" "rtf2html '$dir/example-libreoffice-3.6.0.4.rtf' > $file"
cat "$file"

# End of file
