// This unit is autogenerated. Do not edit it manually.
// Source: http://localhost:8080/datasnap/rest/TDevLoungeDemo/GetAllEmployees/
// Date: 24/06/2025 09:34:05 a. m.

unit uJsonClass;

interface

uses
  System.Classes, REST.Json.Types, System.JSON;

type
  [JsonSerialize(jmAllPubProps)]
  TData_1 = class(TPersistent)
  private
    FEMP_NO: Integer;
    FFIRST_NAME: string;
    FLAST_NAME: string;
    FPHONE_EXT: string;
    FHIRE_DATE: string;
    FDEPT_NO: Integer;
    FJOB_CODE: string;
    FJOB_GRADE: Integer;
    FJOB_COUNTRY: string;
    FSALARY: Double;
    FFULL_NAME: string;
  public
    property EMP_NO: Integer read FEMP_NO write FEMP_NO;
    property FIRST_NAME: string read FFIRST_NAME write FFIRST_NAME;
    property LAST_NAME: string read FLAST_NAME write FLAST_NAME;
    property PHONE_EXT: string read FPHONE_EXT write FPHONE_EXT;
    property HIRE_DATE: string read FHIRE_DATE write FHIRE_DATE;
    property DEPT_NO: Integer read FDEPT_NO write FDEPT_NO;
    property JOB_CODE: string read FJOB_CODE write FJOB_CODE;
    property JOB_GRADE: Integer read FJOB_GRADE write FJOB_GRADE;
    property JOB_COUNTRY: string read FJOB_COUNTRY write FJOB_COUNTRY;
    property SALARY: Double read FSALARY write FSALARY;
    property FULL_NAME: string read FFULL_NAME write FFULL_NAME;
  end;

  [JsonSerialize(jmAllPubProps)]
  TData = class(TPersistent)
  private
    Fcoderror: Integer;
    Fdata: TArray<TData_1>;
    Fdata1: TData_1;
  public
    destructor Destroy; override;
    class function FromJSON(const AValue: TJSONValue): TData; overload; static;
    class function FromJSON(const AValue: string): TData; overload; static;
    class function FromJSON1(const AValue: string): TData_1; overload; static;
    function ToJSONObject: TJSONValue;
    function ToJSONString: string;
    property coderror: Integer read Fcoderror write Fcoderror;
    property data: TArray<TData_1> read Fdata write Fdata;
    property data1: TData_1 read Fdata1 write Fdata1;
  end;

  [JsonSerialize(jmAllPubProps)]
  TDataArray = class(TPersistent)
  private
    FDataset: TArray<TData>;
  public
    destructor Destroy; override;
    class function FromJSON(const AValue: TJSONArray): TDataArray; overload; static;
    class function FromJSON(const AValue: string): TDataArray; overload; static;
    function ToJSONArray: TJSONArray;
    function ToJSONString: string;
    property Dataset: TArray<TData> read FDataset write FDataset;
  end;

implementation

uses
  System.Generics.Collections;

destructor TData.Destroy;
begin
  TArray.FreeValues<TData_1>(Fdata);
  inherited Destroy;
end;

class function TData.FromJSON(const AValue: TJSONValue): TData;
begin
  Result := TJSONMapper<TData>.Default.FromObject(AValue);
end;

class function TData.FromJSON(const AValue: string): TData;
begin
  Result := TJSONMapper<TData>.Default.FromObject(AValue);
end;

class function TData.FromJSON1(const AValue: string): TData_1;
begin
  Result := TJSONMapper<TData_1>.Default.FromObject(AValue);
end;

function TData.ToJSONObject: TJSONValue;
begin
  Result := TJSONMapper<TData>.Default.ToObject(Self);
end;

function TData.ToJSONString: string;
begin
  Result := TJSONMapper<TData>.Default.ToString(Self);
end;

destructor TDataArray.Destroy;
begin
  TArray.FreeValues<TData>(FDataset);
  inherited Destroy;
end;

class function TDataArray.FromJSON(const AValue: TJSONArray): TDataArray;
begin
  var LArr := TJSONMapper<TData>.Default.FromArray(AValue);
  Result := TDataArray.Create;
  Result.Dataset := LArr;
end;

class function TDataArray.FromJSON(const AValue: string): TDataArray;
begin
  var LArr := TJSONMapper<TData>.Default.FromArray(AValue);
  Result := TDataArray.Create;
  Result.Dataset := LArr;
end;

function TDataArray.ToJSONArray: TJSONArray;
begin
  Result := TJSONMapper<TData>.Default.ToArray(Dataset);
end;

function TDataArray.ToJSONString: string;
begin
  Result := TJSONMapper<TData>.Default.ToString(Dataset);
end;

initialization

  RegisterClass(TData_1);
  RegisterClass(TData);
  RegisterClass(TDataArray);

end.
