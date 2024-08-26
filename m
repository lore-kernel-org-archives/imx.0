Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EA519A288
	for <imx@lists.linux.dev>; Mon, 26 Aug 2024 21:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724709582; cv=none; b=uEjgkaBTnRlSHhUu3IR3VyA/Y84Jv3p2VH6h0t9z1QIb0/d/Fnaz3S19Fe6d0IL1roBOnlook/yygKZqPEHZOIYZpc7NDtDNa6pY8Ith48Uz4qEoJOobq9zEYVlRFX6G7RHaaoicS5us38Je8KXNVTSoz5iZhVFRHpMfZlrBTwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724709582; c=relaxed/simple;
	bh=c+vETQmbAaueA+hLH6yRpN8JE3WegH/Cn98FsewdFOg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y9nwFzGv2bEmtvwqrW2kURrZYOnHRlZ5OYlbLpjpF/Hgq0Atdj54ybMjHnb0OA7NBGgOq2/o15ZA9gp1/1WItYXOQS/6eOrlV/yCDrOqj4JfOeL/3Ajr8Zhu8TkCWsSqfSbpFlEZeBt5Ly9CcmYXl6FTZ72tR/sD8cmuob8YWmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=YwPkNiDk; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="YwPkNiDk"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 172FD25065;
	Mon, 26 Aug 2024 23:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1724709578;
	bh=Y6SBDzFquVWsPY1lMx9z0fEMhXiSLxw9RPsKlk+gYHE=; h=From:To:Subject;
	b=YwPkNiDkLzHstFIFTpd0vni25qwybAiM5Lbw4+T9m43gwiOysERiaugEEBJIF5u3W
	 8tXPHNR2EL7UNgjO+hKwB9Vin+Pf0fYVfKhfzVJZafKfmJYYV5WV8s03Teha7+l1KW
	 hvuDCCgrk8PLu1BAO3Eaf8jH0XqVJgN9FV0S2kZ2r6hf/qNRlm1t9ri2B/pyOPBRur
	 MMGl8CNy35C0Ll9jKPZTGsanYDghdAYTnTlUhk8L17GkQsF1HliB+ozVI91pV0RM9x
	 Mn10f5l2xjI3raEyXLhs+A+p4lkHSKzITThhF7uXDRIBoqqjnmZXyJFdWo59cmRRTX
	 ghad59uaDSqgg==
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
Subject: [PATCH v1 03/10] arm64: dts: colibri-imx8x: Add fxl6408 gpio expander
Date: Mon, 26 Aug 2024 23:59:15 +0200
Message-Id: <20240826215922.13225-4-francesco@dolcini.it>
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

Add fxl6408 gpio expander, this is required for Wi-Fi, Bluetooth and USB
functionalities.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index c7f0dfe7b162..aa9c45c290b9 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -108,6 +108,21 @@ touchscreen@2c {
 		adi,conversion-interval = /bits/ 8 <255>;
 		status = "disabled";
 	};
+
+	gpio_expander_43: gpio@43 {
+		compatible = "fcs,fxl6408";
+		reg = <0x43>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "Wi-Fi_W_DISABLE",
+				  "Wi-Fi_WKUP_WLAN",
+				  "PWR_EN_+V3.3_WiFi_N",
+				  "PCIe_REF_CLK_EN",
+				  "USB_RESET_N",
+				  "USB_BYPASS_N",
+				  "Wi-Fi_PDn",
+				  "Wi-Fi_WKUP_BT";
+	};
 };
 
 /* TODO i2c lvds0 accessible on FFC (X2) */
-- 
2.39.2

