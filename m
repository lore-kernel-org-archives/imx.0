Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2452819D892
	for <imx@lists.linux.dev>; Mon, 26 Aug 2024 21:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724709585; cv=none; b=l5l7sykXEENvBRjQYcZAn8G7+F6xkvDqhZuH17pzypVexqhbK2CoBzPrvJPhoXkyR7DXFV498AMrJQOi3dnkQ57Hsw9wHS73LAOwv/i9ihBLO3jIUojG20sp2Md4PEmFCBdp8tGgj85P6XI3DikYDkJ8wO3bAFoNuiFLc5KbRzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724709585; c=relaxed/simple;
	bh=39s33KG42bHDS00sl62f8QHw2b9DZOENVl9cXu8KzjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QGK3oOFPCr+DC1cebZwzOCVBGNTWlu0uDbtkrqcLmC376/XHwQbocox2rOQXR4cY9wSS4V3cJEi/rlQGDMWdaoPjtQC32Kz9Apa/vHV2c/7ceDY73SdH1hHiY4JiTyy/SMV6WyugqXPD66rT99+0c8Gkl2acx5VygT40Ms2NRz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=CRNSzAEn; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="CRNSzAEn"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 44B022506B;
	Mon, 26 Aug 2024 23:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1724709579;
	bh=KaIgGdKJgM6VdCbreGRynqu6r3UROl0K8YfZBEpupGE=; h=From:To:Subject;
	b=CRNSzAEnw7nH3o5kk3X7wCvha5oZzSe1UzUnKkJbpdw1CgSTBrYL/KaYRTOemyw5f
	 O9EVUFRQ982Z0KCxTmopMv8oS0Nt2M8dtanabsgI7FVHjHGEdlvbLwAPQITciL/ERG
	 uWzleTg8pE2cFqSkuXAwrcs0NX8KIrgU58Tnd67pfy+acQp/TRimB/fZ9sp9wyEw8n
	 DPZj4A/YYL6oJRJ855hQEDyAAnTUrJHl6OsSlB8RX3hNQEiQ1G3YHkRgro4zczTISk
	 ICQA/6aM/GskV+hMwSZF32OGkUffdQG8iBmrKV9d8A8bWvYcTsW0VHsJW50TxuFsB4
	 Pf+6UgbzcSzUA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 05/10] arm64: dts: colibri-imx8x: Add PMIC thermal zone
Date: Mon, 26 Aug 2024 23:59:17 +0200
Message-Id: <20240826215922.13225-6-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240826215922.13225-1-francesco@dolcini.it>
References: <20240826215922.13225-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add PMIC thermal zones.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../boot/dts/freescale/imx8dx-colibri.dtsi    | 11 ++++++
 .../boot/dts/freescale/imx8x-colibri.dtsi     | 34 +++++++++++++++++--
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8dx-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8dx-colibri.dtsi
index 66b0fcc6687d..4d1ad052c5b6 100644
--- a/arch/arm64/boot/dts/freescale/imx8dx-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dx-colibri.dtsi
@@ -9,3 +9,14 @@
 / {
 	model = "Toradex Colibri iMX8DX Module";
 };
+
+&thermal_zones {
+	pmic-thermal {
+		cooling-maps {
+			map0 {
+				cooling-device = <&A35_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A35_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index 1d22002103c4..f6afce016ff2 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -88,8 +88,6 @@ &adc0 {
 	vref-supply = <&reg_module_vref_1v8>;
 };
 
-/* TODO Cooling maps for DX */
-
 &cpu_alert0 {
 	hysteresis = <2000>;
 	temperature = <90000>;
@@ -420,6 +418,38 @@ &sai0 {
 	status = "okay";
 };
 
+&thermal_zones {
+	pmic-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <2000>;
+		thermal-sensors = <&tsens IMX_SC_R_PMIC_0>;
+
+		trips {
+			pmic_alert0: trip0 {
+				temperature = <110000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
+			pmic_crit0: trip1 {
+				temperature = <125000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+
+		cooling-maps {
+			pmic_cooling_map0: map0 {
+				trip = <&pmic_alert0>;
+				cooling-device = <&A35_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A35_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A35_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A35_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
+
 &usbotg1 {
 	adp-disable;
 	disable-over-current;
-- 
2.39.2

