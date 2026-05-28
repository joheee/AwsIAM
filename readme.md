# AWS IAM Terraform

Terraform project that sets up AWS IAM users and groups with role-based access.

## What this does

Users are placed into groups. Each group has one AWS managed policy attached. Users inherit permissions from their group — not from policies assigned directly to them.

There are three roles:

| Group           | User           | Policy              | Access                           |
| --------------- | -------------- | ------------------- | -------------------------------- |
| `admin_group`   | `admin_user`   | AdministratorAccess | Full account access              |
| `devops_group`  | `devops_user`  | PowerUserAccess     | Manage resources, no IAM changes |
| `auditor_group` | `auditor_user` | ReadOnlyAccess      | View only                        |

## Design Architecture

```mermaid
flowchart TB
    subgraph Users["IAM Users"]
        U1["admin_user"]
        U2["devops_user"]
        U3["auditor_user"]
    end

    subgraph Groups["IAM Groups"]
        G1["admin_group"]
        G2["devops_group"]
        G3["auditor_group"]
    end

    subgraph Policies["AWS Managed Policies"]
        P1["AdministratorAccess"]
        P2["PowerUserAccess"]
        P3["ReadOnlyAccess"]
    end

    U1 -->|member of| G1
    U2 -->|member of| G2
    U3 -->|member of| G3

    G1 -->|attached| P1
    G2 -->|attached| P2
    G3 -->|attached| P3
```
