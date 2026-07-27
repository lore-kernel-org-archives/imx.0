Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20577412BF6
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 13:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157319; cv=none; b=QPmp6t9Gp2BkxEfJ0J+6/pny/SHNMUkNunvsofkid6Gif+j/MDdmuf57gXLJT0j1MEoxXDPAu8JjlJFRvcdecQ/tYDQWMhlIdraIPfGK7j5QFQsUKq5yl6eH4gkpfJLWpvB+FcVK/yw/CI9aO23KgnYWq48YL1OdJlQc77d6Upo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157319; c=relaxed/simple;
	bh=J6d93g9jIoKlPDgF2//4RwZwW3w+uXO6kic74fFJlYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dY1BoDqjN/A99HiUG64GxAZ2WKjDB1uzdUe9ijDXjdIl2qtg4vTbymo9Qj+0KHmnXf9FH5xJRv98rezBUzTlwFRi0rfMEQ6mAJi+u+UXIHoS8igv2twFZKb/Xj0KKcT1kcHNvrEO3zOwqO74mMUd7jctyZlLmXvxzo/EZBb+qWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=ZbmttIq/; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="ZbmttIq/"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1785157311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIDYXM9+LpuDl5xH7TLyFckqlHiktoL2NqyKKPRVviQ=;
	b=ZbmttIq/zAkiWEWLCzMm1/BB60jAzCRh/m5TpuajjBTFEF0EXFouwpdS/0H0rxGogVZcgK
	IzK0TT8VdSS7fj0d4zWEzIjS9tN0VfVbVTRMfCfm1r0DshHfKs5JR2qsADILhf/NeY5SHF
	O0pcQUbmxiP93sOP9i5YO/hOMjr4r2L3EQ58eivctWS/MBQellNGOqvldL7ExS4aK7a1WJ
	pek2vr+3jDDb4RjMzXwhjsZy+M+4kbvdbJF0q6qi81VfoVEUmgN5+vDCkQqoDd6/fPA/Iz
	vwWiyzQRB4KGLFWPiGdFRIAS7sydlak8yemtb5TEv0/lNnM+uWhH3Ljwk44zCw==
Date: Mon, 27 Jul 2026 15:00:53 +0200
Subject: [PATCH v4 10/11] arm64: dts: Add ELE firmware node and common
 include
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-10-1a515de33093@kontron.de>
References: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
In-Reply-To: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2086;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=tJ9rSkBdmzSOcevJn11J6HTiPXh99MsoW+7PNACRN4k=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISs9bA3XkXcFb1MiN0kVSFfxvA+7ZfR2nc3ybXUur+Yyb
 N/sYGfWUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMJH2Xwx/BVr33ebx86y3/lKh
 dnBiRbnE3UuhC8PEep+vdld7Zxzcysiw02veqaOV6XOOC542W7pXsvjCFlbuKGUGq44DE10v6L1
 iAwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Add the firmware node to SoC dtsi and to make it easier for boards to
configure the EdgeLock Secure Enclave on i.MX93, add a common include
file that contains sane defaults. It specifies the memory node,
enables the ELE firmware node and adds a reference to NVMEM OCOTP
driver.

The 1MB memory area required for the firmware is placed in the first
256MB of the DDR. Boards that require a more specific alignment can
override this accordingly.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |  9 +++++++
 arch/arm64/boot/dts/freescale/imx93-firmware.dtsi  | 28 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index a1a7e6a0571b..60798b216438 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -46,6 +46,15 @@ A55_0: cpu@0 {
 		};
 	};
 
+	firmware {
+		hsm0: secure-enclave {
+			compatible = "fsl,imx93-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			status = "disabled";
+		};
+	};
+
 	osc_32k: clock-osc-32k {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-firmware.dtsi b/arch/arm64/boot/dts/freescale/imx93-firmware.dtsi
new file mode 100644
index 000000000000..58614158ef90
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-firmware.dtsi
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Kontron Electronics GmbH
+ */
+
+/{
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_memory: ele-memory {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x10000000>;
+			size = <0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&hsm0 {
+	status = "okay";
+	memory-region = <&ele_memory>;
+};
+
+&ocotp {
+	secure-enclave = <&hsm0>;
+};

-- 
2.55.0

