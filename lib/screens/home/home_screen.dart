import 'package:app_base/bloc/common_bloc/common_bloc.dart';
import 'package:app_base/bloc/post_bloc/post_bloc.dart';
import 'package:app_base/themes/colors.dart';
import 'package:app_base/utils/common_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:app_base/utils/extensions/string_extensions.dart';
import 'package:app_base/constants/constants.dart';
import 'package:app_base/routes/routes.dart' as routes;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _renderResetPostButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.w),
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          context.read<PostBloc>().add(ResetPost());
        },
        child: const Text('Reset'),
      ),
    );
  }

  Widget _renderPostBody(BuildContext context, PostState state) {
    if (state is GetPostLoading) {
      return const CircularProgressIndicator();
    }
    if (state is GetPostSuccess) {
      return Container(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              state.post.title ?? '',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              state.post.body ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            _renderResetPostButton(context)
          ],
        ),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: ElevatedButton(
            onPressed: () {
              context.read<PostBloc>().add(const GetPost(1));
            },
            child: const Text('Call API Success'),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error),
            onPressed: () {
              context.read<PostBloc>().add(GetPostFail());
            },
            child: const Text('Call API Failure'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
        actions: [
          BlocBuilder<CommonBloc, CommonState>(
            builder: (context, state) {
              return Switch(
                value: state.isLightTheme,
                onChanged: (_) {
                  context.read<CommonBloc>().add(ThemeToggled());
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(5.w),
              child: Text(
                'Hello world'.firstWord()!,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: themingColor(defaultBlackColor, defaultWhiteColor),
                    ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2.h),
              height: 15.h,
              child: CachedNetworkImage(
                imageUrl: "http://via.placeholder.com/350x150",
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(routes.screen1Route, arguments: 'Screen 1')
                        .then((value) => ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(
                              SnackBar(content: Text('Back from $value'))));
                  },
                  child: const Text('Screen 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(routes.screen2Route, arguments: 'Screen 2')
                        .then((value) => ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(
                              SnackBar(content: Text('Back from $value'))));
                  },
                  child: const Text('Screen 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(routes.screen3Route, arguments: 'Screen 3')
                        .then((value) => ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(
                              SnackBar(content: Text('Back from $value'))));
                  },
                  child: const Text('Screen 3'),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: Center(
                child: BlocConsumer<PostBloc, PostState>(
                  listener: (context, state) {
                    if (state is GetPostError) {
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(content: Text(state.errorMessage)));
                    }
                  },
                  builder: (context, state) => _renderPostBody(context, state),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
