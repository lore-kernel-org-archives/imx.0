Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DA84400
	for <imx@lists.linux.dev>; Sun, 26 Oct 2025 12:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761481074; cv=none; b=biyR+jeZktR0SWN15sHJLUTEd1QlS1Hag5raDuLHOpP1yKdc9S+L2BnkWLjCN+BD98mwe4x8BP5L/TsyzFzQ70hFrPmcvHQ7xVunhgAz2X8I/f1PvjUO6Ehu5wGqZTWM87n/xNOXU1UcWBv8diMwUmFbmpb5ZenykkASu4e59qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761481074; c=relaxed/simple;
	bh=pHvVW51hUAo2aNW/gQRr/0MjdLTqCw0S3nlYseOuy+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lxmy/hv9+QC+j/6NOx9DBb2f73A63bnywhNP0Qa+qlpBm1ZwtHsA/rIaPF7ApZp//G8oKULwKpuKDMacjJt8KG1/YxEEOrOtwhxC55gNyOX5a2LDrzvpU6RsDzqISqDwYN5ggoyNou9vGNazSSe295dLm3hDqJuPZhmYEszi6+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sspobyoC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sspobyoC"
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 89E40AB4;
	Sun, 26 Oct 2025 13:15:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761480957;
	bh=pHvVW51hUAo2aNW/gQRr/0MjdLTqCw0S3nlYseOuy+s=;
	h=From:To:Cc:Subject:Date:From;
	b=sspobyoCwiECwCsLChzGMnceyt/ZBkjgTq795NxsuiqU436Q32dlAoRnsDk3lXGup
	 3TwotcpVaEDAwPO5+dDkp0uHAk02WQPCg1Pb5moBX5nJpV8JA9BZkqm8NyZDT0QdOR
	 sXOw+5zgrGzzDipOaxfxzGGgNvyY6r7i6NMeRdl8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] arm64: dts: imx8mp-debix-model-a: Fix ethernet PHY address
Date: Sun, 26 Oct 2025 14:17:29 +0200
Message-ID: <20251026121730.13197-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RTL8211E ethernet PHY on the Debix Model A board it located at
address 1. Replace the broadcast address with the correct unicast
address.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
index af02af9e5334..9422beee30b2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
@@ -96,9 +96,9 @@ mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		ethphy0: ethernet-phy@0 { /* RTL8211E */
+		ethphy0: ethernet-phy@1 { /* RTL8211E */
 			compatible = "ethernet-phy-ieee802.3-c22";
-			reg = <0>;
+			reg = <1>;
 			reset-gpios = <&gpio4 18 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <20>;
 			reset-deassert-us = <200000>;

base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
-- 
Regards,

Laurent Pinchart

