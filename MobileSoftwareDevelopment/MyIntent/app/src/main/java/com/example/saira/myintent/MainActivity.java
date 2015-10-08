package com.example.saira.myintent;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {
    Button text;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        text = (Button) findViewById(R.id.text);
        text.setOnClickListener(new View.OnClickListener() {
           public void onClick(View v)
           {
               Intent switchScreen = new Intent(MainActivity.this, OtherActivity.class);
                       startActivity(switchScreen);
           }
        });

    }
}
