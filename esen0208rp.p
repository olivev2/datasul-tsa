/*--------------------------------------------------------------------
*                                                                    *
*           Programa...: ESEN0208RP.P                                *
*           Autor......: Vinicius Oliveira - TSA                     *
*           Data.......: 11/02/2026                                  *
*           Descricao..: Especifico "Onde se usa Sumarizado".        *
*                                                                    *
*--------------------------------------------------------------------*/

DEFINE SHARED VARIABLE c-ge-ini AS INT  FORMAT ">9" 	NO-UNDO.
DEFINE SHARED VARIABLE c-ge-fin AS INT  FORMAT ">9" 	NO-UNDO.
DEFINE SHARED VARIABLE c-fm-ini AS CHAR FORMAT "X(8)" 	NO-UNDO.
DEFINE SHARED VARIABLE c-fm-fin AS CHAR FORMAT "X(8)" 	NO-UNDO.
DEFINE SHARED VARIABLE c-it-ini AS CHAR FORMAT "X(16)" 	NO-UNDO.
DEFINE SHARED VARIABLE c-it-fin AS CHAR FORMAT "X(16)" 	NO-UNDO.
DEFINE SHARED VARIABLE c-bt-obsoleto AS LOGICAL		 	NO-UNDO.

DEF VAR c-desc-es       AS CHAR FORMAT "x(80)" 	NO-UNDO.
DEF VAR c-un-es         AS CHAR FORMAT "x(03)"  NO-UNDO.
DEF VAR c-faixa-titulo  AS CHAR 				NO-UNDO INIT "A1:N1".
DEF VAR i-linha         AS INT  				NO-UNDO INIT 3.
DEF VAR i-coluna        AS INT  				NO-UNDO INIT 1.
DEF VAR l-tem-estrutura AS LOGICAL 				NO-UNDO.
DEF VAR c-data-inicio   AS CHAR 				NO-UNDO.
DEF VAR c-data-termino  AS CHAR 				NO-UNDO.

DEF BUFFER b-item-es FOR mgcad.item.

{utp/utapi013.i}

RUN utp/utapi013.p PERSISTENT SET h-utapi013.

//OS-DELETE VALUE("c:\tmp\ESEN0208RP.xls").

CREATE tt-configuracao2.
ASSIGN
    tt-configuracao2.versao-integracao   = 1
    tt-configuracao2.arquivo-num         = 1
    tt-configuracao2.arquivo             = "c:\tmp\ESEN0208RP" + STRING(TIME, "99999") + ".xls"
    tt-configuracao2.total-planilha      = 1
    tt-configuracao2.exibir-construcao   = NO
    tt-configuracao2.abrir-excel-termino = YES
    tt-configuracao2.imprimir            = NO
    tt-configuracao2.orientacao          = 2.

CREATE tt-planilha2.
ASSIGN
    tt-planilha2.arquivo-num       = 1
    tt-planilha2.planilha-num      = 1
    tt-planilha2.planilha-nome     = "Onde se usa"
    tt-planilha2.linhas-grade      = NO
    tt-planilha2.formatar-planilha = NO
    tt-planilha2.formatar-faixa    = YES.

CREATE tt-dados.
ASSIGN tt-dados.arquivo-num   = 1
       tt-dados.planilha-num  = 1
       tt-dados.celula-coluna = 1
       tt-dados.celula-linha  = i-linha - 2
       tt-dados.celula-valor  = "Listagem Onde-Se-Usa".
       
CREATE tt-dados.
ASSIGN tt-dados.arquivo-num   = 1
       tt-dados.planilha-num  = 1
       tt-dados.celula-coluna = 1
       tt-dados.celula-linha  = i-linha - 1
       tt-dados.celula-valor  = "Componente".

CREATE tt-dados.
ASSIGN tt-dados.arquivo-num   = 1
       tt-dados.planilha-num  = 1
       tt-dados.celula-coluna = 2
       tt-dados.celula-linha  = i-linha - 1
       tt-dados.celula-valor  = "Descricao".

CREATE tt-dados.
ASSIGN tt-dados.arquivo-num   = 1
       tt-dados.planilha-num  = 1
       tt-dados.celula-coluna = 3
       tt-dados.celula-linha  = i-linha - 1
       tt-dados.celula-valor  = "Un".

CREATE tt-dados.
ASSIGN tt-dados.arquivo-num   = 1
       tt-dados.planilha-num  = 1
       tt-dados.celula-coluna = 4
       tt-dados.celula-linha  = i-linha - 1
       tt-dados.celula-valor  = "Seq".

CREATE tt-dados.
ASSIGN tt-dados.arquivo-num   = 1
       tt-dados.planilha-num  = 1
       tt-dados.celula-coluna = 5
       tt-dados.celula-linha  = i-linha - 1
       tt-dados.celula-valor  = "Item".

CREATE tt-dados.
ASSIGN tt-dados.arquivo-num   = 1
       tt-dados.planilha-num  = 1
       tt-dados.celula-coluna = 6
       tt-dados.celula-linha  = i-linha - 1
       tt-dados.celula-valor  = "Descricao".

CREATE tt-dados.
ASSIGN tt-dados.arquivo-num   = 1
       tt-dados.planilha-num  = 1
       tt-dados.celula-coluna = 7
       tt-dados.celula-linha  = i-linha - 1
       tt-dados.celula-valor  = "Un".

CREATE tt-dados.
ASSIGN tt-dados.arquivo-num   = 1
       tt-dados.planilha-num  = 1
       tt-dados.celula-coluna = 8
       tt-dados.celula-linha  = i-linha - 1
       tt-dados.celula-valor  = "Quantidade".       

CREATE tt-dados.
ASSIGN tt-dados.arquivo-num   = 1
       tt-dados.planilha-num  = 1
       tt-dados.celula-coluna = 9
       tt-dados.celula-linha  = i-linha - 1
       tt-dados.celula-valor  = "Perda".       

CREATE tt-dados.
ASSIGN tt-dados.arquivo-num   = 1
       tt-dados.planilha-num  = 1
       tt-dados.celula-coluna = 10
       tt-dados.celula-linha  = i-linha - 1
       tt-dados.celula-valor  = "Prop".  
            
CREATE tt-dados.
ASSIGN tt-dados.arquivo-num   = 1
       tt-dados.planilha-num  = 1
       tt-dados.celula-coluna = 11
       tt-dados.celula-linha  = i-linha - 1
       tt-dados.celula-valor  = "Qtde Liquida".       

CREATE tt-dados.
ASSIGN tt-dados.arquivo-num   = 1
       tt-dados.planilha-num  = 1
       tt-dados.celula-coluna = 12
       tt-dados.celula-linha  = i-linha - 1
       tt-dados.celula-valor  = "Inicio".       
       
CREATE tt-dados.
ASSIGN tt-dados.arquivo-num   = 1
       tt-dados.planilha-num  = 1
       tt-dados.celula-coluna = 13
       tt-dados.celula-linha  = i-linha - 1
       tt-dados.celula-valor  = "Termino".  

CREATE tt-dados.
ASSIGN tt-dados.arquivo-num   = 1
       tt-dados.planilha-num  = 1
       tt-dados.celula-coluna = 14
       tt-dados.celula-linha  = i-linha - 1
       tt-dados.celula-valor  = "L.Compon".            

/* Mesclar */
CREATE tt-formatar.
ASSIGN
    tt-formatar.arquivo-num  = 1
    tt-formatar.planilha-num = 1
    tt-formatar.faixa        = c-faixa-titulo
    tt-formatar.atributo     = "merge"
    tt-formatar.valor        = "yes".

/* Negrito */
CREATE tt-formatar.
ASSIGN
    tt-formatar.arquivo-num  = 1
    tt-formatar.planilha-num = 1
    tt-formatar.faixa        = c-faixa-titulo
    tt-formatar.atributo     = "Bold"
    tt-formatar.valor        = "yes".

/* Centralizar */
CREATE tt-formatar.
ASSIGN
    tt-formatar.arquivo-num  = 1
    tt-formatar.planilha-num = 1
    tt-formatar.faixa        = c-faixa-titulo
    tt-formatar.atributo     = "HorizontalAlignment"
    tt-formatar.valor        = "01".

/* Fundo Azul */
CREATE tt-formatar.
ASSIGN
    tt-formatar.arquivo-num  = 1
    tt-formatar.planilha-num = 1
    tt-formatar.faixa        = "A1:N2"
    tt-formatar.atributo     = "iColorIndex"
    tt-formatar.valor        = "5".
                            
i-linha = i-linha - 1.
                                         
FOR EACH mgcad.item WHERE mgcad.item.ge-codigo >= c-ge-ini 
                      AND mgcad.item.ge-codigo <= c-ge-fin
                      AND mgcad.item.fm-codigo >= c-fm-ini
                      AND mgcad.item.fm-codigo <= c-fm-fin 
                      AND mgcad.item.it-codigo >= c-it-ini
                      AND mgcad.item.it-codigo <= c-it-fin	NO-LOCK.
                
    FOR EACH estrutura WHERE estrutura.es-codigo = item.it-codigo 
                         AND (NOT c-bt-obsoleto OR (mgcad.estrutura.data-termino <> ? 
                         AND mgcad.estrutura.data-termino > TODAY)) NO-LOCK.

					i-linha = i-linha + 1.
					
					FIND FIRST b-item-es WHERE b-item-es.it-codigo = mgcad.estrutura.it-codigo NO-LOCK NO-ERROR.
					
					IF AVAILABLE b-item-es THEN 
					ASSIGN 	c-desc-es = b-item-es.desc-item 
							c-un-es   = b-item-es.un.
					ELSE
					ASSIGN 	c-desc-es = ""
							c-un-es   = "".
					
					ASSIGN  c-data-inicio  = STRING(mgcad.estrutura.data-inicio, "99/99/9999").			 			 
							c-data-termino = STRING(mgcad.estrutura.data-termino, "99/99/9999").
    					
		IF AVAIL estrutura THEN 
                
				CREATE tt-dados.
                ASSIGN tt-dados.arquivo-num    = 1
                       tt-dados.planilha-num   = 1
                       tt-dados.celula-coluna  = 1
                       tt-dados.celula-linha   = i-linha
                       tt-dados.celula-formato = "@"
                       tt-dados.celula-valor   = item.it-codigo.
                
                CREATE tt-dados.
                ASSIGN tt-dados.arquivo-num   = 1
                       tt-dados.planilha-num  = 1
                       tt-dados.celula-coluna = 2
                       tt-dados.celula-linha  = i-linha
                       tt-dados.celula-valor  = item.desc-item.
                    
                CREATE tt-dados.
                ASSIGN tt-dados.arquivo-num   = 1
                       tt-dados.planilha-num  = 1
                       tt-dados.celula-coluna = 3
                       tt-dados.celula-linha  = i-linha
                       tt-dados.celula-valor  = item.un.
					   
                CREATE tt-dados.
                ASSIGN tt-dados.arquivo-num   = 1
                       tt-dados.planilha-num  = 1
                       tt-dados.celula-coluna = 4
                       tt-dados.celula-linha  = i-linha
                       tt-dados.celula-valor  = string(mgcad.estrutura.sequencia).
                       
                CREATE tt-dados.
                ASSIGN tt-dados.arquivo-num   = 1
                       tt-dados.planilha-num  = 1
                       tt-dados.celula-coluna = 5
                       tt-dados.celula-linha  = i-linha
                       tt-dados.celula-formato = "@"
                       tt-dados.celula-valor  = mgcad.estrutura.it-codigo.
                       
                CREATE tt-dados.
                ASSIGN tt-dados.arquivo-num   = 1
                       tt-dados.planilha-num  = 1
                       tt-dados.celula-coluna = 6
                       tt-dados.celula-linha  = i-linha
                       tt-dados.celula-valor  = c-desc-es.
             
                CREATE tt-dados.
                ASSIGN tt-dados.arquivo-num   = 1
                       tt-dados.planilha-num  = 1
                       tt-dados.celula-coluna = 7
                       tt-dados.celula-linha  = i-linha
                       tt-dados.celula-valor  = c-un-es.
                       
                CREATE tt-dados.
                ASSIGN tt-dados.arquivo-num    = 1
                       tt-dados.planilha-num   = 1
                       tt-dados.celula-coluna  = 8
                       tt-dados.celula-linha   = i-linha
                       tt-dados.celula-formato = "@"
                       tt-dados.celula-valor   = STRING(mgcad.estrutura.qtd-item).
                       
                CREATE tt-dados.
                ASSIGN tt-dados.arquivo-num    = 1
                       tt-dados.planilha-num   = 1
                       tt-dados.celula-coluna  = 9
                       tt-dados.celula-linha   = i-linha
                       tt-dados.celula-formato = "@"
                       tt-dados.celula-valor   = STRING(mgcad.estrutura.fator-perda).
                       
                CREATE tt-dados.
                ASSIGN tt-dados.arquivo-num    = 1
                       tt-dados.planilha-num   = 1
                       tt-dados.celula-coluna  = 10
                       tt-dados.celula-linha   = i-linha
                       tt-dados.celula-formato = "@"
                       tt-dados.celula-valor   = STRING(mgcad.estrutura.proporcao).
                       
                CREATE tt-dados.
                ASSIGN tt-dados.arquivo-num    = 1
                       tt-dados.planilha-num   = 1
                       tt-dados.celula-coluna  = 11
                       tt-dados.celula-linha   = i-linha
                       tt-dados.celula-formato = "@"
                       tt-dados.celula-valor   = STRING(mgcad.estrutura.quant-liquid).
             
                CREATE tt-dados.
                ASSIGN tt-dados.arquivo-num    = 1
                       tt-dados.planilha-num   = 1
                       tt-dados.celula-coluna  = 12
                       tt-dados.celula-linha   = i-linha
                       tt-dados.celula-formato = "@"
					   tt-dados.celula-valor   = c-data-inicio.
                       
                CREATE tt-dados.
                ASSIGN tt-dados.arquivo-num    = 1
                       tt-dados.planilha-num   = 1
                       tt-dados.celula-coluna  = 13
                       tt-dados.celula-linha   = i-linha
                       tt-dados.celula-formato = "@"
					   tt-dados.celula-valor   = c-data-termino.
             
                CREATE tt-dados.
                ASSIGN tt-dados.arquivo-num   = 1
                       tt-dados.planilha-num  = 1
                       tt-dados.celula-coluna = 14
                       tt-dados.celula-linha  = i-linha
                       tt-dados.celula-valor  = STRING(mgcad.estrutura.cod-lista-compon).
                
                
    END. 
                      
END.

CREATE tt-formatar.
ASSIGN
    tt-formatar.arquivo-num  = 1
    tt-formatar.planilha-num = 1
    tt-formatar.faixa        = "A3:N9999"
    tt-formatar.atributo     = "HorizontalAlignment"
    tt-formatar.valor        = "05".
    
CREATE tt-formatar.
ASSIGN
    tt-formatar.arquivo-num  = 1
    tt-formatar.planilha-num = 1
    tt-formatar.faixa        = "F:F"
    tt-formatar.atributo     = "HorizontalAlignment"
    tt-formatar.valor        = "04".
    
CREATE tt-formatar.
ASSIGN
    tt-formatar.arquivo-num  = 1
    tt-formatar.planilha-num = 1
    tt-formatar.faixa        = "B:B"
    tt-formatar.atributo     = "HorizontalAlignment"
    tt-formatar.valor        = "04".
    
CREATE tt-formatar.
ASSIGN
    tt-formatar.arquivo-num  = 1
    tt-formatar.planilha-num = 1
    tt-formatar.faixa        = "A1:N9999"
    tt-formatar.atributo     = "AutoFit"
    tt-formatar.valor        = "true".
   
RUN pi-execute3 IN h-utapi013 (
    INPUT-OUTPUT TABLE tt-configuracao2,
    INPUT-OUTPUT TABLE tt-planilha2,
    INPUT-OUTPUT TABLE tt-dados,
    INPUT-OUTPUT TABLE tt-formatar,
    INPUT-OUTPUT TABLE tt-grafico2,
    INPUT-OUTPUT TABLE tt-erros).

IF RETURN-VALUE = "nok" THEN DO:
    FOR EACH tt-erros:
        DISPLAY tt-erros WITH 1 COL WIDTH 500.
    END.
END.

DELETE PROCEDURE h-utapi013.
