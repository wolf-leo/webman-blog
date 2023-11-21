<?php

/*
 * Copyright (c) Alexandre Gomes Gaigalas <alganet@gmail.com>
 * SPDX-License-Identifier: MIT
 */

declare(strict_types=1);

namespace Respect\Validation\Exceptions;

/**
 * @author Danilo Benevides <danilobenevides01@gmail.com>
 * @author Diego Oliveira <contato@diegoholiveira.com>
 * @author Henrique Moody <henriquemoody@gmail.com>
 */
final class ImeiException extends ValidationException
{
    /**
     * {@inheritDoc}
     */
    protected $defaultTemplates = [
        self::MODE_DEFAULT => [
            self::STANDARD => '{{name}} 必须是有效的IMEI',
        ],
        self::MODE_NEGATIVE => [
            self::STANDARD => '{{name}} 不能是有效的IMEI',
        ],
    ];
}
