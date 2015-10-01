package com.example.saira.myproject;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Button;
import android.view.View; // rectangular area on the screen
import android.widget.Toast; // shows a popup

public class MainActivity extends AppCompatActivity {
    Button btn, btnn;

    @Override
    // save the state in Bundle, data is recreated when onCreate is called ie. activity is starting
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main); // a window for placing the layout

        btn=(Button)findViewById(R.id.button); // Finds the widgets in the layout
        btn.setOnClickListener(new View.OnClickListener() { // takes in a callback when the view is clicked
            public void onClick(View v) {
                Toast.makeText(MainActivity.this,"Top Button Clicked!",
                Toast.LENGTH_LONG).show(); // shows for a longer period
            }
        });

        btnn=(Button)findViewById(R.id.button2);
        btnn.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                Toast.makeText(MainActivity.this,"Bottom Button Clicked!",
                Toast.LENGTH_LONG).show();
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
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
}
