package com.example.iteachprofessor;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import java.util.concurrent.ExecutionException;

import dao.conectarBD;
import model.Professor;
import utils.DadosProf;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    EditText txtLogin, txtSenha;
    Button btnLogar;

    Professor profTela;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        txtLogin = (EditText) findViewById(R.id.txtLogin);
        txtSenha = (EditText) findViewById(R.id.txtSenha);

        btnLogar = (Button) findViewById(R.id.btnLogar);

        profTela = new Professor();

        btnLogar.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {

        switch (v.getId())
        {
            case R.id.btnLogar:

                try {
                conectarBD logar = new conectarBD(this);

                profTela.setEmail_prof(txtLogin.getText().toString());
                profTela.setPass_prof(txtSenha.getText().toString());
                logar.setProfClass(profTela);
                

                    logar.execute(0).get();

                      if (logar.getLogin() == true)
                    {
                        Intent telaMinhaCarteira = new Intent(this, MinhaCarteira.class);
                        startActivity(telaMinhaCarteira);
                    }
                    else
                    {
                        profTela = new Professor();
                    }


                } catch (ExecutionException e) {
                    e.printStackTrace();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

                break;
        }
    }
}
