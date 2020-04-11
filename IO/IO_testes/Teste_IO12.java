// lista de dependencias

import IO.*;

/**
  *  Teste_IO12 - Test error unity package
  *
  *  Copyright (c) 2016 by PUC-Minas / DCC
  *  All rights reserved.
  *
  * @author  PUC-Minas/DCC
  * @version 0.9j
  */

public class Teste_IO12
{
  /**
     Error test method.
  */
  public static void unity3 ( )
  {
   // definicao de dados
      boolean OK;

      IOERROR tst = new IOERROR( );

   // unidade de testes
      System.out.println ( "Unity error report (3)" );
  
      OK = tst.equals ( (5+1), (3+3) );

      if ( ! OK )
      {
        System.out.println ( "errorReport             = "+tst.errorReportMsg( ) );
      }
  
      OK = tst.equals ( (5+1), (3+2) );
  
      if ( ! OK )
      {
        System.out.println ( "errorReport             = "+tst.errorReportMsg( ) );
      }
  
  
      OK = tst.equals ( (5+1), (4+3) );
  
      if ( ! OK )
      {
        System.out.println ( "errorReport             = "+tst.errorReportMsg( ) );
      }

      OK = tst.equals ( (5+1), (5.0+1.0) );
  
      if ( ! OK )
      {
        System.out.println ( "errorReport             = "+tst.errorReportMsg( ) );
      }
  
      System.out.println ( "errorTotalReportMsg     = "+tst.errorTotalReportMsg( ) );
  
  }
  
  /**
     Main method.
  */
  public static void main ( String [ ] args )
  {
   // data definition
      boolean OK;

   // identification
      IO.println ( "Test monitored values" );

      IO.println ( );

   // single error test
      IO.println ( "Single error report (1)" );

      OK = IO.equals ( ""+(5+1), ""+(3+3) );

      if ( ! OK )
      {
        IO.println ( "errorReport             = "+IO.errorReport( ) );
        IO.println ( "errorFullClassNameReport= "+IO.errorFullClassNameReport( ) );
        IO.println ( "errorClassNameReport    = "+IO.errorClassNameReport( ) );
        IO.println ( "errorLineNumberReport   = "+IO.errorLineNumberReport( ) );
        IO.println ( "errorNumberReport       = "+IO.errorNumberReport( ) );
      }
      else
      {
        IO.println ( "No error" );
        IO.println ( "errorReport             = "+IO.errorReport( ) );
        IO.println ( "errorFullClassNameReport= "+IO.errorFullClassNameReport( ) );
        IO.println ( "errorClassNameReport    = "+IO.errorClassNameReport( ) );
        IO.println ( "errorLineNumberReport   = "+IO.errorLineNumberReport( ) );
        IO.println ( "errorNumberReport       = "+IO.errorNumberReport( ) );
      }

      IO.println ( );

      IO.errorReset ( );

   // unity error test (2)
      IO.println ( "Unity error report (2)" );

      OK = IO.equals ( ""+(5+1), ""+(3+2) );

      if ( ! OK )
      {
        IO.println ( "errorReport             = "+IO.errorReportMsg( ) );
      }

      OK = IO.equals ( ""+(5+1), ""+(4+3) );

      if ( ! OK )
      {
        IO.println ( "errorReport             = "+IO.errorReportMsg( ) );
      }

      IO.println ( "errorNumberReport       = "+IO.errorNumberReport( ) );
      IO.println ( "errorTotalNumberReport  = "+IO.errorTotalNumberReport( ) );

      IO.println ( );

   // unity error test (3)

      unity3 ( );
  
      IO.println ( );
      IO.pause ( "Press ENTER to finish." );

  } // end main ( )
} // end class