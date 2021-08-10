



%%%% Colocar dentro de layout para criar um novo tipo de Staff, chamado "TimeSig", que serve apenas para
%%%% escrever markups gerais ("marks"). É nessa parte que incluo todas as modulações métricas, indicações de tempo
%%%% e indicações de ensaio (RehearsalMark).

 \context {
    \type "Engraver_group"
    \consists "Font_size_engraver"
    \consists "Text_engraver"
    \consists "Text_spanner_engraver"
    \name "TimeSig"

   \override NonMusicalPaperColumn #'line-break-permission = ##f
   \override NonMusicalPaperColumn #'page-break-permission = ##f
   \override TupletNumber #'font-family = #'sans
   \override TupletNumber #'font-shape = #'upright
   \override TupletNumber #'font-size = #-2
   \override TupletNumber #'text = #tuplet-number::calc-fraction-text
    \override TupletBracket #'bracket-visibility = ##t
  }




%%%%% dentro de \score, incluo algo como isso (tsgrupo é a variável que contém todos os eventos da parte que terá TimeSig como tipo de Staff)

\new TimeSig \with {
} {\tsgrupo}


%%% breve exemplo de coisas que eu coloco em tsgrupo (ver funções no arquivo de atalho). coisas como #tsigpadx, #tsigpady, etc, são variáveis que ficam no início da partitura e que podem ser indicadas globalmente (ex: 'tsigpadx = #4')

tsgrupo = {
\ztempo {c'4} "60" #0 #2
 \time 7/4
\numTSig "7" "4" #0 #tsigpadx #tsigpady
\tag #'sctag {
  \set Score.proportionalNotationDuration = #(ly:make-moment 1 10)}
\tag #'partvlnI {
  \set Score.proportionalNotationDuration = #(ly:make-moment 1 10)}

s2 s8 s16%\secondsMark #1.2 #secPad "7ˮ" #15
 s16 s4 s2.

%2
\time 5/4
\numTSig "5" "4" #0 #tsigpadx #tsigpady
s4.. s16%\secondsMark #1.2 #secPad "5ˮ" #12
 s4 s2

 %10
 \time 3/8
 %\numTSig \markup{ \fontsize #longtsigsize "1+¹⁄₂"} "4" #0 #(+ tsigpadx 0) #tsigpady
 \numTSig "3" "8" #0 #tsigpadx #tsigpady
 s4
 s8\timemodul {\modBeam c8} {c4} {c4} "90" #10 #tmodpady

 %40
 \time 6/20
 \numTSig "6" "20" #0 #tsigpadx #tsigpady
 s4*6/5
 \bar ":"
 \time 1/4
 \numTSig "5" "20" #0 #tsigpadx #tsigpady
 s4
 \bar ":"
 \time 4/20
 \numTSig "4" "20" #0 #tsigpadx #tsigpady
 s4*4/5
 \bar ":"
 \numTSig "3" "20" #0 #tsigpadx #tsigpady
 \time 3/20
 s4*2/5

 s4*1/5\timemodulapr {\noTupBracket \times 4/5 {  \modBeam c16}} {\noTupBracket \times 2/3 {  \modBeam c8}} {c4} "107" #10 #tmodpady
 \set Score.currentBarNumber = #41
 %41
 \time 2/4
 \numTSig "2" "4" #0 #tsigpadx #tsigpady
 s2

 }
