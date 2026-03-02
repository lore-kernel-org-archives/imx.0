Received: from mx-relay10-hz2.antispameurope.com (mx-relay10-hz2.antispameurope.com [83.246.65.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A7C33D6C1
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 08:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441220; cv=pass; b=OUIcdeCLQ9IeLKT8smfWv/UB4AJjOD/8kj4MRyYfiuwH0OXd/iNkWEWooX8pdn9h2xAMgOXfV5ZSqwDDLOeIX8oCKpOm7P9ZKOs0mEB2RkVbEZLaTj5CHuo0sXFrhCGQwDyrMi4D21lkHzJFIvtt2dCr9qDZ2SqCWIE7ZSGLdUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441220; c=relaxed/simple;
	bh=EmGrPF8y5VAi4F7tIRJSQyYpuHB8WLaG9sr0XTHtNVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kYMuKVBtpoeJNp8h6te9Ba0IRVi+DZbZ/uvNuZ+kioPFQoRTwH7kK7cXx8tBvTDkQpaWVscLVG5wXgfQ1fs8NliqKuywWtR3d4nXBBGQdpZ2rmjRzhIukVnkdiUEnX2k6F+/NVbPiPKSU/lOjEa/WU8hsfHAA4vDPbo6uPJHMzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=WTMHElLU; arc=pass smtp.client-ip=83.246.65.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="WTMHElLU"
ARC-Authentication-Results: i=1; mx-gate10-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=S8KixDfsRAE0QkCkrj6ecFMAb3wezNZ0IVq81F5Gw8I=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772441190;
 b=ndDX9NtLXopMCF5ldV2SLsGZ+WAHC2+r5cSceUk7IAbIf3yQO658YW17VNkPU+X4KEx+U/tZ
 k507422RixF8ZW9KRz6EpiSl2qX/Mdgj/xGuEN//llhMn+e8WOMTPygM+LYsWndiHmgPLdosfjf
 fDyj2IsTFyQygPHIUKg3xFQ3ElC7T/39GMawasrp2qvs4lQdt48doIwOz3ux30IBl53gNaQqYPz
 jfSa0StY1iyvn5Jl1pTgmL1BJsPVvaUcSGrr+AMJTZeaIT+Mmuog0Sp40sj/GwrumnonU3pnAzF
 AvxJx73tiqwDt6B9DvKAK3Yw7KX/13wgbnpBki430oKZw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772441190;
 b=TIxLpHuBrz2l7RKcSSZvasqBVDcoKTFMyLtu3B50C8aB57DhCKwOwbw30jSMar5UsaVtEImN
 n9c2dVupzZv4xnv+oyN2pnXIInWm8OReeeUFrN2ba2lBJ2A0uk/XoMXzstWFRwjck7MoNOjzd5b
 8q4iuWcmxUz5DM+MZ9sc2A2nu63VxQTxWIcalwG5iFnRbDwIBjr9zJyBsHGHV9s5n0PU87voMEN
 7NIlJsm0eQqnbCGlheMb5LxF9SvWO9ahHKwXGepz55xZpXRt/FVHDNGbpYEHPDRLUZma9vXtuNc
 X+olNQc6nt59rOYNO4lbtUYUR3kUa5CVgu/blCbAB0C5A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay10-hz2.antispameurope.com;
 Mon, 02 Mar 2026 09:46:29 +0100
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: nora.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 4311E220F0C;
	Mon,  2 Mar 2026 09:46:09 +0100 (CET)
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2] arm64: dts: freescale: imx8mp-tqma8mpql-mba8mp-ras314: fix UART1 RTS/CTS muxing
Date: Mon,  2 Mar 2026 09:45:48 +0100
Message-ID: <20260302084548.6471-1-nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:nora.schiffer@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: nora.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay10-hz2.antispameurope.com with 4fPXb60bzBz4FL03
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:9d7a5410827e20c72befa8843b80a097
X-cloud-security:scantime:3.725
DKIM-Signature: a=rsa-sha256;
 bh=S8KixDfsRAE0QkCkrj6ecFMAb3wezNZ0IVq81F5Gw8I=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772441188; v=1;
 b=WTMHElLU2TpdJz4/NRKP3GOmpC+4nBdXAT7g6mg0W6wD0gt0musGZL9feJCT9HKR7ulpSE09
 y8asvtNGhaMIoKQWlzSh6cEbruUd5MQWwmxoHS1PeMjY845v9L3MJHsHjISS2nwqEjsT7mH2ct0
 w+As3mK1omAr/lWI+JaOzJ6+xUso5VnyWZ8K1xMci/XKtqpx1+3N3AxlVqBiF7W+oxG6Pn6BDYA
 /3sfzU8NlPXC7Z5AhAwp4WLJaRMVLT7oRz81KkQTjpM+p0XpU5LKIOEEpfNu/Q2ZczOEQ2WmYs6
 kpxkSMHq5HLLCQsbweFvDNNqUr9Mb+jDgFVagZ6yoiIKg==

UART1 operates in DCE mode, but the RTS/CTS pins were incorrectly
configured using the DTE pinmux setting.

Correct the pinmux to match DCE mode. Switching the RTS and CTS signals
is fine for this board, as UART1 is routed to a pin header. Existing
functionality is unaffected, as RTS/CTS could never have worked with
the incorrect pinmux.

Fixes: ddabb3ce3f90 ("arm64: dts: freescale: add TQMa8MPQL on MBa8MP-RAS314")
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---

v2: updated commit message based on suggestion by Frank Li


 .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index b7f69c92b7748..1665a5030b993 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -848,8 +848,8 @@ pinctrl_tlv320aic3x04: tlv320aic3x04grp {
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <MX8MP_IOMUXC_SAI2_RXFS__UART1_DCE_TX	0x14>,
 			   <MX8MP_IOMUXC_SAI2_RXC__UART1_DCE_RX		0x14>,
-			   <MX8MP_IOMUXC_SAI2_RXD0__UART1_DTE_CTS	0x14>,
-			   <MX8MP_IOMUXC_SAI2_TXFS__UART1_DTE_RTS	0x14>;
+			   <MX8MP_IOMUXC_SAI2_RXD0__UART1_DCE_RTS	0x14>,
+			   <MX8MP_IOMUXC_SAI2_TXFS__UART1_DCE_CTS	0x14>;
 	};
 
 	pinctrl_uart1_gpio: uart1gpiogrp {
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

