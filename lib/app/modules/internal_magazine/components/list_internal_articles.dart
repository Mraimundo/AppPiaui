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
            'Na manhã de 10 de novembro de 2020, quando os primeiros raios de sol despontavam no bairro paulistano de Santa Cecília, a procuradora Fabiana Schneider, então membro da Lava Jato do Rio de Janeiro, acionou o interfone de um suntuoso edifício na Rua Emílio de Menezes. Ela estava acompanhada por um delegado, dois agentes e um escrivão da Polícia Federal. O objetivo era cumprir um mandado de busca e apreensão no apartamento 41, onde morava o libanês naturalizado brasileiro Chaaya Moghrabi, considerado um dos maiores doleiros de São Paulo.',
            style: TextStyle(
              height: 1.3,
              fontFamily: 'Palatino',
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.textColorNormal,
            ),
            dropCapChars: 1,
          ),
          SizedBox(height: 20),
          Text(
            'A equipe foi recebida pelo zelador e pelos seguranças do prédio. Depois de passar por dois portões, o grupo se dividiu. O delegado caminhou para a garagem, a fim de evitar que o doleiro escapasse por ali, e a procuradora subiu até o apartamento com os demais policiais. Usaram o elevador de carga, já que o de serviço só é ativado com as digitais dos próprios moradores. No quarto andar, Schneider constatou que não conseguiria arrombar as portas blindadas do imóvel de Moghrabi. Enquanto ela tocava insistentemente a campainha, o delegado, ainda na garagem, ouviu o doleiro gritar para sua mulher: “Não abre a porta!”',
            style: TextStyle(
              height: 1.3,
              fontFamily: 'Palatino',
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.textColorNormal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          Text(
            'Somente depois de vinte minutos é que Moghrabi permitiu que a equipe entrasse no apartamento. “Cadê o celular?”, perguntou a procuradora logo de cara. O doleiro – à época, com 53 anos – foi até a cozinha e entregou um iPhone a Schneider. Mas o aparelho estava sem nenhuma informação. Provavelmente, o investigado apagou tudo enquanto pedia para a esposa não abrir a porta. De volta ao Rio, a procuradora reuniu-se com colegas que integravam a força-tarefa da Lava Jato. Juntos, concluíram se tratar de um típico caso de obstrução de Justiça. Só não solicitaram a prisão preventiva do doleiro porque o Brasil estava em período eleitoral, quando são permitidas apenas prisões em flagrante.',
            style: TextStyle(
              height: 1.3,
              fontFamily: 'Palatino',
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.textColorNormal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          Text(
            'Quase um mês e meio depois, na manhã de 18 de dezembro, Schneider e os policiais retornaram ao prédio de Santa Cecília, agora com um mandado de prisão contra Moghrabi, assinado pela juíza substituta Caroline Vieira Figueiredo, da 7ª Vara Federal Criminal do Rio. O libanês, porém, já não se encontrava lá. Na garagem, os policiais constataram a falta de um dos três automóveis do doleiro. Como sabiam a placa do carro, decidiram rastreá-lo via Sivem, o Sistema de Identificação de Veículos em Movimento, formado por câmeras instaladas ao longo das rodovias brasileiras. A PF descobriu, assim, que Moghrabi estava em Angra dos Reis, no litoral fluminense. Vasculhando os hotéis mais nobres da cidade, os agentes localizaram o doleiro na piscina de um deles. Ao vê-los, o libanês começou a dizer que estava se sentindo mal. Foi levado para um ambulatório de Angra. Depois, já a caminho do Rio, soube que o ministro Gilmar Mendes, do Supremo Tribunal Federal (STF), determinara sua soltura.',
            style: TextStyle(
              height: 1.3,
              fontFamily: 'Palatino',
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.textColorNormal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          Text(
            'Era a terceira vez que o ministro do STF libertava o investigado.  Sob a ótica de Mendes, nada justificava deter o doleiro em dezembro de 2020, nem mesmo a alegação de que o libanês já tentara obstruir a Justiça. Conforme o ministro escreveu em sua terceira decisão, “a demora de vinte minutos para abrir a porta durante o cumprimento do mandado de busca e apreensão [em novembro] não tem potencial de afetar o livre desenvolvimento das investigações para fins processuais ou penais, até porque o Estado possui a prerrogativa de promover o ingresso forçado no local, mediante arrombamento”. Mendes não levou em conta o fato de as portas do apartamento serem blindadas, nem se manifestou sobre o celular entregue à procuradora com todas as informações apagadas. ',
            style: TextStyle(
              height: 1.3,
              fontFamily: 'Palatino',
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.textColorNormal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 31),
          Image.asset(
            'assets/images/carrosel_image.png',
            // fit: BoxFit.fill,
          ),
          SizedBox(height: 8),
          Text(
            'Laerte Coutinho',
            style: TextStyle(
              fontFamily: 'Piaui',
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: AppColors.textAuthorColor,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 31),
          DropCapText(
            'Filho de judeus ortodoxos, Chaaya Moghrabi nasceu em Beirute, capital do Líbano, mas chegou a São Paulo ainda jovem. Na década de 1990, começou a trocar reais por dólares para famílias que frequentavam as sinagogas de Higienópolis, bairro onde há uma grande comunidade judaica. Ele também exercia a atividade para clientes do Banco Safra, amealhados no breve período em que trabalhou na instituição.',
            style: TextStyle(
              height: 1.3,
              fontFamily: 'Palatino',
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.textColorNormal,
            ),
            dropCapChars: 1,
          ),
          SizedBox(height: 20),
          Text(
            'Naquele tempo, Moghrabi costumava enviar dinheiro de origem ilícita para o exterior por meio de contas do tipo CC5, abertas sobretudo no Banestado, em Foz do Iguaçu (PR). De acordo com o Ministério Público Federal, ele remeteu ilegalmente  66,4 milhões de reais, em valores da época. No mesmo período, trocou 2,2 milhões de reais por dólares com Alberto Youssef, doleiro que mais tarde se tornaria um dos pivôs da Lava Jato. Por causa desse esquema, o libanês acabou condenado a dez anos e dez meses de detenção em 2015, mas os crimes acabaram prescritos, sem o cumprimento da pena.',
            style: TextStyle(
              height: 1.3,
              fontFamily: 'Palatino',
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.textColorNormal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          Text(
            'No início dos anos 2000, Moghrabi expandiu sua clientela. Todos os dias, recolhia milhões de reais em cheques e dinheiro vivo no comércio popular da Rua 25 de Março e do Bom Retiro, bairro da área central de São Paulo. Depois de converter os valores em dólares, ele os mandava ilegalmente para contas indicadas pelos clientes no exterior. A posse de quantias milionárias em espécie logo atraiu a atenção da família Messer. Durante a década de 1990, Moghrabi mantivera negócios com um integrante do clã no Rio de Janeiro, o também judeu Mordko Messer. A partir de 2005, Claudio Barboza – braço direito de Dario Messer, doleiro que estava operando no Uruguai – passou a recorrer ao libanês quando necessitava de reais para entregar tanto a políticos quanto a empreiteiras que desejavam trazer de volta o dinheiro ilícito mantido fora do Brasil. Entre os políticos, figurava o ex-governador do Rio Sérgio Cabral e, entre as empreiteiras, a Odebrecht. De 2011 a 2017,  Moghrabi e a turma de Dario Messer movimentaram ilegalmente 239,7 milhões de dólares.',
            style: TextStyle(
              height: 1.3,
              fontFamily: 'Palatino',
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.textColorNormal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          Text(
            'Em 2017, ao ser preso no Uruguai, Barboza assinou um acordo com a força-tarefa da Lava Jato e entregou aos procuradores um arquivo informatizado que registrava transações com doleiros do Brasil. Um deles era Moghrabi, que aparece na planilha sob os codinomes de Yasha ou Monza. O libanês virou, assim, um dos 53 alvos da Operação Câmbio, Desligo, deflagrada pela Polícia Federal em 3 de maio de 2018. Ele conseguiu despistar os agentes que o procuravam e se tornou foragido. Quase um ano depois, em março de 2019, o ministro Gilmar Mendes concedeu liminar em que substituía a prisão preventiva de Moghrabi e dos demais doleiros citados na Operação Câmbio, Desligo por medidas cautelares, como o pagamento de fiança de 5 milhões de reais e a proibição de deixar o Brasil ou manter contato com outros investigados.',
            style: TextStyle(
              height: 1.3,
              fontFamily: 'Palatino',
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.textColorNormal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          Text(
            'Ainda assim, Moghrabi permaneceu fora do país até a madrugada de 3 de abril de 2019, quando foi detido no aeroporto de Montevidéu, vindo do Panamá (o nome dele continuava na lista de procurados da Interpol mesmo após Mendes relaxar sua prisão preventiva). Às 15h30 daquela quarta-feira, o advogado do doleiro, Alberto Toron, ingressou com um recurso no STF, argumentando que o libanês tinha viajado do Panamá até o Uruguai justamente porque pretendia ir de lá para o Brasil, onde se apresentaria à Justiça e entregaria o seu passaporte. O advogado também explicou que seu cliente já pagara a fiança estabelecida pela liminar de Mendes. Foram 1,5 milhão de reais em espécie e o restante oriundo da entrega de um imóvel pertencente ao pai do doleiro em São Paulo. Na verdade, a fiança havia sido depositada vinte minutos depois de a polícia deter o investigado no aeroporto uruguaio. O Supremo não respondeu ao recurso.',
            style: TextStyle(
              height: 1.3,
              fontFamily: 'Palatino',
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.textColorNormal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          Text(
            'No dia 4 de abril, quinta-feira, o juiz Marcelo Bretas decretou nova prisão preventiva do libanês. Para o magistrado, o fato de Toron ter depositado a fiança logo após a prisão de seu cliente, e não antes, demonstrava, “no mínimo, a má-fé do investigado”. Bretas afirmou que a defesa de Moghrabi tinha conhecimento das medidas cautelares estipuladas em março, mas ficou quase um mês sem cumpri-las, “deixando a clara impressão de que somente pagou parte da fiança porque [o doleiro] foi preso no Uruguai”.',
            style: TextStyle(
              height: 1.3,
              fontFamily: 'Palatino',
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.textColorNormal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          Text(
            'O advogado entrou com outro recurso no STF. Sem ouvir o Ministério Público, Gilmar Mendes determinou a soltura de Moghrabi, em liminar do dia 5 de abril. O ministro do Supremo avalizou a justificativa de que o libanês estava retornando ao Brasil para a entrega do passaporte. Afirmou, ainda, que a defesa do doleiro havia emitido a guia do depósito judicial da fiança em 1º de abril – antes, portanto, da prisão. Realmente, a guia foi gerada naquela data, mas o pagamento só ocorreu dois dias depois, quando o investigado já se encontrava detido no Uruguai.',
            style: TextStyle(
              height: 1.3,
              fontFamily: 'Palatino',
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.textColorNormal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          Text(
            'Mendes aceitou o apartamento entregue como parte da fiança sem requerer avaliação independente do imóvel. “Quanto à necessidade de avaliação”, escreveu o ministro, “pode o Juízo determiná-la enquanto o paciente aguarda, em liberdade, o respectivo laudo.” O doleiro foi solto no dia 9 de abril e regressou ao Brasil.',
            style: TextStyle(
              height: 1.3,
              fontFamily: 'Palatino',
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.textColorNormal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          Text(
            'Pouco mais tarde, o Ministério Público Federal pediu a Mendes que reconsiderasse a decisão, baseado numa nova informação: autoridades uruguaias haviam descoberto que o libanês reservara passagem de Montevidéu para o Panamá. Era um indicativo de que, quando desembarcou na capital do Uruguai, Moghrabi não pretendia retornar ao Brasil e se entregar. O ministro ignorou o pedido: “Não me parece razoável que ele prestaria a fiança e continuaria no exterior”, escreveu. Em dezembro de 2020, como já relatado, Mendes voltou a libertar o doleiro, após a prisão em Angra dos Reis. A piauí pediu um posicionamento sobre o caso ao gabinete do ministro, mas não obteve resposta.',
            style: TextStyle(
              height: 1.3,
              fontFamily: 'Palatino',
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.textColorNormal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          Text(
            'Atualmente, Moghrabi é réu em cinco ações penais na Justiça Federal do Rio por associação criminosa, evasão de divisas e lavagem de dinheiro. Num dos processos, o libanês é acusado de lavar 118 mil dólares de propinas decorrentes de contratos na Eletronuclear, subsidiária da Eletrobras. Ao cumprir mandado de busca e apreensão na casa da mãe de Moghrabi, em São Paulo, no último dia 10 de novembro, policiais federais encontraram várias joias escondidas no teto de um dos quartos. Posteriormente, procuradores receberam do Ministério Público da Itália documentos que comprovam pagamentos feitos pelo doleiro a uma conhecida fabricante italiana de joias. Trata-se de um sinal de que Moghrabi imobilizava parte do seu capital ilícito em joias e pedras preciosas. Sua carteira de clientes no Brasil ainda é desconhecida pelos procuradores.',
            style: TextStyle(
              height: 1.3,
              fontFamily: 'Palatino',
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: AppColors.textColorNormal,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 43),
          AutorInternalArticle(),
        ],
      ),
    );
  }
}
