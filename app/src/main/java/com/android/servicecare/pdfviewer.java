package com.android.servicecare;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.github.barteksc.pdfviewer.PDFView;

public class pdfviewer extends AppCompatActivity {


    PDFView pdf;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pdfviewer);

       pdf=(PDFView) findViewById(R.id.pdf);

       pdf.fromAsset("Doc1.pdf").load();



    }
}
