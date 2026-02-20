&ANALYZE-SUSPEND _VERSION-NUMBER AB_v10r12 GUI
&ANALYZE-RESUME
&Scoped-define WINDOW-NAME C-Win
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS C-Win 
/*------------------------------------------------------------------------

  File:                         ESEN0208.W

  Description:                  ONDE SE USA

  Author:                       VINICIUS DE OLIVEIRA - TSA

  Created:                      12/02/2026                      

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

DEFINE NEW GLOBAL SHARED VARIABLE c-ge-ini AS INT FORMAT ">9" NO-UNDO.
DEFINE NEW GLOBAL SHARED VARIABLE c-ge-fin AS INT FORMAT ">9" NO-UNDO.
DEFINE NEW GLOBAL SHARED VARIABLE c-fm-ini AS CHAR FORMAT "X(8)" NO-UNDO.
DEFINE NEW GLOBAL SHARED VARIABLE c-fm-fin AS CHAR FORMAT "X(8)" NO-UNDO.
DEFINE NEW GLOBAL SHARED VARIABLE c-it-ini AS CHAR FORMAT "X(16)" NO-UNDO.
DEFINE NEW GLOBAL SHARED VARIABLE c-it-fin AS CHAR FORMAT "X(16)" NO-UNDO.
DEFINE NEW GLOBAL SHARED VARIABLE c-bt-obsoleto AS LOGICAL NO-UNDO.


/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Window
&Scoped-define DB-AWARE no

/* Name of designated FRAME-NAME and/or first browse and/or first query */
&Scoped-define FRAME-NAME DEFAULT-FRAME

/* Standard List Definitions                                            */
&Scoped-Define ENABLED-OBJECTS RECT-1 RECT-2 IMAGE-2 IMAGE-3 IMAGE-4 ~
IMAGE-5 IMAGE-6 IMAGE-7 ge-ini ge-fin fm-fin fm-ini it-fin it-ini ~
bt-obsoleto bt-exec bt-canc 
&Scoped-Define DISPLAYED-OBJECTS ge-ini ge-fin fm-fin fm-ini it-fin it-ini ~
bt-obsoleto 

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
     SIZE 20 BY 1.43.

DEFINE BUTTON bt-exec 
     LABEL "Executar" 
     SIZE 20 BY 1.43.

DEFINE VARIABLE fm-fin AS CHARACTER FORMAT "X(8)":U INITIAL "ZZZZZZZZ" 
     VIEW-AS FILL-IN 
     SIZE 14 BY 1 NO-UNDO.

DEFINE VARIABLE fm-ini AS CHARACTER FORMAT "X(8)":U INITIAL "0"
     LABEL "Familia" 
     VIEW-AS FILL-IN 
     SIZE 14 BY 1 NO-UNDO.

DEFINE VARIABLE ge-fin AS INTEGER FORMAT "->,>>>,>>9":U INITIAL 999 
     VIEW-AS FILL-IN 
     SIZE 7 BY 1 NO-UNDO.

DEFINE VARIABLE ge-ini AS INTEGER FORMAT "->,>>>,>>9":U INITIAL 0 
     LABEL "Grupo Estoque" 
     VIEW-AS FILL-IN 
     SIZE 6.2 BY 1 NO-UNDO.

DEFINE VARIABLE it-fin AS CHARACTER FORMAT "X(16)":U INITIAL "ZZZZZZZZZZZZZZZZ" 
     VIEW-AS FILL-IN 
     SIZE 25 BY 1 NO-UNDO.

DEFINE VARIABLE it-ini AS CHARACTER FORMAT "X(16)":U INITIAL "0"
     LABEL "Item" 
     VIEW-AS FILL-IN 
     SIZE 25 BY 1 NO-UNDO.

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
     FILENAME "//tsasrv07/erp12/console/image/ii-rew.bmp":U
     SIZE 7 BY 1.43.

DEFINE IMAGE IMAGE-6
     FILENAME "//tsasrv07/erp12/console/image/ii-rew.bmp":U
     SIZE 7 BY 1.43.

DEFINE IMAGE IMAGE-7
     FILENAME "//tsasrv07/erp12/console/image/ii-rew.bmp":U
     SIZE 7 BY 1.43.

DEFINE RECTANGLE RECT-1
     EDGE-PIXELS 2 GRAPHIC-EDGE  NO-FILL   
     SIZE 93 BY 8.1.

DEFINE RECTANGLE RECT-2
     EDGE-PIXELS 2 GRAPHIC-EDGE  NO-FILL   
     SIZE 93 BY 2.38.

DEFINE VARIABLE bt-obsoleto AS LOGICAL INITIAL yes 
     LABEL "Desconsidera Item Obsoleto" 
     VIEW-AS TOGGLE-BOX
     SIZE 33 BY .81 NO-UNDO.


/* ************************  Frame Definitions  *********************** */

DEFINE FRAME DEFAULT-FRAME
     ge-ini AT ROW 3.48 COL 34.6 COLON-ALIGNED WIDGET-ID 8
     ge-fin AT ROW 3.48 COL 55 COLON-ALIGNED NO-LABEL WIDGET-ID 10
     fm-ini AT ROW 4.81 COL 27 COLON-ALIGNED WIDGET-ID 12
     fm-fin AT ROW 4.76 COL 54.8 COLON-ALIGNED NO-LABEL WIDGET-ID 14
     it-ini AT ROW 6.1 COL 16 COLON-ALIGNED WIDGET-ID 16
     it-fin AT ROW 6.05 COL 55 COLON-ALIGNED NO-LABEL WIDGET-ID 18
     bt-obsoleto AT ROW 7.91 COL 19 WIDGET-ID 36
     bt-exec AT ROW 10.71 COL 5 WIDGET-ID 4
     bt-canc AT ROW 10.71 COL 25.4 WIDGET-ID 6
     RECT-1 AT ROW 1.48 COL 3 WIDGET-ID 2
     RECT-2 AT ROW 10.14 COL 3 WIDGET-ID 20
     IMAGE-2 AT ROW 3.33 COL 51.2 WIDGET-ID 24
     IMAGE-3 AT ROW 4.57 COL 51.2 WIDGET-ID 26
     IMAGE-4 AT ROW 5.81 COL 51.2 WIDGET-ID 28
     IMAGE-5 AT ROW 3.33 COL 43.6 WIDGET-ID 30
     IMAGE-6 AT ROW 4.57 COL 43.6 WIDGET-ID 32
     IMAGE-7 AT ROW 5.81 COL 43.6 WIDGET-ID 34
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 1
         SIZE 97.6 BY 12.24 WIDGET-ID 100.


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
         TITLE              = "Onde Se Usa"
         HEIGHT             = 12.38
         WIDTH              = 97.2
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
ON END-ERROR OF C-Win /* Onde Se Usa */
OR ENDKEY OF {&WINDOW-NAME} ANYWHERE DO:
  /* This case occurs when the user presses the "Esc" key.
     In a persistently run window, just ignore this.  If we did not, the
     application would exit. */
  IF THIS-PROCEDURE:PERSISTENT THEN RETURN NO-APPLY.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL C-Win C-Win
ON WINDOW-CLOSE OF C-Win /* Onde Se Usa */
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
  DISPLAY ge-ini ge-fin fm-fin fm-ini it-fin it-ini bt-obsoleto 
      WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
  ENABLE RECT-1 RECT-2 IMAGE-2 IMAGE-3 IMAGE-4 IMAGE-5 IMAGE-6 IMAGE-7 ge-ini 
         ge-fin fm-fin fm-ini it-fin it-ini bt-obsoleto bt-exec bt-canc 
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

    ASSIGN c-ge-ini = INPUT FRAME default-frame ge-ini
           c-ge-fin = INPUT FRAME default-frame ge-fin
           c-fm-ini = INPUT FRAME default-frame fm-ini
           c-fm-fin = INPUT FRAME default-frame fm-fin
           c-it-ini = INPUT FRAME default-frame it-ini 
           c-it-fin = INPUT FRAME default-frame it-fin
           c-bt-obsoleto = INPUT FRAME default-frame bt-obsoleto.
           
    /*MESSAGE   c-ge-ini  skip
              c-ge-fin  skip
              c-fm-ini  skip
              c-fm-fin  skip
              c-it-ini  skip 
              c-it-fin  skip
              c-bt-obsoleto skip
            VIEW-AS ALERT-BOX.*/

  
    RUN esp\esen0208rp.p.
    

  
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

