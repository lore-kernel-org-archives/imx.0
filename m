Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B0D1F9EB1
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 22:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736807379; cv=none; b=SgOdjRrdjFP2ne6BzADZN4IRLK12yHxl8Xy4otzgv9vjl19JIAM0PO5GOhVDys4nJs+YPSRhYM8GIx4hDgP4VG2TvQRjAshddPtEAhRN3Pt7/482s89fOd9N/AooyccJuDXZFxvBx8/8bPVQwXAIFzgcTlOrMP5N194/xj5+x18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736807379; c=relaxed/simple;
	bh=cpweuWgxiS61FjEy/a/e/EZroYgZJXsoVlHjLj5oLeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kPw0K7e6CyNeuB9CkOLKE8xqtMHkhNM+uhc9vJeb2HbQYKcBljcWaS8GncrdSDQC+dtdG0IfN83X8um8C9LdvpB6TnH2LjOCee0wQRaSOAJuQzeVajWmuuDKuAaHF7EOyE5lvV3riqw2ZGW03WvoPUZRMZALUSrP9D4KH7RAfMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSvv-0006tx-5p; Mon, 13 Jan 2025 23:29:19 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSvu-000KaG-0v;
	Mon, 13 Jan 2025 23:29:18 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSvv-008syM-1I;
	Mon, 13 Jan 2025 23:29:18 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 13 Jan 2025 23:29:06 +0100
Subject: [PATCH 2/6] arm64: dts: imx8mp-skov: add basic board as fallback
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-skov-imx8mp-new-boards-v1-2-75288def1271@pengutronix.de>
References: <20250113-skov-imx8mp-new-boards-v1-0-75288def1271@pengutronix.de>
In-Reply-To: <20250113-skov-imx8mp-new-boards-v1-0-75288def1271@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

From: Oleksij Rempel <o.rempel@pengutronix.de>

All Skov i.MX8MP boards share the same baseboard (modulo revisions)
and are booted with the same bootloader image, which samples some
strapping pins at startup and determines which kernel device tree
to use.

For use as bootloader device tree and as fallback, when no matching
device tree has been found, add a basic variant that doesn't configure
any variant-specific peripherals like displays.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/Makefile              |  1 +
 arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dts | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 839432153cc7ae15d3c1e668c0cb192d5563b996..ea4da899b44be0aaac745f6a0503bed3bb8ba20c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -193,6 +193,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-smarc-universal-board.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
 imx8mp-phyboard-pollux-rdk-no-eth-dtbs += imx8mp-phyboard-pollux-rdk.dtb imx8mp-phycore-no-eth.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk-no-eth.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-basic.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dts
new file mode 100644
index 0000000000000000000000000000000000000000..5a2629f3567c6ce664ddad9a49f51829b3f54bd5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "imx8mp-skov-reva.dtsi"
+
+/ {
+	model = "SKOV IMX8MP CPU basic/fallback";
+	compatible = "skov,imx8mp-skov-basic", "fsl,imx8mp";
+};

-- 
2.39.5

