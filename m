Received: from mx-relay90-hz2.antispameurope.com (mx-relay90-hz2.antispameurope.com [94.100.136.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2F2314B96
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 08:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.190
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772008539; cv=pass; b=czjWSUk3vswsAxVkZHQ+5LjYQak+u+72kbqty3+EGGNGAhdxQrbCdSHlz8bkJ4NniPlWpr+9kTvF/S126K+auK3h4gCtpl3E3Gb50d1E7LIweE+Yo1IR+g/ETFIZpp8eJVDVmg0/swOIF6PyRM4QI8EfsThp+jiR8LCGWh6fET4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772008539; c=relaxed/simple;
	bh=1gkTqDJCr7YvexlyH8uqEU34iwOjv/arQZOv6mbwl/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RgBs2kLqBAZwP59eKgAVziPmlERoD39urWDzosRsn92O0pN5MOWUEpce0pfzWfI0CS85m7kSFqNIDhe1ximxb9XSBeTO4dWj9zSJHDJz2ib7LeK2LTB0O0HZNvpXFZkCi3p7Npm5elB3f24UcH2VJ25lLqp2R1f0GV4QzkcuW8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=JW/aUkyL; arc=pass smtp.client-ip=94.100.136.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="JW/aUkyL"
ARC-Authentication-Results: i=1; mx-gate90-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ANOrIzf22DYFST/OGsWrBLVKkhNoHDH6p+6DszzjdIE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772008515;
 b=gPRnHzuXM5n4lDGybV1uXmxM78+lxWVr2SnX9Vp9SUZADzW4eK1VRFlnSysa1nQWyEH3qWev
 QcC3JDpjjzF8Wvzo6qe/n8NpD5mLu2wPbNldzsczt64sPcxMCYpZpDz3nqFjof+soWBgMnbyFdu
 SzdtpzrHt/I4ssMpr7klWlDhDv+mE9FCLclw6LG4+5nbuYvsP9J+qzsda2Lr0WOdwHim9iBid1F
 nSYezsx+jHi3dgQ1Mw4nJ5+qNL4GF11gyxBiKvpdtj6LUosOTUtzjx0dcoBKwovdGMqhSWph0jM
 1aOpV3rFRxNa2D+8pA2hC9HvzuZNdT16OspZNNbrfZueg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772008515;
 b=W4E/ez1S79wPbc89sR5vDZ4q1aRL41u+rgyYO1FFUvxxmjytxnkaVOIE2eklk3UIvWJkccv2
 je1TotkkOtDU1SEZKwNa3qsRcQFuUK3U78wRJcqHz1ToEt1nXzxa8qzIAMtpwjhIar+9pnYTTGb
 8POjAfGJ2GUYWr3ZfVBX9GXRZjjmurfzyJdoWEhm4ssqfoX2cQJH0HHtdpiw6RXo9n1X/RQzAIq
 vM5OjxxR8XfmbTfChnP5wYePyj1VkBjvdWwwBNiYWem5IC7kBY1mPTm6RrLjDMrNZXvRBpugHVS
 85RIZ59byLeeDfq54Pyhq86enm9psXtjbp+yjVtYU45VA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay90-hz2.antispameurope.com;
 Wed, 25 Feb 2026 09:35:15 +0100
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: nora.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 59917CC0D25;
	Wed, 25 Feb 2026 09:35:04 +0100 (CET)
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
Subject: [PATCH] arm64: dts: freescale: imx8mp-tqma8mpql-mba8mp-ras314: fix UART1 RTS/CTS muxing
Date: Wed, 25 Feb 2026 09:34:18 +0100
Message-ID: <20260225083419.5639-1-nora.schiffer@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay90-hz2.antispameurope.com with 4fLSZd0gYQzWygV
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:1e9880415023cc401d11ce049b439fb1
X-cloud-security:scantime:1.897
DKIM-Signature: a=rsa-sha256;
 bh=ANOrIzf22DYFST/OGsWrBLVKkhNoHDH6p+6DszzjdIE=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772008515; v=1;
 b=JW/aUkyLMvYFGcLqbKF0tQi+V30ExYVCWiKtndhSZJjym/2BEkA9+V8+7lvU9gctn8MyPRVv
 O+q+pgj3MYveYhHEidUEYbxyqmRSnO5U7Tq2JNwHKxdBk+4vndggt8ogWJf4L8MP/X5DEWwf/1F
 CruGA3s5+kC9eWAFWBRswMl1krA2je84UzuODSDalw9Sz5agC/9fC48KaFLhvAi8mMTiAF/vYZb
 0ibITikqg/hqwL5WMsfIev8YzamjSrLzk1LCllkyod4we9X/lgzvbCc0UPHKaPj4NISgIC6/Ga3
 PzMxepdUyZzpcbwbWBy7JHfZZQ9bYOZeff4dcZpAmaZ2A==

The pinmuxing for UART1 was mixing DCE and DTE modes, which cannot work.
Consistently use DCE mode.

This switches the RTS and CTS pins, which is fine for this board, as
UART1 is routed to a pin header.

Fixes: ddabb3ce3f90 ("arm64: dts: freescale: add TQMa8MPQL on MBa8MP-RAS314")
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
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

