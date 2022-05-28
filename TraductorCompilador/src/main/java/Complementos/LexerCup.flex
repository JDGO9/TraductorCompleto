package Complementos;
import javax.swing.table.DefaultTableModel;
import static Complementos.Tokens.*;
import java_cup.runtime.*;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
%public
L=[a-zA-Z_]+
D=[0-9]+

espacio=[ ,\t,\r]+
%{
      private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}



/* Sustantivos */
( action | age | air | animal | answer | apple | art | baby | back | ball |bank|bed|bill|bird|blood|boat|body|bone|book|bottom|box
|bottom|box|boy|brother|building|business|call|capital|case|cat|cause|cent|center|century|chance|change|check|child|children|church
|circle|city|class|clothes|cloud|coast|color|company|consonant|copy|corn|cotton|country|course|cow|crowd|day|dictionary|direction|distance
|doctor|dollar|door|ear|earth|egg|energy|example|experience|eye|game|garden|gas|girl|glass|gold|government|grass|group|hair|hand|hat|head
|heart|heat|history|hole|home|horse|hour|house|ice|idea|inch|industry|information|insect|interest|iron|island|job|key|lake|land|language
|law|leg|level|lie|life|light|line|list|machine|man|men|map|material|meat|middle|mile|milk|mind|minute|money|month|moon|mouth|music|nation
|night|nose|note|number|object|ocean|office|oil|page|pair|paper|paragraph|park|part|party|past|person|people|pound|president|problem|product
|property|question|race|radio|rain|reason|record|region|ring|river|road|rock|row|rule|sand|school|science|sea|seat|second|sentence|set|side
|sign|sister|size|skin|snow|soldier|solution|son|spring|square|star|state|stop|street|student|sugar|sun|village|vowel|war|weather|weight|wife|window
|winter|woman|word|world|year) {return new Symbol(sym.Sustantivo, yychar, yyline, yytext());}

/*advetivos posesivos*/
(my|your|his|her|its|our|their) {return new Symbol(sym.Adjetivo_Posesivo, yychar, yyline, yytext());}

/*adjetivos demostrativos*/
(this|these|that|those) {return new Symbol(sym.Adjetivo_Demostrativo, yychar, yyline, yytext());}

/*adjetivos calificativos*/
(honest|intelligent|optimistic|brave|friendly|tolerant|sensible|generous|responsible|hard-working|adorable|dishonest
|foolish|pessimistic|coward|rude|intolerant|senseless|selfish|irresponsible|lazy|detestable|old|modern|updated|fast|past
|young|ancient|outdated|slow|future|cold|warm|hot|cool|beautiful|clean|elegant|chubby|pretty|attractive|horrible|dirty|informal
|skinny|ugly|unattractive|red|yellow|blue|gray|white|orange|green|purple|black|brown|crazy|sick|drunk|asleep|hungry|energetic
|dead|open|single|sane|healthy|sober|awake|full|tired|alive|closed|married|hard|rough|solid|wet|slippery|soft|smooth|liquid|dry
|sticky|happy|angry|proud|grumpy|jealous|scary|sad|calm|embarrassed|nice|faithful|peaceful) {return new Symbol(sym.Adjetivo_Calificativo, yychar, yyline, yytext());}


/*Adjetivos indefinidos*/
(all|any|both|each|either|enough|few|less|little|much|more|many|other|others|several|some|such) {return new Symbol(sym.Adjetivo_Indefinido, yychar, yyline, yytext());}

/*numerales cardinales*/
(zero|one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|thirteen|fourteen|fifteen|sixteen|seventeen|eighteen|nineteen
|twenty|thirty|fourty|fifty|sixty|seventy|eighty|ninety|hundred|thousand|million) {return new Symbol(sym.Numeral_Cardinal, yychar, yyline, yytext());}

/*numerales ordinales*/
(first|second|third|fourth|fifth|sixth|seventh|eighth|nintch|tenth|eleventh|twelfth|thirteenth|fourteenth|fifteenth|sixteenth|seventeenth
|eighteenth|nineteenth|twentieth|thirtieth|fortieth|sixtieth|seventieth|eightieth|ninetieth|hundredth|millionth) {return new Symbol(sym.Numeral_Ordinal, yychar, yyline, yytext());}

/*articulo definido*/
("the") {return new Symbol(sym.Articulo_Definido, yychar, yyline, yytext());}

/*articulo indefinido*/
(a|an) {return new Symbol(sym.Articulo_Indefinido, yychar, yyline, yytext());}

/*pronombres personales*/
(i|you|he|she|it|we|they|me|him|her|it|us|them|yours|his|hiers|its|ours|theirs
|myself|yourself|himself|herself|itself|ourselves|themselves|somebody|someone|something
|sometime|somehow|anybody|anyone|anything|anytime|anyhow|nobody|none|nothing|everybody
|everyone|everything) {return new Symbol(sym.Pronombre_Personal, yychar, yyline, yytext());}

/*pronombres demostrativos*/
(this|that|these|those) {return new Symbol(sym.Pronombre_Demostrativo, yychar, yyline, yytext());}

/*pronombre interrogativos*/
(where|when|why|how|who|whom|whose|what|which) {return new Symbol(sym.Pronombre_Interrogativo, yychar, yyline, yytext());}

/*Verbo*/
("to accept"|"to ask"|"to be"|"to begin"|"to become"|"to believe"|"to break"|"to bring"|"to build"
|"to leave"|"to listen"|"to live"|"to look"|"to lose"|"to make"|"to meet"|"to move"|"to need"|"to buy"
|"to call"|"to cancel"|"to carry"|"to catch"|"to change"|"to choose"|"to clean"|"to close"|"to open"|"to pay"
|"to play"|"to put"|"to read"|"to reply"|"to run"|"to say"|"to see"|"to seem"|"to come"|"to cut"|"to dance"|"to decide"
|"to do"|"to draw"|"to drink"|"to drive"|"to eat"|"to explain"|"to fall"|"to sell"|"to send"|"to set"|"to show"
|"to sign"|"to sit"|"to sleep"|"to speak"|"to spell"|"to spend"|"to stand"|"to feel"|"to fill"|"to find"|"to finish"
|"to fit"|"to fix"|"to fly"|"to forget"|"to get"|"to give"|"to go"|"to start"|"to stop"|"to study"|"to take"|"to talk"
|"to teach"|"to tell"|"to think"|"to try"|"to turn"|"to understand"|"to happen"|"to use"|"to have"|"to wait"|"to hear"
|"to walk"|"to hit"|"to want"|"to hurt"|"to watch"|"to keep"|"to win"|"to know"|"to work"|"to let"|"to worry"|"to learn"
|"to write") {return new Symbol(sym.Verbo, yychar, yyline, yytext());}


/*Adverbios de tiempo*/
(already|earlier|early|just|late|later|now|someday|soon|still|today|tomorrow|yesterday) {return new Symbol(sym.Adverbio_Tiempo, yychar, yyline, yytext());}

/*Adverbios de lugar*/
(above|abroad|ahead|away|behind|below|beyond|far|here|in|inside|near|opposite|out|there) {return new Symbol(sym.Adverbio_Lugar, yychar, yyline, yytext());}

/*Adverbios de cantidad*/
(almost|enough|entirely|failry|hardly|lots|less|more|quite|rather|scarcely|so|too|very|way) {return new Symbol(sym.Adverbio_Cantidad, yychar, yyline, yytext());}

/*Adverbios de modo*/
(badly|carefully|carelessly|clearly|easily|fast|happily|hard|naturally|separately|simply|slowly|well
|worse|wrong) {return new Symbol(sym.Adverbio_Modo, yychar, yyline, yytext());}

/*Adverbios de afirmacion*/
(certainly|definitely|indeed|likely|naturally|obviously|"of corse"|really|surely) {return new Symbol(sym.Adverbio_Afirmacion, yychar, yyline, yytext());}

/*Adverbios de negacion*/
(no|not|never|"not at all") {return new Symbol(sym.Adverbio_Negacion, yychar, yyline, yytext());}

/*Adverbios de duda*/
(perhaps|maybe|probably) {return new Symbol(sym.Adverbio_Duda, yychar, yyline, yytext());}

/*Preposiciones*/
(about|after|around|before|beyond|by|during|for|past|since|throughout|until|across|along|"away from"|down
|from|into|off|onto|"out of"|over|past|towards|under|up|in|at|on|ago|circa|per|of|with) {return new Symbol(sym.Preposicion, yychar, yyline, yytext());}

/*conjuciones cordinantes*/
(and|"as well as"|both|but|or|however|moreover|neither|nor|nevertheless|"now that"
|so|then|therefore|yet) {return new Symbol(sym.Conjucion_Cordinantes, yychar, yyline, yytext());}

/*conjuciones subordinantes*/
(although|as|"as long as"|"as soon as"|because|"even if"|"even though"
|if|"in case"|"in order to"|"now that"|once|since|"so that"|unless|until
|when|whereas|whether|"whether or") {return new Symbol(sym.Conjucion_Subordinante, yychar, yyline, yytext());}

/*interjecciones*/
(alas|phew|boo|jeez|ay|duh|huh|eh|aah|ah|er|gee|ouch|woah|oh|ugh) {return new Symbol(sym.Interjeccion, yychar, yyline, yytext());}

/*contracciones*/
(let's|we'll|i'm|you're|he's|she's|we're|they're|isn't|wasn't
|hasn't|doesn't|hadn't|couldn't|shouldn't|needn't|aren't|weren't|haven't
|don't|didn't|mustn't|wouldn't|oughtn't|can't|shan't|won't|'ve|'s|'d|'ll
|o'clock|y'all|g'day) {return new Symbol(sym.Contraccion, yychar, yyline, yytext());}

(is) {return new Symbol(sym.Verbo_Singular, yychar, yyline, yytext());}
(are) {return new Symbol(sym.Verbo_Plural, yychar, yyline, yytext());}


/*signos de puntuacion*/
("."|"¡"|"!"|"¿"|"?"|":"|";"|"..."|"-"|"—"|"("|")"|"["|"]"|"{"|"}"|"«"|"»"|“|”|‘|’) {return new Symbol(sym.Signo_Puntuacion, yychar, yyline, yytext());}
/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}

/*otras palabras*/
{L}({L}|{D})* {return new Symbol(sym.ERROR, yychar, yyline, yytext());}


/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}



