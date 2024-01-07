// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_list_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getImagesListByBreedHash() =>
    r'fa4ab703ce197fdb8fd464c65eb7cfa91d32fec1';

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
    r'2c3ca7c4336a4c237916ea10055860d47653f11e';

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
