/**
 * Copyright 2026 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  description = "The GCP project ID to initialize Firebase in."
  type        = string
}

variable "display_name" {
  description = "The display name for all apps in this instance."
  type        = string
}

variable "web_app" {
  description = "Configuration for a Firebase Web App. Set to null to skip."
  type = object({
    api_key_id = optional(string)
  })
  default = null
}

variable "android_app" {
  description = "Configuration for a Firebase Android App. Set to null to skip."
  type = object({
    package_name  = string
    sha256_hashes = optional(list(string))
  })
  default = null
}

variable "apple_app" {
  description = "Configuration for a Firebase Apple (iOS) App. Set to null to skip."
  type = object({
    bundle_id = string
    team_id   = optional(string)
  })
  default = null
}
