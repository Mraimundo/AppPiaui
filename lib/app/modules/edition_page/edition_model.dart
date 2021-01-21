class EditionModel {
  int id;
  Acf acf;

  EditionModel({this.id, this.acf});

  EditionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    acf = json['acf'] != null ? new Acf.fromJson(json['acf']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.acf != null) {
      data['acf'] = this.acf.toJson();
    }
    return data;
  }
}

class Acf {
  bool ocultarHome;
  bool ocultarEsquinas;
  bool ocultarApp;
  String mes;
  String ano;
  Capa capa;
  bool indice;
  String valor;
  String colaboradoresTextEditor;
  String appleId;
  String playstoreId;
  List<String> publicarApp;
  bool materias;
  List<LayoutHomepage> layoutHomepage;
  List<LayoutHomepageLateralDireita> layoutHomepageLateralDireita;
  List<LayoutHomepageLateralEsquerda> layoutHomepageLateralEsquerda;

  Acf(
      {this.ocultarHome,
      this.ocultarEsquinas,
      this.ocultarApp,
      this.mes,
      this.ano,
      this.capa,
      this.indice,
      this.valor,
      this.colaboradoresTextEditor,
      this.appleId,
      this.playstoreId,
      this.publicarApp,
      this.materias,
      this.layoutHomepage,
      this.layoutHomepageLateralDireita,
      this.layoutHomepageLateralEsquerda});

  Acf.fromJson(Map<String, dynamic> json) {
    ocultarHome = json['ocultar_home'];
    ocultarEsquinas = json['ocultar_esquinas'];
    ocultarApp = json['ocultar_app'];
    mes = json['mes'];
    ano = json['ano'];
    capa = json['capa'] != null ? new Capa.fromJson(json['capa']) : null;
    indice = json['indice'];
    valor = json['valor'];
    colaboradoresTextEditor = json['colaboradores_text_editor'];
    appleId = json['apple_id'];
    playstoreId = json['playstore_id'];
    publicarApp = json['publicar_app'].cast<String>();
    materias = json['materias'];
    if (json['layout_homepage'] != null) {
      layoutHomepage = new List<LayoutHomepage>();
      json['layout_homepage'].forEach((v) {
        layoutHomepage.add(new LayoutHomepage.fromJson(v));
      });
    }
    if (json['layout_homepage_lateral_direita'] != null) {
      layoutHomepageLateralDireita = new List<LayoutHomepageLateralDireita>();
      json['layout_homepage_lateral_direita'].forEach((v) {
        layoutHomepageLateralDireita
            .add(new LayoutHomepageLateralDireita.fromJson(v));
      });
    }
    if (json['layout_homepage_lateral_esquerda'] != null) {
      layoutHomepageLateralEsquerda = new List<LayoutHomepageLateralEsquerda>();
      json['layout_homepage_lateral_esquerda'].forEach((v) {
        layoutHomepageLateralEsquerda
            .add(new LayoutHomepageLateralEsquerda.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ocultar_home'] = this.ocultarHome;
    data['ocultar_esquinas'] = this.ocultarEsquinas;
    data['ocultar_app'] = this.ocultarApp;
    data['mes'] = this.mes;
    data['ano'] = this.ano;
    if (this.capa != null) {
      data['capa'] = this.capa.toJson();
    }
    data['indice'] = this.indice;
    data['valor'] = this.valor;
    data['colaboradores_text_editor'] = this.colaboradoresTextEditor;
    data['apple_id'] = this.appleId;
    data['playstore_id'] = this.playstoreId;
    data['publicar_app'] = this.publicarApp;
    data['materias'] = this.materias;
    if (this.layoutHomepage != null) {
      data['layout_homepage'] =
          this.layoutHomepage.map((v) => v.toJson()).toList();
    }
    if (this.layoutHomepageLateralDireita != null) {
      data['layout_homepage_lateral_direita'] =
          this.layoutHomepageLateralDireita.map((v) => v.toJson()).toList();
    }
    if (this.layoutHomepageLateralEsquerda != null) {
      data['layout_homepage_lateral_esquerda'] =
          this.layoutHomepageLateralEsquerda.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Capa {
  int iD;
  int id;
  String title;
  String filename;
  String url;
  String alt;
  String author;
  String description;
  String caption;
  String name;
  String date;
  String modified;
  String mimeType;
  String type;
  String icon;
  int width;
  int height;
  Sizes sizes;

  Capa(
      {this.iD,
      this.id,
      this.title,
      this.filename,
      this.url,
      this.alt,
      this.author,
      this.description,
      this.caption,
      this.name,
      this.date,
      this.modified,
      this.mimeType,
      this.type,
      this.icon,
      this.width,
      this.height,
      this.sizes});

  Capa.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    id = json['id'];
    title = json['title'];
    filename = json['filename'];
    url = json['url'];
    alt = json['alt'];
    author = json['author'];
    description = json['description'];
    caption = json['caption'];
    name = json['name'];
    date = json['date'];
    modified = json['modified'];
    mimeType = json['mime_type'];
    type = json['type'];
    icon = json['icon'];
    width = json['width'];
    height = json['height'];
    sizes = json['sizes'] != null ? new Sizes.fromJson(json['sizes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['id'] = this.id;
    data['title'] = this.title;
    data['filename'] = this.filename;
    data['url'] = this.url;
    data['alt'] = this.alt;
    data['author'] = this.author;
    data['description'] = this.description;
    data['caption'] = this.caption;
    data['name'] = this.name;
    data['date'] = this.date;
    data['modified'] = this.modified;
    data['mime_type'] = this.mimeType;
    data['type'] = this.type;
    data['icon'] = this.icon;
    data['width'] = this.width;
    data['height'] = this.height;
    if (this.sizes != null) {
      data['sizes'] = this.sizes.toJson();
    }
    return data;
  }
}

class Sizes {
  String thumbnail;
  int thumbnailWidth;
  int thumbnailHeight;
  String medium;
  int mediumWidth;
  int mediumHeight;
  String mediumLarge;
  int mediumLargeWidth;
  int mediumLargeHeight;
  String large;
  int largeWidth;
  int largeHeight;

  Sizes(
      {this.thumbnail,
      this.thumbnailWidth,
      this.thumbnailHeight,
      this.medium,
      this.mediumWidth,
      this.mediumHeight,
      this.mediumLarge,
      this.mediumLargeWidth,
      this.mediumLargeHeight,
      this.large,
      this.largeWidth,
      this.largeHeight});

  Sizes.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    thumbnailWidth = json['thumbnail-width'];
    thumbnailHeight = json['thumbnail-height'];
    medium = json['medium'];
    mediumWidth = json['medium-width'];
    mediumHeight = json['medium-height'];
    mediumLarge = json['medium_large'];
    mediumLargeWidth = json['medium_large-width'];
    mediumLargeHeight = json['medium_large-height'];
    large = json['large'];
    largeWidth = json['large-width'];
    largeHeight = json['large-height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumbnail'] = this.thumbnail;
    data['thumbnail-width'] = this.thumbnailWidth;
    data['thumbnail-height'] = this.thumbnailHeight;
    data['medium'] = this.medium;
    data['medium-width'] = this.mediumWidth;
    data['medium-height'] = this.mediumHeight;
    data['medium_large'] = this.mediumLarge;
    data['medium_large-width'] = this.mediumLargeWidth;
    data['medium_large-height'] = this.mediumLargeHeight;
    data['large'] = this.large;
    data['large-width'] = this.largeWidth;
    data['large-height'] = this.largeHeight;
    return data;
  }
}

class LayoutHomepage {
  bool customizarInformacoes;
  String linhaSelecao;
  String layoutDoPost;
  String titulo;
  bool imagem;
  String embedPodcast;
  String embedWidget;
  String linhaFina;
  String linkRelacionado;
  bool informacoes;
  String linkPublicacao;
  var publicacoesRelacionadasModular;
  String linkPublicacaoDois;
  bool publicacoesRelacionadasModularDois;
  String linkPublicacaoTres;
  bool publicacoesRelacionadasModularTres;
  String linkLupa;
  String tituloCustomizada;
  String gravataCustomizada;
  String descricaoCustomizada;
  String imagemDeDestaqueCustomizada;
  bool arquivovideoCustomizada;
  String autorCustomizada;
  String linkLupaDois;
  String tituloCustomizadaDois;
  String gravataCustomizadaDois;
  String descricaoCustomizadaDois;
  var imagemDeDestaqueCustomizadaDois;
  String autorCustomizadaDois;
  String linkLupaTres;
  String tituloCustomizadaTres;
  String gravataCustomizadaTres;
  String descricaoCustomizadaTres;
  bool imagemDeDestaqueCustomizadaTres;
  String autorCustomizadaTres;

  LayoutHomepage(
      {this.customizarInformacoes,
      this.linhaSelecao,
      this.layoutDoPost,
      this.titulo,
      this.imagem,
      this.embedPodcast,
      this.embedWidget,
      this.linhaFina,
      this.linkRelacionado,
      this.informacoes,
      this.linkPublicacao,
      this.publicacoesRelacionadasModular,
      this.linkPublicacaoDois,
      this.publicacoesRelacionadasModularDois,
      this.linkPublicacaoTres,
      this.publicacoesRelacionadasModularTres,
      this.linkLupa,
      this.tituloCustomizada,
      this.gravataCustomizada,
      this.descricaoCustomizada,
      this.imagemDeDestaqueCustomizada,
      this.arquivovideoCustomizada,
      this.autorCustomizada,
      this.linkLupaDois,
      this.tituloCustomizadaDois,
      this.gravataCustomizadaDois,
      this.descricaoCustomizadaDois,
      this.imagemDeDestaqueCustomizadaDois,
      this.autorCustomizadaDois,
      this.linkLupaTres,
      this.tituloCustomizadaTres,
      this.gravataCustomizadaTres,
      this.descricaoCustomizadaTres,
      this.imagemDeDestaqueCustomizadaTres,
      this.autorCustomizadaTres});

  LayoutHomepage.fromJson(Map<String, dynamic> json) {
    customizarInformacoes = json['customizar_informacoes'];
    linhaSelecao = json['linha_selecao'];
    layoutDoPost = json['layout_do_post'];
    titulo = json['titulo'];
    imagem = json['imagem'];
    embedPodcast = json['embed_podcast'];
    embedWidget = json['embed_widget'];
    linhaFina = json['linha_fina'];
    linkRelacionado = json['link_relacionado'];
    informacoes = json['informacoes'];
    linkPublicacao = json['link_publicacao'];
    publicacoesRelacionadasModular = json['publicacoes_relacionadas_modular'];
    linkPublicacaoDois = json['link_publicacao_dois'];
    publicacoesRelacionadasModularDois =
        json['publicacoes_relacionadas_modular_dois'];
    linkPublicacaoTres = json['link_publicacao_tres'];
    publicacoesRelacionadasModularTres =
        json['publicacoes_relacionadas_modular_tres'];
    linkLupa = json['link_lupa'];
    tituloCustomizada = json['titulo_customizada'];
    gravataCustomizada = json['gravata_customizada'];
    descricaoCustomizada = json['descricao_customizada'];
    imagemDeDestaqueCustomizada = json['imagem_de_destaque_customizada'];
    arquivovideoCustomizada = json['arquivovideo_customizada'];
    autorCustomizada = json['autor_customizada'];
    linkLupaDois = json['link_lupa_dois'];
    tituloCustomizadaDois = json['titulo_customizada_dois'];
    gravataCustomizadaDois = json['gravata_customizada_dois'];
    descricaoCustomizadaDois = json['descricao_customizada_dois'];
    imagemDeDestaqueCustomizadaDois =
        json['imagem_de_destaque_customizada_dois'];
    autorCustomizadaDois = json['autor_customizada_dois'];
    linkLupaTres = json['link_lupa_tres'];
    tituloCustomizadaTres = json['titulo_customizada_tres'];
    gravataCustomizadaTres = json['gravata_customizada_tres'];
    descricaoCustomizadaTres = json['descricao_customizada_tres'];
    imagemDeDestaqueCustomizadaTres =
        json['imagem_de_destaque_customizada_tres'];
    autorCustomizadaTres = json['autor_customizada_tres'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customizar_informacoes'] = this.customizarInformacoes;
    data['linha_selecao'] = this.linhaSelecao;
    data['layout_do_post'] = this.layoutDoPost;
    data['titulo'] = this.titulo;
    data['imagem'] = this.imagem;
    data['embed_podcast'] = this.embedPodcast;
    data['embed_widget'] = this.embedWidget;
    data['linha_fina'] = this.linhaFina;
    data['link_relacionado'] = this.linkRelacionado;
    data['informacoes'] = this.informacoes;
    data['link_publicacao'] = this.linkPublicacao;
    data['publicacoes_relacionadas_modular'] =
        this.publicacoesRelacionadasModular;
    data['link_publicacao_dois'] = this.linkPublicacaoDois;
    data['publicacoes_relacionadas_modular_dois'] =
        this.publicacoesRelacionadasModularDois;
    data['link_publicacao_tres'] = this.linkPublicacaoTres;
    data['publicacoes_relacionadas_modular_tres'] =
        this.publicacoesRelacionadasModularTres;
    data['link_lupa'] = this.linkLupa;
    data['titulo_customizada'] = this.tituloCustomizada;
    data['gravata_customizada'] = this.gravataCustomizada;
    data['descricao_customizada'] = this.descricaoCustomizada;
    data['imagem_de_destaque_customizada'] = this.imagemDeDestaqueCustomizada;
    data['arquivovideo_customizada'] = this.arquivovideoCustomizada;
    data['autor_customizada'] = this.autorCustomizada;
    data['link_lupa_dois'] = this.linkLupaDois;
    data['titulo_customizada_dois'] = this.tituloCustomizadaDois;
    data['gravata_customizada_dois'] = this.gravataCustomizadaDois;
    data['descricao_customizada_dois'] = this.descricaoCustomizadaDois;
    data['imagem_de_destaque_customizada_dois'] =
        this.imagemDeDestaqueCustomizadaDois;
    data['autor_customizada_dois'] = this.autorCustomizadaDois;
    data['link_lupa_tres'] = this.linkLupaTres;
    data['titulo_customizada_tres'] = this.tituloCustomizadaTres;
    data['gravata_customizada_tres'] = this.gravataCustomizadaTres;
    data['descricao_customizada_tres'] = this.descricaoCustomizadaTres;
    data['imagem_de_destaque_customizada_tres'] =
        this.imagemDeDestaqueCustomizadaTres;
    data['autor_customizada_tres'] = this.autorCustomizadaTres;
    return data;
  }
}

class LayoutHomepageLateralDireita {
  bool mostrarImagemDestaque;
  bool customizarInformacoes;
  String linkPublicacao;
  String linkPublicacaoRelacionada;
  String tituloCustomizada;
  String gravataCustomizada;
  var imagemPublicacaoCustomizada;
  String descricaoCustomizada;
  String autorCustomizada;

  LayoutHomepageLateralDireita(
      {this.mostrarImagemDestaque,
      this.customizarInformacoes,
      this.linkPublicacao,
      this.linkPublicacaoRelacionada,
      this.tituloCustomizada,
      this.gravataCustomizada,
      this.imagemPublicacaoCustomizada,
      this.descricaoCustomizada,
      this.autorCustomizada});

  LayoutHomepageLateralDireita.fromJson(Map<String, dynamic> json) {
    mostrarImagemDestaque = json['mostrar_imagem_destaque'];
    customizarInformacoes = json['customizar_informacoes'];
    linkPublicacao = json['link_publicacao'];
    linkPublicacaoRelacionada = json['link_publicacao_relacionada'];
    tituloCustomizada = json['titulo_customizada'];
    gravataCustomizada = json['gravata_customizada'];
    imagemPublicacaoCustomizada = json['imagem_publicacao_customizada'];
    descricaoCustomizada = json['descricao_customizada'];
    autorCustomizada = json['autor_customizada'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mostrar_imagem_destaque'] = this.mostrarImagemDestaque;
    data['customizar_informacoes'] = this.customizarInformacoes;
    data['link_publicacao'] = this.linkPublicacao;
    data['link_publicacao_relacionada'] = this.linkPublicacaoRelacionada;
    data['titulo_customizada'] = this.tituloCustomizada;
    data['gravata_customizada'] = this.gravataCustomizada;
    data['imagem_publicacao_customizada'] = this.imagemPublicacaoCustomizada;
    data['descricao_customizada'] = this.descricaoCustomizada;
    data['autor_customizada'] = this.autorCustomizada;
    return data;
  }
}

class LayoutHomepageLateralEsquerda {
  bool mostrarImagemDestaque;
  bool customizarInformacoes;
  String linkPublicacao;
  String linkPublicacaoRelacionada;
  String tituloCustomizada;
  var imagemPublicacaoCustomizada;
  String gravataCustomizada;
  String descricaoCustomizada;
  String autorCustomizada;

  LayoutHomepageLateralEsquerda(
      {this.mostrarImagemDestaque,
      this.customizarInformacoes,
      this.linkPublicacao,
      this.linkPublicacaoRelacionada,
      this.tituloCustomizada,
      this.imagemPublicacaoCustomizada,
      this.gravataCustomizada,
      this.descricaoCustomizada,
      this.autorCustomizada});

  LayoutHomepageLateralEsquerda.fromJson(Map<String, dynamic> json) {
    mostrarImagemDestaque = json['mostrar_imagem_destaque'];
    customizarInformacoes = json['customizar_informacoes'];
    linkPublicacao = json['link_publicacao'];
    linkPublicacaoRelacionada = json['link_publicacao_relacionada'];
    tituloCustomizada = json['titulo_customizada'];
    imagemPublicacaoCustomizada = json['imagem_publicacao_customizada'];
    gravataCustomizada = json['gravata_customizada'];
    descricaoCustomizada = json['descricao_customizada'];
    autorCustomizada = json['autor_customizada'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mostrar_imagem_destaque'] = this.mostrarImagemDestaque;
    data['customizar_informacoes'] = this.customizarInformacoes;
    data['link_publicacao'] = this.linkPublicacao;
    data['link_publicacao_relacionada'] = this.linkPublicacaoRelacionada;
    data['titulo_customizada'] = this.tituloCustomizada;
    data['imagem_publicacao_customizada'] = this.imagemPublicacaoCustomizada;
    data['gravata_customizada'] = this.gravataCustomizada;
    data['descricao_customizada'] = this.descricaoCustomizada;
    data['autor_customizada'] = this.autorCustomizada;
    return data;
  }
}
