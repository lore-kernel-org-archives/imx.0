Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A833C457F
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913387; cv=none; b=e/yJDcX6YARCgigid3tNvDiKmD2Qbqttxre6WXNnyzgCjK8kx2xMdhHBj0igp9vszCzAFh1aplj6qqaRg3r+v3w+b8dxwCUZOIlryERQbVkSI8zHVLVsPV4Ikdb2C/qaqi1kt0ocAlcaKcAKPv1yhz7n4kvbFRxXW8+NYtKQphE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913387; c=relaxed/simple;
	bh=bx8iNwIPqJAsdhHleFFlqYoEusm+OxMl/JHwtRXHV2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uyYL385bKyC59hvPXzcqznaKANePCsM5o7U687Ea3G98bCf09jxKPCAQ7PhREZ/P0NjW14fCzOYv3gvRyILnoO+qy2CiMnmaBQ+Ea240vxuiAkXCGxfXVpy9P3zYWt2bQIse1U9RZF4C+4mU0DMMOU/UWJgiL3sv3VBngnzaMX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhHDp9Mq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhHDp9Mq"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso33268095e9.1
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 03:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913384; x=1781518184; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htOQd3VjAWSz0jlDfrcFVj0cUTt8KsHKf1+f8ShpfBg=;
        b=FhHDp9Mqc0Jwp4vrXORz91uBrlG3lKBmymXEp431hz1t6Ad7WTNZG/DcgswNUXb6lW
         wG53udRDluSYzhjvHnpwi919TVPQrK8TVNiZsycznrEn3jKw5aZI3u3GX1r0yBtKgxfH
         K69PE2EVw4YOAJJlXA+1ZgSyr7QCsVp9YWY9OQQr9/UmEFGibILU7BwLAPi0nrVHBQzB
         058viVxy6tWPGcSdRI7Fg2r9OujXUc/fhZKWchCzOr+h4O99OsxMIxSDkRoqWawicswz
         Ap932KlOimwvEgOqcl1gZj164Hbnmxy4RfooVCalZkHl+k/tEW2TQxANEvoumB9oSehw
         BA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913384; x=1781518184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=htOQd3VjAWSz0jlDfrcFVj0cUTt8KsHKf1+f8ShpfBg=;
        b=GcDbqyxPvyTd/8yfdnTPSH+WIclPUgJVz037k5T6zYAbfNhDa8qTJq+hkY3B1aCjdr
         Qf6ghBeQMAm1+h0cQFBvvIeY+PrAO3GP3lD/hDu7j3l5z8BlQwhowaA/0mZEwo2u7JXd
         jldl2Wayx9X1lcIDT9lROewIknnHl/Dp6XMJNumLOovfLZjTkGNYz626P20DumjChJcW
         4u2pRJzl/UlIoKoVX8gFEKleKVEJJvt90dmEztoVWejo7LYxzOn/aE/eKS554Sdjq8bl
         b3rSWZVRszWCITrSrByFOdLnxDxrltnuEjS5RB04DCmxiRozlWweiFBcdRQGotBUnGij
         rKLg==
X-Forwarded-Encrypted: i=1; AFNElJ/1/g6xigSz5DlQ4WWxkdGHmk72nUtxgT0le/HREHL8vdW/xoJKOifJMSUaTmZsgZ9hoTY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6tbaWEOTiDAeAdxvtlK10+2BLVFt/H0CV7zf58ybrEjfpal/i
	tfTivW/vsXSC7m2xo2QF9FJC0K1fEek364BquWDVcexBcJdYwPg7h5Kt
X-Gm-Gg: Acq92OEErwRI1gcui48yUs6ZI3zLfXJt+DpmYzaIccyukdXqZ+BO+3UejO3pxAXXNF5
	hrMG0xSbxFw2H1aQuGlVzbO2btsYPQvo75dy6+q1lYRrYvTixdCtVmH1kPc27ftgSDrNGLW8CjQ
	FPeKveCBuVZ4MHsCP8cf0Rl3mQnxS9DT1rwGnxFFkzU+omfGNtn3A5P1f3SXXLsfcYbjfF3/+BG
	1FR5kXhJczYSbA9RBrSudvIkF/9xgfqQDz3zPa+Otrz8IUZN/Al3AL5LqAs75ABS35L2CEKGB26
	9/DrgTGUQSKQhCL70dnO31B3niYidaA52QtWuiGxPi3l40ZYwI2A1aopeKefY37BaOWyKQtRWN4
	lWp9NxlZx0ShUESWZ+Y03Qok4ltm1QXFEKFjZCX8XRKxZPh1HsbCMjmAv7Kbt8RLBzXDmYimvmK
	fBGk6XFiFrwpuIkfc0RLYNB7QHrMSiybON2EXbEmDus1SVsR3QYADzlJku+8VxTLQ5t+8ujdlaj
	upqxy8rsYyi1ZIY9jsG4OcfnybGJNtwqDlBWfGZQtHc1vE4
X-Received: by 2002:a05:600c:4e47:b0:490:9bc2:bf8b with SMTP id 5b1f17b1804b1-490c25acd68mr249144475e9.5.1780913383529;
        Mon, 08 Jun 2026 03:09:43 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:43 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
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
Subject: [PATCH v4 06/14] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Date: Mon,  8 Jun 2026 12:09:24 +0200
Message-ID: <46f059124fc039b83ff3b8d9efb2fe3da55dc7ac.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the PCIe reference clock and enable the PCIe controller and PHY on
the Symphony carrier board.

Describe the PERST# reset GPIO and configure the PHY to use an external
reference clock input.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Add pcie reset-gpios instead of deprecated one

v2->v3:
 - 

v1->v2:
 - Adjust PCIe controller configuration

 .../dts/freescale/imx8mp-var-som-symphony.dts  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 34a956c98635..a2becf5409cf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,12 @@ led-0 {
 		};
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -146,6 +152,18 @@ rtc@68 {
 	};
 };
 
+&pcie {
+	reset-gpios = <&pcal6408 1 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie_phy {
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
-- 
2.47.3

