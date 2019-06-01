package com.android.servicecare;

import android.content.Context;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class getworker {

    public List<worker> getdata(Context cn,String secno) throws SQLException {

        List<worker> data=new ArrayList<>();

        Database hend=new Database();
        hend.ConnectDB();
        ResultSet rs=hend.RunSearch("select * from worker where sectionno='"+secno+"'");

        try {
            while (rs.next())
            {
                worker nourhan=new worker();
                nourhan.setWorkerno(rs.getString(1));
                nourhan.setWorkername(rs.getString(2));

                nourhan.setPrice(rs.getString(4));
                nourhan.setImg(rs.getString(5));
                nourhan.setSectionno(rs.getString(6));
                nourhan.setCv(rs.getString(7));
                nourhan.setEmail(rs.getString(8));
                nourhan.setPass(rs.getString(9));

                data.add(nourhan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return data;


    }

}
