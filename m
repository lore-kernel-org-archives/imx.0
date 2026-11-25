Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.203.31.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610256;
	b=Nv0gAv0t95kVACPNHRTb4VcyZ0RWTgRP6oDsPNMsPJchvHAinaI6HWD56kAc+XUgj03l
	 c25VJFX/6YPa8t8dbOCWVIcllblEB2SxxO3iDriizOGlwNTHREf5M5ByoeavB3ODOsots
	 blSmgWjiro5p/9Nj1FqLh7wrcn+z2xkLs+mpF98NMQWIWMiJybnGc4cR/WBRh5os5FZyp
	 kIG7yhzwLsNP/A4zfVn3I6rO6VvU7fTWMleGKFeCDvKawiHNCgHi4UFZJHPIv2zeJwIz1
	 QnihGLAUEAh29SwT1A0L4Z9WVmjAfpQnXbo2RfG0gc2tK8SwUBVelHAJ58qQNLRGF2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610256;
	h=DMARC-Filter:DKIM-Signature:From:To:CC:Subject:Date:Message-ID:
	 X-klartext:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=n//DTZBcx/4hfvqlbxCdXzZBUWO1eReKPjxq+SXr1Kk=;
	b=bqSXGKBNbYiaiAvMx8B5it3lSFVux5Nxr9m8OOVv9xbqDG3OOzZsKRbU1HF2D9yFtQ6Y
	 I45Ly5TFLeGiar2u8G38TxztX+3rfA9HxNKjMGWRjVOV34w6rUY1ISyCp4OOfEwwFZPKh
	 q2viNIGKrvUfPpG/0XHTixck5PVIXJrRmrfIhsF3F5XKJ6NmfOgm56QYcoiJ2/tQIABhV
	 ylkaGkdYLkTwzayxUtqjIWLjWQam7u9ZMnXB0wM2D4hIjaDrr/mwtwBoWByz+Vias7uFG
	 qZubnzLEKScmqBs/MaS2Ctg5j+pfrF3AVRRu2EuGZFbHyTC9e1ve2eGx5CtQdOf53mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dh-electronics.com;
	spf=pass smtp.mailfrom=dh-electronics.com;
	dkim=pass header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=uOGHznIT;
	arc=none smtp.remote-ip=116.203.31.6
Received: from mx3.securetransport.de (mx3.securetransport.de [116.203.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABE4606A327
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 12:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ABE4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=uOGHznIT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1795610213;
	bh=n//DTZBcx/4hfvqlbxCdXzZBUWO1eReKPjxq+SXr1Kk=;
	h=From:To:CC:Subject:Date:From;
	b=uOGHznITf9fa4EOweyKuhzhXoiR7raT+f1wfVZIv7Pn8kfHdrayQ/PkxCsarQI2xj
	 2lwuxw8hmWNs2KjuASIizA3apdopog14vFgks+zWWu0EcIvRzFRIbaazufQfKzEwYa
	 0rfyqUc4MZUHRgom5hMHhvPXUzAtazGEL5gn+gcXhTLZ5IxOwBGnN3Sn0MXnHlGeAx
	 nlwuIY1Nh0XVHxZNzxaSB+cRCLqplkkPWPOCRZ2ylo+3AHMQOu5MXce5bi4iYaCF7U
	 krgEo8ZQdRtJEHX3cqkeZGoAIzHDRniLmiHhWd5EgzR8Rtqo1NCkOK5OONOBxo/X6Y
	 lMK8oZPI4W5fA==
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>, Pascal Zimmermann
	<pzimmermann@dh-electronics.com>, Conor Dooley <conor+dt@kernel.org>, Fabio
 Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Marek Vasut <marex@nabladev.com>, Rob Herring
	<robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	<kernel@dh-electronics.com>, <devicetree@vger.kernel.org>,
	<imx@lists.linux.dev>
Subject: [PATCH] ARM: dts: imx6ull-dhcom: Change eMMC pin configuration
Date: Wed, 25 Nov 2026 13:35:20 +0100
Message-ID: <20261125123520.6040-1-cniedermaier@dh-electronics.com>
X-klartext: yes
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Pascal Zimmermann <pzimmermann@dh-electronics.com>

Tests have shown that, with the current pin configuration of the
eMMC (usdhc2 interface) read errors can occur with a certain
type of eMMC chips. Tests conducted with all eMMC chip types
used in the DHCOM i.MX6ULL SoM showed that there were no issues
with the pin configuration currently used in the U-Boot. That is
why this configuration is being adopted in Linux as well.

Co-developed-by: Pascal Zimmermann <pzimmermann@dh-electronics.com>
Signed-off-by: Pascal Zimmermann <pzimmermann@dh-electronics.com>
Co-developed-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>
Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: kernel@dh-electronics.com
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
---
 .../boot/dts/nxp/imx/imx6ull-dhcom-som.dtsi   | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-som.dtsi
index a74f5273f9b3..97d4de84b2ac 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-som.dtsi
@@ -568,17 +568,17 @@ MX6UL_PAD_GPIO1_IO05__GPIO1_IO05	0x120b0
 
 	pinctrl_usdhc2: usdhc2-grp {
 		fsl,pins = <
-			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x10069
-			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x17059
-			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x17059
-			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x17059
-			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x17059
-			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x17059
-			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x17059
-			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x17059
-			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x17059
-			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x17059
-			MX6UL_PAD_NAND_ALE__USDHC2_RESET_B	0x17059 /* SD2 Reset */
+			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x1f019
+			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x1f019
+			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x1f019
+			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x1f019
+			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x1f019
+			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x1f019
+			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x1f019
+			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x1f019
+			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x1f019
+			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x1f019
+			MX6UL_PAD_NAND_ALE__USDHC2_RESET_B	0x1f019 /* SD2 Reset */
 		>;
 	};
 };
-- 
2.30.2

