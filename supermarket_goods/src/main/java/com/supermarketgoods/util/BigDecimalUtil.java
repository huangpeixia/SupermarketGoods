package com.supermarketgoods.util;

import java.math.BigDecimal;

public class BigDecimalUtil {

    //保留两位小数  float型
    public static float keepTwoDecimalPlaces(float marth){

        BigDecimal decimal = new BigDecimal(marth);

        return decimal.setScale(2, BigDecimal.ROUND_HALF_EVEN).floatValue();

    }

    //保留两位小数  Double型
    public static float keepTwoDecimalPlaces(Double marth){

        BigDecimal decimal = new BigDecimal(marth);

        return decimal.setScale(2, BigDecimal.ROUND_HALF_EVEN).floatValue();

    }

}

