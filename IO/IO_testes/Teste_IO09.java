// lista de dependencias

import IO.*;

/**
  *  Teste_IO09 - Number package
  *
  *  Copyright (c) 2016 by PUC-Minas / DCC
  *  All rights reserved.
  *
  * @author  PUC-Minas/DCC
  * @version 0.9i
  */

public class Teste_IO09
{
  public static void main ( String [] args )
  {
   // identification
      IO.println ( "Test radix functions" );

   // test parts of number
      IO.println ( );
      IO.println ( "Parts of number" );

      IONumber b2  = new IONumber ( "1101", 2 );
      IONumber b10 = new IONumber ( 13.75 );

      IO.println ( );
      IO.println ( "b2  = " + b2  + " = " + b2.toDecimal( ) );
      IO.println ( "b10 = " + b10 + " = " + b10.toRadix( 2 )   );
      IO.println ( "b10 = " + b10 + " = " + b10.clone(  )   );

      IO.println ( );
      IO.println ( "b2  = " + b2  + " = " +
                    b2.getSignal( ) + " " + b2.getValue( ) + " (" + b2.getRadix( ) + ")" );

      if ( b10.hasFraction( ) )
        IO.println ( "b10  = " +
                     b10.getSignal( )+ " " + b10.getIntPart( ) + " + 0." + b10.getFracPart( ) +
                     " = " + b10.toDecimal ( ) );

      b2 = new IONumber ( "-0.11", 2 );

      IO.println ( );
      IO.println ( "b2  = " + b2  + " = " +
                    b2.getSignal( ) + " " + b2.getValue( ) + " (" + b2.getRadix( ) + ")" );

      if ( b2.hasFraction( ) )
        IO.println ( "b2  = " +
                     b2.getSignal( )+ " " + b2.getIntPart( ) + " + 0." + b2.getFracPart( ) +
                     " = " + b2.toDecimal ( ) );

      IO.pause ( );

   // test conversion between radixes
      IO.println ( );
      IO.println ( "Conversion between radixes" );

      IO.println ( );
      IO.println ( "b2  = " + b2  + " = " + b2.toDecimal( ) );
      IO.println ( "b10 = " + b10 + " = " + b10.toRadix( 2 )   );


      b2  = new IONumber ( "1101", 2 );

      IO.println ( "bin2dec  ("+b2+") = " + b2.toRadix( 10 ) );
      IO.println ( "bin2quart("+b2+") = " + b2.toRadix(  4 ) );
      IO.println ( "bin2octal("+b2+") = " + b2.toRadix(  8 ) );
      IO.println ( "bin2hex  ("+b2+") = " + b2.toRadix( 16 ) );

      b2  = b10.toRadix ( 2 );

      IO.pause ( );

      IO.println ( "bin2dec  ("+b2+") = " + b2.toRadix( 10 ) );
      IO.println ( "bin2quart("+b2+") = " + b2.toRadix(  4 ) );
      IO.println ( "bin2octal("+b2+") = " + b2.toRadix(  8 ) );
      IO.println ( "bin2hex  ("+b2+") = " + b2.toRadix( 16 ) );

      IO.pause ( );

   // test arithmetic operations
      IO.println ( );
      IO.println ( "Test arithmetic operations" );
      IO.println ( );

      IONumber b2a = new IONumber ( "1101.001", 2 );
      IONumber b2b = new IONumber ( "1101.001", 2 );
      IONumber b2c = new IONumber ( "0"       , 2 );

      b2c = b2a.add( b2b );

      IO.println ( ""+b2a+" + "+b2b+" = "+b2c );

      b2c = b2a.sub( b2b );

      IO.println ( ""+b2a+" - "+b2b+" = "+b2c );

      b2c = b2a.mul( b2b );

      IO.println ( ""+b2a+" * "+b2b+" = "+b2c );

      b2c = b2a.div( b2b );

      IO.println ( ""+b2a+" / "+b2b+" = "+b2c );

      IONumber h2a = new IONumber ( "1101.001",  2 );
      IONumber h2b = new IONumber ( "D.2"     , 16 );
      IONumber h2c = new IONumber ( "0"       ,  2 );

      IO.pause ( );

      h2c = (h2a.add( h2b )).toRadix( 16 );

      IO.println ( ""+h2a+" + "+h2b+" = "+h2c );

      IO.pause ( );

      b2a = new IONumber ( "-101", 2 );
      b2b = new IONumber (  "11", 2 );

      b2a = b2a.abs ( );

      IO.println ( ""+b2a+"->"+b2a );

      b2c = b2a.pow ( b2b );

      IO.println ( ""+b2a+"^"+b2b+" = "+b2c );

      b2a = b2c.nroot ( b2b );

      IO.println ( ""+b2c+"^1/"+b2b+" = "+b2a );

      IO.pause ( );

      b2a = new IONumber ( "101.1101", 2 );
//      b2a = new IONumber ( "101", 2 );

      b2b = b2a.cpl(2);
      b2c = b2a.cpl(2, 8);

      IO.println ( "C2("+b2a+") = "+b2b+" = "+b2c );

      b2a = new IONumber ( "-101.1101", 2 );
//      b2a = new IONumber ( "-101", 2 );

      b2b = b2a.cpl(2);
      b2c = b2a.cpl(2, 8);

      IO.println ( "C2("+b2a+") = "+b2b+" = "+b2c );

      b2b = b2a.cpl(1);
      b2c = b2a.cpl(1, 8);

      IO.println ( "C1("+b2a+") = "+b2b+" = "+b2c );

      IO.pause ( );

      IONumber d2a = new IONumber ( 5 );
      IONumber d2b = new IONumber (   );
      IONumber d2c = new IONumber (   );

      d2b = d2a.cpl(10);
      d2c = d2a.cpl(10, 8);

      IO.println ( "C10("+d2a+") = "+d2b+" = "+d2c );

      d2a = new IONumber ( -5 );

      d2b = d2a.cpl(10);
      d2c = d2a.cpl(10, 8);

      IO.println ( "C10("+d2a+") = "+d2b+" = "+d2c );

      d2a = new IONumber ( -5 );

      d2c = d2a.cpl( 9, 8);

      IO.println ( "C9 ("+d2a+") = "+d2c );

      d2c = d2a.neg( );

      IO.println ( ""+d2a+" = "+d2c );

      IO.pause ( );

   // test static arithmetic operations
      IO.println ( );
      IO.println ( "Test static operations" );
      IO.println ( );
      b2a = new IONumber (  "11.0101" , 2 );
      b2b = new IONumber ( "101.00111", 2 );

      IO.println ( " - "+b2a+" = "+IONumber.let ( "-" , b2a ) );
      IO.println ( " ! "+b2a+" = "+IONumber.let ( "!" , b2a ) );
      IO.println ( " ~ "+b2a+" = "+IONumber.let ( "~" , b2a ) );

      IO.println ( );

      IO.println ( ""+b2a+"  +  "+b2b+" = "+IONumber.let  ( b2a, "+"  , b2b ) );
      IO.println ( ""+b2a+"  -  "+b2b+" = "+IONumber.let  ( b2a, "-"  , b2b ) );
      IO.println ( ""+b2a+"  *  "+b2b+" = "+IONumber.let  ( b2a, "*"  , b2b ) );
      IO.println ( ""+b2a+"  /  "+b2b+" = "+IONumber.let  ( b2a, "/"  , b2b ) );
      IO.println ( ""+b2a+"  %  "+b2b+" = "+IONumber.let  ( b2a, "%"  , b2b ) );
      IO.println ( ""+b2a+" **  "+b2b+" = "+IONumber.let  ( b2a, "**" , b2b ) );
      IO.pause   ( );
      IO.println ( ""+b2a+"  &  "+b2b+" = "+IONumber.let  ( b2a, "&"  , b2b ) );
      IO.println ( ""+b2a+"  |  "+b2b+" = "+IONumber.let  ( b2a, "|"  , b2b ) );
      IO.println ( ""+b2a+"  ^  "+b2b+" = "+IONumber.let  ( b2a, "^"  , b2b ) );
      IO.println ( ""+b2a+" shl "+b2b+" = "+IONumber.let  ( b2a, "shl", b2b ) );
      IO.println ( ""+b2a+" shr "+b2b+" = "+IONumber.let  ( b2a, "shr", b2b ) );
      IO.pause   ( );
      IO.println ( ""+b2a+"  <  "+b2b+" = "+IONumber.let  ( b2a, "<"  , b2b ) );
      IO.println ( ""+b2a+"  >  "+b2b+" = "+IONumber.let  ( b2a, ">"  , b2b ) );
      IO.println ( ""+b2a+"  == "+b2b+" = "+IONumber.let  ( b2a, "==" , b2b ) );
      IO.println ( ""+b2a+"  <= "+b2b+" = "+IONumber.let  ( b2a, "<=" , b2b ) );
      IO.println ( ""+b2a+"  >= "+b2b+" = "+IONumber.let  ( b2a, ">=" , b2b ) );

      IO.println ( );

      IO.println ( ""+b2a+" cmp "+b2b+" = "+ ( b2a.cmp( b2b ) ) );
      IO.println ( ""+b2a+" cmp "+b2a+" = "+ ( b2a.cmp( b2a ) ) );
      IO.println ( ""+b2a+" cmp "+b2b+" = "+ ( b2a.cmp( b2b ) ) );
      IO.println ( ""+b2b+" cmp "+b2a+" = "+ ( b2b.cmp( b2a ) ) );

      IO.pause ( );

      b2a = new IONumber ( "1101.01", 2 );

   // test digits functions
      IO.println ( );
      IO.println ( "Test digit functions" );
      IO.println ( );

//      while ( b2a.length( ) > 1 )
      while ( b2a.hasDigits( ) )
      {
        IO.println ( ""+b2a+".length( ) = "+ ( b2a.length( )) );
        IO.println ( ""+b2a+".head( )   = "+ ( b2a.head( )  ) );
        IO.println ( ""+b2a+".tail( )   = "+ ( b2a.tail( )  ) );
        b2a = new IONumber ( b2a.tail( ), b2a.getRadix( ) );
      }
      IO.println   ( ""+b2a+".length( ) = "+ ( b2a.length( )) );
  
      IO.pause ( );

      IO.println ( );
      IO.pause ( "Press ENTER to finish." );
  } // end main ( )
} // end class
