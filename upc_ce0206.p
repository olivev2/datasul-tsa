DEF INPUT PARAM p-ind-event  AS CHAR          NO-UNDO.
DEF INPUT PARAM p-ind-object AS CHAR          NO-UNDO.
DEF INPUT PARAM p-wgh-object AS HANDLE        NO-UNDO.
DEF INPUT PARAM p-wgh-frame  AS WIDGET-HANDLE NO-UNDO.
DEF INPUT PARAM p-cod-table  AS CHAR          NO-UNDO.
DEF INPUT PARAM p-row-table  AS ROWID         NO-UNDO.

DEF VAR c-objeto        AS CHAR       NO-UNDO.
DEF VAR h-objeto        AS HANDLE     NO-UNDO.
DEF VAR h-campo         AS HANDLE     NO-UNDO.

DEFINE NEW GLOBAL SHARED VARIABLE h-cod-depos         AS WIDGET-HANDLE    NO-UNDO.
DEFINE NEW GLOBAL SHARED VARIABLE h-cod-depos-dest    AS WIDGET-HANDLE    NO-UNDO.
DEFINE NEW GLOBAL SHARED VARIABLE h-cod-estabel       AS WIDGET-HANDLE    NO-UNDO.
DEF NEW GLOBAL SHARED VAR v_cod_usuar_corren AS CHAR NO-UNDO.
DEFINE VARIABLE l-dep-origem  AS LOGICAL NO-UNDO.
DEFINE VARIABLE l-dep-destino AS LOGICAL NO-UNDO.

ASSIGN c-objeto = ENTRY(NUM-ENTRIES(p-wgh-object:PRIVATE-DATA, "~/"), p-wgh-object:PRIVATE-DATA, "~/").

MESSAGE p-ind-event SKIP
        p-ind-object SKIP
        STRING(p-wgh-object) SKIP
        STRING(p-wgh-frame) SKIP
        p-cod-table SKIP
        STRING(p-row-table) SKIP
        c-objeto
    VIEW-AS ALERT-BOX INFO BUTTONS OK.

IF p-ind-event = "AFTER-ENABLE" AND p-ind-object = "VIEWER" THEN DO:
    ASSIGN h-campo = p-wgh-frame:FIRST-CHILD.
    ASSIGN h-campo = h-campo:FIRST-CHILD.
    DO WHILE h-campo <> ?:

        IF h-campo:NAME = "cod-depos" THEN
            ASSIGN h-cod-depos = h-campo.
        
        IF h-campo:NAME = "c-cod-depos-ent" THEN
            ASSIGN h-cod-depos-dest = h-campo.

        IF h-campo:NAME = "cod-estabel" THEN
            ASSIGN h-cod-estabel = h-campo.

        ASSIGN h-campo = h-campo:NEXT-SIBLING.
    END.

END.

IF p-ind-event = "VALIDATE" AND p-ind-object = "VIEWER" THEN DO:

        ASSIGN l-dep-origem  = CAN-FIND(FIRST usuar-depos WHERE usuar-depos.cod-usuario = v_cod_usuar_corren
                                                            AND usuar-depos.cod-estabel = h-cod-estabel:SCREEN-VALUE
                                                            AND usuar-depos.cod-depos   = h-cod-depos:SCREEN-VALUE
                                                            AND usuar-depos.dat-val-fim >= TODAY)
               l-dep-destino = CAN-FIND(FIRST usuar-depos WHERE usuar-depos.cod-usuario = v_cod_usuar_corren
                                                            AND usuar-depos.cod-estabel = h-cod-estabel:SCREEN-VALUE
                                                            AND usuar-depos.cod-depos   = h-cod-depos-dest:SCREEN-VALUE
                                                            AND usuar-depos.dat-val-fim >= TODAY).

        IF l-dep-origem = FALSE OR l-dep-destino = FALSE THEN DO:

            MESSAGE "Transferància n∆o permitida:" SKIP
                    "----------------------------" SKIP
                    "Dep¢sito Origem:  " h-cod-depos:SCREEN-VALUE SKIP
                    "Dep¢sito Destino: " h-cod-depos-dest:SCREEN-VALUE SKIP
                    "Usu†rio: " v_cod_usuar_corren SKIP
                    "n∆o liberado ou data vencida !"
                VIEW-AS ALERT-BOX ERROR BUTTONS OK TITLE "Regra Espec°fica TSA" .
            RETURN "nok".
        END.

END.

//END.
RETURN "OK".
