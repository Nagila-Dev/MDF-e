unit ufrmmanifestodestinatario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, DBCtrls, DBGrids, Buttons, DBExtCtrls, EditBtn, Types, uDM,
  ufuncoes, ACBrValidador, ACBrCEP, sqldb, db, csvdataset, BufDataset,
  ufrmBuscaLocalCarregamento, ufrmbuscauf, ufrmbuscaChaveDocumento,
  ufrmBuscaVeiculos, ufrmveiculos, ufrmbuscaserie, variants, dateutils, ufrmRelatorioDAMDFE, LCLType;

  {ufrmNfeManifestoFiscal - Manter comentado}

type

  { TfrmManifestoDestinatario }

  TfrmManifestoDestinatario = class(TForm)
    btnGerarMDFe: TButton;
    btnSairdaPagina: TButton;
    Button4: TButton;
    cbEstado: TComboBox;
    checkProprietario: TDBCheckBox;
    checkProprietario1: TDBCheckBox;
    dsDOCUMENTOS: TDataSource;
    DBEdit38: TDBEdit;
    DBLookupComboBox10: TDBLookupComboBox;
    DBLookupComboBox9: TDBLookupComboBox;
    lcbEmitente1: TDBLookupComboBox;
    lcbFEmisao1: TDBLookupComboBox;
    lcbModalidade: TDBLookupComboBox;
    dsBuscaCarregamento: TDataSource;
    lcbEmitente: TDBLookupComboBox;
    dsDados: TDataSource;
    dsBusca: TDataSource;
    dsGridDocumentos: TDataSource;
    dsReboques: TDataSource;
    dsTipoTransportador: TDataSource;
    dsFormaEmissao: TDataSource;
    dsModalidade: TDataSource;
    dsTipoEmitente: TDataSource;
    dsTipoProprietario: TDataSource;
    dsUFCarregamento: TDataSource;
    dbeCPF: TEdit;
    dbeNome: TEdit;
    edtBusca: TEdit;
    edtValor: TEdit;
    edtPeso: TEdit;
    edtserie: TEdit;
    edtPlaca: TEdit;
    edtUf: TEdit;
    edtchave: TEdit;
    edtCidadeDescarregamento: TEdit;
    edtCodIBGECarregamento: TEdit;
    edtCidadeCarregamento: TEdit;
    edtCodIBGEDescarregamento: TEdit;
    edtUFCarregamento: TEdit;
    edtUFDescarregamento: TEdit;
    lcbModalidade1: TDBLookupComboBox;
    lcbTTransportador1: TDBLookupComboBox;
    qryBusca: TSQLQuery;
    qryBuscaCarregamentoMDC_CIDADE: TStringField;
    qryBuscaCarregamentoMDC_UF: TStringField;
    qryBuscaCHAVE_MDFE: TStringField;
    qryBuscaDATA_AUT_MDFE: TDateField;
    qryBuscaDATA_EMISSAO: TDateField;
    qryBuscaDATA_VIAGEM: TDateField;
    qryBuscaFORMA_EMISSAO: TLongintField;
    qryBuscaHORA_EMISSAO: TTimeField;
    qryBuscaHORA_VIAGEM: TTimeField;
    qryBuscaID_MD5: TStringField;
    qryBuscaMDFE_ID: TLongintField;
    qryBuscaMODALIDADE: TLongintField;
    qryBuscaMODELO_DOC: TStringField;
    qryBuscaNF_EMPRESA: TLongintField;
    qryBuscaNUMERO_DOC: TLongintField;
    qryBuscaOBS: TMemoField;
    qryBuscaPROTOCOLO_MDFE: TStringField;
    qryBuscaSERIE_DOC: TStringField;
    qryBuscaSTATUS_MDFE: TStringField;
    qryBuscaTIPO_EMITENTE: TLongintField;
    qryBuscaTIPO_TRANSPORTADOR: TLongintField;
    qryBuscaTOT_CTE: TLongintField;
    qryBuscaTOT_MERCADORIAS: TBCDField;
    qryBuscaTOT_NF1_NF1A: TLongintField;
    qryBuscaTOT_NFE: TLongintField;
    qryBuscaTOT_PESO: TFMTBCDField;
    qryBuscaUF_CARREGAMENTO: TStringField;
    qryBuscaUF_DESCARREGAMENTO: TStringField;
    qryBuscaUND_MEDIDA: TLongintField;
    qryDadosCARREGAMENTO: TStringField;
    qryDadosCARROCERIA_LETRA: TStringField;
    qryDadosCHAVE_MDFE: TStringField;
    qryDadosCPF_CONDUTOR: TStringField;
    qryDadosDATA_EMISSAO: TDateField;
    qryDadosDATA_VIAGEM: TDateField;
    qryDadosDESCARREGAMENTO: TStringField;
    qryDadosEMISSAO_LETRA: TStringField;
    qryDadosEMITENTE_LETRA: TStringField;
    qryDadosFORMA_EMISSAO: TLongintField;
    qryDadosHORA_EMISSAO: TTimeField;
    qryDadosHORA_VIAGEM: TTimeField;
    qryDadosMDC_CIDADE: TStringField;
    qryDadosMDC_CIDADE_IBGE: TStringField;
    qryDadosMDD_CHAVE: TStringField;
    qryDadosMDD_PESO: TFMTBCDField;
    qryDadosMDD_SEG_COD_BARRA: TStringField;
    qryDadosMDD_VALOR: TBCDField;
    qryDadosMDV_CAPACIDADE_KG: TFMTBCDField;
    qryDadosMDV_CAPACIDADE_M3: TFMTBCDField;
    qryDadosMDV_COD_INTERNO: TStringField;
    qryDadosMDV_PLACA: TStringField;
    qryDadosMDV_PROP_CNPJ_CPF: TStringField;
    qryDadosMDV_PROP_INSC_ESTADUAL: TStringField;
    qryDadosMDV_PROP_NOME: TStringField;
    qryDadosMDV_PROP_UF: TStringField;
    qryDadosMDV_RNTRC: TStringField;
    qryDadosMDV_RODADO: TLongintField;
    qryDadosMDV_TARA: TFMTBCDField;
    qryDadosMDV_TIPO: TStringField;
    qryDadosMDV_TIPO_1: TStringField;
    qryDadosMDV_UF: TStringField;
    qryDadosMODALIDADE: TLongintField;
    qryDadosMODALIDADE_LETRA: TStringField;
    qryDadosNF_EMPRESA: TLongintField;
    qryDadosNOME_CONDUTOR: TStringField;
    qryDadosNUMERO_DOC: TLongintField;
    qryDadosPESOBRUTOCARGAMERCADORIA: TFMTBCDField;
    qryDadosPROTOCOLO_MDFE: TStringField;
    qryDadosQUANTIDADECTE: TLongintField;
    qryDadosQUANTIDADENF11A: TLongintField;
    qryDadosQUANTIDADENFE: TLongintField;
    qryDadosRODADO_LETRA: TStringField;
    qryDadosSERIE_DOC: TStringField;
    qryDadosSTATUS_MDFE: TStringField;
    qryDadosTIPO_EMITENTE: TLongintField;
    qryDadosTIPO_TRANSPORTADOR: TLongintField;
    qryDadosTOT_MERCADORIAS: TBCDField;
    qryDadosTRANSPORTADOR_LETRA: TStringField;
    qryDadosUF_CARREGAMENTO: TStringField;
    qryDadosUF_DESCARREGAMENTO: TStringField;
    qryDadosUND_MEDIDA: TLongintField;
    qryDOCUMENTOSMDD_CHAVE: TStringField;
    qryDOCUMENTOSMDD_PESO: TFMTBCDField;
    qryDOCUMENTOSMDD_SEG_COD_BARRA: TStringField;
    qryDOCUMENTOSMDD_VALOR: TBCDField;
    qryFormaEmissaoDESCRICAO: TStringField;
    qryFormaEmissaoTIPO: TLongintField;
    qryGridDocumentosCHAVE: TStringField;
    qryGridDocumentosCIDADE_CARREGAMENTO: TStringField;
    qryGridDocumentosCIDADE_DESCARREGAMENTO: TStringField;
    qryGridDocumentosIBGE_C: TLongintField;
    qryGridDocumentosIBGE_D: TLongintField;
    qryGridDocumentosPESO: TLongintField;
    qryGridDocumentosUF_C: TStringField;
    qryGridDocumentosUF_D: TStringField;
    qryGridDocumentosVALOR: TLongintField;
    qryMDFEDATA_EMISSAO: TDateField;
    qryMDFEDATA_VIAGEM: TDateField;
    qryMDFEEMISSAO_LETRA: TStringField;
    qryMDFEEMITENTE_LETRA: TStringField;
    qryMDFEFORMA_EMISSAO: TLongintField;
    qryMDFEHORA_EMISSAO: TTimeField;
    qryMDFEHORA_VIAGEM: TTimeField;
    qryMDFEMDFE_ID: TLongintField;
    qryMDFEMODALIDADE: TLongintField;
    qryMDFEMODALIDADE_LETRA: TStringField;
    qryMDFEMODELO_DOC: TStringField;
    qryMDFENF_EMPRESA: TLongintField;
    qryMDFENUMERO_DOC: TLongintField;
    qryMDFEOBS: TMemoField;
    qryMDFESERIE_DOC: TStringField;
    qryMDFESTATUS_MDFE: TStringField;
    qryMDFETIPO_EMITENTE: TLongintField;
    qryMDFETIPO_TRANSPORTADOR: TLongintField;
    qryMDFETOT_CTE: TLongintField;
    qryMDFETOT_MERCADORIAS: TBCDField;
    qryMDFETOT_NF1_NF1A: TLongintField;
    qryMDFETOT_NFE: TLongintField;
    qryMDFETOT_PESO: TFMTBCDField;
    qryMDFETRANSPORTADOR_LETRA: TStringField;
    qryMDFEUF_CARREGAMENTO: TStringField;
    qryMDFEUF_DESCARREGAMENTO: TStringField;
    qryMDFEUND_MEDIDA: TLongintField;
    qryMDFE_CONDUTORESCPF_CONDUTOR: TStringField;
    qryMDFE_CONDUTORESID_ITEM: TLongintField;
    qryMDFE_CONDUTORESMDFE_ID: TLongintField;
    qryMDFE_CONDUTORESNOME_CONDUTOR: TStringField;
    qryMDFE_LOCALCARGA_DOCSID_MD5: TStringField;
    qryMDFE_VEICULOSMDFE_ID: TLongintField;
    qryMDFE_VEICULOSMDV_CAPACIDADE_KG: TFMTBCDField;
    qryMDFE_VEICULOSMDV_CAPACIDADE_M3: TFMTBCDField;
    qryMDFE_VEICULOSMDV_CARROCERIA: TLongintField;
    qryMDFE_VEICULOSMDV_COD_INTERNO: TStringField;
    qryMDFE_VEICULOSMDV_ID: TLongintField;
    qryMDFE_VEICULOSMDV_PLACA: TStringField;
    qryMDFE_VEICULOSMDV_PROP_CNPJ_CPF: TStringField;
    qryMDFE_VEICULOSMDV_PROP_DEFINIDO: TStringField;
    qryMDFE_VEICULOSMDV_PROP_INSC_ESTADUAL: TStringField;
    qryMDFE_VEICULOSMDV_PROP_NOME: TStringField;
    qryMDFE_VEICULOSMDV_PROP_RNTRC: TStringField;
    qryMDFE_VEICULOSMDV_PROP_TIPO: TLongintField;
    qryMDFE_VEICULOSMDV_PROP_UF: TStringField;
    qryMDFE_VEICULOSMDV_RODADO: TLongintField;
    qryMDFE_VEICULOSMDV_TARA: TFMTBCDField;
    qryMDFE_VEICULOSMDV_TIPO: TStringField;
    qryMDFE_VEICULOSMDV_UF: TStringField;
    qryModalidadeDESCRICAO: TStringField;
    qryModalidadeTIPO: TLongintField;
    qryNF_SERIENF_EMPRESA: TLongintField;
    qryNF_SERIENF_SERIE: TStringField;
    qryNF_SERIENF_ULT_NUMERO: TLongintField;
    qryREBOQUESMDFE_ID: TLongintField;
    qryREBOQUESMDV_CAPACIDADE_KG: TFMTBCDField;
    qryREBOQUESMDV_CAPACIDADE_M3: TFMTBCDField;
    qryREBOQUESMDV_CARROCERIA: TLongintField;
    qryREBOQUESMDV_COD_INTERNO: TStringField;
    qryREBOQUESMDV_ID: TLongintField;
    qryREBOQUESMDV_PLACA: TStringField;
    qryREBOQUESMDV_PROP_CNPJ_CPF: TStringField;
    qryREBOQUESMDV_PROP_DEFINIDO: TStringField;
    qryREBOQUESMDV_PROP_INSC_ESTADUAL: TStringField;
    qryREBOQUESMDV_PROP_NOME: TStringField;
    qryREBOQUESMDV_PROP_RNTRC: TStringField;
    qryREBOQUESMDV_PROP_TIPO: TLongintField;
    qryREBOQUESMDV_PROP_UF: TStringField;
    qryREBOQUESMDV_RODADO: TLongintField;
    qryREBOQUESMDV_TARA: TFMTBCDField;
    qryREBOQUESMDV_TIPO: TStringField;
    qryREBOQUESMDV_UF: TStringField;
    qryTipoEmitenteDESCRICAO: TStringField;
    qryTipoEmitenteTIPO: TLongintField;
    qryREBOQUES: TSQLQuery;
    qryTipoRodadoDESCRICAO: TStringField;
    qryTipoRodadoTIPO: TLongintField;
    dsTipoRodado: TDataSource;
    dsTipoCarroceria: TDataSource;
    dsMDFE_EVENTOS: TDataSource;
    dsMDFE_PERCURSO: TDataSource;
    dsMDFE_CONDUTORES: TDataSource;
    dsMDFE_VEICULOS: TDataSource;
    dsMDFE_LOCALCARGA_DOCS: TDataSource;
    dsMDFE_LOCALCARGA: TDataSource;
    dsNF_SERIE: TDataSource;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit50: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBGrid1: TDBGrid;
    GridDocumentos: TDBGrid;
    DBGrid11: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    DBGrid6: TDBGrid;
    DbGreboques: TDBGrid;
    DbgCondutores: TDBGrid;
    DBGrid9: TDBGrid;
    lcbUFC: TDBLookupComboBox;
    lcbTTransportador: TDBLookupComboBox;
    lcbFEmisao: TDBLookupComboBox;
    DBLookupComboBox6: TDBLookupComboBox;
    DBLookupComboBox7: TDBLookupComboBox;
    DBLookupComboBox8: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    dsMDFE: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox13: TGroupBox;
    GroupBox14: TGroupBox;
    GroupBox15: TGroupBox;
    GroupBox16: TGroupBox;
    GroupBox17: TGroupBox;
    GroupBox18: TGroupBox;
    GroupBox19: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label9: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    PageControl3: TPageControl;
    PageControl4: TPageControl;
    PageControl5: TPageControl;
    PageControl6: TPageControl;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel2: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    qryMDFE: TSQLQuery;
    qryMDFE_EVENTOSLOG_MSG: TMemoField;
    qryMDFE_EVENTOSMDFE_COD_TP: TLongintField;
    qryMDFE_EVENTOSMDFE_CORRECAO: TMemoField;
    qryMDFE_EVENTOSMDFE_ID: TLongintField;
    qryMDFE_EVENTOSMDFE_LOTE: TLongintField;
    qryMDFE_EVENTOSMDFE_SEQ: TLongintField;
    qryMDFE_EVENTOSPERFIL_ID: TLongintField;
    qryMDFE_EVENTOSUSR_COD: TLongintField;
    qryMDFE_EVENTOSXML_EVENTO: TMemoField;
    qryMDFE_LOCALCARGAMDC_CIDADE: TStringField;
    qryMDFE_LOCALCARGAMDC_CIDADE_IBGE: TStringField;
    qryMDFE_LOCALCARGAMDC_ID: TLongintField;
    qryMDFE_LOCALCARGAMDC_TIPO: TStringField;
    qryMDFE_LOCALCARGAMDC_UF: TStringField;
    qryMDFE_LOCALCARGAMDFE_ID: TLongintField;
    qryMDFE_LOCALCARGA_DOCSMDC_ID: TLongintField;
    qryMDFE_LOCALCARGA_DOCSMDD_CHAVE: TStringField;
    qryMDFE_LOCALCARGA_DOCSMDD_MODELO: TStringField;
    qryMDFE_LOCALCARGA_DOCSMDD_PESO: TFMTBCDField;
    qryMDFE_LOCALCARGA_DOCSMDD_SEG_COD_BARRA: TStringField;
    qryMDFE_LOCALCARGA_DOCSMDD_VALOR: TBCDField;
    qryMDFE_LOCALCARGA_DOCSMDFE_ID: TLongintField;
    qryMDFE_PERCURSOMDFE_ID: TLongintField;
    qryMDFE_PERCURSOMPE_ID: TLongintField;
    qryMDFE_PERCURSOMPE_UF: TStringField;
    qryTipoProprietario: TSQLQuery;
    qryTipoTransportadorDESCRICAO: TStringField;
    qryTipoTransportadorDESCRICAO1: TStringField;
    qryTipoTransportadorTIPO: TLongintField;
    qryTipoTransportadorTIPO1: TLongintField;
    qryUFCarregamentoID_UF: TLongintField;
    qryUFCarregamentoSIGLA: TStringField;
    SpeedButton1: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    btnAddDocs: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    qryNF_SERIE: TSQLQuery;
    qryMDFE_LOCALCARGA: TSQLQuery;
    qryMDFE_LOCALCARGA_DOCS: TSQLQuery;
    qryMDFE_VEICULOS: TSQLQuery;
    qryMDFE_CONDUTORES: TSQLQuery;
    qryMDFE_PERCURSO: TSQLQuery;
    qryMDFE_EVENTOS: TSQLQuery;
    qryTipoCarroceria: TSQLQuery;
    qryTipoCarroceriaDESCRICAO: TStringField;
    qryTipoCarroceriaTIPO: TLongintField;
    qryTipoRodado: TSQLQuery;
    qryFormaEmissao: TSQLQuery;
    qryUFCarregamento: TSQLQuery;
    qryModalidade: TSQLQuery;
    qryTipoEmitente: TSQLQuery;
    qryTipoTransportador: TSQLQuery;
    SpeedButton9: TSpeedButton;
    qryGridDocumentos: TSQLQuery;
    qryDados: TSQLQuery;
    qryBuscaCarregamento: TSQLQuery;
    qryDOCUMENTOS: TSQLQuery;
    TabSheet1: TTabSheet;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    TabSheet13: TTabSheet;
    TabSheet14: TTabSheet;
    TabSheet2: TTabSheet;
    tsdados: TTabSheet;
    tsAssistente: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    tsConsulta: TTabSheet;
    tbAnterior: TToolButton;
    tbApagar: TToolButton;
    tbBuscar: TToolButton;
    tbCancelar: TToolButton;
    tbFechar: TToolButton;
    tbGravar: TToolButton;
    tbIncluir: TToolButton;
    tbModificar: TToolButton;
    tbProximo: TToolButton;
    ToolBarPrincipal: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure btnGerarMDFeClick(Sender: TObject);
    procedure btnSairdaPaginaClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure cbEstadoKeyPress(Sender: TObject; var Key: char);
    procedure checkProprietario1Change(Sender: TObject);
    procedure checkProprietario1Click(Sender: TObject);
    procedure checkProprietarioClick(Sender: TObject);
    procedure dbeCPFExit(Sender: TObject);
    procedure dbeCPFKeyPress(Sender: TObject; var Key: char);
    procedure DBEdit38Change(Sender: TObject);
    procedure DBEdit38KeyPress(Sender: TObject; var Key: char);
    procedure DBEdit42KeyPress(Sender: TObject; var Key: char);
    procedure DBEdit43KeyPress(Sender: TObject; var Key: char);
    procedure DBEdit44KeyPress(Sender: TObject; var Key: char);
    procedure DBEdit45KeyPress(Sender: TObject; var Key: char);
    procedure DBEdit47KeyPress(Sender: TObject; var Key: char);
    procedure DBEdit48KeyPress(Sender: TObject; var Key: char);
    procedure DBEdit49KeyPress(Sender: TObject; var Key: char);
    procedure DBEdit50KeyPress(Sender: TObject; var Key: char);
    procedure dbeNomeKeyPress(Sender: TObject; var Key: char);
    procedure edtchaveKeyPress(Sender: TObject; var Key: char);
    procedure edtValorKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure GridDocumentosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridDocumentosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PageControl4Change(Sender: TObject);
    procedure qryBuscaAfterScroll(DataSet: TDataSet);
    procedure qryMDFEAfterOpen(DataSet: TDataSet);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnAddDocsClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure tbAnteriorClick(Sender: TObject);
    procedure tbBuscarClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure tbFecharClick(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
    procedure tbIncluirClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbProximoClick(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
  private

    procedure PreencherGridDOCS();
    procedure validacaoParaGravar();

    procedure NF_SERIE();
    procedure MDFE();
    procedure MDFE_LOCALCARGA();
    procedure MDFE_VEICULOS();
    procedure MDFE_LOCALCARGA_DOCS();
    procedure MDFE_PERCURSO();
    procedure MDFE_CONDUTORES();
    procedure MDFE_EVENTOS();

    procedure GerarDadosMDFe();
    procedure SalvarDadosMDFe();

    procedure qrysClose();
    procedure qrysOpen();
    procedure qrysEdit();

  public
    var geradorMDFE_ID, geradorMDC_ID, geradorMDV_ID, geradorID_ITEM: Integer;
    var select: String;
    var totalizador: integer;
    function ValidaCPF(num: string): boolean;
    function ApenasNumeros(Const Texto:String):String;
    procedure ControlarBotoes (EmEdicao : Boolean);
    procedure ControlarEditProprietario(EmEdicao: Boolean);
    procedure limparquerys();
    function Edicao(EDIT: String;STRI:String):string;

  end;

var
  frmManifestoDestinatario: TfrmManifestoDestinatario;
  LocalFiltrar: array [1..100] of integer;
  InsertReboques: string;
  MDFE_ID: integer;

implementation

{$R *.lfm}

{ TfrmManifestoDestinatario }

procedure TfrmManifestoDestinatario.FormCreate(Sender: TObject);
begin
  PageControl2.Pages[1].TabVisible := False;
  PageControl2.ActivePage := tsdados;

  qrysOpen();

  ControlarEditProprietario(False);

  select := qryBusca.SQL.Text;

  tbGravar.Enabled := False;
  tbApagar.Enabled := False;

  ufuncoes.PermissaoUsuario(DM.Id_usuario,30,DM.empresaSelecionada, frmManifestoDestinatario);

  ControlarBotoes(False);
end;

procedure TfrmManifestoDestinatario.GridDocumentosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if not qryGridDocumentos.IsEmpty then
  begin
    if key = VK_DELETE then
    begin
      if MessageDlg('Tem certeza que deseja excluir esse item?' , mtConfirmation, [mbYes, mbNo], 0)= mrYes then
        frmManifestoDestinatario.qryGridDocumentos.Delete ;
    end;
  end;
end;

procedure TfrmManifestoDestinatario.GridDocumentosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  ApagarLinhaGrid(key, GridDocumentos, 'Deseja apagar? ');
end;

procedure TfrmManifestoDestinatario.PageControl4Change(Sender: TObject);
begin

end;

procedure TfrmManifestoDestinatario.qryBuscaAfterScroll(DataSet: TDataSet);
begin
  qryMDFE.close;
  qryMDFE.ParamByName('MDFE_ID').AsInteger:= qryBuscaMDFE_ID.AsInteger;
  qryMDFE.open;

  qryMDFE_VEICULOS.close;
  qryMDFE_VEICULOS.ParamByName('MDFE_ID').AsInteger:= qryBuscaMDFE_ID.AsInteger;
  qryMDFE_VEICULOS.open;

  qryMDFE_PERCURSO.close;
  qryMDFE_PERCURSO.ParamByName('MDFE_ID').AsInteger:= qryBuscaMDFE_ID.AsInteger;
  qryMDFE_PERCURSO.open;

  qryMDFE_CONDUTORES.close;
  qryMDFE_CONDUTORES.ParamByName('MDFE_ID').AsInteger:= qryBuscaMDFE_ID.AsInteger;
  qryMDFE_CONDUTORES.open;

  qryBuscaCarregamento.Close;
  qryBuscaCarregamento.ParamByName('mdfe_id').AsInteger:= qryBuscaMDFE_ID.AsInteger;
  qryBuscaCarregamento.Open;

  qryREBOQUES.Close;
  qryREBOQUES.ParamByName('mdfe_id').AsInteger:= qryBuscaMDFE_ID.AsInteger;
  qryREBOQUES.Open;

  qryDOCUMENTOS.Close;
  qryDOCUMENTOS.ParamByName('mdfe_id').AsInteger:= qryBuscaMDFE_ID.AsInteger;
  qryDOCUMENTOS.Open;
end;

procedure TfrmManifestoDestinatario.qryMDFEAfterOpen(DataSet: TDataSet);
begin
  {- qryMDFE.Edit;}
  {- totalizador := qryGridDocumentos.RecordCount;}
end;

procedure TfrmManifestoDestinatario.SpeedButton10Click(Sender: TObject);
begin
  if qryMDFE_CONDUTORES.IsEmpty = true then
  begin
    exit;
  end else
  begin
    qryMDFE_CONDUTORES.Delete;
  end;
end;

procedure TfrmManifestoDestinatario.SpeedButton11Click(Sender: TObject);
begin
  if qryMDFE_PERCURSO.IsEmpty = true then
  begin
    exit;
  end else
  begin
    qryMDFE_PERCURSO.Delete;
  end;
end;

procedure TfrmManifestoDestinatario.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmBuscaserie, FrmBuscaserie);
  FrmBuscaserie.ShowModal;

  if FrmBuscaserie.ModalResult = mrOK then
  begin
    edtserie.Text := FrmBuscaserie.CodigoRetorno;
  end;
end;

procedure TfrmManifestoDestinatario.SpeedButton2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmBuscaVeiculos, frmBuscaVeiculos);
  frmBuscaVeiculos.ShowModal;

  if frmBuscaVeiculos.ModalResult = mrOK then
  begin
    edtPlaca.Text := frmBuscaVeiculos.codigoRetorno;
    edtUf.Text    := frmBuscaVeiculos.qryBuscaEQI_UF.AsString;
  end;
  FreeAndNil(frmBuscaVeiculos);
end;

procedure TfrmManifestoDestinatario.SpeedButton5Click(Sender: TObject);
begin
  Application.CreateForm(TfrmbuscaChaveDocumento, frmbuscaChaveDocumento);
  {+}frmbuscaChaveDocumento.tela:= 'frmManifestoDestinatario';
  frmbuscaChaveDocumento.ShowModal;

  if frmbuscaChaveDocumento.ModalResult = mrOK then
  begin
    {-}//edtchave.Text := frmbuscaChaveDocumento.CodigoRetorno;
    {-}//edtValor.Text := BuscarRegistro('NOTA_FISCAL', 'CHAVE_NFE', 'NF_VALOR_MERCADORIA', EDTCHAVE.TEXT);
    {-}//edtPeso.Text  := BuscarRegistro('NOTA_FISCAL', 'CHAVE_NFE', 'NF_PESO_LIQUIDO', EDTCHAVE.TEXT);
  end;
  FreeAndNil(frmbuscaChaveDocumento);
end;

procedure TfrmManifestoDestinatario.SpeedButton6Click(Sender: TObject);
begin
  if (qryMDFEUF_CARREGAMENTO.AsString = '') then
  begin
    MensagemAtencao('Necessário definir UF de Carregamento');
    Exit;
  end;

  Application.CreateForm(TfrmBuscaLocalCarregamento, frmBuscaLocalCarregamento);
  frmBuscaLocalCarregamento.ShowModal;

  if frmBuscaLocalCarregamento.ModalResult = mrOK then
  begin
    edtCodIBGECarregamento.Text := frmBuscaLocalCarregamento.CodigoRetorno;
    edtCidadeCarregamento.Text  := BuscarRegistro('CIDADES','ID_IBGE','NOME_CIDADE',edtCodIBGECarregamento.Text);
    edtUFCarregamento.Text      := BuscarRegistro('UF','ID_UF','SIGLA',
    BuscarRegistro('CIDADES','ID_IBGE','ID_UF',edtCodIBGECarregamento.Text));
  end;

  FreeAndNil(frmBuscaLocalCarregamento);
end;

procedure TfrmManifestoDestinatario.SpeedButton7Click(Sender: TObject);
begin
  Application.CreateForm(TfrmBuscaLocalCarregamento, frmBuscaLocalCarregamento);
  frmBuscaLocalCarregamento.ShowModal;

  if frmBuscaLocalCarregamento.ModalResult = mrOK then
  begin
    edtCodIBGEDescarregamento.Text := frmBuscaLocalCarregamento.CodigoRetorno;
    edtCidadeDescarregamento.Text  := BuscarRegistro('CIDADES','ID_IBGE','NOME_CIDADE',edtCodIBGEDescarregamento.Text);
    edtUFDescarregamento.Text      := BuscarRegistro('UF','ID_UF','SIGLA',
    BuscarRegistro('CIDADES','ID_IBGE','ID_UF',edtCodIBGEDescarregamento.Text));
  end;

  FreeAndNil(frmBuscaLocalCarregamento);
end;

procedure TfrmManifestoDestinatario.SpeedButton8Click(Sender: TObject);
begin
  Application.CreateForm(TfrmVeiculos, frmVeiculos);
  frmVeiculos.ShowModal;

  qryREBOQUES.Open;
  qryREBOQUES.Edit;
end;

procedure TfrmManifestoDestinatario.SpeedButton9Click(Sender: TObject);
begin
  if qryMDFE_CONDUTORES.RecordCount >= 10 then
    Exit;

  if qryMDFE_CONDUTORES.Locate('CPF_CONDUTOR', dbeCPF.Text, []) then
  begin
    ShowMessage('Este Registro já foi incluido na lista!');
    Exit;
  end;

  with qryMDFE_CONDUTORES do
  begin
    Append;
    FieldByName('CPF_CONDUTOR').AsString := dbeCPF.Text;
    FieldByName('NOME_CONDUTOR').AsString:= dbeNome.Text;
    Post;
  end;

  dbeCPF.Text := '';
  dbeNome.Text:= '';
end;

procedure TfrmManifestoDestinatario.tbAnteriorClick(Sender: TObject);
begin
  qryBusca.Prior;
end;

procedure TfrmManifestoDestinatario.tbBuscarClick(Sender: TObject);
begin
  with qryBusca do
  begin
    Close;
    SQL.Text := select;
    SQL.Add(' and m.numero_doc = :numero_doc');
    ParamByName('numero_doc').AsInteger:= StrToInt(edtBusca.Text);
    Open;
  end;
end;

procedure TfrmManifestoDestinatario.SpeedButton3Click(Sender: TObject);
begin
  if qryMDFE_PERCURSO.RecordCount >= 25 then
    Exit;

  if qryMDFE_PERCURSO.Locate('MPE_UF', cbEstado.Text, []) then
  begin
    ShowMessage('Este Registro já foi incluido na lista!');
    Exit;
  end;

  qryMDFE_PERCURSO.Open;
  qryMDFE_PERCURSO.Edit;

  qryMDFE_PERCURSO.Append;
  qryMDFE_PERCURSOMPE_UF.AsString  := cbEstado.Text;
  qryMDFE_PERCURSO.Post;

  cbEstado.Text := '';
end;

procedure TfrmManifestoDestinatario.tbCancelarClick(Sender: TObject);
begin
  if MessageDlg('Pergunta', 'Você deseja cancelar o registro?', mtConfirmation,
  [mbYes, mbNo],1)= mrYes then
  begin
    qryMDFE.Cancel;
    qryNF_SERIE.Cancel;
    qryMDFE_EVENTOS.Cancel;
    qryMDFE_PERCURSO.Cancel;
    qryMDFE_VEICULOS.Cancel;
    qryMDFE_CONDUTORES.Cancel;
    qryMDFE_LOCALCARGA.Cancel;
    qryMDFE_LOCALCARGA_DOCS.Cancel;

  {+}limparquerys();

  {+}PageControl2.ActivePage := tsdados;
  {+}PageControl2.Pages[1].TabVisible := false;
  {+}ControlarBotoes(False);
  end;

end;

procedure TfrmManifestoDestinatario.tbFecharClick(Sender: TObject);
begin
  //if MessageDlg('Pergunta', 'Deseja sair da tela?', mtInformation,[mbYes, mbNo],0) = mrYes then
  //begin
    frmManifestoDestinatario.Close;
    FreeAndNil(frmManifestoDestinatario);
  //end;
end;

procedure TfrmManifestoDestinatario.tbIncluirClick(Sender: TObject);
begin
  PageControl2.Pages[1].TabVisible := True;
  PageControl2.ActivePage := tsAssistente;

  qrysClose();
  qrysOpen();

  ControlarBotoes(True);

  {+}qryBusca.Close;
  {+}limparquerys();

  {+}qryMDFE.Edit;
  {+}lcbModalidade.KeyValue:= 1;
  {+}lcbEmitente.KeyValue  := 2;

end;

procedure TfrmManifestoDestinatario.tbModificarClick(Sender: TObject);
begin
  if qryBusca.IsEmpty then
  Exit;

  if qryMDFE.FieldByName('STATUS_MDFE').AsString = 'A' then
  begin
   ShowMessage('Atenção, alteração indisponível.'+ #13 +'Os dados enviados para a SEFAZ não podem ser modificados.');
   exit;
  end;


  qrysOpen();
  qryMDFE.Edit;

  ControlarBotoes(True);
end;

procedure TfrmManifestoDestinatario.tbGravarClick(Sender: TObject);
begin
  SalvarDadosMDFe();
  ControlarBotoes(false);
end;

procedure TfrmManifestoDestinatario.tbProximoClick(Sender: TObject);
begin
  qryBusca.Next;
end;

procedure TfrmManifestoDestinatario.ToolButton10Click(Sender: TObject);
begin
  if frmManifestoDestinatario.qryBusca.IsEmpty then
  begin
    Exit
  end else
  begin

    Application.CreateForm(TfrmRelatorioDAMDFE, frmRelatorioDAMDFE);
    frmRelatorioDAMDFE.qryRelatorioMDFE.Close;
    frmRelatorioDAMDFE.qryRelatorioMDFE.ParamByName('MDFE_ID').AsInteger:= qryMDFEMDFE_ID.AsInteger;
    frmRelatorioDAMDFE.qryRelatorioMDFE.Open;
   frmRelatorioDAMDFE.RLReport1.PreviewModal;
  end;

end;

procedure TfrmManifestoDestinatario.PreencherGridDOCS();
begin
  with qryGridDocumentos do
  begin
    Append;
    FieldByName('CIDADE_CARREGAMENTO').AsString    := edtCidadeCarregamento.Text;
    FieldByName('CIDADE_DESCARREGAMENTO').AsString := edtCidadeDescarregamento.Text;
    FieldByName('CHAVE').AsString                  := edtchave.Text;
    FieldByName('UF_C').AsString                   := edtUFCarregamento.Text;
    FieldByName('UF_D').AsString                   := edtUFDescarregamento.Text;
    FieldByName('IBGE_C').AsString                 := edtCodIBGECarregamento.Text;
    FieldByName('IBGE_D').AsString                 := edtCodIBGEDescarregamento.Text;
    FieldByName('PESO').AsFloat                    := StrToFloat(edtPeso.Text);
    FieldByName('VALOR').AsFloat                   := StrToFloat(edtValor.Text);
    Post;
  end;
end;

procedure TfrmManifestoDestinatario.validacaoParaGravar();
begin

end;


procedure TfrmManifestoDestinatario.btnGerarMDFeClick(Sender: TObject);
begin

  //validacaoParaGravar();
  if (qryMDFE_CONDUTORES.IsEmpty) then
  begin
    MessageDlg('Aviso', 'Campo ' + Label47.Caption + ' está vazio, preencha para gravar.', mtConfirmation, [mbOK], 0);
    dbeCPF.SetFocus;
    Exit;
  end;

  if (edtserie.Text = '' ) then
  begin
    MessageDlg('Aviso', 'Campo ' + Label25.Caption + ' está vazio, preencha para gravar.', mtConfirmation, [mbOK], 0);
    edtserie.SetFocus;
    Exit;
  end;

  if (lcbUFC.Text = '' ) then
  begin
    MessageDlg('Aviso', 'Campo ' + Label34.Caption + ' está vazio, preencha para gravar.', mtConfirmation, [mbOK], 0);
    lcbUFC.SetFocus;
    Exit;
  end;

  if (edtPlaca.Text = '' ) then
  begin
    MessageDlg('Aviso', 'Campo ' + Label39.Caption + ' está vazio, preencha para gravar.', mtConfirmation, [mbOK], 0);
    edtPlaca.SetFocus;
    Exit;
  end;

  NF_SERIE();
  MDFE();
  MDFE_CONDUTORES();
  MDFE_EVENTOS();
  MDFE_LOCALCARGA();
  MDFE_LOCALCARGA_DOCS();
  MDFE_PERCURSO();
  MDFE_VEICULOS();

  GerarDadosMDFe();

  {+}PageControl2.ActivePage := tsdados;
  {+}PageControl2.Pages[1].TabVisible := false;
  {+}ControlarBotoes(False);

  {+}qryBusca.Close;
  {+}qryBusca.SQL.Text := select;
  {+}qryBusca.SQL.Add(' and m.numero_doc = :numero_doc and m.mdfe_id =:mdfe_ifc');
  {+}qryBusca.ParamByName('numero_doc').AsInteger:= qryMDFENUMERO_DOC.AsInteger;
  {+}qryBusca.ParamByName('mdfe_ifc').AsInteger:= qryMDFEMDFE_ID.AsInteger;
  {+}qryBusca.Open;
end;

procedure TfrmManifestoDestinatario.NF_SERIE();
begin
  //NF_SERIE
  with qryNF_SERIE do
  begin
    Close;
    ParamByName('nf_serie').AsString   := edtserie.Text;
    ParamByName('NF_EMPRESA').AsInteger:= DM.empresaSelecionada;
    Open;

    Edit;
    FieldByName('NF_ULT_NUMERO').AsInteger := FieldByName('NF_ULT_NUMERO').AsInteger + 1;
    Post;
  end;
end;

procedure TfrmManifestoDestinatario.MDFE();
begin
//MDFE
  with qryMDFE do
  begin
    Edit;
    if ((FieldByName('MDFE_ID').AsInteger) <= 0) then
    begin
      DM.qryGerador.Close;
      DM.qryGerador.SQL.Text := 'select gen_id (gen_nf_cod, 1) as gerador from rdb$database';
      DM.qryGerador.Open;
      FieldByName('MDFE_ID').AsInteger := DM.qryGerador.FieldByName('gerador').AsInteger;
      geradorMDFE_ID :=  FieldByName('MDFE_ID').AsInteger;
    end;

    FieldByName('MODELO_DOC').AsInteger        := (58);
    FieldByName('STATUS_MDFE').AsString        := 'D';
    FieldByName('UND_MEDIDA').AsInteger        := 1;
    FieldByName('TOT_CTE').AsInteger           := 0;
    FieldByName('TOT_NFE').AsInteger           := qryGridDocumentos.RecordCount; //totalizador;
    FieldByName('TOT_NF1_NF1A').AsInteger      := 0;
    FieldByName('DATA_EMISSAO').AsDateTime     := now;
    FieldByName('HORA_EMISSAO').AsDateTime     := now;
    FieldByName('NF_EMPRESA').AsInteger        := dm.empresaSelecionada;
    FieldByName('NUMERO_DOC').AsInteger        := qryNF_SERIENF_ULT_NUMERO.AsInteger;
    FieldByName('SERIE_DOC').AsInteger         := qryNF_SERIENF_SERIE.AsInteger;
    FieldByName('UF_DESCARREGAMENTO').AsString := qryGridDocumentos.FieldByName('UF_D').AsString;
    FieldByName('TOT_PESO').AsFloat            := qryMDFE_LOCALCARGA_DOCS.FieldByName('MDD_PESO').AsFloat;
    FieldByName('TOT_MERCADORIAS').AsFloat     := qryMDFE_LOCALCARGA_DOCS.FieldByName('MDD_VALOR').AsFloat;
 {+}FieldByName('TIPO_EMITENTE').AsFloat       := lcbEmitente.KeyValue;
 {+}Fieldbyname('MODALIDADE').AsFloat          := lcbModalidade.KeyValue;
 {+}Post;
end;
end;

procedure TfrmManifestoDestinatario.MDFE_CONDUTORES();
begin
  //MDFE_CONDUTORES
  with qryMDFE_CONDUTORES do
  begin
    First;
    while not EOF do
    begin
      if not FieldByName('ID_ITEM').AsInteger <= 0 then
      begin
        dm.qryGerador.Close;
        dm.qryGerador.SQL.Text := 'select gen_id (gen_mdfe_condutores, 1) as gerador from rdb$database';
        dm.qryGerador.Open;
        Edit;
        FieldByName('ID_ITEM').AsInteger := dm.qryGerador.FieldByName('gerador').AsInteger;
        geradorID_ITEM := FieldByName('ID_ITEM').AsInteger;
      end;

      Edit;
      FieldByName('MDFE_ID').AsInteger := geradorMDFE_ID;
      Post;
      Next;
    end;
  end;
end;

procedure TfrmManifestoDestinatario.MDFE_EVENTOS();
begin
  //MDFE_EVENTOS
  with qryMDFE_EVENTOS do
  begin
    Edit;
    FieldByName('MDFE_ID').AsInteger      := geradorMDFE_ID;
    FieldByName('USR_COD').AsInteger      := DM.usuarioLogado;
    FieldByName('MDFE_COD_TP').AsInteger  := 99;
    FieldByName('MDFE_SEQ').AsInteger     := 0;
    FieldByName('MDFE_LOTE').AsInteger    := (qryMDFE_EVENTOSMDFE_LOTE.AsInteger + 1);
    FieldByName('PERFIL_ID').AsInteger    := StrToInt(BuscarRegistro('UCCADUSER', 'IDUSER', 'PERFIL', DM.usuarioLogado));
    FieldByName('MDFE_CORRECAO').AsString := 'AUTORIZACAO DO DOCUMENTO';
 {+}Post;
  end;
end;

procedure TfrmManifestoDestinatario.MDFE_LOCALCARGA();
var Extra_mdc: integer;
begin

  {+ MDFE_LOCALCARGA}
  qryGridDocumentos.First;
  while not qryGridDocumentos.EOF do
  begin

    {+ CARREGAMENTO}
    if not qryMDFE_LOCALCARGA.Locate('MDC_CIDADE; MDC_TIPO', VarArrayOf([qryGridDocumentosCIDADE_CARREGAMENTO.AsString,'C']),[]) then
    with qryMDFE_LOCALCARGA do
    begin
        Append;
        FieldByName('MDC_ID').AsInteger           := GetSequencia('gen_mdc_id');
        FieldByName('MDC_TIPO').AsString          := 'C';
        FieldByName('MDFE_ID').AsInteger          := geradorMDFE_ID;
        FieldByName('MDC_CIDADE_IBGE').AsString   := qryGridDocumentosIBGE_C.AsString;
        FieldByName('MDC_CIDADE').AsString        := qryGridDocumentosCIDADE_CARREGAMENTO.AsString;
        FieldByName('MDC_UF').AsString            := qryGridDocumentosUF_C.AsString;
        Post;
    end;

    {+ DESCARREGAMENTO}
    if not qryMDFE_LOCALCARGA.Locate('MDC_CIDADE; MDC_TIPO', VarArrayOf([qryGridDocumentosCIDADE_DESCARREGAMENTO.AsString,'D']),[]) then
    begin
      with qryMDFE_LOCALCARGA do
      begin
          Append;
          FieldByName('MDC_ID').AsInteger           := GetSequencia('gen_mdc_id');;
          FieldByName('MDC_TIPO').AsString          := 'D';
          FieldByName('MDFE_ID').AsInteger          := geradorMDFE_ID;
          FieldByName('MDC_CIDADE_IBGE').AsString   := qryGridDocumentosIBGE_D.AsString;
          FieldByName('MDC_CIDADE').AsString        := qryGridDocumentosCIDADE_DESCARREGAMENTO.AsString;
          FieldByName('MDC_UF').AsString            := qryGridDocumentosUF_D.AsString;
          Post;
      end;
    end;

    {+ MDFE LOCAL CARGA DOCS}
    {+ PARA LOCAL ÚNICO, TENDO ASSIM SEU PRÓPRIO CÓDIGO MDC_ID}
    if not qryMDFE_LOCALCARGA.Locate('MDC_CIDADE; MDC_TIPO', VarArrayOf([qryGridDocumentosCIDADE_DESCARREGAMENTO.AsString,'D']),[]) then
    begin
       with qryMDFE_LOCALCARGA_DOCS do
       begin
          Append;
          FieldByName('MDD_CHAVE').AsString         := qryGridDocumentosCHAVE.AsString;
          FieldByName('MDD_PESO').AsFloat           := qryGridDocumentosPESO.AsFloat;
          FieldByName('MDD_VALOR').AsFloat          := qryGridDocumentosVALOR.AsFloat;
          FieldByName('MDD_SEG_COD_BARRA').AsString := '';
          FieldByName('MDC_ID').AsInteger           := qryMDFE_LOCALCARGA.FieldByName('MDC_ID').AsInteger;
          FieldByName('MDFE_ID').AsInteger          := geradorMDFE_ID;
          FieldByName('MDD_MODELO').AsString        := '55';
          Post;
       end;
     end;

    {+ PARA LOCAL REPETIDO, NECESSITANDO DA REPLICAÇÃO DO CÓDIGO MDC_ID}
    if not qryMDFE_LOCALCARGA_DOCS.Locate('MDD_CHAVE', VarArrayOf([qryGridDocumentosCHAVE.AsString]),[]) then
    begin
      if qryMDFE_LOCALCARGA.Locate('MDC_CIDADE; MDC_TIPO', VarArrayOf([qryGridDocumentosCIDADE_DESCARREGAMENTO.AsString,'D']),[]) then
      with qryMDFE_LOCALCARGA_DOCS do
      begin
        Append;
        FieldByName('MDD_CHAVE').AsString         := qryGridDocumentosCHAVE.AsString;
        FieldByName('MDD_PESO').AsFloat           := qryGridDocumentosPESO.AsFloat;
        FieldByName('MDD_VALOR').AsFloat          := qryGridDocumentosVALOR.AsFloat;
        FieldByName('MDD_SEG_COD_BARRA').AsString := '';
        FieldByName('MDC_ID').AsInteger           := qryMDFE_LOCALCARGA.FieldByName('MDC_ID').AsInteger;
        FieldByName('MDFE_ID').AsInteger          := geradorMDFE_ID;
        FieldByName('MDD_MODELO').AsString        := '55';
        Post;
      end;
    end;

   qryGridDocumentos.Next;
  end;
end;

procedure TfrmManifestoDestinatario.MDFE_LOCALCARGA_DOCS();
begin

end;

procedure TfrmManifestoDestinatario.MDFE_VEICULOS();
begin

  {+ MDFE_VEICULOS}
  if not qryMDFE_VEICULOS.IsEmpty then

  {+ TRAÇÃO}
  with qryMDFE_VEICULOS do
    begin
      Edit;
      if FieldByName('MDV_ID').AsInteger <= 0 then
       begin
         dm.qryGerador.Close;
         dm.qryGerador.SQL.Text:= 'select gen_id (gen_mdv_id, 1) as gerador from rdb$database';
         dm.qryGerador.Open;
         FieldByName('MDV_ID').AsInteger := dm.qryGerador.FieldByName('gerador').AsInteger;
       end;

      if checkProprietario.Checked = True then
      FieldByName('MDV_PROP_DEFINIDO').AsString := 'N';
      FieldByName('MDV_TIPO').AsString  := 'T';
      FieldByName('MDFE_ID').AsInteger  := geradorMDFE_ID;
      FieldByName('MDV_PLACA').AsString := edtPlaca.Text;
      FieldByName('MDV_UF').AsString    := edtUf.Text;
      post;
    end;

  {+ MDFE_VEICULOS}
  if not qryREBOQUES.IsEmpty then

  {+ REBOQUES}
  qryREBOQUES.First;
     while not qryREBOQUES.EOF do
     begin
       qryREBOQUES.Edit;
       if qryREBOQUESMDV_ID.AsInteger <= 0 then
       begin
         dm.qryGerador.Close;
         dm.qryGerador.SQL.Text:= 'select gen_id (gen_mdv_id, 1) as geradorR from rdb$database';
         dm.qryGerador.Open;
         qryREBOQUES.FieldByName('MDV_ID').AsInteger   := dm.qryGerador.FieldByName('geradorR').AsInteger;
       end;

        qryREBOQUES.FieldByName('MDFE_ID').AsInteger  := geradorMDFE_ID;
        qryREBOQUES.Post;

        qryREBOQUES.Next;
     end;
end;

procedure TfrmManifestoDestinatario.MDFE_PERCURSO();
var contador: Integer;
begin

  //MDFE_PERCURSO
  contador := 1;

  with qryMDFE_PERCURSO do
  begin
    First;
    while not EOF do
    begin
      Edit;
      FieldByName('MDFE_ID').AsInteger  := geradorMDFE_ID;
      FieldByName('MPE_ID').AsInteger   := contador;
      Post;
      inc(contador);
      Next;
    end;
  end;
end;

procedure TfrmManifestoDestinatario.GerarDadosMDFe();
begin
  //gravar no Banco de Dados

  try
    if qryNF_SERIE.State in dsEditModes then
      qryNF_SERIE.Post;
     qryNF_SERIE.ApplyUpdates(0);

    if qryMDFE.State in dsEditModes then
       qryMDFE.Post;
     qryMDFE.ApplyUpdates(0);

    if qryMDFE_PERCURSO.State in dsEditModes then
      qryMDFE_PERCURSO.Post;
     qryMDFE_PERCURSO.ApplyUpdates(0);

    if qryMDFE_EVENTOS.State in dsEditModes then
      qryMDFE_EVENTOS.Post;
     qryMDFE_EVENTOS.ApplyUpdates(0);

    if qryMDFE_LOCALCARGA.State in dsEditModes then
      qryMDFE_LOCALCARGA.Post;
     qryMDFE_LOCALCARGA.ApplyUpdates(0);

    if qryMDFE_LOCALCARGA_DOCS.State in dsEditModes then
      qryMDFE_LOCALCARGA_DOCS.Post;
     qryMDFE_LOCALCARGA_DOCS.ApplyUpdates(0);

    if qryMDFE_VEICULOS.State in dsEditModes then
      qryMDFE_VEICULOS.Post;
     qryMDFE_VEICULOS.ApplyUpdates(0);

 {+}if qryREBOQUES.State in dsEditModes then
    {+}qryREBOQUES.Post;
    {+}qryREBOQUES.ApplyUpdates(0);

    if qryMDFE_CONDUTORES.State in dsEditModes then
      qryMDFE_CONDUTORES.Post;
     qryMDFE_CONDUTORES.ApplyUpdates(0);

    qryMDFE.SQLTransaction.CommitRetaining;

  Except
    qryMDFE.SQLTransaction.RollbackRetaining;
    MessageDlg('', 'Erro ao Gravar Dados', mtError,[mbOK], 1);
    Exit;
    end;

   MessageDlg('Informação', ' MDF-e gerado com sucesso', mtInformation,[mbOK], 1);
end;

procedure TfrmManifestoDestinatario.SalvarDadosMDFe();
begin

  try
    if qryMDFE.State in dsEditModes then
       qryMDFE.Post;
       qryMDFE.ApplyUpdates(0);

    if qryREBOQUES.State in dsEditModes then
       qryREBOQUES.Post;
       qryREBOQUES.ApplyUpdates(0);

    if qryMDFE_CONDUTORES.State in dsEditModes then
       qryMDFE_CONDUTORES.Post;
       qryMDFE_CONDUTORES.ApplyUpdates(0);

    if qryMDFE_VEICULOS.State in dsEditModes then
       qryMDFE_VEICULOS.Post;
       qryMDFE_VEICULOS.ApplyUpdates(0);

    if qryMDFE_LOCALCARGA.State in dsEditModes then
       qryMDFE_LOCALCARGA.Post;
       qryMDFE_LOCALCARGA.ApplyUpdates(0);

    if qryMDFE_PERCURSO.State in dsEditModes then
       qryMDFE_PERCURSO.Post;
       qryMDFE_PERCURSO.ApplyUpdates(0);

      qryMDFE.SQLTransaction.CommitRetaining;

  Except
    qryMDFE.SQLTransaction.RollbackRetaining;
    MessageDlg('', 'Erro ao Gravar Dados', mtError,[mbOK], 1);
    Exit;
    end;

   MessageDlg('Informação', ' Gravado com sucesso', mtInformation,[mbOK], 1);
   ControlarBotoes(false);
end;

procedure TfrmManifestoDestinatario.qrysClose();
begin
  qryMDFE.Close;
  qryNF_SERIE.Close;
  qryMDFE_EVENTOS.Close;
  qryMDFE_PERCURSO.Close;
  qryMDFE_VEICULOS.Close;
  qryMDFE_CONDUTORES.Close;
  qryMDFE_LOCALCARGA.Close;
  qryMDFE_LOCALCARGA_DOCS.Close;
  qryREBOQUES.Close;
  qryDados.Close;
  qryBusca.Close;
  qryTipoRodado.Close;
  qryTipoCarroceria.Close;
  qryUFCarregamento.Close;
  qryModalidade.Close;
  qryFormaEmissao.Close;
  qryTipoRodado.Close;
  qryTipoTransportador.Close;
  qryTipoEmitente.Close;
  qryTipoProprietario.Close;
  qryGridDocumentos.Close;
  qryBuscaCarregamento.Close;
  qryDOCUMENTOS.Close;
end;

procedure TfrmManifestoDestinatario.qrysOpen();
begin
  qryMDFE.Open;
  qryNF_SERIE.Open;
  qryMDFE_EVENTOS.Open;
  qryMDFE_PERCURSO.Open;
  qryMDFE_VEICULOS.Open;
  qryMDFE_CONDUTORES.Open;
  qryMDFE_LOCALCARGA.Open;
  qryMDFE_LOCALCARGA_DOCS.Open;
  qryREBOQUES.Open;
  qryDados.Open;
  qryBusca.Open;
  qryTipoRodado.Open;
  qryTipoCarroceria.Open;
  qryUFCarregamento.Open;
  qryModalidade.Open;
  qryFormaEmissao.Open;
  qryTipoTransportador.Open;
  qryTipoEmitente.Open;
  qryTipoProprietario.Open;
  qryGridDocumentos.Open;
  qryBuscaCarregamento.Open;
  qryDOCUMENTOS.Open;
end;

procedure TfrmManifestoDestinatario.qrysEdit();
begin
  qryMDFE.Edit;
  qryNF_SERIE.Edit;
  qryREBOQUES.Edit;
  qryMDFE_EVENTOS.Edit;
  qryMDFE_VEICULOS.Edit;
  qryMDFE_CONDUTORES.Edit;
  qryMDFE_LOCALCARGA.Edit;
  qryMDFE_LOCALCARGA_DOCS.Edit;
  qryBusca.Edit;
  qryUFCarregamento.Edit;
  qryGridDocumentos.Edit;
  qryBuscaCarregamento.Edit;
  qryDOCUMENTOS.Edit;
end;

procedure TfrmManifestoDestinatario.btnAddDocsClick(Sender: TObject);
var contador: Integer;
begin
  if (edtchave.Text = '' ) then
  begin
    MessageDlg(' Aviso ', ' Chave do Documento' + ' está vazio, preencha para Incluir.', mtConfirmation, [mbOK], 0);
    edtchave.SetFocus;
    Exit;
  end;

  if (Length(edtchave.Text) <> 44)  then
  begin
    MessageDlg('Aviso', ' Chave do Documento' + ' deve possuir 44 dígitos.', mtConfirmation, [mbOK], 0);
    edtchave.SetFocus;
    Exit;
  end;

  if edtCodIBGECarregamento.Text = edtCodIBGEDescarregamento.Text then
  begin
    MensagemAtencao('Local do carregamento igual ao local do descarregamento!');
    Exit;
  end;

  if edtCidadeCarregamento.Text = edtCidadeDescarregamento.Text then
  Begin
    MensagemAtencao('Local do Carregamento igual ao local do Descarregamento');
    Exit;
  end;

  if (edtPeso.Text = '') or (edtValor.Text = '') then
  begin
    edtPeso.Text := '0';
    edtValor.Text:= '0';
  end;

  if qryGridDocumentos.RecordCount >= 100 then
    Exit;

  if qryGridDocumentos.Locate('CHAVE', edtchave.Text, []) then
  begin
    ShowMessage('Este Registro já foi incluido na lista!');
    Exit;
  end;

  PreencherGridDOCS();

  {+}edtchave.Clear;
  {+}edtValor.Clear;
  {+}edtPeso.Clear;
end;

procedure TfrmManifestoDestinatario.SpeedButton4Click(Sender: TObject);
begin
  if qryGridDocumentos.IsEmpty = true then
  begin
    exit;
  end else
  begin
    qryGridDocumentos.Delete;
  end;
end;

procedure TfrmManifestoDestinatario.btnSairdaPaginaClick(Sender: TObject);
begin
  PageControl2.Pages[1].TabVisible := False;
  PageControl2.ActivePage := tsdados;

  ControlarBotoes(False);
end;

procedure TfrmManifestoDestinatario.Button4Click(Sender: TObject);
begin
  qryBusca.Close;
  qryBusca.SQL.Text := select;
  qryBusca.SQL.Add(' and m.numero_doc = :numero_doc');
  qryBusca.ParamByName('numero_doc').AsInteger:= StrToInt(edtBusca.Text);
  qryBusca.Open;
end;

procedure TfrmManifestoDestinatario.cbEstadoKeyPress(Sender: TObject;
  var Key: char);
begin
  if key = #13 then
  SpeedButton3.Click;
end;

procedure TfrmManifestoDestinatario.checkProprietario1Change(Sender: TObject);
begin

end;

procedure TfrmManifestoDestinatario.checkProprietario1Click(Sender: TObject);
begin
end;

procedure TfrmManifestoDestinatario.checkProprietarioClick(Sender: TObject);
begin
  if checkProprietario.Checked then
  begin
   ControlarEditProprietario(True);
  end else
    ControlarEditProprietario(False);
end;

procedure TfrmManifestoDestinatario.dbeCPFExit(Sender: TObject);
begin
  if ValidaCPF (ApenasNumeros(dbeCPF.text)) then
  begin
    dbeNome.SetFocus;
  end
  else
    ShowMessage('CPF '+ dbeCPF.text+ ' Inválido')
end;

procedure TfrmManifestoDestinatario.dbeCPFKeyPress(Sender: TObject;
  var Key: char);
begin
  if key = #13 then
  begin
    if ValidaCPF (ApenasNumeros(dbeCPF.text)) then
    begin
      dbeNome.SetFocus;
    end
    else
      ShowMessage('CPF '+ dbeCPF.text+ ' Inválido')
  end;
end;

procedure TfrmManifestoDestinatario.DBEdit38Change(Sender: TObject);
begin
  DBEdit38.Text     := Edicao(DBEdit38.Text,'99:99:99');
  DBEdit38.SelStart := Length(DBEdit38.Text);
end;

procedure TfrmManifestoDestinatario.DBEdit38KeyPress(Sender: TObject;
  var Key: char);
begin
  if key = #13 then
  lcbUFC.SetFocus;
end;

procedure TfrmManifestoDestinatario.DBEdit42KeyPress(Sender: TObject;
  var Key: char);
begin
  if key = #13 then
    DBEdit48.SetFocus;
end;

procedure TfrmManifestoDestinatario.DBEdit43KeyPress(Sender: TObject;
  var Key: char);
begin
  if key = #13 then
  DBEdit50.SetFocus;
end;

procedure TfrmManifestoDestinatario.DBEdit44KeyPress(Sender: TObject;
  var Key: char);
begin
  if key = #13 then
  begin
    DBEdit45.SetFocus;
  end;
end;

procedure TfrmManifestoDestinatario.DBEdit45KeyPress(Sender: TObject;
  var Key: char);
begin
  if key = #13 then
  begin
    DBEdit46.SetFocus;
  end;
end;

procedure TfrmManifestoDestinatario.DBEdit47KeyPress(Sender: TObject;
  var Key: char);
begin
  if key = #13 then
  edtchave.SetFocus;
end;

procedure TfrmManifestoDestinatario.DBEdit48KeyPress(Sender: TObject;
  var Key: char);
begin
  if key = #13 then
    DBEdit49.SetFocus;
end;

procedure TfrmManifestoDestinatario.DBEdit49KeyPress(Sender: TObject;
  var Key: char);
begin
  if key = #13 then
  DBEdit43.SetFocus;
end;

procedure TfrmManifestoDestinatario.DBEdit50KeyPress(Sender: TObject;
  var Key: char);
begin
  if key = #13 then
end;

procedure TfrmManifestoDestinatario.dbeNomeKeyPress(Sender: TObject;
  var Key: char);
begin
  if key = #13 then
  SpeedButton9.Click;
end;

procedure TfrmManifestoDestinatario.edtchaveKeyPress(Sender: TObject;
  var Key: char);
begin
  if key = #13 then
  edtValor.SetFocus;
end;

procedure TfrmManifestoDestinatario.edtValorKeyPress(Sender: TObject;
  var Key: char);
begin
  if key = #13 then
  edtPeso.SetFocus;
end;

function TfrmManifestoDestinatario.ValidaCPF(num: string): boolean;
var
  n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
  d1,d2: integer;
  digitado, calculado: string;
begin
  if (Length(num)<>11) then
  begin
    Result:=False;
  end
  else
  begin
    n1:= StrToInt(num[1]);
    n2:= StrToInt(num[2]);
    n3:= StrToInt(num[3]);
    n4:= StrToInt(num[4]);
    n5:= StrToInt(num[5]);
    n6:= StrToInt(num[6]);
    n7:= StrToInt(num[7]);
    n8:= StrToInt(num[8]);
    n9:= StrToInt(num[9]);
    d1:= n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
    d1:=11-(d1 mod 11);
    if d1>=10 then d1:=0;
      d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
      d2:=11-(d2 mod 11);
    if d2>=10 then d2:=0;
      calculado:= inttostr(d1)+inttostr(d2);
      digitado:=num[10]+num[11];
    if calculado=digitado then
      Result :=true
    else
    Result :=false;
  end;
end;

function TfrmManifestoDestinatario.ApenasNumeros(const Texto: String): String;
var
  I: integer;
  S: string;
begin
  s :='';
  for I:= 1 To length(texto) Do
  begin
    if (Texto[I] in ['0'..'9']) then

    S := s + copy(texto, I, 1);
  end;
  result := s;
end;

procedure TfrmManifestoDestinatario.ControlarBotoes(EmEdicao: Boolean);
begin
  tbIncluir.Enabled  := not EmEdicao;
  tbModificar.Enabled:= not EmEdicao;
  tbCancelar.Enabled := EmEdicao;
  tbAnterior.Enabled := EmEdicao;
  tbProximo.Enabled  := EmEdicao;
  tbGravar.Enabled   := EmEdicao;
end;

procedure TfrmManifestoDestinatario.ControlarEditProprietario(EmEdicao: Boolean
  );
begin
  DBEdit42.Enabled:= EmEdicao;
  DBEdit43.Enabled:= EmEdicao;
  DBEdit48.Enabled:= EmEdicao;
  DBEdit49.Enabled:= EmEdicao;
  DBEdit50.Enabled:= EmEdicao;
  DBEdit47.Enabled:= EmEdicao;
  DBLookupComboBox8.Enabled:= EmEdicao;
end;

procedure TfrmManifestoDestinatario.limparquerys();
begin
  with qryMDFE do
  begin
   close;
   ParamByName('MDFE_ID').AsInteger:= -1;
   open;
  end;

  with qryMDFE_VEICULOS do
  begin
    close;
    ParamByName('MDFE_ID').AsInteger:= -1;
    open;
  end;

  with qryMDFE_PERCURSO do
  begin
    close;
    ParamByName('MDFE_ID').AsInteger:= -1;
    open;
  end;

  with qryMDFE_CONDUTORES do
  begin
    close;
    ParamByName('MDFE_ID').AsInteger:= -1;
    open;
  end;

  with qryBuscaCarregamento do
  begin
    Close;
    ParamByName('mdfe_id').AsInteger:= -1;
    Open;
  end;

  with qryREBOQUES do {+}
   begin
     Close;
     ParamByName('mdfe_id').AsInteger:= -1;
     Open;
   end;

   with qryDOCUMENTOS do {+}
  begin
   Close;
    ParamByName('mdfe_id').AsInteger:= -1;
   Open;
  end;

  with qryGridDocumentos do {+}
  begin
    Close;
    IsEmpty;
    Open;
  end;

  {+}edtchave.Clear;
  {+}edtBusca.Clear;

  {+}edtCodIBGECarregamento.Clear;
  {+}edtCodIBGEDescarregamento.Clear;

  {+}edtValor.Clear;
  {+}edtPeso.Clear;

  {+}edtCidadeCarregamento.Clear;
  {+}edtCidadeDescarregamento.Clear;

  {+}edtUFCarregamento.Clear;
  {+}edtUFDescarregamento.Clear;

end;

function TfrmManifestoDestinatario.Edicao(EDIT: String; STRI: String): string;
var i : integer;
begin
  for i := 1 to Length(EDIT) do
  begin
    if (STRI[i] = '9')
    and not (EDIT[i] in ['0'..'9'])
      and (Length(EDIT)=Length(STRI)+1) then
        delete(EDIT,i,1);
    if (STRI[i] <> '9')
    and (EDIT[i] in ['0'..'9']) then
        insert(STRI[i],EDIT, i);
  end;
  result := EDIT;
end;

end.

