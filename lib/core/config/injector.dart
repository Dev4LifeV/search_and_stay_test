class Injector {
  Injector._privateConstructor();

  static final Injector shared = Injector._privateConstructor();

  static final Map _injector = {};

  V create<K, V>(V Function() value) => _injector.putIfAbsent(K, value);

  V update<K, V>(V Function() value) {
    _injector[K] = value();
    return value();
  }

  V? read<K, V>() => _injector.containsKey(K) ? _injector[K] : null;

  void delete<K>() => _injector.remove(K);
}
