variable "project_id" {
  type        = string
  description = "ID du projet GCP"
}

variable "region" {
  type        = string
  description = "Région GCP"
  default     = "europe-west1"
}

variable "zone" {
  type        = string
  description = "Zone GCP"
  default     = "europe-west1-b"
}

variable "network_name" {
  type        = string
  description = "Nom du VPC"
  default     = "main-vpc"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR du subnet"
  default     = "10.0.0.0/24"
}

variable "db_instance_name" {
  type        = string
  description = "Nom de l'instance Cloud SQL"
  default     = "demo-sql-instance"
}

variable "db_tier" {
  type        = string
  description = "Type de machine pour Cloud SQL"
  default     = "db-f1-micro"
}

variable "db_user" {
  type        = string
  description = "Nom d'utilisateur de la base de données"
  default     = "appuser"
}

variable "db_password" {
  type        = string
  description = "Mot de passe de la base de données"
  sensitive   = true
}

variable "db_name" {
  type        = string
  description = "Nom de la base de données"
  default     = "appdb"
}

variable "bucket_name" {
  type        = string
  description = "Nom du bucket Cloud Storage (doit être globalement unique)"
}

variable "instance_machine_type" {
  type        = string
  description = "Type de machine pour les instances Compute Engine"
  default     = "e2-micro"
}

variable "instance_group_size_min" {
  type        = number
  description = "Taille minimale du groupe d'instances"
  default     = 1
}

variable "instance_group_size_max" {
  type        = number
  description = "Taille maximale du groupe d'instances"
  default     = 3
}

variable "lb_port" {
  type        = number
  description = "Port HTTP du load-balancer"
  default     = 80
}
