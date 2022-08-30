export GCP_PROJECT_ID=${GCP_PROJECT_ID:-unknown}
export SERVICE_ACCOUNT_NAME=${SERVICE_ACCOUNT_NAME:-unknown}
export GCP_KEY_FILENAME=/tmp/keys.json
gcloud auth activate-service-account $SERVICE_ACCOUNT_NAME --key-file=$GCP_KEY_FILENAME
gcloud config set project $GCP_PROJECT_ID
VERSION=$1
gcloud builds submit --tag gcr.io/$GCP_PROJECT_ID/$VERSION