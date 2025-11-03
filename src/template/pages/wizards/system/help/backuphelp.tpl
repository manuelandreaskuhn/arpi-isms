<!-- Tooltip Definitions -->
<div class="tooltip-definitions" style="display: none;">
    <div data-tooltip-id="backup-system">
        <h2>Backup-System</h2>
        <p>Wählen Sie die Backup-Software oder -Appliance aus, die für diesen Backup-Job verwendet wird.</p>
        <div>
            <h3>Beispiele:</h3>
            Veeam Backup & Replication, Commvault, Acronis, Veritas NetBackup
        </div>
        <div>
            <h3>Tipp:</h3>
            Das Backup-System muss zuvor als Komponente angelegt worden sein.
        </div>
    </div>
    
    <div data-tooltip-id="job-name">
        <h2>Job-Name</h2>
        <p>Ein eindeutiger, beschreibender Name für diesen Backup-Job.</p>
        <div>
            <h3>Best Practice:</h3>
            Verwenden Sie einen Namen, der das Ziel und die Häufigkeit beschreibt.
        </div>
        <div>
            <h3>Beispiele:</h3>
            "KIS-Daily-Full", "DB-Hourly-Incremental", "FileServer-Weekly"
        </div>
    </div>
    
    <div data-tooltip-id="backup-type">
        <h2>Backup-Typ</h2>
        <p>Die Art des Backups bestimmt, was und wie gesichert wird:</p>
        <div>
            <ul>
                <li><strong>VM Image Backup:</strong> Sichert die komplette virtuelle Maschine als Abbild (Snapshot). Schnelle Wiederherstellung der gesamten VM möglich.</li>
                <li><strong>File-Level Backup:</strong> Sichert einzelne Dateien und Ordner. Ermöglicht granulare Wiederherstellung einzelner Dateien.</li>
                <li><strong>Database Backup:</strong> Spezialisiertes Backup für Datenbanken (SQL, Oracle, etc.). Berücksichtigt Datenbank-Transaktionen und Konsistenz.</li>
                <li><strong>Application Backup:</strong> Anwendungsspezifisches Backup, das den Zustand und die Daten einer Applikation sichert.</li>
                <li><strong>Bare Metal Backup:</strong> Vollständiges System-Backup inklusive Betriebssystem. Ermöglicht Wiederherstellung auf neuer Hardware.</li>
            </ul>
        </div>
    </div>
    
    <div data-tooltip-id="frequency">
        <h2>Backup-Frequenz</h2>
        <p>Wie oft wird dieses Backup durchgeführt?</p>
        <div>
            <ul>
                <li><strong>Stündlich:</strong> Für kritische Systeme mit geringem Datenverlust-Risiko (RPO < 1h)</li>
                <li><strong>Täglich:</strong> Standard für die meisten Produktivsysteme</li>
                <li><strong>Wöchentlich:</strong> Für weniger kritische oder sich selten ändernde Daten</li>
                <li><strong>Monatlich:</strong> Für Archivierungs-Backups oder Compliance-Anforderungen</li>
                <li><strong>On-Demand:</strong> Manuell ausgelöste Backups, z.B. vor System-Updates</li>
            </ul>
        </div>
        <div>
            <h3>Tipp:</h3>
            Häufigere Backups = weniger Datenverlust, aber mehr Speicherplatz und Netzwerklast.
        </div>
    </div>
    
    <div data-tooltip-id="backup-time">
        <h2>Backup-Zeit</h2>
        <p>Die Uhrzeit, zu der das Backup startet.</p>
        <div>
            <h3>Best Practice:</h3>
            Wählen Sie eine Zeit außerhalb der Hauptgeschäftszeiten, um die Performance nicht zu beeinträchtigen.
        </div>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"02:00" - Backup startet um 2 Uhr nachts</li>
                <li>"23:00-01:00" - Backup-Fenster zwischen 23 und 1 Uhr</li>
            </ul>
        </div>
    </div>
    
    <div data-tooltip-id="backup-window">
        <h2>Backup-Fenster</h2>
        <p>Die maximale Zeit, die für die Durchführung des Backups zur Verfügung steht.</p>
        <div>
            <h3>Wichtig:</h3>
            Das Backup sollte innerhalb dieses Zeitfensters abgeschlossen sein.
        </div>
        <div>
            <h3>Beispiel:</h3>
            Bei einem 4-Stunden-Fenster ab 02:00 Uhr muss das Backup bis 06:00 Uhr fertig sein.
        </div>
        <div>
            <h3>Tipp:</h3>
            Überwachen Sie die tatsächliche Backup-Dauer und passen Sie das Fenster bei Bedarf an.
        </div>
    </div>
    
    <div data-tooltip-id="backup-days">
        <h2>Backup-Tage</h2>
        <p>An welchen Tagen wird das Backup durchgeführt.</p>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li>"Mo-Fr" - Montag bis Freitag (Werktags)</li>
                <li>"täglich" - Jeden Tag</li>
                <li>"So, Mi" - Sonntag und Mittwoch</li>
                <li>"1./15." - Am 1. und 15. jeden Monats</li>
            </ul>
        </div>
    </div>
    
    <div data-tooltip-id="retention-info">
        <h2>Aufbewahrungsrichtlinien (Retention)</h2>
        <p>Retention bestimmt, wie lange Backup-Versionen aufbewahrt werden, bevor sie automatisch gelöscht werden.</p>
        <div>
            <h3>Wichtig für:</h3>
            <ul>
                <li>Compliance-Anforderungen (z.B. 10 Jahre für Patientendaten)</li>
                <li>Speicherplatz-Management</li>
                <li>Wiederherstellung älterer Versionen</li>
            </ul>
        </div>
        <div>
            <h3>Tipp:</h3>
            Längere Retention = mehr Speicherplatz benötigt. Planen Sie entsprechend!
        </div>
    </div>
    
    <div data-tooltip-id="retention-daily">
        <h2>Tägliche Retention</h2>
        <p>Wie viele Tage werden die täglichen Backups aufbewahrt.</p>
        <div>
            <h3>Typische Werte:</h3>
            <ul>
                <li>7 Tage - Eine Woche zurück</li>
                <li>14 Tage - Zwei Wochen</li>
                <li>30 Tage - Ein Monat</li>
            </ul>
        </div>
        <div>
            <h3>Beispiel:</h3>
            Bei 7 Tagen haben Sie die Backups von heute, gestern, vorgestern, usw. bis vor einer Woche.
        </div>
    </div>
    
    <div data-tooltip-id="retention-weekly">
        <h2>Wöchentliche Retention</h2>
        <p>Wie viele Wochen werden die wöchentlichen Backups aufbewahrt.</p>
        <div>
            <h3>Typische Werte:</h3>
            4-12 Wochen (1-3 Monate)
        </div>
        <div>
            <h3>Beispiel:</h3>
            Bei 4 Wochen können Sie auf die letzten 4 Wochen-Backups zugreifen.
        </div>
    </div>
    
    <div data-tooltip-id="retention-monthly">
        <h2>Monatliche Retention</h2>
        <p>Wie viele Monate werden die monatlichen Backups aufbewahrt.</p>
        <div>
            <h3>Typische Werte:</h3>
            6-24 Monate (0.5-2 Jahre)
        </div>
        <div>
            <h3>Einsatz:</h3>
            Für längerfristige Wiederherstellungen oder Compliance.
        </div>
    </div>
    
    <div data-tooltip-id="retention-yearly">
        <h2>Jährliche Retention</h2>
        <p>Wie viele Jahre werden die jährlichen Backups aufbewahrt.</p>
        <div>
            <h3>Typische Werte:</h3>
            5-10 Jahre
        </div>
        <div>
            <h3>Wichtig für:</h3>
            Gesetzliche Aufbewahrungsfristen, besonders im Gesundheitswesen.
        </div>
    </div>
    
    <div data-tooltip-id="gfs-schema">
        <h2>GFS (Grandfather-Father-Son) Schema</h2>
        <p>Ein bewährtes Backup-Rotationsschema zur Optimierung der Datensicherung.</p>
        <div>
            <ul>
                <li><strong>Son (Sohn):</strong> Tägliche Backups</li>
                <li><strong>Father (Vater):</strong> Wöchentliche Backups</li>
                <li><strong>Grandfather (Großvater):</strong> Monatliche/Jährliche Backups</li>
            </ul>
        </div>
        <div>
            <h3>Vorteil:</h3>
            Optimales Verhältnis zwischen Speicherplatz und Wiederherstellungsoptionen.
        </div>
        <div>
            <h3>Beispiel:</h3>
            7 tägliche + 4 wöchentliche + 12 monatliche Backups
        </div>
    </div>
    
    <div data-tooltip-id="gfs-enabled">
        <h2>GFS aktivieren</h2>
        <p>Aktivieren Sie das GFS-Schema, wenn Sie eine strukturierte Backup-Rotation wünschen.</p>
        <div>
            <h3>Ja:</h3>
            Verwende GFS-Rotation (empfohlen für Produktivsysteme)
        </div>
        <div>
            <h3>Nein:</h3>
            Verwende einfache Retention-Regeln
        </div>
    </div>
    
    <div data-tooltip-id="gfs-daily">
        <h2>GFS Daily (Son)</h2>
        <p>Die "Söhne" sind die täglichen Backups.</p>
        <div>
            <h3>Empfehlung:</h3>
            7 (eine Woche zurück)
        </div>
        <div>
            Nach 7 Tagen wird das älteste tägliche Backup gelöscht, außer es wird zum "Father".
        </div>
    </div>
    
    <div data-tooltip-id="gfs-weekly">
        <h2>GFS Weekly (Father)</h2>
        <p>Die "Väter" sind die wöchentlichen Backups.</p>
        <div>
            <h3>Empfehlung:</h3>
            4-5 (einen Monat zurück)
        </div>
        <div>
            Meist wird das Freitags- oder Sonntags-Backup zum "Father" befördert.
        </div>
    </div>
    
    <div data-tooltip-id="gfs-monthly">
        <h2>GFS Monthly (Grandfather)</h2>
        <p>Die "Großväter" sind die monatlichen Backups.</p>
        <div>
            <h3>Empfehlung:</h3>
            12 (ein Jahr zurück)
        </div>
        <div>
            Meist wird das letzte Backup des Monats zum "Grandfather".
        </div>
    </div>
    
    <div data-tooltip-id="gfs-yearly">
        <h2>GFS Yearly</h2>
        <p>Die jährlichen Backups für langfristige Aufbewahrung.</p>
        <div>
            <h3>Empfehlung:</h3>
            5-10 Jahre (abhängig von Compliance-Anforderungen)
        </div>
        <div>
            <em>Im Gesundheitswesen oft 10 Jahre Pflicht!</em>
        </div>
    </div>
    
    <div data-tooltip-id="recovery-sla">
        <h2>Recovery-Ziele (SLA)</h2>
        <p>Definieren Sie die Anforderungen an Backup und Wiederherstellung.</p>
        <div>
            <h3>RPO:</h3>
            Wie viel Datenverlust ist akzeptabel?
        </div>
        <div>
            <h3>RTO:</h3>
            Wie schnell muss das System wieder verfügbar sein?
        </div>
        <div>
            <em>Diese Werte sollten mit der Geschäftsführung/Fachbereichen abgestimmt sein!</em>
        </div>
    </div>
    
    <div data-tooltip-id="rpo">
        <h2>RPO (Recovery Point Objective)</h2>
        <p>Der maximale Datenverlust, den Ihr Unternehmen verkraften kann.</p>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li><strong>24h RPO:</strong> Tägliches Backup ausreichend. Bis zu 24h Daten können verloren gehen.</li>
                <li><strong>4h RPO:</strong> Backup alle 4 Stunden nötig.</li>
                <li><strong>1h RPO:</strong> Stündliches Backup oder kontinuierliche Replikation.</li>
            </ul>
        </div>
        <div>
            <h3>Faustregel:</h3>
            Je kürzer der RPO, desto häufiger müssen Backups erstellt werden!
        </div>
    </div>
    
    <div data-tooltip-id="rto">
        <h2>RTO (Recovery Time Objective)</h2>
        <p>Die maximale Zeit, die für die Wiederherstellung zur Verfügung steht.</p>
        <div>
            <h3>Beispiele:</h3>
            <ul>
                <li><strong>4h RTO:</strong> System muss innerhalb von 4 Stunden wieder verfügbar sein.</li>
                <li><strong>24h RTO:</strong> System kann innerhalb eines Tages wiederhergestellt werden.</li>
                <li><strong>1h RTO:</strong> Sehr kritisch, schnelle Wiederherstellung erforderlich.</li>
            </ul>
        </div>
        <div>
            <h3>Wichtig:</h3>
            Testen Sie regelmäßig, ob der RTO eingehalten werden kann!
        </div>
    </div>
    
    <div data-tooltip-id="verification">
        <h2>Automatische Verifizierung</h2>
        <p>Prüft automatisch nach jedem Backup, ob die Daten korrekt gesichert wurden.</p>
        <div>
            <h3>Aktiviert:</h3>
            Backup-System führt nach jedem Job eine Integritätsprüfung durch.
        </div>
        <div>
            <h3>Methoden:</h3>
            <ul>
                <li>Checksummen-Prüfung</li>
                <li>Testweise Wiederherstellung einzelner Dateien</li>
                <li>Boot-Test von VM-Backups (SureBackup bei Veeam)</li>
            </ul>
        </div>
        <div>
            <h3>Empfehlung:</h3>
            Immer aktivieren! Ein nicht verifizierbares Backup ist wertlos.
        </div>
    </div>
    
    <div data-tooltip-id="restore-test">
        <h2>Restore-Test</h2>
        <p>Testen Sie regelmäßig die Wiederherstellbarkeit Ihrer Backups.</p>
        <div>
            <h3>Wichtig:</h3>
            Ein Backup ist nur so gut wie seine Wiederherstellbarkeit!
        </div>
        <div>
            <h3>Best Practice:</h3>
            Mindestens quartalsweise einen vollständigen Restore-Test durchführen.
        </div>
        <div>
            <h3>Häufiger Fehler:</h3>
            Man verlässt sich auf Backups, ohne sie jemals getestet zu haben!
        </div>
    </div>
    
    <div data-tooltip-id="test-frequency">
        <h2>Test-Frequenz</h2>
        <p>Wie oft führen Sie Wiederherstellungstests durch?</p>
        <div>
            <h3>Empfohlene Frequenz nach Kritikalität:</h3>
            <ul>
                <li><strong>Kritisch (24/7):</strong> Monatlich</li>
                <li><strong>Hoch:</strong> Quartalsweise</li>
                <li><strong>Mittel:</strong> Halbjährlich</li>
                <li><strong>Niedrig:</strong> Jährlich</li>
            </ul>
        </div>
        <div>
            <h3>Tipp:</h3>
            Dokumentieren Sie die Ergebnisse jedes Tests!
        </div>
    </div>
</div>