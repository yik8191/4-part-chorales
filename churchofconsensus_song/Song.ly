% http://lilypond.org/doc/v2.18/Documentation/snippets/templates
% Vocal ensemble template with lyrics aligned below and above the staves
\version "2.18.2"

global = {
  \key d \minor
  \time 4/4
}

sopMusic = \relative c'' {
  % c4 c c8[( b)] c4
  d4 f a g f8 e f4 g a     
  a e g8 f e4 f8 e d4 cis d     
  e f f e e8 d c4 b8 a gis4    
  d'4 d a'8 g f e d c b4 b a4    
  c e g f f e f g
  a a e f e d8 c b4 c
  e f f e8 d cis4 d d e
  d d f e d d cis d4 % perfect in d minor
}
sopWords = \lyricmode {
  hi hi hi hi
}

altoMusic = \relative c' {
  % e4 f d e
  r4 r r r r r r r
}
altoWords = \lyricmode {
  ha ha ha ha
}

tenorMusic = \relative c' {
  % g4 a f g
  r4 r r r r r r r 
}
tenorWords = \lyricmode {
  hu hu hu hu
}

bassMusic = \relative c {
  % c4 c g c
  d d c bes bes a c f,   % F: IV-V-I
  f g bes a d a a d    % d: Ic-V-I
  c d b c a a c e    % a: I-Ib-V
  a, gis e a c d e a,   % a: ii7b-V-I
  c c g a d c8 b a4 g    % imperfect in C
  c d c b g f g c    % C: ii7b-V-I
  c b d g, a d, f a  % D: I-Ib-V
  d, f b c e, a a d,   % perect in d
  % perfect in a minor
}
bassWords = \lyricmode {
  ho ho ho ho
}

\score {
  \new ChoirStaff <<
    \set ChoirStaff.midiInstrument = #"church organ" 
    \new Staff = "women" <<
      \new Voice = "sopranos" {
	\voiceOne << \global \sopMusic >>
      }
      \new Voice = "altos" {
	\voiceTwo << \global \altoMusic >>
      }
    >>
    \new Lyrics \with { alignAboveContext = #"women" }
      \lyricsto "sopranos" \sopWords
    \new Lyrics \with { alignBelowContext = #"women" }
      \lyricsto "altos" \altoWords
    % we could remove the line about this with the line below, since
    % we want the alto lyrics to be below the alto Voice anyway.
    % \new Lyrics \lyricsto "altos" \altoWords

    \new Staff = "men" <<
      \clef bass
      \new Voice = "tenors" {
	\voiceOne << \global \tenorMusic >>
      }
      \new Voice = "basses" {
	\voiceTwo << \global \bassMusic >>
      }
    >>
    \new Lyrics \with { alignAboveContext = #"men" }
      \lyricsto "tenors" \tenorWords
    \new Lyrics \with { alignBelowContext = #"men" }
      \lyricsto "basses" \bassWords
    % again, we could replace the line above this with the line below.
    % \new Lyrics \lyricsto "basses" \bassWords
  >>
  \midi {
    \tempo 4 = 72
  }
  \layout {
  }
}
