Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664B52DA756;
	Tue, 18 Nov 2025 21:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763501765; cv=none; b=HU+KYMf7HfedsxWi0fdQrWhlLKFXAz1PxIqmLUmkKdJwVKps0scdff6nZXWAfxCQnnbu29q7Gu7NFrldN8WLjBB0V8iBbjy/5TKWotQ8tZI2t1XE1hf5J9DX+QDDKKdcc5IwPlFCQW3uUt98WtQbeOi8+Z02XfU774htB9mp2UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763501765; c=relaxed/simple;
	bh=b1uwEjQ88F7sIXoukh2YUwPZjQK4En6hofzj3LhP+ow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nLY6Qp8xn5PPNlvna6exk1LF5LO3qi3dyC/7MX7hU1NiLGfVADrNbT9DT/DSMLkRvzrUhIKBkmzjYlYlIgQfG2gPkSwUCHNDIyQWboF+kS8eas3uzo80uKe7KaEQkMtezs8W6rFF2E1TUB3CRpZPT0rHR44T79tOUWxVZ9szWCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2drhGzL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2drhGzL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E351EC116D0;
	Tue, 18 Nov 2025 21:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763501765;
	bh=b1uwEjQ88F7sIXoukh2YUwPZjQK4En6hofzj3LhP+ow=;
	h=From:To:Cc:Subject:Date:From;
	b=c2drhGzLUR+9NsY2j7pn0GQGI77lVDcgKBxtWrumeqahNIORPuLPKnbS4Oty5Hl2O
	 s5QwLPsZclcWfvEbcKJy3C7mEArxiUg6cVxxj1B8z9RNchZ5M6rYdqtu66Grs0XYye
	 hduYwBGA6li2Q9+W0brAsN6RceLoH3ETv58ihqePvf/rVNNcs/d8u4jQhHuuGWzgZi
	 ew/3sjC/M+XxNuqPCR7jLoc3EFI2qyCCmeC7VrCVBRos12bxZH0+EXm9OAVA/vtJNP
	 C+mHiN3KGpjg1lcNUdLTUFAe0nioWDoOvrbArKmnhUrV4CpmrnsQd/x3uo68clr5Bp
	 eCc9cBY8CD0Ew==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: nxp: imx: Fix mc13xxx LED node names
Date: Tue, 18 Nov 2025 15:35:50 -0600
Message-ID: <20251118213551.44116-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Node names are supposed to be generic and use hexadecimal unit-addresses.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts | 8 ++++----
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts           | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts      | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts       | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts
index b8048e12e3d9..5398e9067e60 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts
@@ -248,14 +248,14 @@ ledr3: led@9 {
 		linux,default-trigger = "nand-disk";
 	};
 
-	ledg3: led@10 {
-		reg = <10>;
+	ledg3: led@a {
+		reg = <0xa>;
 		label = "system:green3:live";
 		linux,default-trigger = "heartbeat";
 	};
 
-	ledb3: led@11 {
-		reg = <11>;
+	ledb3: led@b {
+		reg = <0xb>;
 		label = "system:blue3:cpu";
 		linux,default-trigger = "cpu0";
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts b/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
index 06545a6052f7..238138c4ee72 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
@@ -398,13 +398,13 @@ leds {
 			#size-cells = <0>;
 			led-control = <0x0 0x0 0x3f83f8 0x0>;
 
-			sysled0@3 {
+			led@3 {
 				reg = <3>;
 				label = "system:green:status";
 				linux,default-trigger = "default-on";
 			};
 
-			sysled1@4 {
+			led@4 {
 				reg = <4>;
 				label = "system:green:act";
 				linux,default-trigger = "heartbeat";
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts
index 26eb7a9506e4..1598bf4f4991 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts
@@ -225,13 +225,13 @@ leds {
 			#size-cells = <0>;
 			led-control = <0x0 0x0 0x3f83f8 0x0>;
 
-			sysled3: led3@3 {
+			sysled3: led@3 {
 				reg = <3>;
 				label = "system:red:power";
 				linux,default-trigger = "default-on";
 			};
 
-			sysled4: led4@4 {
+			sysled4: led@4 {
 				reg = <4>;
 				label = "system:green:act";
 				linux,default-trigger = "heartbeat";
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts
index 19a3b142c964..c2dcfd44c445 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts
@@ -153,13 +153,13 @@ leds {
 			#size-cells = <0>;
 			led-control = <0x0 0x0 0x3f83f8 0x0>;
 
-			sysled3: led3@3 {
+			sysled3: led@3 {
 				reg = <3>;
 				label = "system:red:power";
 				linux,default-trigger = "default-on";
 			};
 
-			sysled4: led4@4 {
+			sysled4: led@4 {
 				reg = <4>;
 				label = "system:green:act";
 				linux,default-trigger = "heartbeat";
-- 
2.51.0

