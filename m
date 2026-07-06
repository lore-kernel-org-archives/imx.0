Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3507C423787
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 09:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330501; cv=none; b=X0uf7NP9tBLtSdUh/noMvCzz4MH43gdHmSGqTkYuXT7zGtmYNPmjV4nep55Stz80I6JdPokUWmExbq9xVMqMvdelKtNIdae0519wpuHyyYsvkQgPL8OnNjAFfz16uBlRRyuBxV8tNoiN3Y4k5iu25GubskYDA87eEBWC9Iv41DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330501; c=relaxed/simple;
	bh=GU5/RnoVzHwfSUp/xzhJzCSq1LZpr2g40/YZZ3wwEY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=quEDDBGBjWsAtE34Tn76jRcADAghSVAcZr7j8m+AUbA290qnpAFdKkcJifnRwJN7h7pUB81apqz1tUJSpM6I5o8dz7HeoIKTzvBmHnB6MtvSfJmPlQZNiAz/Y/TjhNusI7w01yAprqTIp2zt2npnlBoLnAb0abY0IQY0DSFdWIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1jmnpPL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1jmnpPL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493ba701891so22059215e9.3
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 02:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330494; x=1783935294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Bs1t6niDEghP4G580i18CcoVCJKxGhV6ocPTEQ3Ayk=;
        b=m1jmnpPLB6oWngQWXTTsoZ4wjAsSdBTwmjnpO5fVFIbJwzTOftgcGdoNf9k8eXZKaj
         GxaPkKTraBktMKDjk9cbdktjLEW1QfdCa7Jw6bGkoz0ojHqOijQwQKDTalTl96yARu45
         xFiO3l2hAjIZ43542ijhZ0vxKu9kZUdgh3+Jx9fal22veweHzZiBxGs6Nv7br7X1samF
         wwCWGDIeGtpLOrfzl/ArzNqVBQFO3Eb5tnAVU0K9gx5XkTmGcosbS1kfMT1s+qICncXt
         z5sql5H3GzUxD94QVhh99rXrp3W2s+Uhx6ca4rgH4N9p3vd0VYOnY+Uvd4fK7KIlNf9d
         98Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330494; x=1783935294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Bs1t6niDEghP4G580i18CcoVCJKxGhV6ocPTEQ3Ayk=;
        b=WdxTpyXC5kCToWMNyGDPnH3lcxjkkN+7IncETwOwm823B20EWDMEkvAN6bPSh1OTAQ
         L+LlAGdCBd8m29dObvGnqpIU1Wcf5fAFYJFHr/mI7QRvTz+gkajdjsRS+n602cILSdQD
         gJG2eTdff2oZRyZ0BkE6swGOa1TSMmNKHimpvJDst8laAuuKuV11gHLlORR6WPk/5cAw
         B96UPn4g1bah2iOC01E4l8+FNNC4rhil4PDWpcl1eMdVLjm7/p7/jAgQ0YX2q11hCSSc
         D9pNBSKKUe2siOHM/PU5Mjv1pML/QxdXoPa2/lg69Dhdre8eq091JiLkXm0XK0kDeyb5
         YJLA==
X-Forwarded-Encrypted: i=1; AHgh+RrlgJNH4SewP5DDfNYIaANwlUzPaYT8FS0PHLeAN2L1rAQsk9w4kO6tDc4ABNXHpD1FpNc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwG4NPBECEDJ0rddz65c9gmmSEBu6kgPH8kWmvnY02eHkkok2L2
	OQk5m2dvT89yoHW8Ushh6FfTPpYjIncQN4QpoVnDjJpzbbqp864NoFlT
X-Gm-Gg: AfdE7clGXgPcLqlpMxL3m8My3REzFS61L2coyoCaEjGouLhTXwFxw82wczhHrHzDFhv
	RU3OstOFsUA/QPUDuMLHKdefvkLsb1jM7netnQKEojHbi5GH2CbskDRokb10jhndTnR8oKtVCdM
	BGH5e0ZeqF5v9P34nGqr9tKO1VjHOv9Z4o6PyQnSi0ckHrUBWWkXHTSc80hvuISYz4rh2SWSvg7
	yFyDUYqwJQr/XVH/3+GSrFr83FAJkWUPmHJnD7DWw5npa0tM/nBZR4HvkQJFPmUrdAGgDbxV3BD
	+hMDraETJ+15nc7UN5fT7Fi5z/q1c+aZCsaKN3Jg9bFITrJWHGYCZJLuTYUHBlfhFg4H+EQFaO+
	dy6dGgty/R1wNswuBD16xLIyX2ZVPGkI8GnHnFFn4HYgY172vJvkE0cJQ0VaLW9Sx0TiYwUmiOi
	7UpLbBg0dgirMD5PkXdv4sfGjF6voE5Vu+7gKXXVVF7aTJ4IiXgz/Qd7UYhXMVxQYZejK/vcLOH
	lpbXyTWpUbqbCl/8hvkE3X64g==
X-Received: by 2002:a05:600c:35ce:b0:493:b877:fbc with SMTP id 5b1f17b1804b1-493d2396eccmr114312345e9.21.1783330494156;
        Mon, 06 Jul 2026 02:34:54 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:53 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 03/15] arm64: dts: freescale: imx8mn-var-som: Align fsl,pins tables
Date: Mon,  6 Jul 2026 11:34:33 +0200
Message-ID: <bebc3185b37c48d6a6a2cf3e09d02751c77a2cd5.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Reformat the fsl,pins tables in the i.MX8MN VAR-SOM device tree to use
consistent column alignment across all pinctrl groups.

Align the entries to match the formatting already used in the
pinctrl_fec1 group, which contains the longest pin definitions,
for improved readability and consistency.

No functional changes intended.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 126 +++++++++---------
 1 file changed, 63 insertions(+), 63 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index e1d2e2a72e1f..71a2f0866822 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -368,129 +368,129 @@ MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x120
 
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL		0x400001c3
-			MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA		0x400001c3
+			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
+			MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
 		>;
 	};
 
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c3
-			MX8MN_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c3
+			MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL			0x400001c3
+			MX8MN_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
 		>;
 	};
 
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_DATA6_GPIO2_IO8	0x141
+			MX8MN_IOMUXC_SD1_DATA6_GPIO2_IO8		0x141
 		>;
 	};
 
 	pinctrl_reg_eth_phy: regethphygrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_DATA7_GPIO2_IO9	0x41
+			MX8MN_IOMUXC_SD1_DATA7_GPIO2_IO9		0x41
 		>;
 	};
 
 	pinctrl_restouch: restouchgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x1c0
+			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x1c0
 		>;
 	};
 
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SAI3_TXFS_UART2_DCE_RX	0x140
-			MX8MN_IOMUXC_SAI3_TXC_UART2_DCE_TX	0x140
-			MX8MN_IOMUXC_SAI3_RXC_UART2_DCE_CTS_B	0x140
-			MX8MN_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B	0x140
+			MX8MN_IOMUXC_SAI3_TXFS_UART2_DCE_RX		0x140
+			MX8MN_IOMUXC_SAI3_TXC_UART2_DCE_TX		0x140
+			MX8MN_IOMUXC_SAI3_RXC_UART2_DCE_CTS_B		0x140
+			MX8MN_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B		0x140
 		>;
 	};
 
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
-			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d0
-			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d0
-			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d0
-			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d0
-			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d0
+			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK			0x190
+			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d0
+			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d0
+			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d0
+			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d0
+			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d0
 		>;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x194
-			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d4
-			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d4
-			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d4
-			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d4
-			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d4
+			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK			0x194
+			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d4
+			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d4
+			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d4
+			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d4
+			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d4
 		>;
 	};
 
 	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x196
-			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d6
-			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d6
-			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d6
-			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d6
-			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d6
+			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK			0x196
+			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d6
+			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d6
+			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d6
+			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d6
+			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d6
 		>;
 	};
 
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x190
-			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d0
-			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d0
-			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d0
-			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d0
-			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d0
-			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d0
-			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d0
-			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d0
-			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d0
-			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x190
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x190
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d0
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d0
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d0
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d0
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d0
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d0
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d0
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d0
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d0
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x190
 		>;
 	};
 
 	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x194
-			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d4
-			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d4
-			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d4
-			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d4
-			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d4
-			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d4
-			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d4
-			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d4
-			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d4
-			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x194
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x194
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d4
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d4
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d4
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d4
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d4
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d4
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d4
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d4
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x194
 		>;
 	};
 
 	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x196
-			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d6
-			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d6
-			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d6
-			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d6
-			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d6
-			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d6
-			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d6
-			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d6
-			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d6
-			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x196
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x196
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d6
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d6
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d6
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d6
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d6
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d6
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d6
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d6
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x196
 		>;
 	};
 
 	pinctrl_wdog: wdoggrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x166
+			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B		0x166
 		>;
 	};
 };
-- 
2.47.3

