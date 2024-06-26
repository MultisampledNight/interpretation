#import "util/graphics.typ"

#let version = "0.1.2"

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
  Von MultisampledNight \
  Version #version
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
  indent: auto,
)

= Ziel

Finde eine tiefere Bedeutung im Text.

= Anleitung

+ Lese den Text ein paar mal durch.

  - Idealerweise gleich mit Stift in der Hand,
    um einzelne Sinnabschnitte zu finden und markieren.

+ Überlege dir eine initiale Hypothese
  über eine mögliche Interpretation
  des Textes,
  welche du über deine Arbeit hinweg
    bestätigen,
    ablehnen oder
    irgendetwas dazwischen damit machen
  wirst.

+ Finde Elemente,
  mithilfe sich der Text
  zunächst oberflächlich beschreiben lässt.
  
  - Wenn ein Dialog vorhanden ist,
    sammle
      Argumentationspunkte,
      Strategie und
      Motivationen
    der teilnehmenden Entitäten.

  - Falls Motive zu finden sind,
    schreibe diese auf.
    Vielleicht
      korrelieren,
      interagieren oder
      entgegenstehen
    diese auch.

+ Lege dir einen Schreibplan/eine Gliederung zurecht.

  - Die Skelettstruktur
    für die meisten Fälle
    ist ungefähr:
    
    + Einleitung
      
      - Basissatz
      - Epochenbezug

    + Hauptteil

      #set enum(numbering: "a)")
      + Initiale Hypothese
      + Inhaltszusammenfassung
      + Dialoganalyse (falls nötig)
      + Sprachlich-stilistische Analyse
      + ...
      + Überprüfung der Hypothese
      + Fazit

    + Schluss

      - Rückbezug auf Einleitung
      - Bedeutung der Epoche oder Autor:in

  - Das sollte man so weit ausfüllen,
    dass man davon ausgehend
    den eigentlichen Text schreiben kann,
    ohne viel nachzudenken.

  - Wie das aber genau aussehen soll,
    hängt von der Textart ab.

    - Man kann auch von der kanonischen Gliederung für die jeweilige Textart abweichen.
      Das sollte man aber nur mit gutem Grund machen.

+ Führe diesen Schreibplan aus,
  um den eigentlichen Text zu erhalten.

  - Es ist okay,
    wenn man während dem Schreiben des Textes neue Dinge herausfindet,
    die nicht im Schreibplan standen,
    oder doch etwas ganz anders ist.

  - Meist bietet es sich an,
    den Schreibplan entsprechend anzupassen,
    damit sowohl Korrektor:in als auch du selber
    den Überblick behalten.
    Das ist aber nicht unbedingt nötig.

= Wie?

Baue nach und nach Modelle auf,
die bei der Abstraktion helfen.

== Sinnabschnitte

Texte behandeln oft mehrere
  Szenen,
  Situationen,
  Perspektiven und
  Geschehnisse.
Dementsprechend lassen sich oft
Abschnitte finden,
wo die gerade genannten Elemente
mehr oder weniger zusammenhängend sind.

Diese Abschnitte werden Sinnabschnitte genannt,
weil sie den Text brillianterweise sinnmäßig unterteilen.
Sie helfen sowohl
  bei der Orientierung
  für das Finden
  von relevanten Textelementen,
als auch
  bei der Referenz
  auf diese Textelemente
  dann in der Interpretation.

Effektiv sind diese
nur eine Abstraktion
über die reine Zeilenangabe
(die man sowieso immer bei Zitaten machen sollte)
hinweg,
und erlauben
eine gröbere Einordung
des Textes.

Pro Sinnabschnitt
sollte man
  mindestens ein Stilmittel
und
  eine Überschrift für den gesamten Abschnitt
finden.
Das ist aber auch nicht universell:
Kafka beispielsweise verwendet kaum Stilmittel,
bei Gedichten sind die Stilmittel
weitaus wichtiger als anderswo,
und auch hier gibt es große Epochenunterschiede.

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
(aber trotzdem selten genau einordbare)
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

Ob man speziell die Epoche zuordnen muss,
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

= Anhang

== Stilmittel

#todo[Die häufigsten Stilmittel auflisten]

#pagebreak()
== Epochen der Literatur

#graphics.literature-epochs
