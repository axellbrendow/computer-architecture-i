// lista de dependencias

import IO.*;

/**
  *  Teste_IO03 - NET package
  *
  *  Copyright (c) 2016 by PUC-Minas / DCC
  *  All rights reserved.
  *
  * @author  PUC-Minas/DCC
  * @version 0.9i
  */

class ClientTCP
{   
    public ClientTCP ( )
    {
        String ip;
        int    port;
        String msg = "?";
        String str;

	NET    myClient;

        IO.windowON ( );
        ip   = IO.readString ( "IP (xxx.xxx.xxx.xxx) : " );
        port = IO.readint ( "Port (6789):" );

        myClient = new NET ( ip, port );

        while ( myClient.isConnected( ) &&
	             NET.isValidMessage ( msg ) )
        {
	    msg = IO.readString ( "Message: " );
            myClient.sendToServer ( msg );

            msg = myClient.receiveFromServer ( );
            IO.println ( "Message received." );
        } // end while
        myClient.disconnect ( );
        IO.windowOFF( );

    } // end main ( )

} // end class ClientTCP

class ServerTCP
{
    public ServerTCP ( )
    {
        String msg = "?";
        int    port;

        NET    myServer = null;

        IO.windowON ( );
        port = IO.readint ( "Port (6789):" );

        myServer = new NET ( port );

        while ( myServer.isConnected ( ) &&
	        NET.isValidMessage ( msg ) )
        {
            msg = myServer.receiveFromClient ( );
            IO.println ( "Message received: " + msg );
            myServer.disconnect ( );
            if ( NET.isValidMessage ( msg ) )
	    {
	      msg = "OK";
            } // end if
 	         myServer.sendToClient ( msg );
        } // end while
        IO.windowOFF( );

    } // end main ( )
	 

} // end class ServerTCP

public class Teste_IO03
{
	 public static void main ( String [] args )
	 {
	   ClientTCP client01 = new ClientTCP( );
	   ServerTCP server01 = new ServerTCP( );
	 }  // end main ( )
} // end class Teste_IO3

