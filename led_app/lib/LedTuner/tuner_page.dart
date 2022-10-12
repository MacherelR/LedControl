
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:led_app/Bloc/led_bloc.dart';
import 'package:led_app/Bloc/led_event.dart';
import 'package:led_app/Repository/led_Ctl_repository.dart';

import '../Bloc/led_state.dart';
import '../Widgets/led_view_widget.dart';

class TunerScreen extends StatelessWidget{
  const TunerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return BlocProvider(
        create: (context) => LedBloc(
          ledRepository: context.read<LedRepository>()
          )..add(const LedSubscriptionRequested()),
        child: const TunerView(),
    );
  }
}

class TunerView extends StatelessWidget{
  const TunerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){

    return BlocBuilder<LedBloc, LedState>(builder: (context,state){
      Size size = MediaQuery.of(context).size;
      return SizedBox(
        height: size.height,
        width: size.width,
        child: const LedViewWidget(),
      );
    });
  }
}