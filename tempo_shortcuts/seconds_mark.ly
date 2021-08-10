secondsMark = #(define-music-function (parser location padx pady marktext largura)
                                         (number? number? string? number?)
     #{

       \once \override Score . RehearsalMark #'extra-offset = #(cons padx pady) {
       \mark \markup { \line{ \postscript #(string-append "0.2 setlinewidth "
                                  (ly:number->string (* (+ largura 1) -1))
                                  " 0.5 moveto 1 0.5 rlineto "
                                  (ly:number->string largura)" 0 rlineto stroke")
      \override #'(font-name . "Sans") $marktext
      \postscript #(string-append "0.2 setlinewidth 0 1 moveto "(ly:number->string largura)" 0 rlineto 1 -0.5 rlineto stroke")
}}}
     #})
