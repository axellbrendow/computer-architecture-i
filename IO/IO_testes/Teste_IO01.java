// lista de dependecias

import IO.*;

/**
  *  Teste_IO01 class
  *
  *  Copyright (c) 2017 by PUC-Minas / DCC
  *  All rights reserved.
  *
  * @author  PUC-Minas/DCC
  * @version 0.9k
  */

public class Teste_IO01
{
    public static void main( String args [ ] )
    {
    // definir dados
                    				   	// nativos
       boolean   booleanX;
       char      charX;
       double    doubleX;
       int       intX;
                       					// objetos
       Boolean   booleanOX = Boolean.valueOf ( false );
       Character charOX    = Character.valueOf ( 'A' );
       Double    doubleOX  = Double.valueOf    ( 1.0 );
       Integer   intOX     = Integer.valueOf   ( 10  );
		 													// objetos
       String   line;					// cadeias de caracteres
                                                   									// arquivos
    // identificar o programa
       IO.println ( "Teste_IO " + IO.version ( ) + 
                    " - " + IO.getDate ( ) + 
                    " - " + IO.getTime ( ) );
       IO.println ( "Testes da classe para entrada e saida de dados em console." );
       IO.println (  );  				// saltar linha

    // testar a saida direta de dados nativos
       IO.println ( "Saida direta:" + IO.NEWLINE );
       IO.println ( 1 );
       IO.println ( 'a' );
       IO.println ( true );
       IO.println ( 2.2 );

       IO.println (  );
       IO.print   ( "Apertar ENTER para continuar." );
       IO.pause   ( "" );          	// esperar pela tecla ENTER

    // testar a entrada/saida de dados nativos
       IO.println (  );
       IO.println ( "Entrada/saida:" + IO.NEWLINE );

       charX      = IO.readchar   ( "Fornecer uma letra: " );
       intX       = IO.readint    ( "Fornecer um  numero inteiro: " );
       doubleX    = IO.readdouble ( "Fornecer um  numero real: " );
       line       = IO.readString ( "Fornecer uma linha: " );
       IO.print   ( "Fornecer um  valor logico: " );
       booleanX   = IO.readboolean ( "" );

       IO.println (  );
       IO.println ( "Saida nao formatada:" );
       IO.println ( "Letra   lida: " + charX    );
       IO.println ( "Inteiro lido: " + intX     );
       IO.println ( "Real    lido: " + doubleX  );
       IO.println ( "String  lido: " + line     );
       IO.println ( "Logico  lido: " + booleanX );

       IO.println (  );
       IO.pause   ( "Apertar ENTER para continuar." );

       IO.clrscr  ( );

       IO.println (  );
       IO.println ( "Entrada/saida formatada:" + IO.NEWLINE );

       charX      = (char)    IO.scanf ( "Fornecer uma letra:          %c"  );
       intX       = (int)     IO.scanf ( "Fornecer um  numero inteiro: %i"  );
       doubleX    = (double)  IO.scanf ( "Fornecer um  numero real:    %f"  );
       line       = (String)  IO.scanf ( "Fornecer uma linha:          %ls" );
       IO.print   ( "Fornecer um  valor logico:   " );
       booleanX   = (boolean) IO.scanf ( "%b"  );

       IO.println (  );
       IO.printf  ( "Saida formatada: %n%c%n%d%n%f%n%s%n%b%n",
                     charX, intX, doubleX, line, booleanX );
       IO.println (  );
       IO.println ( "Saida com tamanho definido, alinhada 'a direita: " );
       IO.printf  ( "Letra   lida: %10c%n"   , charX    );
       IO.printf  ( "Inteiro lido: %10d%n"   , intX     );
       IO.printf  ( "Real    lido: %10.2f%n" , doubleX  );
       IO.printf  ( "String  lido: %30s%n"   , line     );
       IO.printf  ( "Logico  lido: %10b%n"   , booleanX );

       IO.println (  );
       IO.pause   ( "Apertar ENTER para continuar." );
          
       IO.cls     ( );
          
    // testar a entrada/saida combinadas de dados nativos
       IO.println (  );
       IO.println ( "Entrada/saida combinadas:" );
       IO.println ( "Mudar o foco para a janela indicada." );

       IO.windowON( );

       IO.println ( "Apertar OK para continuar." );

       charX      = IO.readchar    ( "Fornecer uma letra: "          );
       intX       = IO.readint     ( "Fornecer um  numero inteiro: " );
       doubleX    = IO.readdouble  ( "Fornecer um  numero real: "    );
       line       = IO.readString  ( "Fornecer uma linha: "          );
       booleanX   = IO.readboolean ( "Fornecer um  valor logico: "   );

       IO.pause   ( "Apertar ENTER para continuar." );

       IO.println ( "Valores lidos:"
                  + "\nLetra   lida: " + charX
                  + "\nInteiro lido: " + intX
                  + "\nReal    lido: " + doubleX
                  + "\nString  lido: " + line
                  + "\nLogico  lido: " + booleanX );

       IO.printf  ( "Saida formatada: %n%c%n%d%n%f%n%s%n%b%n",
                     charX, intX, doubleX, line, booleanX );

       IO.println ( "Saida com tamanho definido, alinhada 'a direita: " );
       IO.printf  ( "Letra   lida: %10c%n"   , charX    );
       IO.printf  ( "Inteiro lido: %10d%n"   , intX     );
       IO.printf  ( "Real    lido: %10.2f%n" , doubleX  );
       IO.printf  ( "String  lido: %30s%n"   , line     );
       IO.printf  ( "Logico  lido: %10b%n"   , booleanX );

       IO.println (  );
       IO.pause   ( "Apertar ENTER para continuar." );

       IO.windowOFF( );

       IO.println (  );

       IO.pause   ( "\nApertar ENTER para continuar." );

    // testar entrada/saida com objetos
       IO.println ( "" );
       IO.println ( "Saida de objetos:" + IO.NEWLINE );
       IO.println ( ""+intOX  );
       IO.println ( ""+charOX );
       IO.println ( ""+booleanOX );
       IO.println ( ""+doubleOX );

       IO.println (  );
       IO.pause   ( "\nApertar ENTER para continuar." );

       IO.println (  );
       IO.println ( "Entrada/saida de objetos:" );
       IO.println (  );

       charOX     = IO.readchar    ( "Fornecer uma letra: "          );
       intOX      = IO.readint     ( "Fornecer um  numero inteiro: " );
       doubleOX   = IO.readdouble  ( "Fornecer um  numero real: "    );
       booleanOX  = IO.readboolean ( "Fornecer um  valor logico: "   );

       IO.println ( "Valores lidos:" );
       IO.println (  );
       IO.println ( "Letra   lida: " + charOX    );
       IO.println ( "Inteiro lido: " + intOX     );
       IO.println ( "Real    lido: " + doubleOX  );
       IO.println ( "Logico  lido: " + booleanOX );

       IO.println (  );
       IO.pause   ( "Apertar ENTER para continuar." );

    // testar controle do tratamento de erros
       IO.println ( "" );
       IO.println ( "Controle do tratamento de erros:" );
       IO.println (  );

       IO.println (  );
       IO.println ( "Entrada/saida de objetos:" );
       IO.println (  );

       IO.errorOFF ( );       // inibe a exibicao de erro

       line       = "1a0";
       intOX      = IO.getint ( line );

       if ( IO.hasError ( ) )
         IO.println ( "Erro: Conversao invalida para (" + line + ")" +
                      "\n (codigo=" + IO.getError ( ) + ") : " +
                      IO.getErrorMsg ( ) );
       else
         IO.println ( "Conversao para inteiro = " + intOX +
                      "\n (codigo=" + IO.getError ( ) + ")" );

       IO.println ( );
       IO.println ( "Teste de leitura de valor invalido:" );
       IO.println ( );

       IO.errorOFF ( );       // inibe a exibicao de erro

       intOX = IO.readint ( "Fornecer um valor inteiro errado (ex. -1o): " );

       if ( IO.hasError ( ) )
         IO.println ( "Erro: Valor invalido na leitura." +
                      "\n (codigo=" + IO.getError ( ) + ") : " +
                      IO.getErrorMsg ( ) );
       else
         IO.println ( "Conversao para inteiro = " + intOX +
                      "\n (codigo=" + IO.getError ( ) + ") : " +
                      IO.getErrorMsg ( ) );

       IO.println ( );
       IO.println ( "Teste de conversao invalida:" );
       IO.println ( );

       intOX = IO.getint ( "-1." );

       if ( IO.hasError ( ) )
         IO.println ( "Erro: Conversao invalida para (-1.)" +
                      "\n (codigo=" + IO.getError ( ) + ") : " +
                      IO.getErrorMsg ( ) );
       else
         IO.println ( "Conversao para inteiro = " + intOX +
                      "\n (codigo=" + IO.getError ( ) + ") : " +
                      IO.getErrorMsg ( ) );

       IO.errorON ( );        // habilita a exibicao de erro

       IO.println (  );
       IO.pause   ( "Apertar ENTER para continuar." );

    // testar saida formatada
       IO.println ( "" );
       IO.println ( "Saidas formatadas:" + IO.NEWLINE );
       IO.println ( "" );

       doubleX = 123456.789;

       IO.println ( "Normal     = " + doubleX  );

       IO.println ( "Em moeda   = " + IO.format ( IO.CURRENCY, doubleX ) );
       IO.println ( "Padrao     = " + IO.format ( IO.DEFAULT , doubleX ) );
       IO.println ( "Percentual = " + IO.format ( IO.PERCENT , doubleX ) );
       IO.println ( "Especial   = " + IO.format ( "0.00"     , doubleX ) );

       IO.println (  );
       IO.pause   ( "Apertar ENTER para continuar." );

    // testar o uso de assertivas

       IO.println ( );
       IO.println ( "Teste de uso de assertivas:" );
       IO.println ( );

       IO.assertON ( );       // habilita o uso de assertivas

       intX = 0;

       IO.abortOFF ( );       // nao abortar programa apos teste

       IO.assertTrue ( (intX==0), "ALERTA: Valor nulo." );

    // IO.abortON ( );        // abortar programa apos teste

       IO.assertFalse( (intX!=0), "ALERTA: Valor nulo." );

       IO.assertOFF ( );      // inibir   o uso de assertivas

    // testar o uso de depuradores

       IO.println ( );
       IO.println ( "Teste de uso de depuradores:" );
       IO.println ( );

       IO.debugON ( );

       intX = 0;

       IO.debug   ( (intX==0), "DEBUG: Valor nulo." );
       IO.debug   ( (intX>=0), "DEBUG: Valor positivo." );

       IO.debugOFF ( );

       IO.debug   ( (intX< 0), "DEBUG: Valor negativo." );

       IO.println (  );

    // encerrar
       IO.println (  );
       IO.pause   ( "Apertar ENTER para terminar." );
       IO.exit    (  );       // desnecessario

    } // end main ( )

} // end class Teste_IO01
