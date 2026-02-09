Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E8A2BEC55
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770652329; cv=pass; b=ldpqwSpwKVFAoEB/OUks5Eia7AjR7LXWSsijfq7m2o25AKCZArc2brdQ8PcKyYXTAtHlro4LZSmOOMIjYOVw6neSraTz8gzcJpPU7eCcwTZeRDnEbQfzbKeeDRHgwV/KX54vxvjvTaErU8A4OiRQIepX4W0DcrL8mIqodl5IR3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770652329; c=relaxed/simple;
	bh=oZGkYK2uUIm4Q4ycZwkTeXwq46eRXHuzyCKfsDPzIhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ks66dM2EKncOjAY77uHh4NlHDEJLR6gYsG+skRIlP33B0TdtqVVhNLMqk3hAKCigp/BGDDhoYEIt7aa1RvdZ47XNGK5S0p3yszJvrXJuqpjpl9OVn+Pj+mRjCG2YJzT/0fO6gLOEXMaiPw1Kcqxl8AcPTc9LaLDR8cMdk416e60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=DywOAvRS; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="DywOAvRS"
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=3g5o+E0WFL3obDzGGRCqcl1rSO7KKl3sh7z8nGhRozg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770652240;
 b=crI4+VhnRYE4h3TeoYF9gfXxDcm+BeDGdaXwoOqd28xmGMI4YXQKFedGisEIcOSjf6sxjiaK
 2BVvYPeHRfZzs6Tmr+8CUZpeoZSXAiWuUFO5buF9g0ka6uuhZsjCGvhWZbcdimvuv0g4ur1mylS
 wPuCLmU3StPH1yJlZELEAcqjHDb6tIcUTNA3WR2Wm5PUxLnchpKIxTqt021CtooB0RoG8LOq3cn
 0h5Te8xruZn231TAFDO7YTG+UyzMrnuuZg3UjOO7HDwdf/c83EX75JTmsjTKTrFLyHyVbAzHvTC
 ReUmEm+Vf2jhcnnD5p7jktyTKtIZISME1i50pL75HTq7Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770652240;
 b=eLUH/6WMWmYf3lAE46RFOmu7VByNXncWqD4iAiy2GwYQBmGPy/GrFxzuK0Y6GiB71dRX/9iW
 BW2t+n+i3lt6naG8cMoWnJloYeBQSAEIJB2apeLzNK9/673Lm5kt2v6feDjrBD6y7yREY73nSMf
 CSZayuxpIjRqfLmTVGSoT1HPcHnuVKeKbJLxmowjeObxZnLxNpcLgXoDasBXB9ClZKJPWYsSi/A
 Z3h9K+lh1uWYQf3k1dTRzsQAaNvf7mhGSOH7L2he92dbyeo5cQxfDdJNFDpAjaGCV/UJ3orgjUs
 2sNS9nibKUGxThHaaL4a+Nb/7/+JcxFqZK9xg5LWRcViA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Mon, 09 Feb 2026 16:50:39 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id ECFAFCC0D37;
	Mon,  9 Feb 2026 16:50:26 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: imx91-tqma9131: improve eMMC pad configuration
Date: Mon,  9 Feb 2026 16:50:13 +0100
Message-ID: <20260209155015.267008-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4f8q0M5Frgz2nJ5t
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:71fe5ffff8ee5df7b92405f7a7f4c441
X-cloud-security:scantime:1.844
DKIM-Signature: a=rsa-sha256;
 bh=3g5o+E0WFL3obDzGGRCqcl1rSO7KKl3sh7z8nGhRozg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770652239; v=1;
 b=DywOAvRSa5QDTWIxTngFp/UMOvUXEPbXqSMOZwy9Z+CguEhAw7Oa39wzP/ptT1LSt/EcmD9y
 zkBU76ph1TzkouLerF/+L7JpRuRCFeyQVGF83iy+w1vVmxxhE0oCAz1GrBffM+j9TpX7zJ3nCRg
 xf7y3LYIBPXsZamzketh2u7iX8ge0IQDZ6PH91xY9JhNJT7uetpgaAwfp2bG0JnDpZHi/lFiXBU
 MV3ehG6zU/BC/nChrEg/onr992Z4N8lErDAS8BznoJhS98RRaP+K3EQ12neUzj6YGfo5Im8FHmY
 Hy+Veccz5J47SjsKn1KKtXL2wWymUETMSdvnXmJMEGHrw==

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Use DSE x4 an PullUp for CMD an DAT, DSE x4 and PullDown for CLK.
This improves stability and detection at low temperatures under -25°C.

Fixes: e71db39f0c7c ("arm64: dts: freescale: add initial device tree for TQMa91xx/MBa91xxCA")
Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx91-tqma9131.dtsi    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi b/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
index 5792952b7a8e1..c99d7bc168483 100644
--- a/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
@@ -272,20 +272,20 @@ pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 	/* enable SION for data and cmd pad due to ERR052021 */
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = /* PD | FSEL 3 | DSE X5 */
-			   <MX91_PAD_SD1_CLK__USDHC1_CLK		0x5be>,
+			   <MX91_PAD_SD1_CLK__USDHC1_CLK		0x59e>,
 			   /* HYS | FSEL 0 | no drive */
 			   <MX91_PAD_SD1_STROBE__USDHC1_STROBE		0x1000>,
 			   /* HYS | FSEL 3 | X5 */
-			   <MX91_PAD_SD1_CMD__USDHC1_CMD		0x400011be>,
+			   <MX91_PAD_SD1_CMD__USDHC1_CMD		0x4000139e>,
 			   /* HYS | FSEL 3 | X4 */
-			   <MX91_PAD_SD1_DATA0__USDHC1_DATA0		0x4000119e>,
-			   <MX91_PAD_SD1_DATA1__USDHC1_DATA1		0x4000119e>,
-			   <MX91_PAD_SD1_DATA2__USDHC1_DATA2		0x4000119e>,
-			   <MX91_PAD_SD1_DATA3__USDHC1_DATA3		0x4000119e>,
-			   <MX91_PAD_SD1_DATA4__USDHC1_DATA4		0x4000119e>,
-			   <MX91_PAD_SD1_DATA5__USDHC1_DATA5		0x4000119e>,
-			   <MX91_PAD_SD1_DATA6__USDHC1_DATA6		0x4000119e>,
-			   <MX91_PAD_SD1_DATA7__USDHC1_DATA7		0x4000119e>;
+			   <MX91_PAD_SD1_DATA0__USDHC1_DATA0		0x4000139e>,
+			   <MX91_PAD_SD1_DATA1__USDHC1_DATA1		0x4000139e>,
+			   <MX91_PAD_SD1_DATA2__USDHC1_DATA2		0x4000139e>,
+			   <MX91_PAD_SD1_DATA3__USDHC1_DATA3		0x4000139e>,
+			   <MX91_PAD_SD1_DATA4__USDHC1_DATA4		0x4000139e>,
+			   <MX91_PAD_SD1_DATA5__USDHC1_DATA5		0x4000139e>,
+			   <MX91_PAD_SD1_DATA6__USDHC1_DATA6		0x4000139e>,
+			   <MX91_PAD_SD1_DATA7__USDHC1_DATA7		0x4000139e>;
 	};
 
 	pinctrl_wdog: wdoggrp {
-- 
2.43.0

