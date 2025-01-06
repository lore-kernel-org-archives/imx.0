Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0FA50285
	for <imx@lists.linux.dev>; Mon,  6 Jan 2025 16:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736179615; cv=none; b=L4pJERImsGIVOa80Ti/8SXboEdZV2j0wbkSiOt/tXrA5WUnDNX1t0x+Cw2/Y0IYCpudw8pNXYF7oZg/Q37Xn0U9Zn86IgZFwH9N5rR7jIqgZF2qUu6sKjHUUc3bw2h436X5/OOxdeXtH/orXNvUkFroP4p8B0j8UQyzGj3Sr4DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736179615; c=relaxed/simple;
	bh=epyeyFWrPSKFrbyQDj9Jy9cDAw40zu4ax9Vb5wnxX/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P9pnltnw5zx+TqSdDxPuQwrjifvKq+vmFQoXDe6fCyphC8mSjVWcpUhryV9zdZ5Y4Kfmki07it2qz3Si7Yay+MFCOMOjARyoJyzKwR2vbgA7ib3cGLq4sUkzRg04EhGqwhffDElG3PrrtQP68G0QBpNd6zmMiSuSf3TsGQFy1mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcx-0000C4-KB; Mon, 06 Jan 2025 17:06:51 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcw-007C9m-0u;
	Mon, 06 Jan 2025 17:06:51 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcw-009dVc-33;
	Mon, 06 Jan 2025 17:06:50 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 06 Jan 2025 17:06:37 +0100
Subject: [PATCH v2 02/10] arm64: dts: imx8mp-skov: operate CPU at 850 mV by
 default
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-skov-dt-updates-v2-2-4504d3f00ecb@pengutronix.de>
References: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
In-Reply-To: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 Frank Li <Frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

The Skov i.MX8MP boards are passively cooled and heatsink is specced for
continuous operation at 1.2 GHz only. Short bouts of 1.6 GHz are ok,
but these should be invoked intentionally, not as part of
suspend/resume cycles.

Therefore, configure RUN frequency as 850 mV and remove the higher
voltage operating points from those permissible for suspend.

Fixes: 6d382d51d979 ("arm64: dts: freescale: Add SKOV IMX8MP CPU revB board")
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
v1 -> v2:
  - no change
---
 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
index ae82166b5c266a96441809958c56b6c8a7ef5e3d..7ae686d37ddaca7a323e2cb1ec7d807c2e3bd3f5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
@@ -163,6 +163,19 @@ reg_vsd_3v3: regulator-vsd-3v3 {
 	};
 };
 
+/*
+ * Board is passively cooled and heatsink is specced for continuous operation
+ * at 1.2 GHz only. Short bouts of 1.6 GHz are ok, but these should be done
+ * intentionally, not as part of suspend/resume cycles.
+ */
+&{/opp-table/opp-1600000000} {
+	/delete-property/ opp-suspend;
+};
+
+&{/opp-table/opp-1800000000} {
+	/delete-property/ opp-suspend;
+};
+
 &A53_0 {
 	cpu-supply = <&reg_vdd_arm>;
 };
@@ -253,7 +266,7 @@ reg_vdd_arm: BUCK2 {
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <3125>;
-				nxp,dvs-run-voltage = <950000>;
+				nxp,dvs-run-voltage = <850000>;
 				nxp,dvs-standby-voltage = <850000>;
 			};
 

-- 
2.39.5

