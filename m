Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D1947884E
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488010; cv=none; b=XkPta9xKlSox1vY/5z2G/4QwtUaD1Gt3UEIXJlPv/SnR1+5huOzsczDgz9/xExgf9fQD3bbEYnE1G3f0KwMdHuBeDYFUNmzzXFiFmoNkCfp93xyUJc9jKri+iIoY6sTWmaJiJ13CoP0JEduLMvwYzA/N2W6VcyM2ACVLBeJlAqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488010; c=relaxed/simple;
	bh=tBN46t+bJZn9dqVVJ8aJQkMtOkuEumelLyFBGqz72DE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eVtcFg2qdtfE39cGfafYYC6o4Hn22swMJ4jIG1G7cmFsJ57kZNRzM58inofDBqxlCg14g0c+t5cIDesl+5pSupNZV035dXGYtJvBn+hWqf1B+gLgyoRzMrVF3xdt6AeBRLEIkKmgNILUko1yacjWrW+Tg1KvVNMRXQK9lcCXg00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDJXNi7G; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDJXNi7G"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso3509383f8f.2
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 05:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488007; x=1781092807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfXFBSjJ7Bso/9NLwnzNY1klrNWUGJZSNA6NwHWFfa4=;
        b=DDJXNi7GiUHY8UDLwSk1Kd1pkfuA7X7oc7baTZnN2LH3lHYK9aAxCoWB+Iq7rmt7kg
         3P/O40DnM6QG8cV04OYTztZNyBEto2zDiMRQTvr7aekp2S+pNqF6GwJc+E6f48Cv0jr6
         /K1WpwQqzrZQeHI6J4epAfMYHj8Q1S4Ek/3YcPzMFb8p21eSM9boLT+CtTEox5IN337F
         RQQYN0eL/0fHh1TnDJVM4ccKv4C8ZDz6IEq1eBzLkYfu/hDKn0wUJNuMlmIb+PGj5Zy+
         mPNAm16anq18SH32W0Gwkb/SEq9Z8NWb9IYIieyTv/VbpZ+QshKgTf1/t98H5Ui0wenk
         MtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488007; x=1781092807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QfXFBSjJ7Bso/9NLwnzNY1klrNWUGJZSNA6NwHWFfa4=;
        b=N7ZmhPSpW0+FGEAt0PPZMj+o86uIU0mi+M8rLA2eQHK+r8tEY5f5FqsIWHWJFyLYPN
         0ad22vSoVEED4YRS6XNLuLm9OkjSQkofVYB1e7QPd38jnw0ojyljAd+vmYXEfLzTzksk
         hmNaqB4qPCsSflAnxPyiJoRFykamY/pjriQRoGlPoEEA3wvT8FeL2OE0E7+PQY6nWRF9
         UdjpE/P7w6FKkR2zFBBE+0J9/Hj26Myl0QnNMhoV+p8GKyuXgeT7jerMz2JwHotmdXxY
         iV8hGfasQYMzcLIXti6A6LyveCOUb9+h2Qt5WK9Ie12H5Hsj+W4SrxzIJ33Wn56Q4m65
         uFxg==
X-Forwarded-Encrypted: i=1; AFNElJ+xn2+DykFYaR6QdTOSLEzk9CEc5KJp0rdsLMJ1tUaBYVCnhSFYwyWB9yB0Kaj4LqMH6Zw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZnX3s3nIUNDuOWZXWSBNSSbyk38ZlHmiO1qhGpJdK4JD1aT+5
	PBeCM7a/6w5mUGNWldQeetx6WJt9rHmOTMAUVQ77qy64AjkGWljQW4aN
X-Gm-Gg: Acq92OG5DH0v+241eigX+WcJJz7DDzSnoMH7g39a/ciNiIDiXrKW/6btoxVprQWhJAT
	E1hVAMyzPBeaN1/jibOfkbmom44SKRu1WdOFdOAXaogAQ7oY9dp3eWeg1PhH+aqPqcneXD/hqdM
	zto7mP5tTfVMjuxWiNIxmNYbkcHBNYez6Vy+Qjdr0Vqczscav+PCBlyOypIPaoqPFvt2mwISZ5y
	ebGxdl8UaFXYbWfymKp4BKR58zxl9CQHyOWaBZkIEzy3aLdkEjXAp/nYRmKMz7Tc6ms/hMFzadv
	wYdBnL+V4X1LctLGqiNCu5qCXYJi6Y3ZpolKHPEHuhNzpOWSBgVKrjFyd6NIbbLkvIb1mV0WLjB
	/OCjFHgdEUC3/rsm5j6BU29erQZfoEgBfzZqrcxzjiAokebDXdmtDSfGPWM0iuBky7qheDBxpmX
	1fKXgJDRB0iNn89WQ8Mr9bxsJLmM9RBwjRGQflmnFrDdurU0wjNo4ow8VQwl9vRLO+R2U8voTeW
	c7hY/Ri4XHbchTHi1z5X+SKWCKKWDTUliC3YvFzlw5+N+eX
X-Received: by 2002:adf:f247:0:b0:45f:f142:d571 with SMTP id ffacd0b85a97d-460217a50fbmr2915483f8f.13.1780488006448;
        Wed, 03 Jun 2026 05:00:06 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:06 -0700 (PDT)
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
Subject: [PATCH v1 06/12] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Date: Wed,  3 Jun 2026 13:55:44 +0200
Message-ID: <8b56416fbc765373643dfb0300c3661564e68ba4.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
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

Describe the reset GPIO and configure the PHY to use an external
reference clock input.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 3dda28be92f8..fe1699649414 100644
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

