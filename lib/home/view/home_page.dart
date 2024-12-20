import 'package:app_client/app_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp_challenge/home/cubit/home_cubit.dart';
import 'package:pinapp_challenge/home/widget/widget.dart';
import 'package:pinapp_challenge/widget/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(
        repository: context.read<AppClientRepository>(),
      ),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Posteos'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.isError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error al obtener los posteos'),
                backgroundColor: Colors.redAccent,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading) return const LoadingWidget();

          final posts = state.posts;

          if (posts.isEmpty) return const EmptyPostWidget();

          return RefreshIndicator(
            onRefresh: context.read<HomeCubit>().init,
            child: _PostsListView(posts),
          );
        },
      ),
    );
  }
}

class _PostsListView extends StatelessWidget {
  const _PostsListView(this.posts);

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (_, i) => PostItemWidget(post: posts[i]),
      ),
    );
  }
}
