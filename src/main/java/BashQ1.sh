#!/usr/bin/env bash
add_undone(){
  if [ ! -e un_done.txt ]; then
      touch un_done.txt
  fi
  echo "Please enter a task you want add to undone list :"
  read undoneTask

  if grep -Fxq "$undoneTask" un_done.txt
  then

      echo " this task exist"
  else
      echo $undoneTask >>un_done.txt
      echo "task added"
  fi
}

#add_all_undone(){
#  if [ ! -e un_done.txt ]; then
#      touch un_done.txt
#  fi
#  if [ ! -e done.txt ]; then
#        touch done.txt
#    fi
#
#  cp  un_done.txt done.txt
#  > un_done.txt
#}

#add_undone
print_undone(){
  cat un_done.txt
}

print_done(){
  cat done.txt
}
print_delete_task(){
  cat delete_task.txt
}

add_done(){
  if [ ! -e done.txt ]; then
      touch done.txt
  fi
  echo "Please enter a done task you want add to done list :"
  read doneTask
  if grep -Fxq "$doneTask" un_done.txt
  then
#doo
    echo "$doneTask" >>done.txt
    sed -i "/$doneTask/d" un_done.txt
  else
      echo "task dose-nt exist in un done list"
  fi
}

delete_task(){
  if [ ! -e delete_task.txt ]; then
      touch delete_task.txt
  fi
  echo "Please enter a  task you want delete it :"
  read deleteTask
  if grep -Fxq "$deleteTask" un_done.txt
  then
    echo "$deleteTask" >> delete_task.txt
    sed -i "/$deleteTask/d" un_done.txt
  else
      echo "task dosent exist in un done list"
  fi
}

serch(){
  grep -r "fgg" un_done.txt
  grep -r "fgg" done.txt
  grep -r "fgg" delete_task.txt
}
function search_tasks() {
    read -p "Enter a task to search for: " task
    echo "Results for '$task':"
    grep -i "$task" "$1"
}

 search_done() {
    search_tasks done.txt
}

search_todo() {
    search_tasks un_done.txt
}

search_deleted() {
    search_tasks delete_task.txt
}

while true; do
    add_undone
    print_undone
    add_done
    print_done
    delete_task
    print_delete_task
    search_done
    search_todo
    search_deleted
done

