package com.example.saira.myintent;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

/**
 * Created by Saira on 08/10/2015.
 */
public class OtherActivity extends AppCompatActivity {
    Button more_text;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.colors);

        more_text = (Button) findViewById(R.id.more_text);
        more_text.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v)
            {
                Intent switchScreen = new Intent(OtherActivity.this, MainActivity.class);
                    startActivity(switchScreen);

            }
        });

    }
}
