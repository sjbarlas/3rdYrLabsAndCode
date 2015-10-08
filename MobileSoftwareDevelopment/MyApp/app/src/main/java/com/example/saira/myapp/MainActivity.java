package com.example.saira.myapp;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
//import android.view.Menu;
//import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    Button add_task2, cancel;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        add_task2 = (Button) findViewById(R.id.add_task2);
        add_task2.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                Toast.makeText(MainActivity.this, "Your task has been added successfully",
                        Toast.LENGTH_LONG).show();
            }
        });


        cancel = (Button) findViewById(R.id.cancel);
        cancel.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                Toast.makeText(MainActivity.this, "You clicked cancel",
                        Toast.LENGTH_LONG).show();
            }
        });
    }
}
