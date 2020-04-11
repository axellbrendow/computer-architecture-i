// lista de dependencias

import IO.*;

/**
  *  Teste_IO13 - Optional object values package
  *
  *  Copyright (c) 2018 by PUC-Minas / DCC
  *  All rights reserved.
  *
  * @author  PUC-Minas/DCC
  * @version 0.9l
  */

public class Teste_IO13
{ 
  /**
     Main method.
  */
  public static void main ( String [ ] args )
  {
   // data definition
      Integer   od = null;
      Double    of = null;
      Boolean   ob = null;
      Character oc = null;
      String    os = null;

      int       d  = IO_Optional.get( od );
      double    f  = IO_Optional.get( of );
      boolean   b  = IO_Optional.get( ob );
      char      c  = IO_Optional.get( oc );
      String    s  = "___";

      Object    x  = null;

      IO_Iterator id = null;

   // identification
      IO.println ( "Test optional values" );
      IO.println ( );

   // optional default values for objects
      IO.println ( "Test default optional values from objects" );
      IO.printf ( "d = %d\n", IO_Optional.get( od ) );
      IO.printf ( "f = %f\n", IO_Optional.get( of ) );
      IO.printf ( "b = %b\n", IO_Optional.get( ob ) );
      IO.printf ( "c = %c\n", IO_Optional.get( oc ) );
      IO.printf ( "s = %s\n", IO_Optional.get( os ) );
      IO.printf ( "\n" );

   // updated optional default values for primitives
      IO.println ( "Test default optional values from primitives" );
      IO.printf ( "d = %d\n", IO_Optional.get( d ) );
      IO.printf ( "f = %f\n", IO_Optional.get( f ) );
      IO.printf ( "b = %b\n", IO_Optional.get( b ) );
      IO.printf ( "c = %c\n", IO_Optional.get( c ) );
      IO.printf ( "s = %s\n", IO_Optional.get( s ) );
      IO.printf ( "\n" );

   // change optional default values
      IO_Optional.set ( -1 );
      IO_Optional.set ( -0.999 );
      IO_Optional.set ( true );
      IO_Optional.set ( '#'  );
      IO_Optional.set ( "!"  );

   // get new optional values for primitives
      d = IO_Optional.get( od );
      f = IO_Optional.get( of );
      b = IO_Optional.get( ob );
      c = IO_Optional.get( oc );

   // updated optional default values for primitives
      IO.println ( "Test get new optional values from primitives" );
      IO.printf ( "d = %d\n", IO_Optional.get( d ) );
      IO.printf ( "f = %f\n", IO_Optional.get( f ) );
      IO.printf ( "b = %b\n", IO_Optional.get( b ) );
      IO.printf ( "c = %c\n", IO_Optional.get( c ) );
      IO.printf ( "s = %s\n", IO_Optional.get( s ) );
      IO.printf ( "\n" );

      IO.pause ( "Press ENTER to continue." );

   // read formatted objects
      IO.println ( "Test input formatted objects" );
      x =             IO.scanf ( "(int)        x = %d" );
      IO.printf ( "d = %d\n"  ,  x );
      x =             IO.scanf ( "(int)        x = %i" );
      IO.printf ( "d = %d\n"  ,  x );
      x =             IO.scanf ( "(hex)        x = %x" );
      IO.printf ( "d = %d\n"  ,  x );
      x = (int)       IO.scanf ( "(octal)      x = %o" );
      IO.printf ( "d = %d\n"  ,  x );
      x = (Integer)   IO.scanf ( "(quaternary) x = %q" );
      IO.printf ( "d = %d\n"  ,  x );
      x = (Integer)   IO.scanf ( "(bin)        x = %y" );
      IO.printf ( "d = %d\n"  ,  x );
      x =             IO.scanf ( "(double)&',' x = %f" );
      IO.printf ( "f = %f\n"  ,  x );
      x = (double)    IO.scanf ( "(double)     x = %f" );
      IO.printf ( "f = %f\n"  ,  x );
      x = (Double)    IO.scanf ( "(Double)     x = %f" );
      IO.printf ( "f = %f\n"  ,  x );
      x = (boolean)   IO.scanf ( "(boolean)    x = %b" );
      IO.printf ( "d = %s\n"  ,  x );
      x = (Boolean)   IO.scanf ( "(Boolean)    x = %b" );
      IO.printf ( "d = %s\n"  ,  x );
      x = (String)    IO.scanf ( "(String)     x = %s" );
      IO.printf ( "d = |%s|\n",  x );
      x = (String)    IO.scanf ( "(line)       x = %l" );
      IO.printf ( "d = |%s|\n",  x );
      x = (char)      IO.scanf ( "(char)       x = %c" );
      IO.printf ( "d = |%c|\n",  x );
      IO.println ( );

   // get casted primitives from formatted input objects
      IO.println ( "Test input primitives from formatted objects" );
      d = (Integer)   IO.scanf ( "(hex)        x = %x" );
      IO.printf ( "d = %d\n"  ,  d );
      d = (Integer)   IO.scanf ( "(octal)      x = %o" );
      IO.printf ( "d = %d\n"  ,  d );
      d = (Integer)   IO.scanf ( "(quaternary) x = %q" );
      IO.printf ( "d = %d\n"  ,  d );
      d = (Integer)   IO.scanf ( "(bin)        x = %y" );
      IO.printf ( "d = %d\n"  ,  d );
      f = (Double)    IO.scanf ( "(Double)     x = %f" );
      IO.printf ( "f = %f\n"  ,  f );
      b = (Boolean)   IO.scanf ( "(Boolean)    x = %b" );
      IO.printf ( "b = %s\n"  ,  b );
      s = (String)    IO.scanf ( "(String)     x = %s" );
      IO.printf ( "s = |%s|\n",  x );
      s = (String)    IO.scanf ( "(line)       x = %l" );
      IO.printf ( "s = |%s|\n",  x );
      c = (Character) IO.scanf ( "(Character)  x = %c" );
      IO.printf ( "c = |%c|\n",  x );
      IO.println ( );

   // iterate with objects
      id = new IO_Iterator ( 1, 5, 1 );
      while ( id.hasNextInt( ) )
      {
        IO.printf ( "d = %d\n", IO_Optional.get( id.nextInt( ) ) );
      }
      IO.printf ( "\n" );

      id = new IO_Iterator ( 5, 1, -2 );
      while ( id.hasNextInt( ) )
      {
         IO.printf ( "d = %d\n", IO_Optional.get( id.nextInt( ) ) );
      }
      IO.printf ( "\n" );

      IO.pause ( "Press ENTER to continue." );

      id = new IO_Iterator ( 0.5, 1.0, 0.1 );
      while ( id.hasNextDouble( ) )
      {
         IO.printf ( "f = %f\n", IO_Optional.get( id.nextDouble( ) ) );
      }
      IO.printf ( "\n" );

      id = new IO_Iterator ( -1.0, 0.0, 0.2 );
      while ( id.hasNextDouble( ) )
      {
         IO.printf ( "f = %f\n", IO_Optional.get( id.nextDouble( ) ) );
      }
      IO.printf ( "\n" );

      IO.pause ( "Press ENTER to continue." );

      id = new IO_Iterator ( 'a', 'e', 1 );
      while ( id.hasNextChar( ) )
      {
         IO.printf ( "c = %c\n", IO_Optional.get( (char) id.nextChar( )   ) );
      }
      IO.printf ( "\n" );

      id = new IO_Iterator ( 'e', 'a', -1 );
      while ( id.hasNextChar( ) )
      {
         IO.printf ( "c = %c\n", IO_Optional.get( (char) id.nextChar( )   ) );
      }
      IO.printf ( "\n" );

      IO.pause ( "Press ENTER to continue." );

      id = new IO_Iterator ( "Sunday"   , "Monday"  , "Tuesday",
                             "Wednesday", "Thursday", "Friday" ,
                             "Saturday" );
      while ( id.hasNext( ) )
      {
         IO.printf ( "s = %s\n", IO_Optional.get( (String) id.next( ) ) );
      }
      IO.printf ( "\n" );

      id.reverse( );
      while ( id.hasNext( ) )
      {
         IO.printf ( "s = %s\n", IO_Optional.get( (String) id.previous( ) ) );
      }
      IO.printf ( "\n" );

      IO.pause ( "Press ENTER to continue." );

      id = new IO_Iterator ( 1, 2, 5, 10, 50, 100 );
      while ( id.hasNext( ) )
      {
         IO.printf ( "d = %d\n", IO_Optional.get( (int) id.nextInt( ) ) );
      }
      IO.printf ( "\n" );

      id = new IO_Iterator ( 10, 2, 4, 6 );
      while ( id.hasNext( ) )
      {
         IO.printf ( "d = %d\n", IO_Optional.get( (int) id.next( ) ) );
      }
      IO.printf ( "\n" );

      IO.pause ( "Press ENTER to continue." );

      id = new IO_Iterator ( 1, 2.0, "3", '4' );
      for ( Object ox : id.values( ) )
      {
         IO.print ( ""+ox );
         if (Integer.class.isInstance  (ox)) IO.print ( "\t(Integer)"   );
         else
         if (Double.class.isInstance   (ox)) IO.print ( "\t(Double)"    );
         else
         if (String.class.isInstance   (ox)) IO.print ( "\t(String)"    );
         else
         if (Character.class.isInstance(ox)) IO.print ( "\t(Character)" );
         else
         if (Boolean.class.isInstance  (ox)) IO.print ( "\t(Boolean)"   );
         else
             IO.print ( "\t"+((ox==null)?"null":ox.getClass( ).getName( )) );
         IO.println ( );
      }
      IO.printf ( "\n" );

      for ( Object ox : id.reversedValues( ) )
      {
         IO.print ( ""+ox );
         switch ( ox.getClass( ).getName( ) )
         {
           case "java.lang.Integer"  : IO.print ( "\t(Integer)"   );
            break;
           case "java.lang.Double"   : IO.print ( "\t(Double)"    );
            break;
           case "java.lang.String"   : IO.print ( "\t(String)"    );
            break;
           case "java.lang.Character": IO.print ( "\t(Character)" );
            break;
           case "java.lang.Boolean"  : IO.print ( "\t(Boolean)"   );
            break;
           default:
             IO.print ( "\t"+ox.getClass( ).getName( ) );
            break;
         }
         IO.println ( );
      }
      IO.println ( );

      id = new IO_Iterator ( false, true );
      for ( Object ox : id.values( ) )
      {
          IO.println ( ""+ox );
      }
 
      IO.println ( );
      IO.pause ( "Press ENTER to finish." );

  } // end main ( )
} // end class