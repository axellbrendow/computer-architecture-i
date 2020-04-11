// lista de dependencias

import IO.*;

/**
  *  Teste_IO11 - Charset package
  *
  *  Copyright (c) 2016 by PUC-Minas / DCC
  *  All rights reserved.
  *
  * @author  PUC-Minas/DCC
  * @version 0.9j
  */

public class Teste_IO11
{
 /**
    Main method.
  */
  public static void main ( String [ ] args )
  {
   // data definition

   // identification
      IO.println ( "Test charset methods" );

      IO.println ( );

   // get charset
      IO.println ( "Current charset = " + IO.getCharset( ) );

   // set charset
      IO.setCharset ( "UTF-8" );
      IO.println ( "Current charset = " + IO.getCharset( ) );

   // set charset
      IO.setCharset ( "ISO-8859-1" );
      IO.println ( "Current charset = " + IO.getCharset( ) );

   // encoding conversion
      IO.println ( );
      IO.encodingConverter ( "A.txt", "ISO-8859-1", "B.txt", "UTF-8" );

      IO.println ( );
      IO.pause ( "Press ENTER to finish." );

  } // end main ( )
} // end class