Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D79F48165D
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492393; cv=none; b=adm8cVAXU5oGcIsPJXQe6Khik3Aq+cOVUtKH10w+ZP2PU4sQmILPnfGzq78oNj7iyK3dKT1qLIfvOEBzGDi9VDOtdP9f2U0YY92fTFs4bqep481lOkaBS7NOW7YBq65zC9suSqqpZ1xxI4Q/nk/BIh0PZXkqHU1UiBq0CNNCzCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492393; c=relaxed/simple;
	bh=Sp+VruQEzl3HcXZu88N2hYyC3gVZFm6gEAemuO8HUqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMlEJw7KtyikLiFX+Z/IBz7bFOT1MdhR6t7y57irDOZpV4QVBujcbIdaIbQb0ThHBhAd5wNn5lWdavrsjgG9QBH0keDBXpSQhysrUCnwM6nMO4pZXWlLcp4r1duXWTUp82LgyHLEC0px8kBzfBJGv2LYs3wIwfBnr84X6oQzqj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCjxXJwh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCjxXJwh"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef372c58aso2823065f8f.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 06:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492387; x=1781097187; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKKJfzXLLkRH7XSkPhI5X70VU7gNsq42WXvtDW5Ht6c=;
        b=tCjxXJwhQt+87ZCMuA3NlxmZWjwZx8wZvXY4kLNs28QHceNaN8Ft2fqvrYuV79M2ec
         qGuJMspflogVvph84Fi51ET9iM2mp1FUmlA20kmfEXci5NhMbUV7+CtO0Ty75fESI/ip
         MR4KvSjOw+USUWu+CjJvYvYHyatYdoEi+pz1GC7pFc3YTo05BC2MCurkCyLJ3WIdKfP2
         BKnsjAZuR1Y8aLGTOux2Z2Fl7CB1P8V1QBMWahLTzAWbNYUx6hCq754KLHISUdO4DU6o
         452Z6yAV9Vl4F07kFL7fucDF2maiIsFg2hMZLRAkGWW2TF7ONdxIW5FoMjV0QrdfQTZd
         PP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492387; x=1781097187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CKKJfzXLLkRH7XSkPhI5X70VU7gNsq42WXvtDW5Ht6c=;
        b=nUNCYvEar4Ue/6An3vlqH1htz4fjzHdkFwGBJOuLCgZZy/Skzrnn3uzh0wOZY2KhkQ
         CehRJoI4wr1dPQscgrocDcr90NOW3dyFpVvPn69CiBtUhertjtcRDLAy9iCClfUxq/O5
         E7NPXCXntv6cnEk2zAtz+9KBTovzsHpuP88c16Ciqoid7sYhJNJxwpKl6wT3W6THtCFF
         0kwVvgnejrGAFFWPPJI+M48jFW5uY9r7h411NECXe2zjlYu0CoIzY9zbsM2q3DBIMcRM
         FX9NF6WexhtUzXiozrJdqgpbT+lAW5SHKGR8lNtmIx5NCqQ7Kq/IyFli6lxxaAjLJ4D7
         UQdw==
X-Forwarded-Encrypted: i=1; AFNElJ8FxDrTjY07MPsZb7ll45AnKbuGtRRzCkJmklvRUNtkqNKALDqgbczGyNz0H7CTzTeaOiQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh9HdA0x5DCO/1lspLK+hssejlX4Qduq3HvBTUnzcs+9d9Xc6h
	lPkanb1eV9/1VS6aEuTAxZr/gPCepNunjELoUmGpOXhniBp9aUDUFxdT
X-Gm-Gg: Acq92OHxPKfrIQNOTKCEuLs6tFvjGDh5Dq4JizVjTjbbI5qgAiwyaY+3EObiuT98UUO
	qOq0oamAlzTNo2Q5+7S7X5fN5uzJqHqBN4c/BExpMhNPo7VAidr0WrxKWbis40IzeVhqdNmoiRp
	uFRy+owxUp8vhORm2r6/pr1bkCBf7sBVZAdm9g6FH5iOBrVX0mBJXeIQLf9srRtR+ND9Rx2my7M
	QL3E3N457TAqbPbLgDzQhf0o3zGhaJ3udqT+B7gBVby5UlvKtBhdudPtGVAUahzpQIZM69oEiyU
	/wpw0IcKgoF3H0QDhUjnij+wcOzSsmy3lT+ZGH8cgQlclkg6FQCTKlKl4WX4Z3wXiC0oeWwsp4A
	nrP57be3F0tIwq8CZHO98KNsOzzxqnO+DM5g4/VDrPT2WJJLLHXu2/Z7+QGl8ldA5bQpbmjIvo6
	da/WdIIHQYDDvOmgKTlejpxr17QNPySFdtzQ7kBWqgmRR8+1i4FY4iDuFnzJx5zo15H80+dkdTG
	sSNLReATRE3lFWoA6g0oP+GI/A9ZE6E+2AScMJeChhujO30
X-Received: by 2002:a5d:4384:0:b0:44d:1338:46b4 with SMTP id ffacd0b85a97d-460217924aamr3428115f8f.9.1780492386487;
        Wed, 03 Jun 2026 06:13:06 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:06 -0700 (PDT)
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
Subject: [PATCH v2 12/12] arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs
Date: Wed,  3 Jun 2026 15:12:50 +0200
Message-ID: <54a90899d068a4281cf57d2b17bee4616a75f6a2.1780492180.git.stefano.r@variscite.com>
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

Add the GPIO pinctrl state and GPIO descriptors required for I2C1 bus
recovery on the VAR-SOM-MX8M-PLUS.

This allows the I2C controller to recover the bus if SDA or SCL are held
low by a device.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 49467b48d0b0..61786eee0e82 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -180,8 +180,11 @@ led@1 {
 
 &i2c1 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio2 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic@25 {
@@ -415,6 +418,13 @@ MX8MP_IOMUXC_SD1_DATA5__I2C1_SDA				0x400001c2
 		>;
 	};
 
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06				0x1c2
+			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07				0x1c2
+		>;
+	};
+
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
-- 
2.47.3

