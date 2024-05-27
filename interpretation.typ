#import "util/graphics.typ"

#set page(
  numbering: "1 / 1",
)
#set par(
  justify: true,
)
#set text(
  size: 14pt,
  font: "IBM Plex Serif",
  lang: "de",
)

#set heading(
  numbering: "1.1",
)

#align(
  right,
)[
  #text(2em)[hilfe Interpretation wie] \
  Von: MultisampledNight
]

#let note(body) = block(
  fill: luma(92.5%),
  inset: 0.5em,
  radius: 0.5em,
  width: 100%,
  [
    Anmerkung \
    #v(-0.5em)
    #line(
      length: 100%,
      stroke: luma(70%),
    )
    #v(-0.5em)
    #body
  ]
)

#let todo(body) = align(
  right,
  box(
    fill: purple.transparentize(80%),
    inset: 0.5em,
    radius: 0.5em,
    [TODO: #body],
  ),
)


#outline(
  fill: align(right, repeat[.]),
)

= Ziel

Finde eine tiefere Bedeutung im Text.

= Anleitung

#todo[Nun ja, Schritt für Schritt Anleitung]

= Wie?

Baue nach und nach Modelle auf,
die bei der Abstraktion helfen.

== Interpretationsebenen

Ein Text hat mehrere sogenannte
Interpretationsebenen.
Eine Ebene ist
ein zusammenhängendes Verständnis
vom gesamten Text.
Bei Gedichten und Parabeln
müssen _beinahe alle_ Elemente des Textes
zu einer Ebene passen,
damit diese zutrifft,
bei anderen Texten ist es auch okay,
wenn mehrere Elemente nicht passen.

Je tiefer eine Ebene,
desto _abstrakter_ ist diese.
Die erste Ebene ist konzeptuell das,
was in der Geschichte tatsächlich passiert.
Mit höherem Abstraktionsgrad
sind auch immer weniger Elemente
im Text selber zu finden.
Stattdessen bietet sich immer wieder
die Referenz auf vorherige Ebenen an.

- Die Ebenen muss man nicht in der Interpretation selber erwähnen.

  - Stattdessen macht es meist mehr Sinn,
    von möglichen Interpretationen direkt zu sprechen.

- Es kann mehrere Ebenen mit dem gleichen Abstraktionsgrad geben.

- Zu beschreiben,
  warum eine mögliche Ebene _nicht_ zum Text passt,
  ist auch ein sehr hilfreicher Teil der Erschließung.

== Epochenbezug

Eine Epoche ist
eine zeitlich begrenzte Strömung
von ähnlichen Ideen
mit meist ähnlichem Stil.

Auch wenn etwas
in der Zeit einer Epoche
geschrieben ist,
muss das nicht heißen,
dass das auch Teil der Epoche ist.
Beispielsweise schreibt
Franz Kafka bis 1924
und liegt damit zeitlich im Expressionismus,
aber die Art,
wie Kafka schreibt,
ist eigentlich eher dem Realismus zuzuordnen.

Ob man speziell die Epoche zuordnen muss
sollte man zuvor
mit der Lehrkraft absprechen.
Wenn man das muss,
sollte das eine eigene Sektion sein.

Aber selbst wenn man nicht _muss_,
ist es trotzdem sehr hilfreich,
das in die Interpretation
dort einzubetten,
wo es hilft oder
Textelemente erklären kann.

#pagebreak()

= Anhang

== Epochen der Literatur

#graphics.literature-epochs
