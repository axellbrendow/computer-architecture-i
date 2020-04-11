// lista de dependencias

import IO.*;

/**
  *  Teste_IO10 - Monitored values package
  *
  *  Copyright (c) 2016 by PUC-Minas / DCC
  *  All rights reserved.
  *
  * @author  PUC-Minas/DCC
  * @version 0.9i
  */

public class Teste_IO10
{
 /**
    Main method.
  */
   public static void main( String[ ] args )
   {
    // define data
       IO_int     var1 = new IO_int     ( "var1",   0   );
       IO_double  var2 = new IO_double  ( "var2",  0.5  );
       IO_boolean var3 = new IO_boolean ( "var3",  true );
       IO_char    var4 = new IO_char    ( "var4",  'a'  );
       IO_String  var5 = new IO_String  ( "var5", "abc" );

    // identification
       IO.println ( "Test monitored values" );

       IO.println ( );
       IO.println ( "Initial values" );
       IO.println ( );

       IO.println ( "var1 = "+var1 );
       IO.println ( "var2 = "+var2 );
       IO.println ( "var3 = "+var3 );
       IO.println ( "var4 = "+var4 );
       IO.println ( "var5 = "+var5 );

       var1.set ( 10  );
       var2.set ( 1.5 );
       var1.set ( 20  );
       var1.set ( 30  );
       var1.set ( 40  );
       var1.set ( 50  );
       var1.set ( 60  );
       var1.set ( 70  );
       var1.set ( 80  );
       var2.set (var2.get( )+1.0 );

       var3.set ( false );
       var4.set ( 'b' );
       var5.set ( var5.get( )+"de" );

       IO.println ( );
       IO.println ( "Modified values" );
       IO.println ( );

       IO.println ( "var1 = "+var1 );
       IO.println ( "var2 = "+var2 );
       IO.println ( "var3 = "+var3 );
       IO.println ( "var4 = "+var4 );
       IO.println ( "var5 = "+var5 );

       IO.println ( );
       IO.pause ( "Press ENTER to finish." );
       IO.exit  ( ); // will close all open windows
  } // end main ( )
} // end class
