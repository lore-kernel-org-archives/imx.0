Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B47648AE19
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497458; cv=none; b=Mv132vJFTct+JLwQuYTwEK7twnvBtY6v9wa9mJdKp34WBv1RNfOfhVAnWRfekpmC4YNAWf5c5yHT0AhjP3KVYzm6vO3rRcy1x6kZoewEwypKyJ3jXbzX7LohR38pE7Rzg4uD4ckPtolmjtq3XVLoJ48FFboPfXamkKIBsgtMuME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497458; c=relaxed/simple;
	bh=58vxLohvUEE0typs5e0KXlr/bKqVl4pPJo8aX4oeHFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGuPTGaYrJxkF71Qbq4/rbc1ChDtEPv5paQuHz1ZJ1YXWClNIhXYMaEI6jsRGjoF6DlYXMbAUT+sVwkCi0A7pAwxGrROFQ0evbExQ/rduDxhlT0oFKTdzqe1Hy3oiDQXHPtNbm+XVP3fltDT6rxPvnr+y07DOpa69FvINKqzzNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClfSaM1b; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClfSaM1b"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b64c8311so12276285e9.3
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497455; x=1781102255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvJo7uXpy2LLYVHDxAsDL7DrVkekCPQF0HkceqaMxAA=;
        b=ClfSaM1bLNhPqu63ELbofFeV4ukEFPtnJpTxJaGg99KHPrwIz1dVY4kfcqf2bOs+EO
         O7WljRoimzFUN7M0iSl4KoTF8KLQ75TA0QBwXV1o+9KuVnQ8YDjYOfU/Hrj9p4kgp3Nk
         D2iFAiWqkrDKCB6ZGo875IYWA6AeIqiYxC+MK4oKYIUVbjaHAvDq2t5wUJsbGBOSz5Sc
         xYcYaIriT5EpId/ZDvG8bzWWuNcZhRUw1I6leI5yMIWxPUItiDyuAwPujVmUanjhE01K
         tO2jEsUUPesX/cCDmpYZL7MnXOziekmp09M9HJW189qA2wkXfXjydUTTQ0Dd8MbG42Kp
         d1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497455; x=1781102255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WvJo7uXpy2LLYVHDxAsDL7DrVkekCPQF0HkceqaMxAA=;
        b=iHGcOtjByrGEtXwhzml+so5I0cB0ghMSwtAQUDijQfoCpfK8+2dIt47yvCXTupL8TK
         vpemxsACl4p5Oo9WTFuuXl4uPig6eA+ibG8sEEOQjbM7hskbsk3honY55OrG3CQbnGkX
         cDHtjB7QsaG9DxlJqz/EO18NtGicC3PXQ7sb+WKk9DPFZo/TC63awP2zmceIita5F6h5
         kIHAb2+UoO6pqAGPaxQlr1WNrSvtpuI1O/c1Qqn36H+z041b6oI2jGL3QXseiuqXNU0S
         qP5NosNvStxTzPlPsZcZ/fOzjklxIAKwYkd+OdBvWbv7H3mENlvtvJ+iuTySfQ8keGFl
         OYkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9LzmwaGQhhL0i4tQeUtau6Xt977GcKsd1BotJlSGapMyclp/DB0wsEtW68rLq4wHHjRwc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxsn0L1Jgwl61H/ld+tAZ+uzZS0J+p6+ONNk65RYcCR8ZG2d74M
	J3tIFYbW3zJWcfwd7n/Dg2BdHMcQGpLZ6F6i2DJNdPg/Eg/AkOEBNsC3
X-Gm-Gg: Acq92OEMVBVkkTj372rEUbIFLbhZxGM6hXzwEYYmpZSGVfO9slYCVEchiGFwTKLofX9
	UUgHFQo1eCfGOxfbjlmWsnvw2Tf4xG9woUsuexLJIjF9gQ4erf9lVa6Xer3FpunNMSownj6rJVR
	KMHvHX1qXNoIOEIuz5g3uiRMPMLKMziEO4l/ZAcSquNlYhVqZ6RbtyrRV76cTYUjD9D3Eo8Xs6D
	92sq3RrY0cDIFozQc2zHqQTkdk5FyPNtujZLiS+LQcUolOc7SszDJp4pJgzdXVYR6YtWXHr8Wfd
	tFDShwTzzFAV5pMwS4N6TtXmYH+wv2KJFbUqn+h9Qrkcfhb/XunnwAiMQk29J4lsijKECxGa+M/
	0VO0pmRm7OKXiuEC/Fcgg+ARghMXeHGsZZVLWWQZCiWKUAqaQXDFEdHb0DUMnnSZ6QksfX9nbPM
	gTVqKx4/E2yAtnM5Bmx3eFUmDX+U6qbkbmiTXyR7ZxTEJgb1tFQ5TlgiSK5BSJv1oanHQo9ytE/
	/CFgr+NFms2ETAt4+JSM+NBmkZKKYqioMFWRS09ZPqFEsCo
X-Received: by 2002:a05:600c:3490:b0:490:958f:2a5e with SMTP id 5b1f17b1804b1-490b5eae2c2mr58556025e9.13.1780497454747;
        Wed, 03 Jun 2026 07:37:34 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:34 -0700 (PDT)
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
Subject: [PATCH v3 08/14] arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
Date: Wed,  3 Jun 2026 16:37:15 +0200
Message-ID: <5c79f633cbc4606ccaa962bf7f3f92bbfe6b522b.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the FT5206 capacitive touchscreen controller on the Symphony carrier
board.
Describe the interrupt pin and touchscreen geometry.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index f7eebf265fab..93098799211b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -195,6 +195,21 @@ st33ktpm2xi2c: tpm@2e {
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
 
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
 	rtc@68 {
 		compatible = "dallas,ds1337";
 		reg = <0x68>;
@@ -306,6 +321,12 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3

