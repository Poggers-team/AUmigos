package br.org.aumigos.model;
import java.time.LocalDate;
import java.util.Base64;

public class Animal {
    private String especie;
    private String genero;
    private String raca;
    private String cor;
    private String idade;
    private String porte;
    private String nomePet;
    private String historiaPet;
    private String cidade;
    private String endereco;
    private String nomeContato;
    private String emailContato;
    private String telefoneContato;
    private String cuidados;
    private String temperamento;
    private String socializacao;
    private byte[] foto;
    private String fotoBase64;
    private LocalDate dataCriacao;

    public Animal(String especie, String genero, String raca, String cor, String idade, String porte,
                  String nomePet, String historiaPet, String cidade, String endereco,
                  String nomeContato, String emailContato, String telefoneContato,
                  String cuidados, String temperamento, String socializacao, byte[] foto, LocalDate dataCriacao) {

        this.especie = especie;
        this.genero = genero;
        this.raca = raca;
        this.cor = cor;
        this.idade = idade;
        this.porte = porte;
        this.nomePet = nomePet;
        this.historiaPet = historiaPet;
        this.cidade = cidade;
        this.endereco = endereco;
        this.nomeContato = nomeContato;
        this.emailContato = emailContato;
        this.telefoneContato = telefoneContato;
        this.cuidados = cuidados;
        this.temperamento = temperamento;
        this.socializacao = socializacao;
        this.foto = foto;
        this.dataCriacao = dataCriacao;

        if (foto != null) {
            this.fotoBase64 = Base64.getEncoder().encodeToString(foto);
        }
    }

    public Animal(String nomePet, String cidade, byte[] foto, LocalDate dataCriacao) {
        this.nomePet = nomePet;
        this.cidade = cidade;
        this.foto = foto;
        this.dataCriacao = dataCriacao;

        if (foto != null) {
            this.fotoBase64 = Base64.getEncoder().encodeToString(foto);
        }
    }

    public String getEspecie() {
        return especie;
    }

    public void setEspecie(String especie) {
        this.especie = especie;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getRaca() {
        return raca;
    }

    public void setRaca(String raca) {
        this.raca = raca;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getIdade() {
        return idade;
    }

    public void setIdade(String idade) {
        this.idade = idade;
    }

    public String getPorte() {
        return porte;
    }

    public void setPorte(String porte) {
        this.porte = porte;
    }

    public String getNomePet() {
        return nomePet;
    }

    public void setNomePet(String nomePet) {
        this.nomePet = nomePet;
    }

    public String getHistoriaPet() {
        return historiaPet;
    }

    public void setHistoriaPet(String historiaPet) {
        this.historiaPet = historiaPet;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getNomeContato() {
        return nomeContato;
    }

    public void setNomeContato(String nomeContato) {
        this.nomeContato = nomeContato;
    }

    public String getEmailContato() {
        return emailContato;
    }

    public void setEmailContato(String emailContato) {
        this.emailContato = emailContato;
    }

    public String getTelefoneContato() {
        return telefoneContato;
    }

    public void setTelefoneContato(String telefoneContato) {
        this.telefoneContato = telefoneContato;
    }

    public String getCuidados() {
        return cuidados;
    }

    public void setCuidados(String cuidados) {
        this.cuidados = cuidados;
    }

    public String getTemperamento() {
        return temperamento;
    }

    public void setTemperamento(String temperamento) {
        this.temperamento = temperamento;
    }

    public String getSocializacao() {
        return socializacao;
    }

    public void setSocializacao(String socializacao) {
        this.socializacao = socializacao;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;

        if (foto != null) {
            this.fotoBase64 = Base64.getEncoder().encodeToString(foto);
        }
    }

    public String getFotoBase64() {
        return fotoBase64;
    }

    public void setFotoBase64(String fotoBase64) {
        this.fotoBase64 = fotoBase64;
    }

    public LocalDate getDataCriacao() {
        return dataCriacao;
    }

    public void setDataCriacao(LocalDate dataCriacao) {
        this.dataCriacao = dataCriacao;
    }

    public long getDiasAtras() {
        if (dataCriacao != null) {
            return java.time.temporal.ChronoUnit.DAYS.between(dataCriacao, LocalDate.now());
        }
        return 0;
    }
}
