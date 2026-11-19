Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104070;
	b=oLMTA3JqzdNP2JJ2MGFQiv9nQxZhxrS2XS4b0vArr4J3otoK7rJH9nMQVfiDzjuc2ymo
	 OB/PN68xvlJocU0L/fceYoOF56Bxy8GgVkGQuXaqdcWR/W6M4oNg20w9jFFEvuTZ3pTem
	 S0AMxTeQuE4dD86OOLuCVFFtDIiqiTTyp8AMGIy2t/PYZQvXhpwRM3FVKpEuqpIcLyqvR
	 2uSFpVdbOBeUWoQq4MWzSEy1E/gMJMHUXC536MfkYPX33wvYtr7AFL6f1VGsAQxRyxw/Y
	 C+FZxl8gn6oZn7y755xE1QikO2BH7zD0PuO6DdbQDEvE8cImx4t0aL803/Vc5AiHrCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=rxJXN0Nt7oYy+tJJbFLjVXtftovgM21mUjgHjNU5vMA=;
	b=Az9R3gudzq6gsXR9UppQ9mRig9sKqY2n77FlFIkm6XfcTt40dxr1h8CFCVmPfbhytEje
	 SQA/njLKpoygsQT7eeHWiUk5e6OO6aWxnbQPMlIE00oRGWGi0Bdlw5QC5a9jx/BE3svKg
	 NpzTaayB0+CWOAsRIXQ5yl+qKvnl5Fx9Y5XNhkR/cFTKuYQp1p2vfgStEUaYJR9aTR+Vd
	 lLbWKD5heCSJLkUARk+oIWcjMPt/PTo3c9Vn4d7SDjUk4QvOO+9BuVxi5pvD8hPZHG2lM
	 0Xc8PqaoWhfSwZrwkMRnBc/0xZvUamCApmosYYoSv5xk2GAHRyEyvfjNfGtb6Iy9mSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vJxCwu3s;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2713E60A260F
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 16:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2713E60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vJxCwu3s
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dee593f18so2419857f8f.3
        for <imx@lists.linux.dev>; Thu, 19 Nov 2026 08:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104068; x=1795708868; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxJXN0Nt7oYy+tJJbFLjVXtftovgM21mUjgHjNU5vMA=;
        b=vJxCwu3sg0twNeqasMdxy8KwqizeM5AGB+fOOYfSixQ5baXwDrGkLRmB9NuI+RhgXe
         in5RbNwaX9z4L7weBlBS/WkhQinfe2kBnJVUz5HGFpFQii12epZkf8umd4tTEQRIvTwx
         kIf7MPP9iU4tlZdLN7W/s8CwND8j+yS9CELKknasNpdCA31Fy502MT8k93RK2IbWxoe7
         3JbU7PJNEl1gs58UriWMwMvImWX0nZO55XYcFTn9ssz9ZQIyM09pf9JdRNn04OMgsMFm
         ymF7zfqXmNx+YKkS8DCad5Lf8iW0YAE6DwjnPZ3tkiqRaHmh1J4vMxOC+XkENZ/zMX8I
         PiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104068; x=1795708868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxJXN0Nt7oYy+tJJbFLjVXtftovgM21mUjgHjNU5vMA=;
        b=TTQNcF8c5XlSRbA7JGts6SFPpRQh3N4wpRmLCq9gUM3EeAhKYV2enPQTfyiO4I7rDE
         HB51UOXzs4+XfsiJ14eiP+053MAfYnU0UB+Vj90tuxdHaCgXnIT/nMS55OtsVN7gOfbe
         ZeKlM+gQpP2mthyydN+7r5ySbCOvZfY/pMmZOSayA+exOXgypBzSaVo9ec3iJ/aHEamv
         tDwF5bdGQjXwtCcsGJlkeUPzEqXWTLC18eXZw8pMFEpX0bZ66rOsdA5kBCiLCibFIp5g
         Uq6DXkrl0jsR6QsM9JTUzmNP9N+gSOfwU2aR5F5koFdMVdmTzrhw56C1AkQH1FyAcYAu
         Q9kA==
X-Forwarded-Encrypted: i=1; AL+hErHUHqgkD5gO538R4S4GPyXCJhB4R1djf1tTvGgcOIrwwxrndPIhY8n38DKC324ktDqgvBQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Swm7ee7hn3AnMtUQoYa4uWxB4XOeVExfrVatc8WmGgHHAERPc
	CJttm+RF1DnxSfb8t2T38SCt6p7sziVYDF3YoGY9PDikAEWYoWkyd5Oo
X-Gm-Gg: AZFdTZf9RLdGrc+e2G9/6X6r12xt405Ryan0qXB6OVmELwc5dsKXahaSETsXOXb1zTY
	pBHp9h+tj755bhD22Ezka5AaLomEazAeRzQPYdTp3/TklgRrJPvi2njdLmxaqMRGm4OGtyVZrxg
	Vgwlc3eR94dX1Ca5BhoE2mcByTVhFexRYj9XAYx4TcHV+RgbjwxkJaN+LVKtBL6QibL+zop7ad/
	iaL2Qd1Zb5xYr8JZbwlrFRLsNuOYgacBgPFbNGDzRzqO6iHtZyxJyt1OJv0k7OzSJsHZTeRT0Ym
	r0NyOfR8lGifqL3ZMbTSUgqiP89pseJ4v5O4t7QgVIyoRAKWtUjS2OBA50FGlGLEM5SIkhNyqlK
	uF48ROYKxs2OPqYqs5qrUA8+d5fSBQhDSiLahpFZP0RJmCRrqsBsF5Okp2ZVHDctRlwXtu93RHT
	XnRUGhpXG+lIFqyt3t8UnBN9CGgF9nDEcjGvuMPIx9oKxapdulH4SkUWJ6Ub0KM3uEEUGZ6PGLg
	io0oEIWbQsy6MGq7lAOlNZs6G9Z1LRzMkUIxo7SRhKTgK+lUzhSZpLCA4bqBj1cvwkdIXR5Oaow
	fOUJbuUVpu64MonI0/7k+o1f2clkxBJ9ngibZmxEpt94m2IiCddbziEo/R3Ai2ttQUNhmgNQSvU
	QY7awYi4ePrjJhxyELIbztwpxDXAuZ7JAso/hY09C8O+9NfQ2sl4iNfg=
X-Received: by 2002:a05:6000:2403:b0:4a6:dfe3:fd93 with SMTP id ffacd0b85a97d-4a6dfe3fecemr11577697f8f.40.1795104068125;
        Thu, 19 Nov 2026 08:01:08 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm323784f8f.44.2026.11.19.08.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:07 -0800 (PST)
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
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 1/2] arm64: dts: freescale: imx93-var: Extract common Cortex-M33 configuration
Date: Thu, 19 Nov 2026 17:00:53 +0100
Message-ID: <deeb0fa8588673f063b14c34a7aa59efb1521b39.1795103362.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795103362.git.stefano.r@variscite.com>
References: <cover.1795103362.git.stefano.r@variscite.com>
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

Move the DART-MX93 remoteproc and MU1 configuration into a common include
so it can be reused by the Variscite Cortex-M33 overlays.

Keep the common file included from imx93-var-dart.dtsi to preserve the
existing configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v3:
- Split the common configuration extraction into a separate patch,
  preserving the existing DART-MX93 configuration.

 .../dts/freescale/imx93-var-common-m33.dtsi   | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 15 +------------
 2 files changed, 23 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
new file mode 100644
index 000000000000..de0e56f322a2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M33 configuration for Variscite i.MX93 modules
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/* Use the reserved memory and resource table address from the carrier DTS. */
+&cm33 {
+	mbox-names = "tx", "rx", "rxdb";
+	mboxes = <&mu1 0 1
+		  &mu1 1 1
+		  &mu1 3 1>;
+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	status = "okay";
+};
+
+&mu1 {
+	status = "okay";
+};
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
-- 
2.47.3

