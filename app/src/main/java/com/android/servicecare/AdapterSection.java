package com.android.servicecare;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;


public class AdapterSection extends ArrayAdapter<section> {
    Context context;
    ArrayList < section > mCategoryList;

    public AdapterSection(Context context , ArrayList <section> mCategoryList){
        super(context,R.layout.layooutsections,mCategoryList);
        this.context = context;
        this.mCategoryList =mCategoryList;
    }

    public class Holder {
        TextView txtsectionname;
        ImageView imgsections;

    }

    public View getView(int position, View convertView, ViewGroup parent){
        section  data = getItem(position);

        Holder viewHolder;

        if (convertView == null){

            viewHolder = new Holder();


            LayoutInflater layoutInflater = LayoutInflater.from(getContext());
            convertView = layoutInflater.inflate(R.layout.layooutsections,parent ,false);


            viewHolder.txtsectionname = (TextView) convertView.findViewById(R.id.txtsectionname);
            viewHolder.imgsections = (ImageView) convertView.findViewById(R.id.imgsections);

            convertView.setTag(viewHolder);
        }
        else {
            viewHolder = (Holder) convertView.getTag();
        }

        viewHolder.txtsectionname.setText(data.getSecname());


        viewHolder.txtsectionname.setText(data.getSecname());
      PicassoClinte.downloadImage(context,data.getLogo(),viewHolder.imgsections);



        //  viewHolder.mImage

        return convertView;
    }




}
