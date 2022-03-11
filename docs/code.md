# code

### <sub>*shippin' it*</sub> :shipit: {docsify-ignore}

?>This page will eventually highlight my favorite coding projects, but for now, here's something random:

Hold your phone sideways for this one:

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

Ooh, pretty syntax highlighting! :tada:
