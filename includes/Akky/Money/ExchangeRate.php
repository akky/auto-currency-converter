<?php

namespace Akky\Money;

/**
 * Exchange Rate fetcher from the web
 */
class ExchangeRate {
    // in-process cache to avoid multiple API calls within the same process
    protected $_cached = array();

    /**
     * convert US dollar to Yen
     *
     * @assert(1, "USD", "JPY") > 50
     * @assert(1, "USD", "JPY") < 130
     */
    public function convert($src, $from, $to) {

        $rate = $this->getRate($from, $to);
        if (!$rate) {
            throw new \RuntimeException('rate info not found');
        }
        return $src * $rate;
    }

    /**
     * get exchange rates
     *
     * @assert("USD", "JPY") > 50
     * @assert("USD", "JPY") < 130
     */
    public function getRate($from, $to) {
        $rate = $this->doGetRate($from, $to);
        return $rate;
    }

    /**
     * get exchange rates from fixer.io
     *
     * @assert("USD", "JPY") > 50
     * @assert("USD", "JPY") < 130
     */
    public function doGetRate($from, $to) {
        if (isset($this->_cached[$from][$to])) {
            return $this->_cached[$from][$to];
        }
        $url = "https://api.fixer.io/latest?base=USD&symbols=JPY";
        $json = file_get_contents($url);
        if (!$json) {
            return false;
        }
        $decoded = json_decode($json, true);
        $rate = $decoded['rates']['JPY'];

        $this->_cached[$from][$to] = $rate;
        return $rate;
    }
}