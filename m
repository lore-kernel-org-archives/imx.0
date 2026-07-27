Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD843E44EC
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 13:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157307; cv=none; b=j7rbg6iMdc+mmvyLXXgIyZzz7cbWiV/DdziPmSO3ysnWHdl4lBaoxId/veA9SijmV5RR/MCP5xCs63uaZBsMgkUxod2HNKOum/Jw1vISNw+s0VwGVXTi9f8LQesHiyrw6Riawe4o9Kre3xxHWgfsxZrbosMjug736ctXv1roz0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157307; c=relaxed/simple;
	bh=YK5OdSR1QowU1r8WBPCaMWSaLr3DPL1F/O73F49XiFM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PmIwwIzmAZ/FhQLgqIjIOP+KlJ41fvMlx/oeicq3v6FTig2hQdcg6H2xKuZtqiQE++Yn6NHzon9CAHNbvST0LRcX0u0V+QadH//51a6UnRzaBxuzuRQoA6nlxQ1sEw6maCnBYv8JHAJIg0CN7UqfwSeYSyccfQFeh2Ao2sHjOlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=Mf7FqoGg; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="Mf7FqoGg"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1785157294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HNVs8+hT9kItazy6RpqgZDgK0NhhYEZGk+Px7mtigo4=;
	b=Mf7FqoGgHbbINxfvs/08ISE0FHazlgEtxJ57oAFhOZXnMDa7zzR6Ua5j6zMNpiLjFsbN9q
	qPUDN/hg/4jw8OF8MSJpRWE+NAO5YRHu1TzQzM+x7tx5SB50uZTfp7dtVTofKe3LxRK/VT
	HIkK7SNMe8b+WnkMeDfgyMc5EDd/vCRNaRFHDw70GiFS/stodBVFKzCqS+4rCmcHw/F8DW
	0N2jy71q3m8/r+qQQx3WWNvZciKQA0b6kcJpzBSm5wobVhDNUIA+r2VMH76nPmutS6+1aw
	fNAeEpEQ1wi//We0J+kVDKumz1kyznG60Tzx18j/oEuOJaSVVz8Obmd2G8Bfew==
Subject: [PATCH v4 00/11] Support ELE API in i.MX OCOTP NVMEM driver
Date: Mon, 27 Jul 2026 15:00:43 +0200
Message-Id: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XRS27DIBAG4KtYrEvE27FXvUfVhYFxQluDCxi5i
 nL34niRVt00y2FG36B/LihBdJBQ31xQhOKSC74W4qlB5jz4E2Bna40YYYooqvAypxxhmJw/YQ9
 rxnuHdNhNKw4m5BnDB+BBUmbt2ClNOKraHGF0623Ty+tep0W/gckbv02cXcohft2+Uug29/jWQ
 jHBRrcjV93RcFDP78HnGPzBAtrWFnaHW8r/D7MK6yNTynZcUqH/wPwHzB6AeYWBqY4TLqQW5hd
 83ZOK8LnU0+Q9vvtl+qaqgkjS3tRU30Y8CEKkJB23RvWFky1bPdSeCdPkct+U9sBwNKLy129he
 HVBAQIAAA==
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
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=6460;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=YK5OdSR1QowU1r8WBPCaMWSaLr3DPL1F/O73F49XiFM=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISs9bHrljJuTFDP2N163OFF0bQHrrv0LbAsTRQ56GO9+W
 N1qsf1iRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwET27mFkmMXd1rf6R9AlI/5N
 hye7OPf5/ra2VM27tftp1tTASStKZjAyXJkjPU1R8MKVqPLvdY6XN9mkrJxpFHKAc66z6zaZ4J6
 LjAA=
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
Changes in v4:
- Reorder allOf in bindings and extend property description (thanks Krzysztof)
- Add R-b from Krzysztof
- Add R-b from Frank
- Improve scope-based cleanup (thanks Frank)
- Move firmware node from patch 11 to 10
- Link to v3: https://patch.msgid.link/20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de

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

To: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Peng Fan (OSS) <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux@ew.tq-group.com

---
Frieder Schrempf (11):
      dt-bindings: nvmem: imx-ocotp: Add support for secure-enclave
      firmware: imx: ele: Fix indentation in ele_base_msg.h
      firmware: imx: ele: Export API functions
      nvmem: imx-ocotp-ele: Add keepout table for i.MX93
      nvmem: imx-ocotp-ele: Remove device-specific reg_read()
      nvmem: imx-ocotp-ele: Use scope-based cleanup helpers in imx_ocotp_reg_read()
      nvmem: imx-ocotp-ele: Support the ELE API
      nvmem: imx-ocotp-ele: Remove the FUSE_ELE type
      nvmem: imx-ocotp-ele: Rename FSB access map
      arm64: dts: Add ELE firmware node and common include
      arm64: dts: Enable EdgeLock Secure Enclave on all i.MX91/i.MX93 boards

 .../devicetree/bindings/nvmem/imx-ocotp.yaml       |  23 +-
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
 drivers/nvmem/imx-ocotp-ele.c                      | 239 +++++++++++++++++----
 include/linux/firmware/imx/se_api.h                |  78 +++++++
 28 files changed, 428 insertions(+), 107 deletions(-)
---
base-commit: 6946cd5d0aa4dd10a414ddcb7a10844fdb0ad345
change-id: 20260616-upstreaming-next-20260609-imx-ocotp-ele-a512ddf96b03
prerequisite-change-id: 20240507-imx-se-if-a40055093dc6:v30
prerequisite-patch-id: 0996915f031a1d899202c5fba75a969d6ce2a53d
prerequisite-patch-id: dbed47ecb907f6b7f7e284c5c1a3c325566eafd7
prerequisite-patch-id: d27164b5932b6d7f4bd5494e4058c84841db4d77
prerequisite-patch-id: 6a9642b23090d9f1ae18bc8969e30217d053938b
prerequisite-patch-id: cdd5a258a3157d609115ccf8b8606d1fcdf520e8
prerequisite-patch-id: d6a8cd2161ea713eebeff46d12f6ae1255c24561
prerequisite-patch-id: 1d8b2e78db2815eaace41a13d571171fb58e4221

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>

