Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A65222CBED
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 11:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738753420; cv=none; b=Xv86OoW/A03KLY+y97AB20qKUVvAlIryeS1UA01H/rKYabmL2Lz4RZx6c6/ARiAMrQ0tw2ZICFc9h7mv1ARXwQwXE2Wlk2ZHEsHCL0FFb4qLusJQrUobqwAAZ/0wnDRhm88AWz+BqzDSV5aBXEXRI/7dSLSUdb1mRMPxoXZqTlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738753420; c=relaxed/simple;
	bh=Gb8T/2ma94I3zk+0P0WpSFqJJHsKr/c2dnhyu/mr/7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uehr9hlJorJYg40jFQgVK8RoSj0zwgr9wIghoOA81nDAwc8hokgr7pL1eK+n72ZC5L4u4uCav1NuUMMa5R8XkHX+VKFPt/HcSPKgG/gC4YrF++q8BPh+CMfJvRiPJshrydE0kMTryIF931qUZj+ETaXO3M6m0TsGvJJU+4kY1JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4Yny5Z45fKz4x5lG
	for <imx@lists.linux.dev>; Wed, 05 Feb 2025 12:03:30 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:c448:5c9f:5d50:ad45])
	by laurent.telenet-ops.be with cmsmtp
	id 9n3M2E0045P95W301n3MM5; Wed, 05 Feb 2025 12:03:22 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfdBU-0000000Fss8-3JJ8;
	Wed, 05 Feb 2025 12:03:20 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfdBg-00000006O1x-3TeW;
	Wed, 05 Feb 2025 12:03:20 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] arm64: dts: freescale: Switch to hp-det-gpios
Date: Wed,  5 Feb 2025 12:03:19 +0100
Message-ID: <accb30064064bb5987520b8c7e74a941b08140e6.1738753123.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated "hp-det-gpio" property by "hp-det-gpios" in
Freescale Generic ASoC Sound Card device nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Dependency commit cfd1054c65eefec3 ("ASoC: fsl-asoc-card: Add missing
    handling of {hp,mic}-dt-gpios") is in v6.13.
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts     | 2 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 50fd3370f7dce9b3..fe186b4bcb48ccbf 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -249,7 +249,7 @@ sound-wm8960 {
 		model = "wm8960-audio";
 		audio-cpu = <&sai1>;
 		audio-codec = <&wm8960>;
-		hp-det-gpio = <&lsio_gpio0 31 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&lsio_gpio0 31 GPIO_ACTIVE_HIGH>;
 		audio-routing =	"Headphone Jack", "HP_L",
 				"Headphone Jack", "HP_R",
 				"Ext Spk", "SPK_LP",
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index be79c793213a53f6..190a19b0a2f5a445 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -213,7 +213,7 @@ sound-wm8960 {
 		model = "wm8960-audio";
 		audio-cpu = <&sai1>;
 		audio-codec = <&wm8960>;
-		hp-det-gpio = <&lsio_gpio1 0 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&lsio_gpio1 0 GPIO_ACTIVE_HIGH>;
 		audio-routing = "Headphone Jack", "HP_L",
 				"Headphone Jack", "HP_R",
 				"Ext Spk", "SPK_LP",
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 8bc066c3760cb13b..4ba86a6e7e28907b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -183,7 +183,7 @@ sound-wm8962 {
 		model = "wm8962-audio";
 		audio-cpu = <&sai3>;
 		audio-codec = <&wm8962>;
-		hp-det-gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
 		audio-routing = "Headphone Jack", "HPOUTL",
 				"Headphone Jack", "HPOUTR",
 				"Ext Spk", "SPKOUTL",
-- 
2.43.0

