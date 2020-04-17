package com.example.iteachprofessor;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.TextView;

import dao.conectarBD;
import model.Curso;
import model.Pagamento;
import model.Professor;
import utils.DadosProfessor;

public class MinhaCarteira extends AppCompatActivity {

    TextView lblNome, lblPagamento, lblQtd;

    Curso cursoTela = new Curso();
    Pagamento pagamentoTela = new Pagamento();
    Professor profTela = new Professor();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_minha_carteira);

        lblNome = findViewById(R.id.lblNome);
        lblPagamento = findViewById(R.id.lblPagamento);
        lblQtd = findViewById(R.id.lblQtd);


        //1 passo:
        conectarBD Carteira = new conectarBD(this);



    }
}
