#!/bin/bash
. list.sh
. add.sh
. mark.sh
. delete.sh


if [[ "$1" == "list-users" ]]
then
    list_users
elif [[ "$1" == "list-todos" ]]
then
    list_todos
elif [[ "$1" == "list-user-todos" ]]
then
   list_user_todos "$2"
elif [[ "$1" == "add-user" ]]
then
   add_user "$2"
elif [[ "$1" == "add-todo" ]]
then
   add_todo "$2" "$3"
elif [[ "$1" == "mark-todo" ]]
then
   mark_todo "$2"
elif [[ "$1" == "unmark-todo" ]]
then
   unmark_todo "$2"
elif [[ "$1" == "delete-todo" ]]
then
   delete_todo "$2"
elif [[ "$1" == "delete-done" ]]
then
   delete_done
fi
