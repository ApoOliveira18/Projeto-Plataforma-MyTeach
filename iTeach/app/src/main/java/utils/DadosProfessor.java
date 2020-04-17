package utils;

abstract public class DadosProfessor {
        private static String nome;
        private static int qtdCursos;
        private static  Double Total;

    public static String getNome() {
        return nome;
    }

    public static void setNome(String nome) {
        DadosProfessor.nome = nome;
    }

    public static int getQtdCursos() {
        return qtdCursos;
    }

    public static void setQtdCursos(int qtdCursos) {
        DadosProfessor.qtdCursos = qtdCursos;
    }

    public static Double getTotal() {
        return Total;
    }

    public static void setTotal(Double total) {
        Total = total;
    }
}
