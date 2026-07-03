Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76DB37F010
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 08:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068382; cv=none; b=ouD7RV6AtsR0sk14TsobvAlI9yotq3LTlybJoym52SAA8B9x8W+/AfIeoPAO/nWeBp/64fMpa+jfJwXrwKRVMWmMUgsp6nUnHoPxuXHwpI8chkLlEVwghpyhYKf5ZOt777j7o/GO25n6SgioWc7UTw/igUpTDiVzu5CCHFxy0zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068382; c=relaxed/simple;
	bh=aZs/1nV4qk4ZnSM6LmclRKUh04L1ajGC61MnDb2DOY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m3rq0CQGT+k4t7bj1aWxxfDiLYhWbmWuNZtiq7X/LctkZYy8H7RG4ROkeMU8i+tw5MWzMi2J3Ct2kFzpOPmY7i9M6XqHDLBWZIJnkGFMZWxv3OofaVnP6n1wKZXn5guwf4poDMJ+L/Fpyq4rn7dhWc7pDfHBlKigcYhJH0yMRsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBeTUQ5F; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBeTUQ5F"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so2443315e9.2
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 01:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068378; x=1783673178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWWltOfdcU5pE4GXibJ5kTc/Rstivzo5YwiD39mqp+c=;
        b=nBeTUQ5Fm+PsuXcbsk36K3WUkwOPFH/TlbeoNLYM3VxkIKJobY0mXjIe3V5kidAqGw
         12nJmLfb3Dh6Y9Sd6/EaSpv0ZbV68+fjOtfp54S55Zx9En/+vqI4RkiEtfUUQ08GsmiA
         BfNF4R5ebhvxsiMyGKA+aGdOtWdhYE2EFry2UWlccFO8ZCTqGbzoyPXPsacTL+k95ZTp
         qkgMdNgAEplU9rGRyYDYDdUO3T+jc00b+IAej9yMQ5OnVPaWOZIzTHwMHQNi+CMxJNDR
         N/T4+cm2IitAP7dObyr2aHVc1+c6r06USVjqrXo5IeKG7kzrsbvb6lF0/dwnrYP8p8+E
         HT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068378; x=1783673178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWWltOfdcU5pE4GXibJ5kTc/Rstivzo5YwiD39mqp+c=;
        b=NsuIomdTpCt+Jk+ZMH0kuiseVc5j1IizQRfJtrDuJGJ4UzKsiUsB/TjngEyRASvXe9
         /5P2OQDGxTyzUZq7sYmjmTnmimIK8rcN6avu7WbidADg1+mA41rj/UiiZumivS9tsxfD
         M/f7ICVHREhLj6A12NhX3AKMBbauFYjS6FZoRenzZv0ICsIZtzc6i+bNHQacq9hNDO4c
         SvCPyLkepppmLb+srT4cMgO0Yg9Kabx9ztyEBDNmcxmFZ8FF+3rT4HgIXt37iLsJVvKk
         aI6VXFE/JHTY6eK15X8kcAIsaYXn61ys1bQ8v40bceLH5vX8sz62dTZLdHoPq7/p4pnz
         sWSg==
X-Forwarded-Encrypted: i=1; AFNElJ8yUJjtEE71UjpabtwfZFs3646qRnk5R29Zd4L2g6ncOMLeeQeIKaMsiPtcR6m/zwgw4zc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcVkDiinlkgdAUdPMtHvtmsgOsuDlAYjQ+8tE8Lx2xYPVLzKA3
	imQQ3IgIkrjzQxGnyarVLC828+bspU35XeHZTw3KSpxQujmyBFjXmwWkHkdFng==
X-Gm-Gg: AfdE7clIOymTzMuH430IUeoLmy+L+LSilQa44SOMJGYE/MzigBq6wB02Dymaydq+FhX
	2DpDnZ/OFpOdmmBnQcsdNsZQgVSvPE4yn+NsIbVsUnh9/N2/5k9vje9NgeXVseMSBs9b563E0BQ
	90Qcb3EALKgnv1uwzKmSGIcRAT4eJV9Xii1gKy+/emnn4d2yEJBJmLHvrGTzaqsoGKEdcIMYijf
	V/9kklnH8ttRW72Wo27TQ4U4Sb1IgNvhio95w66ZcE1409u1UVu6oq+Vo8Wxzh52OjdbUh8POUG
	PkDqIA1sAFls0kxmnfcUwxNV6vaeTccfD1SPQAYUWqZvs92I49LkHBiM49WASBWueKiPdi5huwi
	V9V3qpiemw18Tf9damRZso9AIw1Utybq+ENdTDZxdmpLpi/MoVsJg4xZ1BBwkSB2UQIokrj4JBC
	BUVeHJes7LxT4JZLrqvrLEJWVAem5irvLeNxTHgVSYp0UMXtii6GzW5NwzJjzsqMchkDOyLpL8h
	4AVEafrKl+rxASi1ifMnF+Biw==
X-Received: by 2002:a05:600c:c2:b0:490:469c:556b with SMTP id 5b1f17b1804b1-493c3cd9c2dmr74057675e9.12.1783068377769;
        Fri, 03 Jul 2026 01:46:17 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:17 -0700 (PDT)
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
Subject: [PATCH v1 09/15] arm64: dts: freescale: imx8mn-var-som: enable FlexSPI interface
Date: Fri,  3 Jul 2026 10:45:56 +0200
Message-ID: <858f10730612e0225b69257eef833c3b84052ded.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the FlexSPI controller on the VAR-SOM-MX8MN and add the
corresponding pin multiplexing configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mn-var-som.dtsi      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 0abc2d33e711..259d9f36f8a3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -176,6 +176,12 @@ ethphy: ethernet-phy@4 {
 	};
 };
 
+&flexspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexspi0>;
+	status = "okay";
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -456,6 +462,17 @@ MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x120
 		>;
 	};
 
+	pinctrl_flexspi0: flexspi0grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_ALE_QSPI_A_SCLK		0x1c4
+			MX8MN_IOMUXC_NAND_CE0_B_QSPI_A_SS0_B		0x84
+			MX8MN_IOMUXC_NAND_DATA00_QSPI_A_DATA0		0x84
+			MX8MN_IOMUXC_NAND_DATA01_QSPI_A_DATA1		0x84
+			MX8MN_IOMUXC_NAND_DATA02_QSPI_A_DATA2		0x84
+			MX8MN_IOMUXC_NAND_DATA03_QSPI_A_DATA3		0x84
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
-- 
2.47.3

