#!/bin/bash
#Первое условие: если день недели суббота или воскресенье
if [ $(date +%a) = "Sat" ] || [ $(date +%a) = "Sun" ]; then
  #Второе условие: входит ли пользователь в группу admin
  if getent group admin | grep -qw "$PAM_USER"; then
    #Если пользователь входит в группу admin, то он может подключиться
    echo "you may login"
    exit 0
  else
    #Иначе ошибка (не сможет подключиться)
    echo "you cannot login now"
    exit 1
  fi
#Если день не выходной, то подключиться может любой пользователь
else
  echo "regular day, you may login"
  exit 0
fi
