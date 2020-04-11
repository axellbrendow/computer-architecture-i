// lista de dependencias

import IO.*;

/**
  *  Teste_IO02 - FILE package
  *
  *  Copyright (c) 2016 by PUC-Minas / DCC
  *  All rights reserved.
  *
  * @author  PUC-Minas/DCC
  * @version 0.9i
  */
public class Teste_IO02 extends IO
{
    public static void main( String argv [ ] )
    {
    // definir dados
                    			     // nativos
       boolean   booleanX;
       char      charX;
       double    doubleX;
       int       intX;

       String   line;			     // cadeias de caracteres
					     // arquivos
       FILE arquivo1 = new FILE ( FILE.INPUT , "teste2.txt"  );
       FILE arquivo2 = new FILE ( FILE.OUTPUT, "saida1.txt" );
       FILE arquivo3 = new FILE ( FILE.OUTPUT, "saida2.txt" );
       FILE arquivo4 = new FILE ( FILE.INPUT , "saida3.txt" );

    // identificar o programa
       println  ( "Teste_FILE " + FILE.version ( ) +
                  " - " + IO.getDate ( ) +
                  " - " + IO.getTime ( ) );
       println  ( "Testes da classe para entrada e saida de dados em arquivos." );
       println  ( "" );			     // saltar linha
       pause    ( "Apertar ENTER para continuar." );

    // testar entrada/saida com arquivos
       println  ( "\nTestes com arquivos:" + NEWLINE );

       println ( "Teste de existencia de arquivo: teste1.txt" );
       if ( ! FILE.exists ( "teste1.txt" ) )
       {
         println ( "ERRO: Arquivo nao existe ou nao pode ser aberto.");
         println ( );
       } // end if

       println ( "Teste de existencia e abertura de arquivos:" );
       if ( ! arquivo1.exists ( ) || ! arquivo2.isOpen ( ) )
       {
         println ( );
         println ( "Arquivos: teste.txt e saida1.txt" );
         println ( "ERRO: Arquivo(s) nao existe(m) ou nao pode(m) ser aberto(s)." );
       }
       else
       {
         println  ( "Ler:    " + arquivo1.getFileName( ) );
         println  ( "Gravar: " + arquivo2.getFileName( ) );
         println  ( "" );

         arquivo2.println ( "" );            // gravar linha vazia

         line = arquivo1.readln ( );	     // ler linha de arquivo
         while ( ! arquivo1.eof ( ) )	     // testar se fim de arquivo
         {
           println ( line + "("+line.length()+")");
           arquivo2.println ( line );  	     // gravar linha lida
           arquivo3.println ( line );  	     // gravar linha lida
	   line = arquivo1.readln ( ); 	     // ler outra linha de arquivo
         } // end while ( )
         arquivo1.close ( );		     // fechar arquivos
         arquivo2.close ( );
         arquivo3.close ( );
         arquivo4.close ( );

         println ( );
         println ( "Arquivo " + arquivo2.getFileName ( ) + " gravado." );
         println ( "Arquivo " + arquivo3.getFileName ( ) + " gravado." );
       } // end if ( )

       pause   ( "Apertar ENTER para continuar." );

    // testar existencia de arquivo
       arquivo3.open ( FILE.INPUT, "saida2.txt" );

       arquivo4.rename ( "teste2.txt" );
       println ( );
       println ( "Arquivo saida3.txt renomeado para " + arquivo4.getFileName ( ) );
       pause   ( "Apertar ENTER para continuar." );

       arquivo4.delete ( );                  // apagar arquivo

       println ( );
       println ( "Arquivo " + arquivo4.getFileName ( ) + " apagado." );
       pause   ( "Apertar ENTER para continuar." );

       if ( ! arquivo4.exists ( ) )
       {
         println ( "" );
         println ( "ERRO: Arquivo " + arquivo4.getFileName( ) + " inexistente." );
         println ( "" );
         pause   ( "Apertar ENTER para continuar." );
       }
       else
       {
         if ( arquivo4.hasError ( ) )
         {
           println ( "ERRO = " + arquivo4.getError ( ) +
                     " = "  + arquivo4.getErrorMsg ( ) );
         } // end if
       } // end if

    // acrescentar dados a arquivo
       println ( );
       println ( "Teste de acrescimo de dados ao arquivo saida2.txt" );

       if ( arquivo3.hasError ( ) )
       {
         println ( );
         println ( "ERRO: " + arquivo3.getError( ) );
         println ( arquivo3.getErrorMsg( ) );
       }
       else
       {
         arquivo3.open ( FILE.APPEND, "saida2.txt" );

         arquivo3.println ( ">>> Fim do arquivo" );

         arquivo3.seek ( 0 );                            // retornar ao inicio
         arquivo3.println ( ">>> Inicio do arquivo"+     // e sobrescrever
                            "   " );                     // ate' apagar tudo
                                                         // que estiver la'
         arquivo3.close ( );

      // testar leitura de arquivo
         arquivo3.open ( FILE.INPUT, "saida2.txt" );

         println ( "" );
         println ( "Ler:    " + arquivo3.getFileName( ) );
         println ( "" );
    				             // abrir e mudar modo para leitura
         if ( arquivo3.isOpen ( ) )
         {
           line = arquivo3.read ( );	     // ler dado
           while ( ! arquivo3.eof ( ) )        // testar se fim de arquivo
           {
             println ( line + "("+line.length()+")");
             line = arquivo3.read ( );	     // ler outra linha de arquivo
           } // end while ( )
           arquivo3.close ( );		     // fechar arquivo
         } // end if ( )
       } // end if

    // pausa
       println ( "" );
       pause   ( "Apertar ENTER para terminar." );
    } // end main ( )

} // end class Teste_IO02

