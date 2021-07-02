CLAUDIUS ROMAN 0.5 
Copyright 2005 by Geoffrey Washburn 

Introduction
------------

Claudius Roman is a san-serif Roman font.  I created it primarily for the
purpose of teaching myself METAFONT, and it later occurred to me that it
would make a good basis for others learning to use METAFONT by providing
them with a very simple and well-commented implementation of a typeface.
I felt that as a Roman font it deserved a Roman name, and when considering
the options I came across Claudius, from the Roman family name which was
derived from Latin "claudus" meaning "lame" or "crippled".  This seemed apt
for a typeface that is not really intended for use in actual documents.

Claudius Roman is also crippled in a few other senses.  At present it
only provides uppercase glyphs, and a comma and a period.  In some sense
this is fitting because lowercase Latin glyphs only evolved later.
Arabic numerals are not included either.  However, I have plans to
develop an accompanying set of lowercase and numeric glyphs, thus have
chosen to call this release version 0.5 to indicate that it is not yet
"complete".

Another thing Claudius Roman is lacking is proper hinting.  Partly
this is because I do not yet fully understand all of the METAFONT
hinting/discretization mechanisms, and also because I feel at the moment
that adding hinting might make the METAFONT code more difficult for
novices to comprehend.  Therefore, if you actually had a desire to use
Claudius Roman in practice you really should only do so in mediums where
the resolution is high enough that it will not matter quite so much.
I have not tried it, but I can imagine it will look terrible when used
as a screen font.

Finally, METAFONT can only produce bitmap fonts, which are generally
fine for printing, but tend to look rather bad when viewed inside Adobe
Acrobat Reader, for example.  By default Claudius Roman is built as an
outline font using the "mftrace" utility, which renders the font at
a high resolution and then traces it.  This produces rather pleasing
results, but is not entirely true to the intended design.  For future
releases I plan to examine using the METATYPE1 tools to generate Type1
fonts directl using METAPOST.

Claudius Roman is based loosely on the calligraphic teachings found
in Margaret Shepard's book _Learn Calligraphy: The Complete Book of
Lettering and Design_.

Using Claudius Roman in TeX
---------------------------

To make use of the provided Type1 fonts in a TeX document, simply include
the claudius package as such

\usepackage{claudius}

You can then use the standard "New Font Selection Scheme" commands to
use the font.  For example, the following commands will selection a
seventeen point version bold of Claudius Roman with an eighteen point
skip between baselines

\fontencoding{T1}\fontfamily{Claudius}\fontseries{b}\fontsize{17}{18}\selectfont

Alternately, the following with selection a ten point medium weight
version of Claudius Roman with an eleven point skip between baselines.

\fontencoding{T1}\fontfamily{Claudius}\fontseries{m}\fontsize{10}{11}\selectfont

Note that the Type1 fonts use the Cork ("T1") encoding.  If you
install the fonts and the support files in a location other than the
the document being built, you may need to add that location to the
TEXINPUTS, TEXFONTS, and T1FONTS environment variables.  Alternately,
you can configure kpathsea to find them by default, but that is beyond
the scope of this document.

Licensing
---------

Claudius Roman is distributed under the terms of the GNU
General Public License with the experimental "font exception"
written by David Turner.  For more information look here:
http://www.fsf.org/blogs/licensing/20050425novalis.  

The whole font copyright and licensing situation is a bit of a mess.
The GPL definitely applies here because Claudius Roman is produced from a
program written in the METAFONT language.  Therefore one might expect that
distributing the resulting "binary" to have the same restrictions that
there are on distributing the "binary" of any GPLed program.  However,
that is only one possible interpertation.  The other interpertation
is that the METAFONT program Claudius Roman is very much like a GPLed
compiler, you give it some inputs and in produces an output and the output
is available under any license you would like.  I am not an intellectual
property lawyer but my intent is that if you make changes to the Claudius
Roman "program" and redistribute them, they must be redistributed under
the GPL.  You are free to use the bitmap our outline fonts you produce
from the program for any purpose you please.

If you do make improvements to Claudius Roman I would appreciate you
sending me patches so that I can consider incorporating them for others
to benefit from.  Lastly, it if you do redistribute modified versions
of Claudius Roman, it would be helpful if you indicate in some fashion
that they are modified, so that users do not become confused as to what
to expect from their output.

