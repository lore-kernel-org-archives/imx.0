Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.203.31.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611433;
	b=dr6ZlwDMzUIdWkSzE89BtcOwGBs85xwZKTiwmvj/dECxeeCbnlY7fsghrR1AGEobF4Z5
	 3yFA0bqVYVLqGFFy+QvdUVR92+2whtTrwiaJ6sLtDfx1nd3ZL48t5kZQOcj6IvbkjPfzN
	 3SxSbHSVntt+hjDP/GwAybAZ+3Oo+M+CZL7VaAsLSGUheRgfSm8bs5AnZZWtENwX7mQZw
	 q1RQ/BZSAXM9MZtDn8iEGYlJvwIl/r6EiDgRqTGLO93poHoygqjUpGyq6iYd7NMVwsqME
	 RRYVDSIuWTgZqWpBjWsa83nB8Y441d2ib2N8zd7SENv9qqd0AF/t/B/RQUNB4wMSRmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611433;
	h=DMARC-Filter:DKIM-Signature:From:To:CC:Subject:Date:Message-ID:
	 X-klartext:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=JHskxtRmwV+MKqji7rkSkHRwi2cIGLr2yWlu9AHf4VE=;
	b=f7ozOmr+w8tne9mRnl5dYLflMadhEq14MU3B7pLqANcqZpruJBnGfZjNsPj337FJV92C
	 sb4UzVXoCkhwJzu+dJq8wfKU6ARw+Vlajf0ZYWqm16mKE44VK+4yCIq2xg76uRAWOmOzN
	 GRmQwhFJnUZERS+wQF2NIzre+qEuh8biMAm1RtW1H3ReQsPefdy0CUV9P0eMNQpb3xaTP
	 6+knn+uDEmyblGEWysuVMky0506KmF3xFRGj+P2rBRM8bwEVdZIYt/Y+RXY5wl0EeehtR
	 XHbcAs8RJZUKR4JSIduoQ/fjOYKrXrFOTsZJM7RdITUKjoO6NWIU1L9xC+uvFQdzp7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dh-electronics.com;
	spf=pass smtp.mailfrom=dh-electronics.com;
	dkim=pass header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=MxPU8dD5;
	arc=none smtp.remote-ip=116.203.31.6
Received: from mx3.securetransport.de (mx3.securetransport.de [116.203.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76C2606A33B
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 12:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B76C2606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=MxPU8dD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1795611411;
	bh=JHskxtRmwV+MKqji7rkSkHRwi2cIGLr2yWlu9AHf4VE=;
	h=From:To:CC:Subject:Date:From;
	b=MxPU8dD54gohLI+lddDn1GC8wi/ctQn7DFd8n05RdEBlKMD6PkX+su6748YUOEmNX
	 F9B8YV3IfkgAYq3DyrPSOkxmaPQ0trms3dp4ZDShqJ8tAFSxnEPRBG0GyQUesc9uRH
	 sg6F6pJbvYv0anVNySUYFYyBORth2gi3ZqNUfBLjlTUG4qOmQ7nJIGzPjuqzS6a1E3
	 JQ4We55atbEK3tDI87vsbYOR0oD0+JExavLd0KIBKGmcCTNoV/eCDaixVTOSxsJH6C
	 Id/NKHgzjD8M2DFdlvyWhlmIwAUuM14Ques1hSV0ie0vWJ12BCqwcXKRoRxxVifabt
	 pJ3y5GZL0Gwww==
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>, Pascal Zimmermann
	<pzimmermann@dh-electronics.com>, Conor Dooley <conor+dt@kernel.org>, Fabio
 Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Marek Vasut <marex@nabladev.com>, Rob Herring
	<robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	<kernel@dh-electronics.com>, <devicetree@vger.kernel.org>,
	<imx@lists.linux.dev>
Subject: [PATCH V2] ARM: dts: imx6ull-dhcom: Change eMMC pin configuration
Date: Wed, 25 Nov 2026 13:56:21 +0100
Message-ID: <20261125125621.6734-1-cniedermaier@dh-electronics.com>
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

Fixes: 611b6c891e40 ("ARM: dts: imx6ull-dhcom: Add DH electronics DHCOM i.MX6ULL SoM and PDK2 board")
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
V2: - Add Fixes tag
    - Remove Pascal's Co-developed-by tag
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

