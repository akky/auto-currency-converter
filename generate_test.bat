call phpunit-skelgen  generate-test -- Akky\Money\ExchangeRate includes\Akky\Money\ExchangeRate.php Akky\Money\ExchangeRateTest tests/phpunit/ExchangeRateTest.php
if not %ERRORLEVEL% == 0 (
    exit /b %ERRORLEVEL%
)

call phpunit-skelgen  generate-test --bootstrap tests\bootstrap.php -- Akky\Money\Usd includes\Akky\Money\Usd.php Akky\Money\UsdTest tests/phpunit/UsdTest.php
if not %ERRORLEVEL% == 0 (
    exit /b %ERRORLEVEL%
)

call phpunit-skelgen  generate-test --bootstrap tests\bootstrap.php -- Akky\Money\Jpy includes\Akky\Money\Jpy.php Akky\Money\JpyTest tests/phpunit/JpyTest.php
if not %ERRORLEVEL% == 0 (
    exit /b %ERRORLEVEL%
)

call phpunit-skelgen  generate-test -- Akky\Money\JpyFormatter includes\Akky\Money\JpyFormatter.php Akky\Money\JpyFormatterTest tests/phpunit/JpyFormatterTest.php
if not %ERRORLEVEL% == 0 (
    exit /b %ERRORLEVEL%
)

call phpunit-skelgen  generate-test -- Akky\Money\UsdFormatter includes\Akky\Money\UsdFormatter.php Akky\Money\UsdFormatterTest tests/phpunit/UsdFormatterTest.php
if not %ERRORLEVEL% == 0 (
    exit /b %ERRORLEVEL%
)
