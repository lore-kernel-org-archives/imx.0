Received: from mail2.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E18533E376
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 10:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771583813; cv=none; b=eaEOOU7jYS4YQP7bbUgnRH42WQfThg+treb4JfyYjLXgT/a2sxF9ARN5A2Mu+ybLaG23zBPMXWaQSddcC6azS2bqqWivPfygmFL6CgeeJfXEnGct3u4FDyfluwAMPVEG6Z0C68mgelfdR1PYPr1x02m2GJVG5hNYUyXAL/V/j8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771583813; c=relaxed/simple;
	bh=o/Kn47OIJzbhhBAN37bkYpI8xAnDYFpd3oEYxc5XEds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V7AiEuQw0ECYzaD3ew8zjqI291fkMGSNFpxWVovFvQt3c//z0vXXER4LKfWvw0LAHr9iGowVC7gS+uywB1PUcCI+nrI9CYkiBSP4LKZrJMDKrPB8ERvsKGI6t3D/pGyVsTvgJj5XVvMV6GJ2JxholxP8yMK50MG7edVMZNTYe30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=sAsj1GdN; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="sAsj1GdN"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1771583810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lVNtYA9QYyCyxJhprnVzLPW9iVvkaqf7WAZnQ/Wheq4=;
	b=sAsj1GdNA83T0bXSX7w/pf3Twi+bsk9hg1RhyEdAnGn9c1QhX5bTxY6Tl4wrFPOMQRbra5
	MHrQFY4BI2HV4aguAQESQ9jGPA/7z5h7/ElqzXAtQZ/UOzfU2ImPeTSAOX7viYuLYsO3OF
	pOFH/205YOoFN6xO+8jfOB6/oSNSjubfY9PJUlVJGD5z41lQEg4NKL1gJGd+ehOsgugX23
	hKc7ju6ZuXcvD85TXmxoNh/UbEs3dPsxVDry+zZXAK+wQoU9sk9kfT1d4mCbTEXz+5leYP
	DCPGAo1866nXojAJcmI6xLuaiaZzKTq4m+J6r9lWn0+CfaTulQD3eKMfqxR5xQ==
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 4/4] arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines in DL devicetree
Date: Fri, 20 Feb 2026 11:36:19 +0100
Message-ID: <20260220103636.9697-5-frieder@fris.de>
In-Reply-To: <20260220103636.9697-1-frieder@fris.de>
References: <20260220103636.9697-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frieder Schrempf <frieder.schrempf@kontron.de>

To make the code more readable, use the macros for the GPIO and IRQ
settings.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
index 7131e9a499ae1..41a2bb74f1565 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
@@ -7,6 +7,7 @@
 /plugin/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include "imx8mp-pinfunc.h"
 
 &{/} {
@@ -80,11 +81,11 @@ touchscreen@5d {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_touch>;
 		interrupt-parent = <&gpio1>;
-		interrupts = <6 8>;
-		irq-gpios = <&gpio1 6 0>;
+		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
 		AVDD28-supply = <&reg_vcc_panel>;
 		VDDIO-supply = <&reg_vcc_panel>;
-		reset-gpios = <&gpio1 7 0>;
+		reset-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 	};
 };
 
-- 
2.52.0

