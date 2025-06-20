Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7127A2367CF
	for <imx@lists.linux.dev>; Fri, 20 Jun 2025 08:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408067; cv=none; b=KUyERb0Drf+NtERstYcVnj3w1UlMFE5+8IWfG948ienGCEtqABCh52DLFm61eBqfgEZCvnKy00izniK/nWwMtkSZvzzG0iPK+Y2sgUgum+E5iDWzqA+qebzI76RihkQemtwG9V77G6P4RsSk9cGwBx3kAuPYTjLwqWo/VTfjFGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408067; c=relaxed/simple;
	bh=33KJWBkI7rM8jT4VqOLvllhf3AJjAdnqppvUHNnIlHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aEjFEB5DPIukS6l7vTT6zJf/VPv0nD8LLZotrd9xSytAL2KNsCQzKDUTiuO6WcUV6KtdJdDKPvViLDleWoiN3cbJK3rr/1OC0D6Y9gqrOhvyESGW+SOwl5IabaTlCz23tRpZyZFeW4XMWdZy8Ailiiuo291ezSVrSH0OHCOtHb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rI8Fcf37; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rI8Fcf37"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cf214200so14826225e9.1
        for <imx@lists.linux.dev>; Fri, 20 Jun 2025 01:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750408064; x=1751012864; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOp2CZidLhOmD2AW6kGHp67OREEo6XfroyPiU2YyVaI=;
        b=rI8Fcf37wyFJkYFZddYZQAi8R4RpesJfAK6FUhf5Yyv7DI5cIJ5U4tgOkRkPOwlZmv
         CWunRe4O+NCukHKnu9UCBEd9sY0eTzMl0lk5yWXTloNz0VjPQ63DMUhcLSE9/Lszi5He
         tfYe+l72TAOXlh9lFV03+usY5xBRv9TmJnswY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408064; x=1751012864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOp2CZidLhOmD2AW6kGHp67OREEo6XfroyPiU2YyVaI=;
        b=ZMn3xbnS0EsIc7H9wsyO9QZw60sGEUvoJKE3s90qtyEMr+0mTaki7/cmY3LRfdznAF
         Jz00jCcpNt7tJMtRdsmv8vRRrUIp34dr4IMvw1L4riBwcXargzH3Yyj+JczY2G8g63X8
         twIdpXAb4zlIjKakh2cOKb0DIqXhJ3VSiXYIMCB3LSY1qk/o6pGTslPtuY7c9jLbXmMq
         HZFcIzOFyigaOUXjhXp7NJhI3pQ9UXZP8rclpPcdFBoOswW5hfjNv2vhBeuushBDRdHD
         RB5zNDbBc7v9xpV8UsDscYjiTh9IPBWFM++7IGlZkmt+63MtvowKJ6XV2cwZSBfrna53
         3+7g==
X-Forwarded-Encrypted: i=1; AJvYcCVaWDBCodO/V00yIuFD7zdpqoFbTu/HuFIHCaY1CEtbj97Wh4gYJFXifPNVjjfSMQl+Xdk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFx1YVX6w0ZJJW/F39aFURWQ/58m2JyWPt6uL3oR3jy8IkRh9G
	x/oH65M0mOnmZSIkmq5KITZVyy2B9LqbEYGhjQmGaI85/T6jNfKWzZeqi+yNVN5wUv0=
X-Gm-Gg: ASbGncvlsO37buSbtaQYwxhgljdlbHQS4iaiQ9AZ5oVc/O0S+FH985nCc7qhSgbMsNK
	AYGz96ujSoQZ83XMbx2w0WmyHP+vOPBDUobxiGAY0gVasdX8hh60/wT32H50RE+N+KOBsH4takL
	vZgcRfHYvfvEIniQ64IpNki5IzrP7mQz5t0enYHTghT5vH5VzaTPca/l5Ku3MxVebq3sb5XHWMb
	m/QeNUQCe3XX3aHsoaNMFsnEdXBZYG83hogLA448rXHKKV/wgeF2sSzpST6Cq/ZKbLy5/dh6Fdp
	pg37Hr5pKuL24OVThX7eQL/lyBZJdeIV9t0YOz+3ti8HL9k79OgHsZBaGa9t8h57fPTvEDMwiG3
	g85reQ8o1IIlUupOIUjzfm7NFQptLGTE0htb6FCGm3iARVA8IUw/I
X-Google-Smtp-Source: AGHT+IE1VwtQP6Ch+qDfZ8PP/Yh9iWUHsjDPpN07ZYphZ4du01lofihUpMs6j9otKEFfHCIR1+ACwA==
X-Received: by 2002:a05:600c:3b8d:b0:44a:b7a3:b95f with SMTP id 5b1f17b1804b1-453659f82abmr14480255e9.25.1750408063697;
        Fri, 20 Jun 2025 01:27:43 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9844a9sm52274285e9.12.2025.06.20.01.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:27:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [RESEND PATCH v4 02/10] ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
Date: Fri, 20 Jun 2025 10:27:06 +0200
Message-ID: <20250620082736.3582691-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
References: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support Engicam MicroGEA-MX6UL SoM with:

 - 256 Mbytes NAND Flash
 - 512 Mbytes DRAM DDR2
 - Ethernet MAC

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

Changes in v4:
- Add Reviewed-by tag of Frank Li

Changes in v3:
- Drop an extra blank line from the iomuxc node.

Changes in v2:
- Change local-mac-address to 00 00 00 00 00 00. The actual value will
  be set by the bootloader. The previous one was assigned to Freescale
  Semiconductor.

 .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
new file mode 100644
index 000000000000..43518bf07602
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2025 Engicam srl
+ */
+
+/dts-v1/;
+
+ #include "imx6ull.dtsi"
+
+/ {
+	compatible = "engicam,microgea-imx6ull", "fsl,imx6ull";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_phy_reset>;
+	phy-mode = "rmii";
+	phy-handle = <&ethphy0>;
+	local-mac-address = [00 00 00 00 00 00];
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			reset-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <4000>;
+			reset-deassert-us = <4000>;
+		};
+	};
+};
+
+/* NAND */
+&gpmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-ecc-mode = "hw";
+	nand-ecc-strength = <0>;
+	nand-ecc-step-size = <0>;
+	nand-on-flash-bbt;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_enet1: enet1grp {
+		fsl,pins = <
+			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b009
+			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
+			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
+		>;
+	};
+
+	pinctrl_gpmi_nand: gpminandgrp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_CLE__RAWNAND_CLE		0xb0b1
+			MX6UL_PAD_NAND_ALE__RAWNAND_ALE		0xb0b1
+			MX6UL_PAD_NAND_WP_B__RAWNAND_WP_B	0xb0b1
+			MX6UL_PAD_NAND_READY_B__RAWNAND_READY_B	0xb000
+			MX6UL_PAD_NAND_CE0_B__RAWNAND_CE0_B	0xb0b1
+			MX6UL_PAD_NAND_RE_B__RAWNAND_RE_B	0xb0b1
+			MX6UL_PAD_NAND_WE_B__RAWNAND_WE_B	0xb0b1
+			MX6UL_PAD_NAND_DATA00__RAWNAND_DATA00	0xb0b1
+			MX6UL_PAD_NAND_DATA01__RAWNAND_DATA01	0xb0b1
+			MX6UL_PAD_NAND_DATA02__RAWNAND_DATA02	0xb0b1
+			MX6UL_PAD_NAND_DATA03__RAWNAND_DATA03	0xb0b1
+			MX6UL_PAD_NAND_DATA04__RAWNAND_DATA04	0xb0b1
+			MX6UL_PAD_NAND_DATA05__RAWNAND_DATA05	0xb0b1
+			MX6UL_PAD_NAND_DATA06__RAWNAND_DATA06	0xb0b1
+			MX6UL_PAD_NAND_DATA07__RAWNAND_DATA07	0xb0b1
+		>;
+	};
+};
+
+&iomuxc_snvs {
+	pinctrl_phy_reset: phy-resetgrp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER9__GPIO5_IO09	0x1b0b0
+		>;
+	};
+};
-- 
2.43.0

