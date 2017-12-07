unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  IniFiles, uDataModule, Vcl.Grids, Vcl.ValEdit, uNormal, uSSL, DosCommand,
  uBranchSelector, Tlhelp32, HTMLForm, uServerCreator, SysUtils, ShellAPI,
  uServerWipe, uServerDescriptionEditor, Vcl.OleCtrls, Vcl.CheckLst,
  uPluginEnableDisable, uPluginConfigEditor, Vcl.Menus, IdHTTP, htmlbtns, System.ImageList,
  Vcl.ImgList, Vcl.Themes, uOxideModBrowser, uLangEditor, AdvMetroProgressBar,
  AdvMetroCategoryList, AdvMetroTile, AdvAppStyler, AdvFontCombo, Vcl.WinXCtrls,
  Registry, WinSvc, Vcl.ToolWin;

type
  TCheckBoxEx = class(TCheckBox);

  Tfrmmain = class(TForm)
    pnltop: TPanel;
    pnlleft: TPanel;
    pgcmain: TPageControl;
    tsserverconfig: TTabSheet;
    tsserverinstaller: TTabSheet;
    lblsteamcmd: TLabel;
    mmosteamcmd: TMemo;
    btnInstallServer: TButton;
    btnVerifyServer: TButton;
    btnStopTask: TButton;
    btnexportsteamcmdlog: TButton;
    grpotheroptions: TGroupBox;
    btnInstallSteamcmd: TButton;
    btninstalloxidemod: TButton;
    tsPluginManager: TTabSheet;
    tsAutoBackup: TTabSheet;
    tsappsettings: TTabSheet;
    lblserverlist: TLabel;
    cbbserverlist: TComboBox;
    btnstartserver: TButton;
    chkautorestart: TCheckBox;
    lbladdserver: TLabel;
    dcmsteamcmd: TDosCommand;
    grpsteamcmd: TGroupBox;
    edtsteamcmdpath: TEdit;
    lblsteamcmdstatus: TLabel;
    btninstallsteamcmd2: TButton;
    btn1: TButton;
    lbledtservername: TLabeledEdit;
    lbledtserverdescription: TLabeledEdit;
    lbledtserverurl: TLabeledEdit;
    lbledtserverbannerurl: TLabeledEdit;
    vlstdtrservervar: TValueListEditor;
    lblservervariables: TLabel;
    grpmap: TGroupBox;
    cbbmap: TComboBox;
    btnserverdescriptioneditor: TButton;
    btnsaveserverconfig: TButton;
    btngenerateseed: TButton;
    btngeneraterconpass: TButton;
    pgcserveroptions: TPageControl;
    ts1: TTabSheet;
    vlstdtrmoreservervar: TValueListEditor;
    lblmadeby: TLabel;
    btnwipeserver: TButton;
    chklstplugins: TCheckListBox;
    lblplugins: TLabel;
    chklstconfigs: TCheckListBox;
    lblconfigs: TLabel;
    pnlpluginmanageroptions: TPanel;
    btnrefreshlists: TButton;
    btnenabledisable: TButton;
    pmplugins: TPopupMenu;
    Delete1: TMenuItem;
    Edit1: TMenuItem;
    lbl2: TLabel;
    pmconfig: TPopupMenu;
    Deleteallcheckeditems1: TMenuItem;
    Editselecteditem1: TMenuItem;
    btnpluginupdater: TButton;
    mm1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    RSMTutorialVideo1: TMenuItem;
    OxideModPermissionsSystem1: TMenuItem;
    Connect1: TMenuItem;
    OpenRustandconnecttoserver1: TMenuItem;
    Links1: TMenuItem;
    RSMonOxidemod1: TMenuItem;
    Reportissue1: TMenuItem;
    Donate1: TMenuItem;
    btnoxidebrowser: TButton;
    lbledtbackuppath: TLabeledEdit;
    btnbrowsebackuppath: TButton;
    lbledtbackuptime: TLabeledEdit;
    lbledtbackupstatus: TLabeledEdit;
    lblbackuplog: TLabel;
    lblbackupmins: TLabel;
    btnstartbackup: TButton;
    btnstopbackup: TButton;
    dcmautobackup: TDosCommand;
    mmoautobackuplog: TMemo;
    tstestpage: TTabSheet;
    btn2: TButton;
    Unlockdevpage1: TMenuItem;
    grp1: TGroupBox;
    DeleteActiveServer1: TMenuItem;
    N1: TMenuItem;
    RiskyOptions1: TMenuItem;
    grptransparency: TGroupBox;
    trackbartransparency: TTrackBar;
    RSMonGithuv1: TMenuItem;
    DeleteRSMconfigfile1: TMenuItem;
    DeleteServerConfig1: TMenuItem;
    tglswtchlangmode: TToggleSwitch;
    grplang: TGroupBox;
    lbllangmode: TLabel;
    KillRustServerWontsave1: TMenuItem;
    chkloadlang: TCheckBox;
    grpmisc: TGroupBox;
    chkstartserveronrsmstart: TCheckBox;
    Openfolder1: TMenuItem;
    Plugins1: TMenuItem;
    Config1: TMenuItem;
    ServerRoot1: TMenuItem;
    RSMsteamgroup1: TMenuItem;
    chkstartwithwindows: TCheckBox;
    Checkforupdates1: TMenuItem;
    stathints: TStatusBar;
    tmrpluginconfigfilder: TTimer;
    btnaddlangfile: TButton;
    btndownloadlangfile: TButton;
    tmrcheckforupdates: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure SaveSettingString(Section, Name, Value: string);
    procedure SaveSettingInteger(Section, Name: string; Value: Integer);
    function LoadSettingString(Section, Name, Value: string): string;
    function LoadSettingInteger(Section, Name: string; Value: Integer): Integer;
    procedure DownloadSSL(Link, Path: string; Extract: Boolean; ExtractPath: string);
    procedure DownloadNormal(Link, Path: string; Extract: Boolean; ExtractPath: string);
    procedure btnstartserverClick(Sender: TObject);
    procedure btninstalloxidemodClick(Sender: TObject);
    procedure btnInstallSteamcmdClick(Sender: TObject);
    procedure btnexportsteamcmdlogClick(Sender: TObject);
    procedure CheckRequiredFiles;
    procedure CleanUp;
    procedure FormActivate(Sender: TObject);
    procedure btnInstallServerClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtsteamcmdpathChange(Sender: TObject);
    function KillTask(ExeFileName: string): Integer;
    procedure FormDestroy(Sender: TObject);
    procedure pgcmainChange(Sender: TObject);
    procedure LoadRSMsettings;
    procedure LoadServerConfig;
    procedure btninstallsteamcmd2Click(Sender: TObject);
    procedure btnVerifyServerClick(Sender: TObject);
    procedure CreateNewServer;
    procedure GetDirList(DirPath: string; DirList: TStrings);
    procedure cbbserverlistChange(Sender: TObject);
    procedure lbladdserverClick(Sender: TObject);
    procedure btnStopTaskClick(Sender: TObject);
    procedure CheckServerMadeWith;
    procedure btn1Click(Sender: TObject);
    procedure SaveConfigString(Section, Name, Value: string);
    function LoadConfigString(Section, Name, Value: string): string;
    procedure btnsaveserverconfigClick(Sender: TObject);
    procedure btngenerateseedClick(Sender: TObject);
    function GenerateRandomPassword(Lenght: Integer): string;
    procedure btngeneraterconpassClick(Sender: TObject);
    procedure Start(Path: string);
    procedure btnwipeserverClick(Sender: TObject);
    procedure btnserverdescriptioneditorClick(Sender: TObject);
    procedure btnrefreshlistsClick(Sender: TObject);
    procedure ListFileDir(Path: string; FileList: TStrings);
    procedure btnenabledisableClick(Sender: TObject);
    procedure chklstpluginsDblClick(Sender: TObject);
    procedure chklstconfigsDblClick(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure CheckForUpdates;
    procedure Edit1Click(Sender: TObject);
    procedure Editselecteditem1Click(Sender: TObject);
    procedure Deleteallcheckeditems1Click(Sender: TObject);
    procedure btnpluginupdaterClick(Sender: TObject);
    procedure CheckHardware;
    procedure Exit1Click(Sender: TObject);
    procedure RSMTutorialVideo1Click(Sender: TObject);
    procedure OxideModPermissionsSystem1Click(Sender: TObject);
    procedure Reportissue1Click(Sender: TObject);
    procedure RSMonOxidemod1Click(Sender: TObject);
    procedure Donate1Click(Sender: TObject);
    procedure btnoxidebrowserClick(Sender: TObject);
    procedure timerOnTimer(Sender: TObject);
    procedure btnstartbackupClick(Sender: TObject);
    procedure btnstopbackupClick(Sender: TObject);
    procedure btnbrowsebackuppathClick(Sender: TObject);
    procedure lbledtbackuppathChange(Sender: TObject);
    procedure lbledtbackuptimeChange(Sender: TObject);
    procedure OpenRustandconnecttoserver1Click(Sender: TObject);
    procedure EditLanguageButton(Button: TButton);
    procedure EditLanguageLabel(TLabel: TLabel);
    procedure btn2Click(Sender: TObject);
    procedure SaveLang(Section, Name, Text: string);
    function LoadLang(Section, Name, Text: string): string;
    procedure Unlockdevpage1Click(Sender: TObject);
    procedure DeleteActiveServer1Click(Sender: TObject);
    procedure DeleteDirectory(const Name: string);
    procedure trackbartransparencyChange(Sender: TObject);
    procedure RSMonGithuv1Click(Sender: TObject);
    procedure DeleteRSMconfigfile1Click(Sender: TObject);
    procedure DeleteServerConfig1Click(Sender: TObject);
    procedure KillRustServerWontsave1Click(Sender: TObject);
    procedure tglswtchlangmodeClick(Sender: TObject);
    procedure LoadLanguageFile;
    procedure chkloadlangClick(Sender: TObject);
    procedure chkstartserveronrsmstartClick(Sender: TObject);
    procedure GenerateBatFile;
    procedure Plugins1Click(Sender: TObject);
    procedure Config1Click(Sender: TObject);
    procedure ServerRoot1Click(Sender: TObject);
    procedure RSMsteamgroup1Click(Sender: TObject);
    procedure chkstartwithwindowsClick(Sender: TObject);
    procedure SetAutoStart(AppName, AppTitle: string; bRegister: Boolean);
    function IsAdmin(Host: string = ''): Boolean;
    procedure Checkforupdates1Click(Sender: TObject);
    procedure lblserverlistClick(Sender: TObject);
    procedure lblservervariablesClick(Sender: TObject);
    procedure lblsteamcmdClick(Sender: TObject);
    procedure lblpluginsClick(Sender: TObject);
    procedure lblconfigsClick(Sender: TObject);
    procedure lblbackupminsClick(Sender: TObject);
    procedure lblbackuplogClick(Sender: TObject);
    procedure tmrpluginconfigfilderTimer(Sender: TObject);
    procedure btnaddlangfileClick(Sender: TObject);
    procedure btndownloadlangfileClick(Sender: TObject);
    procedure tmrcheckforupdatesTimer(Sender: TObject);
  private
    // Dynamic
    timer: TTimer;

    // serverconfig
    hostname, serverdescription, serverurl, bannerurl, serverseed, serverworldsize, servermaxplayers, serverip, serverport, servertickrate, serversaveinterval, rconip, rconport, rconpassword, servermap, batfile: string;

    // Extra server config var
    globalchat, radiation, eac, vac, rconweb, serverpve, buildingstability, aithink, aimove, antihack, buildingdecay, bradley, nav_wait, nav_disable, halloweenenabled, halloweenpopulation, helilifetimeminutes, helibulletaccuracy, helibulletdamagescale, heliguns: string;
  public
    { Public declarations }
  end;

var
  frmmain: Tfrmmain;

implementation

{$R *.dfm}

procedure Tfrmmain.btn1Click(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageButton(Sender as TButton)
  else
  begin
    if dmDataModule.dlgOpensteamcmd.Execute then
    begin
      steamcmdpath := dmDataModule.dlgOpensteamcmd.FileName;
      edtsteamcmdpath.Text := steamcmdpath;
    end;
  end;
end;

procedure Tfrmmain.btn2Click(Sender: TObject);
begin
  EditLanguageButton(Sender as TButton);
end;

procedure Tfrmmain.btnaddlangfileClick(Sender: TObject);
begin
  if MessageBox(Handle, 'Due to the amount of langfile abuse I have removed the freedom of uploading them.' + #13#10#13#10 + 'If you want a language file to be added please send me a PM on oxidemod and attach the lang file "lang.ini" and please say what language it is for.' + #13#10 + 'I will then notify you if it was approved.' + #13#10#13#10 + 'Do you want to send me a PM on oxidemod?', 'Adding a language file.', MB_YESNO + MB_ICONINFORMATION) = IDYES then
  begin
    Start('http://oxidemod.org/conversations/add?Quantum');
  end;
end;

procedure Tfrmmain.btnbrowsebackuppathClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageButton(Sender as TButton)
  else
  begin
    if dmDataModule.fldrdlgautobackup.Execute then
    begin
      lbledtbackuppath.Text := dmDataModule.fldrdlgautobackup.Directory;
    end;
  end;
end;

procedure Tfrmmain.btndownloadlangfileClick(Sender: TObject);
begin
  ShowMessage('After downloading a lang file place it in the same dir as RSM.exe');
  Start('https://inforcer25.co.za/owncloud/index.php/s/wd0HxYtjA4CKPdr');
end;

procedure Tfrmmain.btnenabledisableClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageButton(Sender as TButton)
  else
  begin
    frmpluginenabledisable.ShowModal;
    btnrefreshlists.Click;
  end;
end;

procedure Tfrmmain.btnexportsteamcmdlogClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageButton(Sender as TButton)
  else
  begin
    mmosteamcmd.Lines.SaveToFile('.\rsm_installer.log');
    ShowMessage('Exported to rsm_installer.log');
  end;
end;

procedure Tfrmmain.btngeneraterconpassClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageButton(Sender as TButton)
  else
    vlstdtrservervar.Strings.Values['rcon.password'] := GenerateRandomPassword(10);
end;

procedure Tfrmmain.btngenerateseedClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageButton(Sender as TButton)
  else
    vlstdtrservervar.Strings.Values['server.seed'] := IntToStr(Random(0123456789));
end;

procedure Tfrmmain.btninstalloxidemodClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageButton(Sender as TButton)
  else
  begin
    DownloadSSL('https://www.github.com/OxideMod/Oxide/releases/download/latest/Oxide-Rust.zip', 'oixde.zip', True, '.\');
  end;
end;

procedure Tfrmmain.btnInstallServerClick(Sender: TObject);
var
  branch: Integer;
  installcommand: string;
  command: TStringList;
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageButton(Sender as TButton)
  else
  begin
    dcmsteamcmd.Stop;
    KillTask('steamcmd.exe');
    mmosteamcmd.Clear;
    if not FileExists(steamcmdpath) then
    begin
      if MessageDlg('ERROR: steamcmd.exe could not be found. Do you want RSM to install it for you?', mtError, [mbYes, mbNo], 0) = mrYes then
      begin
        btnInstallSteamcmd.Click;
        btnInstallServer.Click;
      end;
    end
    else
    begin
      frmbranchselector.ShowModal;
      if frmbranchselector.install = True then
      begin
        branch := frmbranchselector.branch;
        case branch of
          -1:
            begin
              ShowMessage('You have to select a branch!');
              Exit
            end;
          0:
            installcommand := '"' + steamcmdpath + '" +login anonymous +force_install_dir "' + RSMdir + '" +app_update 258550 +quit';
          1:
            installcommand := '"' + steamcmdpath + '" +login anonymous +force_install_dir "' + RSMdir + '" +app_update 258550 -beta staging +quit';
          2:
            installcommand := '"' + steamcmdpath + '" +login anonymous +force_install_dir "' + RSMdir + '" +app_update 258550 -beta prerelease +quit';
          3:
            installcommand := '"' + steamcmdpath + '" +login anonymous +force_install_dir "' + RSMdir + '" +app_update 258550 -beta july2016 +quit';
          4:
            installcommand := '"' + steamcmdpath + '" +login anonymous +force_install_dir "' + RSMdir + '" +app_update 258550 -beta october2016 +quit';
        end;

        command := TStringList.Create;
        try
          command.Add('@echo off');
          command.Add('echo Starting Server Installation..');
          command.Add(installcommand);
          command.Add('echo Done.');
        finally
          command.SaveToFile(RSMdir + '\install.bat');
          command.Free;
        end;
        dcmsteamcmd.CommandLine := RSMdir + '\install.bat';
        dcmsteamcmd.OutputLines := mmosteamcmd.Lines;
        dcmsteamcmd.Execute;
      end;
    end;
  end;
end;

procedure Tfrmmain.btninstallsteamcmd2Click(Sender: TObject);
begin
  btnInstallSteamcmd.Click;
end;

procedure Tfrmmain.btnInstallSteamcmdClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageButton(Sender as TButton)
  else
  begin
    if not DirectoryExists(RSMdir + '\steamcmd') then
      MkDir(RSMdir + '\steamcmd');
    DownloadSSL('https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip', RSMdir + '\steamcmd\steamcmd.zip', True, RSMdir + '\steamcmd');
    steamcmdpath := RSMdir + '\steamcmd\steamcmd.exe';
    edtsteamcmdpath.Text := steamcmdpath;
    SaveSettingString('Application Settings', 'steamcmd', steamcmdpath);
  end;
end;

procedure Tfrmmain.btnoxidebrowserClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageButton(Sender as TButton)
  else
  begin
    frmOxideModBrowser.Show;
  end;
end;

procedure Tfrmmain.btnpluginupdaterClick(Sender: TObject);
var
  parameter: string;
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageButton(Sender as TButton)
  else
  begin
    ShowMessage('Please note that I did not make this plugin updater. All credit goes to Murky.');

    if not FileExists(RSMdir + '\pluginupdater.exe') then
    begin
      case MessageDlg('The plugin updater does not appear to be installed.' + #13#10#13#10 + 'Would you like RSM to download it for you?', mtError, [mbYes, mbNo], 0) of
        mrYes:
          begin
            DownloadSSL('https://inforcer25.co.za/owncloud/index.php/s/rZYvX06XIrrhm82/download', RSMdir + '\pluginupdater.zip', True, RSMdir);
            btnpluginupdater.Click;
          end;
        mrNo:
          begin
            Exit
          end;
      end;

    end
    else
    begin
      parameter := '--pluginFolder "' + RSMdir + '\server\' + serveridentity + '\oxide\plugins"';
      ShellExecute(0, 'open', PChar(RSMdir + '\pluginupdater.exe'), PChar(parameter), nil, SW_SHOW);
    end;
  end;

end;

procedure Tfrmmain.btnrefreshlistsClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageButton(Sender as TButton)
  else
  begin
    chklstplugins.Clear;
    chklstconfigs.Clear;

    ListFileDir(RSMdir + '\server\' + serveridentity + '\oxide\plugins\', chklstplugins.Items);
    ListFileDir(RSMdir + '\server\' + serveridentity + '\oxide\config\', chklstconfigs.Items);

    lblplugins.Caption := '[' + IntToStr(chklstplugins.Items.Count) + '] Plugins:';
    lblconfigs.Caption := '[' + IntToStr(chklstconfigs.Items.Count) + '] Plugin Configs:';
  end;
end;

procedure Tfrmmain.btnsaveserverconfigClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageButton(Sender as TButton)
  else
  begin
    hostname := lbledtservername.Text;
    SaveConfigString('Server Config', 'hostname', hostname);

    serverdescription := lbledtserverdescription.Text;
    SaveConfigString('Server Config', 'serverdescription', serverdescription);

    serverurl := lbledtserverurl.Text;
    SaveConfigString('Server Config', 'serverurl', serverurl);

    bannerurl := lbledtserverbannerurl.Text;
    SaveConfigString('Server Config', 'bannerurl', bannerurl);

    serverseed := vlstdtrservervar.Strings.Values['server.seed'];
    SaveConfigString('Server Config', 'server.seed', serverseed);

    serverworldsize := vlstdtrservervar.Strings.Values['server.worldsize'];
    SaveConfigString('Server Config', 'server.worldsize', serverworldsize);

    servermaxplayers := vlstdtrservervar.Strings.Values['server.maxplayers'];
    SaveConfigString('Server Config', 'server.maxplayers', servermaxplayers);

    serverip := vlstdtrservervar.Strings.Values['server.ip'];
    SaveConfigString('Server Config', 'server.ip', serverip);

    serverport := vlstdtrservervar.Strings.Values['server.port'];
    SaveConfigString('Server Config', 'server.port', serverport);

    servertickrate := vlstdtrservervar.Strings.Values['server.tickrate'];
    SaveConfigString('Server Config', 'server.tickrate', servertickrate);

    serversaveinterval := vlstdtrservervar.Strings.Values['server.saveinterval'];
    SaveConfigString('Server Config', 'server.saveinterval', serversaveinterval);

    rconip := vlstdtrservervar.Strings.Values['rcon.ip'];
    SaveConfigString('Server Config', 'rcon.ip', rconip);

    rconport := vlstdtrservervar.Strings.Values['rcon.port'];
    SaveConfigString('Server Config', 'rcon.port', rconport);

    rconpassword := vlstdtrservervar.Strings.Values['rcon.password'];
    SaveConfigString('Server Config', 'rcon.password', rconpassword);

    servermap := cbbmap.Items[cbbmap.ItemIndex];
    SaveConfigString('Server Config', 'servermap', servermap);

    // More Server Variables
    globalchat := vlstdtrmoreservervar.Strings.Values['Global Chat'];
    SaveConfigString('Server Config', 'globalchat', globalchat);

    radiation := vlstdtrmoreservervar.Strings.Values['Radiation'];
    SaveConfigString('Server Config', 'radiation', radiation);

    vac := vlstdtrmoreservervar.Strings.Values['Valve Anti Cheat'];
    SaveConfigString('Server Config', 'vac', vac);

    eac := vlstdtrmoreservervar.Strings.Values['Easy Anti Cheat'];
    SaveConfigString('Server Config', 'eac', eac);

    rconweb := vlstdtrmoreservervar.Strings.Values['Rcon Web'];
    SaveConfigString('Server Config', 'rconweb', rconweb);

    serverpve := vlstdtrmoreservervar.Strings.Values['PVE'];
    SaveConfigString('Server Config', 'serverpve', serverpve);

    buildingstability := vlstdtrmoreservervar.Strings.Values['Building Stability'];
    SaveConfigString('Server Config', 'buildingstability', buildingstability);

    aithink := vlstdtrmoreservervar.Strings.Values['AI Think'];
    SaveConfigString('Server Config', 'aithink', aithink);

    aimove := vlstdtrmoreservervar.Strings.Values['AI Move'];
    SaveConfigString('Server Config', 'aimove', aimove);

    antihack := vlstdtrmoreservervar.Strings.Values['Anti Hack'];
    SaveConfigString('Server Config', 'antihack', antihack);

    buildingdecay := vlstdtrmoreservervar.Strings.Values['Building Decay'];
    SaveConfigString('Server Config', 'buildingdecay', buildingdecay);

    nav_wait := vlstdtrmoreservervar.Strings.Values['nav_wait'];
    SaveConfigString('Server Config', 'nav_wait', nav_wait);

    nav_disable := vlstdtrmoreservervar.Strings.Values['nav_disable'];
    SaveConfigString('Server Config', 'nav_disable', nav_disable);

    bradley := vlstdtrmoreservervar.Strings.Values['Bradley (APC)'];
    SaveConfigString('Server Config', 'bradley', bradley);

    halloweenenabled := vlstdtrmoreservervar.Strings.Values['halloween.enabled'];
    SaveConfigString('Server Config', 'halloweenenabled', halloweenenabled);

    halloweenpopulation := vlstdtrmoreservervar.Strings.Values['halloween.murdererpopulation'];
    SaveConfigString('Server Config', 'halloweenpopulation', halloweenpopulation);

    helilifetimeminutes := vlstdtrmoreservervar.Strings.Values['heli.lifetimeminutes'];
    SaveConfigString('Server Config', 'helilifetimeminutes', helilifetimeminutes);

    helibulletaccuracy := vlstdtrmoreservervar.Strings.Values['heli.bulletaccuracy'];
    SaveConfigString('Server Config', 'helibulletaccuracy', helibulletaccuracy);

    helibulletdamagescale := vlstdtrmoreservervar.Strings.Values['heli.bulletdamagescale'];
    SaveConfigString('Server Config', 'helibulletdamagescale', helibulletdamagescale);

    heliguns := vlstdtrmoreservervar.Strings.Values['heli.guns'];
    SaveConfigString('Server Config', 'heliguns', heliguns);

    ShowMessage('Saved config for server: ' + serveridentity);
  end;
end;

procedure Tfrmmain.btnserverdescriptioneditorClick(Sender: TObject);
var
  description: string;
begin
  description := lbledtserverdescription.Text;
  description := StringReplace(description, ' \n', #13#10, [rfReplaceAll]);
  frmdescription.mmo1.Text := description;
  frmdescription.ShowModal;
  lbledtserverdescription.Text := frmdescription.description;
end;

procedure Tfrmmain.btnstartbackupClick(Sender: TObject);
var
  totalms: Integer;
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageButton(Sender as TButton)
  else
  begin
    if Trim(lbledtbackuppath.Text) <> '' then
    begin
      if DirectoryExists(lbledtbackuppath.Text) then
      begin
        lbledtbackuppath.Enabled := False;
        lbledtbackuptime.Enabled := False;
        btnstartbackup.Enabled := False;
        btnstopbackup.Enabled := True;
        lbledtbackupstatus.Text := 'Running...';

        timer := TTimer.Create(Self);
        timer.Name := 'timer';
        totalms := StrToInt(lbledtbackuptime.Text) * 60000;
        timer.Interval := totalms;
        timer.Enabled := True;
        timer.OnTimer := timerOnTimer;
      end
      else
        ShowMessage('ERROR: ' + lbledtbackuppath.Text + ' does not exist!');
    end
    else
      ShowMessage('Please select a valid backup path.');
  end;
end;

procedure Tfrmmain.btnstartserverClick(Sender: TObject);
var
  commands: TStringList;
begin
  if tglswtchlangmode.State = tssOn then
  begin
    EditLanguageButton(Sender as TButton);
  end
  else
  begin
    if FileExists(RSMdir + '\RustDedicated.exe') then
    begin
      GenerateBatFile;
      Start(RSMdir + '\' + batfile);
    end
    else if MessageDlg('The server does not appear to be installed. Do you want RSM to install it for you?', mtError, [mbYes, mbNo], 0) = mrYes then
    begin
      btnInstallServer.Click;
    end;
  end;
end;

procedure Tfrmmain.btnstopbackupClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageButton(Sender as TButton)
  else
  begin
    timer.Enabled := False;
    timer.Free;
    dcmautobackup.Stop;
    mmoautobackuplog.Clear;
    lbledtbackuptime.Enabled := True;
    btnstartbackup.Enabled := True;
    btnstopbackup.Enabled := False;
    lbledtbackupstatus.Text := 'Not Running...';
    lbledtbackuppath.Enabled := True;
  end;
end;

procedure Tfrmmain.btnStopTaskClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageButton(Sender as TButton)
  else
  begin
    dcmsteamcmd.Stop;
    KillTask('steamcmd.exe');
    mmosteamcmd.Clear;
  end;
end;

procedure Tfrmmain.btnVerifyServerClick(Sender: TObject);
var
  branch: Integer;
  installcommand: string;
  command: TStringList;
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageButton(Sender as TButton)
  else
  begin
    dcmsteamcmd.Stop;
    KillTask('steamcmd.exe');
    mmosteamcmd.Clear;
    if not FileExists(steamcmdpath) then
    begin
      if MessageDlg('ERROR: steamcmd.exe could not be found. Do you want RSM to install it for you?', mtError, [mbYes, mbNo], 0) = mrYes then
      begin
        btnInstallSteamcmd.Click;
        btnInstallServer.Click;
      end;
    end
    else
    begin
      frmbranchselector.ShowModal;
      if frmbranchselector.install = True then
      begin
        branch := frmbranchselector.branch;
        case branch of
          -1:
            begin
              ShowMessage('You have to select a branch!');
              Exit
            end;
          0:
            installcommand := '"' + steamcmdpath + '" +login anonymous +force_install_dir "' + RSMdir + '" +app_update 258550 validate +quit';
          1:
            installcommand := '"' + steamcmdpath + '" +login anonymous +force_install_dir "' + RSMdir + '" +app_update 258550 -beta staging validate +quit';
          2:
            installcommand := '"' + steamcmdpath + '" +login anonymous +force_install_dir "' + RSMdir + '" +app_update 258550 -beta prerelease validate +quit';
          3:
            installcommand := '"' + steamcmdpath + '" +login anonymous +force_install_dir "' + RSMdir + '" +app_update 258550 -beta july2016 validate +quit';
          4:
            installcommand := '"' + steamcmdpath + '" +login anonymous +force_install_dir "' + RSMdir + '" +app_update 258550 -beta october2016 validate +quit';
        end;

        command := TStringList.Create;
        try
          command.Add('@echo off');
          command.Add('echo Starting Server Validation...');
          command.Add(installcommand);
          command.Add('echo Done.');
        finally
          command.SaveToFile(RSMdir + '\validate.bat');
          command.Free;
        end;
        dcmsteamcmd.CommandLine := RSMdir + '\validate.bat';
        dcmsteamcmd.OutputLines := mmosteamcmd.Lines;
        dcmsteamcmd.Execute;
      end;
    end;
  end;
end;

procedure Tfrmmain.btnwipeserverClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageButton(Sender as TButton)
  else
    frmwipe.ShowModal;
end;

procedure Tfrmmain.cbbserverlistChange(Sender: TObject);
begin
  serveridentity := cbbserverlist.Items[cbbserverlist.ItemIndex];
  ini_server_config := RSMdir + '\server\' + serveridentity + '\rsm-server-config.ini';
  SaveSettingString('Application Settings', 'serveridentity', serveridentity);
  LoadServerConfig;
  btnrefreshlists.Click;
end;

procedure Tfrmmain.CheckForUpdates;
var
  httpclient: TIdHTTP;
  version: Integer;
  sversion: string;
begin
  httpclient := TIdHTTP.Create(nil);
  sversion := httpclient.Get('http://41.185.91.51/RSM/version.html');
  sversion := Trim(sversion);
  version := StrToInt(sversion);
  if version > 11 then
  begin
    if Application.MessageBox('There''s a new version of RSM availible. Would you like to download it?', ' RSM Update Available', MB_YESNO) = IDYES then
    begin
      DeleteFile(RSMdir + '\RSMupdater.exe');
      DownloadSSL('https://inforcer25.co.za/owncloud/index.php/s/BnhfkIY0YwBVqp3/download', RSMdir + '\RSMupdater.zip', True, RSMdir);
      if FileExists(RSMdir + '\RSMupdater.exe') then
        Start(RSMdir + '\RSMupdater.exe')
      else
      begin
        ShowMessage('Could not find RSMupdater.exe. Please download the latest version of RSM manually.');
        Start('http://oxidemod.org/resources/rust-server-manager.2494/');
      end;
    end;
  end;
  httpclient.Free;
end;

procedure Tfrmmain.Checkforupdates1Click(Sender: TObject);
begin
  CheckForUpdates;
end;

procedure Tfrmmain.CheckHardware;
var
  // RAM
  RamStats: TMemoryStatus;
  availram, totalram: Real48;

  // Disc
  freespace, totalspace: Real48;
begin
  // RAM
  GlobalMemoryStatus(RamStats);
  availram := RamStats.dwAvailPhys / 1073741824;
  availram := Round(availram);
  totalram := RamStats.dwTotalPhys / 1073741824;
  totalram := Round(totalram);
  if availram <= 4 then
    ShowMessage('RSM has detected you have a minimum of ' + FloatToStr(availram) + 'GB RAM available out of ' + FloatToStr(totalram) + 'GB' + sLineBreak + sLineBreak + 'Rust Servers need the following amount of RAM to run smoothly:' + sLineBreak + sLineBreak + '50 slot server = 4gb ram' + sLineBreak + '100 slot server = 5.5gb ram' + sLineBreak + '150 slot server = 7gb ram' + sLineBreak + '200 slot server = 8-9gb ram');

  { GlobalMemoryStatus(RamStats);
    ShowMessage(FormatFloat('Total Memory: ##,##" MB"', RamStats.dwTotalPhys / 1048576));
    ShowMessage(Format('Amount of Free Memory: %d %%', [RamStats.dwMemoryLoad])); }

  // Disc
  freespace := DiskFree(0) / 1073741824;
  freespace := Round(freespace);
  totalspace := DiskSize(0) / 1073741824;
  totalspace := Round(totalspace);
  if freespace <= 10 then
    ShowMessage('WARNING: It seems that you are running on low space. Rust needs a minimum of 8GB to run smoothly.' + sLineBreak + sLineBreak + 'You have ' + FloatToStr(freespace) + 'GB of ' + FloatToStr(totalspace) + 'GB free.');

end;

procedure Tfrmmain.CheckRequiredFiles;
begin
  if not FileExists(RSMdir + '\libeay32.dll') or not FileExists(RSMdir + '\ssleay32.dll') or not FileExists(RSMdir + '\Rust.ttf') then
  begin
    DeleteFile(RSMdir + '\libeay32.dll');
    DeleteFile(RSMdir + '\ssleay32.dll');
    DeleteFile(RSMdir + '\Rust.ttf');
    ShowMessage('Some Files seem to be missing. They will now be downloaded. Please restart RSM after the download is complete.');
    DownloadNormal('http://inforcer25.co.za/owncloud/index.php/s/UPPKM6lIkbGTB4s/download', RSMdir + '\requiredfiles.zip', True, RSMdir);
  end
  else
  begin
    AddFontResource(PChar(RSMdir + '\Rust.ttf'));
    CheckForUpdates;
  end;
end;

procedure Tfrmmain.CheckServerMadeWith;
begin
  if FileExists(RSMdir + '\RSMsettings.ini') then
  begin
    if MessageDlg('RSM has detected that your server was made with RSM v3.8 or lower.' + sLineBreak + 'RSM v4.0 can''t work with the previous server config or settings. You''re going to have ' + sLineBreak + ' to redo the server config or continue to use the older version of RSM.' + sLineBreak + sLineBreak + 'Note: Your servers, plugins and plugin configs will not be affected' + sLineBreak + sLineBreak + 'Do you want RSM to delete the old config file? If you dont delete it this message will continue to show.', mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      DeleteFile(RSMdir + '\RSMsettings.ini')
    end;
  end;
end;

procedure Tfrmmain.chkloadlangClick(Sender: TObject);
begin
  SaveSettingString('Application Settings', 'loadlangonstart', BoolToStr(chkloadlang.Checked));
end;

procedure Tfrmmain.chklstconfigsDblClick(Sender: TObject);
begin
  if chklstconfigs.ItemIndex <> -1 then
  begin
    frmconfigeditor.sfolder := RSMdir + '\server\' + serveridentity + '\oxide\config\';
    frmconfigeditor.sfile := chklstconfigs.Items[chklstconfigs.ItemIndex];
    frmconfigeditor.Caption := 'Syntax Editor (' + serveridentity + ' - ' + chklstconfigs.Items[chklstconfigs.ItemIndex] + ')';
    frmconfigeditor.ShowModal;
  end;
end;

procedure Tfrmmain.chklstpluginsDblClick(Sender: TObject);
begin
  if chklstplugins.ItemIndex <> -1 then
  begin
    frmconfigeditor.sfolder := RSMdir + '\server\' + serveridentity + '\oxide\plugins\';
    frmconfigeditor.sfile := chklstplugins.Items[chklstplugins.ItemIndex];
    frmconfigeditor.Caption := 'Syntax Editor (' + serveridentity + ' - ' + chklstplugins.Items[chklstplugins.ItemIndex] + ')';
    frmconfigeditor.ShowModal;
  end;
end;

procedure Tfrmmain.chkstartserveronrsmstartClick(Sender: TObject);
begin
  SaveSettingString('Application Settings', 'startserveronrsmstart', BoolToStr(chkstartserveronrsmstart.Checked));
end;

procedure Tfrmmain.chkstartwithwindowsClick(Sender: TObject);
begin
  if IsAdmin = True then
  begin
    if chkstartwithwindows.Checked = True then
    begin
      SetAutoStart(ParamStr(0), 'RSM', True);
      SaveSettingString('Application Settings', 'StartWithWindows', BoolToStr(chkstartwithwindows.Checked));
    end
    else
    begin
      SetAutoStart(ParamStr(0), 'RSM', False);
      SaveSettingString('Application Settings', 'StartWithWindows', BoolToStr(chkstartwithwindows.Checked));
    end;
  end
  else
  begin
    ShellExecute(Handle, 'runas', PChar(RSMdir + '\RSM.exe'), nil, nil, SW_SHOWNORMAL);
    CleanUp;
    Application.Terminate;
  end;

end;

procedure Tfrmmain.CleanUp;
begin
  RemoveFontResource('Rust.ttf');
  dcmsteamcmd.Stop;
  KillTask('steamcmd.exe');
end;

procedure Tfrmmain.Config1Click(Sender: TObject);
begin
  Start(RSMdir + '\server\' + serveridentity + '\oxide\config');
end;

procedure Tfrmmain.CreateNewServer;
begin
  frmservercreator.edtserveridentity.Text := '';
  frmservercreator.ShowModal;
  if frmservercreator.cancreate = True then
  begin
    if DirectoryExists(RSMdir + '\server\' + serveridentity) then
    begin
      ShowMessage('Error: Server already exists.');
      Exit
    end
    else
    begin
      ForceDirectories(RSMdir + '\server\' + serveridentity);
      ini_server_config := RSMdir + '\server\' + serveridentity + '\rsm-server-config.ini';
      cbbserverlist.Clear;
      GetDirList(RSMdir + '\server', cbbserverlist.Items);
      cbbserverlist.ItemIndex := cbbserverlist.Items.IndexOf(serveridentity);
      LoadServerConfig;
    end;
  end;
end;

procedure Tfrmmain.Delete1Click(Sender: TObject);
var
  I: Integer;
begin
  if MessageDlg('Are you sure you want to delete all checked items?' + sLineBreak + 'They will be lost FOREVER!', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    for I := 0 to chklstplugins.Items.Count - 1 do
    begin
      if chklstplugins.Checked[I] then
      begin
        DeleteFile(RSMdir + '\server\' + serveridentity + '\oxide\plugins\' + chklstplugins.Items.Strings[I]);
      end;
    end;

    btnrefreshlists.Click;
  end;
end;

procedure Tfrmmain.DeleteActiveServer1Click(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete server: ' + UpperCase(serveridentity) + '? This can not be undone!', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    if serveridentity = 'default' then
      ShowMessage('You cannot delete the default server. Please choose another server.')
    else
    begin
      DeleteDirectory(RSMdir + '\server\' + serveridentity);
      cbbserverlist.Clear;
      GetDirList(RSMdir + '\server', cbbserverlist.Items);
      serveridentity := 'default';
      cbbserverlist.ItemIndex := cbbserverlist.Items.IndexOf(serveridentity);
      ini_server_config := RSMdir + '\server\' + serveridentity + '\rsm-server-config.ini';
      SaveSettingString('Application Settings', 'serveridentity', serveridentity);
      LoadServerConfig;
      btnrefreshlists.Click;
    end;
  end;

end;

procedure Tfrmmain.Deleteallcheckeditems1Click(Sender: TObject);
var
  I: Integer;
begin
  if MessageDlg('Are you sure you want to delete all checked items?' + sLineBreak + 'They will be lost FOREVER!', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    for I := 0 to chklstconfigs.Items.Count - 1 do
    begin
      if chklstconfigs.Checked[I] then
      begin
        DeleteFile(RSMdir + '\server\' + serveridentity + '\oxide\config\' + chklstconfigs.Items.Strings[I]);
      end;
    end;

    btnrefreshlists.Click;
  end;
end;

procedure Tfrmmain.DeleteDirectory(const Name: string);
var
  F: TSearchRec;
begin
  if FindFirst(Name + '\*', faAnyFile, F) = 0 then
  begin
    try
      repeat
        if (F.Attr and faDirectory <> 0) then
        begin
          if (F.Name <> '.') and (F.Name <> '..') then
          begin
            DeleteDirectory(Name + '\' + F.Name);
          end;
        end
        else
        begin
          DeleteFile(Name + '\' + F.Name);
        end;
      until FindNext(F) <> 0;
    finally
      FindClose(F);
    end;
    RemoveDir(Name);
  end;
end;

procedure Tfrmmain.DeleteRSMconfigfile1Click(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete RSM''s config file?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    DeleteFile(ini_rsm_settings);
  end;

end;

procedure Tfrmmain.DeleteServerConfig1Click(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete ' + serveridentity + '''s config file?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    DeleteFile(ini_server_config);
  end;
end;

procedure Tfrmmain.Donate1Click(Sender: TObject);
begin
  Start('paypal.me/AdriaanBoshoff');
end;

procedure Tfrmmain.DownloadNormal(Link, Path: string; Extract: Boolean; ExtractPath: string);
begin
  frmnormaldownloader.Link := Link;
  frmnormaldownloader.Path := Path;
  frmnormaldownloader.Extract := Extract;
  frmnormaldownloader.ExtractPath := ExtractPath;
  frmnormaldownloader.ShowModal;
  if frmnormaldownloader.error = True then
    ShowMessage('Error downloading or extracting.');
end;

procedure Tfrmmain.DownloadSSL(Link, Path: string; Extract: Boolean; ExtractPath: string);
begin
  frmssldownloader.Link := Link;
  frmssldownloader.Path := Path;
  frmssldownloader.Extract := Extract;
  frmssldownloader.ExtractPath := ExtractPath;
  frmssldownloader.ShowModal;
  if frmssldownloader.error = True then
    ShowMessage('Error downloading or extracting.');
end;

procedure Tfrmmain.Edit1Click(Sender: TObject);
begin
  if chklstplugins.ItemIndex <> -1 then
  begin
    frmconfigeditor.sfolder := RSMdir + '\server\' + serveridentity + '\oxide\plugins\';
    frmconfigeditor.sfile := chklstplugins.Items[chklstplugins.ItemIndex];
    frmconfigeditor.Caption := 'Syntax Editor (' + serveridentity + ' - ' + chklstplugins.Items[chklstplugins.ItemIndex] + ')';
    frmconfigeditor.ShowModal;
  end;
end;

procedure Tfrmmain.EditLanguageButton(Button: TButton);
begin
  frmLangEditor.lbledtchange.EditLabel.Caption := 'Change "' + Button.Caption + '" to:';
  frmLangEditor.lblcomponentid.Caption := 'Button ID: ' + Button.Name;
  frmLangEditor.sedsize.Value := Button.Font.Size;
  frmLangEditor.lbledtchange.Font.Size := Button.Font.Size;
  frmLangEditor.ShowModal;
  if frmLangEditor.CanSet = True then
  begin
    Button.Caption := frmLangEditor.lbledtchange.Text;
    Button.Font.Size := frmLangEditor.sedsize.Value;
    SaveLang('Buttons', Button.Name, frmLangEditor.lbledtchange.Text);
  end;
end;

procedure Tfrmmain.EditLanguageLabel(TLabel: TLabel);
begin
  frmLangEditor.lbledtchange.EditLabel.Caption := 'Change "' + TLabel.Caption + '" to:';
  frmLangEditor.lblcomponentid.Caption := 'Label ID: ' + TLabel.Name;
  frmLangEditor.sedsize.Value := TLabel.Font.Size;
  frmLangEditor.lbledtchange.Font.Size := TLabel.Font.Size;
  frmLangEditor.ShowModal;
  if frmLangEditor.CanSet = True then
  begin
    TLabel.Caption := frmLangEditor.lbledtchange.Text;
    TLabel.Font.Size := frmLangEditor.sedsize.Value;
    SaveLang('Labels', TLabel.Name, frmLangEditor.lbledtchange.Text);
  end;
end;

procedure Tfrmmain.Editselecteditem1Click(Sender: TObject);
begin
  if chklstconfigs.ItemIndex <> -1 then
  begin
    frmconfigeditor.sfolder := RSMdir + '\server\' + serveridentity + '\oxide\config\';
    frmconfigeditor.sfile := chklstconfigs.Items[chklstconfigs.ItemIndex];
    frmconfigeditor.Caption := 'Syntax Editor (' + serveridentity + ' - ' + chklstconfigs.Items[chklstconfigs.ItemIndex] + ')';
    frmconfigeditor.ShowModal;
  end;
end;

procedure Tfrmmain.edtsteamcmdpathChange(Sender: TObject);
begin
  if FileExists(edtsteamcmdpath.Text) then
  begin
    lblsteamcmdstatus.Caption := 'Found steamcmd.exe';
    lblsteamcmdstatus.Font.Color := clLime;
    btninstallsteamcmd2.Visible := False;
  end
  else
  begin
    lblsteamcmdstatus.Caption := 'Could not find steamcmd.exe';
    lblsteamcmdstatus.Font.Color := clRed;
    btninstallsteamcmd2.Visible := True;
  end;
  steamcmdpath := edtsteamcmdpath.Text;
  SaveSettingString('Application Settings', 'steamcmd', steamcmdpath);
end;

procedure Tfrmmain.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrmmain.FormActivate(Sender: TObject);
var
  Checkedall: Boolean;
begin
  if Checkedall = false then
  begin
    CheckRequiredFiles;
    btnrefreshlists.Click;
    Checkedall := True;
  end;
end;

procedure Tfrmmain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CleanUp;
end;

procedure Tfrmmain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  case MessageDlg('Are you sure you want to close RSM?', mtWarning, [mbYes, mbNo], 0) of
    mrYes:
      begin
        CanClose := True;
      end;
    mrNo:
      begin
        CanClose := False;
      end;
  end;
end;

procedure Tfrmmain.FormCreate(Sender: TObject);
var
  msg1, msg2: string;
begin
  Application.Title := 'Rust Server Manager';
  if not DirectoryExists(RSMdir + '\server\default') then
  begin
    ForceDirectories(RSMdir + '\server\default');
    serveridentity := 'default'
  end;
  DeleteFile(RSMdir + '\RSMupdater.exe');
  CheckServerMadeWith;
  LoadRSMsettings;
  LoadServerConfig;
  CheckHardware;

  // Msg 1
  msg1 := LoadSettingString('MSG', 'msg1', 'False');
  if msg1 = 'False' then
  begin
    if MessageDlg('Welcome to RSM.' + sLineBreak + sLineBreak + 'RSM is freeware and only makes money from donations. I spend a lot of my time working on RSM. Consider donating to it' + sLineBreak + ' so that the work on it can continue. The tools I used to make RSM do not come cheap.' + sLineBreak + sLineBreak + 'Do you want to donate to RSM? It will help with development.', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      Start('paypal.me/AdriaanBoshoff');
    end;
    SaveSettingString('MSG', 'msg1', 'True');
  end;

  // Msg 2
  msg2 := LoadSettingString('MSG', 'msg2', 'False');
  if msg2 = 'False' then
  begin
    if MessageDlg('RSM has made a steam group. There you can find other server owners and increase your knowledge.' + sLineBreak + sLineBreak + 'Do you want to join the steam group?', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      Start('http://steamcommunity.com/groups/rust-server-manager');
    end;
    SaveSettingString('MSG', 'msg2', 'True');
  end;

  Randomize;

end;

procedure Tfrmmain.FormDestroy(Sender: TObject);
begin
  CleanUp;
end;

procedure Tfrmmain.GenerateBatFile;
var
  commands: TStringList;
begin
  batfile := serveridentity + '-start.bat';
  commands := TStringList.Create;
  try
    commands.Add('@echo off');
    commands.Add(':start');
    commands.Add('cls');
    commands.Add('echo Starting Server...');
    commands.Add('echo This may take a while...');
    commands.Add('RustDedicated.exe -batchmode -nographics ^');
    commands.Add('+oxide.directory "server/' + serveridentity + '/oxide" ^');
    commands.Add('+rcon.ip ' + rconip + ' ^');
    commands.Add('+rcon.port ' + rconport + ' ^');
    commands.Add('+rcon.password "' + rconpassword + '" ^');
    commands.Add('+rcon.web "' + rconweb + '" ^');
    commands.Add('+server.ip ' + serverip + ' ^');
    commands.Add('+server.port ' + serverport + ' ^');
    commands.Add('+server.maxplayers ' + servermaxplayers + ' ^');
    commands.Add('+server.hostname "' + hostname + '" ^');
    commands.Add('+server.identity "' + serveridentity + '" ^');
    commands.Add('+server.level "' + servermap + '" ^');
    commands.Add('+server.seed ' + serverseed + ' +server.worldsize ' + serverworldsize + ' ^');
    commands.Add('+server.saveinterval ' + serversaveinterval + ' ^');
    commands.Add('+server.globalchat ' + globalchat + ' ^');
    commands.Add('+server.description "' + serverdescription + '" ^');
    commands.Add('+server.headerimage "' + bannerurl + '" ^');
    commands.Add('+server.url "' + serverurl + '" ^');
    commands.Add('+server.radiation ' + radiation + ' ^');
    commands.Add('+server.eac ' + eac + ' ^');
    commands.Add('+server.secure ' + vac + ' ^');
    commands.Add('+server.tickrate ' + servertickrate + ' ^');
    commands.Add('+server.pve ' + serverpve + ' ^');
    commands.Add('+server.stability ' + buildingstability + ' ^');
    commands.Add('+ai.think ' + aithink + ' ^');
    commands.Add('+ai.move ' + aimove + ' ^');
    commands.Add('+antihack.enabled ' + antihack + ' ^');
    commands.Add('+decay.scale ' + buildingdecay + ' ^');
    commands.Add('+bradley.enabled ' + bradley + ' ^');
    commands.Add('+backup' + ' ^');
    commands.Add('+nav_wait ' + nav_wait + ' ^');
    commands.Add('+nav_disable ' + nav_disable + ' ^');
    commands.Add('+halloween.enabled ' + halloweenenabled + ' ^');
    commands.Add('+halloween.murdererpopulation ' + halloweenpopulation + ' ^');
    commands.Add('+heli.lifetimeminutes ' + helilifetimeminutes + ' ^');
    commands.Add('+heli.bulletaccuracy ' + helibulletaccuracy + ' ^');
    commands.Add('+heli.bulletdamagescale ' + helibulletdamagescale + ' ^');
    commands.Add('+heli.guns ' + heliguns);

    if chkautorestart.Checked then
    begin
      commands.Add('cls');
      commands.Add('echo Restarting Server...');
      commands.Add('timeout /t 10');
      commands.Add('goto start');
    end;

  finally
    commands.SaveToFile(RSMdir + '\' + batfile);
    commands.Free;
  end;
end;

function Tfrmmain.GenerateRandomPassword(Lenght: Integer): string;
var
  str: string;
begin
  Randomize;
  // string with all possible chars
  str := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#$%^&*()';
  Result := '';
  repeat
    Result := Result + str[Random(Length(str)) + 1];
  until (Length(Result) = Lenght)
end;

procedure Tfrmmain.GetDirList(DirPath: string; DirList: TStrings);
var
  Found: Integer;
  SearchRec: TSearchRec;
begin
  Found := SysUtils.FindFirst(IncludeTrailingBackslash(DirPath) + '*.*', faDirectory, SearchRec);

  try
    while Found = 0 do
    begin
      if ((SearchRec.Attr and faDirectory) = faDirectory) and (SearchRec.Name[1] <> '.') then
        DirList.Add(SearchRec.Name);
      Found := SysUtils.FindNext(SearchRec);
    end;
  finally
    SysUtils.FindClose(SearchRec);
  end;
end;

function Tfrmmain.IsAdmin(Host: string): Boolean;
var
  H: SC_HANDLE;
begin
  if Win32Platform <> VER_PLATFORM_WIN32_NT then
    Result := True
  else
  begin
    H := OpenSCManager(PChar(Host), nil, SC_MANAGER_ALL_ACCESS);
    Result := H <> 0;
    if Result then
      CloseServiceHandle(H);
  end;
end;

procedure Tfrmmain.KillRustServerWontsave1Click(Sender: TObject);
begin
  KillTask('RustDedicated.exe');
end;

function Tfrmmain.KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0), FProcessEntry32.th32ProcessID), 0));
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure Tfrmmain.lbladdserverClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageLabel(Sender as TLabel)
  else
    CreateNewServer;
end;

procedure Tfrmmain.lblbackuplogClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageLabel(Sender as TLabel);
end;

procedure Tfrmmain.lblbackupminsClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageLabel(Sender as TLabel);
end;

procedure Tfrmmain.lblconfigsClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageLabel(Sender as TLabel);
end;

procedure Tfrmmain.lbledtbackuppathChange(Sender: TObject);
begin
  SaveSettingString('AutoBackup', 'path', lbledtbackuppath.Text);
end;

procedure Tfrmmain.lbledtbackuptimeChange(Sender: TObject);
begin
  SaveSettingString('AutoBackup', 'interval', lbledtbackuptime.Text);
end;

procedure Tfrmmain.lblpluginsClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageLabel(Sender as TLabel);
end;

procedure Tfrmmain.lblserverlistClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageLabel(Sender as TLabel);
end;

procedure Tfrmmain.lblservervariablesClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageLabel(Sender as TLabel);
end;

procedure Tfrmmain.lblsteamcmdClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    EditLanguageLabel(Sender as TLabel);
end;

procedure Tfrmmain.ListFileDir(Path: string; FileList: TStrings);
var
  SR: TSearchRec;
begin
  if FindFirst(Path + '*.*', faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
      begin
        FileList.Add(SR.Name);
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

function Tfrmmain.LoadConfigString(Section, Name, Value: string): string;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ini_server_config);
  try
    Result := ini.ReadString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

function Tfrmmain.LoadLang(Section, Name, Text: string): string;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(RSMdir + '\lang.ini');
  try
    Result := ini.ReadString(Section, Name, Text);
  finally
    ini.Free;
  end;
end;

procedure Tfrmmain.LoadLanguageFile;
begin
    // Buttons
  btnstartserver.Caption := LoadLang('Buttons', 'btnstartserver', 'Start Server');
  btnwipeserver.Caption := LoadLang('Buttons', 'btnwipeserver', 'Wipe Server');
  btngeneraterconpass.Caption := LoadLang('Buttons', 'btngeneraterconpass', 'Generate Rcon Pass');
  btngenerateseed.Caption := LoadLang('Buttons', 'btngenerateseed', 'Generate Seed');
  btnsaveserverconfig.Caption := LoadLang('Buttons', 'btnsaveserverconfig', 'Save Config');
  btnInstallServer.Caption := LoadLang('Buttons', 'btnInstallServer', 'Install / Update Server');
  btnVerifyServer.Caption := LoadLang('Buttons', 'btnVerifyServer', 'Validate Server Files');
  btnexportsteamcmdlog.Caption := LoadLang('Buttons', 'btnexportsteamcmdlog', 'Export');
  btnStopTask.Caption := LoadLang('Buttons', 'btnStopTask', 'Stop Task (Can Continue)');
  btnInstallSteamcmd.Caption := LoadLang('Buttons', 'btnInstallSteamcmd', 'Install SteamCMD');
  btninstalloxidemod.Caption := LoadLang('Buttons', 'btninstalloxidemod', 'Install OxideMod');
  btnrefreshlists.Caption := LoadLang('Buttons', 'btnrefreshlists', 'Refresh all');
  btnenabledisable.Caption := LoadLang('Buttons', 'btnenabledisable', 'Enable / Disable');
  btnpluginupdater.Caption := LoadLang('Buttons', 'btnpluginupdater', 'Update All Plugins');
  btnoxidebrowser.Caption := LoadLang('Buttons', 'btnoxidebrowser', 'Get Plugins');
  btnstartbackup.Caption := LoadLang('Buttons', 'btnstartbackup', 'Start AutoBackup');
  btnstopbackup.Caption := LoadLang('Buttons', 'btnstopbackup', 'Stop AutoBackup');
  btnbrowsebackuppath.Caption := LoadLang('Buttons', 'btnbrowsebackuppath', 'Browse');

    // Labels
end;

procedure Tfrmmain.LoadRSMsettings;
begin
    // Application Settings
  pgcmain.ActivePageIndex := LoadSettingInteger('Application Settings', 'lasttab', 0);
  edtsteamcmdpath.Text := steamcmdpath;

  AlphaBlendValue := StrToInt(LoadSettingString('Application Settings', 'Transparency', '255'));
  trackbartransparency.Position := AlphaBlendValue;

  chkloadlang.Checked := StrToBool(LoadSettingString('Application Settings', 'loadlangonstart', '0'));

  chkstartserveronrsmstart.Checked := StrToBool(LoadSettingString('Application Settings', 'startserveronrsmstart', '0'));

  with TCheckBoxEx(chkstartwithwindows) do
  begin
    ClicksDisabled := True;
    Checked := StrToBool(LoadSettingString('Application Settings', 'StartWithWindows', '0'));
    ClicksDisabled := False;
  end;

    // AutoBackup
  lbledtbackuppath.Text := LoadSettingString('AutoBackup', 'path', '');
  lbledtbackuptime.Text := LoadSettingString('AutoBackup', 'interval', '120');

    // Last Operation
  cbbserverlist.Clear;
  GetDirList(RSMdir + '\server', cbbserverlist.Items);
  cbbserverlist.ItemIndex := cbbserverlist.Items.IndexOf(serveridentity);

  if chkloadlang.Checked = True then
    LoadLanguageFile;

  if chkstartserveronrsmstart.Checked = True then
  begin
    GenerateBatFile;
    btnstartserver.Click;
  end;
end;

procedure Tfrmmain.LoadServerConfig;
begin
    // Edits
  hostname := LoadConfigString('Server Config', 'hostname', 'My Server');
  lbledtservername.Text := hostname;

  serverdescription := LoadConfigString('Server Config', 'serverdescription', 'Welcome to my sexy server');
  lbledtserverdescription.Text := serverdescription;

  serverurl := LoadConfigString('Server Config', 'serverurl', 'http://myweb.com');
  lbledtserverurl.Text := serverurl;

  bannerurl := LoadConfigString('Server Config', 'bannerurl', 'http://myweb.com/banner.png');
  lbledtserverbannerurl.Text := bannerurl;

    // Server Variables
  serverseed := LoadConfigString('Server Config', 'server.seed', IntToStr(Random(0123456789)));
  vlstdtrservervar.Strings.Values['server.seed'] := serverseed;

  serverworldsize := LoadConfigString('Server Config', 'server.worldsize', '6000');
  vlstdtrservervar.Strings.Values['server.worldsize'] := serverworldsize;

  servermaxplayers := LoadConfigString('Server Config', 'server.maxplayers', '50');
  vlstdtrservervar.Strings.Values['server.maxplayers'] := servermaxplayers;

  serverip := LoadConfigString('Server Config', 'server.ip', '0.0.0.0');
  vlstdtrservervar.Strings.Values['server.ip'] := serverip;

  serverport := LoadConfigString('Server Config', 'server.port', '28015');
  vlstdtrservervar.Strings.Values['server.port'] := serverport;

  servertickrate := LoadConfigString('Server Config', 'server.tickrate', '10');
  vlstdtrservervar.Strings.Values['server.tickrate'] := servertickrate;

  serversaveinterval := LoadConfigString('Server Config', 'server.saveinterval', '300');
  vlstdtrservervar.Strings.Values['server.saveinterval'] := serversaveinterval;

  rconip := LoadConfigString('Server Config', 'rcon.ip', '0.0.0.0');
  vlstdtrservervar.Strings.Values['rcon.ip'] := rconip;

  rconport := LoadConfigString('Server Config', 'rcon.port', '28016');
  vlstdtrservervar.Strings.Values['rcon.port'] := rconport;

  rconpassword := LoadConfigString('Server Config', 'rcon.password', GenerateRandomPassword(10));
  vlstdtrservervar.Strings.Values['rcon.password'] := rconpassword;

  servermap := LoadConfigString('Server Config', 'servermap', 'Procedural Map');
  cbbmap.ItemIndex := cbbmap.Items.IndexOf(servermap);

    // More Server Variables
  globalchat := LoadConfigString('Server Config', 'globalchat', 'True');
  vlstdtrmoreservervar.Strings.Values['Global Chat'] := globalchat;

  radiation := LoadConfigString('Server Config', 'radiation', 'True');
  vlstdtrmoreservervar.Strings.Values['Radiation'] := radiation;

  vac := LoadConfigString('Server Config', 'vac', 'True');
  vlstdtrmoreservervar.Strings.Values['Valve Anti Cheat'] := vac;

  eac := LoadConfigString('Server Config', 'eac', 'True');
  vlstdtrmoreservervar.Strings.Values['Easy Anti Cheat'] := eac;

  rconweb := LoadConfigString('Server Config', 'rconweb', 'True');
  vlstdtrmoreservervar.Strings.Values['Rcon Web'] := rconweb;

  serverpve := LoadConfigString('Server Config', 'serverpve', 'False');
  vlstdtrmoreservervar.Strings.Values['PVE'] := serverpve;

  buildingstability := LoadConfigString('Server Config', 'buildingstability', 'True');
  vlstdtrmoreservervar.Strings.Values['Building Stability'] := buildingstability;

  aithink := LoadConfigString('Server Config', 'aithink', 'True');
  vlstdtrmoreservervar.Strings.Values['AI Think'] := aithink;

  aimove := LoadConfigString('Server Config', 'aimove', 'True');
  vlstdtrmoreservervar.Strings.Values['AI Move'] := aimove;

  antihack := LoadConfigString('Server Config', 'antihack', 'True');
  vlstdtrmoreservervar.Strings.Values['Anti Hack'] := antihack;

  buildingdecay := LoadConfigString('Server Config', 'buildingdecay', '1');
  vlstdtrmoreservervar.Strings.Values['Building Decay'] := buildingdecay;

  nav_wait := LoadConfigString('Server Config', 'nav_wait', 'False');
  vlstdtrmoreservervar.Strings.Values['nav_wait'] := nav_wait;

  nav_disable := LoadConfigString('Server Config', 'nav_disable', 'False');
  vlstdtrmoreservervar.Strings.Values['nav_disable'] := nav_disable;

  bradley := LoadConfigString('Server Config', 'bradley', 'True');
  vlstdtrmoreservervar.Strings.Values['Bradley (APC)'] := bradley;

  halloweenenabled := LoadConfigString('Server Config', 'halloweenenabled', 'False');
  vlstdtrmoreservervar.Strings.Values['halloween.enabled'] := halloweenenabled;

  halloweenpopulation := LoadConfigString('Server Config', 'halloweenpopulation', '0');
  vlstdtrmoreservervar.Strings.Values['halloween.murdererpopulation'] := halloweenpopulation;

  helilifetimeminutes := LoadConfigString('Server Config', 'helilifetimeminutes', '15');
  vlstdtrmoreservervar.Strings.Values['heli.lifetimeminutes'] := helilifetimeminutes;

  helibulletaccuracy := LoadConfigString('Server Config', 'heli.bulletaccuracy', '2');
  vlstdtrmoreservervar.Strings.Values['heli.bulletaccuracy'] := helibulletaccuracy;

  helibulletdamagescale := LoadConfigString('Server Config', 'heli.bulletdamagescale', '1');
  vlstdtrmoreservervar.Strings.Values['heli.bulletdamagescale'] := helibulletdamagescale;

  heliguns := LoadConfigString('Server Config', 'heliguns', '1');
  vlstdtrmoreservervar.Strings.Values['heli.guns'] := heliguns;
end;

function Tfrmmain.LoadSettingInteger(Section, Name: string; Value: Integer): Integer;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ini_rsm_settings);
  try
    Result := ini.ReadInteger(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

function Tfrmmain.LoadSettingString(Section, Name, Value: string): string;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ini_rsm_settings);
  try
    Result := ini.ReadString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

procedure Tfrmmain.OpenRustandconnecttoserver1Click(Sender: TObject);
begin
  if MessageDlg('RSM will now attempt to open Rust and connect to your server.' + #13#10#13#10 + 'Do you want to continue?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    Start('steam://connect/localhost:' + serverport);
  end;
end;

procedure Tfrmmain.OxideModPermissionsSystem1Click(Sender: TObject);
begin
  Start('http://oxidemod.org/threads/using-the-oxide-permission-system.24291/');
end;

procedure Tfrmmain.pgcmainChange(Sender: TObject);
begin
  SaveSettingInteger('Application Settings', 'lasttab', pgcmain.ActivePageIndex);
end;

procedure Tfrmmain.Plugins1Click(Sender: TObject);
begin
  Start(RSMdir + '\server\' + serveridentity + '\oxide\plugins');
end;

procedure Tfrmmain.Reportissue1Click(Sender: TObject);
begin
  Start('http://oxidemod.org/resources/rust-server-manager.2494/');
end;

procedure Tfrmmain.RSMonGithuv1Click(Sender: TObject);
begin
  Start('https://github.com/AdriaanBoshoff/Rust-Server-Manager');
end;

procedure Tfrmmain.RSMonOxidemod1Click(Sender: TObject);
begin
  Start('http://oxidemod.org/resources/rust-server-manager.2494/');
end;

procedure Tfrmmain.RSMsteamgroup1Click(Sender: TObject);
begin
  Start('http://steamcommunity.com/groups/rust-server-manager');
end;

procedure Tfrmmain.RSMTutorialVideo1Click(Sender: TObject);
begin
  Start('https://www.youtube.com/watch?v=mcR9xb4dQT8');
end;

procedure Tfrmmain.SaveConfigString(Section, Name, Value: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ini_server_config);
  try
    ini.WriteString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

procedure Tfrmmain.SaveLang(Section, Name, Text: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(RSMdir + '\lang.ini');
  try
    ini.WriteString(Section, Name, Text);
  finally
    ini.Free;
  end;
end;

procedure Tfrmmain.SaveSettingInteger(Section, Name: string; Value: Integer);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ini_rsm_settings);
  try
    ini.WriteInteger(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

procedure Tfrmmain.SaveSettingString(Section, Name, Value: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ini_rsm_settings);
  try
    ini.WriteString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

procedure Tfrmmain.ServerRoot1Click(Sender: TObject);
begin
  Start(GetCurrentDir);
end;

procedure Tfrmmain.SetAutoStart(AppName, AppTitle: string; bRegister: Boolean);
const
  RegKey = '\Software\Microsoft\Windows\CurrentVersion\Run';
    // or: RegKey = '\Software\Microsoft\Windows\CurrentVersion\RunOnce';
var
  Registry: TRegistry;
begin
  Registry := TRegistry.Create;
  try
    Registry.RootKey := HKEY_CURRENT_USER; // or: HKEY_LOCAL_MACHINE
    if Registry.OpenKey(RegKey, False) then
    begin
      if bRegister = False then
        Registry.DeleteValue(AppTitle)
      else
        Registry.WriteString(AppTitle, AppName);
    end;
  finally
    Registry.Free;
  end;
end;

procedure Tfrmmain.Start(Path: string);
begin
  ShellExecute(Self.WindowHandle, 'open', PChar(Path), nil, nil, SW_SHOWNORMAL);
end;

procedure Tfrmmain.tglswtchlangmodeClick(Sender: TObject);
begin
  if tglswtchlangmode.State = tssOn then
    ShowMessage('Click on any item to edit the text. It will be saved to lang.ini' + sLineBreak + sLineBreak + 'Only buttons are supported for now.' + sLineBreak + sLineBreak + 'NOTE: If some text are not loading as you set them please report it on the oxidemod forums along witht he item ID.');
end;

procedure Tfrmmain.timerOnTimer(Sender: TObject);
var
  command: TStringList;
begin
  command := TStringList.Create;
  try
    command.Add('@echo off');
    command.Add('echo Starting Backup...');
    command.Add('xcopy "' + GetCurrentDir + '" "' + lbledtbackuppath.Text + '\" /h/i/c/k/e/r/y');
    command.Add('echo Done.')
  finally
    command.SaveToFile(RSMdir + '\AutoBackup.bat');
    command.Free;
  end;

  mmoautobackuplog.Clear;
  dcmautobackup.CommandLine := RSMdir + '\AutoBackup.bat';
  dcmautobackup.OutputLines := mmoautobackuplog.Lines;
  if dcmautobackup.IsRunning = False then
  begin
    dcmautobackup.Execute;
  end
  else
  begin
    dcmautobackup.Stop;
    dcmautobackup.Execute;
  end;
end;

procedure Tfrmmain.tmrcheckforupdatesTimer(Sender: TObject);
begin
  CheckForUpdates;
end;

procedure Tfrmmain.tmrpluginconfigfilderTimer(Sender: TObject);
begin
  btnrefreshlists.Click;
end;

procedure Tfrmmain.trackbartransparencyChange(Sender: TObject);
begin
  AlphaBlendValue := trackbartransparency.Position;
  SaveSettingString('Application Settings', 'Transparency', IntToStr(AlphaBlendValue));
end;

procedure Tfrmmain.Unlockdevpage1Click(Sender: TObject);
begin
  if InputBox('Enter dev code', 'Code can be found on the oxidemod overview page', '') = '7520' then
    tstestpage.TabVisible := True;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

finalization
  CheckSynchronize;

end.

