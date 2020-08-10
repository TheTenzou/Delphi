unit ProjectServer_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 5/23/2020 10:43:48 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\FireBird DB\sm\server\ProjectServer.tlb (1)
// LIBID: {838574DC-E533-4517-9137-56E72D027EB8}
// LCID: 0
// Helpfile: 
// HelpString: ProjectServer Library
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINDOWS\SysWOW64\midas.dll)
//   (2) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, Midas, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ProjectServerMajorVersion = 1;
  ProjectServerMinorVersion = 0;

  LIBID_ProjectServer: TGUID = '{838574DC-E533-4517-9137-56E72D027EB8}';

  IID_IServerSm: TGUID = '{4D199CC8-FE47-4F43-B6CA-980DFDF70790}';
  CLASS_ServerSm: TGUID = '{395C28C9-93C2-484E-912C-B2BE42CDA2FA}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IServerSm = interface;
  IServerSmDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ServerSm = IServerSm;


// *********************************************************************//
// Interface: IServerSm
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4D199CC8-FE47-4F43-B6CA-980DFDF70790}
// *********************************************************************//
  IServerSm = interface(IAppServer)
    ['{4D199CC8-FE47-4F43-B6CA-980DFDF70790}']
    procedure AddProvider(id: Integer; const name: WideString; const address: WideString; 
                          const phone: WideString); safecall;
    procedure DeleteProvider(id: Integer); safecall;
    procedure AddProduct(id: Integer; const name: WideString; const mu: WideString); safecall;
    procedure DeleteProduct(id: Integer); safecall;
    procedure AddOrder(id: Integer; providerid: Integer; data: TDateTime; paid: Integer; 
                       totalsumm: Double); safecall;
    procedure DeleteOrder(id: Integer); safecall;
    procedure AddOrderInfo(orderid: Integer; productid: Integer; quantity: Double; price: Double); safecall;
    procedure DeleteOrderInfo(orderid: Integer; productid: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  IServerSmDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4D199CC8-FE47-4F43-B6CA-980DFDF70790}
// *********************************************************************//
  IServerSmDisp = dispinterface
    ['{4D199CC8-FE47-4F43-B6CA-980DFDF70790}']
    procedure AddProvider(id: Integer; const name: WideString; const address: WideString; 
                          const phone: WideString); dispid 301;
    procedure DeleteProvider(id: Integer); dispid 302;
    procedure AddProduct(id: Integer; const name: WideString; const mu: WideString); dispid 303;
    procedure DeleteProduct(id: Integer); dispid 304;
    procedure AddOrder(id: Integer; providerid: Integer; data: TDateTime; paid: Integer; 
                       totalsumm: Double); dispid 305;
    procedure DeleteOrder(id: Integer); dispid 306;
    procedure AddOrderInfo(orderid: Integer; productid: Integer; quantity: Double; price: Double); dispid 307;
    procedure DeleteOrderInfo(orderid: Integer; productid: Integer); dispid 308;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoServerSm provides a Create and CreateRemote method to          
// create instances of the default interface IServerSm exposed by              
// the CoClass ServerSm. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoServerSm = class
    class function Create: IServerSm;
    class function CreateRemote(const MachineName: string): IServerSm;
  end;

implementation

uses ComObj;

class function CoServerSm.Create: IServerSm;
begin
  Result := CreateComObject(CLASS_ServerSm) as IServerSm;
end;

class function CoServerSm.CreateRemote(const MachineName: string): IServerSm;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ServerSm) as IServerSm;
end;

end.
