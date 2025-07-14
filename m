Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2177B25E80B
	for <imx@lists.linux.dev>; Mon, 14 Jul 2025 14:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752502844; cv=none; b=L5gDA6GorFZVDDbtwuEeg9qKXlubYKcnPXxEdg77bOLLaD9Oja8n9NKqovMNP4nRla6KXBGKbFUW5Je7FsVu06TO1dL96M+54kVu/5zuo+pVyRI0aD7P5ObTXtwEXvroT/bo8YZ6TMI2Bb6ySOpVvbnz4u936twiYvNOH8OftZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752502844; c=relaxed/simple;
	bh=ZMK2uV/A2ISn/Ls74ZwGfq0fd0lQyg0andir1a2Z+xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ap6yQ1mPeeSg0MnPVoN4oCSUAujZqjrjyFvSPksqXAm5TRNus71dpq31aQW7f03PMvlvutSExuamYR5GreTWKrzxAKleJ5Q34q2o3aTedBp5DJSGu5j03r4WeFOKR7TB/IVeq1V9XnrsyvsbGVsdt5+gwSkKeG3kP3w6M0883ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=Gp4xLa48; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="Gp4xLa48"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20F49C753D;
	Mon, 14 Jul 2025 16:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1752502840; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ipyKtg5UVZklGe5U9QDzBiMrFjh0uc+HFQy8UQbyy0w=;
	b=Gp4xLa48zlFgKHS4Dl5YrX2vX3WjMc/3rP9Tn9JXotjRSJnW3ssyYRFe2TYiODkzQ1O1iV
	hRQ6Jr5rbfp75qYcrO4x5pStcMIFkDr12JDXgx5t1nTTqsRSLoImp0yBqMOvahohTtqImp
	sLkLK4X+DkbDg8QHBUKfbB4lKXJKP1fH2WF2lE/8HLKH4oFzw9faPm5ZNNTpXntYFVCz5G
	Ob8z+3Irjl5NZVJ3IciR5ITBnA/Y3G8AP7G3Nm/l+3PjC4NbgmofeW/Hkd0mzlAw/Xo8jw
	dOl5bWdpKxUftWMNt7XFP+1iN/a13TLpjCExgiJFNijpWzSmzAsK7ZzkGPkibw==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 11/12] arm64: dts: imx93-kontron: Fix GPIO for panel regulator
Date: Mon, 14 Jul 2025 16:17:37 +0200
Message-ID: <20250714141852.116455-12-frieder@fris.de>
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

From: Annette Kobou <annette.kobou@kontron.de>

The regulator uses the wrong GPIO. Fix this.

Signed-off-by: Annette Kobou <annette.kobou@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Fixes: 2b52fd6035b7 ("arm64: dts: Add support for Kontron i.MX93 OSM-S SoM and BL carrier board")
---
 .../boot/dts/freescale/imx93-kontron-bl-osm-s.dts    | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
index 89e97c604bd3e..9a9e5d0daf3ba 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
@@ -33,7 +33,9 @@ pwm-beeper {
 
 	reg_vcc_panel: regulator-vcc-panel {
 		compatible = "regulator-fixed";
-		gpio = <&gpio4 3 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_vcc_panel>;
+		gpio = <&gpio2 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
@@ -161,3 +163,11 @@ &usdhc2 {
 	vmmc-supply = <&reg_vdd_3v3>;
 	status = "okay";
 };
+
+&iomuxc {
+	pinctrl_reg_vcc_panel: regvccpanelgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO21__GPIO2_IO21		0x31e /* PWM_2 */
+		>;
+	};
+};
-- 
2.50.1

