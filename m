Received: from mail2.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD88D320A23
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 13:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421467; cv=none; b=t0ox363h0eYWCI2Hgx/lZXg9mLktZq2nlMuoI08ZTXB7CPcN8OvYgozI6XOrGSVo4GiUFkBP+6Rlj+rJachRwF+iF8cP48f0QKZsjHVmJWIkDDVQoA21WbL5gR0Gtu/io+zaLaWBTwQPNSUoMmXk8ihYW4M1drfR5JTgaJR8m2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421467; c=relaxed/simple;
	bh=3UlIxoARU7Rl12u86tYZ0jerFAiRm41TAJlT6SFSo+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnGFvZPZB+CV9FIwSS7PVLAnrkvNZ/hUSTSZNufxLGHXSdLqRJYbbwU16Ab/FZfJh8xvl2NAneZiM+LS7DMZuZknNT4WNBJ4aGPIV2Boc5v4UC3SDl1x8GFYKwJOTi+40+rMjpIiZdob6rfImrdHTza78cCGA+LuR0CCEfje9i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=NIYooHC9; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="NIYooHC9"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1771421128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mGeo8dYdvtlQJ0tSEweLlRpTjA9CiDK23fAEfe4GJ3I=;
	b=NIYooHC9JWGN5V42jrdND52uDeFM87SsrJYbw+1Up4KNbOXMh4fn4USAjofro0Of1pO1DX
	c8HkXG5rjMNWf1dVOBBE0TRjaxirYpW0v7YSYMx3QnGu4nF+JgZuMo1o2uDt8o9/nFE7sJ
	BDISRBuIQpgFg6W1YdN+j+7EA1zaR60EyPs6Bl6dEJ54UKkYNH4vQm/8Jf0qjR+jTbXRzt
	bc66/ZROYbtfCScYGpqqzPK/WN/GSxX4TD6yZ5wb9CaU8nDAH3vrQyRxDOTqVqsbI4XU2W
	TVQ+m/kDM9kEDqKf+gQhaS4ttKHhaC9mXhwWdkLzd9GWjtOjFnNaXX0R1UfQLw==
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
Subject: [PATCH 4/4] arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines in DL devicetree
Date: Wed, 18 Feb 2026 14:25:08 +0100
Message-ID: <20260218132519.74570-5-frieder@fris.de>
In-Reply-To: <20260218132519.74570-1-frieder@fris.de>
References: <20260218132519.74570-1-frieder@fris.de>
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

