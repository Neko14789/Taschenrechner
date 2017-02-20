unit Unit1;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses                                                                            //Benutzt die funktions- Klassen:
{$IFNDEF FPC}
  jpeg, Windows,
{$ELSE}
  LCLIntf, LCLType, LMessages,
{$ENDIF}
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls;

type                                                                            //Liste der benutzten Objekte

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    HeaderControl1: THeaderControl;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    PaintBox1: TPaintBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;

    procedure Button1Click(Sender: TObject);                                    //Liste der möglichen Prozeduren
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: char);
    procedure Edit7KeyPress(Sender: TObject; var Key: char);
    procedure Game();
    procedure CreateForm(Sender: TObject);

  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;                                                                          //Ende

var                                                                             //Liste der Variablen
  Form1: TForm1;
    zahl1,zahl2,zahl1y,zahl2y,steigungM,YAchsenAbschnitt,ergebnis0test: real;
    ergebnis: real;
    debug: string;
    test: Integer;
implementation                                                                  //Variablen Implementieren

{$R *.lfm}


procedure TForm1.CreateForm(Sender: TObject);
begin
  Randomize;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
    If Combobox1.ItemIndex=4 Then begin
    edit6.Visible:=True;
    edit7.Visible:=True;
    label6.Visible:=True;
    label7.Visible:=True;
    label8.Visible:=True;
    CheckBox1.Visible:=False;
    label9.Visible:=True end else begin
    edit6.Visible:=False;
    edit7.Visible:=False;
    label6.Visible:=False;
    label7.Visible:=False;
    label8.Visible:=False;
    label9.Visible:=False;
    CheckBox1.Visible:=True;
                                  end;
end;


procedure TForm1.Button1Click(Sender: TObject);                                 //Zum Start der Prozedur "Button1" drücken
begin                                                                           //Beginn
    If (ComboBox1.ItemIndex=0) or (ComboBox1.ItemIndex=1)
    or (ComboBox1.ItemIndex = 2) or (ComboBox1.ItemIndex=3) Then
       begin
            If (Edit1.text='') or (Edit2.text='') Then
               begin                                                               //Wenn in "Edit1" oder "Edit2" der Text " " ist dann
                  showmessage('Eine Eingabe ist erforderlich');
                  Exit;
               end else
                  begin
                      zahl1:=StrToFloat(Edit1.Text);                            //Umwandlung von dem Text von "Edit1" vom String zur Variable "zahl1" als Float (Dezimalzahl)
                      zahl2:=StrToFloat(Edit2.Text);                            //Umwandlung von dem Text von "Edit2" vom String zur Variable "zahl2" als Float (Dezimalzahl)
                  end;
       end;


    If Combobox1.ItemIndex=0 Then                                               //Wenn ausgewählte Option in "Combobox1" "0" ist dann
       ergebnis:=zahl1+zahl2;                                                   //Addiert Variablen "zahl1" und "zahl2" und gebe das Ergebnis in variable "ergebnis" aus
    If Combobox1.ItemIndex=1 Then                                               //Wenn ausgewählte Option in "Combobox1" "1" ist dann
       ergebnis:=zahl1-zahl2;                                                   //Subtrahiert Variablen "zahl1" und "zahl2" und gebe das Ergebnis in variable "ergebnis" aus
    If Combobox1.ItemIndex=2 Then                                               //Wenn ausgewählte Option in "Combobox1" "2" ist dann
       ergebnis:=zahl1*zahl2;                                                   //Multipliziert Variablen "zahl1" und "zahl2" und gebe das Ergebnis in variable "ergebnis" aus
    If Combobox1.ItemIndex=3 Then
       begin                                                                    //Wenn ausgewählte Option in "Combobox1" "3" ist dann
            ergebnis0test:=zahl1*zahl2;
            If (ergebnis0test=0) Then
               begin
                  edit1.clear;
                  edit2.clear;
                  edit3.clear;
                  edit6.clear;
                  edit7.clear;

                  image1.Visible:=False;
                  image2.Visible:=False;
                  image3.Visible:=False;
                  image4.Visible:=False;
                  image5.Visible:=False;

                  ShowMessage('Mit "0" kann nicht geteilt werden !');
                  Exit;                                                         //beendet procedure (vorzeitig)
                  end else
                     begin
                        ergebnis:=zahl1/zahl2;                                  //Dividiert Variablen "zahl1" und "zahl2" und gebe das Ergebnis in variable "ergebnis" aus
                     end;
    end;

    If Combobox1.ItemIndex=4
    Then
       begin
           If (Edit1.text='') or (Edit2.text='') or
              (Edit6.text='') or (Edit7.text='') Then
                   begin
                        showmessage('Eine Eingabe ist erforderlich');
                        Exit;
                   end else
                       begin
                           zahl1:=StrToFloat(Edit1.Text);
                           zahl2:=StrToFloat(Edit2.Text);
                           zahl1y:=StrToFloat(Edit6.Text);
                           zahl2y:=StrToFloat(Edit7.Text);
                           if zahl2-zahl1 = 0 then
                              begin
                                   ShowMessage(
                                   'X-Koordinaten der beiden Punkte sind gleich. Da Δ𝑥=0 ist, ist die Steigung nicht definiert.' + sLineBreak + 'Dies geschied weil X1 dividiert durch X2 nicht 0 ergebnen kann.');
                                   Exit;
                              end;
                           steigungM:=(zahl2y-zahl1y)/(zahl2-zahl1);
                           YAchsenAbschnitt:=zahl2y-(steigungM*zahl2);
                           debug:='f(x)='+Floattostr(steigungM) +'*x + '+floattostr(YAchsenAbschnitt);
                           Edit3.Text:='f(x)='+Floattostr(steigungM) +'*x + '+floattostr(YAchsenAbschnitt);
                       end;
       end;

    If (ComboBox1.ItemIndex=0) or (ComboBox1.ItemIndex=1)
    or (ComboBox1.ItemIndex=2) or (ComboBox1.ItemIndex=3) Then
        begin
             If CheckBox1.Checked=True Then                                     //Wenn "Checkbox1" an gehakt ist dann
                Edit3.Text:=FloatToStrf(ergebnis,ffnumber,8,2);                 //Umwandlung vom Text von "Edit3" von Float zu String als "ergebnis" mit nur 2 Kommastellen
             If CheckBox1.Checked=False Then                                    //Wenn "Checkbox1" nicht an gehakt ist dann
                Edit3.Text:=FloatToStr(ergebnis);                               //Umwandlung vom Text von "Edit3" von Float zu String als "ergebnis"
             ListBox1.Items.Add(Edit1.text + ComboBox1.Text[1]+ Edit2.text + '=' + Edit3.text );
        end;

    If (ComboBox1.ItemIndex=4) Then begin
        ListBox1.Items.Add(debug);
    end;

     If RadioButton2.checked=True Then
         begin
          image1.Visible:=False;
          image2.Visible:=False;
          image3.Visible:=False;
          image4.Visible:=False;
          image5.Visible:=False;
         end;

    If RadioButton1.checked=True Then begin
       If image1.Visible=True Then
          image1.Visible:=False;
       If image2.Visible=True Then
          image2.Visible:=False;
       If image3.Visible=True Then
          image3.Visible:=False;
       If image4.Visible=True Then
          image4.Visible:=False;
       If image5.Visible=True Then
          image5.Visible:=False;

    If (Edit3.text='42') or (Edit3.text='42,00') Then
       begin
        image1.Visible:=True;
        showmessage('Du hast die Antwort auf alles berechnet :D');
        end;
     If (Edit3.text='420') or (Edit3.text='420,00') Then
        begin
        image2.Visible:=True;
        showmessage('Du hast die Cannabis-Kultur entdeckt');
        end;
     If (Edit3.text='17042000') or (Edit3.text='17042000,00') Then
        begin
        image3.Visible:=True;
        showmessage('Hey das ist mein Geburtstag !!!');
        end;
      If (Edit3.text='404') or (Edit3.text='404,00') Then
         begin
        image4.Visible:=True;
        showmessage('ERROR 404');
        end;
      If (Edit3.text='0') or (Edit3.text='0,00') Then
         begin
        image5.Visible:=True;
        showmessage('Du hast erfolgreich Nichts ausgerechnet');
        end;
      If (Edit3.text='1') or (Edit3.text='1,00') Then
         begin
        Game();
        end;

    end;                                                                        //Ende
end;                                                                            //Ende


procedure TForm1.Button2Click(Sender: TObject);
begin
     edit1.Clear;
     edit2.Clear;
     edit3.Clear;
     edit6.Clear;
     edit7.Clear;
     image1.Visible:=False;
     image2.Visible:=False;
     image3.Visible:=False;
     image4.Visible:=False;
     image5.Visible:=False;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
     ListBox1.Clear;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin

end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  GroupBox1.Visible:=False;
end;

procedure TForm1.ComboBox1Click(Sender: TObject);
begin

end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);                 //Zum Start der Prozedur ein beliebiges Symbol im Textfeld "Edit1" eingeben
begin                                                                           //Beginn

    IF NOT (Key IN['0','1','2','3','4','5','6','7','8','9',',','-',#8,#3,#1,#24] )Then    //Falls gedrückte Taste nicht "0-9","Komma","-" oder "Backspace" ist dann
      Begin                                                                     //Beginn
        ShowMessage('Bitte eine Zahl eingeben! Erlaubt sind: 0-9 , -');         //Zeige Nachricht "Bitte eine Zahl eingeben! Erlaubt sind: 0-9 , . -"
        Key:=#0;                                                                //Verbietet Eingabe des beliebigen Symbols (da es nicht erlaubt ist)
      End;                                                                      //Ende

end;                                                                            //Ende

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);                 //Zum Start der Prozedur ein beliebiges Symbol im Textfeld "Edit2" eingeben
begin                                                                           //Beginn
     IF NOT (Key IN['0','1','2','3','4','5','6','7','8','9',',','-',#8,#3,#1,#24] )Then   //Falls gedrückte Taste nicht "0-9","Komma","-" oder "Backspace" ist dann
      Begin                                                                     //Beginn
        ShowMessage('Bitte eine Zahl eingeben! Erlaubt sind: 0-9 , -');         //Zeige Nachricht "Bitte eine Zahl eingeben! Erlaubt sind: 0-9 , . -"
        Key:=#0;                                                                //Verbietet Eingabe des beliebigen Symbols (da es nicht erlaubt ist)
      End;                                                                      //Ende

end;                                                                            //Ende

procedure TForm1.Edit6KeyPress(Sender: TObject; var Key: Char);                 //Zum Start der Prozedur ein beliebiges Symbol im Textfeld "Edit2" eingeben
begin                                                                           //Beginn
     IF NOT (Key IN['0','1','2','3','4','5','6','7','8','9',',','-',#8,#3,#1,#24] )Then   //Falls gedrückte Taste nicht "0-9","Komma","-" oder "Backspace" ist dann
      Begin                                                                     //Beginn
        ShowMessage('Bitte eine Zahl eingeben! Erlaubt sind: 0-9 , -');         //Zeige Nachricht "Bitte eine Zahl eingeben! Erlaubt sind: 0-9 , . -"
        Key:=#0;                                                                //Verbietet Eingabe des beliebigen Symbols (da es nicht erlaubt ist)
      End;                                                                      //Ende

end;

procedure TForm1.Edit7KeyPress(Sender: TObject; var Key: Char);                 //Zum Start der Prozedur ein beliebiges Symbol im Textfeld "Edit2" eingeben
begin                                                                           //Beginn
     IF NOT (Key IN['0','1','2','3','4','5','6','7','8','9',',','-',#8,#3,#1,#24] )Then   //Falls gedrückte Taste nicht "0-9","Komma","-" oder "Backspace" ist dann
      Begin                                                                     //Beginn
        ShowMessage('Bitte eine Zahl eingeben! Erlaubt sind: 0-9 , -');         //Zeige Nachricht "Bitte eine Zahl eingeben! Erlaubt sind: 0-9 , . -"
        Key:=#0;                                                                //Verbietet Eingabe des beliebigen Symbols (da es nicht erlaubt ist)
      End;                                                                      //Ende

end;


procedure TForm1.Game();
const
          Zufallsbereich = 10;
     begin
          //Caption:=IntToStr(Random(Zufallsbereich));
          Edit4.text:=IntToStr(Random(Zufallsbereich));
          begin
          GroupBox1.Visible:=True;
          ShowMessage('Game Start !!!');
          end;
     end;


end.                                                                            //Ende
