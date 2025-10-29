Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2D03590B5
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 19:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761766158; cv=none; b=OUbHPay3434dpedRtIZl5W4NgEtnse2TPwjb8572dN0zU8QkhSxlc8PNz+UM/bXkrnSrNBjuWg0EsM8F2l4VHGiFDom7C0KpEqj0qEqDZBwYS47UMqQPRGO+4oBeALkX0Ui4ogEIG/gkcxLxcVxD/GBfY5xs0ktgUdwU9INL7mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761766158; c=relaxed/simple;
	bh=TBS7ZMz/huddl9pLh96AmfhkHxVmvREzsHwTliKCOsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1LojU2o6qvMadePWHetOARSJpkEljOlQkQarqOfR9aQKWal+7JaJuogW7uxwWY+7qx1zyPnenjktJ0z3XY2iavuLN5FunVGQXs66nx/7Uz0Rj8GaJbXWhMWTfpnLQJ7lL8czn+86v9+ktvXzJYO9BZU5ck2cUPuF7lB+AYt9xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxuLQwXP; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxuLQwXP"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b6d5e04e0d3so48694566b.2
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 12:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761766154; x=1762370954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drvlRfVB/NoPKWYb6A7Zkbz4VYcKiU0cQ5EAHKwC8TU=;
        b=gxuLQwXPaCo84O+ePhHyZ2lVhg6QdEQG5jHjbGZSQ66qmO84IeUrmxMO+FkAWdTQIP
         wfEDf7obBJajPaa01iQsiYx2hno2tcJ/amAxOscGLih8R/QN9UtIr0F1ILHhYe4cvamN
         E/9vtzqu9qIjfBqzuEjRTdm5FDVn3lQ9kSBlKwPCffaMSIrsMBztuPB1Hu3ND8SaUJZ+
         05FxeeOLrfAAx9oHyikoyL+8QRzGQXxXxwgGpPK/qU+64pu47aRyfvI8xyZbmo14fHDi
         P/gCcMxDdYJR50pOTjYr6xRemb9s3oJAyt3KwhEOACQ7JMYYUYJmVr8KfdulX8Bgck8C
         2QEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761766154; x=1762370954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drvlRfVB/NoPKWYb6A7Zkbz4VYcKiU0cQ5EAHKwC8TU=;
        b=VxbxZ44jfItQyqPBRh88b2xpV+9M3yEsez9BHvXumK2r7+NwpQFXg8P2N3qLuKtWCW
         wNwwB437f924AanN8GYcjIuO27r8OLWqxtEjGmRpOXwiPhxXdA0yKMuRz+Rq7bH2ZsXA
         nH4/jUQ4ba7DbmsRZ7StZMEwtThkgovewDALtV9fJGCUeZ4Gk/mN/b11Yy7oL5yQIN6p
         Rz3LRYXqFuL2FesvzCL4Ed7a9dhJ+bvpIl1QFLZErgaUVr6GxtusVfmajnQ+1UW4LM0z
         xV6Nwmd+cCkUmtv0TqzTYm2VmwO9mmtCXIltx8T34KOQbXjqPnQQsdasBC4LCLtJKBPp
         7o6w==
X-Forwarded-Encrypted: i=1; AJvYcCWFsgzAq1ST3NhEisw1wxsqZhrBvh09QpnFOS0jTpEEeY/fy6iS3V3ZKOezaQVcpI2s6MI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8/+c+DiO2gTfYpIsYJ+72MRQ5s/ckGDsVWMgGLVvgNd9u9Ghc
	EOFvbAXfHRAAq7luQThm10PPUCoC4yoPgk6ddNJkiwbZY8hVEghXuOP2
X-Gm-Gg: ASbGncsd30KQDCoXUMN9bqDEc+2E6maaxEhsr8OaEy5YDWnu+WLKnoPImezfJwYpI/v
	SG8MzyDA2QCrio2qj5HubErcFrayiqTsBhB2Tp/DlaZze8N9sd0n+aVKerQ5kCdWzJLwR4cGUDU
	2h4JVxfBWGweLo4chLyfjq+/urju3KogxFlyidtnEBm3dgZ1JAsUtsT9RKWRLjeRW5GYND5eXkR
	+kOUEEm4cMSOJCIFC1uI47F7mq08Q9emw7Cf1OWI3rSoXxripgQ62gZTvJ4ier12DhDreH4C+C/
	Z5dN9ZK0FnhjeDirtmC24elush45xHS+wQVZP6TvdBfWTkDa9+IB0EnYjA5g4qSqnBnSkh3UPuh
	mdfUhXUjtTnJJcpgFT4Mt8AjLbXq+Pr49dt4T4OWp9MXA6IDh34dwNk+HDq8PvB4PziWP4demYc
	LmYzNdHzyjd1b3RPo4ca8OffnzphJfZ1pVfVk0cpCaMa6qwxUQokcTNBDUC4oX0Q==
X-Google-Smtp-Source: AGHT+IHVJORke3FbLcazCdqb6IzzPmDXwSbtp/S5D/AcSmwvYP+0vUHCAfCC9o5lV9yehDEJzSKsyQ==
X-Received: by 2002:a17:907:9342:b0:b4a:ac1e:7866 with SMTP id a640c23a62f3a-b703d52573cmr367554666b.45.1761766154134;
        Wed, 29 Oct 2025 12:29:14 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8548eda6sm1496673266b.75.2025.10.29.12.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 12:29:13 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 4/4] arm64: dts: freescale: imx93-var-som: Add support for ADS7846 touchscreen
Date: Wed, 29 Oct 2025 20:28:49 +0100
Message-ID: <20251029192852.656806-5-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029192852.656806-1-stefano.radaelli21@gmail.com>
References: <20251029192852.656806-1-stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VAR-SOM-MX93 integrates an ADS7846 resistive touchscreen controller.
The controller is physically located on the SOM, and its signals are
routed to the SOM pins, allowing carrier boards to make use of it.

This patch adds the ADS7846 node and the appropriate SPI controller.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
 .../boot/dts/freescale/imx93-var-som.dtsi     | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index d94b40d1d804..01adf7b5ac12 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -212,6 +212,38 @@ wm8904: audio-codec@1a {
 	};
 };
 
+&lpspi8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi8>;
+	cs-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	/* Resistive touch controller */
+	ads7846: touchscreen@0 {
+		compatible = "ti,ads7846";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_restouch>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
+		spi-max-frequency = <1000000>;
+		pendown-gpio = <&gpio4 29 0>;
+		vcc-supply = <&buck5>;
+		ti,x-min = /bits/ 16 <125>;
+		ti,x-max = /bits/ 16 <4008>;
+		ti,y-min = /bits/ 16 <282>;
+		ti,y-max = /bits/ 16 <3864>;
+		ti,x-plate-ohms = /bits/ 16 <180>;
+		ti,pressure-max = /bits/ 16 <255>;
+		ti,debounce-max = /bits/ 16 <10>;
+		ti,debounce-tol = /bits/ 16 <3>;
+		ti,debounce-rep = /bits/ 16 <1>;
+		ti,settle-delay-usec = /bits/ 16 <150>;
+		ti,keep-vref-on;
+		wakeup-source;
+	};
+};
+
 /* BT module */
 &lpuart5 {
 	pinctrl-names = "default";
@@ -307,6 +339,15 @@ MX93_PAD_GPIO_IO29__GPIO2_IO29                  0x40000b9e
 		>;
 	};
 
+	pinctrl_lpspi8: lpspi8grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO12__GPIO2_IO12                  0x31e
+			MX93_PAD_GPIO_IO13__LPSPI8_SIN                  0x31e
+			MX93_PAD_GPIO_IO14__LPSPI8_SOUT                 0x31e
+			MX93_PAD_GPIO_IO15__LPSPI8_SCK                  0x31e
+		>;
+	};
+
 	pinctrl_lpuart5: lpuart5grp {
 		fsl,pins = <
 			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX   0x31e
@@ -316,6 +357,12 @@ MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B  0x31e
 		>;
 	};
 
+	pinctrl_restouch: restouchgrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO4__GPIO4_IO29                  0x31e
+		>;
+	};
+
 	pinctrl_sai1: sai1grp {
 		fsl,pins = <
 			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK                 0x31e
-- 
2.43.0

