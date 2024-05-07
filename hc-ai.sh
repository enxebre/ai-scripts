#!/bin/bash

# Read all input from stdin
hostedCluster=$(cat)

# Check if input is empty
if [[ -z "$hostedCluster" ]]; then
    echo "No input provided."
    exit 1
fi

file_url="https://raw.githubusercontent.com/openshift/hypershift/main/api/hypershift/v1beta1/hostedcluster_conditions.go"
conditions=$(curl -s "$file_url");

prompt="You are an SRE expert responsible for managing and troubleshooting Openshift HostedClusters. HostedCluster state it's granularly signalled in the HostedCluster.Status by using the following conditions ${conditions}. Use this information to give me a summary describing the state of the following HostedCluster: ${hostedCluster}"

# Using the prompt
echo "${prompt}" | ollama run llama3



# ➜  ai-scripts git:(hc-ai) ✗ kubectl get hc -nagarcial agarcial-management -oyaml | ./hc-ai.sh

# Output examples:
# 
# ChatGPT4 
# 
# Based on the detailed HostedCluster status report provided, here's a comprehensive summary describing the state of the agarcial-management HostedCluster within the agarcial namespace:

# Overall Cluster Health and Configuration
# General Health: The HostedCluster appears to be primarily in a healthy state, with most critical components like the KubeAPIServer and Etcd reported as available. The cluster's control plane is operational, which is crucial for managing and orchestrating the cluster resources effectively.
# Configuration Validity: The configurations for both the HostedControlPlane and the HostedCluster are valid, indicating that the inputs for the cluster's operation are correctly set and recognized by the management systems.
# Infrastructure: The infrastructure necessary for the operation of the control plane, including network and storage components, is fully functional. This includes successful provisioning of AWS resources as indicated by the successful creation of a default security group.
# Issues and Concerns
# Cluster Version Progression: There are issues with some cluster operators not being available, which has stalled the progression of the cluster to fully adopting the new version 4.15.11. Specifically, operators like DNS, image registry, ingress, kube-storage version migrator, node-tuning, and storage are reported as not available. This is a significant concern as it impacts the cluster's ability to manage workloads effectively and perform necessary operations related to networking and storage.
# External DNS Configuration: The status of the External DNS is unknown, which could lead to issues with routing and accessing services externally. This requires further investigation and potential reconfiguration to ensure external accessibility and service resolution.
# AWS KMS Configuration: The AWS KMS configuration status is unknown, which may affect encryption and security operations within the cluster. This needs to be addressed to ensure data security and compliance with security best practices.
# Operational Insights
# Reconciliation: The reconciliation process has completed successfully, which means recent changes or updates have been effectively applied, and the cluster's actual state matches the desired state as per the configuration.
# Cluster Operators: The report on non-available cluster operators is concerning and is the primary blocker to declaring the cluster fully operational in its desired configuration. Addressing the availability and functionality of these operators is critical.
# Recommendations
# Investigate Cluster Operators: Immediate action is required to investigate and rectify the issues causing the unavailability of critical cluster operators. Logs and detailed status reports from these operators will provide insight into the underlying problems.
# External DNS Verification: Verify the configuration and operational status of the external DNS settings. Ensure that DNS entries are correctly configured and that the DNS service is operational and reachable.
# AWS KMS Configuration Check: Investigate the AWS KMS configuration to ensure that encryption keys are correctly set up and that the necessary permissions are in place for their operation.
# Conclusion
# While the agarcial-management HostedCluster is operational with a functional control plane and valid configurations, issues with cluster version progression due to non-available operators and uncertainties around external DNS and AWS KMS configurations present challenges that need immediate attention to ensure stability, security, and full functionality.


# LLama3
# 
# Based on the provided conditions and reasons, I can summarize the state of the HostedCluster as follows:

# **General Status:** The HostedCluster is in a good state, with most conditions checking out as "AsExpected" or "Valid". However, there are some
# conditions that need attention.

# **Infrastructure Status:** The infrastructure status is unknown (StatusUnknownReason). This could be due to various reasons such as waiting for
# available resources, secret not found, or blocked by another condition.

# **Etcd Quorum:** Etcd quorum availability is unknown (EtcdQuorumAvailableReason). However, the Unmanaged Etcd is misconfigured
# (UnmanagedEtcdMisconfiguredReason), which might affect the overall cluster state.

# **Cluster Version:** The ClusterVersionReleaseAccepted condition is valid, indicating that the cluster version release is accepted. However, the
# ValidReleaseImage condition is not applicable (InvalidImageReason), suggesting that there might be issues with the image used for the HostedCluster.

# **Reconciliation:** Reconciliation is active (ReconciliationActiveConditionReason), but reconciliation has succeeded in the past
# (ReconciliationSucceededConditionReason). This suggests that the cluster state is being actively managed, and previous reconciliations have been
# successful.

# **Other Conditions:**

# * The PlatformCredentialsFound condition is valid, indicating that the required platform credentials are present.
# * The ReconciliationPaused condition is not applicable (InvalidPausedUntilConditionReason), suggesting that reconciliation is not paused.
# * KubeVirt suboptimal MTU detection is detected (KubeVirtSuboptimalMTUDetectedReason).

# Overall, while there might be some issues with the infrastructure status and etcd quorum availability, the cluster version release is accepted, and
# reconciliation is active. Additionally, the platform credentials are present, but reconciliation is not paused. Finally, kubevirt suboptimal MTU
# detection is detected.



