// getBestProvider() - returns the name of te provider that meets the criteria


package com.example.saira.mygps;

import android.content.Context;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity implements LocationListener {

    private TextView locationText;
    private LocationManager locationManager;

    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        locationText = (TextView)findViewById(R.id.text);
        setUpLocation();
    }

    public void onProviderEnabled(String provider)
    {
        //
    }

    public void onProviderDisabled(String provider)
    {
        //
    }

    public void onStatusChanged(String provider, int status, Bundle extras)
    {
        //
    }

    public void onLocationChanged(Location location)
    {
        String latestLocation = "";

        if(location != null)
        {
            latestLocation = String.format("Current location \n Longitude: %1$s \n Latitude: %2$s", location.getLongitude(), location.getLatitude());
        }

        Toast.makeText(MainActivity.this, latestLocation, Toast.LENGTH_LONG).show();
        locationText.setText(latestLocation);
    }

    private void setUpLocation()
    {
        locationManager = (LocationManager)getSystemService(Context.LOCATION_SERVICE);
        locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 60000, 5, this);
    }

    @Override
    protected void onResume()
    {
        super.onResume();
        locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 60000, 5, this);
    }

    @Override
    protected void onPause()
    {
        super.onPause();
        locationManager.removeUpdates(this);
    }
}
