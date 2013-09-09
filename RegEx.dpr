program RegEx;

uses
  Vcl.Forms,
  Unt_RegEx in 'Unt_RegEx.pas' {fRegEx};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfRegEx, fRegEx);
  Application.Run;
end.
