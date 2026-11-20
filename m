Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199593;
	b=awyVQrSKeDcyz3CMJwW14EmQTqKkdmEjLnt4QHTEXU7/8Zhl9gfcOuplY6nUYPkYcBXi
	 QcLFe3te41Jc3MJguYk2AUxS2MXJKQQC4bG6xbtwmeEoC7hygXPn79rHgDzbLGmE67FCk
	 a0uYWO6Uuq/jn8KHdL2ohHpXNgEbk141gGegb2n5p0UaA/vgnbr7D+aJ4uwIuhxRaZh7w
	 MuAxOHU0rFxABhlfrTF2AzpXTBxulGbDa2gAfsjB0cdcGN2rW6HQ32gHRMYv3UMwuN9Xk
	 VCX8xkuz3JZTW9o89AgQAoXkZsXpIdaME23xWDCCiIpolFE/4Q+buJ7qZmePiiHFzrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=VelTmERfpnFtTZC+wB5krB/CsanpetBmD1N19wuVuo4=;
	b=NUgxA7Kh8TrwMBCqLCanIkKgLOUfTIOgLTDklanoJn7UJ1Ai0HuCkKDOcfNbHSZny7N2
	 CF1DJ76ntPLPwwP1GdHB2IH2f016WmS9s/do8wNEDrJ7IEaRdgrVNPdq+nS+AtzoeOpvd
	 KFk9ldwQrRnJk0dhvKNMKPQxATZ32bRQnt0NgtNj0eNvRTIAgE8yXx2833EtpoisiHwrJ
	 x3nLg1m7IBNLxwAlaUeenS8xhAu4Fs8oOTcS7Uav/WjmP4+RRAj9F9LyGxY96cLjUVfW5
	 J+sWBQBLADO4tyJkSlvYPwnfmHxSC2krvTOXG4E49YEJBJzAFNcYXL7XpgFZmtGIOkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vC9xfaET;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FEC60A261C
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 18:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48FEC60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vC9xfaET
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso7208805e9.0
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 10:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199588; x=1795804388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VelTmERfpnFtTZC+wB5krB/CsanpetBmD1N19wuVuo4=;
        b=vC9xfaETyfN4MtRes/OOBcLTSrFqRccKf9CK2OurETqDXT+eNJLqz3OzzzVo1bCj1e
         0CQ7YdiDiwD5TlRQkFQBOt+PL16tpnZxDCYk9C/m8yQ0l2UKbe8PfXlrDCXSBEtB2Wpv
         a+DAJucf++RT3zu1gn/FdbIAHS8thg4JrnIdGa4ftcZA29wF43lis/xcG4wlY4hzPnTP
         UVsAYxanPmVwzrNDm11MDGcIUwsKkDLQ+RfIQ5kBfzHBAA3TRKlvecpAffXyZrBKZ9Md
         IGRT2byiUVpS30biiofokiI6mVCN+CBvO7TS7rerh2bgh2+O1QhiS76IdtPIInoIwUnD
         +6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199588; x=1795804388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VelTmERfpnFtTZC+wB5krB/CsanpetBmD1N19wuVuo4=;
        b=mC2uZm/nUrSUiaQnxDluaQZ2YDUYaUK+xKxSev4QbvN92D8azrL3Ms6KUV+5eopVaY
         BHMi/Wsrw6cxwhm1v8QyJ0C0g4PgTOAFrGSbvoxUsaKQh8D365nmYA63xS/Kx2PYXuQI
         wvw8RvEgfll/M9A72DWpotqiuPSfyjqu0VH6NopIU6o960c/bZzzGjMAQpqPzG8ARb9O
         DL6d2K0jq7hmjt7e+D7ejVZqVwSQVSzeHttPd04BxXhX6ZiIxBlumbFa2FuxXrIA2ndd
         4mwtPZ5ifYd7a4QAz29QBKOZ3oZdNmd31QDg3Zl9KUeVlVQc8rUoiFvPNqfoNmYBmnMI
         fZRg==
X-Forwarded-Encrypted: i=1; AL+hErELZnRBUcC2QmOPCjW8pukzeeCGQ94HvvJ5NzyYsXKPdcN8WB0pAsVdf6HGTWIKW4T2hHA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9eTwBWTz42SAQyH1zkKlCBJkRRv/L6A90uLwi+rde31RhFnEEx
	XDJE03j7dKjhwclIFAKJyVi7c2cLQlZP3wYTMg49lXEv7b6zZalEovYn
X-Gm-Gg: AYBFou3LmnL4BEUatIhTgo/X/xHyUPopsh6JpP4uOwlxA8xy/p25BnfNI+glgCYwlkH
	oCPA0JHVl+Vo5b3uNW2u5HNfx+KrIFKClOvueQiNzy9FY+2ymPSPijwFvfWmTitpzeMwx6b3dxL
	uB5vdlKeydlDXTtUIw2E1h13e3cuE1+qMvIP09pxGvBQ4tC6ai097RfJGq7cKYJ6SwqFo9o8U/P
	aUJS17iEVoFPKpP/21nv38QPK3mkAD9J7EWrMLLYS48IwDurFD2KhduxbuVjr6hK2g66tzYQ1dF
	hDi13MwCtUp0MaFlrJyL7i0CqFEdQQvRERv+doLr1qdnaRJWP31NEbZbkLTtny5pBPKPChh/xde
	IsPSlR2TGryKUONNa1poqXYLUZVoqdndWqktHCQOE5mmNr34vzM7kVqTMsZ/EA85WKcW7hXU31T
	6GSd7Pl7kgigzJgXaOONkTH2di3uV9y9G3IaKCHk0AeL/d9K9QIEDkcQfWMl0SjpQZXyqT6RNPX
	+enh7MDRm6f5bUJPe0jt5Yx/aI61HEwlkBq87QuhGkNZfebiPDZSpYYjW+UwCeVpsLocX8WzMmk
	pyqnfPL7m8kOUSzIjanc954OstQi7dpoIHLbkkPhpSBk1jYOifIbtkTix5FhXjxAOAe6KywHIAj
	TfpnsHpFrlm94r4OgWxd86WAXKpkdzu/VZtLHB0ySQcUX3z3BakxKviTjU526esuYjOr3
X-Received: by 2002:a05:600c:a087:b0:4bb:5c92:ce22 with SMTP id 5b1f17b1804b1-4bb887fe887mr89696315e9.8.1795199587508;
        Fri, 20 Nov 2026 10:33:07 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm7467718f8f.53.2026.11.20.10.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:33:07 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v4 2/3] arm64: dts: freescale: imx93-var: Extract common Cortex-M33 configuration
Date: Fri, 20 Nov 2026 19:32:29 +0100
Message-ID: <6ab5925c4f1346cd801c58fd88ec624419ad0ce8.1795197853.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795197853.git.stefano.r@variscite.com>
References: <cover.1795197853.git.stefano.r@variscite.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Move the Cortex-M33 reserved memory and remoteproc configuration into a
common include shared by DART-MX93 and VAR-SOM-MX93.

Include the common file from both module DTSI files.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v4:
- Move the resource table, RPMsg vrings and shared buffer from both
  carrier DTS files into the common include.
- Use generic memory@ node names and move memory-region-names from the
  overlay patch into this patch.
- Include the common configuration from both module DTSI files.

Changes in v3:
- Split the common configuration extraction into a separate patch,
  preserving the existing DART-MX93 configuration.

This patch uses the following binding and driver commits, already in
linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

 .../dts/freescale/imx93-var-common-m33.dtsi   | 65 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   | 31 ---------
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 15 +----
 .../dts/freescale/imx93-var-som-symphony.dts  | 31 ---------
 .../boot/dts/freescale/imx93-var-som.dtsi     |  1 +
 5 files changed, 67 insertions(+), 76 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
new file mode 100644
index 000000000000..72b47ba99cb9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M33 configuration for Variscite i.MX93 modules
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+&{/} {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		rsc_table: memory@2021e000 {
+			reg = <0 0x2021e000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0vring0: memory@87ee0000 {
+			reg = <0 0x87ee0000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@87ee8000 {
+			reg = <0 0x87ee8000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: memory@87ef0000 {
+			reg = <0 0x87ef0000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: memory@87ef8000 {
+			reg = <0 0x87ef8000 0 0x8000>;
+			no-map;
+		};
+
+		vdevbuffer: memory@87f00000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x87f00000 0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&cm33 {
+	mbox-names = "tx", "rx", "rxdb";
+	mboxes = <&mu1 0 1
+		  &mu1 1 1
+		  &mu1 3 1>;
+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+			      "vdev1vring0", "vdev1vring1", "rsc-table";
+	status = "okay";
+};
+
+&mu1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
index 1ca3ec8330d0..efd51f6364f3 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -137,37 +137,6 @@ ethosu_mem: ethosu-region@88000000 {
 			reg = <0x0 0x88000000 0x0 0x8000000>;
 		};
 
-		vdev0vring0: vdev0vring0@87ee0000 {
-			reg = <0 0x87ee0000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: vdev0vring1@87ee8000 {
-			reg = <0 0x87ee8000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring0: vdev1vring0@87ef0000 {
-			reg = <0 0x87ef0000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring1: vdev1vring1@87ef8000 {
-			reg = <0 0x87ef8000 0 0x8000>;
-			no-map;
-		};
-
-		rsc_table: rsc-table@2021e000 {
-			reg = <0 0x2021e000 0 0x1000>;
-			no-map;
-		};
-
-		vdevbuffer: vdevbuffer@87f00000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x87f00000 0 0x100000>;
-			no-map;
-		};
-
 		ele_reserved: ele-reserved@87de0000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x87de0000 0 0x100000>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
index 69495bb7fc9f..4ee4d74cadea 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
@@ -12,6 +12,7 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx93.dtsi"
+#include "imx93-var-common-m33.dtsi"
 
 / {
 	model = "Variscite DART-MX93 Module";
@@ -54,16 +55,6 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
-&cm33 {
-	mbox-names = "tx", "rx", "rxdb";
-	mboxes = <&mu1 0 1>,
-		 <&mu1 1 1>,
-		 <&mu1 3 1>;
-	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
-			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
-	status = "okay";
-};
-
 &eqos {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_eqos>;
@@ -221,10 +212,6 @@ bluetooth {
 	};
 };
 
-&mu1 {
-	status = "okay";
-};
-
 &mu2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 78b19d8918b7..c3e880025a06 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -87,37 +87,6 @@ ethosu_mem: ethosu-region@88000000 {
 			reg = <0x0 0x88000000 0x0 0x8000000>;
 		};
 
-		vdev0vring0: vdev0vring0@87ee0000 {
-			reg = <0 0x87ee0000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: vdev0vring1@87ee8000 {
-			reg = <0 0x87ee8000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring0: vdev1vring0@87ef0000 {
-			reg = <0 0x87ef0000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring1: vdev1vring1@87ef8000 {
-			reg = <0 0x87ef8000 0 0x8000>;
-			no-map;
-		};
-
-		rsc_table: rsc-table@2021e000 {
-			reg = <0 0x2021e000 0 0x1000>;
-			no-map;
-		};
-
-		vdevbuffer: vdevbuffer@87f00000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x87f00000 0 0x100000>;
-			no-map;
-		};
-
 		ele_reserved: ele-reserved@87de0000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x87de0000 0 0x100000>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index b0ffcb534cb6..46b739a147e3 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "imx93.dtsi"
+#include "imx93-var-common-m33.dtsi"
 
 /{
 	model = "Variscite VAR-SOM-MX93 module";
-- 
2.47.3

