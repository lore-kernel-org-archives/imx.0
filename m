Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D7D20E01B
	for <imx@lists.linux.dev>; Sat,  7 Jun 2025 09:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749288833; cv=none; b=ZVSIdsuH3OALIwtpcCgiFlNAMVEVO3uef1BTl78ObuTJ2QjtnFGvsven44x66EMJSqPKgl/iazfu0HqOFASOiKiWXWt59NH/SAW4abnKlwxEXwaXTfLpxmTMhls5T8f6WuvoapQvRtKKUlNw24sda3HhCd9i5LRrTd8cu5eonvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749288833; c=relaxed/simple;
	bh=nlwe7h7r3/BITiv4q+dzdvB5lKnHkIgxhj7FM6I1jnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NWzKHSzm4Mpd9VZdR/wXdC5YO5iU0hHx7N4q9WkyHJg4J+OTWOKz3YJn6XrEbyGN7cjGftGZCQHYv5tR0HqnLLm77tTOmAkp68feKxLEUBq3ilreVddd6nXY3SK9EJ8O+CSXIjPDGL9pQjvc63L5zAnftZ8nIJDt4wlvF/Y/6Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=b6vZS7qg; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="b6vZS7qg"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-adb47e0644dso629279066b.0
        for <imx@lists.linux.dev>; Sat, 07 Jun 2025 02:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749288830; x=1749893630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYXpxglNlRn6ZF9PKdL5/2uCcX5/hamtbwOWk6+JISM=;
        b=b6vZS7qg1K0UTrDhSeGkPEc8h6DOyPv24+U/RBJvWCQIn89XHb2hrmdbe1nA70+HWZ
         VewEBFU0KS4Kvl2P2Lu30sbPD8SUztJ2ctiVhI0/maCuyvtFJmsYiHJXbr48uddb5TIN
         7FsXcqVcIjkBI9AisyK2emHrXgKEwA3pCPvzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288830; x=1749893630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYXpxglNlRn6ZF9PKdL5/2uCcX5/hamtbwOWk6+JISM=;
        b=E3KMmaTeTaatulTfyQXagiqQMJoX38Paq3UJsCQUOZiZi/YFslN3SXaYSbx3r67Rl3
         KR/KkLJWn525OPa/pTRaEmkrm6oXsj//e6vBSFUkK20gIWIw2ITjEjgEi6fIPmFXbUSR
         nmIU0/4ok1XSUqllQN5mHxVoUtAQP9cVjV7fjCgv7ZQ1bxAMHT6ACJnqzaIO3v1LHh4A
         iab1AwLkDV6+jym3UA6w420FY+WVtA+ezF2RIEYsA+J3CE9U081XazdMTO8IABznWU2U
         U+OPporvVCXMrm9YSZrtjwPRlVZOeHBoJltzARJ++hopIJjIS4BPHmBPesVIlWiSakrv
         Om9g==
X-Forwarded-Encrypted: i=1; AJvYcCUtZHURHvQv5dIQa6k5m37jeeLBzabBQK7ZQ/Mg3fhD6DOkbEsLSxM8vvLf8Jre4ECBaTM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAlqDKBUyVemOs/WrPIfKw8xaasZiMuMfZOS9Z7dSjZlLzmpzg
	CYh7HVy2+UpwQGKx5iFSFAGvJdbVE93BGqXiBrDRkO24J74HM3M4jcvxTaDEnOEt2oQ=
X-Gm-Gg: ASbGnctAHhd39wy+/RYlrO73M/086A5PGGF9z8QFishlT1yudmNi2hhySDELTIFosH/
	4T3QOsbotwNlMShx1zIh9IKlA66xIqVsAnw+46rpozEbZMqdOcjAviSZ3BM15l8j6GKpisA5jVT
	sgIbTuH7ZAHfoIuFONTyM+joSEsv8SNBKUqzszvfnCcjzjbRXCS+50M8mmkGRazU9AMxrQFCuBN
	CCBHLUAowy7Ysx4Q3e5pNZRDh7aJnWWsOWGI15VTeZTV240wQuBOTJNEjrLun+/riMYlsrsQAX5
	XufpFm5BNfQQLHP+I1w1w9NwoUeDXLiWJ+xi8byUSO2dDuSsuJ4JGWgGFQWfNXl7dZnGO3+uqAz
	6E5vey9BkL7TPzYlBmBxDWDNcVZurb1HmnkzVhsaUW1VQHAYwL8f8drhwb2cf+MVtTlR0HmKpOf
	tGm3/Be3IO83DAEABr9i2l8As=
X-Google-Smtp-Source: AGHT+IFwrSoT/bg84mvJeB5tJBoerkyokpFv/ZBrKGOCSANMJJ0LsqpRieQ9b6Ay4j+aF5bsl8WiDw==
X-Received: by 2002:a17:907:6ea6:b0:ad8:9ca4:af7c with SMTP id a640c23a62f3a-ade076350e8mr993166366b.17.1749288830301;
        Sat, 07 Jun 2025 02:33:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm251541066b.98.2025.06.07.02.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:33:49 -0700 (PDT)
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
Subject: [PATCH 02/10] ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
Date: Sat,  7 Jun 2025 11:33:14 +0200
Message-ID: <20250607093342.2248695-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
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

 .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
new file mode 100644
index 000000000000..8588e9ad7b8f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
@@ -0,0 +1,96 @@
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
+ / {
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
+	local-mac-address = [00 04 9F 01 1B B9];
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
+
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

