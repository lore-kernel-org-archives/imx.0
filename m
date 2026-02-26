Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3686F36C0BE
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772113267; cv=none; b=rPLtn2h5QEeIc78kteAWYL8tnnUXRaxid+fkxyUl98QHleD7kRC8EMHhTNhd72rJZrMYLE8u344qtlbOMALjvf9D7fjO5b0o3amIxM32VQPpdR4jMXFeW6gO03w9AoSy7obaOS7aLoNbwf/PDEG8JiWbAPv6zP2ZAkuqbo/S8I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772113267; c=relaxed/simple;
	bh=/7MY8hy5jQlEhxj9eGiR1iRl0W6znJ9KfDclM2QxDN8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GzWrZiR6DgA/ySdwdp9jG1KLyZCs8vVMpuYmnQLffKFctyd5nkK/7Jc/nbBjHzQHU6lFy/PJm3/Oa31/QCCzs2FotIcVukjE3SoshseJMuVhF0iqCIuPtHXvLApzkZUNZqybtC9YTX0vRYcrqO5vZLXy2Nmp040bXdaCx3ak/n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 05E7A1A14A6;
	Thu, 26 Feb 2026 14:40:58 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EBD211A2549;
	Thu, 26 Feb 2026 14:40:57 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com [10.162.246.145])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 3F2952035B;
	Thu, 26 Feb 2026 14:40:56 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Subject: [PATCH 0/9] accel: New driver for NXP's Neutron NPU
Date: Thu, 26 Feb 2026 15:40:39 +0200
Message-Id: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFhNoGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyMz3bzU0pKi/DzdZBNj01RjyxRDM/M0JaDqgqLUtMwKsEnRsbW1AOD
 Yn/tZAAAA
X-Change-ID: 20260226-neutron-c435e39d167f
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772113256; l=3577;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=/7MY8hy5jQlEhxj9eGiR1iRl0W6znJ9KfDclM2QxDN8=;
 b=XoBoTREGvNXkcj74Qdwpy1rPE9Srk5uacOSO9MTQQEa59XXxIe2u/tWgmnYx+T7BKj7G+iZtI
 ZjQy748HLl7D6BMVVeD4pa/vQ8RKwzMN3ApPcTl7A9vLaek1BrNL4df
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP

Introduce a new accel driver for the Neutron Neural Processing Unit
(NPU), along with associated dt-bindings and DTS node.

The first patch extends the GEM DMA helper APIs to allow bidirectional
mapping of non-coherent DMA buffers. While not part of the Neutron
driver, it's a prerequisite allowing us to use the GEM DMA helper.

Neutron is a Neural Processing Unit from NXP, providing machine
learning (ML) acceleration for edge AI applications. Neutron is
integrated on NXP SoCs such as the i.MX95.

The NPU consists of the following:
- RISC-V core running a proprietary firmware
- One or more Neutron cores, representing the main computation
  engine performing ML operations
- Dedicated fast memory (TCM)
- DMA engine that handles data transfers between DDR and TCM

The firmware is closed source and distributed as a binary here [1].

The Neutron software stack also contains a userspace library [1] and
a LiteRT custom delegate [2] that allow integration with standard
LiteRT tools.

[1] https://github.com/nxp-upstream/neutron/tree/upstream
[2] https://github.com/nxp-imx/tflite-neutron-delegate

Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
Ioana Ciocoi-Radulescu (9):
      drm/gem-dma: Add flag for bidirectional mapping of non-coherent GEM DMA buffers
      accel/neutron: Add documentation for NXP Neutron accelerator driver
      dt-bindings: npu: Add bindings for NXP Neutron
      accel/neutron: Add driver for NXP Neutron NPU
      accel/neutron: Add GEM buffer object support
      accel/neutron: Add mailbox support
      accel/neutron: Add job submission IOCTL
      accel/neutron: Add logging support
      arm64: dts: imx95: Add Neutron node

 Documentation/accel/index.rst                      |   1 +
 Documentation/accel/neutron/index.rst              |  12 +
 Documentation/accel/neutron/neutron.rst            | 131 ++++++++
 .../devicetree/bindings/npu/nxp,imx95-neutron.yaml |  95 ++++++
 MAINTAINERS                                        |  10 +
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  28 ++
 drivers/accel/Kconfig                              |   1 +
 drivers/accel/Makefile                             |   3 +-
 drivers/accel/neutron/Kconfig                      |  16 +
 drivers/accel/neutron/Makefile                     |  12 +
 drivers/accel/neutron/neutron_debugfs.c            |  34 ++
 drivers/accel/neutron/neutron_debugfs.h            |  15 +
 drivers/accel/neutron/neutron_device.c             | 239 ++++++++++++++
 drivers/accel/neutron/neutron_device.h             | 158 +++++++++
 drivers/accel/neutron/neutron_driver.c             | 262 +++++++++++++++
 drivers/accel/neutron/neutron_driver.h             |  16 +
 drivers/accel/neutron/neutron_gem.c                | 115 +++++++
 drivers/accel/neutron/neutron_gem.h                |  14 +
 drivers/accel/neutron/neutron_job.c                | 367 +++++++++++++++++++++
 drivers/accel/neutron/neutron_job.h                |  45 +++
 drivers/accel/neutron/neutron_mailbox.c            |  47 +++
 drivers/accel/neutron/neutron_mailbox.h            |  42 +++
 drivers/gpu/drm/drm_gem_dma_helper.c               |   6 +-
 include/drm/drm_gem_dma_helper.h                   |   3 +
 include/uapi/drm/neutron_accel.h                   | 130 ++++++++
 25 files changed, 1799 insertions(+), 3 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260226-neutron-c435e39d167f

Best regards,
-- 
Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>

