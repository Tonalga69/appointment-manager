// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'entities/appointments/appointmentsModel.dart';
import 'entities/clients/Model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 3179055632278638771),
      name: 'Appointmentsmodel',
      lastPropertyId: const obx_int.IdUid(6, 2284934373662510400),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 5350741357775353917),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 9006322136219832171),
            name: 'date',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 4749308421722348087),
            name: 'clientId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(1, 6022390175652762309),
            relationTarget: 'ClientModel'),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 5221245912998438901),
            name: 'observation',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 2237301819019071967),
            name: 'treatment',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 2284934373662510400),
            name: 'diagnosis',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 7999686892142184263),
      name: 'ClientModel',
      lastPropertyId: const obx_int.IdUid(4, 6214424682060672500),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 2350157720706267881),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 184412398824176235),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 5728753288372671131),
            name: 'age',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 6214424682060672500),
            name: 'noteBookNumber',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[
        obx_int.ModelBacklink(
            name: 'appointments', srcEntity: 'Appointmentsmodel', srcField: '')
      ])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(2, 7999686892142184263),
      lastIndexId: const obx_int.IdUid(1, 6022390175652762309),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    Appointmentsmodel: obx_int.EntityDefinition<Appointmentsmodel>(
        model: _entities[0],
        toOneRelations: (Appointmentsmodel object) => [object.client],
        toManyRelations: (Appointmentsmodel object) => {},
        getId: (Appointmentsmodel object) => object.id,
        setId: (Appointmentsmodel object, int id) {
          object.id = id;
        },
        objectToFB: (Appointmentsmodel object, fb.Builder fbb) {
          final observationOffset = object.observation == null
              ? null
              : fbb.writeString(object.observation!);
          final treatmentOffset = object.treatment == null
              ? null
              : fbb.writeString(object.treatment!);
          final diagnosisOffset = object.diagnosis == null
              ? null
              : fbb.writeString(object.diagnosis!);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.date.millisecondsSinceEpoch);
          fbb.addInt64(2, object.client.targetId);
          fbb.addOffset(3, observationOffset);
          fbb.addOffset(4, treatmentOffset);
          fbb.addOffset(5, diagnosisOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final dateParam = DateTime.fromMillisecondsSinceEpoch(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0));
          final observationParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10);
          final treatmentParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 12);
          final diagnosisParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 14);
          final object = Appointmentsmodel(
              id: idParam,
              date: dateParam,
              observation: observationParam,
              treatment: treatmentParam,
              diagnosis: diagnosisParam);
          object.client.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          object.client.attach(store);
          return object;
        }),
    ClientModel: obx_int.EntityDefinition<ClientModel>(
        model: _entities[1],
        toOneRelations: (ClientModel object) => [],
        toManyRelations: (ClientModel object) => {
              obx_int.RelInfo<Appointmentsmodel>.toOneBacklink(3, object.id,
                      (Appointmentsmodel srcObject) => srcObject.client):
                  object.appointments
            },
        getId: (ClientModel object) => object.id,
        setId: (ClientModel object, int id) {
          object.id = id;
        },
        objectToFB: (ClientModel object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addInt64(2, object.age);
          fbb.addInt64(3, object.noteBookNumber);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final noteBookNumberParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 10);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final ageParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final object = ClientModel(
              id: idParam,
              noteBookNumber: noteBookNumberParam,
              name: nameParam,
              age: ageParam);
          obx_int.InternalToManyAccess.setRelInfo<ClientModel>(
              object.appointments,
              store,
              obx_int.RelInfo<Appointmentsmodel>.toOneBacklink(3, object.id,
                  (Appointmentsmodel srcObject) => srcObject.client));
          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [Appointmentsmodel] entity fields to define ObjectBox queries.
class Appointmentsmodel_ {
  /// See [Appointmentsmodel.id].
  static final id =
      obx.QueryIntegerProperty<Appointmentsmodel>(_entities[0].properties[0]);

  /// See [Appointmentsmodel.date].
  static final date =
      obx.QueryDateProperty<Appointmentsmodel>(_entities[0].properties[1]);

  /// See [Appointmentsmodel.client].
  static final client = obx.QueryRelationToOne<Appointmentsmodel, ClientModel>(
      _entities[0].properties[2]);

  /// See [Appointmentsmodel.observation].
  static final observation =
      obx.QueryStringProperty<Appointmentsmodel>(_entities[0].properties[3]);

  /// See [Appointmentsmodel.treatment].
  static final treatment =
      obx.QueryStringProperty<Appointmentsmodel>(_entities[0].properties[4]);

  /// See [Appointmentsmodel.diagnosis].
  static final diagnosis =
      obx.QueryStringProperty<Appointmentsmodel>(_entities[0].properties[5]);
}

/// [ClientModel] entity fields to define ObjectBox queries.
class ClientModel_ {
  /// See [ClientModel.id].
  static final id =
      obx.QueryIntegerProperty<ClientModel>(_entities[1].properties[0]);

  /// See [ClientModel.name].
  static final name =
      obx.QueryStringProperty<ClientModel>(_entities[1].properties[1]);

  /// See [ClientModel.age].
  static final age =
      obx.QueryIntegerProperty<ClientModel>(_entities[1].properties[2]);

  /// See [ClientModel.noteBookNumber].
  static final noteBookNumber =
      obx.QueryIntegerProperty<ClientModel>(_entities[1].properties[3]);

  /// see [ClientModel.appointments]
  static final appointments =
      obx.QueryBacklinkToMany<Appointmentsmodel, ClientModel>(
          Appointmentsmodel_.client);
}
