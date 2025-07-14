Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28922258CE1
	for <imx@lists.linux.dev>; Mon, 14 Jul 2025 14:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752502825; cv=none; b=E8Hg9QAY4CqVWaOQqbuc4z2GH2SvfgWsKiNPShPa8xvitoiRrgIOYlmbwDu6I9zJUDOmGw7JfljpYzfST0u+PweNJxHYtYtWcMX0FH7RJUevMYDfOwEGAuFvXdPMAqB0pYoLzBNdWMZnSYxUibCY2Rb/7zmYZPxvet1F6TUESyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752502825; c=relaxed/simple;
	bh=F10Xwe5+E904VHUYV6ZPKyrzp9KZXN1uU222qowfndM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nKzS5WoLl+p4CeP6mhQmytYB1qAuN4DLdKUNAL8bmqAkGsU371u/dbBaDRa4jOp+47F6K9qEBsrOiBYCjHhrI9LlZuzUlyhfKralP73EVxxKJG5u4YyAcTsg1R+b63H46i8o1WvqDr5bTIxFX9wl+oFvjezbuqUm5opRjc0uEb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=pWVpG8bL; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="pWVpG8bL"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBBACC753B;
	Mon, 14 Jul 2025 16:20:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1752502821; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1/bZceTz7f5S3mR9djxZojIdPvF+101cbNdjGmMV7JI=;
	b=pWVpG8bLFH3q8xSpCwxCxkqtZbNS1oQeTZut+C281nf3TZZaK4IK+IiT2TNCreodUcrSPw
	aURvp+w91CxPUXyy1GSrh1HM6ZQBZ+yB1xTdoThHrWd7lycKzPZPfEFhvLbjRB1AGdbhL4
	EWGm31P114MH5GVdz6TWNj/2P3ikAP1/TLXnWK++38/eiPujOH5b3SXH6V6hxF99S6vI7s
	bsT6GHUs6x920gdIULhzsF3ykW3BCwIkvw7qxiT1G+lS0t6wQhTQ0KujatVkLDzRHx/DHf
	dFcfxXDk4vgkfDVU4SrWKqEY7MK4WKdhRBY7UcQMq0+2Z4fsQYDKjo1KTZt8ow==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 05/12] arm64: dts: imx8mm-kontron: Sort reg nodes alphabetically
Date: Mon, 14 Jul 2025 16:17:31 +0200
Message-ID: <20250714141852.116455-6-frieder@fris.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714141852.116455-1-frieder@fris.de>
References: <20250714141852.116455-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Sort the regulator nodes alphabetically.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../dts/freescale/imx8mm-kontron-osm-s.dtsi   | 46 +++++++++----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
index d455429652305..264553248d5cc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
@@ -30,29 +30,6 @@ chosen {
 		stdout-path = &uart3;
 	};
 
-	reg_vdd_carrier: regulator-vdd-carrier {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_reg_vdd_carrier>;
-		gpio = <&gpio3 16 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-name = "VDD_CARRIER";
-
-		regulator-state-standby {
-			regulator-on-in-suspend;
-		};
-
-		regulator-state-mem {
-			regulator-off-in-suspend;
-		};
-
-		regulator-state-disk {
-			regulator-off-in-suspend;
-		};
-	};
-
 	reg_usb1_vbus: regulator-usb1-vbus {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -96,6 +73,29 @@ reg_usdhc3_vcc: regulator-usdhc3-vcc {
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "VCC_SDIO_B";
 	};
+
+	reg_vdd_carrier: regulator-vdd-carrier {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_vdd_carrier>;
+		gpio = <&gpio3 16 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-name = "VDD_CARRIER";
+
+		regulator-state-standby {
+			regulator-on-in-suspend;
+		};
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+
+		regulator-state-disk {
+			regulator-off-in-suspend;
+		};
+	};
 };
 
 &A53_0 {
-- 
2.50.1

