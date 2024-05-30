#import "@preview/cetz:0.2.2"

#let bg = luma(100%)
#let fg = luma(0%)

#let canvas(body) = {
  set par(justify: false)
  cetz.canvas(body)
}


#let literature-epochs = canvas({
  import cetz.draw: *

  let diagram = (width: 5)
  let column-spacing = 0.025
  let cell-size = (x: 3, y: 0.075)
  scale(
    x: cell-size.x,
    y: -cell-size.y
  )

  let step = (major: 25, minor: 5)
  let legend-years = range(
    1700,
    1950 + 1, // end is exclusive
    step: step.major,
  )
  for (i, year) in legend-years.enumerate() {
    let hint(y-offset, paint) = line(
      (0, year + y-offset),
      (rel: (diagram.width, 0)),
      stroke: (
        paint: paint,
      )
    )

    hint(0, luma(70%))

    if i != 0 {
      for y-offset in range(
        step.minor,
        step.major,
        step: step.minor,
      ) {
        hint(-y-offset, luma(90%))
      }
    }

    let label(x) = content((x, year), box(fill: bg, inset: 0.25em)[#year])
    label(0)
    label(diagram.width)
  }

  // TODO: also add legend explaining backdrops of epochs

  let normalize(intervals) = {
    // if there's only 2 items, assume it's solid
    if intervals.len() == 2 {
      intervals.insert(1, "solid")
    }

    return intervals
  }

  let individual(intervals) = {
    range(int(intervals.len() / 2))
      .map(i => intervals.slice(i * 2, count: 3))
  }

  // `intervals` is an array of the form (start, [kind,] {mid, kind}, end)
  //
  // `kind` is one of
  // - "maybe", denoting that it isn't entirely clear
  //   if the epoch is in this interval
  // - "solid", denoting that the epoch is for sure
  //   during this interval
  let epoch(column, intervals, name) = {
    let intervals = normalize(intervals)

    let total-start = intervals.first()
    let total-end = intervals.last()
    let y-mid = (total-start + total-end) / 2

    for (start, kind, end) in individual(intervals) {
      let backdrops = (
        "solid": fg.transparentize(17.5%),
        "maybe": gradient.linear(
          fg.lighten(25%),
          fg.lighten(45%),
          angle: 45deg,
        )
        .sharp(2)
        .repeat(3)
      )
      let upper-left = (column - 0.5 + column-spacing, start)
      let lower-right = (column + 0.5 - column-spacing, end)
      rect(
        upper-left,
        lower-right,
        fill: backdrops.at(kind),
        stroke: none,
      )

      if "solid" == kind {
        let label = box(
          width: cell-size.x * 1cm - 8pt,
          align(
            center,
            text(
              fill: bg,
              size: 0.9em,
              name,
            ),
          ),
        )
        content(
          (upper-left, 50%, lower-right),
          label,
        )
      }
    }
  }

  // TODO: refactor syntax to make use of intervals always sharing starts and ends,
  // just put them into 1 array instead of nesting
  epoch(1, (1715, 1789))[Aufklärung]
  epoch(2, (
    1760, "solid",
    1780, "maybe",
    1785,
  ))[Sturm und Drang]
  epoch(3, (
    1770, "maybe",
    1785, "solid",
    1805, "maybe",
    1830,
  ))[Weimarer Klassik]
  epoch(4, (
    1805, "solid",
    1830, "maybe",
    1850,
  ))[Romantik]

  epoch(1, (1815, 1848))[Vormärz]
  epoch(2, (1815, 1848))[Biedermeier]
  epoch(3, (
    1848, "solid",
    1890, "maybe",
    1895,
  ))[Poetischer Realismus]
  epoch(4, (1880, 1900))[Natural-ismus]
  epoch(1, (1900, 1910))[
    GzN
    #footnote[Gegenströmungen zum Naturalismus]
  ]
  epoch(2, (
    1911, "solid",
    1933, "maybe",
    1940,
  ))[Expression-ismus]

  epoch(3, (1945, 1955))[Trümmer #footnote[Trümmerliteratur]]

  // TODO: add helpful edges and arrows
})

//#set page(width: auto, height: auto)
#set text(size: 14pt, font: "IBM Plex Serif")
#literature-epochs
