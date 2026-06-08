Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835703D2FFC
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929690; cv=none; b=iloqyZ2h34Mnn7YL+GOBZk87GSc0DyBijm/OGWFBc/bj12C3nBDWSYVMhqclx3N/JnFVUL8QRD2hZVTcRMRrA5EXLlb+YZ6zyodDxY03iMfkh2p75IIFqfqc8YZzwl++mWXb1kkXKUclPUKBvcxpM/HRIHmglpC9dF26tm0MxzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929690; c=relaxed/simple;
	bh=UHxREuj9F00lQFOVYmXg4x/fQ+irWSfd6iuqsfguGx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VVB/vQd/CJTXyLaD6aNa1VYFQdrTAwPlyRXzBlByglrzrH1DDreixg/AigcpsiN4vImWRqgQO01MeAEClkMc/C9o9xhcK7dEveButb2kOqJzlhyCnw1xHr7cBH9TNJG6P+CJhuEzl1NMKxF9gvfriIMZQ0XnkQzIpG9wnSHIxMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnwhQM0h; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnwhQM0h"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-46019b190b6so3352716f8f.3
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929687; x=1781534487; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+mlffvYXyJ+c6iEKRnEszoh15YkcAETzcHIsYc3aN0=;
        b=cnwhQM0h/lYQ2/4UJ+MQOLMT2VpfLmQ2FsAxuWAnRtkaMtBiePo3TwzkDprtcWn0YM
         W+EKVO4vqRXsqLnbjA80d1t5swlNg9K0ilgAybkXQC2t8+b+UyQz3Qu2/wiT3ZENuixF
         8AdoVRHBA0juUEHfZyVDi/rOycTE6TTzM3RazwFA79xwvs7GVFnj9TZUBpZAMIwc01tG
         gqjdsEvrZjyRasuGSMVrpgchDYZA+dd1nDhJoWqzhsmR2XUbtm2cttmn4EXcHeqpV8sL
         /UNPxfXuM23qEaly8v4lZxM4H6KWsdD+bk8Jw7hadQLbCOlN04IE30vFKsaBvj4m9x3q
         MDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929687; x=1781534487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p+mlffvYXyJ+c6iEKRnEszoh15YkcAETzcHIsYc3aN0=;
        b=fMLwditkPy5Q1Mb+0B5NXv8cjVF1f7eUr9Rm9a7PlYk5mVujBa8S9YTE/QbLlnDmOq
         98hqBfhrH95wB+Z4G+RamHsMRP002MZ2eiwpLg1Eo+fuGvWoBF9AorH8T7yuaiQYGufH
         9V/Rl/Mf6BDBO5YxPuCaFcAQ5HANdmmCp60wm212YP3lj30hoN12bGNDKjZrA+t1wxx4
         5FY0O/8PxF05i69vn3v95aH3Dpp1AgXM7mFpiB0Wq4rjak1zqr4rVV7jE/vUvf105hMp
         R/i+9JVEodqGoRG4xWMa2/YxL57/Wm83/nAD7tfPRvaTO2jgT5B0LPJY/oNY9d0FG6px
         n34g==
X-Forwarded-Encrypted: i=1; AFNElJ8Mdj8ymfdQ5RX9TN4h/I/cUJlGudMuCOGB3B1nPv5AVCsU3onRnkeev9DRjMQBWqW1E3Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzI+WGJI9GbwUSW/nZDHR/au/KY8FP3x5BB+iC9ayZdbBREdAI5
	LI1q5R2HKxGAB1LuWdvD0jwaKsppQJJo9BkIJoG0D1dHPDSefuChVBzW
X-Gm-Gg: Acq92OE2rOZLVJZygunkRggLCmjSqvIUzPWaCsPUxikxp7sp9RXssnuunNxOfhLsRfL
	45kXBFiqfG9/hLkEVuQbTCMDVqz87WUCf6Ghv44tDVKdGwQrq2WGkbIdf+C+gHQ2qSqdbSDkyyO
	ctO41El0x9G3o3QKr22P7+PzfuSrr3z+AQNxMSJUI5cvxTbhHrdDRHHQbiXcFyVStGvv9kMAJHm
	eVZgHTQtxQnUFCbfRdZIYyIMpTSbTFe5oUTKovXDLdte9yeFMzT4v4jZ22QdVsl0lyEcOjvSpdV
	rDgWAJWzv8PE0H7kGEqDWR2dKwb8yeSw1etynwDl3gUDGKoXZBAH4RQopk3/pI+S8rXgeo0wa8n
	IpEjFshZjOyxQvrFtTN1DT760R9LcuCTX750dMQJAX/UULlax+Ur26ihnYRTd1rfryJ6/v7UfUA
	tPMQwUWweF8SqhTVvODIE6p27iJ1LM5B4qt2dknKXBPXlJZVwPIA9vv77CasJwda0Z6AReOV5l0
	1ThfU91FsBkmYKwcehbnd82/tyeKj/FL4T70A4bdLxUvfK8
X-Received: by 2002:a05:6000:1787:b0:460:3210:434a with SMTP id ffacd0b85a97d-460321043camr24884499f8f.43.1780929686745;
        Mon, 08 Jun 2026 07:41:26 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:26 -0700 (PDT)
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
Subject: [PATCH v5 03/14] arm64: dts: imx8mp-var-som-symphony: add TPM support
Date: Mon,  8 Jun 2026 16:41:04 +0200
Message-ID: <967fe38da37fe50ba69f20f6286d4fc97a6cf523.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
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
v4->v5:
 - Add the SION (Software Input On) bit for the I2C recovery pins

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index cb27853ba281..7cf58198ef14 100644
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
@@ -201,6 +226,20 @@ MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x400001c2
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
+			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20				0x400001c2
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21				0x400001c2
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
-- 
2.47.3

