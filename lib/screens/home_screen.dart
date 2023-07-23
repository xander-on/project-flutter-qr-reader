import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../providers/providers.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
            onPressed: (){
              Provider.of<ScanListProvider>(context, listen: false).borrarTodos();
            }, 
            icon: const Icon(Icons.delete_forever)
          )
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //obtener el currentIndex
    final uiProvider = Provider.of<UiProvider>(context);

    //cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    //Usar el scanlist provider
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    
    switch( currentIndex ){
      case 0: 
        scanListProvider.cargarScanPorTipo("geo");
        return const MapasScreens();

      case 1: 
        scanListProvider.cargarScanPorTipo("http");
        return const DireccionesScreens();

      default: return const MapasScreens();
    }
  }
}