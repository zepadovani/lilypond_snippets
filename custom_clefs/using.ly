\include "clefsnippet.ily"

\context Score = "score"
<<
    \context Staff = "staff"
    {


            c2
            r4
            r4*1/4\noStaff s8.

            \staffclefI
            \clefI
            e4\glissando
            c''4
            r2

            \break

            r4*1/2
            \noStaff
            s8
            %{ \revertStaff %}
            \staffclefII
            \clefII
            f''4\glissando g

            r4*1/4 \noStaff s8.
            \staffpenta
            \clefrevert
            c'1
            }


>>
