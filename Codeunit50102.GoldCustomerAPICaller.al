codeunit 50102 "Gold Customer API Caller"
{
    procedure SyncFromApi(): Integer
    var
        GoldCustomerLog: Record "Gold Customer Log";
        Client: HttpClient;
        Response: HttpResponseMessage;
        CompanyGuid: Text;
        GoldCustomerCount: Integer;
        BaseUrl: Text;
        UserName: Text;
        Password: Text;
    begin
        BaseUrl := 'http://localhost:7248/BC270API/api/mk/goldCustomer/v1.0';
        UserName := 'MKAPI';
        Password := '<MKAPI_PASSWORD>'; // TODO: replace before running, remove before commit
        //Password := 'XXXXXX'; // TODO: replace before running, remove before commit

        Client.DefaultRequestHeaders().Add('Authorization', GetBasicAuthHeader(UserName, Password));

        // Step 1 — get the company GUID dynamically
        if not Client.Get(BaseUrl + '/companies', Response) then
            Error('Failed to call companies endpoint — check BC270API is running.');

        if not Response.IsSuccessStatusCode() then
            Error('Companies call returned status %1', Response.HttpStatusCode());

        CompanyGuid := ExtractFirstCompanyGuid(Response);

        // Step 2 — call goldCustomers for that company
        Clear(Response);
        if not Client.Get(BaseUrl + '/companies(' + CompanyGuid + ')/goldCustomers', Response) then
            Error('Failed to call goldCustomers endpoint.');

        if not Response.IsSuccessStatusCode() then
            Error('goldCustomers call returned status %1', Response.HttpStatusCode());

        GoldCustomerCount := CountGoldCustomers(Response);

        // Step 3 — log the result (AutoIncrement handles Entry No., matches existing pattern)
        GoldCustomerLog.Init();
        GoldCustomerLog."Customer No." := '';
        GoldCustomerLog."Customer Name" := StrSubstNo('API Sync — %1 Gold Customers retrieved', GoldCustomerCount);
        GoldCustomerLog."Posting Date" := Today();
        GoldCustomerLog."Sales Order No." := '';
        GoldCustomerLog.Insert(true);

        exit(GoldCustomerCount);
    end;

    local procedure GetBasicAuthHeader(UserName: Text; Password: Text): Text
    var
        Base64Convert: Codeunit "Base64 Convert";
        Credentials: Text;
    begin
        Credentials := UserName + ':' + Password;
        exit('Basic ' + Base64Convert.ToBase64(Credentials));
    end;

    local procedure ExtractFirstCompanyGuid(var Response: HttpResponseMessage): Text
    var
        ResponseText: Text;
        JObject: JsonObject;
        JToken: JsonToken;
        ValueArray: JsonArray;
        FirstCompany: JsonToken;
        IdToken: JsonToken;
    begin
        Response.Content().ReadAs(ResponseText);
        JObject.ReadFrom(ResponseText);

        if not JObject.Get('value', JToken) then
            Error('Unexpected response — no "value" array in companies response.');

        ValueArray := JToken.AsArray();
        if ValueArray.Count() = 0 then
            Error('No companies returned from companies endpoint.');

        ValueArray.Get(0, FirstCompany);
        if not FirstCompany.AsObject().Get('id', IdToken) then
            Error('Unexpected response — no "id" field on company.');

        exit(IdToken.AsValue().AsText());
    end;

    local procedure CountGoldCustomers(var Response: HttpResponseMessage): Integer
    var
        ResponseText: Text;
        JObject: JsonObject;
        JToken: JsonToken;
        ValueArray: JsonArray;
    begin
        Response.Content().ReadAs(ResponseText);
        JObject.ReadFrom(ResponseText);

        if not JObject.Get('value', JToken) then
            exit(0);

        ValueArray := JToken.AsArray();
        exit(ValueArray.Count());
    end;
}