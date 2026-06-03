Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900A9481A91
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492392; cv=none; b=fDG52QJbOVRpMySCoNg7tzRTRraMVZZjVXcqcHfWLWPoxbgsY9oohdpd3a4iH3LKtZGmhjerduy1HvjvEjFQPVBNtZZ8rcMa/AeRmj3Z/gMem4j6m0cpQDL7JvtTZ8zdbc21SRGcHWCU5sji9vvdQo/nIAQACz+RRlcqaUys5UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492392; c=relaxed/simple;
	bh=SINbveJea1E27zpNhVxP42K2XN54RBbQyrlrw9Tt7No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+/4pOAP6PbIyzqZ/BTrxHt8+k6zV48q7QSF5Q4yciNiQzQ7rNuF62dZZCnh2bm3/OKvyuIIYhfDaacRju/pT6cfSu70ifR7fRYSxqcmEPL6SCAQT/05ggCmC//3xiZBsb9vM2I2xCKdcNrQ4B1OSTgcxzsFLRNq6c0eaLC7dDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHRg3Dhc; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHRg3Dhc"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-460166910e6so1769515f8f.2
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492384; x=1781097184; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqfrzhCy7fF18AsD5JB6bOpp9EoQsE6oyoZkgRdu5vY=;
        b=UHRg3Dhc4u1GP1NRIrPz6JbaO1aFY/FDrNs10H5TwVlfGfRcEgkFnEn/c4RLtjCc0M
         0NM6tvMSUbItKv0HMW2zLqga4If1VMdMfsuuYdBt9Gqh8XhJ5tTnbvJap2U1o/AhterH
         dc77lj1T+iTqyveV9Nr/Q9jQskCqPqHvNnr3upkRrPZeTleY6DSm9kzxuTipTcgeZ2yD
         VDKTm3U9e/mc2K4H6cd8vBWEastIGdElm3cs+fEQVctZGBmIag+JP0/wQLUJvRsj0wyo
         h2ttj37V8aOhdoZ4yId6zyzH8iTrZQMW9K3LMNEQafQTf2ATPvV4Li3wI2ppLllyW6I2
         EtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492384; x=1781097184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GqfrzhCy7fF18AsD5JB6bOpp9EoQsE6oyoZkgRdu5vY=;
        b=OauaCrpZnzBs+Lx5YQj6c5xhbzBVssLBCTPomnKmT+bP9OkVnva7uyDmrUIupmMRPK
         Zcp2uZ58A61hlAAEjj9PWX5P7KSPv3KI0bthyLTUUmS3yIVTCdX2dYHKCnh4WX0QDu1K
         adN7ekDrP/GP4lKUs4R+wWHXS8H0m3aOm4/vOy3l1w2BUD3yBug6DXAYjY6XjXwCRhRk
         LGSPPw4weYpxdWXU54669oFXpCrQ5GNykuGbMMniGQvilxgWorLPyjcnuZBNbER0mIXP
         XjBLxMSL2liY+eGTfJy5VcncQxRRcNrMRrPAT2kZE4x3J/8ZERaLPAWQxJqQs/f0JrN4
         sAxw==
X-Forwarded-Encrypted: i=1; AFNElJ+fGNz0rH34SF0ezwraBMac7KpanX2t2nDGMKMULvwXjFqUR8gRhSZ+5s1qT3UNl0rW4bM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4WCByF36SEcDbG2Y4Ucu47fflK9zm6QMOkhePPJDBU5fdSVOr
	STgrYJoVt+OXb7G6vUC1spaS98nseqN3Xf+JDiSX/nUQ6A5AXXlHlbyO4HTJuw==
X-Gm-Gg: Acq92OHtpH/3vCWY6As3XnVoS6ye7JOUy79DlHCctqZ198/D5qVoQ/cImChlAjA+xol
	PtuKI9VARZAawJXtvvr5PVgrwLJXKlynRizgMOzY9SjqZgf5VKQapi7mB3ZCTBOkplrjg8ORSFW
	1BPfRAQwMgEggbXUM4H9KeTiHqWMf8F2yjXkMGZLqVCSeCgf1FHMzogW7DuwAQcKENEoccRIMYW
	QkTrH8gM26FYlcafMFMBozjPzW0PrjvtUuYuDr+Dut0S27Yx1iPPqwOo1SElo0pIWeMBFbfw/y7
	aBeIKU5phy5H+K7RGkxsVgR9tL0Azeqrx5fEsYNX0xDKkpfsrjdfeJouvzYDjEvhhamR2wcEMAC
	LiyfSh4mO99CJA9ZnGU34EAVfpILs2wobc9Ygws1cqyPhKZ4F2UubsFBLnJrqaaieqoih7bK5FV
	vbS+AgfgKHV7d0hhnF3ZycNGCvRxb8HLEuW42+As9wRP2bz3gsQyvuQ4m6zl8k20TV4zo5o8plE
	5i4zy4NTx8etd4B8iaX9Dh7kWN6P0eVM6uNmloqNTHb7CYIDOT/WBC/fI8=
X-Received: by 2002:a5d:42d1:0:b0:45d:b14b:2409 with SMTP id ffacd0b85a97d-46021783ce1mr4027348f8f.2.1780492383633;
        Wed, 03 Jun 2026 06:13:03 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:03 -0700 (PDT)
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
Subject: [PATCH v2 09/12] arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
Date: Wed,  3 Jun 2026 15:12:47 +0200
Message-ID: <bb0c43d6aae79786a351083e5b2000b1ac8fb6e1.1780492180.git.stefano.r@variscite.com>
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

Enable the ECSPI2 bus on the Symphony carrier board and add the pinctrl
configuration for the SPI signals and chip select GPIO.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index ca0fc66193ee..98aea97e9438 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -99,6 +99,13 @@ &aud2htx {
 	status = "okay";
 };
 
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -326,6 +333,15 @@ MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
 		>;
 	};
 
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK				0x12
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI				0x12
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO				0x12
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3

