#!/bin/bash
#
# list.sh list-users
# list.sh list-todos
# list.sh list-user-todos
#
# Usage:
#    list.sh list-users
#    list.sh list-todos Paul
#    list.sh list-user-todos John
#    list.sh list-user-todos "John Doe"
#

list_users() {
    psql <<EOF
SELECT * FROM "user"
EOF
}

list_todos() {
    psql <<EOF
SELECT * FROM todo
EOF
}

list_user_todos() {
    psql <<EOF
SELECT * FROM todo
JOIN "user" ON "user".id=todo.user_id
WHERE name='$1'
EOF
    echo "User: $1"
}

main() {
    if [[ "$1" == "list-users" ]]
    then
	list_users
    elif [[ "$1" == "list-todos" ]]
    then
        list_todos
    elif [[ "$1" == "list-user-todos" ]]
    then
        list_user_todos "$2"
    fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
    main "$@"
fi
