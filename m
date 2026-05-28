Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5782571D7
	for <imx@lists.linux.dev>; Thu, 28 May 2026 15:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982306; cv=none; b=j18pEpBGdPpmmQDpIQP73v28gkpEwqq6wLjvwkTeJqgpKWqwEoHHn+5CmPTvNVtC0YId272vXMG7Mfg+2dbtT3DBUdj95D7YiIT0V9CHkuEmZN0cpaC2CMRUPVx/31X5GPoXlQ1fzeKRNY43JbqzCC8gyqBCxckSVp7XA7FXybA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982306; c=relaxed/simple;
	bh=ZmuKw4m+NlK8IUuXhkFoD+OD5y+cW81KycMNvd5uFA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e1JPmDjSzNS6tO+Y1CaiCakC2R0DBzekrxgwZPxgXcEexei81ktsBSAA3JX8RkluhSbTdY7DFOtTIDdcMTQTPnR4G+GSSH4jxaPFlRUQJwFYGXuPrTKrexlvH8dZRliu3snCQ4+FNDIqAg2ucMsK+2EQnFQPR1SFkRYE/EEL2p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNgIMtJv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNgIMtJv"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49041e84237so55207305e9.1
        for <imx@lists.linux.dev>; Thu, 28 May 2026 08:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779982304; x=1780587104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bacy4e446xDUINsHvPqawvwpNkB6Ps47zY9T3vbwang=;
        b=VNgIMtJvARw8pei6yIAQJNWpffnmkXg0Ipvp2KctOa+7waMtiMffxqlpA5bdelaMLo
         CIgHFSO8X5wnRNy3GORs+X9AsVYXz5YslDBWgHzN/8hywe2v4sKGHFtTLbmb9r+aE6R+
         /yBPXQxqhwz6RJ9OsvrFiJhDKmS/Mm0bwDHZ7rsnM7TNvFocuy5PMp4Lp0l2JAm0JQFt
         i9tqeXe2Tr2wTAVYU5mMTrWvxsAH5W60Jh3vshcw1DAqeDGoipbcPDBcUHApZGKYp+bm
         DZwmqte8QRhwwKaoqDFL9c/fB6DiPMAiRe3cnCOrZFqE07Wul9SXuM1jnyU03nX00/BB
         zfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779982304; x=1780587104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bacy4e446xDUINsHvPqawvwpNkB6Ps47zY9T3vbwang=;
        b=gTRyKXNJoy5bMXxh7nyNQznJxqquKGuD/7bTUV74Z7FMmQ8QGTlkFWRZQ89qCiCjh+
         LksHCXaVKmuxDu6kJeifpB3+Yhb8qwiR3HyTlWa5Bzh9nQRX6BWA/oHAV1MQ3tWgwrQE
         FBMidS32Z1uQrkPLFPvpaB3uKYzHgEnPOU80UxgkpIsyFvXTGpgfwOpezOIHQrOJeK6u
         yW9/or0SB2VY4h1nOFMMbgfcXmg2eb3q4uFuPr3LhcHiG0SPW7BqQLt1bdap8lbz/jF7
         UUNf8ryQpDGoGiNpjK62XpAx/v+8NEy+kfxf806zp29x9D147MLJdBkBME+Zo/aJTCpx
         BKsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kk5Ft6JjlTOz+BCkHu2gnGc+RtYgZrOyEdtjAaclLRkmOZ6XCdiSZQnFfxTDuDkmKV/M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt3PctDQbYsXYsVtWoMnFdwSPI6hU7pmenMhkfLiCPza2jcKP7
	TUrZtjkH7PkipoJ5cCOq8TxNOF8uu7H/SB9LF7AUkXZPmifxwk4BrSp6
X-Gm-Gg: Acq92OHFOKUTK3gJ60OX1VODyX6tnOPvvNPyCM38HRBhSfbOmSwE6W06DRi3ZYwROGB
	D4kwg/K0XEZGTrSoAhX74HN487/174F27LQRpLrycq+m5s4LOQ5qUoGX3ONik15mq58ONzBHkvp
	dSpE5XkKclJBPEmeyt2ec0mDO3uwjd1Y1HDjhXhjPkDDBx4Ubfo9k1A5INiA9wJieqqAVP7fX3y
	qt9CMmmFzVTG1I5QBqFelXYkdT3v4m7alPvhWJKpHOrYPHXOsGsp25SvDFnvjcfeP3vX3Jt4VQB
	Hs7acdyEmq5HdhlC9x/lRpEoHqgGhizrOOdY7RuGSp5nNMZqyZkVdDvq/1MXd4alW3cyx7ucOLU
	9IAc2dquxLQ/msmcmpPJcY323xwkuYu9jwJVYyZ+ahqUUVDF5/B1/fo8+FxBR0wXwdZUtHgbGih
	b0RYOKwjsezKmK0j8ZC2bSNs400BfiDZRxWfsj8ZCfWsjX4+BEw9vPEEJuuDpr94SHhebaZPEGE
	jIMcmYHSx0aJySbhxKmVw4sOpk7PT9fZi76JJBLnCw7DPi6
X-Received: by 2002:a05:600c:3484:b0:490:3d48:6cb9 with SMTP id 5b1f17b1804b1-49094785aeamr33289415e9.3.1779982304346;
        Thu, 28 May 2026 08:31:44 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a82ea2sm83282005e9.9.2026.05.28.08.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:31:43 -0700 (PDT)
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
Subject: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: add CAN controller
Date: Thu, 28 May 2026 17:29:48 +0200
Message-ID: <20260528152948.15209-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the MCP251xFD CAN controller connected to LPSPI7 chip select 1 on
the Sonata carrier board.

Add the second SPI chip select GPIO and describe the CAN interrupt and
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx95-var-dart-sonata.dts   | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 0f3d2e488f4a..62133b40d64b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -280,7 +280,8 @@ st33ktpm2xi2c: tpm@2e {
 &lpspi7 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpspi7>;
-	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>,
+		   <&gpio1 7 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	/* Resistive touch controller */
@@ -306,6 +307,18 @@ ads7846: touchscreen@0 {
 		ti,settle-delay-usec = /bits/ 16 <150>;
 		ti,keep-vref-on;
 	};
+
+	/* CAN controller */
+	can0: can@1 {
+		compatible = "microchip,mcp251xfd";
+		reg = <1>;
+		clocks = <&clk_osc_can0>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		spi-max-frequency = <12000000>;
+	};
 };
 
 /* Console */
@@ -442,6 +455,13 @@ IMX95_PAD_GPIO_IO37__GPIO5_IO_BIT17				0x31e
 		>;
 	};
 
+	pinctrl_can: cangrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO35__GPIO5_IO_BIT15				0x31e
+			IMX95_PAD_GPIO_IO22__GPIO2_IO_BIT22				0x31e
+		>;
+	};
+
 	pinctrl_captouch: captouchgrp {
 		fsl,pins = <
 			IMX95_PAD_GPIO_IO33__GPIO5_IO_BIT13				0x31e
-- 
2.47.3

