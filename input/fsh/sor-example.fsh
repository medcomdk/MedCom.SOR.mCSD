// jurisdiction pair

Instance: SOR-JurisdictionOrganization-Example
InstanceOf: SOR-JurisdictionOrganization
Title: "Example SOR Jurisdiction Organization"
Description: "Organization resource for an example SOR Jurisdiction"
Usage: #example
* name = "SOR-JurisdictionOrganization-Example"
* active = true
* type[jurisdiction] = SOR-OrganizationLocationTypes#jurisdiction

Instance: SOR-JurisdictionLocation-Example
InstanceOf: SOR-JurisdictionLocation
Title: "Example SOR Jurisdiction Location"
Description: "Location resource for an example SOR Jurisdiction"
Usage: #example
* name = "SOR-JurisdictionLocation-Example"
* status = #active
* managingOrganization = Reference(SOR-JurisdictionOrganization-Example)
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#jdn
* type[jurisdiction] = SOR-OrganizationLocationTypes#jurisdiction

// another department

Instance: SOR-Organization-ExamplePartner
InstanceOf: SOR-Organization
Title: "Example Partner Organization"
Description: "Example Organization for a Partner Organization"
Usage: #example
* name = "Organization-ExamplePartner"
* active = true
* type[+] = http://terminology.hl7.org/CodeSystem/organization-type#govt

// Hierarchy Code System Example
CodeSystem:  SOR-ExampleHierarchy
Id: SOR-example-hierarchy
Title: "SOR Example Hierarchy Code System"
Description:  "An example vocabulary of hierarchies."
* ^caseSensitive = false
* ^content = #complete
* ^experimental = true
// * ^url = http://example.org/IHE/CodeSystem/sor-example-hierarchy
* #supply "Supply Chain"
* #admin "Administrative"

// facility pair which is part of a jurisdiction and has one other external org attached

Instance: SOR-FacilityOrganization-Example
InstanceOf: SOR-FacilityOrganization
Title: "Example SOR Facility Organization"
Description: "Organization resource for an example SOR Facility"
Usage: #example
* name = "SOR-FacilityOrganization-Example"
* active = true
* type[facility] = SOR-OrganizationLocationTypes#facility
* partOf = Reference(SOR-JurisdictionOrganization-Example)

Instance: SOR-FacilityOrganizationAffiliation-Example
InstanceOf: SOR-OrganizationAffiliation
Title: "Example SOR Facility Admin Organization Affiliation"
Description: "Organization Affiliation resource for an example administrative relationship for a facility."
Usage: #example
* active = true
* organization = Reference(SOR-Organization-ExamplePartner)
* participatingOrganization = Reference(SOR-FacilityOrganization-Example)
* code = SOR-ExampleHierarchy#admin

Instance: SOR-FacilityLocation-Example
InstanceOf: SOR-FacilityLocation
Title: "Example SOR Facility Location"
Description: "Location resource for an example SOR Facility"
Usage: #example
* name = "SOR-FacilityLocation-Example"
* status = #active
* managingOrganization = Reference(SOR-FacilityOrganization-Example)
* partOf = Reference(SOR-JurisdictionLocation-Example)
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#bu
* type[facility] = SOR-OrganizationLocationTypes#facility
* type[service] = http://terminology.hl7.org/CodeSystem/v3-RoleCode#HOSP

Instance: SOR-Location-Example
InstanceOf: SOR-Location
Title: "Example SOR Location"
Description: "Location resource for an example of an SOR Location (Ward)"
Usage: #example
* name = "SOR-Location-Example"
* status = #active
* partOf = Reference(SOR-FacilityLocation-Example)
* type[+] = http://terminology.hl7.org/CodeSystem/v3-RoleCode#RNEU
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#wa

Instance: SOR-LocationDistance-Example
InstanceOf: SOR-LocationDistance
Title: "Example SOR Location with Distance Option"
Description: "Location resource for an example of an SOR Location with Distance Option"
Usage: #example
* name = "SOR-LocationDistance-Example"
* status = #active
* type[+] = http://terminology.hl7.org/CodeSystem/v3-RoleCode#HOSP
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#bu
* position.latitude = -1.46929510804737
* position.longitude = -78.81700744576973

// service, role, practitioner

Instance: SOR-HealthcareService-Example
InstanceOf: SOR-HealthcareService
Title: "Example SOR HealthcareService"
Description: "HealthcareService resource example for SOR."
Usage: #example
* name = "ANC"
* type = http://terminology.hl7.org/CodeSystem/service-type#124 "General Practice"
* location = Reference(SOR-FacilityLocation-Example)

Instance: SOR-PractitionerRole-Example
InstanceOf: SOR-PractitionerRole
Title: "Example SOR PractitionerRole"
Description: "PractitionerRole resource example for SOR."
Usage: #example
* code = http://terminology.hl7.org/CodeSystem/practitioner-role#nurse
* location = Reference(SOR-FacilityLocation-Example)
* healthcareService = Reference(SOR-HealthcareService-Example)
* organization = Reference(SOR-FacilityOrganization-Example)
* practitioner = Reference(SOR-Practitioner-Example)

Instance: SOR-Practitioner-Example
InstanceOf: SOR-Practitioner
Title: "Example SOR Practitioner"
Description: "Practitioner resource example for SOR."
Usage: #example
* name.text = "John Galt" 

// bundler

Instance: Example-SOR
InstanceOf: Bundle
Title: "Example Bundle of SOR Resources"
Description: "Example Bundle of Core SOR Resources."
Usage: #example
* type = #transaction


* entry[+].fullUrl = "http://www.example.org/fhir/Organization/SOR-JurisdictionOrganization-Example"
* entry[=].request.url = "Organization/SOR-JurisdictionOrganization-Example"
* entry[=].request.method = #PUT
* entry[=].resource = SOR-JurisdictionOrganization-Example

* entry[+].fullUrl = "http://www.example.org/fhir/Location/SOR-JurisdictionLocation-Example"
* entry[=].request.url = "Location/SOR-JurisdictionLocation-Example"
* entry[=].request.method = #PUT
* entry[=].resource = SOR-JurisdictionLocation-Example

* entry[+].fullUrl = "http://www.example.org/fhir/Organization/SOR-Organization-ExamplePartner"
* entry[=].request.url = "Organization/SOR-Organization-ExamplePartner"
* entry[=].request.method = #PUT
* entry[=].resource = SOR-Organization-ExamplePartner

* entry[+].fullUrl = "http://www.example.org/fhir/Organization/SOR-FacilityOrganization-Example"
* entry[=].request.url = "Organization/SOR-FacilityOrganization-Example"
* entry[=].request.method = #PUT
* entry[=].resource = SOR-FacilityOrganization-Example

* entry[+].fullUrl = "http://www.example.org/fhir/Location/SOR-FacilityLocation-Example"
* entry[=].request.url = "Location/SOR-FacilityLocation-Example"
* entry[=].request.method = #PUT
* entry[=].resource = SOR-FacilityLocation-Example

* entry[+].fullUrl = "http://www.example.org/fhir/HealthcareService/SOR-HealthcareService-Example"
* entry[=].request.url = "HealthcareService/SOR-HealthcareService-Example"
* entry[=].request.method = #PUT
* entry[=].resource = SOR-HealthcareService-Example

* entry[+].fullUrl = "http://www.example.org/fhir/PractitionerRole/SOR-PractitionerRole-Example"
* entry[=].request.url = "PractitionerRole/SOR-PractitionerRole-Example"
* entry[=].request.method = #PUT
* entry[=].resource = SOR-PractitionerRole-Example

* entry[+].fullUrl = "http://www.example.org/fhir/Practitioner/SOR-Practitioner-Example"
* entry[=].request.url = "Practitioner/SOR-Practitioner-Example"
* entry[=].request.method = #PUT
* entry[=].resource = SOR-Practitioner-Example

* entry[+].fullUrl = "http://www.example.org/fhir/OrganizationAffiliation/ex-OrgAff"
* entry[=].request.url = "OrganizationAffiliation/ex-OrgAff"
* entry[=].request.method = #PUT
* entry[=].resource = ex-OrgAff

* entry[+].fullUrl = "http://www.example.org/fhir/Organization/ex-OrgA"
* entry[=].request.url = "Organization/ex-OrgA"
* entry[=].request.method = #PUT
* entry[=].resource = ex-OrgA

* entry[+].fullUrl = "http://www.example.org/fhir/Organization/ex-OrgB"
* entry[=].request.url = "Organization/ex-OrgB"
* entry[=].request.method = #PUT
* entry[=].resource = ex-OrgB

* entry[+].fullUrl = "http://www.example.org/fhir/Organization/ex-OrgC"
* entry[=].request.url = "Organization/ex-OrgC"
* entry[=].request.method = #PUT
* entry[=].resource = ex-OrgC

* entry[+].fullUrl = "http://www.example.org/fhir/OrganizationAffiliation/ex-OrgAffC"
* entry[=].request.url = "OrganizationAffiliation/ex-OrgAffC"
* entry[=].request.method = #PUT
* entry[=].resource = ex-OrgAffC

* entry[+].fullUrl = "http://www.example.org/fhir/Endpoint/ex-endpointXCAquery"
* entry[=].request.url = "Endpoint/ex-endpointXCAquery"
* entry[=].request.method = #PUT
* entry[=].resource = ex-endpointXCAquery

* entry[+].fullUrl = "http://www.example.org/fhir/Endpoint/ex-endpointXCAretrieve"
* entry[=].request.url = "Endpoint/ex-endpointXCAretrieve"
* entry[=].request.method = #PUT
* entry[=].resource = ex-endpointXCAretrieve

* entry[+].fullUrl = "http://www.example.org/fhir/Endpoint/ex-endpointDicom"
* entry[=].request.url = "Endpoint/ex-endpointDicom"
* entry[=].request.method = #PUT
* entry[=].resource = ex-endpointDicom
