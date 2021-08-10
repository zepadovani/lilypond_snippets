\version "2.22.1"

staffclefI = {
	\stopStaff \startStaff
	\override NoteHead #'no-ledgers = ##t
	\revert Staff.StaffSymbol #'line-count
	\override Staff.StaffSymbol #'transparent = ##f
	\override Staff.StaffSymbol #'color = #(x11-color 'grey)
	\override Staff.StaffSymbol #'line-count = #4
	\override Staff.StaffSymbol #'line-positions = #'(-12 2 2.4 7.5)
	\stopStaff \startStaff
}

staffclefII = {
	\stopStaff \startStaff
	\override NoteHead #'no-ledgers = ##t
	\revert Staff.StaffSymbol #'line-count
	\override Staff.StaffSymbol #'transparent = ##f
	\override Staff.StaffSymbol #'color = #(x11-color 'grey)
	\override Staff.StaffSymbol #'line-count = #4
	\override Staff.StaffSymbol #'line-positions = #'(-12 6.2 6.6 10)
	\stopStaff \startStaff
}

staffpenta = {
	\stopStaff \startStaff
	\override NoteHead #'no-ledgers = ##f
	\revert Staff.StaffSymbol #'line-count
	\override Staff.StaffSymbol #'transparent = ##f
	\override Staff.StaffSymbol #'color = #(x11-color 'black)
	\override Staff.StaffSymbol #'line-count = #5
	\override Staff.StaffSymbol #'line-positions = #'(-4 -2 0 2 4)
	\stopStaff \startStaff
}

noStaff = {
	\stopStaff \startStaff
	\override Staff.StaffSymbol #'transparent = ##t
	\stopStaff \startStaff
	}

revertStaff = {
		\stopStaff \startStaff
		\revert Staff.StaffSymbol #'line-count
		\override Staff.StaffSymbol #'transparent = ##f
		\stopStaff \startStaff
		}

 clefI = {
	 \set Staff.forceClef = ##t
	 \override Staff.Clef.stencil = #
	 (lambda (grob)(grob-interpret-markup grob
	 #{ \markup \combine " " {\translate #(cons 0 0) %set translate and fontsize to your needs!
			{\override #'(font-name . "SulSegno Regular")
			 \fontsize #8
			 "1"}
		 }
		#}))
 }

 clefII = {
	 \set Staff.forceClef = ##t
	 \override Staff.Clef.stencil = #
	 (lambda (grob)(grob-interpret-markup grob
	 #{ \markup \combine " " {\translate #(cons 0 0) %set translate and fontsize to your needs!
			{\override #'(font-name . "SulSegno Regular")
			 \fontsize #8
			 "2"}
		 }
		#}))
 }

 clefrevert = {
	 \set Staff.forceClef = ##t
	 \revert Staff.Clef.stencil
 }
