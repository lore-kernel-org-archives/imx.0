Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378168;
	b=umdVdyflvuVIw7RiUBGJeC2MMMsZ1GESlgZ4Z0ItpTuoWPbztu3sC1QZOcoE0WoUwNSE
	 +sxO2HGnYCU63L+F4Kp2/0486WNvyGlI2yxYlWdCygsQ98UrnGhvipKdmGQOJOE3kgi2X
	 97anWNWBp2jouYX0WtOo9lvnA7OCj8unZ5ubX6YBtR0n72rUFYLk8P5VJEvjP1ixz+xvD
	 Wjy4YO3ZMQYhV6xvtna2/gJNKpOzzuKrn6uXavcBbrfcWOrLjHUgcbmwg0v0tx8jsqHHk
	 Ab5rz1UELgCyhkk5xgOs8154EJU0QL12C630D0EIjxYwCVVTrwyuTZ7yq6CTN68IA+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wfYGmQ2TsPCF1Aeg7POfMnuEwpwJrElHbkZ/EO4eVuo=;
	b=JlSc5ujpKriGahuvScR6oFOK5DBzfhr8UZFJc9ocs/KAf02FqUGNX+A9bwM1iV+zFw7v
	 TRtyA1tonz7V4SYhkHHq8LhjTtxlV6xC/hPALX4GDmOMVZwbkNf3RGCz+hsk5jkz9N/Ra
	 xCf4/87pM+ZFzqRRQNRiZpXvI7RvOj62w69nQfEYqzFl8kW7UViFcnVzcYi4BogGhCTql
	 +lfE2vpIaJB9oZS3W95JTMfbt3G72iW8AUXXortWkaYlYdO45v7LeEzMowWF25HKHl00Y
	 ClSuot2+I55omUXEeQ/RgErmxLcWPjMuGV9fzhtIL47Y2gWe3eREpjRLpzmH6jIPmNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=HKo0iNA7;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E70606A333
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 16:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09E70606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=HKo0iNA7
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so7432485e9.0
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 09:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378157; x=1793982957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wfYGmQ2TsPCF1Aeg7POfMnuEwpwJrElHbkZ/EO4eVuo=;
        b=HKo0iNA7IZe11rNv6Z3Yf2Qiml7byRVyvOA8CXvQR7z6umeEOUbEyItRZzUPlLqFLI
         d9jSlz9tct99FZ7fD00/gfSh3HBr19vVyCJe6DWlXhplN3/Yox2aCDetokrs6f9iyqNJ
         xJYc7f26/hAkrstfpfIuCqHC4nN/UA/e+amlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378157; x=1793982957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wfYGmQ2TsPCF1Aeg7POfMnuEwpwJrElHbkZ/EO4eVuo=;
        b=YqnpjlNFsYVqAraC4K2G5uMZkDb5W4TxqJ3rb8GsJDTLi0NHMktVqqWB2XbtzLLH8i
         tLV6auJPNg56xnHmC/DGvktGCFk/GxRz5njsVKDbwNhdb24xmsqWRVIFWWiT7xCfgJEq
         Sc0nl7ORaJ7uHsIhQyyLVQ6W6N0KhgnO9DNt3P47VbH5TbQdzfd1acOCPqv2zyQQ2P6o
         rh7nxrkWZTR5tk2Bv3Yk14UoWgArQ9YLqE0cAAETla5ENWTGVnM58UbxijKrmku+q5Nb
         rRCxVCfoHj78/CZKMzCjCQn4mMm39SzdiHbLX0A90nZdflURj0OIe+IN6VXdzXKk2kiM
         RBjw==
X-Forwarded-Encrypted: i=1; AKwUvBxMYwZrVwy/RmQ/oBkB7EObyCuh7QIb3pZdXk2NVfBgzgZOfGEiQl5dA4tAyWIeNZNmrWs=@lists.linux.dev
X-Gm-Message-State: AFq9FYIIbID4hn6DHFYKE03bT3SvPGW+yXnDlLQDQaFWQYrOrW9BQDBb
	A6jnd5zutXDH+QYx7vca5FrdOnnbY+J7qjG/PvdwbvGQGQf4VddJ9g20Yu+VCEpkd8M=
X-Gm-Gg: AYBFou18vqxbks3MnqO6cRT0S3XABZ4Lka4UyJWL462/fu8gHMXjM/Y745Gs5knzPu1
	wcEqjQmhd1to4oh6Bz4iEzI3LGCy+3KwGnBbb2e+NwwA5eqF7Rr845UyzvXdKOp3+8yoBzLBfUD
	fAn//1MB7IJ3h+ZwehKwcOQZclSjpeLC8uC6ATIjInNDYg588jlrRmH/qiZXwbZ4CRJJpaH7V47
	Zhgck6IKbtdOPS9wrg9NUda0uWEqmwr39FjDMKw72mK2/CdxJUjaCX1/PmpGy6HlBqxttyH5TE+
	gZLlk+atdVLPEILkiUrmjZDXqdPWHY48/r4/F2w3n3CSBVaApZ0ifoH77stDdErWE7gbAWbMlWC
	Og8ldGievZTwaJFhAq0kSgqhoLLi61GBIWsxHGKtOsT6q5ppvsjzsrxZ7vHt76jqbfmHDWh+Yjb
	mJkSRq8+Ox7PgxPl1ICHXDAvSXd4mHWxE2PUpz8nnjqCKmFKMUHVMGY7Howr7U4OcZlr5KdNLrN
	lIc6RGUfSdlYTfmSv7G1Jt0I4B/Xed1GiqMj5AeGffVtkwB16oiRuaTMRg8ktFML09IOBCdcArQ
	9PY7OxSXVaDA0hfehfPnAF5gXy0Nwb2VvvEkmzzhY91CuFZMS6DmSfbh6LVcKEmuwu0RzzTv2wP
	qKP63aInzGBW53heovcLey9Hu/joiifjvNA2JXgBF4OkNqHENfvWEdqPoZBB+mVxwBiybWPovBb
	qEMSSrSBnH/qOKjfIzeYpo4nYYNw==
X-Received: by 2002:a05:600c:5249:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4ac1228b5bfmr63214265e9.0.1793378157371;
        Fri, 30 Oct 2026 09:35:57 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:35:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/5] arm64: dts: freescale: support Engicam i.Core MX8M Plus FE SoM
Date: Fri, 30 Oct 2026 17:35:42 +0100
Message-ID: <20261030163547.2682583-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support Engicam i.Core MX8M Plus Fast Ethernet SoM, a variant of the
i.Core MX8M Plus SoM which embeds a SMSC LAN8710 10/100 Ethernet PHY
connected to the EQOS controller in RMII mode.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../dts/freescale/imx8mp-icore-mx8mp-fe.dtsi  | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi
new file mode 100644
index 000000000000..1341de0ba4b5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ */
+
+#include "imx8mp-icore-mx8mp.dtsi"
+
+/ {
+	compatible = "engicam,icore-mx8mp-fe", "fsl,imx8mp";
+};
+
+&eqos {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eqos>;
+	phy-handle = <&ethphy0>;
+	phy-mode = "rmii";
+	snps,force_thresh_dma_mode;
+	snps,rmii_refclk_ext;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {	/* SMSC LAN8710 */
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_ethphy0>;
+			reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <500>;
+			reset-deassert-us = <500>;
+			smsc,disable-energy-detect;
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x3
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x3
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x12
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x12
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x12
+			/* RMII reference clock input, provided by the SoM */
+			MX8MP_IOMUXC_ENET_TD2__CCM_ENET_QOS_CLOCK_GENERATE_REF_CLK	0x12
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x1d0
+			MX8MP_IOMUXC_ENET_RXC__ENET_QOS_RX_ER				0x91
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x1d0
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x1d0
+		>;
+	};
+
+	pinctrl_ethphy0: ethphy0grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_RD3__GPIO1_IO29	0x16
+		>;
+	};
+};
-- 
2.43.0

