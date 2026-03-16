Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E7C39A06D;
	Mon, 16 Mar 2026 13:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669513; cv=none; b=LsCiBsR5juHGeKVkxMFLmMAd3YKE0I2v+DVANPJ/bhaGnZAosmO/CpUtKmZNzTZrcvEqGFPc9bRK/3o2izfj0EpJzRAlSTvfXkAcLxsiR0XtSnSUJjEjV9czMOSnw2UTckV0xD3EXekPhJNZypAmUa2YU1T0CDRHnfoV6InL2aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669513; c=relaxed/simple;
	bh=/Bu8wMtYfW3t4Yc3OXoEF78nXIn5uE5wll8mUoXueEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gg1Z8iNjnniN/IY7jOrPqTq36EkNBEYTnL5CqDqBCVJ5324Y27bU0gbsXY6nb2fjmRhdhale82wlUVf4Bgrc3LW6YehNMSVcMH2KexOQAqWV2wXjpLflzRaUkMPGWx/0XFu18xIaFT+hgXktFL9fUnJ1kPctlZtEBCFQEr6sa+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jkdhjNHx; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jkdhjNHx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=/fbpvVRIIYo0Hxz9yanMj6qxUU+5nxJuF8pCU2fdjBA=; b=jkdhjNHxr5e4o/aTy+3iWCQfq8
	HucenOyYaiq82UAOUBtc+NGHIaQH+xaxxQ5Ib8t9i0Wd4hTiiiVGOX7PbPeyKZYVsxvgIl3TRz2Xa
	nm8STPHJHmoeC1UMzYWKK4lCGMGtn4DYECKjzoJG6TxjxgHMgbXP/unC72sveqsak4avTM83Q00pA
	CAbl2nunBiTRfCm/r3+m/QlL1Zlk7vjqDRFu293MRFON0vQDEHc1f/5ms3UOQhOpyxZkV4QVSKI3U
	d8+vOyIn9XJf3gPCP33VlI+oTVwQ4hbXpXkMdDiPvR+NLr7YnYkWNn/Q2zrahsvcQr+b3lm4aCtP7
	GiXFuR/g==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w28Se-000Ll9-0I;
	Mon, 16 Mar 2026 14:58:24 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w28Se-000LMt-0R;
	Mon, 16 Mar 2026 14:58:23 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH v2 1/2] arm64: dts: mba8mx: Add DSI->LVDS bridge IRQ
Date: Mon, 16 Mar 2026 14:58:18 +0100
Message-ID: <20260316135820.760073-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27942/Mon Mar 16 07:24:14 2026)

Now that the bindings supports IRQ, add the IRQ line. Add a GPIO label
as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 arch/arm64/boot/dts/freescale/mba8mx.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index 10d5c211b1c9b..c24ae953cbc25 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -209,7 +209,7 @@ expander0: gpio@23 {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		gpio-line-names = "", "", "", "",
-				  "", "", "LVDS_BRIDGE_EN", "",
+				  "", "", "LVDS_BRIDGE_EN", "LVDS_BRIDGE_IRQ",
 				  "", "", "", "",
 				  "", "", "", "";
 
@@ -298,6 +298,8 @@ dsi_lvds_bridge: bridge@2d {
 		reg = <0x2d>;
 		enable-gpios = <&gpio_delays 0 130000 0>;
 		vcc-supply = <&reg_sn65dsi83_1v8>;
+		interrupt-parent = <&expander0>;
+		interrupts = <7 IRQ_TYPE_EDGE_RISING>;
 		status = "disabled";
 
 		ports {
-- 
2.43.0

