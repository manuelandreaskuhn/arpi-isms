<?php
namespace ARPI\Entities\Annotations;

use Attribute;

#[Attribute(Attribute::TARGET_CLASS | Attribute::IS_REPEATABLE)]
class Css
{
    public array $files;

    public function __construct(...$files)
    {
        // Unterstützt #[Css('a.css', 'b.css')] und #[Css(['a.css','b.css'])]
        if (count($files) === 1 && is_array($files[0])) {
            $files = $files[0];
        }
        $normalized = [];
        foreach ($files as $f) {
            if (!is_string($f)) {
                continue;
            }
            $f = trim($f);
            if ($f !== '' && !in_array($f, $normalized, true)) {
                $normalized[] = $f;
            }
        }
        $this->files = $normalized;
    }
}
