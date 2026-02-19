Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8F9341050
	for <imx@lists.linux.dev>; Thu, 19 Feb 2026 15:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771513937; cv=none; b=knu0+nwIxpL2LMZW/cvoH6ZMFlH+kGUSO7gInJ60TfXyF9Pb6cICIzNwoNrH1mwi5HPqsickZz5Ds3NwXkUbF4efgwOqhIDA3l4WRiCk0EEGl21mDwq2XWScbcx8W5dh8mTMrGsPSZkyPVm+sIwbXFvskJRcxCTOUxKScqtTAyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771513937; c=relaxed/simple;
	bh=CeNu8Fa1DZ16bxXhqAjJAegnprffQJr48pviGYoxRl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gNP3Fp1oUyao3Weazfo69DK/3IuSXUILMJqRZXXLPlv9WlmdjoN36/dMUsbVwYv191hJBDNdx8NjKdZ19wqE58kVC1P1PyUy2UhIf8D7YrbBW3DkyOaJbyPVuVcmGALGL4cQNna4ojzqrdGNmbaJ0LQHT6Y6QSGi/DoFoAWnv9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZzRw09n; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZzRw09n"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso8458565e9.0
        for <imx@lists.linux.dev>; Thu, 19 Feb 2026 07:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771513934; x=1772118734; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UGfmTjjQx0R3K/qzXuIjVo3qjY4VwIiKp8L6tm+HmGo=;
        b=XZzRw09ndFHeWLdsMfb12Uuj1pMPDHGXrRaa5ab48M+ISm8Hn7EnVLu6ExsxNnua8J
         RrwXUhtH5difbWE1MQdS/jcpjmuFIiqO3zQ4HHjeq+iqlzxN7Ap5Lp0OD+5YwqgSISrV
         eu1tOo3EJFc2nzRuE2n4QQbb190o9r+LZcXyRha03/m9rvQtn7XasKZwxJxiIVDcVSJW
         fksfk1XUivx37yDFDSyohrO0y/WfRvi5GJyTxjTbsXMztb2wLoiHKVZaIMzuy5Rks5jo
         /zqFqbHLhidfMoCuGVm7mV7WbiOGbHcZSC9i4jqTf/TGOtvsm68Pdrt7fxP+31lQ9oZu
         EwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513934; x=1772118734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGfmTjjQx0R3K/qzXuIjVo3qjY4VwIiKp8L6tm+HmGo=;
        b=ZgwvMYAbUe2i7wTW2o9ZGmF3E2oTOou9VBXIHMCjjwTsSKP8Iao75kwc9Hrjipofw8
         Brlpx+Aw9dNI6GU2izO0eYWzNh+iq/zD+nIIKN2LLn2XZRxnzvLTQnXcPQIQxZmF5gqw
         CJx5y1OieAaIiIUMpHzTij1I+19lBEjoY6dObvUvJQCRIql9xVT1Gs+08UYtvcS/swBV
         uZv6GXaS8ukFel53hJz5/5LlG74joK9qluep2jfS0LVMLFV0hKwXt8SPlrvj3AQ9x8Z0
         k03aJtajY4qAx1EI1AHd7yIZDWrpX49/hkFhoz+HrUiLcd17v6UpOiTJlq0T9LHhJjmr
         c6Xw==
X-Forwarded-Encrypted: i=1; AJvYcCU42FQWTW3UmOJEaugmtf5NhLnJxfmHDyegZprDDVRz0+deSCSthGO/qXsQff1WpGz7Jvo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyH5wnvFSwMFLFqb+kvbtgydS8aPt90Aw/bjpEEUqjG4fRczMFq
	k+uZnGpBdQ1A0kj0zku1LZciwIeLJNvfxvbt/FVTtGHlXu5qV3LHAjEe
X-Gm-Gg: AZuq6aIXgHv6OeoU03IuCJlY2bNXUd7crUXHV+Xu6okAHd+zprZ8zpXzYRx/k/FBHLt
	WzXiA6asjT4WsKPq9T1rZSQyxxoFqMsRWOwV9tDWmn5chb/ytaw+5t1fmKQeCiMhgQhFpa7fCvh
	fgXZ1AYq3+wzfFcaGObOlKQBrAiRDi9pyLY+WuVbwLERIk0BK62m2JgfkJpPcrJlE/ktFe3wLvy
	4BXIFbsl5bME3pVWZIRnqU5Pt7QXTCyhmRX26dXUcNiCHWNycdXVZCAy0E2yqqhPwQzqdJniUkv
	RadkSUgOh0H0sd1HfokFRphFRoZUQ8GWpWY70tvDwvLs+R5W/u7+KjVtuf7MvwJpFfmRDxqiBtz
	UmN5A3q0ryajT41OjqMoJtJ3tthcj+LzgPK4dAvOTTAFOPZft+xVz42Z3Q2/YU/EuJedbm66RR6
	1SyDzzgfJI3u8Xef0L/tp0GrU7dYBOtWTupCLxXwv4J4ZfWh3fiC6ruGrnu7Xo1korxJ3z9ENj6
	MMLTyv1qwd9D/ci1KKS1+2pid4H
X-Received: by 2002:a05:600c:35cd:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-48398aefd55mr90529135e9.36.1771513934048;
        Thu, 19 Feb 2026 07:12:14 -0800 (PST)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f990384sm33002245e9.5.2026.02.19.07.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 07:12:13 -0800 (PST)
From: max.oss.09@gmail.com
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "ARM: dts: imx: move nand related property under nand@0"
Date: Thu, 19 Feb 2026 16:11:49 +0100
Message-ID: <20260219151157.2549198-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

This reverts commit 8124b4a4a96b57d6cc3705a9df9623c52baa047b.

The change introduced a regression: at least Colibri iMX6ULL and
Colibri iMX7 no longer boot with that commit applied, while they boot
again after reverting it.

Although this has only been verified on these two modules, the issue
is expected to affect all device trees using the gpmi-nand driver.

[    0.876938] Creating 5 MTD partitions on "gpmi-nand":
[    0.876974] 0x000000000000-0x000000080000 : "mx7-bcb"
[    0.879860] 0x000000080000-0x000000200000 : "u-boot1"
[    0.884761] 0x000000200000-0x000000380000 : "u-boot2"
[    0.886993] 0x000000380000-0x000000400000 : "u-boot-env"
[    0.894686] 0x000000400000-0x000020000000 : "ubi"
[    0.899054] gpmi-nand 33002000.nand-controller: driver registered.
...
[    0.960443] ubi0: default fastmap pool size: 200
[    0.960476] ubi0: default fastmap WL pool size: 100
[    0.960500] ubi0: attaching mtd4
[    1.636355] ubi0 error: scan_peb: bad image sequence number 1588722158 in PEB 4060, expected 1574791632
...
[    1.649889] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd4, error -22
[    1.650029] UBI error: cannot attach mtd4
...
[    1.670262] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,253)

Fixes: 8124b4a4a96b ("ARM: dts: imx: move nand related property under nand@0")
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi      |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi         |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi |  6 +-----
 .../boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi      |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi           |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts            |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi          |  6 +-----
 .../boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi  |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi          |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi       | 12 ++++--------
 .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi   | 12 ++++--------
 arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts     |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi          |  8 ++------
 15 files changed, 22 insertions(+), 82 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
index f452764fae00..547fb141ec0c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
@@ -36,12 +36,8 @@ &clks {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c3 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
index 58ecdb87c6d4..9975b6ee433d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
@@ -172,12 +172,8 @@ eth_phy: ethernet-phy@0 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
index 6f3becd33a5b..aa9a442852f4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
@@ -102,12 +102,8 @@ ethphy: ethernet-phy@0 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
index f2140dd8525f..85e278eb2016 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
@@ -73,12 +73,8 @@ ethphy: ethernet-phy@3 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	status = "disabled";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c3 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
index 131a3428ddb8..c93dbc595ef6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
@@ -260,14 +260,10 @@ fixed-link {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	#address-cells = <1>;
 	#size-cells = <0>;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c3 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
index d29adfef5fdb..57297d6521cf 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
@@ -252,13 +252,9 @@ etnphy: ethernet-phy@0 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	fsl,no-blockmark-swap;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
index 40d530c1dc29..2a6bb5ff808a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
@@ -133,12 +133,8 @@ ethphy1: ethernet-phy@1 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
index 776f6f78ee46..e34c8cbe36ae 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
@@ -101,12 +101,8 @@ ethphy0: ethernet-phy@0 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	status = "disabled";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
index 27e4d2aec137..a3ea1b208462 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
@@ -63,12 +63,8 @@ ethphy1: ethernet-phy@1 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	status = "disabled";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
index dc53f9286ffe..1992dfb53b45 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
@@ -296,13 +296,9 @@ &fec2 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	fsl,no-blockmark-swap;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c2 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
index eaed2cbf0c82..ec3c1e7301f4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
@@ -160,15 +160,11 @@ &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
 	fsl,use-minimum-ecc;
+	nand-on-flash-bbt;
+	nand-ecc-mode = "hw";
+	nand-ecc-strength = <8>;
+	nand-ecc-step-size = <512>;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-		nand-ecc-mode = "hw";
-		nand-ecc-strength = <8>;
-		nand-ecc-step-size = <512>;
-	};
 };
 
 /* I2C3_SDA/SCL on SODIMM 194/196 (e.g. RTC on carrier board) */
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
index 3dfd43b32055..43518bf07602 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
@@ -43,15 +43,11 @@ ethphy0: ethernet-phy@0 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-ecc-mode = "hw";
+	nand-ecc-strength = <0>;
+	nand-ecc-step-size = <0>;
+	nand-on-flash-bbt;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-ecc-mode = "hw";
-		nand-ecc-strength = <0>;
-		nand-ecc-step-size = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &iomuxc {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
index fc298f57bfff..83b9de17cee2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
@@ -60,12 +60,8 @@ ethphy0: ethernet-phy@0 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	status = "disabled";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &uart1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 8ec18eae98a4..2d9f495660c9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -25,12 +25,8 @@ usdhc2_pwrseq: usdhc2-pwrseq {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &snvs_poweroff {
diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index a41dc4edfc0d..8666dcd7fe97 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -375,14 +375,10 @@ &gpio7 {
 /* NAND on such SKUs */
 &gpmi {
 	fsl,use-minimum-ecc;
+	nand-ecc-mode = "hw";
+	nand-on-flash-bbt;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
-
-	nand@0 {
-		reg = <0>;
-		nand-ecc-mode = "hw";
-		nand-on-flash-bbt;
-	};
 };
 
 /* On-module Power I2C */
-- 
2.42.0

