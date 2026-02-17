Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA70374193
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353814; cv=none; b=YHZhV2mRtb5PpcYYN2Y8NY3YnucallIfIS+giIIBxl7xVW/E6n98HkeC7LimF8+0Yygjs/Ad3y1k1RG0oq+mAGQA69fttliCDl9waMGijj3wtsxMNXn0NKsS2HBAsQvAtycdRkt6e5YjIAhE2vR1MQacOm5bg2M3OIIZbQmJfVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353814; c=relaxed/simple;
	bh=vXp12MaiMUk/AV7KuF3/VcyXGOS1IoRyLnl1b6VArho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gUGQ9RnJbfSK1hFNlS3x+oBc/cG0pS+GiA+l7o1aRGmWfZEMPvo0Qa9LXWhz7z3fDaHkfYiPxfOMe3iiS9Cn9g2zX8sdfsKfVbjDbIiXmU3qWf1OoGaOpC2IOF8mpRnxlijAqsfFtpLJu1cdHEuXocJ0IRgt3J5jY8Wxsz3f8rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0+hUrDG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0+hUrDG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48370174e18so29746885e9.2
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353811; x=1771958611; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYM6F+d+/mCJYfEA1rFS4pjBPoaqEPWbC++lwSRhFEk=;
        b=c0+hUrDG/P4BwOEzvf5lD2Xz0YZMmiVlngl/ZiuqMSJgFtiXChGIwgdSrAh0YjwWFl
         KXUAvCLlpQY33fYq73soOFpGWYE15OY7/hKCYb5sEVURgE1Vq+cnpRchtzrLx7kWNmsf
         qOJuiYp1zPvcb4igFBoCv9iFz/R1UskCTvudc2hjtSjowIZx8sjG7iobVJycbJcB8iGO
         uZzs74WF1bO6/0OS+Rg0EPZ0sbJBClaFP5NTyq0C4jBDXsumFpRhuMcgD6qqSRbMMrHi
         uOA1SrGf8VI6DbcckxHjVGZJT9pzV5D+j1skrZEhivwxxIlgUDKdRAH/LY98UwxcYNzu
         1gBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353811; x=1771958611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IYM6F+d+/mCJYfEA1rFS4pjBPoaqEPWbC++lwSRhFEk=;
        b=LJ1GW/1piRgkTCo1K5NtiUxoBn8tCrvn72aOh02CbdEXJe4ubxZ2Efp/CwPN8dAKF9
         kS3PGyrNxMElHYlvY1/nngfev54bCcnIW8giWO0NYY6MHHTi++5+8oObKZGi/YEVAcet
         ILyy63+08nvXNvMbTm+HuVm1hXKvWiJIA+kTTXE0PDVNaiSDoARr+vxQScNmTxNDethb
         nYuRVnOQGTo70Icpc7gFJP+mYV/qbTd8h7LyvP25KjjRh4EGU1a8j3UnCaeCjUrcuzaF
         Tt46moiF5+6QQzrtcEbCn0WrqijxBXVMa07w9B9EYcSp437JAX+kVMA3lJiaf5zAA0AO
         CjTw==
X-Forwarded-Encrypted: i=1; AJvYcCVbzdmWdxZOt/qVBnW/gmvrOhDYeACtkYcTliDUkXCBXvps5S3LbG5IBEnf0qb/ogILUg4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxD6bJc4D+96M/2xJtRZ0BqlI84X0LyEgAQmm7GUsynAEDkc6xv
	plWLDtUvDJPL4f1dz7CEIZggC0wtJa/hLYyhAmDTi9/yQDbPNc6cgy7V
X-Gm-Gg: AZuq6aLUDFhPIxmqs0z+oRelZ47mYYERv+717dfFQkQa8d0tGumT4h+yNfOgt2j1tVy
	V2kIZp+BZPNQxk+rFLNHQHhZPJ9HMBM0IBs8HNonJAI0aGedwFOLTtwGoKpsxcSs+xt0S1q+Lta
	exURt+WBGLdFakMr90n69srxbn6p7zXMpk5dv0zMRWCbZctJypYgON5Y695dP0YwlvuJ3OZfXLH
	EKu2Jz9AvrlhwCIQG330E07GWd+241O/eVN1voL9DRYeXeNXOCVA025KiH1EbKWBRRAEdr67EFE
	sNCcjkf6t+xcHQ+Ve5+wLPAkgpAcD2Z1ynMJpVhn7Ripd0Jl4w4ES+9+P+bie4qdEXhCKz4l2Rq
	pPx/DqsDmxumBemluwMWpNbNHUn680rtuLbdzZ0pFRe3Ba3gjw14wwzQtPqt66fWjkccN2HnmFs
	bhcTD5+mnxxsrH75EbbaMY/Y6icxdKQQRPfgyYg8xheCQA6pmhSathScFSYqmisSAGoO0pS2edv
	AvlMia6et3pg96kVHPoG2IspRCJ+hgHcJUwxtPB
X-Received: by 2002:a05:600c:45c8:b0:480:1b65:b741 with SMTP id 5b1f17b1804b1-48379b9913cmr205411905e9.15.1771353810630;
        Tue, 17 Feb 2026 10:43:30 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:30 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 05/11] arm64: dts: freescale: imx8mm-var-som: Add MCP251xFD CAN controller
Date: Tue, 17 Feb 2026 19:42:39 +0100
Message-ID: <0c3be1139d98e7ba9dab12aaf33112545760f9bc.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the Microchip MCP251xFD CAN-FD controller connected
to the SPI bus on the i.MX8MM VAR-SOM.

The controller uses a 40 MHz external oscillator and requires an
interrupt line and a dedicated RX interrupt GPIO.

This patch adds the fixed clock, the MCP251xFD device node with the
required properties, and the corresponding pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index e52080490ddf..cdcd8faad65e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -15,6 +15,13 @@ memory@40000000 {
 		reg = <0x0 0x40000000 0 0x80000000>;
 	};
 
+	clk40m: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+		clock-output-names = "can_osc";
+	};
+
 	reg_audio_supply: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "wm8904-supply";
@@ -140,6 +147,19 @@ touchscreen@0 {
 		ti,keep-vref-on;
 		wakeup-source;
 	};
+
+	/* CAN controller */
+	can0: can@1 {
+		compatible = "microchip,mcp251xfd";
+		reg = <1>;
+		clocks = <&clk40m>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+		microchip,rx-int-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+		spi-max-frequency = <20000000>;
+	};
 };
 
 &fec1 {
@@ -445,6 +465,13 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl_can: cangrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO05_GPIO1_IO5		0x16
+			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x16
+		>;
+	};
+
 	pinctrl_ecspi1: ecspi1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK		0x13
-- 
2.47.3

