Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2767F175A91
	for <imx@lists.linux.dev>; Thu,  7 May 2026 06:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136557; cv=none; b=PhXPplbu+Lsl2vBzeWXaEP47LxmV2jMTN8PQVL0YShhUI7zQVv5uuTxWbDaDD4TEQibjRGJzEPI/FRDmFOKX5YSl1BWdqwXMQY6clwhpgq4jPg6+OeuDpx3DW2fowkej054Zt8MjU8wa2Trgj+ddA4vnd2sVV7hWkehrgNxO/o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136557; c=relaxed/simple;
	bh=3nTgqGDxNcTjXFm+5UlyF/IHfwVM+eclkZyqReDJG+0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kxt5NGJrlvj/FINZMmIEMFyqCai6UnvSlCSTKGO4bBI97szKw/rKdn9ATQ2equ/SwxNYbYrhx19e2Zjj0xlDRb0xHxoIc785h+YlELBE4wqUkAu9+sFgQNhoQW3SkRmJKcTfLJSUuz1bKjS/zgofEPpQ2K8HHOEc3t3ZMOtqv9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=OmfHirpD; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="OmfHirpD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Tm52jc2RxHGND87DERITHVmtx/vlXa+LykfPcBly4ak=; b=OmfHirpDm7jL0+ITFDLPNzb69t
	tB1rf99X3ftZuBZBPKolIGgqMP0b6Bo+FLppvav1OrRwYKFl6sAPUScNc5GcTsXeS7+GQ8iC33Kwe
	Nge/E8MLQy41YOB0RaC4AajkPNN8ZepmKObd9AMnuTZ9mJiY6V0BF29VzKUVw/HQQzgSue0IoVCsp
	S8US5sbDZt7KFlq8ZPijBMy1J8601+DiOHP2AXkGe24YxxprCr9bye8Z5QKAJRZeHg6APwQ5PeXZC
	XMMjJ8HCrir30ApufUIu1Pa9NKRQ+KQEPqiCpBVoWtWm+ZV/qgK4CmrsvXdWzHVNc4xOGEdMV5zDG
	5S+6qgOg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:40514 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1wKs6Y-0000000AGWs-3xYq;
	Thu, 07 May 2026 08:21:02 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 3/3] arm64: dts: freescale: imx{91,93}-phycore-som: Improve USDHC signals
Date: Thu,  7 May 2026 08:20:58 +0200
Message-Id: <20260507062058.1711292-3-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507062058.1711292-1-primoz.fiser@norik.com>
References: <20260507062058.1711292-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From: Christoph Stoidner <c.stoidner@phytec.de>

Apply improved drive-strength values and pull-up/down configurations as
devised from hardware measurements to improve signal quality on PHYTEC
phyCORE-i.MX 91/93 SoM based boards. Also improve eMMC HS400 mode by
setting property "fsl,strobe-dll-delay-target" which shifts the strobe
DLL sampling window to the optimal position.

Signed-off-by: Christoph Stoidner <c.stoidner@phytec.de>
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../boot/dts/freescale/imx91-phyboard-segin.dts     |  6 +++---
 .../arm64/boot/dts/freescale/imx91-phycore-som.dtsi | 13 +++++++------
 .../boot/dts/freescale/imx93-phyboard-nash.dts      |  8 ++++----
 .../boot/dts/freescale/imx93-phyboard-segin.dts     |  6 +++---
 .../arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 13 +++++++------
 5 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
index 7b18a58024f5..aec83da87c4e 100644
--- a/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
@@ -309,7 +309,7 @@ MX91_PAD_SD2_CD_B__GPIO3_IO0		0x31e
 
 	pinctrl_usdhc2_default: usdhc2grp {
 		fsl,pins = <
-			MX91_PAD_SD2_CLK__USDHC2_CLK		0x158e
+			MX91_PAD_SD2_CLK__USDHC2_CLK		0x118e
 			MX91_PAD_SD2_CMD__USDHC2_CMD		0x1382
 			MX91_PAD_SD2_DATA0__USDHC2_DATA0	0x1386
 			MX91_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
@@ -321,7 +321,7 @@ MX91_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
-			MX91_PAD_SD2_CLK__USDHC2_CLK		0x159e
+			MX91_PAD_SD2_CLK__USDHC2_CLK		0x119e
 			MX91_PAD_SD2_CMD__USDHC2_CMD		0x139e
 			MX91_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
 			MX91_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
@@ -333,7 +333,7 @@ MX91_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
-			MX91_PAD_SD2_CLK__USDHC2_CLK		0x158e
+			MX91_PAD_SD2_CLK__USDHC2_CLK		0x118e
 			MX91_PAD_SD2_CMD__USDHC2_CMD		0x138e
 			MX91_PAD_SD2_DATA0__USDHC2_DATA0	0x139e
 			MX91_PAD_SD2_DATA1__USDHC2_DATA1	0x139e
diff --git a/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
index 8038d92da2aa..d9397080fe48 100644
--- a/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
@@ -194,6 +194,7 @@ &usdhc1 {
 	bus-width = <8>;
 	non-removable;
 	no-1-8-v;
+	fsl,strobe-dll-delay-target = <1>;
 	status = "okay";
 };
 
@@ -252,7 +253,7 @@ MX91_PAD_ENET2_RD3__GPIO4_IO27		0x31e
 
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
-			MX91_PAD_SD1_CLK__USDHC1_CLK		0x179e
+			MX91_PAD_SD1_CLK__USDHC1_CLK		0x119e
 			MX91_PAD_SD1_CMD__USDHC1_CMD		0x1386
 			MX91_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
 			MX91_PAD_SD1_DATA1__USDHC1_DATA1	0x1386
@@ -262,13 +263,13 @@ MX91_PAD_SD1_DATA4__USDHC1_DATA4	0x1386
 			MX91_PAD_SD1_DATA5__USDHC1_DATA5	0x1386
 			MX91_PAD_SD1_DATA6__USDHC1_DATA6	0x1386
 			MX91_PAD_SD1_DATA7__USDHC1_DATA7	0x1386
-			MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x159e
 		>;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
 		fsl,pins = <
-			MX91_PAD_SD1_CLK__USDHC1_CLK		0x17be
+			MX91_PAD_SD1_CLK__USDHC1_CLK		0x11be
 			MX91_PAD_SD1_CMD__USDHC1_CMD		0x139e
 			MX91_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
 			MX91_PAD_SD1_DATA1__USDHC1_DATA1	0x139e
@@ -278,13 +279,13 @@ MX91_PAD_SD1_DATA4__USDHC1_DATA4	0x139e
 			MX91_PAD_SD1_DATA5__USDHC1_DATA5	0x139e
 			MX91_PAD_SD1_DATA6__USDHC1_DATA6	0x139e
 			MX91_PAD_SD1_DATA7__USDHC1_DATA7	0x139e
-			MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x159e
 		>;
 	};
 
 	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
 		fsl,pins = <
-			MX91_PAD_SD1_CLK__USDHC1_CLK		0x17be
+			MX91_PAD_SD1_CLK__USDHC1_CLK		0x11be
 			MX91_PAD_SD1_CMD__USDHC1_CMD		0x139e
 			MX91_PAD_SD1_DATA0__USDHC1_DATA0	0x139e
 			MX91_PAD_SD1_DATA1__USDHC1_DATA1	0x13be
@@ -294,7 +295,7 @@ MX91_PAD_SD1_DATA4__USDHC1_DATA4	0x13be
 			MX91_PAD_SD1_DATA5__USDHC1_DATA5	0x13be
 			MX91_PAD_SD1_DATA6__USDHC1_DATA6	0x13be
 			MX91_PAD_SD1_DATA7__USDHC1_DATA7	0x13be
-			MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
+			MX91_PAD_SD1_STROBE__USDHC1_STROBE	0x159e
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
index eac389ed30f3..a7bd490b042b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
@@ -339,8 +339,8 @@ MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc2_default: usdhc2grp {
 		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
-			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000178e
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x119e
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000138e
 			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x40001386
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x40001386
 			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x40001386
@@ -352,7 +352,7 @@ MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x119e
 			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
 			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000139e
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000139e
@@ -365,7 +365,7 @@ MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x119e
 			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
 			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000139e
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000139e
diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index a982606de1ee..291b409b159f 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -310,7 +310,7 @@ MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc2_default: usdhc2grp {
 		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x119e
 			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
 			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
@@ -323,7 +323,7 @@ MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x119e
 			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
 			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
@@ -336,7 +336,7 @@ MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x118e
 			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
 			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000139e
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000139e
diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index a624aed48efe..4276140afb5c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -196,6 +196,7 @@ &usdhc1 {
 	bus-width = <8>;
 	non-removable;
 	no-1-8-v;
+	fsl,strobe-dll-delay-target = <1>;
 	status = "okay";
 };
 
@@ -255,7 +256,7 @@ MX93_PAD_ENET2_RD3__GPIO4_IO27		0x31e
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
-			MX93_PAD_SD1_CLK__USDHC1_CLK		0x179e
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x119e
 			MX93_PAD_SD1_CMD__USDHC1_CMD		0x40001386
 			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
 			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x40001386
@@ -265,14 +266,14 @@ MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x40001386
 			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x40001386
 			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x40001386
 			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x40001386
-			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x159e
 		>;
 	};
 
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
 		fsl,pins = <
-			MX93_PAD_SD1_CLK__USDHC1_CLK		0x17be
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x11be
 			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
 			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
 			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000139e
@@ -282,14 +283,14 @@ MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000139e
 			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000139e
 			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000139e
 			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000139e
-			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x159e
 		>;
 	};
 
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
 		fsl,pins = <
-			MX93_PAD_SD1_CLK__USDHC1_CLK		0x17be
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x11be
 			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
 			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000139e
 			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x400013be
@@ -299,7 +300,7 @@ MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x400013be
 			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x400013be
 			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x400013be
 			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013be
-			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x159e
 		>;
 	};
 
-- 
2.34.1

