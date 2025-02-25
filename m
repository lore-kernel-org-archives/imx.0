Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163DA207DE0
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 12:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740485256; cv=none; b=PAs8DI7z4Nlwg707p8NsOdf/xIfXPAxQCOlQe1/BByhb5OVQxwsbWYuO60Kd33ilmkdqJkvLoHYWtCZi/lugaDYatkvnpes2pPbxISZIuzWAVS3S/DbSd1hPcmGQsfV/sT7Ysxpu/+L05/NVB92LSm7aYPndmfFF2kFgdar/rbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740485256; c=relaxed/simple;
	bh=19NJbungl9hZx6mGNRWPf1F9WxtvUR9pblNC0dEkMiY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O9Yj4cs6Z1qFwo90jrwiqaxyaGszTQ0oHR71H0azGkPOTBZYdr1sSEyS9p9hSqTHXgEOSpXJtXRjnYD4SUuDQlpx1fXnASW/9crvA32nTO+EB7LC8Kcm49BGeK2YUWeOE7dG6T3/f1Fgh0ChqTDjad2YQZJk+O4SSvlGdTr08WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1tmtie-00055V-WB; Tue, 25 Feb 2025 13:07:25 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: "robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, Sascha Hauer" <s.hauer@pengutronix.de>
Cc: kernel@pengutronix.de,
	aford173@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: imx8mp: fix micfil dmas settings
Date: Tue, 25 Feb 2025 13:07:05 +0100
Message-Id: <20250225120707.2658709-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250225120707.2658709-1-m.felsch@pengutronix.de>
References: <20250225120707.2658709-1-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

The third dma cell is used for priority information not to encode
something else. The NXP downstream kernel use the third cell to encode
more information:

 - Bit31: sw_done feature enable/disable
 - Bit15~Bit8: selector
 - Bit7~Bit0: priority level

but this was never mainlined. Therefore drop the further information and
just specify the priority which is 0.

FTR: The sw_done feature was mainlined without making use of the
devicetree.

Fixes: 5c6d04e48197 ("arm64: dts: imx8mp: Add micfil node")
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..af51f1caa71a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1544,7 +1544,7 @@ micfil: audio-controller@30ca0000 {
 						 <&clk IMX8MP_CLK_EXT3>;
 					clock-names = "ipg_clk", "ipg_clk_app",
 						      "pll8k", "pll11k", "clkext3";
-					dmas = <&sdma2 24 25 0x80000000>;
+					dmas = <&sdma2 24 25 0>;
 					dma-names = "rx";
 					status = "disabled";
 				};
-- 
2.39.5

