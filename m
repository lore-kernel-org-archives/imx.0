Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776B63CCFB0
	for <imx@lists.linux.dev>; Fri, 29 May 2026 10:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051977; cv=none; b=T0O4pnILO+e7sPIfJc62aoaW0PKI1mBBgEhUu06NWMuMh8n1sX4oU4BhBBejCe5O+I/2fZa9x7/jfd47U6evm/4IvViovgZVt9foNQBB75LT5gE7ic68Vgsk/M52v2WP+Qi5ZTm4wLc13huo83qcJg/lde0WrR4Jr1W7DW5j7b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051977; c=relaxed/simple;
	bh=He6Oh7NxM5VyqDIcLrCUKW3HzMUDzlOLD3pIWKgkhLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aD5F+r+W4obCJtHWiViFk7FsJGYX45nmJE7OQU9E5F35yq1J8gxbX1KONVM1rnTMAplFX7s0vjW9RUElzxlVVAPsu2YoKEQ6UlEy55+BGV06sIuzokzKNhFUJCabVOMUn8g5EDLiOKp7AW1PyLd4cwdElrgx/Y8tW/dwrApoxqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fs0vh0oa; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fs0vh0oa"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4904127c32cso47301925e9.2
        for <imx@lists.linux.dev>; Fri, 29 May 2026 03:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051975; x=1780656775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWQHcfUz+e7hFeGnQ1jO5E5XreEpZyjDk06utPJH+A4=;
        b=fs0vh0oa+gz7f9d88GfHwEo/XoeSyjSNar5JJTvKmCFtrhZ41jC5i95ERjIc+Vg94G
         JdQrUry9eGrhiidYh9OnxAQUEBDmeSLBMuYNoGf4YSq8VwfarzRpHluYfVNqv2kszwk8
         bddllQhlTHPnJBQKUbCD00mn4kI7ixM/gvRYY0/5viMEFSo6wJyxCmnhjSL8CfmQkjqG
         EM0mvOkEX4x2evltKxlGiDrKQeNSowYOjz/rH8wG9CQvo64GaLL9CrAdO9LdaBgb3drp
         ukx2IDnjeHuxIT3VEwCW9wYus1K3qVVZTBQ7NrdyJKCM0ra9rxDOvDfCp1LP3KVQrZbp
         N1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051975; x=1780656775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DWQHcfUz+e7hFeGnQ1jO5E5XreEpZyjDk06utPJH+A4=;
        b=ZxENqM8PVvUYcoZ0Dz5TzwcfPhxY2gRsq01XKvlLh0+Y+YFscaNPxM4g4WKMnJO3Cv
         fjMPpkBkUD1qYjy0o0msnAhhSAuCUIz10qzOm1mBpCJVaPcnoR2m7fgheICAkngygHLZ
         IqtKuay058Jmk1ULV5esmztu9yQZUZOiT1MNGET6GrSYrKvx8WYnIOp16qhDH/id6id2
         YkE1+1uFMOlhl/q89ojXt0SFBqNjN4p7b8KAduf5mRjJVbZSLFIMvnfK3kQlZyvxP4LK
         ThQYYnXgy1Y3SSaNBTPw2cFbBVmMk/3MCPhuRBVzYtB/fDaqwC96VxJByeWW/aeHxWBW
         SKEA==
X-Forwarded-Encrypted: i=1; AFNElJ9OR+dHZyyylonw38tc6Y7RHcIxhj1ciYM2Ihho5GvYr9wj/z2/hVZjZBBPFBEHhrz7N9c=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdKJ747UyL04k5Kl92XUtx1oYbAAHnNpVGnVi0TDFxdkfVJD59
	C0A9rD5yFsyo1d4P1Z25/lvwDT2bkIkPD0QIhG6UZ0dimjbtkNs0gaoq
X-Gm-Gg: Acq92OFeQSszkd2TNshHWf/hVECsbBKyLIZp/44HciZAGNq1tFbCO7PtOysUqYvOX4L
	QVkWpq7jXXxxpFt41EqbtrmzntDCXJCZ78V/43pPXVcDRQASLqEapxwgyPa/dscYpFZlcaUDMXO
	ZdiQGXmztZkKYWY/UsDxO2tRMYus3DaWcBlKOqpoDUMOB0dSVui32pK8zjcOyzz/g+hHgM/foVc
	NHUraZtcet/kjrrCYzsLyBgt/u4iGNLyVKq9hkY/BVHAuGW05gsOWG1MBNFj8w0nPYdDLIq4cCl
	1hU4uXMZ6zPDwPfT98I5BtUDx8t5UJRP2C2NIidp3ivuZrVvu/oqNEEHNGRtM8BlcpF8FVif5SW
	WLeqigPC6w1ghCw9SD2Sm5awdL7lHbMTrS7ckWpfn8U1kNgatKDtB3by95Q6NkD5IKO7zTLnyTG
	wb8PxAzWmTJ/6gmnX94V+cAjN/Z6gcGRFcvftJq5oQozhzNjAWyQB/6l0JORc8kI3byOHI9H6El
	9UDlIJ6Fe/ehUxYm5E9ieSLhUNFzM7o/O7/osi+0va7BuZDWG2u1TIfZA==
X-Received: by 2002:a05:600c:1550:b0:490:5191:6e1a with SMTP id 5b1f17b1804b1-4909c0beca6mr44279045e9.24.1780051974848;
        Fri, 29 May 2026 03:52:54 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a090dsm2541596f8f.3.2026.05.29.03.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:52:54 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: imx93-var-som-symphony: enable TPM3 PWM
Date: Fri, 29 May 2026 12:52:47 +0200
Message-ID: <a13b3122e9ec41f966909281ac2a801689c7b98e.1780051874.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780051874.git.stefano.r@variscite.com>
References: <cover.1780051874.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable TPM3 on the Symphony carrier board and add the pinctrl states for
the PWM output and sleep configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx93-var-som-symphony.dts  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 37bae4913bcf..a49c8aebfead 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -325,6 +325,13 @@ &lpuart7 {
 	status = "okay";
 };
 
+&tpm3 {
+	pinctrl-0 = <&pinctrl_tpm3>;
+	pinctrl-1 = <&pinctrl_tpm3_sleep>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -447,6 +454,18 @@ MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10            0x31e
 		>;
 	};
 
+	pinctrl_tpm3: tpm3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO24__TPM3_CH3			0x51e
+		>;
+	};
+
+	pinctrl_tpm3_sleep: tpm3sleepgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO24__GPIO2_IO24			0x51e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
-- 
2.47.3

