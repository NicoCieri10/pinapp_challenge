import 'package:app_client/app_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp_challenge/post_detail/cubit/post_cubit.dart';
import 'package:pinapp_challenge/post_detail/widget/widget.dart';
import 'package:pinapp_challenge/widget/widget.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({
    required this.post,
    super.key,
  });

  static const route = '/post-detail';

  final Post post;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostCubit(
        repository: context.read<AppClientRepository>(),
      )..init(post: post),
      child: const PostDetailView(),
    );
  }
}

class PostDetailView extends StatelessWidget {
  const PostDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: const CustomBackButton(),
      ),
      body: BlocConsumer<PostCubit, PostState>(
        listener: (context, state) {
          if (state.isError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error al obtener los comentarios del posteo'),
                backgroundColor: Colors.redAccent,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        builder: (context, state) {
          final post = state.post;
          final comments = state.comments;

          if (state.isLoading) return const LoadingWidget();

          if (comments.isEmpty) return const EmptyCommentsWidget();

          return RefreshIndicator(
            onRefresh: () => context.read<PostCubit>().init(post: post),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleWidget(title: post.title ?? ''),
                CommentsListView(comments: comments),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CommentsListView extends StatelessWidget {
  const CommentsListView({
    required this.comments,
    super.key,
  });

  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Scrollbar(
          child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (_, i) => CommentItemWidget(comment: comments[i]),
          ),
        ),
      ),
    );
  }
}
