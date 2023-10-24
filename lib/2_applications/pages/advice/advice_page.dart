import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:third_flutter/2_applications/core/services/theme_service.dart';
import 'package:third_flutter/2_applications/pages/advice/bloc/advicer_bloc.dart';
import 'package:third_flutter/2_applications/pages/advice/widgets/advice_field.dart';
import 'package:third_flutter/2_applications/pages/advice/widgets/custom_button.dart';
import 'package:third_flutter/2_applications/pages/advice/widgets/error_message.dart';

class AdvicerPageWrapperProvider extends StatelessWidget {
  const AdvicerPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdvicerBloc(),
      child: const AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Advicer', style: themeData.textTheme.headlineLarge),
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (_) {
              Provider.of<ThemeService>(context, listen: false).toggleTheme();
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(children: [
          Expanded(
            child: Center(
              child: BlocBuilder<AdvicerBloc, AdvicerState>(
                builder: (context, state) {
                  if (state is AdvicerInitial) {
                    return Text(
                      'Your advice id waiting for U!',
                      style: themeData.textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    );
                  } else if (state is AdvicerStateLoading) {
                    return CircularProgressIndicator(
                      color: themeData.colorScheme.secondary,
                    );
                  } else if (state is AdvicerStateLoaded) {
                    return AdviceField(advice: state.advice);
                  } else if (state is AdvicerStateError) {
                    return ErrorMessage(
                      message: state.message);
                  }
                  return SizedBox();
                  // return const ErrorMessage(
                  //     message: "Oops omething gone wrong!\n\n - error 404 -");
                },
              ),
              
            ),
          ),
          const SizedBox(
            height: 200,
            child: Center(
              child: CustomButton(),
            ),
          )
        ]),
      ),
    );
  }
}
