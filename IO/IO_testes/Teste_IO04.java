// lista de dependencias

import IO.*;

/**
  *  Teste_IO04 - Graphics package
  *
  *  Copyright (c) 2018 by PUC-Minas / DCC
  *  All rights reserved.
  *
  * @author  PUC-Minas/DCC
  * @version 0.9l
  */

public class Teste_IO04
{
 //  main method
     public static void main ( String args [ ] )
     {
        IOGraphics io = new IOGraphics ( "2D Example"+" - "+IOGraphics.version( ),
                                          500, 500  );
     // local data
        int x;
        
        io.setBKColor ( "WHITE" );

        for ( x=1; x<=3; x=x+1 )
        {
          io.drawPoint   (  x,  0  , "BLACK", 1.0 );
          io.drawPoint   ( -x,  0  , "BLACK", 1.0 );
          io.drawPoint   (  0, +x  , "BLACK", 1.0 );
          io.drawPoint   (  0, -x  , "BLACK", 1.0 );
        } // end for

        io.drawLine      (  20,  20, 100, 100, "RED"   , 1.0 );
        io.drawRectangle ( 120, 120, 100, 100, "GREEN" , 1.0 );
        io.drawEllipse   ( 150, 120,  50, 100, "ORANGE", 1.0 );
        io.drawCircle    ( 150, 175,  30,      "PINK"  , 1.0 );
        io.drawArc       ( 150, 180,  50, 205, 335, "GRAY", 1.0 );


//        io.fillRectangle (  30,  30, 100, 100, "CYAN"     , 1.0 );

        io.fillEllipse   (-175, 150,  50,  50, "YELLOW"   , 1.0 );
        io.fillEllipse   (-180, 160,  10,  10, "DARK_GRAY", 1.0 );
        io.fillArc       (-170, 150,  50, -45, 45, "WHITE", 1.0 );
        io.fillCircle    (-125, 150,  15,      "MAGENTA"  , 1.0 );

        io.drawString    ( io.getCenterX(), io.getCenterY()+20, "CENTER", "BLUE" );
  } // end main ( )

} // end Teste_IO04
