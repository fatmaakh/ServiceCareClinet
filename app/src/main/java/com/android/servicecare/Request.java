package com.android.servicecare;

import android.app.Activity;
import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.TimePicker;
import android.widget.Toast;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.MapView;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.Circle;
import com.google.android.gms.maps.model.CircleOptions;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Calendar;


public class Request extends AppCompatActivity implements OnMapReadyCallback {

    EditText txtnoes , date , time ;
    Button book;
    TextView T_time,T_date,frequency,adress;

    int mYear,mMonth,mDay,mHour,mMinute;

    MapView mapView;
    private GoogleMap mMap;
    Spinner spinner;
// i cant see ur message
    double lat,lang;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_request);

        mapView=(MapView)findViewById(R.id.mapView);

        date=(EditText)findViewById(R.id.date);
        date.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                datePick();
            }
        });

        time=(EditText)findViewById(R.id.time);
        time.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                timePick();
            }
        });

        adress=(TextView) findViewById(R.id.adress);
        frequency=(TextView) findViewById(R.id.frequency);
        T_date=(TextView) findViewById(R.id.T_date);
        T_time=(TextView) findViewById(R.id.T_time);
        txtnoes=(EditText)findViewById(R.id.txtnoes);




        book=(Button)findViewById(R.id.book);
        book.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if(date.getText().toString().isEmpty())
                {
                    date.setError("Please select date");
                    date.requestFocus();
                }
                else
                if(time.getText().toString().isEmpty())
                {
                    time.setError("Please select time");
                    time.requestFocus();
                }
                Database salma=new Database();
                Connection conn=salma.ConnectDB();
                if(conn==null) {
                    Toast.makeText(Request.this, "Please check internet access", Toast.LENGTH_SHORT).show();
                }
                else {
                    String koko = salma.RUNIUD("insert into request values('" + date.getText() + "','" + txtnoes.getText() + "','" + lat + "','" + lang + "','" + workerActivity.workername + "','" + loginActivity.username + "','" + time.getText() + "')");
               if(koko.equals("Ok"))
                   Toast.makeText(Request.this, "Request has been sent", Toast.LENGTH_SHORT).show();
               else
                   Toast.makeText(Request.this, ""+koko, Toast.LENGTH_SHORT).show();
                }
            }
        });

// you comment the code that load map to the map fragemnt
       //    SupportMapFragment mapFragment = (SupportMapFragment)getSupportFragmentManager()
         //      .findFragmentById(R.id.mapView);
           //   mapFragment.getMapAsync(this);

              mapView.onCreate(savedInstanceState);
              mapView.getMapAsync(this);
    }
     public void datePick(){
        final Calendar c= Calendar.getInstance();
        mYear= c.get(Calendar.YEAR);
        mMonth= c.get(Calendar.MONTH);
        mDay= c.get(Calendar.DAY_OF_MONTH);

         DatePickerDialog datePickerDialog=new DatePickerDialog(this, new DatePickerDialog.OnDateSetListener() {
             @Override
             public void onDateSet(DatePicker view, int year, int month, int dayOfMonth) {

                 date.setText(dayOfMonth+"-"+month+1+"-"+year);
             }
         },mDay,mMonth,mYear);
         datePickerDialog.show();
     }

    public void timePick(){
        final Calendar c= Calendar.getInstance();
        mHour= c.get(Calendar.HOUR);
        mMinute= c.get(Calendar.MINUTE);
        TimePickerDialog timePickerDialog=new TimePickerDialog(this, new TimePickerDialog.OnTimeSetListener() {
            @Override
            public void onTimeSet(TimePicker view, int hourOfDay, int minute) {

                time.setText(hourOfDay+":"+minute);
            }
        },mHour,mMinute,false);
        timePickerDialog.show();
    }


    @Override
    public void onMapReady(GoogleMap googleMap) {
        mMap = googleMap;

        GPSTracker fatma=new GPSTracker(Request.this);

        Circle circle = mMap.addCircle(new CircleOptions()
                .center(new LatLng(fatma.getLatitude(), fatma.getLongitude()))
                .radius(400)
                .strokeColor(Color.RED)
                .fillColor(0xff9999ff));

        // Add a marker in Sydney and move the camera
        LatLng sydney = new LatLng(fatma.getLatitude(), fatma.getLongitude());
        mMap.addMarker(new MarkerOptions().position(sydney).title("Marker in Your location"));
        mMap.moveCamera(CameraUpdateFactory.newLatLng(sydney));


        mMap.setOnMapClickListener(new GoogleMap.OnMapClickListener() {
            @Override
            public void onMapClick(LatLng latLng) {

                lat=latLng.latitude;
                lang=latLng.longitude;

            }
        });


    }

}
