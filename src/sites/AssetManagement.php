<?php
namespace ARPI\Sites;

use ARPI\Helper\BaseSite;
use ARPI\Entities\Annotations\Css;

#[Css('/template/css/pages/assetmanagement.css')]
class AssetManagement extends BaseSite
{
    public function prepare(): void
    {
        
    }

    public function main(): string
    {
        return $this->renderTemplate('pages/assetmanagement-overview.html');
    }
}
