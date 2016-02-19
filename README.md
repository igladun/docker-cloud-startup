<h1 align="center">Docker Cloud Startup</h1>

<p align="center">Automatically register a new EC2 instance as a <a href="https://cloud.docker.com">Docker Cloud</a> node on launch with tags.</p>

### What

> This script was developed before **Docker Cloud** launched. It works on both platforms.

This script is run at startup on new EC2 instances (using [`user-data`](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html)) to register the instance as a [Docker Cloud](https://cloud.docker.co) node (using the ["bring you own node"](https://docs.docker.com/docker-cloud/feature-reference/byoh) feature).

### Usage

```bash
# Download URI for script
SCRIPT_URI="https://raw.githubusercontent.com/vidsy/docker-cloud-startup/master/script.sh"

# Docker Cloud User ID
USER="batman"

# Docker Cloud API Key
API_KEY="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

# Timeout for node deployment (e.g. 30s, 2m, 10m)
TIMEOUT="1m"

# Stack UUID (needed for redeploy)
STACK_UUID="xxx"

curl -s $SCRIPT_URI | bash -s $USER $API_KEY $TIMEOUT $STACK_UUID
```

### What's it do?

- Installs `docker-cloud-cli` and `aws-cli`.
- Sets environment variables for Docker Cloud authentication.
- Uses "Bring Your Own Node" CLI command to register new instance as Docker Cloud node.
- Waits for Docker Cloud node deployment to finish.
- Retrieves EC2 instance tags.
- Adds each tag as a Docker Cloud node tag.
- Redeploys the stack.
- Delete all installed packages and Bash history.

### Why

At [Vidsy](http://vidsy.co) we wanted to use Docker Cloud, but also benefit from the controls and features of AWS.

### Tutum?

The script was created back before [Docker Cloud](https://cloud.docker.co) existed, and the platform was called [Tutum](https://tutum.co). If you are still using Tutum then please refer to [this release](https://github.com/vidsy/docker-cloud-startup/releases/tag/v1.0.0-tutum).

### Credentials from S3

Make sure `aws-cli` is installed and a IAM role ([example](https://gist.github.com/revett/491cac41972722a80fca)) configured:

```bash
# Set AWS Region
AWS_DEFAULT_REGION=$(curl -fs ${METADATA_SERVICE_URL}/placement/availability-zone | sed 's/.$//')

# Set S3 Bucket
S3_BUCKET="my-private-bucket"

# Set Environment
ENVIRONMENT="staging"

# Fetch from S3
USER=$(aws s3 cp s3://${S3_BUCKET}/${ENVIRONMENT}/tutum_auth_user - --region ${AWS_DEFAULT_REGION})
API_KEY=$(aws s3 cp s3://${S3_BUCKET}/${ENVIRONMENT}/tutum_auth_api_key - --region ${AWS_DEFAULT_REGION})
```

### Supported Linux Distros

Has been tested on: Ubuntu 14.04, RHEL 7, CentOS 7 and Fedora 23.

### To-Do

Look at any [open issues](https://github.com/vidsy/tutum-startup/issues?utf8=%E2%9C%93&q=is%3Aissue+is%3Aopen+label%3ATo-Do) labeled as `to-do`.

### Use Cases

- ["Cost efficient CI infrastructure with AWS, Docker and Tutum"](https://blog.fabfuel.de/2016/01/27/cost-efficient-ci-infrastructure-with-aws-docker-and-tutum/) by @fabian

### Notes

- Help improve this repo!
- Feel free to ping me (`@revett`) on the [Tutum community Slack](https://tutum-community.slack.com/) with any questions.
- [MIT License (MIT)](https://opensource.org/licenses/MIT).

### Credits

- [@revett](https://github.com/revett)
- [@jskeates](https://github.com/jskeates)
