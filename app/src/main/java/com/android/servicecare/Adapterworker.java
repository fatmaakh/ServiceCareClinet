package com.android.servicecare;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RatingBar;
import android.widget.TextView;

import java.util.ArrayList;


public class Adapterworker extends ArrayAdapter<worker> {
    Context context;
    ArrayList < worker > mCategoryList;

    public Adapterworker(Context context , ArrayList <worker> mCategoryList){
        super(context,R.layout.workerlayout,mCategoryList);
        this.context = context;
        this.mCategoryList =mCategoryList;
    }

    public class Holder {
        TextView namework;
        TextView pricework;
        ImageView imgwork;
        Button request;

    }

    public View getView(int position, View convertView, ViewGroup parent){
        worker  data = getItem(position);

        Holder viewHolder;

        if (convertView == null){

            viewHolder = new Holder();


            LayoutInflater layoutInflater = LayoutInflater.from(getContext());
            convertView = layoutInflater.inflate(R.layout.workerlayout,parent ,false);


            viewHolder.namework = (TextView) convertView.findViewById(R.id.namework);
            viewHolder.imgwork = (ImageView) convertView.findViewById(R.id.imgwork);
            viewHolder.pricework = (TextView) convertView.findViewById(R.id.pricework);


            convertView.setTag(viewHolder);
        }
        else {
            viewHolder = (Holder) convertView.getTag();
        }

        viewHolder.namework.setText(data.getWorkername());
        viewHolder.pricework.setText(data.getPrice()+"LE");
         PicassoClinte.downloadImage(context,data.getImg(),viewHolder.imgwork);



        //  viewHolder.mImage

        return convertView;
    }




}
