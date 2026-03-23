---
date: 2026-03-23
type: learning
tags: [vm, isolation, testing, cross-platform]
confidence: high
source: session
id: a6b7c8d9-e0f1-5234-5678-abcdef012345
---

# VM Isolation Options for Agent Brain Testing

## Insight
Testing a brain setup on a clean machine requires VM isolation. The best tool depends on your platform.

## Recommendations by Platform

### macOS (Apple Silicon)
| Tool | Best For | License |
|------|----------|---------|
| **Lume** | AI agent VMs, automated provisioning | MIT |
| **Tart** | CI/CD pipelines, GitHub Actions | Fair Source |
| **UTM** | General purpose, multi-architecture | Free/OSS |

**Lume** is recommended for agent workflows — it's built for AI agent isolation, has an MCP server, and automated Setup Assistant that creates ready-to-use macOS VMs via VNC/OCR.

```bash
# Install
brew install --cask lume

# Create and run a macOS VM
lume pull macos-sequoia-base
lume run my-test-vm --shared-dir ./agentBrain:rw
```

### Windows
| Tool | Best For | License |
|------|----------|---------|
| **WSL2** | CLI tools, lightweight isolation | Free (Microsoft) |
| **Hyper-V** | Full OS isolation, desktop VMs | Free (Pro+ edition) |

**WSL2** is sufficient for testing brain setup scripts. Hyper-V for full isolation.

```powershell
# WSL2: install and run
wsl --install -d Ubuntu
wsl -d Ubuntu -- bash ./scripts/setup.sh
```

### Linux x86_64
| Tool | Best For | License |
|------|----------|---------|
| **KVM/QEMU** | Headless VMs, full isolation | Free/OSS |
| **Docker** | Container isolation, lightweight | Free/OSS |
| **Proxmox** | Infrastructure at scale | Free/OSS |

```bash
# Docker: quick test
docker run -it -v ./agentBrain:/brain ubuntu:latest bash /brain/scripts/setup.sh
```

### Raspberry Pi (ARM64)
| Tool | Best For | License |
|------|----------|---------|
| **KVM/QEMU** | Headless VMs on Pi 4+ | Free/OSS |
| **Docker** | Container isolation | Free/OSS |

```bash
# Docker on Pi
docker run -it --platform linux/arm64 -v ./agentBrain:/brain alpine:latest sh /brain/scripts/setup.sh
```

## Comparison Matrix

| Tool | macOS | Windows | Linux | ARM64 | CLI | AI-Ready |
|------|:-----:|:-------:|:-----:|:-----:|:---:|:--------:|
| Lume | yes | - | - | - | yes | yes |
| Tart | yes | - | - | - | yes | - |
| UTM | yes | - | yes | - | yes | - |
| WSL2 | - | yes | - | - | yes | - |
| Hyper-V | - | yes | - | - | yes | - |
| KVM/QEMU | - | - | yes | yes | yes | - |
| Docker | yes | yes | yes | yes | yes | - |

## Key Decision: Lume vs Tart
- **Lume**: MIT license, AI-focused, MCP server, automated provisioning — better for agent workflows
- **Tart**: Fair Source license, CI/CD focused, larger community — better for build pipelines
- Both use Apple's Virtualization.framework, similar performance

## Related
- [[Memory-Architecture]] — brain architecture
- [[Patterns]] — testing patterns
