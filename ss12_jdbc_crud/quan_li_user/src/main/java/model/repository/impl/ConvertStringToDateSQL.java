package model.repository.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ConvertStringToDateSQL {
    public Date getDate(String dateString){
        java.util.Date utilDay = null;
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        try {
            utilDay = (Date) df.parse(dateString);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        return new Date(utilDay.getTime());
    }
}
