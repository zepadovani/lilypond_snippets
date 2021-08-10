\version "2.12.2"

xyText = #(define-music-function (parser location padx pady) (number? number?)
	   #{
	   \once \override TextScript #'outside-staff-priority = ##f
	   \once \override TextScript #'X-offset = #padx
	   \once \override TextScript #'Y-offset = #pady
	   #})

eoText = #(define-music-function (parser location padx pady) (number? number?)
	   #{
	   \once \override TextScript #'extra-offset = #(cons padx pady)
	   #})



smallStem ={
  \once \override Stem #'length-fraction = #0.8
}

noLedger = {
  \override NoteHead #'no-ledgers = ##t
}


scoreMarkupLayout =  \layout{

  ragged-right= ##t
  indent = 0
  \context {
    \Staff

    \remove "Clef_engraver"
    \remove "Staff_symbol_engraver"
    \remove "Time_signature_engraver"
    \remove "Ledger_line_engraver"


  }
}

tdq =    {         \xyText #-2 #5
		   s4*0-\markup{
		     \sans {\large
			    \override #'(baseline-skip . 1.7)
			    \column{\line{2}
				    \line{4}
				  }}}
		 }

ttq =    {         \xyText #-2 #5
		   s4*0-\markup{
		     \sans {\large
			    \override #'(baseline-skip . 1.7)
			    \column{\line{3}
				    \line{4}
				  }}}
		 }

tqq =    {         \xyText #-2 #5
		   s4*0-\markup{
		     \sans {\large
			    \override #'(baseline-skip . 1.7)
			    \column{\line{4}
				    \line{4}
				  }}}
		 }



tdoisdoze =    {         \xyText #-2 #5
		   s4*0-\markup{
		     \sans {\large
			    \override #'(baseline-skip . 1.7)
			    \column{\line{2}
				    \line{12}
				  }}}
		 }


toitodoze =    {         \xyText #-2 #5
		   s4*0-\markup{
		     \sans {\large
			    \override #'(baseline-skip . 1.7)
			    \column{\line{8}
				    \line{12}
				  }}}
		 }





formatSc = {
}

#(define-markup-command (testmusic layout props music) (ly:music?)
  (let ((score (ly:make-score music))
	(score-layout (ly:output-def-clone scoreMarkupLayout)))
   ;; possibly, change some settings in the \layout block
   (ly:output-def-set-variable! score-layout 'indent 0)
   ;; add the \layout block to the score
   (ly:score-add-output-def! score score-layout)
   (interpret-markup layout props (markup #:vcenter #:score score))))



mtum = \markup { \combine "" \translate #(cons 0 5.5) {
  \testmusic ##{
    \noLedger
    \smallStem
    \large
    \stemUp
    \override TupletNumber #'text = #tuplet-number::calc-fraction-text
    \override TupletBracket #'bracket-visibility = ##t
    \override StaffSymbol #'stencil = ##f
    \override NoteHead #'font-size = #-3
    \override Stem #'font-size = #-3
    \override Stem #'length-fraction = #0.6

    b'4#}
  \translate #(cons 0 -0.8)
  \sans "="}}

\score {
  \new StaffGroup \with {
     \remove "Forbid_line_break_engraver"
\override StaffGrouper.staff-staff-spacing =
      #'((basic-distance . 8)
         (minimum-distance . 7)
         (padding . 10))
    }

  <<
    \new Staff \with {
       \remove "Forbid_line_break_engraver"
      \consists "Timing_translator"
       \consists "Default_bar_line_engraver"
       \remove "Forbid_line_break_engraver"
}
    \relative {
      \set Timing.defaultBarType = ""
      \set Staff.whichBar = ""
      \set Score.proportionalNotationDuration = #(ly:make-moment 1 32)
				%      \override Score.SpacingSpanner.strict-note-spacing = ##t

      \set Score.tempoHideNote = ##t

\tempo 4= 60
      <<{
	\ttq}\\{
	        \eoText #1 #4
      \time 1/4
	c''4^\markup{\vcenter {\mtum \sans "60"}}
	}>>
      c4 c4
      \bar "|"

      <<{	\tqq


	      }\\{
\tempo 4= 80
		\eoText #1 #4
		c4^\markup{\vcenter {\mtum \sans "80"}}
c4 c4 c4
\bar "|"

<<{	\ttq
	s2.
}\\{
  c4 c4 c4}>>
\bar "|"

<<{
\tdoisdoze
 s4*2/3
}\\{


  \times 2/3{ c8 c8}
}>>
  \break
  \bar "|"

  \time 2/4
  \tdq

      c4
  c4
  \bar "|"


  c4 c4
  \bar "|"
  c4 c4 c4 c4 c4 c4 c4

      }>>



    }

  \new Staff \with {
    \remove "Forbid_line_break_engraver"

    \consists "Timing_translator"


    \override Barline #'transparent = ##t

    } {
  \relative {
    \set Score.forbidBreak = ##f
      \set Timing.defaultBarType = ""
      \set Staff.whichBar = ""


    <<{
      \scaleDurations 60/64 {
	\ttq
      }
	     }\\{
	        \scaleDurations 60/64 {
	        \eoText #1 #4
      \time 20/4
		c''4^\markup{\vcenter {\mtum \sans "64"}}
		c c c c 
		}
	}>>


      }

    }
  >>

  \layout {
    \context {
      \Score
      \remove "Time_signature_engraver"
      \remove "Timing_translator"
      \remove "Default_bar_line_engraver"
      \remove Forbid_line_break_engraver
      \override Beam.breakable = ##t
      \override SpacingSpanner.uniform-stretching = ##t
    }

    \context{
      \Staff
      \remove "Time_signature_engraver"
      \remove "Default_bar_line_engraver"
      \override Beam.breakable = ##t
      \remove Forbid_line_break_engraver
    }

    \context {
      \Voice
      \remove "Forbid_line_break_engraver"
      \override Beam.breakable = ##t
    }

    \context {
      \StaffGroup
      \remove "Forbid_line_break_engraver"
      \remove "Time_signature_engraver"
      \remove "Default_bar_line_engraver"
      \remove "Span_bar_engraver"
      \override Beam.breakable = ##t
    }
  }
  \midi { }
}
