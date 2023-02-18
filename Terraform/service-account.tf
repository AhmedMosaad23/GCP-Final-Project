resource "google_service_account" "gcp-my-service" {
    account_id = "gcp-my-service"
    project = "ahmed-mossad"
  
}
resource "google_project_iam_member" "service-iam" {
    project = "ahmed-mossad"
    role = "roles/storage.admin"
    members = ["serviceAccount:${google_service_account.gcp-my-service.email}"]
}