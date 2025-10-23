<aside>
    <p>Assetmanagement</p>
    <i>&gt;</i>
    <p>Systeme</p>
    <i>&gt;</i>
    <p>Neues System anlegen</p>
</aside>


<form id="newSystemForm">

    <!-- Basis Informationen -->
    <div class="form-section">
        <div class="section-title">
            <span>Basis-Informationen</span>
            <span class="section-badge">Pflicht</span>
        </div>
        <div class="form-group">
            <label>Systemname <span class="required">*</span></label>
            <input type="text" id="systemName" required placeholder="z.B. KIS-Produktiv, Radiologie-PACS">
            <div class="help-text">Eindeutiger Name zur Identifikation des Systems</div>
        </div>
    </div>

    <!-- Software-Informationen -->
    <div class="form-section">
        <div class="section-title">
            <span>Software-Informationen</span>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label>Software / Produkt</label>
                <input type="text" id="software" placeholder="z.B. SAP ERP, Orbis KIS">
            </div>
            <div class="form-group">
                <label>Hersteller</label>
                <input type="text" id="vendor" placeholder="z.B. Dedalus, Siemens">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label>Version</label>
                <input type="text" id="version" placeholder="z.B. 2024.1">
            </div>
            <div class="form-group">
                <label>Lizenztyp</label>
                <select id="licenseType">
                    <option value="">Bitte wählen</option>
                    <option value="commercial">Kommerziell</option>
                    <option value="subscription">Subscription</option>
                    <option value="opensource">Open Source</option>
                    <option value="inhouse">Eigenentwicklung</option>
                </select>
            </div>
        </div>
    </div>


</form>