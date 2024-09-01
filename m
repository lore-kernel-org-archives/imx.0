Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D82181D00
	for <imx@lists.linux.dev>; Sun,  1 Sep 2024 15:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725206269; cv=none; b=LwIm+jSigwOH4B84dzAhoZf8veEN7Rs8YyM69LP78JwSvZE5bOmrrs58efgoZ0qciWggVJS88iUF0YsL4dz5K7AxayfSiU+OBJa0uXFk5m15tRePjpaIRLdv5JCz8I+5AoAmdERLqUjRBOT06ipTo3vLwHF463VXGmd/g7tcbe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725206269; c=relaxed/simple;
	bh=Z7vndyJxunyyj5VF2nUkyzoEx0s8ZyV6I8RnGaowdZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SFnE30yUBMeFfVlaIZkvgDbdUmphwNS2TNiw5uPhJE3p2VD4BBcsB/S/k6PC9lG/6Ybhg/DDbCjoXU/T8l7UaN+GS9BOJI6XAlZIZh8mA8tsYq7t9gM3AuAXbjmZ1/BZg9l13MQcg3xxHwHeZ4Fgw6rXGjk9F48A9pcb0hgUqxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=onXNPUZ5; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="onXNPUZ5"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 466F01FA1D;
	Sun,  1 Sep 2024 17:57:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1725206257;
	bh=bbgIXRbk6h0Jgo5jOxc1Jg4WIH37efdJl8/8+iAAz7k=; h=From:To:Subject;
	b=onXNPUZ5hAIqarXic4LWsumUxdcpfCKWZ7Ae4Z+pBQhXbqH54h8VLki5aT/OPJ/+M
	 +nwspx1Eux1TQ3M+H6UmPJXtfYIWv2qf7X+zJ2iZ1qvrzeOs3kVCpnz+f7k+thD6TS
	 IGRA0KzUic++UkQ+zL0ENu8rrRa0Hq/fKWYb8I3R5FHG4GbqFAXpnc8RcwrnbZ/JD5
	 KdyQrsrNX6sC+EJjFq3SH348jn/HUZIPk0doBcbTOukUJRDlYYgfkgry5+NPc7dZfe
	 Wo2VP6/WTuQdrE2RJDxE1w1xMwORN8Am15an2gCm6m0RkfcQx6xGuZf1uLgimL8CO9
	 xbd/Ze11wD1BA==
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
Subject: [PATCH v2 03/10] arm64: dts: colibri-imx8x: Add fxl6408 gpio expander
Date: Sun,  1 Sep 2024 17:57:14 +0200
Message-Id: <20240901155721.7912-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240901155721.7912-1-francesco@dolcini.it>
References: <20240901155721.7912-1-francesco@dolcini.it>
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
v2: no changes
---
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index d88f2dd20afa..210db574b425 100644
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

