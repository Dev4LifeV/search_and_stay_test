class MethodResult<E, V> {
  MethodResult(this._error, this._value);

  final E? _error;
  final V? _value;

  E? get error => _error;
  V? get value => _value;
}
