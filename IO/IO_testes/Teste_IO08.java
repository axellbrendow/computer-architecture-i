// lista de dependencias

import IO.*;

/**
  *  Teste_IO08 - Abstract Data Type package
  *
  *  Copyright (c) 2016 by PUC-Minas / DCC
  *  All rights reserved.
  *
  * @author  PUC-Minas/DCC
  * @version 0.9i
  */

public class Teste_IO08
{
  public static void main ( String [] args )
  {
     IOTuple pair    = new IOTuple ( 1, "String" );
     IOTuple triplet = new IOTuple ( 1, "String", 1.23 );
     IOTuple quartet = new IOTuple ( );
     IOTuple quintet = new IOTuple ( pair, triplet );

     String  data    = "one two three";

     Object [ ] value = null;
     int x;

     IO.println ( "Test tuples" );
     IO.println ( );

     IO.println ( "pair    = "+pair    );
     IO.println ( "triplet = "+triplet );
     IO.println ( "quartet = "+quartet );
     IO.println ( "quintet = "+quintet );

     IO.println ( );
     if ( pair.contains ( "String" ) )
     {
       IO.println ( "Pair contains 'String'" );
       IO.println ( "Pair contains 'String' at ["+pair.indexOf ( "String" )+"]" );
       pair.setValue ( 1, "new_value" );
       IO.println ( "Pair now = ["+pair.getValue(0)+", "+pair.getValue(1)+"]" );
     }
     else
     {
       IO.println ( "Pair does not contain 'String'" );
     }

     if ( value != null )
     {
       for ( x=0; x<value.length; x=x+1 )
       {
         IO.println ( "Triplet value ["+(x+1)+"] = "+value[x] );
       }
     }

     IO.println ( );
     if ( IOTuple.isEmpty( quartet ) )
     {
       IO.println ( "Quartet has no value." );
     }

     IO.println ( );
     value = quintet.toArray( );

     if ( value != null )
     {
       for ( x=0; x<value.length; x=x+1 )
       {
         IO.println ( "Quintet value ["+x+"] = "+value[x] );
       }
       IO.println ( "Quintet components: " );
       while ( quintet != null && quintet.hasNext( ) )
       {
           IO.println ( ""+quintet.head( ) );
           quintet = quintet.tail( );
       }
     }

     IO.println ( );
     IO.pause ( "Press ENTER to continue." );

     IO.println ( "Test data parsing" );
     IO.println ( );

     while ( ! IO.isEmpty( data ) )
     {
       IO.print   ( ""+IO.getHead( data ) );
       data = IO.getTail ( data );
       IO.println ( "\t"+ data );
     }

     IO.println ( );

     data = "four";

     while ( ! IO.isEmpty( data ) )
     {
       IO.print   ( ""+IO.getHead( data, "" ) );
       data = IO.getTail ( data, "" );
       IO.println ( "\t"+ data );
     }

     IO.println ( );

     data = "five six seven";
     while ( IO.hasNext( data  ) )
     {
       IO.print   ( ""+IO.next( data ) );
       data = IO.getTail ( data  );
       IO.println ( "\t"+ data );
     }

     IO.println ( );
     IO.pause ( "Press ENTER to finish." );
  }
}