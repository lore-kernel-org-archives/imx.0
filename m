Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4807FBDC
	for <imx@lists.linux.dev>; Mon, 25 Mar 2024 22:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711407060; cv=none; b=FLCZP1/0p3h2pS15rYUQ8JnFpEhrCda5S7At9zqyA4rIi9nBwNB+E/NR1QNRNbP+Z2BtdLb/LkiZZ8NilFwVwTjYUDEM5m7fcnNRUDhENUquq9BTvuV5G30Kx4O6RSUP62jXADGDxQytMlxdCzh+OwI4mBFekW+ZH3a0YEP+5tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711407060; c=relaxed/simple;
	bh=0f9qpwXXxWgPJBcoJIpLXonLngQHZiXwSMlsWPCu1vc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PUN9XJb14s9iUysI1iulPvaioO29BzBwu9nSduvcpQ+LVMlsqeify7Ge5TbQY0iwfbxiDVE1kqkIKhZE+BlTVcufnI45gYO+cB1sKdV8jNeopf8C8jIph+wi9QTDMtv7KXsT05pA9e0mp2gM+umpn7E1FKbDZ1Wkckx1DjAwxXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lcCLsn8/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lcCLsn8/"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 209BE7E4;
	Mon, 25 Mar 2024 23:50:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711407025;
	bh=0f9qpwXXxWgPJBcoJIpLXonLngQHZiXwSMlsWPCu1vc=;
	h=From:To:Cc:Subject:Date:From;
	b=lcCLsn8/QtQQ5SRufgSvn+D8lNYyO1oU1tR8ZN8k2Yh6EzpMCsRy11cddBqjmN46i
	 wk5VYPEnlbQFzFmPDGKt+X7CpozFaQutJAMBtnCLjKMdm8xuW9cfK5AriZ2laD1xNl
	 0qGtRYoL+nnc/dsaqLz3G0sTLaFZTJx0oNvp0RR8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH] arm64: dts: debix-a: Remove i2c2 from base .dts
Date: Tue, 26 Mar 2024 00:50:48 +0200
Message-ID: <20240325225048.1159-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacopo Mondi <jacopo@jmondi.org>

The I2C2 bus is used for the CSI and DSI connectors only, no devices are
connected to it on neither the Debix Model A nor its IO board. Remove
the bus from the board's .dts and rely on display panel or camera sensor
overlsy to enable it when necessary.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../boot/dts/freescale/imx8mp-debix-model-a.dts    | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
index 5ac77eaf23d5..26c303b7c7fa 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
@@ -210,13 +210,6 @@ ldo5: LDO5 {
 	};
 };
 
-&i2c2 {
-	clock-frequency = <100000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c2>;
-	status = "okay";
-};
-
 &i2c3 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -392,13 +385,6 @@ MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA					0x400001c2
 		>;
 	};
 
-	pinctrl_i2c2: i2c2grp {
-		fsl,pins = <
-			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL					0x400001c2
-			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA					0x400001c2
-		>;
-	};
-
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL					0x400001c2
-- 
Regards,

Laurent Pinchart

