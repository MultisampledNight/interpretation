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

  let backdrops = (
    solid: fg.transparentize(7.5%),
    maybe: gradient.linear(
      fg.lighten(25%),
      fg.lighten(45%),
      angle: 45deg,
    )
    .sharp(2)
    .repeat(3)
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

  // this is like super cursed
  // but on the other hand this way I don't need to worry about scaling
  // and can easily draw squares
  content(
    (0.25, legend-years.last() + 10),
    anchor: "north-west",
    canvas({
      let part(y, accent, label) = {
        let y = y * 1.25
        rect(
          (0, y),
          (rel: (1, 1)),
          fill: accent,
          stroke: none,
        )
        content(
          (1, y + 0.5),
          anchor: "west",
          pad(0.5em, label),
        )
      }

      part(1, backdrops.solid, [Sicher in der Zeit])
      part(0, backdrops.maybe, [Kann man sich drüber streiten])
    }),
  )

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
  let epoch(column, intervals, name, label) = {
    let intervals = normalize(intervals)

    let total-start = intervals.first()
    let total-end = intervals.last()
    let y-mid = (total-start + total-end) / 2

    rect(
      (column - 0.5 + column-spacing, total-start),
      (column + 0.5 - column-spacing, total-end),
      fill: none,
      stroke: none,
      name: name,
    )

    for (start, kind, end) in individual(intervals) {
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
              label,
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
  epoch(1, (1715, 1789), "aufklärung")[Aufklärung]
  epoch(2, (
    1760, "solid",
    1780, "maybe",
    1785,
  ), "sud")[Sturm und Drang]
  epoch(3, (
    1770, "maybe",
    1785, "solid",
    1805, "maybe",
    1830,
  ), "klassik")[Weimarer Klassik]
  epoch(4, (
    1805, "solid",
    1830, "maybe",
    1850,
  ), "romantik")[Romantik]

  epoch(1, (1815, 1848), "vormärz")[Vormärz]
  epoch(2, (1815, 1848), "biedermeier")[Biedermeier]
  epoch(3, (
    1848, "solid",
    1890, "maybe",
    1895,
  ), "realismus")[Poetischer Realismus]
  epoch(4, (1880, 1900), "naturalismus")[Natural-ismus]
  epoch(1, (1900, 1910), "gzn")[
    GzN
    #footnote[Gegenströmungen zum Naturalismus]
  ]
  epoch(2, (
    1911, "solid",
    1933, "maybe",
    1940,
  ), "expressionismus")[Expression-ismus]

  epoch(3, (1945, 1955), "trümmer")[Trümmer #footnote[Trümmerliteratur]]

  set-style(stroke: (
    thickness: 2pt,
    join: "round",
  ))

  let vert(y) = (rel: (0, y))
  let hori(x) = (rel: (x, 0))
  let hori-align(anchor) = (horizontal: anchor, vertical: ())
  let vert-align(anchor) = (horizontal: (), vertical: anchor)

  let edge(..points, mark: true) = line(
    ..points,
    mark: if mark == "hori" {
      (end: (symbol: ">", width: 5.5, length: 0.125))
    } else if mark {
      (end: (symbol: ">", length: 5))
    },
  )
  let edge-dotted(
    side,
    at,
    end: none,
  ) = {
    let solid(from, to) = edge(
      from,
      to,
      mark: false,
    )
    let dotted(from, to) = edge(
      from,
      to,
      stroke: (dash: "dotted"),
      mark: false,
    )

    let end = if end == none {
      hori(0.4)
    } else {
      end
    }
    if side == left {
      dotted(at, hori(0.275))
      solid((), end)
    } else if side == right {
      solid(at, end)
      dotted((), hori(0.275))
    } else {
      panic("cannot draw dotted edge at " + side)
    }
  }

  edge(
    "aufklärung.south",
    vert(-10),
    hori(2),
    "klassik.south",
  )
  edge(
    "sud.south",
    vert(-20),
    hori(1),
    mark: false,
  )

  edge(
    ("klassik.east", 20%, "klassik.south-east"),
    hori(0.525),
    "romantik.south",
  )
  let romantik-out = ("romantik.east", 97.5%, "romantik.south-east")
  edge-dotted(
    right,
    romantik-out,
  )

  edge-dotted(
    left,
    (vertical: romantik-out, horizontal: (0, 0)),
    end: hori-align("vormärz"),
  )
  edge(
    (),
    "vormärz.south",
  )
  edge(
    (horizontal: "vormärz.south", vertical: romantik-out),
    hori-align("biedermeier"),
    "biedermeier.south",
  )

  let shift = 35%
  let realismus-in = ("realismus.west", shift, "realismus.south-west")
  edge(
    "vormärz.north",
    vert-align(realismus-in),
    realismus-in,
    mark: "hori",
  )
  edge(
    "biedermeier.north",
    vert-align(realismus-in),
    mark: false,
  )

  let realismus-out = ("realismus.east", shift, "realismus.south-east")
  edge(
    realismus-out,
    hori-align("naturalismus"),
    "naturalismus.south",
  )

  edge-dotted(
    right,
    "naturalismus.east",
  )
  edge-dotted(
    left,
    (horizontal: (0, 0), vertical: "naturalismus"),
    end: hori-align("gzn"),
  )
  edge((), "gzn.south")

  edge(
    "gzn.north",
    vert-align("expressionismus"),
    "expressionismus.west",
    mark: "hori",
  )

  edge(
    "expressionismus.east",
    hori-align("trümmer"),
    "trümmer.south",
  )
})

//#set page(width: auto, height: auto)
#set text(size: 14pt, font: "IBM Plex Serif")
#literature-epochs
