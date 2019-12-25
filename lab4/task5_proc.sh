#!/bin/bash
#!/bin/bash
result=1
numreg="''|*[!0-9]*"
op="+"
tail -n 0 -f buf5.txt | while true; do
  read line
  if [[ $line == ?(-)+([0-9]) ]]; then
    cond="num"
  else
    cond=$line
  fi
  case $cond in
    "+")
      op="+"
      ;;
    "multi")
      op="*"
      ;;
    "num")
      if [ "$op" == "+" ]; then
        let result=$result+$line
      else
        let result=$result*$line
      fi
      echo "$op $line = $result"
      ;;
    "quit")
      echo "result=$result"
      exit
      ;;
    *)
      echo "input error"
      kill -USR1 $(cat .pid)
      exit
      ;;
  esac
done
