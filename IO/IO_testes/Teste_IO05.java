// lista de dependencias

import IO.*;

/**
  *  Teste_IO05 - Graphics package
  *
  *  Copyright (c) 2018 by PUC-Minas / DCC
  *  All rights reserved.
  *
  * @author  PUC-Minas/DCC
  * @version 0.9l
  */

public class Teste_IO05
{
 // main method
    public static void main ( String args [ ] )
    {
       int x;

       IOGraphics io = new IOGraphics ( "2D Example - Animation",
                                         500, 500  );

       io.setBKColor ( "YELLOW" );

       io.drawString ( io.getCenterX( ), io.getCenterY( ), "START", "BLUE" );
       io.drawString ( 350, 75, "END", "BLUE" );

       for ( x=0; x<10; x=x+1 )
       {
         io.delay ( 50 );
         io.drawCircle  ( 50+15*x, 50+15*x, 25, "RED", 3.0 );
         io.delay ( 500 );
         io.drawCircle  ( 50+15*x, 50+15*x, 25, io.getBKColor( ), 4.0 );
       } // end for
       io.drawCircle  ( 50+15*x, 50+15*x, 25, "RED", 3.0 );

    } // end main ( )

} // end Teste_IO5
