Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D6328C015
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 10:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549712; cv=none; b=elGYNzQSx1K7bPgw/hEK9DF2+eUgb+AS+eZLLZaDwCSwKVT3l3pGcYlq2PRrEZEs2LZNU1bjU+T+kGy+hXrNlT6LAFkHQt0Coo691sB4cSrXN9AV+JwRJPPJu+0XgXhozCxgnyb0aI53AFEqXmC2o+yt2ty1JZI7IRzka6Fn1l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549712; c=relaxed/simple;
	bh=UjMrT+cOHjik+PV0uTOts89DkEbH8i+V1efiehctKmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uj4JYlkzSXobvFFVPBj1TZyIKHNiWOqkVRyWMlSRxv2crbnNxQ4WCfpoNiUHEmSJVUPWrNKJbzWW5D2hLnmrPOSX3wp5o3JUTQ5MY/IbnvgglSOFc8TNTkuLCVU2PQ1SPQ7G6tDCzOJ+6cylz1Fgq0GHiNadSR/Rif4xb3rIvfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GpwBtKXY; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GpwBtKXY"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-607ea238c37so4692538a12.2
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 03:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749549708; x=1750154508; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVpRsOav3dc0RZBgP6jRNm+pqWPgbw4b4uSBb4dfuLs=;
        b=GpwBtKXYL76Dg6qvRrKM2WIo9wY0TjxL+A9jxIK47A/hYYiVS7zxX0oXop3j+V9agi
         Ft7To3EOTYlgh6ldKq1mv3O43jInOX4DN7km9YZFR/ieQqJ9hILP3cMt7q5XP4xS8Xix
         FF1HWLuxf9OhC2oSTjBujt4RpeDRg9c66BmQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549708; x=1750154508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVpRsOav3dc0RZBgP6jRNm+pqWPgbw4b4uSBb4dfuLs=;
        b=T818+W3XJBZiY8tGJb0FN4N8f8U4CACtUcln622QQ/hrqZDB52Ssls4vtkbXm1puVj
         ybikn53p6Ezs0wnmLaLo+ptK6jsq60yTng5cBCgs7lQ5a32oKB9bRCHjVkSymId6ZJAe
         8kfkFIO3BRMAUbZkfVnGlLH8qmneKjMlsso1n3TqV7Ibskc8C65Ze97YUXeYDvKQYGQK
         d91XrXVqMsbKCcsirPY0p39hla2uTDf8+Mw+SGDcENq1AkgsoP73O1H8KrzyTdrulPUK
         cD48x9tpVx4zJQYOiWF8iTZfmAXbFOktlS6Dh69JypP4TS8As269tSd76gbKifY6im56
         nf9g==
X-Forwarded-Encrypted: i=1; AJvYcCUdnKi/dnaw8J/oLZAn3B+40bcHvckfU8LBLTzpgpBgT45sGrr+kcmturhaAylJ3wrCISo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxkuxz1FbyIaiVAB8kaRVYnR+HOqJgqYcQf+iDCccHhnqcwF6Am
	k++23pEECbQCnVZ4apc3YBMqC3JLObvpfXwck7PQPqABer0451Krf+GiLoA3S4p3a7c=
X-Gm-Gg: ASbGncs4sqPw8+r38M6FdobOe4FlbKSSwSuWWXxVESOQId95wDIDH9zTQKkWWjka0gG
	GLaVUHZSw58r8A8hgszVil451/CMMa10Yk0q62SYmhKePH6LSgYe7ZR83LrWNwEZK/9OpEImFP6
	gXduYeHetTCsHsnVcbX6bzB0LIMjpYbjRk7Mj3AKTRuol4sLL6r0y30VkjUnGsvV4B485Y8fPhR
	6qDbFcsaV2qeIX2I8xcHmjsaXXlVSwb+ZR4rKTXxad+NZ+KJAj/+socGT+uQCncli8N3/3qqLjE
	GnnQ44dlWOmQ+p563OC2/C8r+WyQKWgpEeUnMedvLU8ipkNidn1IQGnkrxkq7IFam49jwxCTVwa
	NYiqU5kSiX3HxKxpllvBmHrnY/YU=
X-Google-Smtp-Source: AGHT+IEdzv89/n4ZpuVZrDYAFUC80+0NYiuFuEDwH6TaCdynJi5ZwnYhSmYFBATEcTH98tBhKddrrQ==
X-Received: by 2002:a05:6402:348c:b0:607:edbb:4bbb with SMTP id 4fb4d7f45d1cf-607edbb4f69mr6751957a12.28.1749549707676;
        Tue, 10 Jun 2025 03:01:47 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077837ed0bsm5953438a12.36.2025.06.10.03.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:01:47 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
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
Subject: [PATCH v3 02/10] ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
Date: Tue, 10 Jun 2025 12:00:15 +0200
Message-ID: <20250610100139.2476555-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
References: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
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

---

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

