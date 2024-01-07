// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_api_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllBreedsHash() => r'8872843f50c7a3f253ae9566a7ffaa8bba6c0f70';

/// See also [getAllBreeds].
@ProviderFor(getAllBreeds)
final getAllBreedsProvider = AutoDisposeFutureProvider<Breeds>.internal(
  getAllBreeds,
  name: r'getAllBreedsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAllBreedsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllBreedsRef = AutoDisposeFutureProviderRef<Breeds>;
String _$getImageByBreedHash() => r'b49df61bf9eb3c8cc940c2ab9fa750e3e58c0850';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getImageByBreed].
@ProviderFor(getImageByBreed)
const getImageByBreedProvider = GetImageByBreedFamily();

/// See also [getImageByBreed].
class GetImageByBreedFamily extends Family<AsyncValue<String>> {
  /// See also [getImageByBreed].
  const GetImageByBreedFamily();

  /// See also [getImageByBreed].
  GetImageByBreedProvider call(
    String breed,
  ) {
    return GetImageByBreedProvider(
      breed,
    );
  }

  @override
  GetImageByBreedProvider getProviderOverride(
    covariant GetImageByBreedProvider provider,
  ) {
    return call(
      provider.breed,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getImageByBreedProvider';
}

/// See also [getImageByBreed].
class GetImageByBreedProvider extends AutoDisposeFutureProvider<String> {
  /// See also [getImageByBreed].
  GetImageByBreedProvider(
    String breed,
  ) : this._internal(
          (ref) => getImageByBreed(
            ref as GetImageByBreedRef,
            breed,
          ),
          from: getImageByBreedProvider,
          name: r'getImageByBreedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getImageByBreedHash,
          dependencies: GetImageByBreedFamily._dependencies,
          allTransitiveDependencies:
              GetImageByBreedFamily._allTransitiveDependencies,
          breed: breed,
        );

  GetImageByBreedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.breed,
  }) : super.internal();

  final String breed;

  @override
  Override overrideWith(
    FutureOr<String> Function(GetImageByBreedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetImageByBreedProvider._internal(
        (ref) => create(ref as GetImageByBreedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        breed: breed,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _GetImageByBreedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetImageByBreedProvider && other.breed == breed;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, breed.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetImageByBreedRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `breed` of this provider.
  String get breed;
}

class _GetImageByBreedProviderElement
    extends AutoDisposeFutureProviderElement<String> with GetImageByBreedRef {
  _GetImageByBreedProviderElement(super.provider);

  @override
  String get breed => (origin as GetImageByBreedProvider).breed;
}

String _$getImageBySubBreedHash() =>
    r'443a15172ed459280ec62bfb64ee519dea1b14ef';

/// See also [getImageBySubBreed].
@ProviderFor(getImageBySubBreed)
const getImageBySubBreedProvider = GetImageBySubBreedFamily();

/// See also [getImageBySubBreed].
class GetImageBySubBreedFamily extends Family<AsyncValue<String>> {
  /// See also [getImageBySubBreed].
  const GetImageBySubBreedFamily();

  /// See also [getImageBySubBreed].
  GetImageBySubBreedProvider call(
    String breed,
    String subBreed,
  ) {
    return GetImageBySubBreedProvider(
      breed,
      subBreed,
    );
  }

  @override
  GetImageBySubBreedProvider getProviderOverride(
    covariant GetImageBySubBreedProvider provider,
  ) {
    return call(
      provider.breed,
      provider.subBreed,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getImageBySubBreedProvider';
}

/// See also [getImageBySubBreed].
class GetImageBySubBreedProvider extends AutoDisposeFutureProvider<String> {
  /// See also [getImageBySubBreed].
  GetImageBySubBreedProvider(
    String breed,
    String subBreed,
  ) : this._internal(
          (ref) => getImageBySubBreed(
            ref as GetImageBySubBreedRef,
            breed,
            subBreed,
          ),
          from: getImageBySubBreedProvider,
          name: r'getImageBySubBreedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getImageBySubBreedHash,
          dependencies: GetImageBySubBreedFamily._dependencies,
          allTransitiveDependencies:
              GetImageBySubBreedFamily._allTransitiveDependencies,
          breed: breed,
          subBreed: subBreed,
        );

  GetImageBySubBreedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.breed,
    required this.subBreed,
  }) : super.internal();

  final String breed;
  final String subBreed;

  @override
  Override overrideWith(
    FutureOr<String> Function(GetImageBySubBreedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetImageBySubBreedProvider._internal(
        (ref) => create(ref as GetImageBySubBreedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        breed: breed,
        subBreed: subBreed,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _GetImageBySubBreedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetImageBySubBreedProvider &&
        other.breed == breed &&
        other.subBreed == subBreed;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, breed.hashCode);
    hash = _SystemHash.combine(hash, subBreed.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetImageBySubBreedRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `breed` of this provider.
  String get breed;

  /// The parameter `subBreed` of this provider.
  String get subBreed;
}

class _GetImageBySubBreedProviderElement
    extends AutoDisposeFutureProviderElement<String>
    with GetImageBySubBreedRef {
  _GetImageBySubBreedProviderElement(super.provider);

  @override
  String get breed => (origin as GetImageBySubBreedProvider).breed;
  @override
  String get subBreed => (origin as GetImageBySubBreedProvider).subBreed;
}

String _$getImagesListByBreedHash() =>
    r'a198ef543474ddb40f7317d6c01cfc61ba348980';

/// See also [getImagesListByBreed].
@ProviderFor(getImagesListByBreed)
const getImagesListByBreedProvider = GetImagesListByBreedFamily();

/// See also [getImagesListByBreed].
class GetImagesListByBreedFamily extends Family<AsyncValue<List<String>>> {
  /// See also [getImagesListByBreed].
  const GetImagesListByBreedFamily();

  /// See also [getImagesListByBreed].
  GetImagesListByBreedProvider call(
    String breed,
  ) {
    return GetImagesListByBreedProvider(
      breed,
    );
  }

  @override
  GetImagesListByBreedProvider getProviderOverride(
    covariant GetImagesListByBreedProvider provider,
  ) {
    return call(
      provider.breed,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getImagesListByBreedProvider';
}

/// See also [getImagesListByBreed].
class GetImagesListByBreedProvider
    extends AutoDisposeFutureProvider<List<String>> {
  /// See also [getImagesListByBreed].
  GetImagesListByBreedProvider(
    String breed,
  ) : this._internal(
          (ref) => getImagesListByBreed(
            ref as GetImagesListByBreedRef,
            breed,
          ),
          from: getImagesListByBreedProvider,
          name: r'getImagesListByBreedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getImagesListByBreedHash,
          dependencies: GetImagesListByBreedFamily._dependencies,
          allTransitiveDependencies:
              GetImagesListByBreedFamily._allTransitiveDependencies,
          breed: breed,
        );

  GetImagesListByBreedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.breed,
  }) : super.internal();

  final String breed;

  @override
  Override overrideWith(
    FutureOr<List<String>> Function(GetImagesListByBreedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetImagesListByBreedProvider._internal(
        (ref) => create(ref as GetImagesListByBreedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        breed: breed,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<String>> createElement() {
    return _GetImagesListByBreedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetImagesListByBreedProvider && other.breed == breed;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, breed.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetImagesListByBreedRef on AutoDisposeFutureProviderRef<List<String>> {
  /// The parameter `breed` of this provider.
  String get breed;
}

class _GetImagesListByBreedProviderElement
    extends AutoDisposeFutureProviderElement<List<String>>
    with GetImagesListByBreedRef {
  _GetImagesListByBreedProviderElement(super.provider);

  @override
  String get breed => (origin as GetImagesListByBreedProvider).breed;
}

String _$getImagesListBySubBreedHash() =>
    r'4f711c94e0867631bf95656417012f43ae555a51';

/// See also [getImagesListBySubBreed].
@ProviderFor(getImagesListBySubBreed)
const getImagesListBySubBreedProvider = GetImagesListBySubBreedFamily();

/// See also [getImagesListBySubBreed].
class GetImagesListBySubBreedFamily extends Family<AsyncValue<List<String>>> {
  /// See also [getImagesListBySubBreed].
  const GetImagesListBySubBreedFamily();

  /// See also [getImagesListBySubBreed].
  GetImagesListBySubBreedProvider call(
    String breed,
    String subBreed,
  ) {
    return GetImagesListBySubBreedProvider(
      breed,
      subBreed,
    );
  }

  @override
  GetImagesListBySubBreedProvider getProviderOverride(
    covariant GetImagesListBySubBreedProvider provider,
  ) {
    return call(
      provider.breed,
      provider.subBreed,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getImagesListBySubBreedProvider';
}

/// See also [getImagesListBySubBreed].
class GetImagesListBySubBreedProvider
    extends AutoDisposeFutureProvider<List<String>> {
  /// See also [getImagesListBySubBreed].
  GetImagesListBySubBreedProvider(
    String breed,
    String subBreed,
  ) : this._internal(
          (ref) => getImagesListBySubBreed(
            ref as GetImagesListBySubBreedRef,
            breed,
            subBreed,
          ),
          from: getImagesListBySubBreedProvider,
          name: r'getImagesListBySubBreedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getImagesListBySubBreedHash,
          dependencies: GetImagesListBySubBreedFamily._dependencies,
          allTransitiveDependencies:
              GetImagesListBySubBreedFamily._allTransitiveDependencies,
          breed: breed,
          subBreed: subBreed,
        );

  GetImagesListBySubBreedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.breed,
    required this.subBreed,
  }) : super.internal();

  final String breed;
  final String subBreed;

  @override
  Override overrideWith(
    FutureOr<List<String>> Function(GetImagesListBySubBreedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetImagesListBySubBreedProvider._internal(
        (ref) => create(ref as GetImagesListBySubBreedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        breed: breed,
        subBreed: subBreed,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<String>> createElement() {
    return _GetImagesListBySubBreedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetImagesListBySubBreedProvider &&
        other.breed == breed &&
        other.subBreed == subBreed;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, breed.hashCode);
    hash = _SystemHash.combine(hash, subBreed.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetImagesListBySubBreedRef on AutoDisposeFutureProviderRef<List<String>> {
  /// The parameter `breed` of this provider.
  String get breed;

  /// The parameter `subBreed` of this provider.
  String get subBreed;
}

class _GetImagesListBySubBreedProviderElement
    extends AutoDisposeFutureProviderElement<List<String>>
    with GetImagesListBySubBreedRef {
  _GetImagesListBySubBreedProviderElement(super.provider);

  @override
  String get breed => (origin as GetImagesListBySubBreedProvider).breed;
  @override
  String get subBreed => (origin as GetImagesListBySubBreedProvider).subBreed;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
