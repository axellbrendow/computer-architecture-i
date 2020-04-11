--------------------------------------------
 IO (Java) v0.9l
 PUC-Minas 
 Instituto de Ciências Exatas e Informática
 31/07/2018
--------------------------------------------

Para instalar:

1.) Copiar o arquivo IO.jar para a pasta
    
    JAVAHOME\

    Dica (1.A): 
    JAVAHOME é a referência básica para a pasta 
    onde o pacote JDK foi instalado. 
    JAVAHOME também é nome de uma variável de ambiente que no 
    Windows poderá ser acessada da seguinte forma: 

    Meu Computador\Propriedades\Avançado\Variáveis de Ambiente\Variáveis de Sistema

    Dica (1.B): 
    Outros exemplos de JAVAHOME:

    No Windows:

    C:\Java
    C:\Program Files\Java
    C:\Program Files\Java\jdk
    C:\Arquivos de Programas\Java
    C:\Arquivos de Programas\Java\jdk

2.) Compilar e executar os arquivos Teste_IO1.java e Teste_IO2.java 
    para testar a instalação da classe IO:
  
    No Windows:

    javac -cp C:/Java/IO.jar;./  Teste_IO1.java  
    javac -cp JAVAHOME/IO.jar;./ Teste_IO2.java

    OBS.:
    Recomendável usar a primeira forma.

    No Linux:

    javac -cp /opt/Java/IO.jar;./ Teste_IO1.java  
    javac -cp JAVAHOME/IO.jar;./  Teste_IO2.java

    OBS.:
    Recomendável usar a primeira forma,
    bem como a criação da pasta /opt/Java.
    
3.) Copiar as pastas com a documentação e os testes para 
    JAVAHOME\docs.

4.) Providências a serem tomadas em caso de erro 
    com a localização da classe IO:

    4.1.) Localizar a instalação atual do ambiente Java (jre) ativo
          (poderá existir mais de um, por exemplo, jre7)

    4.2.) Criar uma variável de ambiente:

	  CLASSPATH com o valor igual a

          JAVAHOME/IO.jar;./

	  Dica (4.2.A): 
          No Windows, as variáveis de ambiente podem ser acessadas
          a partir do seguinte caminho: 

          Meu Computador\Propriedades\Avançado\Variáveis de Ambiente\Variáveis de Sistema

    4.3.) Localizar a variável de ambiente PATH e 
          concatenar à essa variável:   

          JAVAHOME;./

	  Dica (4.3.A): 
          Concatenar significa manter o valor atual e 
          adicionar por justaposição o novo valor
          (colocar no final).

          Dica (4.3.B): 
          No Windows, as variáveis de ambiente podem ser acessadas
          a partir do seguinte caminho: 

          Meu Computador\Propriedades\
            Configurações avançadas de sistema
              Variáveis de Ambiente\Variáveis de Sistema

    4.4.) Se for usar o jGRASP,
          e todas as opções acima tiverem falhado,
          acrescentar a partir de

          Settings
            PATH/CLASSPATH
              Workspace
                CLASSPATHS (aba)
                  New (botão)
                    Browse (até JAVAHOME/IO.jar)
                    OK
                  Apply
                OK
