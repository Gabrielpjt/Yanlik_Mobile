import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ServiceAccessSearchType {
  healthFacility,
  doctor,
  bpomProduct,
}

class ServiceAccessResultCard extends StatelessWidget {
  final ServiceAccessSearchType type;
  final Map<String, dynamic> item;
  final ValueChanged<Map<String, dynamic>>? onItemTap;
  final ValueChanged<String>? onCopyRegistrationNumber;

  const ServiceAccessResultCard({
    super.key,
    required this.type,
    required this.item,
    this.onItemTap,
    this.onCopyRegistrationNumber,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ServiceAccessSearchType.bpomProduct:
        return BpomProductCard(product: item);
      case ServiceAccessSearchType.doctor:
        return DoctorCard(
          doctor: item,
          onTap: onItemTap,
          onCopyRegistrationNumber: onCopyRegistrationNumber,
        );
      case ServiceAccessSearchType.healthFacility:
        return FacilityCard(
          facility: item,
          onTap: onItemTap,
        );
    }
  }
}

class BpomProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const BpomProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xFFE5E5E5),
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      product['productName'] as String? ?? '-',
                      style: const TextStyle(
                        fontSize: 17,
                        height: 1.3,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF252525),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(
                    Icons.north_east,
                    size: 18,
                    color: Color(0xFF062F5E),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      product['registrationNumber'] as String? ?? '-',
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.35,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.check_circle,
                    size: 18,
                    color: Color(0xFF279A4B),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              BpomProductInfoRow(
                label: 'Terbit',
                value: product['issuedDate'] as String? ?? '-',
              ),
              const SizedBox(height: 12),
              BpomProductInfoRow(
                label: 'Masa berlaku',
                value: product['validUntil'] as String? ?? '-',
              ),
              const SizedBox(height: 12),
              BpomProductInfoRow(
                label: 'Merek',
                value: product['brand'] as String? ?? '-',
              ),
              const SizedBox(height: 12),
              BpomProductInfoRow(
                label: 'Tipe',
                value: product['type'] as String? ?? '-',
              ),
              const SizedBox(height: 12),
              BpomProductInfoRow(
                label: 'Kemasan',
                value: product['packaging'] as String? ?? '-',
              ),
              const SizedBox(height: 16),
              const Divider(
                height: 1,
                thickness: 1,
                color: Color(0xFFE7E7E7),
              ),
              const SizedBox(height: 16),
              Text(
                product['registrant'] as String? ?? '-',
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.35,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF252525),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                product['location'] as String? ?? '-',
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.4,
                  color: Color(0xFF777777),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}

class DoctorCard extends StatelessWidget {
  final Map<String, dynamic> doctor;
  final ValueChanged<Map<String, dynamic>>? onTap;
  final ValueChanged<String>? onCopyRegistrationNumber;

  const DoctorCard({
    super.key,
    required this.doctor,
    this.onTap,
    this.onCopyRegistrationNumber,
  });

  @override
  Widget build(BuildContext context) {
    final registrationNumber = doctor['registrationNumber'] as String? ?? '-';

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          onTap?.call(doctor);
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFE5E5E5),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.stethoscope,
                        size: 19,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.north_east,
                    size: 17,
                    color: Color(0xFF062F5E),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Text(
                'Tenaga Medis',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF777777),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                doctor['name'] as String? ?? '-',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF164775),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Surat Tanda Registrasi',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF777777),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      registrationNumber,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF164775),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      onCopyRegistrationNumber?.call(registrationNumber);
                    },
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 30,
                      minHeight: 30,
                    ),
                    icon: const Icon(
                      Icons.copy_outlined,
                      size: 17,
                      color: Color(0xFF164775),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              const Text(
                'Spesialis',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF777777),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                doctor['specialization'] as String? ?? '-',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF164775),
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Jadwal Praktik',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF777777),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      doctor['schedule'] as String? ?? '-',
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.4,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF164775),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9F8E9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      doctor['status'] as String? ?? '-',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2E9E4F),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Text(
                'Tempat Praktik',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF777777),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor['hospital'] as String? ?? '-',
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.4,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF164775),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          doctor['city'] as String? ?? '-',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFAAAAAA),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(
                    Icons.location_on_outlined,
                    size: 20,
                    color: Color(0xFFAAAAAA),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Text(
                'No. Telepon',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF777777),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      doctor['phone'] as String? ?? '-',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF164775),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.phone_outlined,
                    size: 19,
                    color: Color(0xFFAAAAAA),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}

class FacilityCard extends StatelessWidget {
  final Map<String, dynamic> facility;
  final ValueChanged<Map<String, dynamic>>? onTap;

  const FacilityCard({
    super.key,
    required this.facility,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final acceptsBpjs = facility['bpjs'] == true;

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          onTap?.call(facility);
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFE5E5E5),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.hospital,
                        size: 20,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.north_east,
                    size: 17,
                    color: Color(0xFF062F5E),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                facility['type'] as String? ?? '-',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF777777),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      facility['name'] as String? ?? '-',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF062F5E),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: acceptsBpjs
                          ? const Color(0xFFEAF3FF)
                          : const Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      acceptsBpjs ? 'BPJS' : 'Non BPJS',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: acceptsBpjs
                            ? const Color(0xFF2471D9)
                            : const Color(0xFF444444),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Alamat',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF777777),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      facility['address'] as String? ?? '-',
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.4,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF164775),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(
                    Icons.location_on_outlined,
                    size: 20,
                    color: Color(0xFFAAAAAA),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                facility['distance'] as String? ?? '-',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2E9E4F),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'No. Telepon',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF777777),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      facility['phone'] as String? ?? '-',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF164775),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.phone_outlined,
                    size: 19,
                    color: Color(0xFFAAAAAA),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}

class BpomProductInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const BpomProductInfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 118,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              height: 1.35,
              color: Color(0xFF666666),
            ),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              height: 1.35,
              fontWeight: FontWeight.w600,
              color: Color(0xFF252525),
            ),
          ),
        ),
      ],
    );
  }
}