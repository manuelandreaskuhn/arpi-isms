<div class="entry-content">
    <!-- Basis-Informationen -->
    <div class="subsection-header">Basis-Informationen</div>
    <div class="form-row">
        <div class="form-group">
            <label>Hostname <span class="required">*</span></label>
            <input type="text" name="hostname" class="hw-field" placeholder="z.B. srv-db-prod-01" required>
        </div>
        <div class="form-group">
            <label>IP-Adresse</label>
            <input type="text" name="ipaddress" class="hw-field" placeholder="z.B. 192.168.1.20">
        </div>
    </div>

    <!-- Hardware-Details -->
    <div class="subsection-header">Hardware-Details</div>
    <div class="form-row">
        <div class="form-group">
            <label>Hersteller & Modell</label>
            <input type="text" name="model" class="hw-field" placeholder="z.B. Dell PowerEdge R750">
        </div>
        <div class="form-group">
            <label>Seriennummer</label>
            <input type="text" name="serialnumber" class="hw-field" placeholder="z.B. SN123456789">
        </div>
    </div>

    <!-- System-Konfiguration -->
    <div class="subsection-header">System-Konfiguration</div>
    <div class="form-row">
        <div class="form-group">
            <label>Betriebssystem</label>
            {{include:pages/wizards/system/operatingsystemcombobox.tpl|with:category:hardware}}
        </div>
        <div class="form-group">
            <label>Rolle / Funktion</label>
            {{include:pages/wizards/system/serverrolecombobox.tpl|with:category:hardware}}
        </div>
    </div>

    <!-- Ressourcen -->
    <div class="subsection-header">Ressourcen</div>
    <div class="form-row">
        <div class="form-group">
            <label>CPU</label>
            <input type="text" name="cpu" class="hw-field" placeholder="z.B. 2x Intel Xeon Gold 6248R">
        </div>
        <div class="form-group">
            <label>RAM (GB)</label>
            <input type="number" name="ramingb" class="hw-field" placeholder="z.B. 128">
        </div>
    </div>
    <div class="form-row">
        <div class="form-group">
            <label>Storage</label>
            <input type="text" name="storage" class="hw-field" placeholder="z.B. 4x 960GB SSD RAID 10">
        </div>
        <div class="form-group">
            <label>Standort / Rack</label>
            <input type="text" name="location" class="hw-field" placeholder="z.B. RZ1-Rack-A12-U10">
        </div>
    </div>

    <!-- Support & Garantie -->
    <div class="subsection-header">Support & Garantie</div>
    <div class="form-group">
        <label>Garantie / Support bis</label>
        <input type="text" name="warranty" class="hw-field" placeholder="z.B. 12/2027">
    </div>
</div>