
########### numTSig
###########
## pra que serve:
## customização da maneira de exibir Time Signatures em pautas TimeSig (aí escondo o Engraver de TimeSignature de pautas normais para deixar a partitura mais limpa)
###########
numTSig = #(define-music-function (parser location numeroI numeroII skip padx pady) (markup? markup? number? number? number?)
	      #{
	      \once \override TextScript #'extra-offset = #(cons (- padx 6) (- pady 2))
	      s1*0^\markup {\override #(cons 'baseline-skip (+ skip 2.8))
			    {\vcenter {\center-column
				       { \line {\sans \fontsize #numtsig $numeroI }
					 \line {\sans \fontsize #numtsig $numeroII }
				       }
				     }
			   }
			  }
	      #})



########### timemodul
###########
## pra que serve:
## inserir markup de modulação méttrica e tempo resultante
###########
timemodul = #(define-music-function (parser location musicI musicII musicIII temp padx pady) (ly:music? ly:music? ly:music? string? number? number?)
	      #{
	      \mark \markup
	      {
	      \combine " " %%% não remover! pois assergura padding com padx e pady
	      \translate #(cons padx pady) \line {\vcenter {
		\score {

		  \new Staff

		  \relative c'' { \stemUp $musicI }

		  \layout {
			ragged-right= ##t
			indent = 0
			\context {
			  \Staff
			  \override VerticalAxisGroup #'Y-extent = #'(0 . 0)  % td
			  \override StaffSymbol #'stencil = ##f
%			  \override StaffSymbol #'staff-space = #ztsigstaffsize
			  \override NoteHead #'font-size = #tmodheadsize
			  \override Stem #'font-size = #tmodheadsize
			  \override Stem #'length-fraction = #tmodstemfrac
			  \override TupletNumber #'font-size = #tmodheadsize
			  \override TupletNumber #'font-family = #'sans
			  \override TupletNumber #'font-shape = #'upright
			  \override TupletNumber #'text = #tuplet-number::calc-fraction-text
			  \override TupletBracket #'bracket-visibility = ##t
			  \override Flag #'stencil = #modern-straight-flag
			  \remove "Clef_engraver"
			  \remove "Time_signature_engraver"
			  \remove "Ledger_line_engraver" }
		      }

              }
\combine " " {
\translate #(cons 0.4 tmody) \sans{"→"}}%↔
	  \score {                 % 4th column in line

                \new Staff

                \relative c'' {
			       \stemUp $musicII
                }

		      \layout {
			ragged-right= ##t
			indent = 0
			\context {
			  \Staff
			  \override Flag #'stencil = #modern-straight-flag
			  \override VerticalAxisGroup #'Y-extent = #'(0 . 0)  % td
			  \override StaffSymbol #'stencil = ##f
%			  \override StaffSymbol #'staff-space = #ztsigstaffsize
			  \override NoteHead #'font-size = #tmodheadsize
			  \override Stem #'font-size = #tmodheadsize
			  \override Stem #'length-fraction = #tmodstemfrac
			  \override TupletNumber #'font-size = #tmodheadsize
			  \override TupletNumber #'font-family = #'sans
			  \override TupletNumber #'font-shape = #'upright
			  \override TupletNumber #'text = #tuplet-number::calc-fraction-text
			  \override TupletBracket #'bracket-visibility = ##t
			  \remove "Clef_engraver"
			  \remove "Time_signature_engraver"
			  \remove "Ledger_line_engraver" }
		      }
}
\combine " " {
\translate #(cons tmodx tmodyb) \sans{ \fontsize #tmodnumsize " ("}}
\translate #(cons tmodx 0) \score {                 % 4th column in line

                \new Staff

                \relative c'' {
			       \stemUp $musicIII
                }

		      \layout {
			ragged-right= ##t
			indent = 0
			\context {
			  \Staff
			  \override Flag #'stencil = #modern-straight-flag
			  \override VerticalAxisGroup #'Y-extent = #'(0 . 0)  % td
			  \override StaffSymbol #'stencil = ##f
%			  \override StaffSymbol #'staff-space = #ztsigstaffsize
			  \override NoteHead #'font-size = #tmodheadsize
			  \override Stem #'font-size = #tmodheadsize
			  \override Stem #'length-fraction = #tmodstemfrac
			  \override TupletNumber #'font-size = #tmodheadsize
			  \override TupletNumber #'font-family = #'sans
			  \override TupletNumber #'font-shape = #'upright
			  \override TupletNumber #'text = #tuplet-number::calc-fraction-text
			  \override TupletBracket #'bracket-visibility = ##t
			  \remove "Clef_engraver"
			  \remove "Time_signature_engraver"
			  \remove "Ledger_line_engraver" }
		      }
}

\combine " " {
\translate #(cons tmodxb tmodyb) \sans{ \fontsize #tmodnumsize {
\translate #(cons 0 (- 0 (/ tmodyb 3))){"="} \translate #(cons 0 (- 0 (/ tmodyb 5))) $temp ")"}}}

}

}
}   #})

########### timemodulapr
###########
## pra que serve:
## inserir markup de modulação méttrica e tempo resultante quando o tempo preisa ser aproximado (p/ evitar uso de indicações de tempo com ponto flutuante)
###########
timemodulapr = #(define-music-function (parser location musicI musicII musicIII temp padx pady) (ly:music? ly:music? ly:music? string? number? number?)
	      #{
	      \mark \markup
	      {
	      \combine " " %%% não remover! pois assergura padding com padx e pady
	      \translate #(cons padx pady) \line {\vcenter {
		\score {

		  \new Staff

		  \relative c'' { \stemUp $musicI }

		  \layout {
			ragged-right= ##t
			indent = 0
			\context {
			  \Staff
			  \override Flag #'stencil = #modern-straight-flag
			  \override VerticalAxisGroup #'Y-extent = #'(0 . 0)  % td
			  \override StaffSymbol #'stencil = ##f
%			  \override StaffSymbol #'staff-space = #ztsigstaffsize
			  \override NoteHead #'font-size = #tmodheadsize
			  \override Stem #'font-size = #tmodheadsize
			  \override Stem #'length-fraction = #tmodstemfrac
			  \override TupletNumber #'font-size = #tmodheadsize
			  \override TupletNumber #'font-family = #'sans
			  \override TupletNumber #'font-shape = #'upright
			  \override TupletNumber #'text = #tuplet-number::calc-fraction-text
			  \override TupletBracket #'bracket-visibility = ##t
			  \remove "Clef_engraver"
			  \remove "Time_signature_engraver"
			  \remove "Ledger_line_engraver" }
		      }

              }
\combine " " {
\translate #(cons 0.4 tmody) \sans{"→"}}%↔
	  \score {                 % 4th column in line

                \new Staff

                \relative c'' {
			       \stemUp $musicII
                }

		      \layout {
			ragged-right= ##t
			indent = 0
			\context {
			  \Staff
			  \override Flag #'stencil = #modern-straight-flag
			  \override VerticalAxisGroup #'Y-extent = #'(0 . 0)  % td
			  \override StaffSymbol #'stencil = ##f
%			  \override StaffSymbol #'staff-space = #ztsigstaffsize
			  \override NoteHead #'font-size = #tmodheadsize
			  \override Stem #'font-size = #tmodheadsize
			  \override Stem #'length-fraction = #tmodstemfrac
			  \override TupletNumber #'font-size = #tmodheadsize
			  \override TupletNumber #'font-family = #'sans
			  \override TupletNumber #'font-shape = #'upright
			  \override TupletNumber #'text = #tuplet-number::calc-fraction-text
			  \override TupletBracket #'bracket-visibility = ##t
			  \remove "Clef_engraver"
			  \remove "Time_signature_engraver"
			  \remove "Ledger_line_engraver" }
		      }
}
\combine " " {
\translate #(cons tmodx tmodyb) \sans{ \fontsize #tmodnumsize " ("}}
\translate #(cons tmodx 0) \score {                 % 4th column in line

                \new Staff

                \relative c'' {
			       \stemUp $musicIII
                }

		      \layout {
			ragged-right= ##t
			indent = 0
			\context {
			  \Staff
			  \override Flag #'stencil = #modern-straight-flag
			  \override VerticalAxisGroup #'Y-extent = #'(0 . 0)  % td
			  \override StaffSymbol #'stencil = ##f
%			  \override StaffSymbol #'staff-space = #ztsigstaffsize
			  \override NoteHead #'font-size = #tmodheadsize
			  \override Stem #'font-size = #tmodheadsize
			  \override Stem #'length-fraction = #tmodstemfrac
			  \override TupletNumber #'font-size = #tmodheadsize
			  \override TupletNumber #'font-family = #'sans
			  \override TupletNumber #'font-shape = #'upright
			  \override TupletNumber #'text = #tuplet-number::calc-fraction-text
			  \override TupletBracket #'bracket-visibility = ##t
			  \remove "Clef_engraver"
			  \remove "Time_signature_engraver"
			  \remove "Ledger_line_engraver" }
		      }
}

\combine " " {
\translate #(cons tmodxb tmodyb) \sans{ \fontsize #tmodnumsize {
\translate #(cons 0 (- 0 (/ tmodyb 3))){"≅"} \translate #(cons 0 (- 0 (/ tmodyb 5))) $temp ")"}}}

}

}
}   #})
