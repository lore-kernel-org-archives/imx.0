Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B13C14C5A9
	for <imx@lists.linux.dev>; Tue, 25 Jun 2024 12:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719317502; cv=none; b=AR82dmeGB1YoFZvaKcBbwNjmTlxVfXbnOVH8Clcl4n4rFf9eYsNmF6bWEcmYTmv9WWJj3aLB50oCCqeKnM5XdfBhlsYdbOowpxTEgA/OwQ0nRSiFFwTPyloYa3qtYZa2hWAcB3o6EiLyK/VkZyTT/1f5pRKEtIXpcUSqrdxlpSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719317502; c=relaxed/simple;
	bh=kJ20RIvaQVBfGkZV70rOsMuHD/YUxhE/PIjVtCnQr6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cZrvJ8Tkn7hLRjYnhTVecYx3ga12Tj1tvSm0MqwSjBXbkr4O5k5tRxyw6ThNYYWoufx/Ovpwt7UmxPHKi7JLi4gdClxK1Cz1voicuuWM5ZHL6i97DxIP71a/9h9UeTu4CnjmH530MV1KFkGhltpheyMFvJqFrg9C4VYIX9Tnfqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Z2cJEqQV; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Z2cJEqQV"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0E66C88387;
	Tue, 25 Jun 2024 14:11:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719317499;
	bh=4+Vey7en+McPd60Fje5j5Ee1S/jDZwLudtQwRls0e8w=;
	h=From:To:Cc:Subject:Date:From;
	b=Z2cJEqQVwNRuAO4JcXFl4k2KEPFQgm1PICYaJWn9Zb7P5Vajo31hgxrUO6Ng1ytfx
	 8qxeCmt9tevDg2x8XZEyFYIsyoB+k/rWDaQhFIaBVPXlIuFCj6D2AzGIovHsfjBNwg
	 oVZ6ZQGUc0WJmEXP8TOqhSqsJu4tJc6qaaIFDzuM9XmR+IZWT5Eh7f+4uvppQ3Pfwg
	 E0F3s4L3Ubmg97j5KOdd0t327nDNIWfloJHSquUmB4qMuHilk5VcU3hcWxaJfe7obt
	 mDsE7C8014HjePGhTqEnoRYCoUbiAnjNrCxDc/IRWK1JaDWuV0zLUp4MKaimk6eqJj
	 9pWd5grLMt33w==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com
Subject: [PATCH] arm64: dts: imx8mp: Do not reconfigure Audio PLL2 on DH i.MX8M Plus DHCOM SoM
Date: Tue, 25 Jun 2024 14:11:09 +0200
Message-ID: <20240625121128.145993-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The DH i.MX8M Plus DHCOM SoM uses Audio PLL2 to supply clock to CLKOUT2
output. Those clock are used to supply on-SoM TC9595 DSI-to-(e)DP bridge
with RefClk and must not be reconfigured, otherwise the bridge cannot
work correctly. Stop reconfiguring Audio PLL2 on this SoM.

Fixes: f560da940e32 ("arm64: dts: imx8mp: Initialize audio PLLs from audiomix subsystem")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
index 5444be6f0ec2d..848df53c48685 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
@@ -78,6 +78,11 @@ &A53_3 {
 	cpu-supply = <&buck2>;
 };
 
+&audio_blk_ctrl {
+	assigned-clocks = <&clk IMX8MP_AUDIO_PLL1>;
+	assigned-clock-rates = <393216000>;
+};
+
 &ecspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi1>;
-- 
2.43.0

