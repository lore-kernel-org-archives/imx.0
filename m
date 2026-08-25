Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F07F9C0
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 06:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641040; cv=none; b=W8ckV6ik83p2ThQ0XGvgGkno7R6CneD6NHDg5ux/4qT52NB8yKC0IEoXihyLQ6oOZ96GcWaT8wtwGCYTCLSwMa7HwvNd44nqf73LOSNnApVUVw4nVP0H71dPfd+DgQdsXyaEevtuPIKdW1D2HU9pFQ3OKnyfkKcJI7/mxn73T0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641040; c=relaxed/simple;
	bh=txIna7M3gwwH8n2HoKpIrs+f+cZsOWhcfO9+iXjD9r8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ogss5HstoFb9QESJF8px3ZCyCYzPHWBVaq1/khE9udUuvGPvNwwVMrNNVEpn9eNiX76cIAbiMfWHj/GQSDOv2OHdCzdf0iAtpnEL/pE8fhDNquh6GtSOnfvtD60XP43e1F90hDqT8l52mc9akLUPwZkJRu3o0OrEeK9KYlQW/4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITeTLo/k; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITeTLo/k"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a1542cdb53so5324564a12.2
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 23:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787641037; x=1788245837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMxi9YhxgagcHFzQDXvIAmQUmJCFdjofB/ZKanSGqI0=;
        b=ITeTLo/kse98/yCTF7fg67L2SfAFKmNiMxjQS+/MszOWKImoWwPTfYBYfXUFe0f13s
         lj8pgizUUJmMBHOdQ9sFLcwComI6SRFxFHIg1la0PAgZRqiMd9lM5p0iOZnH+OTQTdOI
         D7c3XA/KZEBJo+lbuaG8W0ruib/69JTFmQ+jJ/jFjG6ssBg+oSRUlLJdBiwFXnzibfMd
         Pfov/F6pRnFic/D+Kx4EF/FFjo36QerkeYlDhH7Al7yIZFoq5NIw43tqPmOnqcmSt0eg
         1YalYS1wIyv6ud7H8mMNS6Q+w8QWfvDgLa8mFaG5OyYj4kS0wuOKwOuaAWZLcWkYJ8cU
         PxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787641037; x=1788245837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BMxi9YhxgagcHFzQDXvIAmQUmJCFdjofB/ZKanSGqI0=;
        b=TQwwgpprufjsT8Hey2BFykHD7c8oRFKSqyI5HoPANGgcL28oDmC5Z5efBQOCife/AU
         njLsilN1t8cOAxngIAhcOrk33avqJt5xbsyqzcP6CVHFcoT8vQ8Wf82mMCnIC/qidgCX
         nvZinrH46e+NbkXQVyrB4r/IjyXGA+ZGpEVBmtdluqcDRbXXTLRpVombr3JUzS22Yke5
         pn3MHW6ZnR/SB1cL0u65X6TDwumlXVwS4DwCcwwrj3ATHkzCVDJyyprLYloXGFz7i1D6
         BqzGU6b8wPuuIKn9xMjLRO48xzULNj7CV9XjVOGc+EmrzSG0PcFJvuRUnt0T4FdU4GKr
         yGdg==
X-Forwarded-Encrypted: i=1; AHgh+RptPDocaf6cXFJecV5Z1iS9OZn7fo+cvq6zD0SLkTQy4eNBM9JYY4PsTe4n0Q3J+8UeBls=@lists.linux.dev
X-Gm-Message-State: AFuF++nrUC290eIC+Kb06P+le94YbtEcJHnOyerE0iciVvOSmaGBUQ0O
	YUjr8bzZ61m7Gf8PxHwGzi2SWl+fN3OW6aOvc3wWbytFQYSnBTkG3Y5i
X-Gm-Gg: AR+sD12NIhlILrF6mF2nrVrYEbJFSaOCperxFdVRXb0f9nojE3hTvGdsGqu9aOmCtoE
	gjjggDAgRgVvj3aowH8WGDShXCuvVmpTkEWspMoMQwS+GQhdg7+b1np3DjiKSqi2Ih77oYvK58w
	MUz2lvwdYLKZ0rUBoI60FOUAzmxhsTqb/2uXEEytVHqOyXzhcM3F9vKETNDKqHF+2IocwUINaR4
	etb5KqCn/Xpyhegz89Nf0Wc++YZ/Su79Ohxxs2VBEp7GTX9mLVGusd4MZrbRXjbJZQ9PTMleVo6
	Nn8b/krxavlWicvkSF815FL9jRd+YEX8FtaCXGLnJFNod9GzTk01u0R/3BgKgohDSSTnG6csaa6
	eG5OKvtU/P5v/FT/u1lmgAhjl9I02wiSVEQ5KkjOqrw84dPZkBHLg2BhUPaotQT6Sq5SLH6B3pe
	vIR09vEIp6YSHQ3WBoaWZwSsLGz6M6W65u3ygw7r54lfwkWA2ChGnvcdxYAxjDRgxDMjlarx7mE
	M4ZwcZwCKbS+cQvp/UmEaHda3wDM5oRHd8Af5W/iY4aFDYsjcjzkM82
X-Received: by 2002:a17:907:7a8e:b0:c16:9043:7973 with SMTP id a640c23a62f3a-c249257c10amr2627196466b.4.1787641036975;
        Mon, 24 Aug 2026 23:57:16 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-70-208.net.vodafone.it. [5.90.70.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24d6f203acsm613534266b.24.2026.08.24.23.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:57:16 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v4 3/3] ARM: dts: imx7d: add Variscite MX7CustomBoard support
Date: Tue, 25 Aug 2026 08:56:55 +0200
Message-ID: <7645a356f2a9e0fb6627ffb9646f276050d17d57.1787586961.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787586961.git.stefano.r@variscite.com>
References: <cover.1787586961.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite MX7CustomBoard carrier board
with the VAR-SOM-MX7 system on module.

This includes supported board configurations for both VAR-SOM-MX7
hardware revisions, with eMMC and NAND variants, and WM8731 variants
for the first hardware revision.

Also add the resulting DTBs to the i.MX7D device tree Makefile.

Link: https://www.variscite.com/carrier-boards/var-mx7customboard/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - Fixed commit message
 - Fixed model names

 arch/arm/boot/dts/nxp/imx/Makefile            |  6 +++++
 .../imx/imx7d-var-som-emmc-mx7customboard.dts | 22 ++++++++++++++++++
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts | 23 +++++++++++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts | 22 ++++++++++++++++++
 ...x7d-var-som-nand-wm8731-mx7customboard.dts | 23 +++++++++++++++++++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  | 23 +++++++++++++++++++
 .../imx7d-var-som-v2-nand-mx7customboard.dts  | 23 +++++++++++++++++++
 7 files changed, 142 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 1a2539fa19b4..37da667f9ffb 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -444,6 +444,12 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-sdb-reva.dtb \
 	imx7d-sdb-sht11.dtb \
 	imx7d-smegw01.dtb \
+	imx7d-var-som-emmc-mx7customboard.dtb \
+	imx7d-var-som-emmc-wm8731-mx7customboard.dtb \
+	imx7d-var-som-nand-mx7customboard.dtb \
+	imx7d-var-som-nand-wm8731-mx7customboard.dtb \
+	imx7d-var-som-v2-emmc-mx7customboard.dtb \
+	imx7d-var-som-v2-nand-mx7customboard.dtb \
 	imx7d-zii-rmu2.dtb \
 	imx7d-zii-rpu2.dtb \
 	imx7s-colibri-aster.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
new file mode 100644
index 000000000000..855b621b0ee8
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 with eMMC
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-emmc.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7 with eMMC & WM8904 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-emmc-mx7customboard",
+		     "variscite,var-som-imx7d",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
new file mode 100644
index 000000000000..94c4b1fa5d6c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 with eMMC and WM8731
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-emmc.dtsi"
+#include "imx7d-var-som-wm8731.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7 with eMMC & WM8731 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-emmc-wm8731-mx7customboard",
+		     "variscite,var-som-imx7d",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
new file mode 100644
index 000000000000..0da9653ecffc
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 with NAND
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-nand.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7 with NAND flash & WM8904 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-nand-mx7customboard",
+		     "variscite,var-som-imx7d",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
new file mode 100644
index 000000000000..603b2dbf4c8e
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 with NAND and WM8731
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-nand.dtsi"
+#include "imx7d-var-som-wm8731.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7 with NAND flash & WM8731 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-nand-wm8731-mx7customboard",
+		     "variscite,var-som-imx7d",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
new file mode 100644
index 000000000000..12971bfefdcc
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 V2 with eMMC
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-v2.dtsi"
+#include "imx7d-var-som-emmc.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7-5G_V2 with eMMC & WM8904 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-v2-emmc-mx7customboard",
+		     "variscite,var-som-imx7d-v2",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
new file mode 100644
index 000000000000..1c465e89f198
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 V2 with NAND
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-v2.dtsi"
+#include "imx7d-var-som-nand.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7-5G_V2 with NAND flash & WM8904 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-v2-nand-mx7customboard",
+		     "variscite,var-som-imx7d-v2",
+		     "fsl,imx7d";
+};
-- 
2.47.3

