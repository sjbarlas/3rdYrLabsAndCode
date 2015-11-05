package com.example.saira.mydb;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
/*import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;*/

public class myDB {


        public static final String KEY_ROWID = "_id";
        public static final String TASK_NAME = "task_name";
        public static final String TASK_DESCRIPTION = "task_description";
        public static final String COMPLETE_STATUS = "complete_status";

        private static final int DATABASE_VERSION = 1;

        private static final String DATABASE_CREATE =
                "CREATE TABLE TASK (RowID VARCHAR(18) primary key autoincrement,"
                        + "Task_Name VARCHAR(18) not null"
                        + "Text_Description VARCHAR(18) not null"
                        + "Complete_Status VARCHAR(18) not null)";

        private final Context context;
        private SQLiteDatabase SQLdb;
        private MyDatabaseHelper DBHelper;


    public myDB(Context ctx) {
        this.context = ctx;
        DBHelper = new MyDatabaseHelper(context);
    }

    private static class MyDatabaseHelper extends SQLiteOpenHelper {
        MyDatabaseHelper(Context context) {
            super(context, DATABASE_CREATE, null, 1);
        }

        @Override
        public void onCreate(SQLiteDatabase SQLdb) {
            SQLdb.execSQL(DATABASE_CREATE);
        }

        @Override
        public void onUpgrade(SQLiteDatabase SQLdb, int oldVersion, int newVersion) {
            SQLdb.execSQL(DATABASE_CREATE);
        }
    }

    public myDB open() throws SQLException {
        SQLdb = DBHelper.getWritableDatabase();
        return this;
    }

    public void close() {
        DBHelper.close();
    }

    public long insertSomething(String KEY_ROWID, String TASK_NAME, String TASK_DESCRIPTION, String COMPLETE_STATUS) {
        ContentValues initialValues = new ContentValues();
        initialValues.put(KEY_ROWID, "123");
        initialValues.put(TASK_NAME, "something");
        initialValues.put(TASK_DESCRIPTION, "maybe");
        initialValues.put(COMPLETE_STATUS, "0");

        return SQLdb.insert(DATABASE_CREATE, null, initialValues);
    }

    /*public Cursor selectSomething(long rowId) throws SQLException
    {
        Cursor mCursor = SQLdb.query();
    }*/

    public Cursor getSomething(long rowId) throws SQLException {
        Cursor mCursor = SQLdb.query(true, DATABASE_CREATE, new String[]
                {
                        KEY_ROWID,
                        TASK_NAME,
                        TASK_DESCRIPTION,
                        COMPLETE_STATUS,
                },

                KEY_ROWID + "=" +  rowId, null, null, null, null, null);

        if(mCursor != null) {
            mCursor.moveToFirst();
        }

        return mCursor;
    }
}