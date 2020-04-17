package utils;

abstract public class DadosProf {
    private static  int id_prof;

    public static int getId_prof() {
        return id_prof;
    }

    public static void setId_prof(int id_prof) {
        DadosProf.id_prof = id_prof;
    }
}
