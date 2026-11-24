Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.121.34.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508309;
	b=QLlvTFAa73TV7JMoiD5UTtApOfNakuX0lGyayIUCtwxNLUjXq48ZsnuitFChMq9U5gve
	 M5vrOAaz7k+ux8CBft2KUMZvagXXH+FmOFKqo6iQqJbPWGidPfki6NsAYrvMDF+jagv3s
	 WobjGYrAJgfGHRYqU5xv9MErveUMdmpbbQoHyT66W/8ua+KkuUNY5yDvRt8QJwyJ4+fi0
	 DZLfnPwoJdBqtjlhgEOIw0j1UpfX7Nnk0xj5K+OM6iyGGjeIuR2XAurdEVbRNsKqjCq/H
	 EiPozpl8pokcZnEiAdK194G2uasGcCirxfA80aEMTwOAyFdF3F2hg/QPR5KKYT0P/ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508309;
	h=DMARC-Filter:Received:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Virus-Scanned;
	bh=hqRSb0ylNLV6vD4z5XoIrPEgClP+9sq7dQZHqPqG42s=;
	b=xTCAhIzHomAnv3h/7fu2U5XLSLJvI2yIK2cqBkvHh0Ju/OB8aL0H131Fz1zNpMsxZfKm
	 FazAnaDBuJrCMn+zC1yVpi0sBxvAfN13/jwxan5OkPfiIVokSRYLrGcJeSMjOnxrEekMs
	 QqoEdv/kAfcglhqzfe04al2tKtCnSEZt0BhWQLUFKpi1x5Dd64dfbXZE9r+Lpt1PKTT6u
	 CTfvB/xWBINRqEZLV8TcYYgQgDu7zZjR14AzjbAp7/KQtSap90gp5PnUADUEJBnw8oIeY
	 HWCej+v66KUcMmkjMjHWNa7msCu94jruUIbTUxDCywBbBcNeJ96AckAqsirP20nVuQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	arc=none smtp.remote-ip=92.121.34.21
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB82C606A321
	for <imx@lists.linux.dev>; Tue, 24 Nov 2026 08:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB82C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5140320002A;
	Tue, 24 Nov 2026 09:18:21 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1C83E200006;
	Tue, 24 Nov 2026 09:18:21 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 410751800088;
	Tue, 24 Nov 2026 16:18:19 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Tue, 24 Nov 2026 17:18:17 +0900
Subject: [PATCH] arm64: dts: imx8mp-frdm: Remove unused realtek properties
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-8mp_realtek-v1-1-3da734007eff@nxp.com>
X-B4-Tracking: v=1; b=H4sIAEhIBWsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMTXYvcgvii1MScktRs3TRjc9PkVLPURMukVCWgjoKi1LTMCrBp0bG
 1tQC3X75iXQAAAA==
X-Change-ID: 20261124-8mp_realtek-f375ce6ea9be
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Fabian Pfitzner <f.pfitzner@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795508299; l=1058;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=rgm1aRFFWQrRE+f1gbnVp8iVbSLtNQiOlcAcqDGTNSo=;
 b=huXENi4J/NRcZn+qh5ZNfDIYqfwdL1TrFbkTbT7+Enlszgg2W075eII+8gJVXzB8nAH2isvE9
 GBfijoG8qgBA3hAP6xdbst13yNT/N45SI9Ejc81GNSpKYsXw9LE/4Tq
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

FRDM-IMX8MP use Motorcomm phy instead of Realtek PHY.
Remove realtek specific properties as it is unused.

Fixes: 95d7d7d2ad27 ("arm64: dts: imx8mp-frdm: add sd, ethernet, wifi, usb and hdmi support")

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
index f43330d1ff8b63a86d84bb6e5cbba72b313eb634..e621b6fdaa77996b0837a3545e1d92e0cb44015f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
@@ -233,8 +233,6 @@ ethphy1: ethernet-phy@1 {
 			reset-gpios = <&gpio4 2 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
-			realtek,aldps-enable;
-			realtek,clkout-disable;
 		};
 	};
 };

---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261124-8mp_realtek-f375ce6ea9be

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>

