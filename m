Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7F83EDE54
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 07:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784792243; cv=none; b=IKrvSvgrlBQ7gQeU0Hu68ygBUbIK7F4CQGdcxlMOhsUABceBai5ePWbe9TDooRP5IlHxXGfIQIIli1xlYgEQ/rFp6kplnBH5fQU2FP6jTaw24sBrFjTqiNKWsII4hsyA9Rk5jLJd02i4z4BeMB6Hc6kDb8+lI41/JRxeDESmyOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784792243; c=relaxed/simple;
	bh=7hdQj4bMhlRP6A7yET8sBVVYL0Q09ir16zBxsAVoKXw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nCv9GiafjQNfUHHypx71p3dDGGuXlALgM8hQ2M4VMBjhY8RqsSzYk7/riHlAPkM2+Vhb7FQy6/JkrnrTa4gCEGC537AIo+GIzdVdwghTwm3cA6K/oHd/p1joI37CiBEI45k5u0HOf4DFybc8O8FONXnmra7CiZzaLK0xgXz0OSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=rvwPgg0D; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="rvwPgg0D"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1784791735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VK2dEEAtsn5jm4PiuInkYdtk4CdTZkxc+t8/mCBMM+0=;
	b=rvwPgg0D9mNjuvxhayGzpNxIiH4wvZe6XbXGHfkQhnF2085HaSnVzMbYyc75aXVlt7ra0C
	fE7mnF1EKm+PBFowDEw+aVUw+271or3cMtSGr+O/O25wL4V7m2ImmV/oC506Of1/owVtQO
	orwI3OJ1i6P6st5HQ3dWjKcM4i+W9yJIPuyjmHQxXUr3qwjxNC8U3x4RRZn/CjkcOe9Yzm
	f8+RQC05Phwjwl8ajy/XTsucoD1TFv9j6gh4ZxNNjncXp1PsHhcIoh6OEQ3bs930pk3VkT
	AmGAb6O9ApDrGwvUuU6tRTF4i9RgLgATc0udADoKhBivLxQmhGLKN5DykQJv6Q==
Subject: [PATCH v3 00/11] Support ELE API in i.MX OCOTP NVMEM driver
Date: Thu, 23 Jul 2026 09:27:22 +0200
Message-Id: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQzW6DMBCEXwX53I38AyZwyntUPWB7SdwWm9rGo
 ory7jVwiHprj7O7+mZn7iRisBhJX91JwGyj9a4I8VIRfRvcFcGaogmnXFLJJCxzTAGHyborOFw
 THBvagZ1W8NqnGfATYWgYN2bspKKCFNoccLTr7vT6dui4qHfUacNvFzcbkw/f+yuZbXf/d80MK
 GjVjkJ2Zy1QXj68S8G7k0Gy2Wb+BLdM/B3MC1iduZSmEw2r1S/w4wgU8GspDaYj5bPAvirUmja
 03amxzEYYakqbhnbCaNln3m0VqKHstJ8mm/oqtycOQdcF//gBzjV1D6gBAAA=
X-Change-ID: 20260616-upstreaming-next-20260609-imx-ocotp-ele-a512ddf96b03
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=5478;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=7hdQj4bMhlRP6A7yET8sBVVYL0Q09ir16zBxsAVoKXw=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvx0FZTz9DJCyZx/Tl1afGGWtc1ExQu+3zrbz7sI/a9i
 UViqrNaRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwERm32dkaI05H+97r7rBwGVx
 taKG+dnFf993fNttOzHRpes4j+xcR0aG3cH7rjDeCDjXxtbVtCOTf44x54IlkZsr5l/c3+i71vM
 YIwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

This patchset depends on "firmware: imx: driver for NXP
secure-enclave" [1].

The imx-ocotp-ele.c driver currently uses the limited FSB (fuseblock)
to access the fuse registers. In order to gain full read/write access
to all fuses, we need to use the Edgelock Secure Enclave firmware.

This patchset does:

* Add bindings to reference ELE device in OCOTP driver (patch 1)
* Export ELE API functions (patch 3)
* Let the OCOTP driver use the ELE API (patch 7)
* Extend the devicetree of i.MX91/i.MX93 boards for using the ELE API
  (patch 10/11)

The rest of the patches contain cleanups that were implemented along
the way.

This was tested using the 'crucible' tool and by directly reading
from the nvmem device on i.MX93.

This still lacks support for the i.MX94 and i.MX95 as I don't have
the hardware for testing on these platforms. As the documentations is
incomplete it is hard to get the keepout table right without testing
on the actual hardware. If someone else can provide the data and
testing, I can add it in a future version. If not this can be done
later.

---
Changes in v3:
- Fix bindings to correctly ignore the secure-enclave property for SoCs other than i.MX93 (thanks Krzysztof)
- Rebase on latest ELE driver patchset (v29) [1]
- Enable ELE in all board devicetrees (suggested by Francesco)
- Put the reserved memory somewhere in the first 256MB of DDR
- Link to v2: https://patch.msgid.link/20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de

Changes in v2:
- Adjust bindings to allow secure-enclave only for i.MX93 and improve commit message (suggested by Krzysztof)
- Export generic ELE API functions to be used by drivers (suggested by Frank and Peng)
- Move the fuse read/write functions to the NVMEM driver (suggested by Frank and Peng)
- Add patch to use __free(kfree) in imx_ocotp_reg_read() to fix memory leak (reported by Sashiko)
- Use device link to prevent SE device from being unbound while referenced (reported by Sashiko)
- Link to v1: https://patch.msgid.link/20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de

[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com/

---
Frieder Schrempf (11):
      dt-bindings: nvmem: imx-ocotp: Add support for secure-enclave
      firmware: imx: ele: Fix indentation in ele_base_msg.h
      firmware: imx: ele: Export API functions
      nvmem: imx-ocotp-ele: Add keepout table for i.MX93
      nvmem: imx-ocotp-ele: Remove device-specific reg_read()
      nvmem: imx-ocotp-ele: Use __free(kfree) in imx_ocotp_reg_read()
      nvmem: imx-ocotp-ele: Support the ELE API
      nvmem: imx-ocotp-ele: Remove the FUSE_ELE type
      nvmem: imx-ocotp-ele: Rename FSB access map
      arm64: dts: Add common include for i.MX93 ELE firmware
      arm64: dts: Enable EdgeLock Secure Enclave on all i.MX91/i.MX93 boards

 .../devicetree/bindings/nvmem/imx-ocotp.yaml       |  14 ++
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts  |   1 +
 .../boot/dts/freescale/imx91-11x11-frdm-s.dts      |   1 +
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts |   1 +
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts    |   1 +
 .../boot/dts/freescale/imx91-phycore-som.dtsi      |   1 +
 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi  |  15 +-
 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi  |   1 +
 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi   |   1 +
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |   9 +
 .../boot/dts/freescale/imx93-11x11-evk-common.dtsi |   1 +
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts |   1 +
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  |   1 +
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |   1 +
 arch/arm64/boot/dts/freescale/imx93-firmware.dtsi  |  28 +++
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    |   1 +
 .../boot/dts/freescale/imx93-phycore-som.dtsi      |   1 +
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi  |   1 +
 arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi  |   1 +
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi   |   1 +
 drivers/firmware/imx/ele_base_msg.c                |  42 ++--
 drivers/firmware/imx/ele_base_msg.h                |  16 +-
 drivers/firmware/imx/ele_common.c                  |  35 ++-
 drivers/firmware/imx/ele_common.h                  |  14 --
 drivers/firmware/imx/se_ctrl.c                     |   6 +-
 drivers/firmware/imx/se_ctrl.h                     |  14 +-
 drivers/nvmem/imx-ocotp-ele.c                      | 244 ++++++++++++++++++---
 include/linux/firmware/imx/se_api.h                |  78 +++++++
 28 files changed, 432 insertions(+), 99 deletions(-)
---
base-commit: 6946cd5d0aa4dd10a414ddcb7a10844fdb0ad345
change-id: 20260616-upstreaming-next-20260609-imx-ocotp-ele-a512ddf96b03
prerequisite-change-id: 20240507-imx-se-if-a40055093dc6:v29
prerequisite-patch-id: 0996915f031a1d899202c5fba75a969d6ce2a53d
prerequisite-patch-id: dbed47ecb907f6b7f7e284c5c1a3c325566eafd7
prerequisite-patch-id: a01f5127b7f2de9db2e90d6995ad1638454388e9
prerequisite-patch-id: 587c80a477788420072172cde87eab19216f7139
prerequisite-patch-id: 1537cc12f7000c7474f8e95d67c8ff3715c51c32
prerequisite-patch-id: d6a8cd2161ea713eebeff46d12f6ae1255c24561
prerequisite-patch-id: 1d8b2e78db2815eaace41a13d571171fb58e4221

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>

