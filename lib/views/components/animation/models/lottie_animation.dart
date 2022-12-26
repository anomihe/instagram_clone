enum LottieAnimation {
  dataNotFound(name: 'data_not_found'),
  empty(name: 'empty'),
  loading(name: 'loading'),
  error(name: 'error'),
  small(name: 'small_error');

  final String name;
  const LottieAnimation({required this.name});
}
