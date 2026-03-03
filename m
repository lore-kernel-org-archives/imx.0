Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69E821FF4C
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 21:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772571704; cv=none; b=m1E4WUuZadBQ0cKg/6Q62DlRUWWLE0fmLe3BiXXGvPM9kDrpA+kxsmmKxnN2zvNINK4IWbC4VtOqD4w+nzN230HqzayMYyDJDKqK+C4StcWJ62ffWXmofuQIN3PY2m6Bd2CUDOfSa2QGDWuaXvQMYaH24vvMHfOeR8Q9E74X7+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772571704; c=relaxed/simple;
	bh=IHXryiY++BfevlVsxT0ECg25Q+P4Vt/4UqfIqA0MORY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YuzJH78zGBtCFKmJtd5NfD3MzaXTXrCOC3ab+ARjB7tvdeKortyWa8khOHr3PGbpNqXzSRo6QXksY5LAarvUZLNVa86NxxhLEp1eNeTRVP9CL5H4lOIMpneIrSdfiIUJ0iRZIi6VQf5JPtQG8bjGOzQeQUNBNFzhysbTX+bCNWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VP84qbjD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VP84qbjD"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-483a233819aso60014905e9.3
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 13:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772571702; x=1773176502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RUhLRAvy5gTHbtCFY778UgEyKl5bwdCfMR/gJ9Hus64=;
        b=VP84qbjDmq6hf/6uOuyO8em8hJGvbSqltXpkGT93U3iexpRhWjw9pJ9z/mepvgNmtV
         o86NpbtkE/rcNpsuCxxLKlU9RL2hTqNGz24XcQ68nLoPMMM8FDOt06aDSZSbpeDIt4ob
         k0kcG0OE36PiBCUQHSFrJg3iFqwEore2PeYuzBmbE95udT4W12YadV5x5riKHZ/Qi2Vs
         2mgyn/WlOq/qN8uHjo70L+NkdgJdgntYuhVfa+lhXUkE9vwWhnlavy2Tj+8mTh0yJTzc
         5ncFKgoyo878vXuH5ZBIhsoMg05SMaTj3w4pphxVPlZi1ZMG1p0KvpLpyfKZsor46tCD
         aXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772571702; x=1773176502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUhLRAvy5gTHbtCFY778UgEyKl5bwdCfMR/gJ9Hus64=;
        b=w/DIv7jys9ewOvjYIYrzKotlMc8h2FBE0GBQEMfXbGidZUptsGG0ZRCex6GD9jG06f
         WgFDTrlVKhlOPR/0XkwnF+6qFnQJGVn91G209nalmp2UfO5fi6Ps40CE7VemZ2Ypj/VG
         8r7ypmBApc5klh3L2DHzraPlcr1QAQ5NICZrCnzIgYP15/fDbECQsKTzIl5l4gi5FY3b
         g1738nT5pfzXJ8CHTiQ1F0FYW7hWzD7t7ybICxa2JYZBxib0wQBjy04rwDlQwBSKrRNm
         tppw3IotQHCcBqi69mJvZTu0haqX+nHF2ih053ys5MP6UH6U1/UbWKlRggS1+9LfabDt
         Vxrw==
X-Forwarded-Encrypted: i=1; AJvYcCX4kgDfFwylRKz0zHNOVME0PHZ0Q6IjpP2ekkVkPx9uoldyOV5xe3j5gDqjoe55foFCFjk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRwOKyXgd0kzGY8JDlqHZd5esZsjMmBCX/b9wJ+UO+Wjipyzp/
	muZe5+6vemNznLc5Lv0zlUx32pucYgnC13O2TuLZksGbR4uLq4QlWjZN
X-Gm-Gg: ATEYQzyXnlYzb5as2n1+gvbQREabuJG/qfHz20j/PoGt2hHel7cMGCxY8RaKw8chAW+
	a6HkjEZKFzzm1c7VEv6O+1oV2lsbT27cPynmvJ6a29eV4SH7g7VNEVmK1ctXflg+hY7VbwOctnR
	d8ycL1bFkFSMY6g5XG6TnAWO5q0t+95zmjUBszF9JtH3GAsAYCDHT0ECYUaWOrftcz+/T6bYPip
	0ARE3vRAJqBg01Kx0olO52bx+gCKvoVPgACqVRT1MFuDl4PIZx9dRyf5lUELhIWPP4wckLsrKwP
	K6J0zetpNKlp6uLaZ7Hi8glWZZh+c7o5J5DI7F8fT5TwB0JjFPlr5k7bIJHeHTvLYj1Pp/UMP46
	7xqo0+MUCWXk44Nl+A9uiKHKxbhiJ27b2V26qarKl8eaSMpmkw2oYnLe9gTEyC56RrVhRzutXFW
	yuwRTMPNXNOwyRwPc/g9mULSFd8wWZUbc3sT59+6V+qdK0WzOa9CKPeSHdoeTmaJF5RzXn68yYd
	ZG6S27hgzZx6vibf/ww9uzjwlQ=
X-Received: by 2002:a05:600c:4f8b:b0:477:af8d:203a with SMTP id 5b1f17b1804b1-483c9c205a6mr306337205e9.27.1772571701881;
        Tue, 03 Mar 2026 13:01:41 -0800 (PST)
Received: from emanueleg-nb.corp.toradex.int (93-34-120-147.ip49.fastwebnet.it. [93.34.120.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851884224fsm3155035e9.4.2026.03.03.13.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:01:41 -0800 (PST)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: freescale: imx95-toradex-smarc: Support Cortex M7
Date: Tue,  3 Mar 2026 22:01:07 +0100
Message-ID: <20260303210125.1781197-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Enable Cortex M7, the vring nodes, a mailbox and reserve DDR memory for
the M7. The remoteproc framework is so capable to load and run the M7
firmware.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
Changes in v2:
- Use necessary node names (rsc-table, vdev*)

v1: https://lore.kernel.org/lkml/20260303121324.1576841-1-ghidoliemanuele@gmail.com/

 .../dts/freescale/imx95-toradex-smarc.dtsi    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 5932ba238a8a..748fd7d9e7e0 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -42,6 +42,16 @@ clk_serdes_eth_ref: clock-eth-ref {
 		enable-gpios = <&som_gpio_expander_1 13 GPIO_ACTIVE_HIGH>;
 	};
 
+	cm7: remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu7 0 1
+			  &mu7 1 1
+			  &mu7 3 1>;
+		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
+	};
+
 	connector {
 		compatible = "gpio-usb-b-connector", "usb-b-connector";
 		/* SMARC P64 - USB0_OTG_ID */
@@ -156,6 +166,42 @@ linux_cma: linux,cma {
 			alloc-ranges = <0 0x80000000 0 0x7f000000>;
 			linux,cma-default;
 		};
+
+		m7_reserved: memory@80000000 {
+			reg = <0 0x80000000 0 0x1000000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0@88010000 {
+			reg = <0 0x88010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1@88018000 {
+			reg = <0 0x88018000 0 0x8000>;
+			no-map;
+		};
+
+		vdevbuffer: vdevbuffer@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 
@@ -572,6 +618,10 @@ &lpuart3 {
 	pinctrl-0 = <&pinctrl_uart3>;
 };
 
+&mu7 {
+	status = "okay";
+};
+
 /* SMARC MDIO, shared between all ethernet ports */
 &netc_emdio {
 	pinctrl-names = "default";
-- 
2.43.0

