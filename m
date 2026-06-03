Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73BC48167C
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492389; cv=none; b=G+rKwoEheBi95QAe9YOseIEZplZGWSuCuA1pbXMlz2YCIpMHmdKL0abdujQZ9aiS45tZnFGPewJN0B27NozD+tRlb5hDewcWeJru/Tpp+nmUzCTVxTKeUAq7V0c+CSR0CyKUjjRgyh16vAbQDIaX4ru0zbY5ss3WIcNzw2+SnRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492389; c=relaxed/simple;
	bh=HQOQnngToDJecf0bRLPczW2aV0qCUfQY3QS+6f80Nso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OH62Gc1/MJSvthfAnLM+1wUHHWa8MpVrMzMj0RWCIasXGCpvF/KP+jwEQlKwDmNQ08LHYu+KbgdjeNRmpjzTfnXa5qljnZxNW2tRvUYHb+TeyNfWy9d4ayGVK13/7kaGzFB34gl4MaimFna6GGrQRnYCuqwYKXqpjJkyTwtKYtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnhSeG4h; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnhSeG4h"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ef29c5561so3118487f8f.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 06:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492382; x=1781097182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YNBR43rYsuzDzzKAUXPCjYnMBRokGK4lII6/eKu93A=;
        b=RnhSeG4hqfXvgEnCSRm+BZu4hb73FD5unUFYBRYszuXD6pFa6LZTZ2WAHfOdyCNGZA
         I3Awzbe7EADp+49k2FgsH7/XTOLs5P0kICnz/88GDD/x5myR6/BmFXLZ1VSg7LprgJ26
         N1xm+2FMoeCc/sxkKbIpNp3EHqGR/axGCN7FRcZtgZMwgzKCu7/g5yVmnBXyF0uxMu98
         i2ENnHfUibkOHphnbRs56P0CwSISkHU7uIv6VjZofZDm2FLkQpX8UmAE4muaWIxFtfv/
         61hKpbuL+FSgPlNwEIR+mf7cs0oTHNR/9U4T0vlAiyuSYqfOaEXUY6aBUpEr20jViQEr
         pMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492382; x=1781097182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8YNBR43rYsuzDzzKAUXPCjYnMBRokGK4lII6/eKu93A=;
        b=LJvlI5evX95yoiOceoO6UV10kkJX4WxHDJR255FvoqjEDEzRhOiY1VPL17py8jmqwD
         6THx66atvgA4v4FU62H3TtdUjdueP4jyOUpKKT2K3KQm+Hk2xvNarV5WrCfbzA7MSjSb
         XWt9WdXXY2wnzAE1eudrxxtyW+n57jwSJ5AdvCCiNQwcY0I5EiOxdLe13Jl9dzhB3OXI
         kadx80TjpH1m5p+RjSL/KTwOwvjLe69lb00mLqCbz2Pz1aOVMarmBOJPLItpUof1MExG
         uwoJO7/qaVYrjIykg+v/i9V8zHsIuiQGWXiEiolBVpiIYSbCaa+XunBE7Ut/tNLwJeDq
         u2fA==
X-Forwarded-Encrypted: i=1; AFNElJ/5/MB8ihNZT8ZVLNIT5zjfex3GPxstiLbGXiPyPwIQ/eWu+m0sUFHitY6HU73Xw14hh3M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7/f6SLN1b50N3hBlLochIxSkltdEtB3i3T4X5DixeGQgth/ln
	DrFQ7eghqVjMLPFHyVj7xgMY6qEnY7P2AwGDCoxzxslJucglxIfSjwyk
X-Gm-Gg: Acq92OEKLYFsFx3vW4SvUw0pzCg7Nq2cvjq37SffY47SoJmEnjJEZR/KMd4C5UIp85x
	gjnCB/Fs0ftEAiu+c4k8ajFdBZoWlZJL4qGsVxHHLIzxpslJ8AxCv+NC9WksIsQsMYQPzyQF1nB
	wXOe9mda98uAwVbJ0VZA0UL6n6RHbneO2PhG6e/FNMRHgog14RUlIXDlF9xxChv1dehEkZNZFDf
	WnNdBk3mqnYzo0x+26F3DiwiHPo2so8nWeYvMHXmp8lJghCn3K8Og7iO04Mv6FgEMq38QYUVY6x
	vDopM3vfXtl4yYA1AHuTjKW9Qcm6R2NCBWYJ04RDeuPYTjNE13QkizyzWq+FoQ0sbK3JwqpS+ka
	GwDYPvfd+DIuEYw2oDyjxU9MqI3IMmHxjeWlgXNqSKDHB7U/Xxi5nvcWFjKGW4KUO2EvqMqg8iM
	12wBvSQW62EOCMiIw7kpQld10QgAByodksuV1NgQ+T3sHSgvBXfiBrRg+Sz6rKWJRPKrpXivfbT
	7NZV/CGSB5lH8Oum/qOBfbCu+jB6aqoHaa+wdsZi2jk+gaq
X-Received: by 2002:adf:ee49:0:b0:460:1684:ba11 with SMTP id ffacd0b85a97d-460217c31afmr3034562f8f.15.1780492381876;
        Wed, 03 Jun 2026 06:13:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:01 -0700 (PDT)
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
Subject: [PATCH v2 08/12] arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
Date: Wed,  3 Jun 2026 15:12:46 +0200
Message-ID: <3cc5be80b54f270f8ea1079c514e20024dc231b5.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
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
v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 4d8791886a78..ca0fc66193ee 100644
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
@@ -305,6 +320,12 @@ &usdhc2 {
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

