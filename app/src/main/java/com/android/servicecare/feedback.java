package com.android.servicecare;

import android.content.Intent;
import android.database.SQLException;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import java.sql.Connection;
import java.sql.ResultSet;

public class feedback extends AppCompatActivity {
    ImageView img;
    TextView textf;
    EditText  feed;
    Button btn_submit;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_feedback);

        img = (ImageView) findViewById(R.id.img);
        textf = (TextView) findViewById(R.id.textf);
        feed = (EditText) findViewById(R.id.feed);


        btn_submit = (Button) findViewById(R.id.btn_submit);
        btn_submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


                if(feed.getText().toString().isEmpty())
                {
                    feed.setError("Please write your feedback");
                    feed.requestFocus();
                }
                Database salma=new Database();
                        Connection conn=salma.ConnectDB();
                        if(conn==null)
                            Toast.makeText(feedback.this, "Please check internet access", Toast.LENGTH_SHORT).show();

                             else
                        {
                            String koko=salma.RUNIUD("insert into  feedback values ('"+loginActivity.username+"','"+workerActivity.workername +"','"+feed.getText()+"','"+home.secno+"')");
                            if(koko.equals("Ok"))
                            {
                                Toast.makeText(feedback.this, "Feedback has been sent", Toast.LENGTH_SHORT).show();
                            }

                            else
                                Toast.makeText(feedback.this, ""+koko, Toast.LENGTH_SHORT).show();

                        }

                    }


        });

    }
}