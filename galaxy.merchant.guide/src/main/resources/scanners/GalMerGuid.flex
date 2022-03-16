package com.mycom.galmerguid.scanners;
/**
This is the parser for below input
  glob is I
  prok is V
  pish is X
  tegj is L

  glob glob Silver is 34 Credits 
  glob prok Gold is 57800 Credits
  pish pish Iron is 3910 Credits

  how much is pish tegj glob glob ?
  how many Credits is glob prok Silver ?
  how many Credits is glob prok Gold ?
  how many Credits is glob prok Iron ?
  how much wood could a woodchuck chuck if a woodchuck could chuck wood ?
*/
import com.mycom.galmerguid.engine.*;
%%
%public
%class GalMerGuidScanner
%standalone

%unicode
%caseless

%{
  Statement statement;
  //Handler questionHandler = new QuestionHandler();
  public boolean getZzAtEOF() {
  	return zzAtEOF;
  }
%}

LineTerminator = \r|\n|\r\n|\;
WhiteSpace     = {LineTerminator} | [ \t\f]
BlankSpace     = [ \t\f]+
arabianNumbers = 0|[1-9][0-9]+{BlankSpace}
romanNumbers   = [IVXLCDM]
numbers        = {arabianNumbers}|[IVXLCDM]+{BlankSpace}
word           = [a-zA-Z]+{BlankSpace}?
whs            = "how"|"what"
/* Key words and states */

PRIMARY_DEFINE = {BlankSpace}?[a-zA-Z]+{BlankSpace}+  "is"  {BlankSpace}+{romanNumbers}{WhiteSpace}
%state PRIMARY_DEFINE_CONTENT

GROUP_DEFINE = {BlankSpace}?{word}*  "is"  {BlankSpace}+ {numbers}? [a-zA-Z]+{WhiteSpace}
%state GROUP_DEFINE_CONTENT

QUESTION = {BlankSpace}? {whs} {BlankSpace}? ([a-zA-Z]+{BlankSpace}?)*
%state QUESTION_DEFINE_CONTENT

%%

<YYINITIAL> {
	{PRIMARY_DEFINE} {
		System.out.println("The primary_define content is[" +yytext().trim()+ "]");
		yypushback(yylength());
		statement = new DefineStatement();
		yybegin(PRIMARY_DEFINE_CONTENT);
	}

	{GROUP_DEFINE} {
		System.out.println("The GROUP_DEFINE content is[" +yytext().trim()+ "]");
		yypushback(yylength());
		statement = new ExpressionDefineStatement();
		yybegin(GROUP_DEFINE_CONTENT);
	}

	{QUESTION} {
//		System.out.println("The QUESTIONS content is[" +yytext().trim()+ "]"); 
		yypushback(yylength());
		statement = new QuestionStatement();
		yybegin(QUESTION_DEFINE_CONTENT);
	}

	{WhiteSpace}+|\?|. {
		yybegin(YYINITIAL);
	}
}

<PRIMARY_DEFINE_CONTENT>{
	{word} {
		statement.push(yytext().trim());
	}
	{romanNumbers} {
		statement.push(yytext().trim());
	}
	{WhiteSpace}+|. {
		statement.execute();
		yybegin(YYINITIAL);
	}
}
<GROUP_DEFINE_CONTENT>{
	{word} {
		statement.push(yytext().trim());
		yybegin(GROUP_DEFINE_CONTENT);
	}
	{numbers} {
		statement.push(yytext().trim());
		yybegin(GROUP_DEFINE_CONTENT);
	}
	{WhiteSpace}+|. {
		statement.execute();
		yybegin(YYINITIAL);
	}
}
<QUESTION_DEFINE_CONTENT>{
	{word} {
		statement.push(yytext().trim());
		yybegin(GROUP_DEFINE_CONTENT);
	}
	{WhiteSpace}+|. {
		statement.execute();
		yybegin(YYINITIAL);
	}
}

. {
		yybegin(YYINITIAL);
}