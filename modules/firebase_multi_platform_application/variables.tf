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


variable "apps" {
  description = "Configuration for Firebase apps."
  type = object({
    web_app = optional(object({
      display_name = string
      api_key_id   = optional(string)
    }))
    android_app = optional(object({
      package_name  = string
      display_name  = optional(string)
      sha256_hashes = optional(list(string))
    }))
    apple_app = optional(object({
      bundle_id    = string
      display_name = optional(string)
      team_id      = optional(string)
    }))
  })
  default = {}
}
