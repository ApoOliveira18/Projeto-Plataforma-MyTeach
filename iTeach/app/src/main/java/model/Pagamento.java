package model;

public class Pagamento {
    private int id_prof;
    private int id_pagtprof;
    private String pagt_pagtprof;

    public int getId_pagtprof() {
        return id_pagtprof;
    }

    public void setId_pagtprof(int id_pagtprof) {
        this.id_pagtprof = id_pagtprof;
    }

    public int getId_prof() {
        return id_prof;
    }

    public void setId_prof(int id_prof) {
        this.id_prof = id_prof;
    }

    public String getPagt_pagtprof() {
        return pagt_pagtprof;
    }

    public void setPagt_pagtprof(String pagt_pagtprof) {
        this.pagt_pagtprof = pagt_pagtprof;
    }
}
