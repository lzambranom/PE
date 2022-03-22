#include "rwmake.ch"
#include "protheus.ch"
/*/{Protheus.doc} MT120TEL
description Rutina que agrega el Campo Observaciones en Pedido de Compra
@type function
@version 
@author M&H
@since 16/3/2022
@return return_type, return_description
{@oDlg, aPosGet, aObj, nOpcx, nReg, @aDlgFields}
/*/
user function MT120TEL()
	local oNewDialog    := PARAMIXB[1]
	local aPosGet       := PARAMIXB[2]
	local aObj          := PARAMIXB[3]
	local nOpcx         := PARAMIXB[4]
	local nReg        	:= PARAMIXB[5]
	Local aDlgFields	:= PARAMIXB[6]
	//Local cNomField     := "C7_XNOME"
    Local cNomField     := "C7_XOBSG"
	Local l120Visual	:= .T.
	Local l120Inclui	:= .F.
	Local l120Altera	:= .F.
	Local l120Deleta	:= .F.
	//Public _cXNomePro   := SC7->C7_XNOME
	Public cXObserv   := SC7->C7_XOBSG
    
	Do Case
	Case aRotina[nOpcX][4] == 2
		l120Visual := .T.
	Case aRotina[nOpcX][4] == 3 .Or. lCop
		l120Inclui	:= .T.
	Case aRotina[nOpcX][4] == 4
		l120Altera	:= .T.
	Case aRotina[nOpcX][4] == 5
		l120Deleta	:= .T.
		l120Visual	:= .T.
	EndCase


    //@ 51,aPosGet[2,6]+40 SAY Alltrim(RetTitle(cNomField)) of oNewDialog pixel size 060,006
    //@ 50,aPosGet[2,6]+80 MSGET cXObserv VAR aInfForn[1] PICTURE PesqPict("SC7",cNomField) WHEN  (l120Inclui .And. VisualSX3(cNomField)) OF oNewDialog PIXEL SIZE 080,006
    
    @ 76,aPosGet[2,1] SAY Alltrim(RetTitle(cNomField)) of oNewDialog pixel size 060,006
    @ 75,aPosGet[2,1]+65 MSGET cXObserv SIZE 250,06 PICTURE PesqPict("SC7",cNomField) WHEN  (l120Inclui .And. VisualSX3(cNomField)) OF oNewDialog PIXEL SIZE 080,006

	aAdd(aDlgFields,{cNomField,cXObserv})


return .T.


/* Exemplos 

User Function MT120GET()
Local aRet:= PARAMIXB[1]
aRet[2,1] := 100 //Abaixando o começo da linha da getdados
aRet[1,3] := 95 // Abaixando a linha de contorno dos campos do cabeçalho
Return(aRet) 
*/

/*
Función de usuario MT120SCR()
Local oNewDialog := PARAMIXB //Rutina de usuario que maneja las propiedades de oDlgReturn
*/

/*
User Function MT120TEL( )
AAdd( aTitles, 'Folder TESTE' ) //Nome do folder que será adicionado
Return Nil//--------------------------------------------------------------------------------------------
User Function MT120FOL( )
Local nOpc    := PARAMIXB[1]
Local aPosGet := PARAMIXB[2]
Local cMsg    := Space(50)
If nOpc <> 1 
@ 006,aPosGet[3,1] SAY OemToAnsi('Teste de campo no Folder :') OF oFolder:aDialogs[7] PIXEL SIZE 070,009 
@ 005,aPosGet[3,2] MSGET cMsg PICTURE '@!' OF oFolder:aDialogs[7] PIXEL SIZE 083,009 HASBUTTON
Endif Return Nil 

*/
