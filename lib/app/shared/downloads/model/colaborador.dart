class Colaborador {
  String twitter_colaborador;
  String bio_resumida;
  String nome;
  String foto;

  Colaborador(
      this.twitter_colaborador, this.bio_resumida, this.nome, this.foto);

  Map toJson() {
    return {
      'twitter_colaborador': twitter_colaborador,
      'bio_resumida': bio_resumida,
      'nome': nome,
      'foto': foto,
    };
  }
}
