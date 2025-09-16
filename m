Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEE423E340
	for <imx@lists.linux.dev>; Tue, 16 Sep 2025 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758011405; cv=none; b=IYA1ivCFkv3OJC6DmlTLPzAhvWnS/r3CLJqdQPo1lrbHupRrVHGx6p/9l6j3Y/Zk0W4wWrLIqsUgCXodD7z4/lYU2ehSZC0yJiLXXH+K/vuQ1+IOaqKHupZq3zYHiJVlXSAcbe/cwBf8r0s9Y6rMqh/NagBM2BVGoaZ/fOTudY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758011405; c=relaxed/simple;
	bh=HVbIzOcHZskHRf5SznhNV4wWnLjusxqzCBiv5nWH07s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T3Q8Sc6rbNwh1pIcrhUQ/vTYvJV+FeAyYdASkxLBvwAMZzmPFo/mKgWkVDOjbuZaBJkkQPXgKXCNA2L/mrtbW62MMdeCZs085Lb57Ndk+Gvy/at+HJOT2CRKHQEiGGrDDASdf6AEtAXlKC8gVo5AVnPXgk/ZT3mLLFi3EMqJYdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=iyB2znBo; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="iyB2znBo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QFHkS1lPBT+AjGDdgvjYNAbwA9MZWw4SXPOZu4+lgPY=; b=iyB2znBoseHu0jTafvRYZ/tHV/
	t5oRN4BqVkqtNdTEvc4n1LuRqOijddFTqW9JDVjvF2muCB93RM3lfr9dNBdBkWoQBWJf3A4dlVPos
	EuvWnEJOS0GXzKpY4X0Q2tYTIBWbViPVWDI9CywpY2Kf0wVYmrs6E5Y/hUc8HxAOjN7Zm4qCefjla
	yCCxMaJs2wzQX4ms7F1iciIqLo7ztBIzZ6A8exX61Cw0MfVap9OYjXYYEm8lyrJtKdsPMY/7Qr7yv
	g91Nk6FXn1cT6eSzOUOiLbibVBtBSn8+WO59cxuONw4DP+P9yM6Dxw4/tjYeRpv5MAMSVh4NgXPKc
	LhBvSq4Q==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:37984 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uyQhx-0000000DK9c-3gTH;
	Tue, 16 Sep 2025 10:06:36 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 2/2] arm64: dts: freescale: imx93-phyboard-segin: Add USB vbus regulators
Date: Tue, 16 Sep 2025 10:06:35 +0200
Message-Id: <20250916080635.1520551-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250916080635.1520551-1-primoz.fiser@norik.com>
References: <20250916080635.1520551-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add USB vbus regulators to silence the following kernel warnings:

  usb_phy_generic usbphynop1: dummy supplies not allowed for exclusive requests (id=vbus)
  usb_phy_generic usbphynop2: dummy supplies not allowed for exclusive requests (id=vbus)

Because generic USB PHY driver requires exclusive vbus regulators since
commit 75fd6485ccce ("usb: phy: generic: Get the vbus supply").

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../dts/freescale/imx93-phyboard-segin.dts    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 802d96b19e4c..ac64abacc4a2 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -59,6 +59,22 @@ reg_sound_3v3: regulator-sound-3v3 {
 		regulator-name = "VCC3V3_ANALOG";
 	};
 
+	reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_OTG1_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_OTG2_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -177,6 +193,14 @@ &sai1 {
 };
 
 /* USB  */
+&usbphynop1 {
+	vbus-supply = <&reg_usb_otg1_vbus>;
+};
+
+&usbphynop2 {
+	vbus-supply = <&reg_usb_otg2_vbus>;
+};
+
 &usbotg1 {
 	disable-over-current;
 	dr_mode = "otg";
-- 
2.34.1

