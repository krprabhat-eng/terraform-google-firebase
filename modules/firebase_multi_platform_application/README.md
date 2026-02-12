# Firebase Multi-Platform Application Module

This submodule provides a comprehensive bootstrap for a Firebase project, including API enablement, project initialization, and the creation of up to three platform-specific apps (Web, iOS, Android) within a single logical application group.

## Features

- **Automated API Enablement**: Enables `firebase.googleapis.com`, `serviceusage.googleapis.com`, `cloudresourcemanager.googleapis.com`, and `identitytoolkit.googleapis.com`.
- **Project Initialization**: Converts a standard Google Cloud project into a Firebase project.
- **Multi-Platform App Creation**: Register Web, Android, and Apple (iOS) apps simultaneously.
- **Shared Branding**: Uses a single `display_name` across all apps for consistency.
- **Secure Configuration Outputs**: Retrieves and outputs `google-services.json`, `GoogleService-Info.plist`, and Web SDK snippets as sensitive values.

## Usage

```hcl
module "firebase_app" {
  source       = "./modules/firebase_multi_platform_application"
  project_id   = "my-project-id"
  display_name = "My Awesome App"

  web_app = {}

  android_app = {
    package_name = "com.example.app"
  }

  apple_app = {
    bundle_id = "com.example.app"
  }
}
```


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| android\_app | Configuration for a Firebase Android App. Set to null to skip. | <pre>object({<br>    package_name  = string<br>    sha256_hashes = optional(list(string))<br>  })</pre> | `null` | no |
| apple\_app | Configuration for a Firebase Apple (iOS) App. Set to null to skip. | <pre>object({<br>    bundle_id = string<br>    team_id   = optional(string)<br>  })</pre> | `null` | no |
| display\_name | The display name for all apps in this instance. | `string` | n/a | yes |
| project\_id | The GCP project ID to initialize Firebase in. | `string` | n/a | yes |
| web\_app | Configuration for a Firebase Web App. Set to null to skip. | <pre>object({<br>    api_key_id = optional(string)<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| android\_config | The google-services.json content for the Android App. |
| app\_ids | Map of platform names to their respective Firebase App IDs. |
| ios\_config | The GoogleService-Info.plist content for the Apple App. |
| project\_id | The project ID. |
| web\_config | The configuration snippet for the Firebase Web App. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
