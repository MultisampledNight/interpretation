# interpretation

Das, was ich für Interpretationen in Deutsch gerne früher gewusst hätte.
Nun ja, jetzt nützt mir das Wissen nichts mehr,
also gebe ich es an andere Entitäten weiter.
Damit diese hoffentlich schneller in Deutsch besser werden,
als es bei mir gedauert hat.

## Hilfe ich will nur ein PDF

Einfach den höchsten Eintrag mit einem Checkmark davor anklicken,
dort unter `Artifacts` auf `interpretation` mit dem Paketsymbol klicken:
https://github.com/MultisampledNight/interpretation/actions/workflows/compile-docs.yaml

## Mithelfen

Hängt davon ab, was genau verbessert werden möchte!
Das Dokument an sich und dessen Grafiken sind in Typst geschrieben:
https://typst.app/docs/tutorial/

Sobald oder falls man schon etwas Bewandnis mit Typst hat,
kann man einfach

1. Das Repo klonen
2. Einen neuen Branch für die Änderungen erstellen
3. Änderungen durchführen
4. Änderungen auf dem Branch auf einen Fork pushen
5. Final einen Pull Request auf GitHub erstellen!

In Shell Commands, angenommen, man ist auf Linux und
hat schon SSH für GitHub aufgesetzt:

```sh
# Schritt 1: Clone
git clone https://github.com/MultisampledNight/interpretation
cd interpretation

# Schritt 2: Branchoff
git switch -c supertolle-änderungszusammenfassung

# Schritt 3: Changes
# Öffne in einem Editor deiner Wahl die Datei `interpretation.typ` und
# ändere, was dir lustig ist
# Diese Zeile unten kannst du jedes Mal machen, sobald du deine Änderungen in "behalten" möchtest
# (Und eventuell später wie eine Zeitmaschine darauf zurückkommen möchtest)
git commit -m "Super hilfreiche Nachricht, die diese Änderungen beschreibt"

# Schritt 4: Fork
# Forke in der GitHub UI das Repo auf deinen Account
git remote add fork git@github.com/DeinNutzerNameWasAuchImmer/interpretation.git
git remote update
git push -u fork @

# Schritt 5: PR
# In der GitHub UI, navigiere auf https://github.com/MultisampledNight/interpretation
# Dort sollte oben ein gelbes Banner auftauchen, mit dem du einen Pull Request erstellen kannst
# Folge dessen Instruktionen!
```

(Ansonsten ist auch vollständig okay,
wenn ihr mir ungefähr sagt, was ihr geändert haben wollt,
und das irgendwo anders schreibt.
Ich fügs dann ein.
Oder ihr sendet mir einen Patch,
das ist genauso super!)

Es kann sein, dass ich mir diese anschaue, vielleicht auch nicht,
je nach dem, wie ich gerade Lust darauf habe.

Fühl dich bitte frei, deine eigenen Erkenntnisse auch hinzuzufügen!
Idealerweise sollte das das Dokument sein,
dass man frustrierten Schüler:innen in die Hände drücken kann,
wenn es ihnen in Deutsch aktuell nicht zu gut geht,
aber auch gleichzeitig ein kondensiertes Nachschlagewerk bilden.

# Lizenz
