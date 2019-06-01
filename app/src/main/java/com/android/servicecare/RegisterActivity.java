package com.android.servicecare;

import android.content.Intent;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import java.sql.Connection;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class RegisterActivity extends AppCompatActivity {

    ImageView imgmap;
    EditText temail,tname,tactive;
    EditText tuser,tpassword,taddress;
    EditText tid,tphone;
    Button bsend,bregister;
    int activecode;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
        tid=(EditText)findViewById(R.id.cnational);
        tphone=(EditText)findViewById(R.id.phone);
        taddress=(EditText)findViewById(R.id.address);
        tname=(EditText)findViewById(R.id.Fullnum);
        tuser=(EditText)findViewById(R.id.usernum);
        temail=(EditText)findViewById(R.id.mail);
        tactive=(EditText)findViewById(R.id.activecode);
        tpassword=(EditText)findViewById(R.id.pass);

        bregister=(Button)findViewById(R.id.btnregister);
        bregister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


                if(tuser.getText().toString().isEmpty())
                {
                    tuser.setError("Please enter username");
                    tuser.requestFocus();
                }
                else {

                    if(tpassword.getText().toString().isEmpty())
                    {
                        tpassword.setError("Please enter passsword");
                        tpassword.requestFocus();
                    }
                    else {

                        if(Integer.parseInt(tactive.getText().toString())==activecode)
                        {
                            Database salma=new Database();
                            Connection conn=salma.ConnectDB();
                            if(conn==null)
                                Toast.makeText(RegisterActivity.this, "Please check internet access", Toast.LENGTH_SHORT).show();
                            else
                            {
                                String koko=salma.RUNIUD("insert into customer values ('"+tname.getText()+"','"+tuser.getText()+"','"+tpassword.getText()+"','"+temail.getText()+"','"+tid.getText()+"','"+tphone.getText()+"','"+taddress.getText()+"','"+MapsActivity.lang+"','"+MapsActivity.lat+"')");
                                if(koko.equals("Ok"))
                                {
                                    AlertDialog.Builder hend=new AlertDialog.Builder(RegisterActivity.this);
                                    hend.setTitle("Service care");
                                    hend.setMessage("Your account has been created succeed :) ");
                                    hend.setIcon(R.drawable.logo);
                                    hend.setPositiveButton("Thanks",null);
                                    hend.create();
                                    hend.show();
                                }
                                else if(koko.toString().contains("PRIMARY KEY"))
                                {
                                    AlertDialog.Builder hend=new AlertDialog.Builder(RegisterActivity.this);
                                    hend.setTitle("Service Care");
                                    hend.setMessage("Sorry this user alredy exist try again");
                                    hend.setIcon(R.drawable.logo);
                                    hend.setPositiveButton("Thanks",null);
                                    hend.create();
                                    hend.show();

                                }
                                else
                                    Toast.makeText(RegisterActivity.this, ""+koko, Toast.LENGTH_SHORT).show();

                            }


                        }
                        else
                        {
                            tactive.setError("Invaild activation code , check your email");
                            tactive.requestFocus();
                        }

                    }

                }


            }
        });

        imgmap=(ImageView)findViewById(R.id.imgmap);
        imgmap.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(RegisterActivity.this,MapsActivity.class));
            }
        });

        bsend=(Button)findViewById(R.id.send);
        bsend.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


              Random  r=new Random();
                activecode=r.nextInt(9999-1111+1)+1111;
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            final String username = "yourmobileapp2017@gmail.com";
                            final String password = "okok2017";
                            Properties props = new Properties();
                            props.put("mail.smtp.auth", "true");
                            props.put("mail.smtp.starttls.enable", "true");
                            props.put("mail.smtp.host", "smtp.gmail.com");
                            props.put("mail.smtp.port", "587");

                            Session session = Session.getInstance(props,
                                    new javax.mail.Authenticator() {

                                        protected PasswordAuthentication getPasswordAuthentication() {
                                            return new PasswordAuthentication(username, password);
                                        }
                                    });

                            try {
                                Message message = new MimeMessage(session);
                                message.setFrom(new InternetAddress("yourmobileapp2017@gmail.com"));
                                message.setRecipients(Message.RecipientType.TO,
                                        InternetAddress.parse(temail.getText().toString()));
                                message.setSubject("Service Care Application - Activation Code");
                                message.setText("Dear : "+tname.getText()+"\n Activation code is : "+activecode+"\n Thank your for registeration");
                                Transport.send(message);


                            } catch (MessagingException e) {
                                throw new RuntimeException(e);
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    }
                }).start();

                Toast.makeText(RegisterActivity.this,"Activation code has been sent , check your email",Toast.LENGTH_LONG).show();

            }
        });


    }
}
