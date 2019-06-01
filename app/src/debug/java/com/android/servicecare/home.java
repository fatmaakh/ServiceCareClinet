package com.android.servicecare;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v4.widget.SwipeRefreshLayout;
import android.view.View;
import android.support.v4.view.GravityCompat;
import android.support.v7.app.ActionBarDrawerToggle;
import android.view.MenuItem;
import android.support.design.widget.NavigationView;
import android.support.v4.widget.DrawerLayout;

import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.widget.AdapterView;
import android.widget.GridView;

import java.sql.SQLException;
import java.util.ArrayList;

public class home extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {

    public static String secno;

    section model;
    getsection g=new getsection();
    AdapterSection adapterSection;
    ArrayList<section> data;
    GridView gvsection;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        gvsection=(GridView)findViewById(R.id.gvsection);
        ArrayList<section> testarray = new ArrayList<>();

        try {
            //here too u should check for null if g.getdata
            if(g.getdata(this)!=null)
            {
                testarray.add(g.getdata(this).get(0));
            }
            data=new ArrayList<>(g.getdata(home.this));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        adapterSection=new AdapterSection(home.this,data);
        gvsection.setAdapter(adapterSection);

        final SwipeRefreshLayout swp=(SwipeRefreshLayout)findViewById(R.id.swp);
        swp.setProgressBackgroundColorSchemeColor(Color.GRAY);
        swp.setColorSchemeColors(Color.GREEN,Color.BLUE,Color.RED);
        swp.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {

                try {
                    data=new ArrayList<>(g.getdata(home.this));
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                adapterSection=new AdapterSection(home.this,data);
                gvsection.setAdapter(adapterSection);
                swp.setRefreshing(false);


            }
        });

        gvsection.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                model=data.get(position);
                secno=model.getSecno();

                startActivity(new Intent(home.this,workerActivity.class));
            }
        });


        FloatingActionButton fab = findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });
        DrawerLayout drawer = findViewById(R.id.drawer_layout);
        NavigationView navigationView = findViewById(R.id.nav_view);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.addDrawerListener(toggle);
        toggle.syncState();
        navigationView.setNavigationItemSelectedListener(this);
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.home, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.

        int id = item.getItemId();

        if (id == R.id.nav_contact) {
            startActivity(new Intent(home.this,contactus.class));


        } else if (id == R.id.history) {

        } else if (id == R.id.nav_notification) {

        } else if (id == R.id.nav_help) {

        } else if (id == R.id.nav_about) {

            startActivity(new Intent(home.this,aboutusActivity.class));
//startactivity
        } else if (id == R.id.nav_share) {

            try {
                Intent shareIntent = new Intent(Intent.ACTION_SEND);
                shareIntent.setType("text/plain");
                shareIntent.putExtra(Intent.EXTRA_SUBJECT, "My application name");
                String shareMessage= "Let me recommend you this application";
                shareMessage = shareMessage + "https://play.google.com/store/apps/details?id=" + BuildConfig.APPLICATION_ID +"\n\n";
                shareIntent.putExtra(Intent.EXTRA_TEXT, shareMessage);
                startActivity(Intent.createChooser(shareIntent, "choose one"));
            } catch(Exception e) {
                //e.toString();
            }
        }else if (id==R.id.nav_website){

        }
        else if (id==R.id.logout){
            getSharedPreferences("Service", MODE_PRIVATE)
                    .edit()
                    .clear()
                    .commit();

            startActivity(new Intent(home.this,splashactivity.class));
            return true;

        }



        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }



}
