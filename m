Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CCF3A1E8C
	for <imx@lists.linux.dev>; Sat,  7 Mar 2026 15:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898916; cv=none; b=LqRORVwzz6g6aOE/rgSsEs3DmXU/GJNW+j/wqgOnO9v1mRkp1hZmxPyuPG+TBJkOXDbsZhlwrsoLQXDSTD4e0b5D6pJCc990vce0ZMxoVZMfua/Mc749RgpJTXioQ4MVxT5+H88KoXK5BXRtDKUfYCG7UaGVVXu0s8BSw9Ea8tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898916; c=relaxed/simple;
	bh=mh2mW95X4e+GEXFtOLKelb2zZ6FLvxzPehbnzyknzpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lswuC+wS1XIrAZDbYaYAwgYadIloVDZfdiVj7+d8dvyUf5dWZNdCtdnEIuJucQZFANK4UA6X6G89ZHvQiSb/cjrY9ewaKevkkMoWX5gcDljYjegc76jkF0DifEfEJxsgtN/OPeRd2fZMYR4yieOCuvNNQrkJbAsYu2oVtFbqIYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSIxAZIQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSIxAZIQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-485345e1013so425855e9.1
        for <imx@lists.linux.dev>; Sat, 07 Mar 2026 07:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898913; x=1773503713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CpIYge8Jhzq2CfbF0FVozyKkPu3p/Tfu3JGT1QCVHw8=;
        b=XSIxAZIQ3QXk2Zndnv0dkshK3GVjr/OKQszDayYW18yB2QQX/xXmAiqI1f2WyCakks
         nkk2mK7yTeSypv77uX+FFs8kHb3EdiU08UI227i+s6hJeoX/8Q0b0/RTFnsvAnC6unAO
         jILhhbw/t2I0o/CsC3vjhGAr0hfg37PBxCNTNhTOzZ/j18KC+WebQfmD4kPqXmr0pCgZ
         K8kiIjIIXZPi3eP+Duq1XrvVUm1xe4DJw3vfTo4dfwf3K81SaXuSEHriDIz5n2vJ9goO
         CeayVmfG4NWtuvCTX2ij5nVU3EOtOetE+lDNcQSx1tc9GuzCtJtvpI6iT9ly/AGr7iuf
         Dx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898913; x=1773503713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CpIYge8Jhzq2CfbF0FVozyKkPu3p/Tfu3JGT1QCVHw8=;
        b=hw3QY3Hm3Ud2j9S6XWxL2ci/M7QXHTDEDo5awc8EG/fDHoCSbSFsH0/z8hjF5qJuKY
         iwAGC1BqT4p2sAxEMDBy4Ht+d6F8D+nloIpabHarhdasdcaP+nXz2IiY+067uXpzMXpk
         ftt1WWZFOy3zuT5fy5h3GJqrRKoe7ugB9GCgugRDklhfaK5/Gn/4jTE9v5S0XMqbVFX3
         S1XL77oGJYqC+3hbBTRnb+Qn/u6NpAn60UPaX0W+02ypMoMMlXsHiuKSKQ6GeGV7ZXRI
         ch4UZMU5Yw2xKGZW6FSkJV6sHOuySMekrqni22K/VlWEQ8Lycj7PCEr40pQq0MfX7G2I
         x0Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXmIFgaDqiugxaDF1Jo3nkGsn3WktyhdJCqLs32hOmgutjzhE0Ts/oOte/jGLdJCEiGz1c=@lists.linux.dev
X-Gm-Message-State: AOJu0YziYG2wHANtDrWsCXDPBjaFQnWQNzBFCzJaFPouJXsd/8fKjf3b
	QW7QZZPNnGK++SlUl2aUpRSVg7xbpgcmyjqJuhydiNbeHoZm+3FJIyDj
X-Gm-Gg: ATEYQzzDR+Q6pBqK0/VWKAceOHGrCUI4ALlMpd26be7AmMopVcR9cTGVKEp4EyQNNq9
	6aorz2SMWwbOc3wRWm+Tb+m3NOsaUPMDzioeSEvfRjh/MkNTwNeZwk0/Jm9uJ76cA7uG2EAOBut
	K8DOhmLt1Kgbm9r0S9F5WHPWJKd++aUJUV52oryUe/3hSF5btfYvPipEAhr7m2AVGC44DSBVkaz
	H2ECOLjxzXcOcNT5bxgLf+GiiKe7md3JQ+fHMjaEvGctWTrMpbQTZlLUvHYuBEOCIL8TTnlioX4
	R3omRkb7jUkg7PcStFZ7La+AWYq/lG5AsdqrmrBuaZ24ROP7RF/Ul5IlgvmjY9z4ZmxvU1NywD8
	1070JOONM/9+wkoNelvq8Lq6Iu2HWMNACqrnNgBD8mLtFR5cYvYaw13Xz2sPgsMD02ET1puTcnG
	RXwEJWiQ2rijUSE9htHRRK1k05GqmnOH0dRhbNsOFBzOVoPjaEIjwdkhJygkXBE99dF/FT8NNKl
	NVTHTzeu7nJ2GqWz1bhIxNXrQ==
X-Received: by 2002:a05:600c:45d1:b0:483:7b99:131d with SMTP id 5b1f17b1804b1-4852675e55cmr97851435e9.16.1772898913370;
        Sat, 07 Mar 2026 07:55:13 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:13 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 02/11] arm64: dts: freescale: imx8mm-var-som: Align fsl,pins tables
Date: Sat,  7 Mar 2026 16:54:38 +0100
Message-ID: <50ac6fc845dbfeae428c89f35eb3d42b2ced9489.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772898346.git.stefano.radaelli21@gmail.com>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

From: Stefano Radaelli <stefano.r@variscite.com>

Reformat the fsl,pins tables in the i.MX8MM VAR-SOM device tree to use
consistent column alignment across all pinctrl groups.

Align the entries to match the formatting already used in the
pinctrl_fec1 group, which contains the longest pin definitions,
for improved readability and consistency.

No functional changes intended.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 170 +++++++++---------
 1 file changed, 85 insertions(+), 85 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index b6560c03639e..da3c7332ec34 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -368,171 +368,171 @@ MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x19
 
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL		0x400001c3
-			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA		0x400001c3
+			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
 		>;
 	};
 
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c3
-			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c3
+			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
 		>;
 	};
 
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8	0x141
+			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8		0x141
 		>;
 	};
 
 	pinctrl_reg_eth_phy: regethphygrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9	0x41
+			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9		0x41
 		>;
 	};
 
 	pinctrl_restouch: restouchgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x1c0
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x1c0
 		>;
 	};
 
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SAI3_TXFS_UART2_DCE_RX	0x140
-			MX8MM_IOMUXC_SAI3_TXC_UART2_DCE_TX	0x140
-			MX8MM_IOMUXC_SAI3_RXC_UART2_DCE_CTS_B	0x140
-			MX8MM_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B	0x140
+			MX8MM_IOMUXC_SAI3_TXFS_UART2_DCE_RX		0x140
+			MX8MM_IOMUXC_SAI3_TXC_UART2_DCE_TX		0x140
+			MX8MM_IOMUXC_SAI3_RXC_UART2_DCE_CTS_B		0x140
+			MX8MM_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B		0x140
 		>;
 	};
 
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
-			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d0
-			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d0
-			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d0
-			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d0
-			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d0
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x190
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d0
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d0
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d0
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d0
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d0
 		>;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK		0x194
-			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d4
-			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d4
-			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d4
-			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d4
-			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d4
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x194
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d4
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d4
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d4
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d4
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d4
 		>;
 	};
 
 	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK		0x196
-			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d6
-			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d6
-			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d6
-			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d6
-			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d6
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x196
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d6
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d6
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d6
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d6
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d6
 		>;
 	};
 
 	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10	0xc1
+			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10		0xc1
 		>;
 	};
 
 	pinctrl_usdhc2: usdhc2grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
-			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
-			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
-			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
-			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
-			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x1d0
 		>;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
-			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
-			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
-			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
-			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
-			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x1d0
 		>;
 	};
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
-			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
-			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
-			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
-			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
-			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d6
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x1d0
 		>;
 	};
 
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK	0x190
-			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d0
-			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d0
-			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d0
-			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d0
-			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d0
-			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d0
-			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d0
-			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d0
-			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d0
-			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x190
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x190
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d0
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d0
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d0
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d0
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d0
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d0
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d0
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d0
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d0
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x190
 		>;
 	};
 
 	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK	0x194
-			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d4
-			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d4
-			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d4
-			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d4
-			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d4
-			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d4
-			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d4
-			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d4
-			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d4
-			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x194
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x194
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d4
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d4
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d4
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d4
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d4
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d4
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d4
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d4
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x194
 		>;
 	};
 
 	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK	0x196
-			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d6
-			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d6
-			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d6
-			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d6
-			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d6
-			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d6
-			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d6
-			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d6
-			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d6
-			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x196
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x196
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d6
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d6
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d6
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d6
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d6
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d6
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d6
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d6
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x196
 		>;
 	};
 
 	pinctrl_wdog: wdoggrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x166
+			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B		0x166
 		>;
 	};
 };
-- 
2.47.3

