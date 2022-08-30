To try this out try these steps

1. Create a Domino Environment if it does not exist

Use the base environment as the default DAD

Add the following to the `Dockerfile` instructions
```
RUN sudo apt-get install apt-transport-https ca-certificates gnupg -y
RUN sudo apt-get install apt-transport-https ca-certificates gnupg -y
RUN sudo apt autoremove -y
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN sudo apt-get update && sudo apt-get install google-cloud-cli -y
```

This is an environment for a workspace so remember to add the `Pluggable Workspace Tools` section

2. Create a Service Account on GCP
- Create service account on GCP
- Generate keys for this service account
- Download the keys as a json file. Name it `keys.json`

3. Create a Domino project using this repo and start a workspace using the environment we built in step 1

4. Upload the file `keys.json` in `/tmp/` folder of the workspace

5. Ensure that you set the following project (Set them as user specific environment variables)
```shell
export GCP_PROJECT_ID=${GCP_PROJECT_ID:-unknown}
export SERVICE_ACCOUNT_NAME=${SERVICE_ACCOUNT_NAME:-unknown}
```

6. Finally execute the command
   `./publish_to_gcp_cloud_build.sh example-model`
   
7. If this succeeds go to the `Cloud Run` service in GCP and deploy the image above as a Google Cloud Service

8. Test the endpoint

```shell
curl --location --request POST 'https://<service_endpoint>/predict' \
--header 'Content-Type: application/json' \
--data-raw '{"data": {"start": 1, "stop": 100}}'
```

9. You can also deploy the file `model.py` and the `predict` function to Model API



