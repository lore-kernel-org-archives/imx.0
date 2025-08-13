Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57012820B1;
	Wed, 13 Aug 2025 15:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755099900; cv=none; b=Y4E3q2dRvOEu87PpUtR87n1PAfj09yvgU1vo5oY79m3PvSAJIMjPh02ZDqygk+sClQV7ebDQy2A/cb1r/qKMkN5J+HuB3frJ/V9tlb5pAhVYQ57Noz5t1y2CZ/ID6Xp95d75070rJBq6saE4qr07gp2HlO4HS20iZRMEk/OFRCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755099900; c=relaxed/simple;
	bh=SDfSLwrtZXQ9HPSfpfvWAs0cQbK5OrAW80eATwWhUk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IbEggOlj7CcbxSYSapY9IMoN5wiMw8MBS9ddtmJvwvayn//s/PUpQdKfDaPbcLawrYhvbMZMfXBa9EPlXuhKgmnFA5KHbfo31zHIyqHMZNmlFz3qar6DIAjKBBNlu5sUgza41/e3c2Qf6Hx1OLSggyK4s4Rl5+grWVLKcwZeOpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2377C4CEF1;
	Wed, 13 Aug 2025 15:44:58 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 resend] arm64: dts: freescale: Switch to hp-det-gpios
Date: Wed, 13 Aug 2025 17:44:46 +0200
Message-ID: <65670a9983c47919317e02557f072dbe0426f48a.1755099817.git.geert+renesas@glider.be>
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
index 95523c5381357b66..d0b3e66e09739261 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -406,7 +406,7 @@ sound-wm8960 {
 		model = "wm8960-audio";
 		audio-cpu = <&sai1>;
 		audio-codec = <&wm8960>;
-		hp-det-gpio = <&lsio_gpio0 31 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&lsio_gpio0 31 GPIO_ACTIVE_HIGH>;
 		audio-routing =	"Headphone Jack", "HP_L",
 				"Headphone Jack", "HP_R",
 				"Ext Spk", "SPK_LP",
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index e54be7f649ffb0e4..7b033744554105de 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -333,7 +333,7 @@ sound-wm8960 {
 		model = "wm8960-audio";
 		audio-cpu = <&sai1>;
 		audio-codec = <&wm8960>;
-		hp-det-gpio = <&lsio_gpio1 0 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&lsio_gpio1 0 GPIO_ACTIVE_HIGH>;
 		audio-routing = "Headphone Jack", "HP_L",
 				"Headphone Jack", "HP_R",
 				"Ext Spk", "SPK_LP",
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 2f949a0d48d2d806..213eb5476b84bab5 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -216,7 +216,7 @@ sound-wm8962 {
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

