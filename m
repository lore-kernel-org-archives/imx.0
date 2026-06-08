Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B763C1402
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 10:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913384; cv=none; b=TH/jxcgA1S5RO+PiL9wyKP54dwQ8XIt/hnZJhvbQVvNhYPDpqLlY9KDHuEWuL0GlPwWGLZ7nf+i+dw+hCRk2SWMP06LdBEHHlVvhspK5SCXHn5d72Ss/kycH183+DlU2V0rzRlnmd2nEyHhx3RYdyP9MZTNNVLYc/EDQZiKzqLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913384; c=relaxed/simple;
	bh=otcCri0DxgEweLlKzjCTtxL1ABb+6wi2XU5g9zloAhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oubtJuH5/kxi6GAXemS2Cx8SdWLnXPrJxVhPa+LN/6+rjDG7whouRX9Y8DU5szjT2O2CUQjvOS+vwI5K2XRy8KggJ+K0lsPn1ASa/vyvz+6RZaGgzWlurQ0yPZ2mPpCdqYJz1VrGX2z4Dde7zQbhT3IOEpHyF7NPNG36ru46GEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWNMNpX7; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWNMNpX7"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4600ddc4017so2985686f8f.0
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 03:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913380; x=1781518180; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojVwZhZ3EvYNAttKwQ19CCpX2VmMvoPJYfArtnRSCJY=;
        b=FWNMNpX7YfJsRBZnQMJQX/fEOVbzWmVOeVunnhzt1DJyzK1bvhqMl7BC9Sfxro1Fwf
         1RcfjQpfHQrsCWcW7KbiBLjwUVTX3XNVJe8GZxETjKDMSVH/s43rxfati5kwQMnYFFoc
         0Tgm2TOxPDFzNVd32PgjBu2iq+lLmVgKWEKfwYTIU6tG/yVZd+ZA/cAhuhJQ/LU5CDrb
         uniHXs1+MjzwMnn84naJKjcBFPehxOVbEX3Ze6AJ7tZK84hKsgctja30iRM+jpFQdTtu
         oB0CM4Wq01M9gXet81Ttzd7V2iobz5/xTMt80oeUIAH4J+A3Rw7UXM1KuAPTr3xs9nkL
         Uujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913380; x=1781518180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ojVwZhZ3EvYNAttKwQ19CCpX2VmMvoPJYfArtnRSCJY=;
        b=Qs+mWjjL+2NRGPkssNY9xvuTpheUn8gEp1TmHq6WnYKTzMXIcE3/m93qdb5g8F3heJ
         Fs1QmETVD4Yj/NB6oVFvCZV1wIMhlc66omnSeSSVZTvUvfKNqPNQ5cb9dF4vPVRVr4EK
         hIG8P7979nJEFc6RGsmCOWplyZ0kYHW7L2ouhWeTczPwSXbjs7otex0sSxZ2WC/mFCmc
         VJJCNHoBVURIt0kY8RoY0UFecCk+oyzy2Fd++/HP1qUDRvcrDKimd7wLFWFlu9EAbXuY
         C3AxHq9b5i4b4B6CPAfGC1zdOLDfkMZETgPRgRH0rjmW08e58S7pMVsF3f1+MiKtk9wG
         /Trg==
X-Forwarded-Encrypted: i=1; AFNElJ/TypEUWsjiNooddGCPt1MiHs6bT/uFongBXXgiFfaVxFLfT4riAdhzPrrHvb4ZN3o223M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzsh+WfrW0dk27NfJL5qUxSczeFRqwRi+iZ1x/bnXXYZQLlxFRu
	l90Ff2jerUC+LHm0mD5uRuhWC6+PE8oBZq/bQc1P1U1lEVosd0VepayX
X-Gm-Gg: Acq92OGopxRthCk052/Scj/mDRjIfBvr2ii7AREU23RoGgbG/sJlRMh7Dzgm8ueADGB
	dAo4pgc5qlkNOA1SBXhKGe+Ezmo5ElWQLESh5nmNK2dhDcBzlYSv0GR7iHQhK/+kg0uUdgc3Uph
	P778Boa9I47/hKqQhwnHYdO7ZECJROwPvolm1Do9PU+9mZqyTuA33OyUlzsRHy/v+LrsZ2yfqZA
	8GQRyJYNFlU+XBTwoB/A7ItUDynhr+90aT86Yvja7T+IVWbPNpDT0mgLpgwn7AI94fyYJFt4Q3c
	3lfFIb1J9cpGEhyIo5zp13QIYbQbtHijvK13Udcxoux00c162QCy9ZybvmHGPotPH/HYv4UPJmA
	sDlsDXrKnYqTnb7tnzDhvTNZFrTjJBlFxG9weA4weLxfvbw326NLFbhAmw3qec7LLeh5GAdutps
	nTKed0WVe05HY9LmHBxuZsRelC1UUngzyfGDKtEVldsFRs7+rz9emwRfiZDyzce3ZsHAFPD91ss
	L2TWDYC7PaR9vs68A6CRz690Sq99T9gezXfXwOLPylDyv3Zq5tYbWK6I5U=
X-Received: by 2002:adf:eac1:0:b0:45e:ea65:d329 with SMTP id ffacd0b85a97d-460302dcbeemr15699680f8f.7.1780913379806;
        Mon, 08 Jun 2026 03:09:39 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:39 -0700 (PDT)
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
Subject: [PATCH v4 03/14] arm64: dts: imx8mp-var-som-symphony: add TPM support
Date: Mon,  8 Jun 2026 12:09:21 +0200
Message-ID: <6e57585e7a493e688f235a1c9877d7e1d6640cbc.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

Enable the I2C4 bus, add the PCAL6408 GPIO expander used by the TPM and
describe the TPM reset line.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 2b04c9027125..e9fcc491e5b2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -116,6 +116,31 @@ typec_dr_sw: endpoint {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio", "sleep";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	pinctrl-2 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -201,6 +226,20 @@ MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x1c2
 		>;
 	};
 
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL					0x400001c2
+			MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA					0x400001c2
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20				0x1c2
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21				0x1c2
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
-- 
2.47.3

