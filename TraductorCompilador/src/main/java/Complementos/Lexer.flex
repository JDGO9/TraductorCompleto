package Complementos;
import javax.swing.table.DefaultTableModel;
import static Complementos.Tokens.*;
import Interfaz.Compilador;

%%
%class Lexer
%type Tokens
%line
%char
%column
%public
%full
L=[a-zA-Z_]+
D=[0-9]+

espacio=[ ,\t,\r]+
%{
    public String lexeme;
    public static Compilador principals= new Compilador();
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
|winter|woman|word|world|year) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Sustantivo",yytext(),yyline,yycolumn});lexeme=yytext(); return sustantivo;}

/*advetivos posesivos*/
(my|your|his|her|its|our|their) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Adjetivo Posesivo",yytext(),yyline,yycolumn});lexeme=yytext();return adjetivo_posesivo;}

/*adjetivos demostrativos*/
(this|these|that|those) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Adjetivo Demostrativo",yytext(),yyline,yycolumn});lexeme=yytext(); return adjetivo_demostrativo;}

/*adjetivos calificativos*/
(honest|intelligent|optimistic|brave|friendly|tolerant|sensible|generous|responsible|hard-working|adorable|dishonest
|foolish|pessimistic|coward|rude|intolerant|senseless|selfish|irresponsible|lazy|detestable|old|modern|updated|fast|past
|young|ancient|outdated|slow|future|cold|warm|hot|cool|beautiful|clean|elegant|chubby|pretty|attractive|horrible|dirty|informal
|skinny|ugly|unattractive|red|yellow|blue|gray|white|orange|green|purple|black|brown|crazy|sick|drunk|asleep|hungry|energetic
|dead|open|single|sane|healthy|sober|awake|full|tired|alive|closed|married|hard|rough|solid|wet|slippery|soft|smooth|liquid|dry
|sticky|happy|angry|proud|grumpy|jealous|scary|sad|calm|embarrassed|nice|faithful|peaceful) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Adjetivo calificativo",yytext(),yyline,yycolumn});lexeme=yytext();return adjetivo_calificativo;}


/*Adjetivos indefinidos*/
(all|any|both|each|either|enough|few|less|little|much|more|many|other|others|several|some|such) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Adjetivo indefinido",yytext(),yyline,yycolumn});lexeme=yytext(); return adjetivo_indefinido;}

/*numerales cardinales*/
(zero|one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|thirteen|fourteen|fifteen|sixteen|seventeen|eighteen|nineteen
|twenty|thirty|fourty|fifty|sixty|seventy|eighty|ninety|hundred|thousand|million) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Numero Cardinal",yytext(),yyline,yycolumn});lexeme=yytext();return numeral_cardinal;}

/*numerales ordinales*/
(first|second|third|fourth|fifth|sixth|seventh|eighth|nintch|tenth|eleventh|twelfth|thirteenth|fourteenth|fifteenth|sixteenth|seventeenth
|eighteenth|nineteenth|twentieth|thirtieth|fortieth|sixtieth|seventieth|eightieth|ninetieth|hundredth|millionth) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Numero Ordinal",yytext(),yyline,yycolumn});lexeme=yytext();return numeral_ordinal;}

/*articulo definido*/
("the") {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Articulo definido",yytext(),yyline,yycolumn});lexeme=yytext();return articulo_definido;}

/*articulo indefinido*/
(a|an) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Articulo indefinido",yytext(),yyline,yycolumn});lexeme=yytext();return articulo_indefinido;}

/*pronombres personales*/
(i|you|he|she|it|we|they|me|him|her|it|us|them|yours|his|hiers|its|ours|theirs
|myself|yourself|himself|herself|itself|ourselves|themselves|somebody|someone|something
|sometime|somehow|anybody|anyone|anything|anytime|anyhow|nobody|none|nothing|everybody
|everyone|everything) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Pronombre personal",yytext(),yyline,yycolumn});lexeme=yytext();return pronombre_personal;}

/*pronombres demostrativos*/
(this|that|these|those) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Pronombre Demostrativo",yytext(),yyline,yycolumn});lexeme=yytext(); return pronombre_demostrativo;}

/*pronombre interrogativos*/
(where|when|why|how|who|whom|whose|what|which) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Pronombre interrogativo",yytext(),yyline,yycolumn});lexeme=yytext(); return pronombre_interrogativo;}

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
|"to write") {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Verbo",yytext(),yyline,yycolumn});lexeme=yytext(); return verbo;}


/*Adverbios de tiempo*/
(already|earlier|early|just|late|later|now|someday|soon|still|today|tomorrow|yesterday) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Adverbio tiempo",yytext(),yyline,yycolumn});lexeme=yytext(); return adverbio_tiempo;}

/*Adverbios de lugar*/
(above|abroad|ahead|away|behind|below|beyond|far|here|in|inside|near|opposite|out|there) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Adverbio lugar",yytext(),yyline,yycolumn});lexeme=yytext(); return adverbio_lugar;}

/*Adverbios de cantidad*/
(almost|enough|entirely|failry|hardly|lots|less|more|quite|rather|scarcely|so|too|very|way) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Adverbio cantidad",yytext(),yyline,yycolumn});lexeme=yytext(); return adverbio_cantidad;}

/*Adverbios de modo*/
(badly|carefully|carelessly|clearly|easily|fast|happily|hard|naturally|separately|simply|slowly|well
|worse|wrong) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Adverbio modo",yytext(),yyline,yycolumn});lexeme=yytext();return adverbio_modo;}

/*Adverbios de afirmacion*/
(certainly|definitely|indeed|likely|naturally|obviously|"of corse"|really|surely) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Adverbio afirmacion",yytext(),yyline,yycolumn});lexeme=yytext(); return adverbio_afirmacion;}

/*Adverbios de negacion*/
(no|not|never|"not at all") {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Adverbio negacion",yytext(),yyline,yycolumn});lexeme=yytext(); return adverbio_negacion;}

/*Adverbios de duda*/
(perhaps|maybe|probably) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Adverbio duda",yytext(),yyline,yycolumn});lexeme=yytext(); return adverbio_duda;}

/*Preposiciones*/
(about|after|around|before|beyond|by|during|for|past|since|throughout|until|across|along|"away from"|down
|from|into|off|onto|"out of"|over|past|towards|under|up|in|at|on|ago|circa|per|of|with) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Preposicion",yytext(),yyline,yycolumn});lexeme=yytext();return preposicion;}

/*conjuciones cordinantes*/
(and|"as well as"|both|but|or|however|moreover|neither|nor|nevertheless|"now that"
|so|then|therefore|yet) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Conjucion cordinante",yytext(),yyline,yycolumn});lexeme=yytext();return conjucion_cordinante;}

/*conjuciones subordinantes*/
(although|as|"as long as"|"as soon as"|because|"even if"|"even though"
|if|"in case"|"in order to"|"now that"|once|since|"so that"|unless|until
|when|whereas|whether|"whether or") {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Conjucion subordinante",yytext(),yyline,yycolumn});lexeme=yytext(); return conjucion_subordinante;}

/*interjecciones*/
(alas|phew|boo|jeez|ay|duh|huh|eh|aah|ah|er|gee|ouch|woah|oh|ugh) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Interjeccion",yytext(),yyline,yycolumn});lexeme=yytext(); return interjeccion;}

/*contracciones*/
(let's|we'll|i'm|you're|he's|she's|we're|they're|isn't|wasn't
|hasn't|doesn't|hadn't|couldn't|shouldn't|needn't|aren't|weren't|haven't
|don't|didn't|mustn't|wouldn't|oughtn't|can't|shan't|won't|'ve|'s|'d|'ll
|o'clock|y'all|g'day) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Contracciones",yytext(),yyline,yycolumn});lexeme=yytext(); return contraccion;}

(is) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Verbo_Singular",yytext(),yyline,yycolumn});lexeme=yytext();lexeme=yytext(); return Verbo_Singular;}
(are) {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Verbo_Plural",yytext(),yyline,yycolumn});lexeme=yytext();lexeme=yytext(); return Verbo_Plural;}

/*signos de puntuacion*/
("."|"¡"|"!"|"¿"|"?"|":"|";"|"..."|"-"|"—"|"("|")"|"["|"]"|"{"|"}"|"«"|"»"|“|”|‘|’) {lexeme=yytext(); return signo_puntuacion;}
/* Numero */
("(-"{D}+")")|{D}+ {DefaultTableModel modelo1= (DefaultTableModel) principals.tabla_s.getModel(); modelo1.addRow(new Object[]{"Signod de puntuacion",yytext(),yyline,yycolumn});lexeme=yytext(); return Numero;}

/*otras palabras*/
{L}({L}|{D})* {DefaultTableModel modeloe= (DefaultTableModel) principals.jTable1.getModel(); modeloe.addRow(new Object[]{"Palabra no definida en el lexico ,error " +yytext()+" linea "+yyline+" columna "+yycolumn,"Lexico"});return ERROR;}



/* Error de analisis */
 . {DefaultTableModel modeloe= (DefaultTableModel) principals.jTable1.getModel(); modeloe.addRow(new Object[]{"No definido en el lexico ,error " +yytext()+" linea "+yyline+" columna "+yycolumn,"Lexico"});return ERROR;}


