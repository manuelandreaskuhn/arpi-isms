<div class="entry-content">
    <!-- Basis-Informationen -->
    <div class="subsection-header">Basis-Informationen</div>
    <div class="form-row">
        <div class="form-group">
            <label>Hostname <span class="required">*</span></label>
            <input type="text" name="hostname" class="vm-field" placeholder="z.B. srv-kis-prod-01" required>
        </div>
        <div class="form-group">
            <label>IP-Adresse</label>
            <input type="text" name="ipaddress" class="vm-field" placeholder="z.B. 192.168.1.10">
        </div>
    </div>

    <!-- System-Konfiguration -->
    <div class="subsection-header">System-Konfiguration</div>
    <div class="form-row">
        <div class="form-group">
            <label>Betriebssystem</label>
            {{include:pages/wizards/system/operatingsystemcombobox.tpl|with:category:vm}}
        </div>
        <div class="form-group">
            <label>Rolle / Funktion</label>
            {{include:pages/wizards/system/serverrolecombobox.tpl|with:category:vm}}
        </div>
    </div>

    <!-- Ressourcen -->
    <div class="subsection-header">Ressourcen</div>
    <div class="form-row">
        <div class="form-group">
            <label>vCPU</label>
            <input type="number" name="vcpu" class="vm-field" placeholder="z.B. 4">
        </div>
        <div class="form-group">
            <label>RAM (GB)</label>
            <input type="number" name="ramingb" class="vm-field" placeholder="z.B. 16">
        </div>
    </div>
    <div class="form-row">
        <div class="form-group">
            <label>Storage (GB)</label>
            <input type="number" name="storageingb" class="vm-field" placeholder="z.B. 500">
        </div>
        <div class="form-group">
            <label>Hypervisor</label>
            {{include:pages/wizards/system/hypervisorcombobox.tpl}}
        </div>
    </div>
</div>