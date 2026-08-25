Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963BC38423D;
	Tue, 25 Aug 2026 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641467; cv=none; b=lfxk7Dc5KKV5YBTewmLcif6ZPlP6d14AwCBJwZkbvlXNoagGfZ7eI7xo/ODSELfKY0uwdlSA0dnSaVDtTAeXpakws4esx9iyLsKcqp4MswkdUlNSFMEijvlMvQqNtQdnycESyjUB8cMaajtPZSlYj8ThBz7Z7FFITyzkeuw6GoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641467; c=relaxed/simple;
	bh=A/rdm0oCoGwlHgo1ttsuGnQZZ0myKSDSg9vwERuxqeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HbMt+0zrzNRA2v4ZscO4yYTEPYoO9BzNarYTqK0hdAkka4xewW/KDgiGboX2to16X2+4efFuGezQQWLp4QtB+wE7dyCyAhFSmiTcsVbCD0bdFziPfpmSzI+makdYbI3IJdXtbbSUmzWa3+82E1qmSyPRPy6yZb1wNKCXpg6/yEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Jtt9fJxw; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Jtt9fJxw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Xu+B/RB1MRzg0mu5Ko2Z6+LTrXJRjxET82eLEIkNpB0=; b=Jtt9fJxw5+1aAGBc6g1M8Dg0l4
	5e40E1q1m3XI4ZQ9VgbYrrD+khc8UT1k0p9CSGhgqp0zI4jSbdS3qDkeNdBisX4gknfdPGEE9ldd2
	HPAjAiCst2lkFpJhhyAzA0xITiKmHHLw3Vvyl9DUvnST1InOzB6dRSHVvTqWv0UurYrdVQtlOZZOm
	VVElrT7yk883PKcYddoF/IbWFz7BKc3M5+eHg2RNZG2cgBsF4bx5K3nYH2YE1RLb3rAqGxV/Lt9oQ
	wvKbXtvHpAtz98fiHxihY3neugFkhjyS7YHlqHmiweGSRwedaLXvXzys6kTxlW7HGm5aReht5UNvi
	EqY4ixFg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wylCo-000PC5-23;
	Tue, 25 Aug 2026 09:04:22 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wylCo-000H2F-0G;
	Tue, 25 Aug 2026 09:04:22 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: dts: mba6ulx: Add USB hub node
Date: Tue, 25 Aug 2026 09:04:17 +0200
Message-ID: <20260825070418.2072708-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825070418.2072708-1-alexander.stein@ew.tq-group.com>
References: <20260825070418.2072708-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28102/Mon Aug 24 08:23:58 2026)

Instead of handling the USB hub reset using a regulator, add a proper
on-board USB hub device with reset-gpios set.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
index bec72dc6bab6c..ba79bb9760806 100644
--- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
@@ -133,16 +133,6 @@ reg_mpcie: regulator-mpcie-3v3 {
 		vin-supply = <&reg_mba6ul_3v3>;
 	};
 
-	reg_otg2vbus_5v0: regulator-otg2-vbus-5v0 {
-		compatible = "regulator-fixed";
-		gpio = <&expander_out1 0 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		regulator-name = "otg2-vbus-supply-5v0";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&reg_mpcie>;
-	};
-
 	reserved-memory {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -395,10 +385,18 @@ &usbotg1 {
 /* 7-port usb hub */
 /* id, pwr, oc pins not connected */
 &usbotg2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	disable-over-current;
-	vbus-supply = <&reg_otg2vbus_5v0>;
 	dr_mode = "host";
 	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb424,2517";
+		reg = <1>;
+		reset-gpios = <&expander_out1 0 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_mba6ul_3v3>;
+	};
 };
 
 &usdhc1 {
-- 
2.55.0

