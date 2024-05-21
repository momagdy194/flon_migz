// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gshop/app_constants.dart';
import 'package:gshop/domain/interface/address.dart';
import 'package:gshop/domain/model/model/order_model.dart';
import 'package:gshop/domain/model/model/parcel_order_model.dart';
import 'package:gshop/domain/service/helper.dart';
import 'package:gshop/domain/service/marker_image_cropper.dart';
import 'package:gshop/infrastructure/local_storage/local_storage.dart';
import 'package:gshop/presentation/components/maps_list.dart';
import 'package:gshop/presentation/style/theme/theme.dart';
import 'package:map_launcher/map_launcher.dart';

part 'drawing_route_event.dart';

part 'drawing_route_state.dart';

part 'drawing_route_bloc.freezed.dart';

class DrawingRouteBloc extends Bloc<DrawingRouteEvent, DrawingRouteState> {
  final AddressInterface _addressRepo;

  DrawingRouteBloc(this._addressRepo) : super(const DrawingRouteState()) {
    on<GetRoutingAll>((event, emit) async {
      final LatLng start;
      final LatLng end;
      if (event.parcel != null) {
        start = LatLng(
            event.parcel?.addressFrom?.latitude ?? AppConstants.demoLatitude,
            event.parcel?.addressFrom?.longitude ?? AppConstants.demoLongitude);

        end = LatLng(
            event.parcel?.addressTo?.latitude ?? AppConstants.demoLatitude,
            event.parcel?.addressTo?.longitude ?? AppConstants.demoLongitude);
      } else if (event.order?.deliveryType == "point") {
        return;
      } else {
        start = LatLng(
          double.parse(LocalStorage.getWareHouse().location?.latitude ??
              "${AppConstants.demoLatitude}"),
          double.parse(LocalStorage.getWareHouse().location?.longitude ??
              "${AppConstants.demoLongitude}"),
        );

        end = LatLng(
          double.parse(event.order?.address?.location?.latitude ??
              "${AppConstants.demoLatitude}"),
          double.parse(event.order?.address?.location?.longitude ??
              "${AppConstants.demoLongitude}"),
        );
      }

      emit(state.copyWith(polylineCoordinates: [], isLoading: true));
      final response = await _addressRepo.getRouting(start: start, end: end);
      response.fold(
        (l) {
          List<LatLng> list = [];
          List ls = l.features[0].geometry.coordinates;
          for (int i = 0; i < ls.length; i++) {
            list.add(LatLng(ls[i][1], ls[i][0]));
          }
          emit(state.copyWith(polylineCoordinates: list, isLoading: false));
        },
        (r) => emit(
          state.copyWith(polylineCoordinates: [], isLoading: false),
        ),
      );
    });

    on<SetMarkers>((event, emit) async {
      final ImageCropperForMarker image = ImageCropperForMarker();
      if (event.parcel != null) {
        Map<MarkerId, Marker> list = {
          const MarkerId("Uzmart"): Marker(
              onTap: () {
                AppHelper.showCustomModalBottomSheet(
                    context: event.context,
                    modal: Container(
                      padding: EdgeInsets.only(top: 32.r),
                      decoration: BoxDecoration(
                        color: event.colors.backgroundColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16.r),
                          topLeft: Radius.circular(16.r),
                        ),
                      ),
                      child: MapsList(
                          colors: event.colors,
                          location: Coords(
                              event.parcel?.addressFrom?.latitude ??
                                  AppConstants.demoLatitude,
                              event.parcel?.addressFrom?.longitude ??
                                  AppConstants.demoLongitude),
                          title: "Uzmart"),
                    ));
              },
              markerId: const MarkerId("Uzmart"),
              position: LatLng(
                event.parcel?.addressFrom?.latitude ??
                    AppConstants.demoLatitude,
                event.parcel?.addressFrom?.longitude ??
                    AppConstants.demoLongitude,
              ),
              icon: await image.resizeAndCircle(
                  LocalStorage.getUser().img ?? "", 120)),
          const MarkerId("Githubit"): Marker(
              markerId: const MarkerId("Githubit"),
              onTap: () {
                AppHelper.showCustomModalBottomSheet(
                    context: event.context,
                    modal: Container(
                      padding: EdgeInsets.only(top: 32.r),
                      decoration: BoxDecoration(
                        color: event.colors.backgroundColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16.r),
                          topLeft: Radius.circular(16.r),
                        ),
                      ),
                      child: MapsList(
                          colors: event.colors,
                          location: Coords(
                              event.parcel?.addressTo?.latitude ??
                                  AppConstants.demoLatitude,
                              event.parcel?.addressTo?.longitude ??
                                  AppConstants.demoLongitude),
                          title: "Githubit"),
                    ));
              },
              position: LatLng(
                event.parcel?.addressTo?.latitude ?? AppConstants.demoLatitude,
                event.parcel?.addressTo?.longitude ??
                    AppConstants.demoLongitude,
              ),
              icon: await image.resizeAndCircle("", 120)),
        };
        emit(state.copyWith(markers: list));
        return;
      }
      if (event.order?.deliveryType == "point") {
        Map<MarkerId, Marker> list = {
          const MarkerId("User"): Marker(
              markerId: const MarkerId("User"),
              onTap: () {
                AppHelper.showCustomModalBottomSheet(
                    context: event.context,
                    modal: Container(
                      padding: EdgeInsets.only(top: 32.r),
                      decoration: BoxDecoration(
                        color: event.colors.backgroundColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16.r),
                          topLeft: Radius.circular(16.r),
                        ),
                      ),
                      child: MapsList(
                          colors: event.colors,
                          location: Coords(
                              double.parse(event.order?.deliveryPoint?.location
                                      ?.latitude ??
                                  "${AppConstants.demoLatitude}"),
                              double.parse(event.order?.deliveryPoint?.location
                                      ?.longitude ??
                                  "${AppConstants.demoLongitude}")),
                          title: "User"),
                    ));
              },
              position: LatLng(
                double.parse(event.order?.deliveryPoint?.location?.latitude ??
                    "${AppConstants.demoLatitude}"),
                double.parse(event.order?.deliveryPoint?.location?.longitude ??
                    "${AppConstants.demoLongitude}"),
              ),
              icon: await image.resizeAndCircle("", 120)),
        };
        emit(state.copyWith(markers: list));
        return;
      }
      Map<MarkerId, Marker> list = {
        const MarkerId("Uzmart"): Marker(
            markerId: const MarkerId("Uzmart"),
            onTap: () {
              AppHelper.showCustomModalBottomSheet(
                  context: event.context,
                  modal: Container(
                    padding: EdgeInsets.only(top: 32.r),
                    decoration: BoxDecoration(
                      color: event.colors.backgroundColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.r),
                        topLeft: Radius.circular(16.r),
                      ),
                    ),
                    child: MapsList(
                        colors: event.colors,
                        location: Coords(
                          double.parse((event.order?.type == 1
                                  ? LocalStorage.getWareHouse()
                                      .location
                                      ?.latitude
                                  : event.order?.shop?.location?.latitude) ??
                              "${AppConstants.demoLatitude}"),
                          double.parse(
                              (event.order?.type == 1
                                  ? LocalStorage.getWareHouse()
                                  .location
                                  ?.longitude
                                  : event.order?.shop?.location?.longitude) ??
                                  "${AppConstants.demoLongitude}"),
                        ),
                        title: "Uzmart"),
                  ));
            },
            position: LatLng(
              double.parse((event.order?.type == 1
                  ? LocalStorage.getWareHouse()
                  .location
                  ?.latitude
                  : event.order?.shop?.location?.latitude) ??
                  "${AppConstants.demoLatitude}"),
              double.parse(
                  (event.order?.type == 1
                      ? LocalStorage.getWareHouse()
                      .location
                      ?.longitude
                      : event.order?.shop?.location?.longitude) ??
                      "${AppConstants.demoLongitude}"),
            ),
            icon: await image.resizeAndCircle(
                LocalStorage.getWareHouse().img ?? "", 120)),
        const MarkerId("User"): Marker(
            markerId: const MarkerId("User"),
            onTap: () {
              AppHelper.showCustomModalBottomSheet(
                  context: event.context,
                  modal: Container(
                    padding: EdgeInsets.only(top: 32.r),
                    decoration: BoxDecoration(
                      color: event.colors.backgroundColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.r),
                        topLeft: Radius.circular(16.r),
                      ),
                    ),
                    child: MapsList(
                        colors: event.colors,
                        location: Coords(
                          double.parse(
                              event.order?.address?.location?.latitude ??
                                  "${AppConstants.demoLatitude}"),
                          double.parse(
                              event.order?.address?.location?.longitude ??
                                  "${AppConstants.demoLongitude}"),
                        ),
                        title: "User"),
                  ));
            },
            position: LatLng(
              double.parse(event.order?.address?.location?.latitude ??
                  "${AppConstants.demoLatitude}"),
              double.parse(event.order?.address?.location?.longitude ??
                  "${AppConstants.demoLongitude}"),
            ),
            icon: await image.resizeAndCircle(
                LocalStorage.getUser().img ?? "", 120)),
      };
      emit(state.copyWith(markers: list));
    });
  }
}
