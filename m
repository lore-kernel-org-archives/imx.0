Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C69E5235
	for <imx@lists.linux.dev>; Mon, 20 May 2024 06:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716184954; cv=none; b=JEa/ldPsF/oj1Zv8cDb7JhC804E7er7ZpPuk3zc8CObazRwNrRsgkNYCgD1Ezt8FKxP5F0F3GtA6jUUzjkZ3URY8Z+demv5Jy6alOdgHhAH6NpsqQsMz0yJGqUQkEjxCl6hBD9Dlk/NVvqT7igs6F/gzwxbLVZkmRxBDfchE4d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716184954; c=relaxed/simple;
	bh=Kk+hKlkm8j3/4MUcgS0+ybEk+JXXrdmv8W1xFjpJZeI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=KN42gHCL9FFh0qHFhCpHxeOr3KegJ43fvzCgnz5hN2yUCkoNGGFTjVKdf5xzTQ61vF4QjytvBCaRFywkNEy5Bxc6oUajNG+9zNYZfIhB9Numwz91mAZEO+6phgeJ6Jl4fPbpNBlwkX4QK3iI+63dqI0Vyv5wCen+9SYVOqIo7mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/UYTdwC; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/UYTdwC"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5206a5854adso2516755e87.0
        for <imx@lists.linux.dev>; Sun, 19 May 2024 23:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716184951; x=1716789751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1LQlzhEzOG8t8n4JgFMN8rtNdoenYFCDtUlbUryUBdc=;
        b=Z/UYTdwCF2xAa9YXe6wN3evdDSUu+QcHo3/is/C5v6Mog5Xhe82XQNQhXce9rs3G19
         g86oUiKjBlJWsXwpGI4bIE9GGysmyYX5AyIPDB02kYAkkWmd/l+XAlLFaP+td7/oZmup
         Rh7jL9+323hwU3AhP/ByrZnMCLPIqSKdJMNdPenMjHfFPh0xMamhs/d4noZ/gVHx7vlm
         GWoIBVrILsP6NS5YMTgmnSnstxtsQ0yZTijZPI7wDsZp37xSBl4Mo5LCIcoWw6J0cIkQ
         97Hky2owd1y4LT/hOMBflog3mM/nmjP7vzHmaq1Qtx2Px8cJuVdjOl+5cm/CWRGER8zs
         e6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716184951; x=1716789751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LQlzhEzOG8t8n4JgFMN8rtNdoenYFCDtUlbUryUBdc=;
        b=Elm51mPoj+/GYy+AfxdV1nG1lth2ar53GrChlj7KxXdgnUjaVJ2DJP05yYS5kfEcZk
         S4QQHXmASVvZ8zdGj60le1VZEU7F4uYZuMF2Ztmelz7tLCIQ6SJffmVN4C/kVigkuAm2
         psMV9JvjWGQDpMHW6iETBUsjDbroHiCkFXpVg7VskVSyYIH4Uwk7FdmI+YnXO7/rGp/l
         e7BYv5OFENJ4rtcL17VPVWJwPgofj9gEH+Vlxrr+jV1jFWl5M5ub5C8Ld+9ZsFcT0pFG
         nr8AbBs9hRydd+iooA2kW8YMJVUxFxNai9IYRGOSRqBcRYefFKbXXL3Ks+Y+1wjVT++R
         9Fiw==
X-Forwarded-Encrypted: i=1; AJvYcCXeREEb2qZQBVw3EwZ4ljGhTnPPyKLLuGM4yzqgq5zYE88l8mLfcBoz3/rx8D3uAr0XDT//i82zcoFvMqdjHV2VNmZP
X-Gm-Message-State: AOJu0YzEyS13ZamVwHsn5l9e9YlxL3QogmZcJ8uFY1XzBmb8xujYCeLv
	uRflnM+16iUlWXVAftDN1CMheaX8AfqE2pCG0BaYsTsPYy5H7Erg
X-Google-Smtp-Source: AGHT+IEUMxwsdn95GJ80iOIBJ473ZyoaAkcwkF09a1jEP5o+o5PJFPWaXYkUTeHTv6cakuKO48xQ/A==
X-Received: by 2002:ac2:5f89:0:b0:51f:6a38:be0c with SMTP id 2adb3069b0e04-5220fc7d370mr17303695e87.22.1716184951262;
        Sun, 19 May 2024 23:02:31 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c323887sm14759024a12.89.2024.05.19.23.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 23:02:30 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] ARM: dts: nxp: imx6: convert NVMEM content to layout syntax
Date: Mon, 20 May 2024 08:02:22 +0200
Message-Id: <20240520060222.2980-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

Use cleaner (and non-deprecated) bindings syntax. See commit
bd912c991d2e ("dt-bindings: nvmem: layouts: add fixed-layout") for
details.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi | 12 ++++++++----
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi | 12 ++++++++----
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
index 238f3af42822..807f3c95e3ce 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
@@ -22,12 +22,16 @@ m24c64_57: eeprom@57 {
 		compatible = "atmel,24c64";
 		reg = <0x57>;
 		pagesize = <32>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 		vcc-supply = <&reg_mba6_3p3v>;
 
-		mba_mac_address: mac-address@20 {
-			reg = <0x20 0x6>;
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			mba_mac_address: mac-address@20 {
+				reg = <0x20 0x6>;
+			};
 		};
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
index a587bc88f76f..789733a45b95 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
@@ -32,12 +32,16 @@ m24c64_57: eeprom@57 {
 		compatible = "atmel,24c64";
 		reg = <0x57>;
 		pagesize = <32>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 		vcc-supply = <&reg_mba6_3p3v>;
 
-		mba_mac_address: mac-address@20 {
-			reg = <0x20 0x6>;
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			mba_mac_address: mac-address@20 {
+				reg = <0x20 0x6>;
+			};
 		};
 	};
 
-- 
2.35.3

