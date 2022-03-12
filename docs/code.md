# code

### <sub>*shippin' it*</sub> :shipit: {docsify-ignore}<p></p>

>[!NOTE]
>This page will eventually showcase my favorite projects, but for now, here's some random code.

> [!TIP]
> Hold your phone sideways for this one.

<!-- tabs:start -->

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
    var wg sync.WaitGroup      // Wait group for checking how many students are still working
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

    print(f"\n\nResults for sample size {sample_size} (Exact hit: {exact_hit}):")
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
    fmt.Printf("\n\nResults for sample size %v (Exact hit: %v):\n", sampleSize, exactHit)
    for i := 1; i <= diceSets; i++ {
        fmt.Printf("\nUsing %v sets of dice (%v total):\n", i, i*6)
        fmt.Printf("  Total Hits: %v\n", successes[i-1])
        fmt.Printf("  Winning Percentage: %.6v%%\n", float64(successes[i-1])/float64(sampleSize)*100.0)
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
