import 'package:flutter/material.dart';

class TelaCheckout extends StatelessWidget {
  const TelaCheckout({super.key});

  void _abrirModalRevisao(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext bc) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
              const SizedBox(height: 24),
              const Text('Revise o seu pedido', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              _itemLinhaModal(Icons.motorcycle, 'Entrega hoje', 'Hoje, 45 - 55 min'),
              const Divider(height: 24),
              _itemLinhaModal(Icons.location_on, 'Av. Três de Maio, 307', 'Mairinque - SP'),
              const Divider(height: 24),
              _itemLinhaModal(Icons.lock_outline, 'Cupons bloqueados', 'Item já tem desconto aplicado'),
              const Divider(height: 24),
              _itemLinhaModal(Icons.credit_card, 'Pagamento pelo app', 'Mastercard •••• 3717', sufixo: 'R\$ 114,14'),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEA1D2C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    Navigator.pop(bc);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pedido realizado com sucesso!'), backgroundColor: Colors.green),
                    );
                  },
                  child: const Text('Fazer pedido', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Navigator.pop(bc),
                child: const Text('Alterar pedido', style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.red, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'SACOLA',
          style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Limpar', style: TextStyle(color: Colors.red, fontSize: 14)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Pizzaria Di Pomodoro', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Pagamento pelo app', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.credit_card, color: Colors.orange),
                      const SizedBox(width: 12),
                      const Text('Crédito •••• 1234', style: TextStyle(fontWeight: FontWeight.w600)),
                      const Spacer(),
                      Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[400]),
                    ],
                  ),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('1x de R\$ 114,14', style: TextStyle(color: Colors.black54)),
                      Icon(Icons.arrow_forward_ios, size: 14, color: Colors.transparent),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Sua doação faz a diferença', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: Text('100% do valor será repassado para o Pacto Contra a Fome', style: TextStyle(color: Colors.grey, fontSize: 12)),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _botaoDoacao('R\$ 2'),
                  _botaoDoacao('R\$ 3'),
                  _botaoDoacao('R\$ 5'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _linhaValores('Subtotal', 'R\$ 120,00'),
            _linhaValores('Taxa de entrega', 'R\$ 5,00'),
            _linhaValores('Taxa de serviço', 'R\$ 2,14'),
            _linhaValores('Desconto no item', '- R\$ 13,00', corTexto: Colors.green),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey[200]!))),
              child: Row(
                children: [
                  const Icon(Icons.description_outlined, color: Colors.black87),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CPF na nota', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      Text('Opcional', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                  const Spacer(),
                  TextButton(onPressed: () {}, child: const Text('Adicionar', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey[200]!, blurRadius: 10, offset: const Offset(0, -2))],
        ),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEA1D2C),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () => _abrirModalRevisao(context),
            child: const Text('Revisar pedido • R\$ 114,14', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  Widget _botaoDoacao(String valor) {
    return Container(
      width: 105,
      height: 40,
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
      child: Center(child: Text(valor, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87))),
    );
  }

  Widget _linhaValores(String label, String valor, {Color? corTexto}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54, fontSize: 14)),
          Text(valor, style: TextStyle(color: corTexto ?? Colors.black87, fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _itemLinhaModal(IconData icone, String titulo, String subtitulo, {String? sufixo}) {
    return Row(
      children: [
        Icon(icone, color: Colors.black87, size: 22),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(height: 2),
              Text(subtitulo, style: const TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
        ),
        if (sufixo != null) Text(sufixo, style: const TextStyle(color: Colors.black54, fontSize: 13)),
      ],
    );
  }
}