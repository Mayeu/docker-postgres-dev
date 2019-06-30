#! /bin/sh

if test -z "${DONT_EAT_MY_DATA}";
then
  postgres
else
  eatmydata postgres
fi

