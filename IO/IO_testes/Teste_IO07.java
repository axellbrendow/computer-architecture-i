// lista de dependencias

import IO.*;

/**
  *  Teste_IO07 - Graphics package
  *
  *  Copyright (c) 2018 by PUC-Minas / DCC
  *  All rights reserved.
  *
  * @author  PUC-Minas/DCC
  * @version 0.9l
  */

public class Teste_IO07
{
 // define static graphic object

    static IOGraphics io = new IOGraphics ( "IORobot Example",
                                             500, 500, "BLACK"  );
 // main method
    public static void main ( String args [ ] )
    {
        int k;
        IORobot JK = new IORobot ( 0, 0, 0, "RED", 2 );
        JK.setSpeed( 10 );
        for ( k = 0; k < 30; k=k+1 )
        {
            JK.move     ( 10 );
            JK.turnLeft ( 12 );
        }
        JK.penUp ( );
        JK.goHome( );
        JK.setAngle  (  90 );
        JK.move      ( -20 );
        JK.turnRight (  90 );
        JK.move      ( -60 );
        JK.setPenColor ( "BLUE" );
        JK.penDown( );
        for ( k = 0; k < 4; k=k+1 )
        {
            JK.move     (  133 );
            JK.turnRight(  -90 );
        }
        JK.penUp ( );
        JK.goHome( );
        JK.interactiveMode( true );
    } // end main ( )

} // end Teste_IO7
