Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7164B470113
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 11:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719993; cv=none; b=Ldylyo2b40sbvmsqf1X14ezIkLZl8zjkqJMs2nIiiYMbbCyDr+M/TSaiCUqQnn2dwFslZXWSIOgGazz1kbVp6jgMgLbVcZQFrksIFM4DawJCT4reBmpmtPYSzBAVHt/Z+Jmx2VvYDaCiT3NdyEcnYFpz9g2pMmV1jCojCJ7uLjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719993; c=relaxed/simple;
	bh=+k6dDmbnvintpiQShs8TSV923DT4bQAUmBhF7NoxLX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Du74rTCaII3sOJBa8OjPk2MJx9kNcLwhJ3z8T+GDtqH/+G/mSdmadTPCdFPVjxo24w1ggYCrNr+8yM3L6LTVFBWF28/WoiWQ3mVQKVJmD9yjqzTKqas3Mnr2EBC2DVLgBA7Diiz4HtrT73JkUGn0X1g1iI0Nq2vWmWyPBWUahYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=puOkTdRB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="puOkTdRB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954afac04bso47214105e9.0
        for <imx@lists.linux.dev>; Wed, 22 Jul 2026 04:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784719989; x=1785324789; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CtM+fsCt4wxJcsndijBxF/F1yhByHuvUrkUU2HREy8Q=;
        b=puOkTdRBCK9A/6MnZIT7xD2XVMzNfPjbi3rqoAelpnQrB3RsBkRMlXclJYq3iiYj9c
         sLOhDVEIKTEkKrYFQdrNsnuxDKYy8nReo9hu0OAmTVRVq9AvDNKj89Om8ad0rk4mFw6x
         Nxhf1/c57mXQdNO/dEL8EcLM1PgV3d0uH2xTNm2UrpX5VPl8vCYV0hTgfR48BKijjH0c
         OqxcLetVrmitFQ4r4S8ySvtmFM1phSjZcKVRNxzBABmvDwGYOac6KcY6TzUsRBiiBzCJ
         INAxdzhVQzb6TR0XoFtOe8FwpGcsWvt3jmMfKOXWESIZdLeeVAVVYfVkBkqsH34NS9jK
         7BWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784719989; x=1785324789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtM+fsCt4wxJcsndijBxF/F1yhByHuvUrkUU2HREy8Q=;
        b=IBR8Wih2r/e0/NkLpCDLn1TgWBM6JafDUAN48MqQNu7aVpBoBaGQ1SMBv+qUI1knCI
         lEydGbszF0aBcCuSyr2P73wdUe/IfEzj+rDnASKwNsN5G0FbnTcfjx7pHQm3eIJZJVbk
         UyEVEKLFY33o5okDyICCLX6rr4HgvFzKix3I/oF1wmdp68utgpoTA4A0uVRCiZyR6pX6
         GDSqTzOdupZ1PVY6gwRH1oghtqZeNVXPXZzOMKqcGqw3pv5VBaLBR+sbhwePoaOWk7P2
         SEVW+DoikumfSFfuskUFPFditk6PqRJz7cn2XZLXc30A9/ggFBHH7MA8EsWDWlwuBppv
         GDmg==
X-Forwarded-Encrypted: i=1; AHgh+Rrc0cb1LALq9kDWeD5fbYZki750Lx/wKPSzdRPyXV3Dv/urjHhZ3OZaYitMKWq4prPGaFc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp2L74OiJy5BCOnRlQb0xDEoHdXxvTIQoapf8QfEuJhnPABtA1
	OiWg/+3VA2OyCBCyOyozqUqcRZf54/i/Y/Wxkee3qlVTcLkWNGlNaOOWTpNd5w==
X-Gm-Gg: AR+sD12fvZrFDXVodBd0JyaIPmM4+GMYs3p4xxdY6YOY/Q9zQZOQXwoJ0iF1cyR9bxr
	9XC5ipH/TpCVT/60jEaEMw7vAHPA1LvGjBceV2Ahifxi2EHlWh6l0455Lpkcc2BUojUFPs1dC24
	eC7ZffC/dIUC89qKDvhKZ8tQ+TdSTN3owOq5TxxAzkK9xAqxoRwNiB+mvmzM+hCSgM6mo2KmPQZ
	LVmpdWZEcVa2ZNcn6454aW/ctsEXYmqMaR7ML5/Jo+vn/ysWO64p7qUOIjMETsBvqh/f1rkclr/
	Rm4b8WyYUHgHeO4Iy5jZ7/3MaVBzruM99t4xyOXMT5666oGiIFLdSF4tXcJJBuW821LEyBbz/Tb
	WVF73aRx78DOvnzpNFoyREvW54n736HD0AHTvWlfG+bEB+cublQQhEM5Ek51ZzbCX7MhWELWg5w
	aNapS9Cjutb0JBWC+Cqxk9VWeZMniHgxEny7n5ovGbN02xxebKBb5Wez++tEn43tGqfMRiN2sWw
	QjcDWAtdIZOphyhE548H3iqjw==
X-Received: by 2002:a05:600c:19cf:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-4954aa1a116mr275465885e9.18.1784719989472;
        Wed, 22 Jul 2026 04:33:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495686a8600sm118911045e9.6.2026.07.22.04.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:33:09 -0700 (PDT)
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
Subject: [PATCH v1 1/1] arm64: dts: imx8qm-var-som-symphony: enable expansion header UART
Date: Wed, 22 Jul 2026 13:33:05 +0200
Message-ID: <20260722113305.28817-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable LPUART4 and configure its pin multiplexing to expose the UART
interface on the Symphony expansion header.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8qm-var-som-symphony.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
index c7d3073b4041..ec55b86c220d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
@@ -287,6 +287,13 @@ &lpuart2 {
 	status = "okay";
 };
 
+/* header */
+&lpuart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart4>;
+	status = "okay";
+};
+
 &pca9534 {
 	usb3-signal-route-hog {
 		gpio-hog;
@@ -428,6 +435,13 @@ IMX8QM_LVDS0_I2C1_SDA_DMA_UART2_RX			0x06000020
 		>;
 	};
 
+	pinctrl_lpuart4: lpuart4grp {
+		fsl,pins = <
+			IMX8QM_M40_GPIO0_01_DMA_UART4_TX			0x06000020
+			IMX8QM_M40_GPIO0_00_DMA_UART4_RX			0x06000020
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			IMX8QM_MIPI_CSI0_MCLK_OUT_LSIO_GPIO1_IO24		0x00000021
-- 
2.47.3

