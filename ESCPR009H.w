&ANALYZE-SUSPEND _VERSION-NUMBER AB_v10r12 GUI
&ANALYZE-RESUME
&Scoped-define WINDOW-NAME C-Win
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS C-Win 
/*------------------------------------------------------------------------

  File:                         ESCPR009H.W

  Description:                  Movimento Reporte-Familia

  Author:                       VINICIUS DE OLIVEIRA - TSA

  Created:                      24/02/2026                      

------------------------------------------------------------------------*/
/*          This .W file was created with the Progress AppBuilder.      */
/*----------------------------------------------------------------------*/

/* Create an unnamed pool to store all the widgets created 
     by this procedure. This is a good default which assures
     that this procedure's triggers and internal procedures 
     will execute in this procedure's storage, and that proper
     cleanup will occur on deletion of the procedure. */

CREATE WIDGET-POOL.

/* ***************************  Definitions  ************************** */

/* Parameters Definitions ---                                           */

/* Local Variable Definitions ---                                       */

DEFINE NEW GLOBAL SHARED VARIABLE c-dt-movto-ini    AS DATE FORMAT "99/99/9999" NO-UNDO.  
DEFINE NEW GLOBAL SHARED VARIABLE c-dt-movto-fin    AS DATE FORMAT "99/99/9999" NO-UNDO. 
DEFINE NEW GLOBAL SHARED VARIABLE c-it-cod-ini      AS CHAR FORMAT "x(16)" NO-UNDO.
DEFINE NEW GLOBAL SHARED VARIABLE c-it-cod-fin      AS CHAR FORMAT "x(16)" NO-UNDO.
DEFINE NEW GLOBAL SHARED VARIABLE c-fm-cod-ini      AS CHAR FORMAT "x(8)" NO-UNDO.
DEFINE NEW GLOBAL SHARED VARIABLE c-fm-cod-fin      AS CHAR FORMAT "x(8)" NO-UNDO.
DEFINE NEW GLOBAL SHARED VARIABLE c-planejador-ini  AS CHAR FORMAT "x(12)" NO-UNDO.
DEFINE NEW GLOBAL SHARED VARIABLE c-planejador-fin  AS CHAR FORMAT "x(12)" NO-UNDO.
DEFINE NEW GLOBAL SHARED VARIABLE c-cod-estab-ini   AS CHAR FORMAT "X(5)" NO-UNDO.
DEFINE NEW GLOBAL SHARED VARIABLE c-cod-estab-fin   AS CHAR FORMAT "X(5)" NO-UNDO.
DEFINE NEW GLOBAL SHARED VARIABLE c-nr-linha-ini    AS INT  NO-UNDO.
DEFINE NEW GLOBAL SHARED VARIABLE c-nr-linha-fin    AS INT  NO-UNDO.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Window
&Scoped-define DB-AWARE no

/* Name of designated FRAME-NAME and/or first browse and/or first query */
&Scoped-define FRAME-NAME DEFAULT-FRAME

/* Standard List Definitions                                            */
&Scoped-Define ENABLED-OBJECTS RECT-1 RECT-2 IMAGE-1 IMAGE-2 IMAGE-3 ~
IMAGE-4 IMAGE-5 IMAGE-6 IMAGE-7 IMAGE-8 IMAGE-9 IMAGE-10 IMAGE-11 IMAGE-12 ~
dt-movto-ini dt-movto-fin it-cod-ini it-cod-fin fm-cod-ini fm-cod-fin ~
planejador-ini planejador-fin cod-estab-ini cod-estab-fin nr-linha-ini ~
nr-linha-fin bt-exec bt-canc 
&Scoped-Define DISPLAYED-OBJECTS dt-movto-ini dt-movto-fin it-cod-ini ~
it-cod-fin fm-cod-ini fm-cod-fin planejador-ini planejador-fin ~
cod-estab-ini cod-estab-fin nr-linha-ini nr-linha-fin 

/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* ***********************  Control Definitions  ********************** */

/* Define the widget handle for the window                              */
DEFINE VAR C-Win AS WIDGET-HANDLE NO-UNDO.

/* Definitions of the field level widgets                               */
DEFINE BUTTON bt-canc 
     LABEL "Cancelar" 
     SIZE 15 BY 1.14.

DEFINE BUTTON bt-exec 
     LABEL "Executar" 
     SIZE 15 BY 1.14.

DEFINE VARIABLE cod-estab-fin AS CHARACTER FORMAT "X(5)":U INITIAL "ZZZ"
     VIEW-AS FILL-IN 
     SIZE 14 BY 1 NO-UNDO.

DEFINE VARIABLE cod-estab-ini AS CHARACTER FORMAT "X(5)":U 
     LABEL "Estabelecimento" 
     VIEW-AS FILL-IN 
     SIZE 14 BY 1 NO-UNDO.

DEFINE VARIABLE dt-movto-fin AS DATE FORMAT "99/99/9999":U INITIAL TODAY 
     VIEW-AS FILL-IN 
     SIZE 14 BY 1 NO-UNDO.

DEFINE VARIABLE dt-movto-ini AS DATE FORMAT "99/99/9999":U INITIAL TODAY
     LABEL "Data Movto" 
     VIEW-AS FILL-IN 
     SIZE 14 BY 1 NO-UNDO.

DEFINE VARIABLE fm-cod-fin AS CHARACTER FORMAT "X(8)":U INITIAL "ZZZZZZZZ" 
     VIEW-AS FILL-IN 
     SIZE 14 BY 1 NO-UNDO.

DEFINE VARIABLE fm-cod-ini AS CHARACTER FORMAT "X(8)":U 
     LABEL "Familia" 
     VIEW-AS FILL-IN 
     SIZE 14 BY 1 NO-UNDO.

DEFINE VARIABLE it-cod-fin AS CHARACTER FORMAT "X(16)":U INITIAL "ZZZZZZZZ" 
     VIEW-AS FILL-IN 
     SIZE 14 BY 1 NO-UNDO.

DEFINE VARIABLE it-cod-ini AS CHARACTER FORMAT "X(16)":U 
     LABEL "Item" 
     VIEW-AS FILL-IN 
     SIZE 14 BY 1 NO-UNDO.

DEFINE VARIABLE nr-linha-fin AS INTEGER FORMAT "->,>>>,>>9":U INITIAL 999999 
     VIEW-AS FILL-IN 
     SIZE 14 BY 1 NO-UNDO.

DEFINE VARIABLE nr-linha-ini AS INTEGER FORMAT "->,>>>,>>9":U INITIAL 0 
     LABEL "Nr Linha" 
     VIEW-AS FILL-IN 
     SIZE 14 BY 1 NO-UNDO.

DEFINE VARIABLE planejador-fin AS CHARACTER FORMAT "X(12)":U INITIAL "ZZZZZZZZZZZZ" 
     VIEW-AS FILL-IN 
     SIZE 14 BY 1 NO-UNDO.

DEFINE VARIABLE planejador-ini AS CHARACTER FORMAT "X(12)":U 
     LABEL "Planejador" 
     VIEW-AS FILL-IN 
     SIZE 14 BY 1 NO-UNDO.

DEFINE IMAGE IMAGE-1
     FILENAME "//tsasrv07/erp12/console/image/ii-ff.bmp":U
     SIZE 7 BY 1.43.

DEFINE IMAGE IMAGE-10
     FILENAME "//tsasrv07/erp12/console/image/ii-rew.bmp":U
     SIZE 7 BY 1.43.

DEFINE IMAGE IMAGE-11
     FILENAME "//tsasrv07/erp12/console/image/ii-rew.bmp":U
     SIZE 7 BY 1.43.

DEFINE IMAGE IMAGE-12
     FILENAME "//tsasrv07/erp12/console/image/ii-rew.bmp":U
     SIZE 7 BY 1.43.

DEFINE IMAGE IMAGE-2
     FILENAME "//tsasrv07/erp12/console/image/ii-ff.bmp":U
     SIZE 7 BY 1.43.

DEFINE IMAGE IMAGE-3
     FILENAME "//tsasrv07/erp12/console/image/ii-ff.bmp":U
     SIZE 7 BY 1.43.

DEFINE IMAGE IMAGE-4
     FILENAME "//tsasrv07/erp12/console/image/ii-ff.bmp":U
     SIZE 7 BY 1.43.

DEFINE IMAGE IMAGE-5
     FILENAME "//tsasrv07/erp12/console/image/ii-ff.bmp":U
     SIZE 7 BY 1.43.

DEFINE IMAGE IMAGE-6
     FILENAME "//tsasrv07/erp12/console/image/ii-ff.bmp":U
     SIZE 7 BY 1.43.

DEFINE IMAGE IMAGE-7
     FILENAME "//tsasrv07/erp12/console/image/ii-rew.bmp":U
     SIZE 7 BY 1.43.

DEFINE IMAGE IMAGE-8
     FILENAME "//tsasrv07/erp12/console/image/ii-rew.bmp":U
     SIZE 7 BY 1.43.

DEFINE IMAGE IMAGE-9
     FILENAME "//tsasrv07/erp12/console/image/ii-rew.bmp":U
     SIZE 7 BY 1.43.

DEFINE RECTANGLE RECT-1
     EDGE-PIXELS 2 GRAPHIC-EDGE  NO-FILL   
     SIZE 82.8 BY 9.76.

DEFINE RECTANGLE RECT-2
     EDGE-PIXELS 2 GRAPHIC-EDGE  NO-FILL   
     SIZE 83 BY 2.1.


/* ************************  Frame Definitions  *********************** */

DEFINE FRAME DEFAULT-FRAME
     dt-movto-ini AT ROW 2.48 COL 21.8 COLON-ALIGNED WIDGET-ID 10
     dt-movto-fin AT ROW 2.48 COL 50 COLON-ALIGNED NO-LABEL WIDGET-ID 12
     it-cod-ini AT ROW 3.67 COL 21.8 COLON-ALIGNED WIDGET-ID 14
     it-cod-fin AT ROW 3.67 COL 50 COLON-ALIGNED NO-LABEL WIDGET-ID 16
     fm-cod-ini AT ROW 4.86 COL 21.8 COLON-ALIGNED WIDGET-ID 18
     fm-cod-fin AT ROW 4.86 COL 50 COLON-ALIGNED NO-LABEL WIDGET-ID 20
     planejador-ini AT ROW 6.1 COL 21.8 COLON-ALIGNED WIDGET-ID 22
     planejador-fin AT ROW 6.1 COL 50 COLON-ALIGNED NO-LABEL WIDGET-ID 24
     cod-estab-ini AT ROW 7.43 COL 21.8 COLON-ALIGNED WIDGET-ID 26
     cod-estab-fin AT ROW 7.43 COL 50 COLON-ALIGNED NO-LABEL WIDGET-ID 28
     nr-linha-ini AT ROW 8.67 COL 21.8 COLON-ALIGNED WIDGET-ID 30
     nr-linha-fin AT ROW 8.67 COL 50 COLON-ALIGNED NO-LABEL WIDGET-ID 32
     bt-exec AT ROW 11.76 COL 4.2 WIDGET-ID 6
     bt-canc AT ROW 11.76 COL 19.8 WIDGET-ID 8
     RECT-1 AT ROW 1.24 COL 2 WIDGET-ID 2
     RECT-2 AT ROW 11.24 COL 2 WIDGET-ID 4
     IMAGE-1 AT ROW 2.24 COL 46 WIDGET-ID 34
     IMAGE-2 AT ROW 3.48 COL 46 WIDGET-ID 36
     IMAGE-3 AT ROW 4.71 COL 46 WIDGET-ID 38
     IMAGE-4 AT ROW 5.95 COL 46 WIDGET-ID 40
     IMAGE-5 AT ROW 7.29 COL 46 WIDGET-ID 42
     IMAGE-6 AT ROW 8.52 COL 46 WIDGET-ID 44
     IMAGE-7 AT ROW 2.24 COL 39 WIDGET-ID 46
     IMAGE-8 AT ROW 3.52 COL 39 WIDGET-ID 48
     IMAGE-9 AT ROW 4.76 COL 39 WIDGET-ID 50
     IMAGE-10 AT ROW 6.05 COL 39 WIDGET-ID 52
     IMAGE-11 AT ROW 7.29 COL 39 WIDGET-ID 56
     IMAGE-12 AT ROW 8.57 COL 39 WIDGET-ID 54
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 1
         SIZE 85 BY 12.81 WIDGET-ID 100.


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: Window
   Allow: Basic,Browse,DB-Fields,Window,Query
   Other Settings: COMPILE
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
IF SESSION:DISPLAY-TYPE = "GUI":U THEN
  CREATE WINDOW C-Win ASSIGN
         HIDDEN             = YES
         TITLE              = "Movimento Reporte-Familia"
         HEIGHT             = 12.71
         WIDTH              = 85
         MAX-HEIGHT         = 37.76
         MAX-WIDTH          = 307.2
         VIRTUAL-HEIGHT     = 37.76
         VIRTUAL-WIDTH      = 307.2
         RESIZE             = yes
         SCROLL-BARS        = no
         STATUS-AREA        = no
         BGCOLOR            = ?
         FGCOLOR            = ?
         KEEP-FRAME-Z-ORDER = yes
         THREE-D            = yes
         MESSAGE-AREA       = no
         SENSITIVE          = yes.
ELSE {&WINDOW-NAME} = CURRENT-WINDOW.
/* END WINDOW DEFINITION                                                */
&ANALYZE-RESUME



/* ***********  Runtime Attributes and AppBuilder Settings  *********** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* SETTINGS FOR WINDOW C-Win
  VISIBLE,,RUN-PERSISTENT                                               */
/* SETTINGS FOR FRAME DEFAULT-FRAME
   FRAME-NAME                                                           */
IF SESSION:DISPLAY-TYPE = "GUI":U AND VALID-HANDLE(C-Win)
THEN C-Win:HIDDEN = no.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME

 



/* ************************  Control Triggers  ************************ */

&Scoped-define SELF-NAME C-Win
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL C-Win C-Win
ON END-ERROR OF C-Win /* Movimento Reporte-Familia */
OR ENDKEY OF {&WINDOW-NAME} ANYWHERE DO:
  /* This case occurs when the user presses the "Esc" key.
     In a persistently run window, just ignore this.  If we did not, the
     application would exit. */
  IF THIS-PROCEDURE:PERSISTENT THEN RETURN NO-APPLY.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL C-Win C-Win
ON WINDOW-CLOSE OF C-Win /* Movimento Reporte-Familia */
DO:
  /* This event will close the window and terminate the procedure.  */
  APPLY "CLOSE":U TO THIS-PROCEDURE.
  RETURN NO-APPLY.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-canc
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-canc C-Win
ON CHOOSE OF bt-canc IN FRAME DEFAULT-FRAME /* Cancelar */
DO:
  /* This event will close the window and terminate the procedure.  */
  APPLY "CLOSE":U TO THIS-PROCEDURE.
  RETURN NO-APPLY.  
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME bt-exec
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL bt-exec C-Win
ON CHOOSE OF bt-exec IN FRAME DEFAULT-FRAME /* Executar */
DO:
  RUN pi-executar.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&UNDEFINE SELF-NAME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK C-Win 


/* ***************************  Main Block  *************************** */

/* Set CURRENT-WINDOW: this will parent dialog-boxes and frames.        */
ASSIGN CURRENT-WINDOW                = {&WINDOW-NAME} 
       THIS-PROCEDURE:CURRENT-WINDOW = {&WINDOW-NAME}.

/* The CLOSE event can be used from inside or outside the procedure to  */
/* terminate it.                                                        */
ON CLOSE OF THIS-PROCEDURE 
   RUN disable_UI.

/* Best default for GUI applications is...                              */
PAUSE 0 BEFORE-HIDE.

/* Now enable the interface and wait for the exit condition.            */
/* (NOTE: handle ERROR and END-KEY so cleanup code will always fire.    */
MAIN-BLOCK:
DO ON ERROR   UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK
   ON END-KEY UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK:
  RUN enable_UI.
  IF NOT THIS-PROCEDURE:PERSISTENT THEN
    WAIT-FOR CLOSE OF THIS-PROCEDURE.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE disable_UI C-Win  _DEFAULT-DISABLE
PROCEDURE disable_UI :
/*------------------------------------------------------------------------------
  Purpose:     DISABLE the User Interface
  Parameters:  <none>
  Notes:       Here we clean-up the user-interface by deleting
               dynamic widgets we have created and/or hide 
               frames.  This procedure is usually called when
               we are ready to "clean-up" after running.
------------------------------------------------------------------------------*/
  /* Delete the WINDOW we created */
  IF SESSION:DISPLAY-TYPE = "GUI":U AND VALID-HANDLE(C-Win)
  THEN DELETE WIDGET C-Win.
  IF THIS-PROCEDURE:PERSISTENT THEN DELETE PROCEDURE THIS-PROCEDURE.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE enable_UI C-Win  _DEFAULT-ENABLE
PROCEDURE enable_UI :
/*------------------------------------------------------------------------------
  Purpose:     ENABLE the User Interface
  Parameters:  <none>
  Notes:       Here we display/view/enable the widgets in the
               user-interface.  In addition, OPEN all queries
               associated with each FRAME and BROWSE.
               These statements here are based on the "Other 
               Settings" section of the widget Property Sheets.
------------------------------------------------------------------------------*/
  DISPLAY dt-movto-ini dt-movto-fin it-cod-ini it-cod-fin fm-cod-ini fm-cod-fin 
          planejador-ini planejador-fin cod-estab-ini cod-estab-fin nr-linha-ini 
          nr-linha-fin 
      WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
  ENABLE RECT-1 RECT-2 IMAGE-1 IMAGE-2 IMAGE-3 IMAGE-4 IMAGE-5 IMAGE-6 IMAGE-7 
         IMAGE-8 IMAGE-9 IMAGE-10 IMAGE-11 IMAGE-12 dt-movto-ini dt-movto-fin 
         it-cod-ini it-cod-fin fm-cod-ini fm-cod-fin planejador-ini 
         planejador-fin cod-estab-ini cod-estab-fin nr-linha-ini nr-linha-fin 
         bt-exec bt-canc 
      WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
  {&OPEN-BROWSERS-IN-QUERY-DEFAULT-FRAME}
  VIEW C-Win.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE pi-executar C-Win 
PROCEDURE pi-executar :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/

    ASSIGN  c-dt-movto-ini    =  INPUT FRAME DEFAULT-FRAME dt-movto-ini  
            c-dt-movto-fin    =  INPUT FRAME DEFAULT-FRAME dt-movto-fin  
            c-it-cod-ini      =  INPUT FRAME DEFAULT-FRAME it-cod-ini    
            c-it-cod-fin      =  INPUT FRAME DEFAULT-FRAME it-cod-fin    
            c-fm-cod-ini      =  INPUT FRAME DEFAULT-FRAME fm-cod-ini    
            c-fm-cod-fin      =  INPUT FRAME DEFAULT-FRAME fm-cod-fin    
            c-planejador-ini  =	 INPUT FRAME DEFAULT-FRAME planejador-ini
            c-planejador-fin  =	 INPUT FRAME DEFAULT-FRAME planejador-fin
            c-cod-estab-ini   =	 INPUT FRAME DEFAULT-FRAME cod-estab-ini 
            c-cod-estab-fin   =	 INPUT FRAME DEFAULT-FRAME cod-estab-fin 
            c-nr-linha-ini    =	 INPUT FRAME DEFAULT-FRAME nr-linha-ini  
            c-nr-linha-fin    =	 INPUT FRAME DEFAULT-FRAME nr-linha-fin.  

    RUN esp\escpr009hrp.p.
    
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

