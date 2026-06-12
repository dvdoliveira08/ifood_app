import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'tela_carrinho.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  int _paginaAtual = 0;

  final List<Map<String, dynamic>> _bannersTopo = [
    {
      'titulo': 'CUPOM DE 40% OFF\npra ver o Brasil jogar',
      'cor': const Color(0xFFEA1D2C),
      'botao': 'Vem de clique',
    },
    {
      'titulo': 'DESCONTÃO PRA JANTAR\ncom até 50% OFF',
      'cor': const Color(0xFFA020F0),
      'botao': 'Ver restaurantes',
    },
    {
      'titulo': 'ENTREGA GRÁTIS\nnos seus favoritos',
      'cor': const Color(0xFF008000),
      'botao': 'Aproveitar',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _construirAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _construirCategoriasPrincipais(),
            const SizedBox(height: 24),
            opcoesComida(),
            const SizedBox(height: 24),
            _construirCarrosselSlider(),
            const SizedBox(height: 16),
            _construirCardsPromocionais(),
            const SizedBox(height: 24),
            _construirUltimasLojas(),
            const SizedBox(height: 24),
            _construirBannerFixo(),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * 0.92,
        height: 50,
        child: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaCarrinho()),
            );
          },
          label: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Color(0xFF2B2B2B),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total com a entrega',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Text(
                          'R\$ 96,50 / 1 item',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Text(
                  'Ver sacola',
                  style: TextStyle(
                    color: Color(0xFFEA1D2C),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _construirBottomNav(),
    );
  }

  PreferredSizeWidget _construirAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Boa noite, Deivide',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Row(
            children: [
              Text(
                'Av. Três de Maio, 307',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.red, size: 20),
            ],
          ),
        ],
      ),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.purple[50],
          radius: 20,
          child: const Icon(Icons.diamond, color: Colors.purple, size: 20),
        ),
        const SizedBox(width: 12),
        const Icon(Icons.notifications_outlined, color: Colors.black, size: 28),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _construirCarrosselSlider() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 150.0,
            autoPlay: true,
            viewportFraction: 0.89,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                _paginaAtual = index;
              });
            },
          ),
          items: _bannersTopo.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: banner['cor'],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              banner['titulo'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                banner['botao'],
                                style: TextStyle(
                                  color: banner['cor'],
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.fastfood,
                        size: 70,
                        color: Colors.white38,
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _bannersTopo.asMap().entries.map((entry) {
            return Container(
              width: 7.0,
              height: 7.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withAlpha(
                  (_paginaAtual == entry.key ? 0.9 : 0.2 * 255).round(),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _construirCategoriasPrincipais() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _itemCategoria(Icons.fastfood, 'Restaurantes', Colors.orange),
              _itemCategoria(Icons.shopping_basket, 'Mercados', Colors.red),
              _itemCategoria(Icons.local_pharmacy, 'Farmácias', Colors.pink),
              _itemCategoria(Icons.liquor, 'Bebidas', Colors.brown),
              _itemCategoria(Icons.flight, 'Viagens', Colors.deepPurple),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _itemCategoria(Icons.directions_car, 'Corridas', Colors.black),
              _itemCategoria(Icons.local_offer, 'Promoções', Colors.red),
              _itemCategoria(Icons.restaurant_menu, 'Gourmet', Colors.black),
              _itemCategoria(Icons.ads_click, 'Missões', Colors.red),
              _itemCategoria(Icons.grid_view, 'Ver mais', Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _itemCategoria(IconData icone, String titulo, Color cor) {
    return SizedBox(
      width: 65,
      child: Column(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icone, color: cor, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            titulo,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget opcoesComida() {
    return SizedBox(
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          _itemComida(Icons.lunch_dining, 'Lanches'),
          _itemComida(Icons.local_pizza, 'Pizza'),
          _itemComida(Icons.set_meal, 'Japonesa'),
          _itemComida(Icons.shopping_bag, 'Promoções'),
          _itemComida(Icons.icecream, 'Sorvetes'),
          _itemComida(Icons.local_drink, 'Bebidas'),
          _itemComida(Icons.restaurant, 'Brasileira'),
          _itemComida(Icons.cake, 'Doces & Bolos'),
          _itemComida(Icons.eco, 'Saudável'),
          _itemComida(Icons.bakery_dining, 'Padaria'),
        ],
      ),
    );
  }

  Widget _itemComida(IconData icone, String titulo) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        children: [
          Container(
            height: 65,
            width: 85,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icone, color: Colors.orange, size: 35),
          ),
          const SizedBox(height: 6),
          Text(
            titulo,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _construirBannerFixo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text(
            '100 DIAS\nDE OFERTAS',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _construirBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Busca'),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long),
          label: 'Pedidos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Perfil',
        ),
      ],
    );
  }

  Widget _construirCardsPromocionais() {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _itemCardPromocional(
            'Famosos com\n descontão',
            const Color(0xFF990000),
            Icons.star,
          ),
          _itemCardPromocional(
            'burguer com\n entrega\n grátis',
            const Color.fromARGB(255, 135, 84, 1),
            Icons.lunch_dining,
          ),
          _itemCardPromocional(
            'entrega\n grátis aqui',
            const Color(0xFF990000),
            Icons.local_shipping,
          ),
          _itemCardPromocional(
            'jantar\n bom e barato',
            const Color.fromARGB(255, 87, 141, 79),
            Icons.star,
          ),
          _itemCardPromocional(
            'pizza\n em promo e\n entrega grátis',
            const Color.fromARGB(255, 43, 129, 57),
            Icons.local_pizza,
          ),
          _itemCardPromocional(
            'cupom\n até R\$30',
            const Color(0xFF990000),
            Icons.local_offer,
          ),
        ],
      ),
    );
  }

  Widget _itemCardPromocional(String texto, Color cor, IconData icone) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(14),
      child: Stack(
        children: [
          Positioned(
            bottom: -10,
            right: -10,
            child: Icon(
              icone,
              color: Colors.white.withAlpha(
                38,
              ), // Substitui o .withOpacity(0.15)
              size: 65,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                texto,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _construirUltimasLojas() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Últimas lojas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Ver mais',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _itemLoja(
                'Mcdonald\'s -\nSão Roque (srd...',
                Icons.fastfood,
                true,
              ),
              const SizedBox(width: 16),
              _itemLoja('Padaria\nColoniall II', Icons.bakery_dining, false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _itemLoja(String nome, IconData icone, bool mostrarSelo) {
    return Container(
      width: 110,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[200],
            child: Icon(icone, size: 30, color: Colors.red),
          ),
          const SizedBox(height: 8),
          Text(
            nome,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
