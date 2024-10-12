

################################################################
# GCP CONFIG
################################################################
# Foundations
export PROJECT_ID='devfest-mo-2024' # Put your project id here
export GCP_REGION='europe-west8' # Milan

# App context - step 04.
export CLOUDSQL_INSTANCE_NAME='appmod-phpapp'
export CLOUDSQL_INSTANCE_PASSWORD='qwerty45' # TODO see step 4.
#export CLOUDSQL_INSTANCE_REGION - we will assume the same as GCP_REGION


################################################################
# DB CONFIG
################################################################
# Low privacy passwords
DB_HOST='34.154.154.106' # See step 4. Can be a name or IP, eg "localhost" or "34.1.2.3"
DB_NAME='image_catalog'
DB_USER='appmod-phpapp-user'
# High privacy password -> We'll move it to Secret Manager in a next step


################################################################
# Gemini CONFIG
################################################################
# Get it here: https://ai.google.dev/gemini-api/docs/api-key
GEMINI_API_KEY='AIzaSyD_sskZlBPXNEtLPX4pkyKqleRy1HNCkqU'

PROJECT_NUMBER="87906094229" # your project number
gcloud --project "$PROJECT_ID" run deploy \
    php-amarcord-bin \
    --source . \
    --port 80 \
    \
    --set-secrets DB_PASS="projects/$PROJECT_NUMBER/secrets/php-amarcord-db-pass" \
    \
    --set-env-vars DB_USER="$DB_USER" \
    --set-env-vars DB_HOST="$DB_HOST" \
    --set-env-vars DB_NAME="$DB_NAME" \
    --set-env-vars APP_NAME="$APP_NAME (built locally from CLI)" \
    --set-env-vars APP_VERSION="${APP_VERSION}-obsolete-cli" \
    \
    --region europe-west8 \
    --allow-unauthenticated