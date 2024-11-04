Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3464922075
	for <imx@lists.linux.dev>; Mon,  4 Nov 2024 15:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730733346; cv=none; b=bL/WaoTBnLzlbRvbb7hhHcpsQoqIDDfeS2r4LH0cP+LbIqLZDI0WiBq86fD6t498Hz3vqua6Ns8Q/O7XPemc5fu6CDn/X+MeyPuL5TERWcDeMZktmROVAdFeP0IexWtZdvw5kMBLaPmTrGXh19WbVBCQLdKy3E+w7S63kxFscdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730733346; c=relaxed/simple;
	bh=yC5x0Kr3GQ+y52MwCBTCIIJOZYvx1zk4EFtR7xU0I1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D41nu//WbFlr2C/JaCw/O+4/XXwQtmFKhsSMTtoYDrteJVR1dybsiyYFAkcBrX2SdoSnzFrdxy5y9RzDQccIedSuXvSywI1xf+B2s3ozM2HmDr0lpivbAwzU5qt4NS9jDwjC8tX5DQ66H+r+xdDE3/x0DR+tQ3AC8OftHzPwzKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=USz6yJbY; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="USz6yJbY"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so6653703e87.2
        for <imx@lists.linux.dev>; Mon, 04 Nov 2024 07:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730733343; x=1731338143; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JCLk/wc3MKwAF912ySsq2eZpu6hxxtGQsnffSicJSqo=;
        b=USz6yJbYq73H1w59z9yn+mF3td9cTjVbqibg1LneOyPU7qE/qmyImfzX1IGSR7n7sD
         owOtYIbK/LBO93SsIFbgJ9AA94tEIT8su4ZpZ/G3nJuqDkYccKK9HjGBLfwNS54Q7wF0
         uAoVCHT1M0+gdOFjo1UPBK67vwpGygdHw+/hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730733343; x=1731338143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCLk/wc3MKwAF912ySsq2eZpu6hxxtGQsnffSicJSqo=;
        b=qye93PTCdEFAEBHnsy5tWWqgsNF6jRUFBtHMwQqwldkpskvN5EJ20F8eWa4uNu2xG2
         sNzGvymEjBhbzYGdzXNeMKiD4YJainxfmC2oHih+N2KNnl8O+gKgKJP9gkDnk3RFDwm5
         hW8yzv2EsAuWzKOtfCx5O3L4CWQmrR/cufqJCUvNypzT/C9iuymVGUg/uK4MF1HSgbwB
         8xH9KZUgMaqDbqZwJHJcibJ8actSOlvw5+/fnYa5wWWRHxTuvEQ+JVj1urXpsyst/wMm
         jpVU26wLDcL9JqE5daDCatq3lTfDTK4xGHC+8958B/X+9z6jjXGUujgTf0TR5CetnhDc
         q1Wg==
X-Forwarded-Encrypted: i=1; AJvYcCX0W99/kJth1ftTUBOynK915GMMwzbnJ0svaxqnrt9H4A5r382tyEM4nfXDliK3vVFg5ZI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZZSHRZ12usBIae7N8ILpCnNnQdipqJRRuKVmrxSYSNBs0Muqc
	FfO1cA133wUIN1KvPnsEl6/e9VgD7MOocJrFE4nmijxldbgF/nSA/PDKk1p+9VU=
X-Google-Smtp-Source: AGHT+IHZ+MhzY+cG10/XeJWXQh7+JhLBbhGrXh2ptOIna5FlTvipU/iFvh7dLTIkTlqmlf8NGjimig==
X-Received: by 2002:a05:6512:1087:b0:539:936c:9845 with SMTP id 2adb3069b0e04-53d65e0b4afmr9070518e87.37.1730733343135;
        Mon, 04 Nov 2024 07:15:43 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.195])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c4fafsm561885666b.47.2024.11.04.07.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:15:42 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] arm64: dts: imx8mn-bsh-smm-s2/pro: add simple-framebuffer
Date: Mon,  4 Nov 2024 16:15:20 +0100
Message-ID: <20241104151539.1678388-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a simple-framebuffer node for U-Boot to further fill and activate.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Fix the warnings:
  (ranges_format): /chosen:ranges: empty "ranges" property but its #address-cells (1) differs from / (2)
  (ranges_format): /chosen:ranges: empty "ranges" property but its #size-cells (1) differs from / (2)
  by setting both #address-cells and #size-cells to 2.

 .../freescale/imx8mn-bsh-smm-s2-display.dtsi  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
index 7675583a6b67..98dec3c42060 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
@@ -4,6 +4,34 @@
  */
 
 / {
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer-panel0 {
+			compatible = "simple-framebuffer";
+			clocks = <&clk IMX8MN_CLK_DISP_PIXEL_ROOT>, /* lcdif */
+				 <&clk IMX8MN_CLK_DISP_APB_ROOT>,
+				 <&clk IMX8MN_CLK_DISP_AXI_ROOT>,
+				 <&clk IMX8MN_VIDEO_PLL1>,
+				 <&clk IMX8MN_CLK_DISP_AXI_ROOT>, /* pgc_dispmix */
+				 <&clk IMX8MN_CLK_DISP_APB_ROOT>,
+				 <&clk IMX8MN_CLK_DISP_AXI>,
+				 <&clk IMX8MN_CLK_DISP_APB>,
+				 <&clk IMX8MN_SYS_PLL2_1000M>,
+				 <&clk IMX8MN_SYS_PLL1_800M>,
+				 <&clk IMX8MN_CLK_DSI_CORE>, /* mipi_disi */
+				 <&clk IMX8MN_CLK_DSI_PHY_REF>;
+
+			power-domains = <&disp_blk_ctrl IMX8MN_DISPBLK_PD_LCDIF>,
+					<&disp_blk_ctrl IMX8MN_DISPBLK_PD_MIPI_DSI>;
+			dvdd-supply = <&reg_3v3_dvdd>;
+			avdd-supply = <&reg_v3v3_avdd>;
+			status = "disabled";
+		};
+	};
+
 	backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pwm1 0 700000 0>;	/* 700000 ns = 1337Hz */
-- 
2.43.0

