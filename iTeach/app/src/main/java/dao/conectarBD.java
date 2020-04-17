package dao;


import android.app.ProgressDialog;
import android.content.Context;
import android.os.AsyncTask;
import android.widget.Toast;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Pagamento;
import model.Professor;
import utils.DadosProf;
import utils.criptografia;

public class conectarBD extends AsyncTask<Integer, Object, Boolean> {



    //variavel para fazer conexão com o MySQL
    Connection conexao;

    //variavel para guardar a tela que guardou a classe
    Context tela;

    //variavel para criar uma caixa de mensagem
    ProgressDialog dialogo;

    //variavel para guardar opção do usu
    int op;

    private Professor profClass;
    private Pagamento pagamentoClass;

    public Professor getProfClass() {
        return profClass;
    }

    public void setProfClass(Professor profClass) {
        this.profClass = profClass;
    }

    private int id_prof = 0;

    //guardar a classe criptografia que criamos no utils
    criptografia cripto;


    //linkar tela com a classe
    public conectarBD(Context tela)
    {
        super();
        this.tela = tela;
        cripto = new criptografia("MyTeach");
    }

    //método para criar conexao com MySQL
    public Boolean connect()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conexao = DriverManager.getConnection("jdbc:mysql://172.16.62.153:3306/MyTeach","root","03112002");
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }

    }

    //método para fechar conexão com MySQL
    public void disconnect()
    {
        try {
            conexao.close();

        }catch (SQLException e){

            e.printStackTrace();
        }
    }


    @Override
    protected Boolean doInBackground(Integer... integers) {
        //variável para armazenar o comando MySQL
        Boolean resp =null;

        //opção do usuário
        op = integers[0];

        //estabelece conexao com MySql
        connect();

        //escolher o comando MySQL
        switch (op)
        {
            case 0:
                resp = logar();
                break;
            case 1:
                resp = MeusCursos();
                break;
        }
        return resp;

    }

    @Override
    protected void onPreExecute() {
        super.onPreExecute();
        dialogo = new ProgressDialog(tela);
        dialogo.setMessage("Aguarde, conectando...");
        dialogo.show();
    }

    @Override
    protected void onPostExecute(Boolean aBoolean) {
        super.onPostExecute(aBoolean);

        switch (op){
            case 0:
                if (aBoolean == false)
                    Toast.makeText(tela, "Professor não encontrado", Toast.LENGTH_SHORT).show();
                break;
            case 1:
                if(aBoolean ==false)
                    Toast.makeText(tela, "Dados nõa encontrados", Toast.LENGTH_SHORT).show();
                break;
        }

        dialogo.dismiss();
        disconnect();

    }

    private Boolean login;

    public Boolean getLogin() {
        return login;
    }

    public void setLogin(Boolean login) {
        this.login = login;
    }

    public Boolean logar() {

        try {
            String sql = "select * from professor where email_prof=? and pass_prof=?";
            PreparedStatement comando = conexao.prepareStatement(sql);

            comando.setString(1, cripto.encrypt(profClass.getEmail_prof().getBytes()));
            comando.setString(2, cripto.encrypt(profClass.getPass_prof().getBytes()));

            ResultSet tabelaMemoria = comando.executeQuery();

            if (tabelaMemoria.next()) {
                //armazenar dados para exibir depois
                profClass.setId_prof(tabelaMemoria.getInt("id_prof"));
                profClass.setNome_prof(tabelaMemoria.getString("nome_prof"));
                DadosProf.setId_prof(tabelaMemoria.getInt("id_prof"));
                login = true;
                return true;

            } else {
                profClass = null;
                login = false;
                return false;
            }

        } catch (SQLException e) {
            e.printStackTrace();

            login = false;
            return false;
        }
    }

    public Boolean MeusCursos()
    {
        try {
            String sql = "select count(curso.id_curso) from curso inner join professor on professor.id_prof = curso.id_prof where professor.id_prof = ? ";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1,id_prof);

            ResultSet tabelaMemoria = comando.executeQuery();

             // COMO SALVAR A RESPOSTA DO SELECT


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Boolean Pagamento()
    {
       try {
           String sql = "select (pagamento.pagt_pagtprof) * pagamento inner join professor on professor.id_prof = curso.id_prof where professor.id_prof = ?";
           PreparedStatement comando = conexao.prepareStatement(sql);
           comando.setInt(1, DadosProf.getId_prof());
           ResultSet tabelaMemoria = comando.executeQuery();

           pagamentoClass = new Pagamento();

           if(tabelaMemoria.next()){
               pagamentoClass.setPagt_pagtprof(cripto.decrypt(tabelaMemoria.getString("pagt_pagtprof")));
           }

        } catch (SQLException e) {
            e.printStackTrace();

            pagamentoClass = null;
            return  false;
        }
        return false;
    }


}