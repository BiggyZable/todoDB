#!/bin/bash
#
# add.sh add-user <user>
# add.sh add-todo <user> <todo>
#
# Usage:
#    add.sh add-user John
#    add.sh add-user Paul
#    add.sh add-todo John Meeting
#    add.sh add-todo Paul "Make breakfast"
#

add_user() {
    user=$1
    psql <<EOF
INSERT INTO "user" (name) VALUES ('$user')
EOF
echo "User added"
}

add_todo() {
    user=$1
    todo=$2
    psql <<EOF
INSERT INTO todo (task, user_id) VALUES ('$todo', (SELECT id FROM "user" WHERE name='$user'))
EOF
echo "Todo added"
}

main() {
    if [[ "$1" == "add-user" ]]
    then
        add_user "$2"
    elif [[ "$1" == "add-todo" ]]
    then
        add_todo "$2" "$3"
    fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
    main "$@"
fi
