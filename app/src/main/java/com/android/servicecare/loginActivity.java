package com.android.servicecare;

import android.app.assist.AssistStructure;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.SQLException;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.Toast;

import java.sql.Connection;
import java.sql.ResultSet;

public class loginActivity extends AppCompatActivity {

    EditText bnum,bpass;
    CheckBox chk;
    Button blogin;
    Button bcreate;
    public static String  username;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        SharedPreferences share=getSharedPreferences("Service",MODE_PRIVATE);
        String us=share.getString("Username",null);
        if (us!=null)
        {
            username=us;
            startActivity(new Intent(loginActivity.this,home.class));
        }

        bnum=(EditText)findViewById(R.id.num);
        bpass=(EditText)findViewById(R.id.pwd);
        chk=(CheckBox)findViewById(R.id.checkBox);
        blogin=(Button)findViewById(R.id.btnlog);
        blogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


                if(bnum.getText().toString().isEmpty())
                {
                    bnum.setError("Enter username");
                    bnum.requestFocus();
                }
                else {
                    if(bpass.getText().toString().isEmpty())
                    {
                        bpass.setError("Enter password");
                        bpass.requestFocus();
                    }
                    else
                    {
                        Database db=new Database();
                        Connection mina=db.ConnectDB();
                        if(mina==null)
                            Toast.makeText(loginActivity.this, "Check internet access", Toast.LENGTH_SHORT).show();
                        else
                        {
                            ResultSet rs=db.RunSearch("select * from customer where username='"+bnum.getText()+"' and password='"+bpass.getText()+"'");
                            try {
                                if(rs.next())
                                {
                                    username=bnum.getText().toString();

                                    if(chk.isChecked()) {
                                        getSharedPreferences("Service", MODE_PRIVATE)
                                                .edit()
                                                .putString("Username", bnum.getText().toString())
                                                .apply();
                                        startActivity(new Intent(loginActivity.this,home.class));
                                    }
                                }
                                else
                                    Toast.makeText(loginActivity.this, "Invaild username or password", Toast.LENGTH_SHORT).show();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            } catch (java.sql.SQLException e) {
                                e.printStackTrace();
                            }


                        }




                    }
                }

            }
        });

        bcreate=(Button)findViewById(R.id.btnregisteration);
        bcreate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(loginActivity.this,RegisterActivity.class));
            }
        });

    }
}
