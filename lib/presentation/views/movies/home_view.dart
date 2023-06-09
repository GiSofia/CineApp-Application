import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cineapp/presentation/providers/providers.dart';
import 'package:cineapp/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final inititalLoading = ref.watch(initialLoadingProvider);
    if (inititalLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upComingMovies = ref.watch(upComingMoviesProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          title: CustomAppBar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(children: [
          MoviesSlidesShow(movies: slideShowMovies),
          MovieHorizontalListview(
              movies: nowPlayingMovies,
              title: 'En Cines',
              subTitle: 'Lunes 12',
              loadNextPage: () =>
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage()),
          MovieHorizontalListview(
              movies: upComingMovies,
              title: 'Próximamente',
              subTitle: 'En este mes',
              loadNextPage: () =>
                  ref.read(upComingMoviesProvider.notifier).loadNextPage()),
          MovieHorizontalListview(
              movies: popularMovies,
              title: 'Populares',
              loadNextPage: () =>
                  ref.read(popularMoviesProvider.notifier).loadNextPage()),
          MovieHorizontalListview(
              movies: topRatedMovies,
              title: 'Mejor calificados',
              subTitle: 'De siempre',
              loadNextPage: () =>
                  ref.read(topRatedMoviesProvider.notifier).loadNextPage()),
          const SizedBox(height: 10),
        ]);
      }, childCount: 1))
    ]);
  }
}
