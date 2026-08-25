Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9587F2E7393;
	Tue, 25 Aug 2026 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641467; cv=none; b=E965ZGPEHzQex5cAduKtwq3ZA7f2f72D0lvo/XZgrsh0BGlKtCxRs6wXL+zv0S8lhFAfoQZunmDbck2CiMTJwKjRKT4uJkqK23uIyGOBHk1vK0vx/TewLJLJIgFk1HFDc+ilYuAQ8B7I7UCWAGxki9O1Cacm58u7hb+IxdC4294=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641467; c=relaxed/simple;
	bh=+XP2bcRV0+zlnVJLeocDV1w3Ay19lBf40GOxXZN8xes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MSAIWKuZ0y5+9HW9bNCSPJRfz5w9dwAXc74ffnJe6YUweaXLYQFOAJYfNmVWr3TZVUgMl0rglJOL2gDl3lOD5UkouE5dhEHWNS0LT+4QXmpzvHs6ZnIVOlB/Flp2J6h4PlXGLKIeOKHprMugGEdlShwJIH7TAxo9AZjGyRMZCGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ih+qqdOZ; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ih+qqdOZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=yxVf1ZlFRAOlJwl6qpRF+rnH1dAXdUxZVv/8DjKqI6g=; b=ih+qqdOZdY5rYrKVZltsioMnap
	FHgg445KMLFcmSwpzs8oMWMIpsVVgZ7DHUntc/YMMiGFs+lIj8qwzqUSfJIDCAA3jBBzkuDLTxrGn
	PDt6CDDVgelvnx4VWAWYXdHlY9XxHHTDgdES9Xlm5e7jhMND3doHlcN7bg5CP689QE2dcYOU/zse2
	pPsEQgynI4BqSY/jWessUVgZKYAZAes+G7Z+Tj9v3b9J80vQvCK8zg7sav75Hu76laKwReODDFhEC
	rMGKEv8/Fc6yCJ5dAVFMnfQQ/GQdSY7L/S2hknWgEB876WQs6a71V9wKzxxOIn3Pe/fxf2M3smM3f
	WjsZXZ8g==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wylCo-000PBz-0f;
	Tue, 25 Aug 2026 09:04:22 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wylCn-000H2F-2H;
	Tue, 25 Aug 2026 09:04:21 +0200
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
Subject: [PATCH v2 1/2] ARM: dts: mba6ulx: Add Ethernet PHY interrupt support
Date: Tue, 25 Aug 2026 09:04:16 +0200
Message-ID: <20260825070418.2072708-2-alexander.stein@ew.tq-group.com>
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

With commit 417b0f8d08f87 ("gpio: pca953x: Add support for level-triggered
interrupts") the GPIO expander gained support for level-low interrupts
required for Ethernet PHYs

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Remove superfluous gpio-hogs

 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
index f0f886f2b8cfd..bec72dc6bab6c 100644
--- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
@@ -230,6 +230,8 @@ ethphy0: ethernet-phy@0 {
 			clocks = <&clks IMX6UL_CLK_ENET_REF>;
 			reg = <0>;
 			max-speed = <100>;
+			interrupt-parent = <&expander_in0>;
+			interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 		};
 
 		ethphy1: ethernet-phy@1 {
@@ -237,6 +239,8 @@ ethphy1: ethernet-phy@1 {
 			clocks = <&clks IMX6UL_CLK_ENET2_REF_125M>;
 			reg = <1>;
 			max-speed = <100>;
+			interrupt-parent = <&expander_in0>;
+			interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
@@ -276,18 +280,6 @@ expander_in0: gpio-expander@21 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		vcc-supply = <&reg_mba6ul_3v3>;
-
-		enet1_int-hog {
-			gpio-hog;
-			gpios = <6 0>;
-			input;
-		};
-
-		enet2_int-hog {
-			gpio-hog;
-			gpios = <7 0>;
-			input;
-		};
 	};
 
 	expander_out1: gpio-expander@22 {
-- 
2.55.0

