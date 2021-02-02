#!/bin/bash
#
# delete.sh delete-todo <todo-id>
# delete.sh delete-done
#
# Usage:
#    delete.sh delete-todo 99
#    delete.sh delete-done
#

delete_todo(){
psql -v ON_ERROR_STOP=1 <<EOF
DELETE FROM todo
WHERE id=$1
EOF
echo "Todo removed"
echo $?
}

delete_done(){
psql -v ON_ERROR_STOP=1 <<EOF
DELETE FROM todo
WHERE done=true
EOF
echo "Done todos are removed"
echo $?
}

main(){
if [[ "$1" == "delete-todo" ]]
then
delete_todo $2
elif [[ "$1" == "delete-done" ]]
then
delete_done
fi
}


if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
    main "$@"
fi

