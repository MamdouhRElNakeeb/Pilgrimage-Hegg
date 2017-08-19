package com.khaled.hegg.activity;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.AppCompatButton;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.androidnetworking.AndroidNetworking;
import com.androidnetworking.error.ANError;
import com.androidnetworking.interfaces.ParsedRequestListener;
import com.bumptech.glide.Glide;
import com.khaled.hegg.R;
import com.khaled.hegg.model.ServerResponse;
import com.khaled.hegg.utils.Url;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

public class RequestFatwaActivity extends AppCompatActivity {
    @BindView(R.id.toolbar)
    Toolbar mToolbar;
    @BindView(R.id.btn_request_fatwa)
    AppCompatButton btn_request_fatwa ;
    TextView toolbar_title ;
    ImageView iv_background ;
    ImageView iv_logo ;
    ImageView iv_ic ;
    @BindView(R.id.et_fatwa)
    EditText et_fatwa ;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_request_fatwa);
        ButterKnife.bind(this) ;
        initToolbar();

    }

    private void initToolbar() {
        toolbar_title=   ButterKnife.findById(mToolbar,R.id.tv_title);
        iv_background = ButterKnife.findById(mToolbar,R.id.iv_background);
        iv_logo= ButterKnife.findById(mToolbar,R.id.iv_logo);
        iv_ic=ButterKnife.findById(mToolbar,R.id.iv_ic);
        toolbar_title.setText(R.string.request_fatwa);
        iv_background.post(new Runnable() {
            @Override
            public void run() {
                Glide.with(iv_background.getContext())
                        .load(R.drawable.splash_bg)
                        .asBitmap()
                        .crossFade()
                        .centerCrop()
                        .override(iv_background.getWidth(),iv_background.getHeight())
                        .into(iv_background);
            }
        });

        iv_ic.post(new Runnable() {
            @Override
            public void run() {
                Glide.with(iv_background.getContext())
                        .load(R.drawable.fatwas_icon)
                        .asBitmap()
                        .crossFade()
                        .centerCrop()
                        .override(iv_ic.getWidth(),iv_ic.getHeight())
                        .into(iv_ic);
            }
        });

        iv_logo.post(new Runnable() {
            @Override
            public void run() {
                Glide.with(iv_logo.getContext())
                        .load(R.drawable.logo_icon)
                        .asBitmap()
                        .crossFade()
                        .centerCrop()
                        .override(iv_logo.getWidth(),iv_logo.getHeight())
                        .into(iv_logo);
            }
        });

    }


    @OnClick(R.id.btn_request_fatwa)
    public void requestFatwa(View view){
        Log.e("Tag","REQUEST FATWA");
        AndroidNetworking.get(Url.FATWA_REQUEST)
                .addQueryParameter("question",et_fatwa.getText().toString() )
                .build()
                .getAsObject(ServerResponse.class, new ParsedRequestListener<ServerResponse>() {
                    @Override
                    public void onResponse(ServerResponse response) {
                        if(!response.isError()){
                            Log.e("Tag","SUCCESS FATWA");

                            Toast.makeText(RequestFatwaActivity.this,"تم ارسال سؤالك",Toast.LENGTH_LONG).show();

                        }
                        else{
                            Toast.makeText(RequestFatwaActivity.this,"There's is a problem",Toast.LENGTH_LONG).show();
                            Log.e("Tag","ERROR FATWA");

                        }

                    }

                    @Override
                    public void onError(ANError anError) {
                        Log.e("Tag",anError.toString());

                        Toast.makeText(RequestFatwaActivity.this,anError.toString(),Toast.LENGTH_LONG).show();
                    }
                });
    }
}
