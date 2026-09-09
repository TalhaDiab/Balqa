// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

class GoogleMapsPlaceSearch extends StatefulWidget {
  const GoogleMapsPlaceSearch({
    Key? key,
    this.width,
    this.height,
    required this.googleMapsApiKey,
    this.initialZoom = 14.0,
    this.showSearchBar = true,
    this.showCurrentLocationButton = true,
    this.showZoomControls = true,
    this.markerColor = Colors.red,
    this.searchBoxHintText = 'Search for a place',
  }) : super(key: key);

  final double? width;
  final double? height;
  final String googleMapsApiKey;
  final double initialZoom;
  final bool showSearchBar;
  final bool showCurrentLocationButton;
  final bool showZoomControls;
  final Color markerColor;
  final String searchBoxHintText;

  @override
  State<GoogleMapsPlaceSearch> createState() => _GoogleMapsPlaceSearchState();
}

class _GoogleMapsPlaceSearchState extends State<GoogleMapsPlaceSearch> {
  gmaps.GoogleMapController? _mapController;
  final TextEditingController _searchController = TextEditingController();
  Set<gmaps.Marker> _markers = {};
  gmaps.LatLng _currentPosition =
      const gmaps.LatLng(37.7749, -122.4194); // Default to San Francisco
  bool _isLoading = false;
  String _errorMessage = '';
  bool _mapReady = false;

  @override
  void initState() {
    super.initState();
    // Delay getting the current location until the map is ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        // Just start with a basic map, don't trigger location yet
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    if (_mapController != null) {
      _mapController!.dispose();
    }
    _searchController.dispose();
    super.dispose();
  }

  // Check location permissions and handle user location
  Future<void> _handleLocationButton() async {
    if (!mounted) return;

    try {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });

      // First, make sure the API key is set
      if (widget.googleMapsApiKey.isEmpty) {
        if (mounted) {
          setState(() {
            _errorMessage = 'Google Maps API key is not set';
            _isLoading = false;
          });
        }
        return;
      }

      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (mounted) {
            setState(() {
              _errorMessage = 'Location permissions are denied';
              _isLoading = false;
            });
          }
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        if (mounted) {
          setState(() {
            _errorMessage = 'Location permissions are permanently denied';
            _isLoading = false;
          });
        }
        return;
      }

      // Get current position with a timeout
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      ).catchError((e) {
        if (mounted) {
          setState(() {
            _errorMessage = 'Error getting position: $e';
            _isLoading = false;
          });
        }
        throw e;
      });

      if (!mounted) return;

      final gmaps.LatLng newPosition =
          gmaps.LatLng(position.latitude, position.longitude);

      setState(() {
        _currentPosition = newPosition;
        _isLoading = false;
      });

      // Add marker for current location and move camera
      _addMarker(
        _currentPosition,
        'Current Location',
        'Your current location',
        gmaps.BitmapDescriptor.defaultMarkerWithHue(
            gmaps.BitmapDescriptor.hueBlue),
      );

      if (_mapReady) {
        _moveCamera(_currentPosition);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Location error: $e';
          _isLoading = false;
        });
      }
    }
  }

  // Search for a place using Google Places API
  Future<void> _searchPlace(String query) async {
    if (query.isEmpty || !mounted) return;

    try {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });

      // Make API call to Google Places
      final String url =
          'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=${widget.googleMapsApiKey}';

      final response = await http.get(Uri.parse(url)).timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          throw Exception('Request timed out');
        },
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'OK') {
          // Clear previous markers
          _markers = {};

          // Add marker for the searched place
          final results = data['results'];
          if (results.isNotEmpty) {
            final place = results[0];
            final location = place['geometry']['location'];
            final lat = location['lat'];
            final lng = location['lng'];
            final name = place['name'];
            final address = place['formatted_address'];

            final placeLocation = gmaps.LatLng(lat, lng);

            _addMarker(
              placeLocation,
              name,
              address,
              gmaps.BitmapDescriptor.defaultMarkerWithHue(
                  gmaps.BitmapDescriptor.hueRed),
            );

            if (_mapReady) {
              _moveCamera(placeLocation);
            }
          }
        } else if (data['status'] == 'ZERO_RESULTS') {
          setState(() {
            _errorMessage = 'No places found for "$query"';
          });
        } else {
          setState(() {
            _errorMessage = 'API Error: ${data['status']}';
          });
        }
      } else {
        setState(() {
          _errorMessage = 'Network error: ${response.statusCode}';
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Search error: $e';
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // Add a marker to the map
  void _addMarker(gmaps.LatLng position, String title, String snippet,
      gmaps.BitmapDescriptor icon) {
    if (!mounted) return;

    try {
      final marker = gmaps.Marker(
        markerId: gmaps.MarkerId(position.toString()),
        position: position,
        infoWindow: gmaps.InfoWindow(
          title: title,
          snippet: snippet,
        ),
        icon: icon,
      );

      setState(() {
        _markers.add(marker);
      });
    } catch (e) {
      print('Error adding marker: $e');
    }
  }

  // Move camera to a specific position
  void _moveCamera(gmaps.LatLng position) {
    if (_mapController != null && mounted && _mapReady) {
      try {
        _mapController!.animateCamera(
          gmaps.CameraUpdate.newCameraPosition(
            gmaps.CameraPosition(
              target: position,
              zoom: widget.initialZoom,
            ),
          ),
        );
      } catch (e) {
        print('Error moving camera: $e');
      }
    }
  }

  // Change zoom level
  void _changeZoom(double delta) {
    if (_mapController != null && mounted && _mapReady) {
      try {
        _mapController!.animateCamera(
          gmaps.CameraUpdate.zoomBy(delta),
        );
      } catch (e) {
        print('Error changing zoom: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 400,
      child: Column(
        children: [
          // Search bar
          if (widget.showSearchBar)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: widget.searchBoxHintText,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onSubmitted: (value) {
                  _searchPlace(value);
                },
              ),
            ),

          // Error message
          if (_errorMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                _errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ),

          // Map
          Expanded(
            child: Stack(
              children: [
                gmaps.GoogleMap(
                  initialCameraPosition: gmaps.CameraPosition(
                    target: _currentPosition,
                    zoom: widget.initialZoom,
                  ),
                  markers: _markers,
                  mapType: gmaps.MapType.normal,
                  myLocationEnabled:
                      false, // Set to false initially to prevent crashes
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  compassEnabled: true,
                  onMapCreated: (controller) {
                    setState(() {
                      _mapController = controller;
                      _mapReady = true;
                    });
                  },
                ),

                // Loading indicator
                if (_isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),

                // Controls
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: Column(
                    children: [
                      // Current location button
                      if (widget.showCurrentLocationButton)
                        FloatingActionButton(
                          heroTag: 'btn_location',
                          mini: true,
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          child: Icon(
                            Icons.my_location,
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                          onPressed: _handleLocationButton,
                        ),

                      const SizedBox(height: 8),

                      // Zoom controls
                      if (widget.showZoomControls) ...[
                        FloatingActionButton(
                          heroTag: 'btn_zoom_in',
                          mini: true,
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          child: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                          onPressed: () => _changeZoom(1.0),
                        ),
                        const SizedBox(height: 8),
                        FloatingActionButton(
                          heroTag: 'btn_zoom_out',
                          mini: true,
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          child: Icon(
                            Icons.remove,
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                          onPressed: () => _changeZoom(-1.0),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the `</>` button on the right!
