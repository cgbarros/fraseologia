\version "2.19.15"

#(set-global-staff-size 18)
\include "lilypond-book-preamble.ly"

seta = \markup { 
  \center-column {
    \combine 
      \arrow-head #Y #UP ##t 
      \draw-line #'(0 . -2) 
  } 
}

vlSolo = \relative c''' {
  g2_\seta ~  g4. bes8 |
  c,2 a'4. d,8 |
  bes'8. a16 g4
}

vlUmRepeat = {
  \repeat unfold 2 { bes16. bes32 } bes8 r8
}

vlUm = \relative c' {
 bes16. \p bes32 bes16. bes32 bes8 r8 \vlUmRepeat |
 \transpose c gis { \repeat unfold 2 { \vlUmRepeat } } |
 \vlUmRepeat
}

vlDois = \relative c' {
  g16. \p g32 g16. g32 g8 r8 \transpose c a, { \vlUmRepeat }
  \transpose c b, { \vlUmRepeat } \transpose c e { \vlUmRepeat }
  \transpose c a, { \vlUmRepeat }
}


\new StaffGroup <<
  \new Staff <<
    \set Staff.instrumentName = "Vl. Solo"
   \key g \minor \vlSolo
  >>
  \new Staff \with { \magnifyStaff #3/5 } <<
    \set Staff.instrumentName = "Vl. I"
   \key g \minor \vlUm
  >>
  \new Staff \with { \magnifyStaff #3/5 } <<
    \set Staff.instrumentName = "Vl. II"
   \key g \minor \vlDois
  >>
>>