#!/usr/bin/env bash
# Cha Cha Slide replaced with a very small shell script

notes=("🎵" "🎶" "♫" "♬" "♩")
jumps=("🤸" "🏃" "🤾" "⛷")
freezes=("❄" "⛄" "🧊")

cha_cha_time () {
  for i in {1..4}; do
    for j in {1..3}; do
      echo -n "${notes[$RANDOM % ${#notes[@]}]}"
    done
    sleep 0.5
  done
}

cha_cha_again () {
  for i in {1..2}; do
    for j in "now y'all" "again"; do
      echo -n "Cha cha $j "
      cha_cha_time
      echo
    done
  done
}

cha_cha_reset () {
  turn_it=""
  hops_this_time=1
  hop_phrase="this time"
  stomp_string="let's stomp"
  end_phrase="Cha cha real smooth"

  basic_step=false
  cha_cha_time=false
  cha_cha_again=false
  charlie_brown=false
  criss_cross=false
  freeze=false
  funky_time=false
  hands_on_knees=false
  repeat_hops=false
  reverse=false
  slide=false
  stomp_again=false
  work_time=false
}

cha_cha_options () {
  while [ $# -gt 0 ]; do
    case $1 in
    -b | --basic-step)      basic_step=true           ;;
    -u | --funky-time)      funky_time=true           ;;
    -w | --work-time)       work_time=true            ;;
    -t | --turn-it)         turn_it=$2;         shift ;;
    -h | --hops)            hops_this_time=$2;  shift ;;
    -p | --hop-phrase)      hop_phrase=$2;      shift ;;
    -r | --repeat-hops)     repeat_hops=true          ;;
    -s | --stomp-string)    stomp_string=$2;    shift ;;
    -a | --stomp-again)     stomp_again=true          ;;
    -v | --reverse)         reverse=true              ;;
    -n | --charlie-brown)   charlie_brown=true        ;;
    -l | --slide)           slide=true                ;;
    -c | --criss-cross)     criss_cross=true          ;;
    -f | --freeze)          freeze=true               ;;
    -k | --hands-on-knees)  hands_on_knees=true       ;;
    -e | --end-phrase)      end_phrase=$2;      shift ;;
    -m | --cha-cha-time)    cha_cha_time=true         ;;
    -g | --cha-cha-again)   cha_cha_again=true        ;;
    esac
    shift
  done
}

clap_your_hands () {
  for i in {1..8}; do
    echo -n "👏"; sleep 0.25
  done
}

go_down_low () {
  for i in \
    "How low can you go?" \
    "Can you go down low?" \
    "All the way to the floor?" \
    "How low can you go?"
  do
    echo "$i ⬇️"; sleep 2
  done
  for i in \
    "Can you bring it to the top?" \
    "Like you never never stop?" \
    "Can you bring it to the top?"
  do
    echo "$i ⬆️"; sleep 2
  done
  echo "One hop! 🦘"; sleep 1
  echo -n "Right foot now "; sleep 1;
  echo "👟"; sleep 1
  echo -n "Left foot now y'all "; sleep 1;
  echo "👟"; sleep 1  
}

cha_cha_intro () {
  if [ $basic_step == true ]
  then
    echo "Alright now"; sleep 1
    echo "We're gonna do the basic step 🦶"; sleep 2
  elif [ -n "$turn_it" ]
  then
    echo -e "Now turn it $turn_it"; sleep 2
  elif [ $funky_time == true ]
  then
    echo "Now it's time to get funky"; sleep 2
    echo "To the right now 👉"; sleep 2
  elif [ $work_time == true ]
  then
    echo "Let's go to work 💼"; sleep 2
  fi
  echo "To the left 👈"; sleep 2
  echo "Take it back now y'all 🔙"; sleep 2
}

cha_cha_hops () {
  [[ $repeat_hops == true ]] && hop_loops=2 || hop_loops=1

  for (( i=0; i<$hop_loops; i++ )); do
    if [ $hops_this_time -eq 1 ]; then
      plural=""; sleepy_time=1
    else
      plural="s"; sleepy_time=0.5
    fi

    echo -n "$hops_this_time hop$plural $hop_phrase "; sleep 1
    for (( j=0; j<$hops_this_time; j++ )); do
      echo -n "${jumps[$RANDOM % ${#jumps[@]}]} "; sleep $sleepy_time
    done
    echo ""
  done
}

cha_cha_stomps () {
  for i in Right Left; do
    string="$@"
    echo -n "$i foot $string "; sleep 1
    if [ "$string" == "two stomps" ]; then
      echo -n "👟 "; sleep 0.5
      echo "👟 "; sleep 0.5
    else
      echo "👟 "; sleep 1
    fi
  done
}

cha_cha_stomp_routine () {
  cha_cha_stomps $stomp_string
  if [ $stomp_again == true ]; then
    cha_cha_stomps "again"
    cha_cha_stomps $stomp_string
  fi
}

cha_cha_charlie_brown () {
  if [ $charlie_brown == true ]; then
    echo -n "Charlie Brown! "; sleep 1
    for i in {1..5}; do
      echo -n "👶 "; sleep 0.5
    done
    echo -e "\nHop it out now 🦘"; sleep 1
  fi
}

cha_cha_slide_move () {
  if [ $slide == true ]; then
    slide_emoji="⬅️"
    for i in left right; do
      echo -n "Slide to the $i "; sleep 1
      echo $slide_emoji; sleep 1
      slide_emoji="➡️"
    done
  fi
}

cha_cha_criss_cross () {
  if [ $criss_cross == true ]; then
    for i in {1..2}; do
      echo -n "CRISS-CROSS! "; sleep 1
      for j in ❌ ❎; do
        echo -n "$j "; sleep 0.5
      done
      echo
    done
  fi
}

cha_cha_reverse () {
  revs=$1
  [[ $revs == 1 ]] && char="◀️" || char="⏪"
  for i in {1..2}; do
    for j in Reverse! $char; do
      for (( k=0; k<$revs; k++ )); do echo -n "$j "; done 
      sleep 1
    done
    echo
  done
}

cha_cha_knees () {
  if [ $hands_on_knees == true ]; then
    for i in {1..2}; do
      echo "Hands on your knees!"; sleep 1
    done
    for i in "" "Get funky with it " "Ohhh... " "...yeah! " "Come on! "; do
      if [ "$i" != "" ]; then echo $i; fi
      for i in {1..4}; do
        echo -n "🦵 "; sleep 0.5
      done
      echo
    done
  fi
}

cha_cha_freeze () {
  if [ $freeze == true ]; then
    echo "Freeze! ${freezes[$RANDOM % ${#freezes[@]}]}"; sleep 1
    echo -e "\nEverybody clap your hands! "; sleep 2
    clap_your_hands && clap_your_hands
    echo -ne "\nCome on, y'all " && clap_your_hands
    echo -ne "\nCheck it out, y'all " && clap_your_hands
    echo
    go_down_low
  fi
}

cha_cha_end () {
  [[ $cha_cha_again == true ]] && cha_cha_again
  echo $end_phrase; sleep 1; echo

  if [ $cha_cha_time == true ]; then
    cha_cha_time && cha_cha_time
    echo -e "\n"
  else
    sleep 1
  fi
}

cha_cha_verse () {
  cha_cha_reset
  cha_cha_options "$@"
  cha_cha_intro
  cha_cha_hops
  [[ $reverse == true ]] && cha_cha_reverse 1 || cha_cha_stomp_routine
  cha_cha_charlie_brown
  cha_cha_slide_move
  cha_cha_criss_cross
  [[ $reverse == true ]] && cha_cha_reverse 2
  cha_cha_knees
  cha_cha_freeze
  cha_cha_end
}

cha_cha_slide () {
  cha_cha_verse --basic-step --cha-cha-time
  cha_cha_verse --turn-it "out" --end-phrase "Cha cha now y'all"
  cha_cha_verse --funky-time --repeat-hops --stomp-string "two stomps" \
                --slide --criss-cross --cha-cha-time
  cha_cha_verse --work-time --hops 2 --repeat-hops \
                --hands-on-knees --stomp-string "two stomps" \
                --end-phrase "Cha cha now y'all" --cha-cha-time
  cha_cha_verse --turn-it "out" --hops 5 --stomp-again \
                --freeze --cha-cha-time
  cha_cha_verse --turn-it "out" --repeat-hops --reverse --slide \
                --cha-cha-again --end-phrase "Turn it out"
  cha_cha_verse --hops 2 --hop-phrase "2 hops" --repeat-hops --slide\
                --charlie-brown --end-phrase "Take it back now y'all 🔙"
  echo "Cha cha now y'all"; sleep 2
}

cha_cha_slide && exit 0
