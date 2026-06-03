Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851E3481FDB
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497456; cv=none; b=tUNWPtA5ySKvdgb1bL28cZk4qWdQ2bsxM39suwFPN7CVJ67xW4eYVx07H7o2tj9+c6/5wAKB0SdKejcEzHopWQre62BVxVvh/EJguVlm03rmrABlJzb3buU5UyW2xAzrIdLWK3iVumoMoOVHZig2yCLe+eud9Yj7XdpmiIiPBqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497456; c=relaxed/simple;
	bh=D8mkQWXDrwVabfBff4MbGw889p9AbueZ3qFYR4OWXdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MBUoOJGMRAZaAmkG4MEzP4k3Eg/UgBtNbSuciJ0UKxt2OLyT8SX1S0fbVSHzKcCZMPna918TY2L8pSysMFisOq+F+WlY/yCDFafj8taudlPrLriZnYjocyG8lX45jR9vMeioCfkqtY5ajNt7glxWBrdX9JyVqnMJcxFWt2Dk6nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyqctZ49; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyqctZ49"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b3e03939so7469205e9.1
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497453; x=1781102253; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBv1ogo9d2RihUOK8CREOJ4qsU9TZmZw142DpTudB6g=;
        b=OyqctZ49qLvsk2cM96ySQGGXVTxLfi17OhpVlykbFGJAeLAnx1DgKgwlsYkwT2c65C
         wgVQ0KzCkwyMFjEmVlhnJG6U+awbWW1ptIfFNT1gC3vE7ssTgBERvkyWUWiNlegX4/30
         cpcnNHQR38b0nei362Dozfq3Z+hjd9poMziOKPzNTPGPlGUOE+JWFROgq7n1duWySpmX
         v3m7d5Bz4sPOXxvb42sGahIXXkJxiF2pOKZK2IRNTc6sLevn81+P+KZ8QHTx/nSG7oCJ
         /E8Zh/Jw6RsDDemf0YlEPRLI5KqF7+R7xk9nMpykESscCZhWDetJ5KbSGJMbHGaVTX7b
         Jynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497453; x=1781102253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fBv1ogo9d2RihUOK8CREOJ4qsU9TZmZw142DpTudB6g=;
        b=H4Ot/xCNrShLPV6vkKJI5OTuKuqQlGCbXu0ilYCzCJdJV29w885x8g9szKBeY9I63S
         oTH6zQgYXAc9CBmZ3H7O9H5ecZJAEl7x9zG0KtzFschN7ljfQyCfxHJ4QK6SdwlziCjT
         ucbNO6Ef0Tzv8N7bACdoIvgqk747PESQvE4Fx62TiwpzeW1s2JpZDqMeeSl+vfYd/Mdt
         VG+sATpLlpaekN2SjFBc5q27XViYuhM5IDbsI81xXZSfLk6We+KrtnM1ZYgS3HrS/jbF
         k1s81iJ7C4h/gNmy0q1MNVCpSG2e3YUbi4UX30MvNC7HLjwYVvYuWBS03P4has+zOm46
         ZK2A==
X-Forwarded-Encrypted: i=1; AFNElJ/DnWd5QWfo3KzEGjgn1hlC//z+5m8mmXq9SQQHukBFMJwkLMuJNhXxYqLHX6dITrFQ91k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1HJzG6k6Y9SVwRDp4crfPDw7D4VfG9Zm7Cmv0uoqFJci+oByc
	uZdIUr0XiuGCrOYiHhHyYYZp7I1gN4KBvvF86est4ElgkQgwkmlWd77C
X-Gm-Gg: Acq92OEKOEM1E9zTYlcP/sxBEKBjdUgVgDqr2hF9joA8oyDvxz9mtz8PjG12EmyoInR
	ofv+nV1bPiQvVuQnsjb278M1fQLsqFW7rDcRBgBMVtOSyThYEWrba43a4M6rtJ4KQo5I95+oJoM
	mFdf3JeVc/8I+8vENJgG+5/mNIq2BzHKoK8fi4Nh0DzaJrNuXCiNz+CS0qxoedhD+RNzFae68pG
	84fa8KxjxHeeJVcgvGoNtbHH02aGJCMPMX4WTUwJ2LRV+JFKgJSDivisSzzy4UE6znV9ivDzBLc
	94Yqd69NmjJTjfC++vXLenHs/MPY7A6YXA5A/PBoGp0cst+6ANZoIoAgKYuzyFHqiONy2HBaFA5
	dPdmma05+rfPsMNQnXIBXTCvT8RevGGxCe7VuHcsdmU/Vw2xBGp3VSIxHiCt6cZXSgHKusJnOFf
	p6UkaIv90jP/CW9RRyqPKtNwiFMtaY72Km5talL05NhRo1lx54OoTyCsAHsNEoDYI6zW8rO3pln
	x23JDMcZ2TXkgXI9Hl+3VTHikCrfTuEmlxVsLFe3i/iBCD9
X-Received: by 2002:a05:600c:4509:b0:490:4b89:5372 with SMTP id 5b1f17b1804b1-490b613c9cfmr42823005e9.11.1780497452743;
        Wed, 03 Jun 2026 07:37:32 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:32 -0700 (PDT)
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
Subject: [PATCH v3 06/14] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Date: Wed,  3 Jun 2026 16:37:13 +0200
Message-ID: <12749af99fa4316a43d5aa9233ad8e99da9f221b.1780497188.git.stefano.r@variscite.com>
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

Add the PCIe reference clock and enable the PCIe controller and PHY on
the Symphony carrier board.

Describe the PERST# reset GPIO and configure the PHY to use an external
reference clock input.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Describe PCIe PERST# reset GPIO

v1->v2:
 - Adjust PCIe controller configuration

 .../dts/freescale/imx8mp-var-som-symphony.dts  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 9500c9bf0f42..db0ae706f648 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,12 @@ led-0 {
 		};
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -146,6 +152,18 @@ rtc@68 {
 	};
 };
 
+&pcie {
+	reset-gpio = <&pcal6408 1 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie_phy {
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
-- 
2.47.3

