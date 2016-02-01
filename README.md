<h1 align="center">tutum-startup</h1>

<p align="center">Register a new EC2 instance as a <a href="https://tutum.co">Tutum</a> node on launch.</p>

### What

This script is run at startup on new EC2 instances ([`user-data`](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html)) to register the instance as a [Tutum](https://tutum.co) node. Making use of the [Bring Your Own Node](https://support.tutum.co/support/solutions/articles/5000513678-bring-your-own-node) feature.

### Why

At [Vidsy](http://vidsy.co) we wanted to use Tutum, but also benefit from the controls and features of AWS.


### Implementation

Currently the script:

1. Installs `tutum-cli` and `aws-cli`.
1. Retrieves Tutum authentication from AWS S3 bucket.
1. Registers new instance as Tutum node via CLI.
1. Remove nodes from Tutum which have become "`Unreachable`".
1. Waits for Tutum deployment to finish.
1. Retrieves EC2 instance tags.
1. Adds each tag as a Tutum tag.
1. Delete all installed packages and Bash history.

### Supported Linux Distros

Has been tested on: Ubuntu 14.04, RHEL 7, CentOS 7 and Fedora 23.

> Make sure to check your OS is compatible with the **Tutum Agent** ([see list](https://support.tutum.co/support/solutions/articles/5000513678-bring-your-own-node)).

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
