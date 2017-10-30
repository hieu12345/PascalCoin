unit UFRMPendingOperations;

{$mode delphi}

interface

uses
  Classes, Forms, Grids,
  ExtCtrls, StdCtrls, Menus, UCommonUI, UGridUtils;

type

  { TFRMPendingOperations }

  TFRMPendingOperations = class(TApplicationForm)
    dgPendingOperations: TDrawGrid;
    Label10: TLabel;
    PendingOperationsMenu: TMainMenu;
    miDecodePayLoad: TMenuItem;
    miFindOperationbyOpHash: TMenuItem;
    miTools: TMenuItem;
    pnlPendingOperations: TPanel;
    procedure dgPendingOperationsDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure miDecodePayLoadClick(Sender: TObject);
    procedure miFindOperationbyOpHashClick(Sender: TObject);
  private
    { private declarations }
    FPendingOperationsGrid : TOperationsGrid;
  public
    { public declarations }
  end;

var
  FRMPendingOperations: TFRMPendingOperations = nil;

implementation
uses UFRMWallet, UUserInterface;

{$R *.lfm}

{ TFRMPendingOperations }

procedure TFRMPendingOperations.FormCreate(Sender: TObject);
begin
  FPendingOperationsGrid := TOperationsGrid.Create(Self);
  FPendingOperationsGrid.Node := TUserInterface.Node;
  FPendingOperationsGrid.DrawGrid := dgPendingOperations;
  FPendingOperationsGrid.AccountNumber := -1; // all
  FPendingOperationsGrid.PendingOperations := true;
end;

procedure TFRMPendingOperations.FormDestroy(Sender: TObject);
begin
   FPendingOperationsGrid.Node := Nil;
   // Note: grids themselves are collected wisth Self (TComponent dependency)
end;

procedure TFRMPendingOperations.miDecodePayLoadClick(Sender: TObject);
begin
  FPendingOperationsGrid.ShowModalDecoder(TUserInterface.WalletKeys,TUserInterface.AppParams);
end;

procedure TFRMPendingOperations.miFindOperationbyOpHashClick(Sender: TObject);
begin

end;

procedure TFRMPendingOperations.dgPendingOperationsDblClick(Sender: TObject);
begin
   FPendingOperationsGrid.ShowModalDecoder(TUserInterface.WalletKeys, TUserInterface.AppParams);
end;

end.

