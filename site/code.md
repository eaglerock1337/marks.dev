# code

<!-- markdownlint-disable MD001 MD033 -->
### <sub>*shippin' it*</sub> :shipit:<br><br>{docsify-ignore}

>[!NOTE]
>I have plenty of half-finished coding projects I intend to finish, but I've been using my spare time to complete the homelab. I hope to have more to share here soon!

## tomeclicker

I started working on an [incremental game](https://en.wikipedia.org/wiki/Incremental_game) in my spare time as a good excuse for me to learn some front-end development, including working with [svelte](https://svelte.dev/). More recently, I am finding this project great for learning how to work effectively with Claude Code, and had fun creating a team of Claude agents for doing specific tasks, which I'm now calling the [Boi Squad](https://github.com/eaglerock1337/tomeclicker/tree/main/.claude/agents).

My goals for the game are pretty simple:

- open-source and free to play (none of that freemium or pay-to-win :poop:)
- web-based game optimized for both mobile and desktop gameplay
- all the usual incremental game numbers-go-up endorphin goodness
- a mix of active and idle gameplay throughout the game
- idle adventuring mechanics, complete with RPG stats, gear drops, inventory, and loadouts
- a storyline that slowly comes into focus as game features reveal themselves
- multiple prestige mechanics that make replays faster and more effective
- the mystery of the Tomes and many other surprises to discover!

Currently, the game is in what I would call an MVP (minimum viable product) state, which gives you a feel of the early gameplay. There should be enough gameplay for 30-60 minutes of active gameplay plus a couple of hours of idle gameplay to play through the whole demo. Feel free to try the game out at [tomeclicker.marks.dev](https://tomeclicker.marks.dev) and see how you like it!

Check out the [GitHub page](https://github.com/eaglerock1337/tomeclicker) if you want to read more or if you had any suggestions or feedback to share!.

## more code

I plan on showcasing more coding projects here, but for now, take a look at my [GitHub](https://github.com/eaglerock1337) page or check some random snippets below.

> [!TIP]
> Hold your phone sideways for this one.

<!-- tabs:start -->

## **chacha.sh**

```bash
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
```

## **horses.py**

```python
import random


"""
Solve Google's 25 horse problem:

You have 25 horses and need to find the three fastest horses in the group.
You can race 5 horses at a time, but do not have a watch.
How many races are required to find the top three horses?

My answer: 7 heats
- Run 5 heats with 5 horses each and get the results.
- Run a championship heat with the fastest horse from each heat.
  - You now have the fastest horse in the group.
- Use the final heat to find the second and third fastest:
  - Second and third fastest horses from the fastest heat
  - First and second fastest horses from the second-fastest heat
  - First horse from the third-fastest heat
- The fastest and second-fastest horse from the seventh heat will give you
  the final two horses to answer the question, and will account for all
  possibilities.
"""

def gen_horses():
    horses = []
    for _ in range(25):
        horses.append(random.random())
    return horses


def top_three(horses):
    return sorted(horses)[:3]


def set_heats(horses):
    heats = []
    for i in range(0, 25, 5):
        heats.append(horses[i:i+5])
    return heats


def run_heat(heat, get_order=False):
    sorted_heat = sorted(heat)

    if get_order:
        horse_order = []
        for horse in sorted_heat:
            horse_order.append(heat.index(horse))

        return sorted_heat, horse_order

    else:
        return sorted_heat


def get_on_my_horse(horses):
    heats = set_heats(horses)
    run_heats = []
    champion_heat = []

    # Run 5 heats with 5 horses
    for heat in heats:
        results = run_heat(heat)
        run_heats.append(results)
        champion_heat.append(results[0])

    # Run champion heat
    champs, order = run_heat(champion_heat, get_order=True)

    # Run final runners-up heat
    final_heat = [
        run_heats[order[0]][1],
        run_heats[order[0]][2],
        run_heats[order[1]][0],
        run_heats[order[1]][1],
        run_heats[order[2]][0],
    ]
    runners_up = run_heat(final_heat)

    return [champs[0], runners_up[0], runners_up[1]]


if __name__ == "__main__":
    for _ in range(1_000_000):
        horses = gen_horses()
        answer = get_on_my_horse(horses)
        assert answer == top_three(horses)
```

## **kimbusy.go**

```go
package main

// Simulate a Comp Sci class with a teacher trying to avoid working.

import (
    "fmt"
    "math/rand"
    "sync"
    "time"
)

const kimBusy = true

// Student is a data type passed to the kim goroutine from a student.
type Student struct {
    name      string
    busyCount int
    response  chan string
}

func newStudent(name string) Student {
    s := Student{name: name}
    s.busyCount = 0
    s.response = make(chan string)
    return s
}

func kim(hand chan Student) {
    time.Sleep(time.Duration(rand.Intn(5)+5) * time.Second)
    fmt.Println("Kim's all ready to help!")

    for {
        somebody := <-hand
        fmt.Printf("Kim sees %v's raised hand!\n", somebody.name)
        if kimBusy {
            if somebody.busyCount < rand.Intn(5)+2 {
                // Students get a 'Busy' a certain number of times
                fmt.Println("Kim says 'Busy!'")
                somebody.response <- "Busy"
            } else {
                // After a while, Kim tells them they're 'On Deck'
                fmt.Println("Kim says 'You're on Deck!'")
                somebody.response <- "On Deck"
            }
        } else {
            fmt.Println("Something went wrong! Kim is always busy!")
        }
        time.Sleep(time.Duration(rand.Intn(5)+1) * time.Second)
    }
}

func student(wg *sync.WaitGroup, name string, hand chan Student) {
    defer wg.Done()
    me := newStudent(name)
    fmt.Printf("%v has started his work!\n", me.name)
    time.Sleep(time.Duration(rand.Intn(15)+5) * time.Second)

    // Time for the futile attempt at getting some help from Kim
    fmt.Printf("%v raises his hand for some help!\n", me.name)
    for {
        select {
        case hand <- me: // Kim actually bothers to notice you
            kimSez := <-me.response
            if kimSez == "Busy" {
                me.busyCount++
            } else if kimSez == "On Deck" {
                fmt.Printf("%v is on deck and accepts his fate.\n", me.name)
                return
            }
            fmt.Printf("%v waits a bit before trying again.\n", me.name)
            time.Sleep(time.Duration(rand.Intn(5)+5) * time.Second)
            fmt.Printf("%v raises his hand again!\n", me.name)
        default: // You can't even get Kim's attention
            time.Sleep(time.Duration(rand.Intn(5)+1) * time.Second)
        }
    }
}

func classroom(class []string) {
    var wg sync.WaitGroup      // Wait group for tracking students
    hand := make(chan Student) // Channel for Kim seeing raised hands
    fmt.Println("The bell has rung! Time for class!")

    go kim(hand) // Goroutine for Kim
    for _, name := range class {
        go student(&wg, name, hand) // Goroutine for each student
    }

    wg.Add(len(class)) // Set the wait group to the number of students
    wg.Wait()          // Don't end class until everyone's spirit is broken
    fmt.Println("The bell has rung! Class dismissed!")
}

func main() {
    names := []string{
        "Jon", "Peter", "Matt", "Mike",
        "Andrew", "Nima", "Dan", "Ben",
        "Bill", "Ted", "Marty", "Biff",
    }
    rand.Seed(time.Now().UnixNano())
    classroom(names)
}

```

## **newton.py**

```python
from random import randint


SAMPLE_SIZE = 1000000
DICE_SETS = 3


def roll_for_sixes(dice_sets, ceiling=False):
    """
    Roll and attempt to hit at least one 6 per set of 6 dice.
    Returns true if at least dice_sets 6's are rolled. If ceiling
    is set to True, will only return True for an exact hit.

    Variables:
    dice_sets - The number of dice to roll (in sets of 6)
    ceiling   - Whether an exact hit is required or if rolling
                more 6's still counts as a hit.

    Returns a True result if the number of sixes matches
    the number of sets, based on the ceiling strategy.
    """
    dice = dice_sets * 6
    sixes = 0

    for _ in range(dice):
        roll = randint(1, 6)
        if roll == 6:
            sixes += 1

    if ceiling:
        return sixes == dice_sets
    else:
        return sixes >= dice_sets


def run_simulation(sample_size=1000, exact_hit=False):
    """
    Runs a simulation of the specified sample size and roll strategy.
    Prints out data and results of the simulation to stdout.

    Variables:
    sample_size - how many times we test each chest (defaults to 1000)
    exact_hit   - whether an exact number of sixes is required for a hit,
                  or if rolling extra sixes will still count.
    """
    successes = [0] * DICE_SETS

    for _ in range(sample_size):
        for i in range(DICE_SETS):
            dice_set = i + 1
            result = roll_for_sixes(dice_set, exact_hit)
            if result:
                successes[i] += 1

    print(f"\n\nResults for {sample_size} tests (Exact hit: {exact_hit}):")
    for i in range(DICE_SETS):
        print(f"\nUsing {i+1} sets of dice ({(i+1)*6} total):")
        print(f"  Total Hits: {successes[i]}")
        print(f"  Winning Percentage: {successes[i] / sample_size * 100}%")


def do_thing():
    """
    Simulates the Newton-Pepys Problem
    Inspired by https://www.youtube.com/watch?v=RFlTawWwLZc
    """
    run_simulation(SAMPLE_SIZE, False)
    run_simulation(SAMPLE_SIZE, True)


if __name__ == "__main__":
    do_thing()
```

## **newton.go**

```go
package main

import (
    "fmt"
    "math/rand"
    "time"
)

const (
    totalSampleSize = 1000000
    diceSets        = 3
)

/*
Roll and attempt to hit at least one six per set of 6 dice.
Returns true if at least dice_sets sixes are rolled. If ceiling
is set to True, will only return True for an exact hit.

Variables:
  numOfSets - The number of dice to roll (in sets of 6)
  ceiling   - Whether an exact hit is required or if rolling
              more sixes still counts as a hit.

Returns a True result if the number of sixes matches
the number of sets, based on the ceiling strategy.
*/
func rollForSixes(numOfSets int, ceiling bool) bool {
    totalDice := numOfSets * 6
    sixes := 0

    for i := 0; i < totalDice; i++ {
        roll := rand.Intn(6) + 1
        if roll == 6 {
            sixes++
        }
    }

    if ceiling {
        return (sixes == numOfSets)
    }
    return (sixes >= numOfSets)
}

/*
Runs a simulation of the specified sample size and roll
strategy. Prints out data and results of the simulation
to stdout.

Variables:
  sample_size - how many times we test each chest
  exact_hit   - whether an exact number of sixes is required
                for a hit, or if rolling extra sixes will
                still count.
*/
func runSimulation(sampleSize int, exactHit bool) {
    var successes [diceSets]int

    for i := 0; i < sampleSize; i++ {
        for sets := 1; sets <= diceSets; sets++ {
            result := rollForSixes(sets, exactHit)
            if result {
                successes[sets-1]++
            }
        }
    }
    fmt.Printf("\n\nResults for sample size %v (Exact hit: %v):\n",
               sampleSize, exactHit)
    for i := 1; i <= diceSets; i++ {
        fmt.Printf("\nUsing %v sets of dice (%v total):\n", i, i*6)
        fmt.Printf("  Total Hits: %v\n", successes[i-1])
        fmt.Printf("  Winning Percentage: %.6v%%\n", 
                   float64(successes[i-1])/float64(sampleSize)*100.0)
    }
}

// Simulates the Newton–Pepys problem
// Inspired by https://www.youtube.com/watch?v=RFlTawWwLZc
func main() {
    rand.Seed(time.Now().UnixNano())
    runSimulation(totalSampleSize, false)
    runSimulation(totalSampleSize, true)
}
```

<!-- tabs:end -->

Ooh, pretty syntax highlighting! :tada:
