Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41595199920
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 21:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766523969; cv=none; b=P/eZEW+1HL7fsxBguG/oBMVQKyiS1E9Nox5EkGFzT8LO5yKBjnq9jt4hm4bXiv9xmcK4EstpMCID9VOfd3X/sWaUuGDjO9a+CBbCJe78slk1pFtag3Lv7fgjSokSViNtrDXrtw4bMXVPUIN8zSHs8Z4rAEIFe66+o7WL+EeFiyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766523969; c=relaxed/simple;
	bh=0lQCY9+NvII7vyq2Wrfozp9yDqbJh+Ps7dDexIi6QHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bcfH+1gMk7yYphH5HTTQRowDitvcZMd/ls9OrNoAJPWSuUqYPdm/GK38R25TA/dyrnAFINtoa/L5kPLr0BDgHGi6CVNmqG1iHXgf+mMixq9kBDYcNeGxqoBF0RLo1gQ9FJ3sMlMn2eg2xuMTFZTrLBTf2gFTV3AMgSWWudu5eL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=aMi5+Q6z; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="aMi5+Q6z"
Received: from mail.andi.de1.cc ([178.238.236.174])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1vY9GC-00000003SPm-189Q
	for imx@lists.linux.dev;
	Tue, 23 Dec 2025 21:45:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=EcsX7uDCRbuiIl7dRX9wEcE1RLO3su8HcpACXdkFO24=; b=aMi5+Q6zkrPr2C6QMte8X/foa+
	jnRGVZVtGnyNTnlY/inifpOS8k//RLQIMkzC/afsiWeqzGULo9mTp7q0PurVZci5VHXFxranOUfFX
	W2OAAclI1Yc4061BqFnh+oRAUzEY381eZZf4Rz+10wUHN6oDRKKOTUG/hNfyF/s7xIdT1/5/EVoxy
	/xnREGfJQSnGNR2kuukYTZouR8N/KynsBSvNvTgt8iSrLHzaVc7J4c0Wa/CC+0KQueQmwFtm9MKSh
	dRu7n4HHlATmQeX7ESnUDEsY2hLkvt3NduvwMoR+rXY2Z0LFxs48aj+7vCDQ2ku6JnEjRGk13r0r4
	y9HQ9MbQ==;
From: Andreas Kemnade <andreas@kemnade.info>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] ARM: dts: imx: imx6sll: fix lcdif compatible
Date: Tue, 23 Dec 2025 21:43:02 +0100
Message-ID: <20251223204302.519468-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix lcdif compatible according to bindings doc.

dtbs_check tested only, a glance at the datasheet shows that it should be
the correct fallback compatible.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 704870e8c10c..c96669605d1d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -657,7 +657,7 @@ pxp: pxp@20f0000 {
 			};
 
 			lcdif: lcd-controller@20f8000 {
-				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
-- 
2.47.3

