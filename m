Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA751B0F1A
	for <imx@lists.linux.dev>; Tue, 15 Oct 2024 23:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729034724; cv=none; b=JNnT9bG4mbNVjtth/NwCCG573Mr+V/gJr1l6SWty4VjdH8YWQqF7vrcu+bA3urig+dFgFKqgy1bxSOjLWK9stV3rpYBoFtLsTPHWz7jWRLwgdNEFJ5jaw+pmqIjOwwNujGaKi0B6S54sqFk8iky4xwyroC8MNwbHi951c2gE67E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729034724; c=relaxed/simple;
	bh=MO/d8y22yd9+R8DCo/6DM4XMZfwj3ZpCLs5XzbAPYxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LQM0DXEgTD8kDIWH1OREEGQO4TyZCyeBLLsNrOYRade67kKrf4fG6CvhZ3M3cjeveo4xEBUR/UKjdJqUWLVr2QNn6O2fGOU7b7tL9iZ75PKK7uzPfgCJlEJMHpJrJrCLgBNa411iAD98+eEFIGLDe6JOoGdjJSEw4fB6vCn8nOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=sGGm/Emc; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="sGGm/Emc"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4D98688995;
	Wed, 16 Oct 2024 01:25:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729034721;
	bh=0Bz4RfHxv606uIgq/gZ+gAZ121e33kO0fly1mdHub/Q=;
	h=From:To:Cc:Subject:Date:From;
	b=sGGm/Emc5YzA4oV8BSOBF1lQ9CCFTFtxNiXgaIlL9Ef/OZcalsz8Wk9sMO/WdNmA8
	 UNRmB58j55ebyvUTQ8KupzHmF6WyQv/H+Muoo+1vWCZRFJLtjznUTgBVLPFC19OpSW
	 r+rukM/R+mQj2cs0xUToXbgtR/V3CAtJWYipAc4ETcxXeQbd0DZTQgBwUiKNa/79uw
	 Nlx0lj6VSGdNOULi/XyLPA9B6f+Xk0Q1XJB+cx4PaWNuuvZoGwjC3Oye6I7thLQDtC
	 DMzJjiGwBY31QnGOI9B25b7hCYzuk8igPlZyJHEV0ZMshdxnzEc7eXkcTbCsy/5THj
	 mxcf9Z6fWeqxw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: imx6qdl-dhcom-pdk2: Fill in missing panel power-supply
Date: Wed, 16 Oct 2024 01:24:51 +0200
Message-ID: <20241015232509.101206-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Add missing panel power-supply property to DT to fix the following warning.
The power supply on this device is very simple chain of regulators from the
main 24V input, describe those.

"
arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dtb: panel: 'power-supply' is a required property
"

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 .../boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi
index 773fdcfcd0015..d7c2b30aecfd1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi
@@ -143,6 +143,7 @@ led-8 {
 	panel {
 		backlight = <&display_bl>;
 		compatible = "edt,etm0700g0edh6";
+		power-supply = <&reg_panel_3v3>;
 
 		port {
 			lcd_panel_in: endpoint {
@@ -151,6 +152,25 @@ lcd_panel_in: endpoint {
 		};
 	};
 
+	/* Filtered supply voltage */
+	reg_pdk2_24v: regulator-pdk2-24v {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-max-microvolt = <24000000>;
+		regulator-min-microvolt = <24000000>;
+		regulator-name = "24V_PDK2";
+	};
+
+	/* 560-200 U1 */
+	reg_panel_3v3: regulator-panel-3v3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "3V3_PANEL";
+		vin-supply = <&reg_pdk2_24v>;
+	};
+
 	sound {
 		audio-codec = <&sgtl5000>;
 		audio-routing =
-- 
2.45.2

