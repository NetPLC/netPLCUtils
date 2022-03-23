// Copyright 2019 Smarter Grid Solutions
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http ://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissionsand
// limitations under the License.

#ifndef RUNTIME_CORE_SERVICE_SERVICE_REGISTRY_H_
#define RUNTIME_CORE_SERVICE_SERVICE_REGISTRY_H_

#include <cstdint>

/** \addtogroup openplc_runtime
 *  @{
 */

class ServiceDefinition;

const std::size_t MAX_SERVICE_NAME_SIZE = 512;

/// @brief Finds the service in the registry by the name of the service.
/// @param name The identifier for the service.
/// @return The service if found, or nullptr if there is no such service.
ServiceDefinition* services_find(const char* name);

/// Stop all known services.
void services_stop();

/// Initialize all known services.
void services_init();

/// Finalize all known services.
void services_finalize();

/// Run the service function before the cycle.
void services_before_cycle();

/// Run the service function after the cycle.
void services_after_cycle();

/** @}*/

#endif  // RUNTIME_CORE_SERVICE_SERVICE_DEFINITION_H_
