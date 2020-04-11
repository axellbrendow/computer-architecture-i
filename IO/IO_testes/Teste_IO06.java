// lista de dependencias

import IO.*;

/**
  *  Teste_IO06 - Graphics package
  *
  *  Copyright (c) 2018 by PUC-Minas / DCC
  *  All rights reserved.
  *
  * @author  PUC-Minas/DCC
  * @version 0.9l
  */
  
public class Teste_IO06
{
 // define static graphic object

    static IOGraphics io = new IOGraphics ( "2D Example - Chart",
                                             500, 500, "BLACK"  );

 // draw base chart
    public static void drawBaseChart ( )
    {
      io.drawGrid ( "LIGHT_GRAY", 10 );
      io.drawAxis ( "BLACK"     , 10 );
    } // end drawChart ( )

 // draw chart
    public static void drawChart ( )
    {
      io.drawLine ( 0, 0,
                    100, 100, "RED", 3.0 );
    } // end drawChart ( )

 // main method
    public static void main ( String args [ ] )
    {
      drawBaseChart ( );
      drawChart ( );
    } // end main ( )

} // end Teste_IO6
