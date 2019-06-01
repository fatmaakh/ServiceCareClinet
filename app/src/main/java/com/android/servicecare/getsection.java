package com.android.servicecare;

import android.content.Context;
import android.widget.Toast;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class getsection {

    public List<section> getdata(Context cn) throws SQLException {

        List<section> data=new ArrayList<>();

        Database hend=new Database();
        hend.ConnectDB();
        ResultSet rs=hend.RunSearch("select * from servicesection");


        try {
            while (rs.next())
            {
                section nourhan=new section();
                nourhan.setSecno(rs.getString(1));
                nourhan.setSecname(rs.getString(2));
                nourhan.setLogo(rs.getString(3));
                data.add(nourhan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return data;


    }

}
