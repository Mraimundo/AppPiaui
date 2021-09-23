import 'package:flutter/material.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:piaui_app/app/modules/internal_magazine/components/autor_internal_article.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';

class ListInternalArticles extends StatefulWidget {
  @override
  _ListInternalArticlesState createState() => _ListInternalArticlesState();
}

class _ListInternalArticlesState extends State<ListInternalArticles> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 29),
      child: Column(
        children: [
          DropCapText(
            'Fernando de Barros e Silva [Engolindo os miúdos, p. 7] é repórter dapiauíe apresentador do podcast Foro de Teresina. Ilustração de Allan Sieber. Marcos Amorozo [Escrita frenética, p. 9] é estagiário da piauí. Artur Nicoceli [Os sons dos Gilsons, p. 11] é jornalista, editor-assistente de conteúdos digitais na revista Forbes Brasil. João Moreira Salles [O que queremos?, p. 12], documentarista, é editor fundador da piauí. Dirigiu Santiago, Entreatos, Notícias de uma Guerra Particular e Nelson Freire. Ilustração de Vito Quintans. Vinhetas de Carla Caffé. Edição de texto de Denise Pegorim. Consuelo Dieguez [O herdeiro, p. 30], repórter da piauí, é autora da coletânea de perfis Bilhões e Lágrimas (Companhia das Letras). Leandro Assis [Cartuns a partir da p. 32], roteirista de tevê e cinema, é coautor das séries de HQ Os Santos e Confinada, que podem ser lidas no Instagram e no Twitter. Armando Sartori [A Orcrim-FB, p. 38] é jornalista e diretor da Editora Manifesto. Foi secretário de redação do jornal Movimento e editor da revista Retrato do Brasil. Raimundo Rodrigues Pereira, coautor da reportagem, é jornalista e diretor da Editora Manifesto. Foi redator-chefe dos jornais Opinião e Movimento e editor nas revistas Veja, Realidade e Retrato do Brasil. Reinaldo Figueiredo [A nova política é como o vinho, quanto mais velha melhor, p. 44] é desenhista, humorista, músico e um dos criadores do Casseta & Planeta. Camille Lichotti [“Ai, meu Deus”, p. 46] é estagiária da piauí. Fotografia de Pierre Duarte. Arthur Nestrovski [Música acima de tudo, Beethoven acima de todos, p. 50] é diretor artístico da Orquestra Sinfônica do Estado de São Paulo (Osesp), autor de Tudo Tem a Ver: Literatura e Música (Todavia), vencedor do Prêmio Açorianos de Literatura de 2020. No ano passado, lançou o disco Sarabanda, com Lívia Nestrovski. Benamê Kamu Almudras [Pós-verdade e carteiradas da identidade, p. 56], sob pseudônimo, é docente de graduação e de pós-graduação em uma universidade pública de São Paulo. Pedro Franz [O personagem, p. 60] é ilustrador e artista visual. A HQ foi produzida durante uma residência artística na Maison des Auteurs (em Angoulême, França), tendo o apoio da Cité Internationale de la Bande Dessinée et de l’Image. Isabel Wilkerson [Os nazistas e a aceleração das castas, p. 64] é jornalista norte-americana. Trecho de Casta: As Origens do Nosso Mal-Estar, a ser lançado neste mês pela Zahar. Tradução de Denise Bottmann e Carlos Alberto Medeiros. Elisangela Roxo [Eu existo!, p. 70], jornalista e mestre pelas universidades de Aarhus e Hamburgo, é autora da tese Black Is Digital: Afro-Brazilian Women and Identity on YouTube. Felipe Charbel [Lacunas, p. 76] é professor da Universidade Federal do Rio de Janeiro (UFRJ) e autor de Janelas Irreais: Um Diário de Releituras (Relicário Edições). Alfredo Fressia [Poesia, p. 79] é poeta uruguaio radicado em São Paulo. Recebeu o Prêmio Bartolomé Hidalgo, um dos mais importantes do Uruguai. É autor de Terra Incognita (Ediciones Caletita) e Sobre Roca Resbaladiza (Editorial Lisboa). Tradução do próprio autor. Ilustração de Gervasio Troche. Xico Sá [Todos amávamos a Love Story, p. 82] é jornalista e escritor, autor de O Livro das Mulheres Extraordinárias(Três Estrelas), entre outros. Ilustrações de Esquina por Andrés Sandoval.',
            style: TextStyle(
              height: 1.3,
              fontFamily: 'Palatino',
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.textColorNormal,
            ),
            dropCapChars: 1,
          ),
          AutorInternalArticle(),
        ],
      ),
    );
  }
}
