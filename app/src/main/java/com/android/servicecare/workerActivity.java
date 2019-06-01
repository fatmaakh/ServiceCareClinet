package com.android.servicecare;

import android.content.Intent;
import android.graphics.Color;
import android.support.design.widget.BottomSheetDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class workerActivity extends AppCompatActivity {

    Button btnrequest;
    Button btncv;
    Button feedback;
    worker model;
    getworker g=new getworker();
    Adapterworker adapterworker;
    ArrayList<worker> data;
    ListView listwork;
public static String workername;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_worker);
        listwork=(ListView)findViewById(R.id.listwork);
        try {
            data=new ArrayList<>(g.getdata(workerActivity.this,home.secno));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        adapterworker=new Adapterworker(workerActivity.this,data);
        listwork.setAdapter(adapterworker);
        adapterworker.notifyDataSetChanged();



        listwork.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id)
            {
                model=data.get(position);
                workername=model.getWorkername();
                BottomSheetDialog b=new BottomSheetDialog(workerActivity.this);
                LayoutInflater inflater=LayoutInflater.from(workerActivity.this);

                View vb=inflater.inflate(R.layout.layoutsheet,null);
                Button feedback=(Button)vb.findViewById(R.id.feeadback);
                feedback.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        startActivity(new Intent(workerActivity.this,feedback.class));

                    }
                });


                Button btnreq=(Button)vb.findViewById(R.id.btnrequest);
                btnreq.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        startActivity(new Intent(workerActivity.this,Request.class));

                    }
                });
                Database db=new Database();
                Connection mina=db.ConnectDB();
                if(mina==null)
                    Toast.makeText(workerActivity.this, "Check internet access", Toast.LENGTH_SHORT).show();
                    else {
                    ResultSet rs = db.RunSearch("select * from logintemp where Email='" + model.getEmail()+ "' and status='Login'");
                    try {
                        if (rs.next()) {
                            btnreq.setText("Request Now This Provider Online Now");
                            btnreq.setBackgroundColor(getResources().getColor(R.color.green));
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                Button btncv=(Button)vb.findViewById(R.id.btncv);
                btncv.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                       // startActivity(new Intent(workerActivity.this,.class));
                       startActivity(new Intent(workerActivity.this,pdfviewer.class));

                    }
                });
                b.setContentView(vb);
                b.show();






                //request
            }
        });

        listwork.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> parent, View view, int position, long id) {



                return false;
            }
        });


    }
}
