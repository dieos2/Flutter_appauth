class Noticia {
  bool Checked;
  String fotoGestor;
  bool TemAudio;
  bool TemVideo;
  int numeroComentarios;
  String creditoFoto;
  int id;
  int id_site;
  int id_versao;
  int id_StatusPublicacao;
  String data_pub;
  int id_Materia;
  int id_VersaoTipo;
  int id_editor;
  int id_Status;
  String chapeu;
  String titulo;
  String chamada;
  String data_edicao;
  String status;
  String nome_foto;
  String orientacao_foto;
  int id_galeria;
  String texto;
  int views;
  int likes;
  int dislikes;
  int id_instituicao;
  String sigla;
  String nome_instituicao;
  String UserName;
  String FirstName;
  String LastName;
  String nome_grupo;
  String sigla_grupo;
  String FotoUsuario;
  int idUsuarioRede;
  String site;
  String url;

  Noticia( this.Checked, this.fotoGestor, this.TemAudio, this.TemVideo, this.numeroComentarios, this.creditoFoto, this.id,
  this.id_site,
  this.id_versao,
  this.id_StatusPublicacao,
  this.data_pub,
  this.id_Materia,
  this.id_editor,
  this.id_Status,
  this.chapeu,
  this.titulo,
  this.chamada,
  this.data_edicao,
  this.status,
  this.nome_foto,
  this.orientacao_foto,
  this.id_galeria,
  this.texto,
  this.views,
  this.likes,
  this.dislikes,
  this.id_instituicao,
  this.sigla,
  this.nome_instituicao,
  this.UserName,
  this.FirstName,
  this.LastName,
  this.nome_grupo,
  this.sigla_grupo,
  this.FotoUsuario,
  this.idUsuarioRede,
  this.site,
  this.url);

  Noticia.fromJson(Map<String, dynamic> json)
      : Checked = json['Checked'],
        fotoGestor = json['fotoGestor'],
        TemAudio = json['TemAudio'],
        TemVideo = json['TemVideo'],
        numeroComentarios = json['numeroComentarios'],
        creditoFoto = json['creditoFoto'],
        id = json['id'],
        id_site = json['id_site'],
        id_versao = json['id_versao'],
        id_StatusPublicacao = json['id_StatusPublicacao'],
        data_pub = json['data_pub'],
        id_Materia = json['id_Materia'],
        id_VersaoTipo = json['id_VersaoTipo'],
        id_editor = json['id_editor'],
        id_Status = json['id_Status'],
        chapeu = json['chapeu'],
        titulo = json['titulo'],
        chamada = json['chamada'],
        data_edicao = json['data_edicao'],
        status = json['status'],
        nome_foto = json['nome_foto'],
        orientacao_foto = json['orientacao_foto'],
        id_galeria = json['id_galeria'],
        texto = json['texto'],
        views = json['views'],
        likes = json['likes'],
        dislikes = json['dislikes'],
        id_instituicao = json['id_instituicao'],
        sigla = json['sigla'],
        nome_instituicao = json['nome_instituicao'],
        UserName = json['UserName'],
        FirstName = json['FirstName'],
        LastName = json['LastName'],
        nome_grupo = json['LastName'],
        sigla_grupo = json['sigla_grupo'],
        FotoUsuario = json['FotoUsuario'],
        idUsuarioRede = json['idUsuarioRede'],
        site = json['site'],
        url = json['url'];

  Map<String, dynamic> toJson() => {
  'Checked' : Checked,
  'fotoGestor' : fotoGestor,
  'titulo' : titulo,
    'texto': texto,
    'nome_foto': nome_foto,
    'id_galeria': id_galeria
      };
}
