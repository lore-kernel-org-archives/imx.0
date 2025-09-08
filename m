Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A972FB99A
	for <imx@lists.linux.dev>; Mon,  8 Sep 2025 11:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757330235; cv=none; b=ReIRYbqqGQYogOcsA/aOxbKGbKN3XNHQ409tOZTI3w7ScLLN0uc6pEePSvtQdOxIvf1bfAlOtTAOlXKNEJ3H2AuHagsv1Bwg7Pc4eR/OIKr3FbG/RQC1Ygy4O2OmeP90OKF1VRHOBIqIEIpLcODrRRA+ePNIHPcQTmnFV+okugk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757330235; c=relaxed/simple;
	bh=Ez5iok/gFBnlsqQ/QD9zvk/nbsgb9Ce5MeZNOhHM2x4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rUfNlK2LDuabHXLAytgzDQg1w3NkOP2pz4Q/GAeTVhQG3kXM0wvJJBmVSqF6cy3xQvvhwn2QPItdY7tCijY3mrvY1Nyjy9L650gs9d4r7/0o4IAKudMZwtsqjAegpEGRidN+n4z2YzG3tOW0z4ECx13qSCoEnjIHKmiicfU3paE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=nX3A6GQn; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="nX3A6GQn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oIZ2hOJajcjLjoWN/laW04PrffXmHp1XQ28aoOjrd8M=; b=nX3A6GQnIFnL0Ni9B488AD6ftt
	U6ORBx/mwn0CUZTLjfIbeyI2hOEiAkjtsNX3Z9pkukdWhF8G+1JxnR1RpG2Kvmjt7GtxYu6CeFnF/
	nVHCGIwPyqmlaYO6x7n8ZWh1jKM+mzlOiAEGXd1m+qt+oiwnXmqe72B3ybTVJ/JEyRdbDUZOda2yn
	3d1L7h6Et3xQ9O1boIto4PC+5bguv5DDaNYoCY0vP4wHVRok++h+gQE99TyQvr5/YZntiJXBmczi2
	oHXrU1bBgVGRfXotjjEYRfg9t0zl8t0xcuvTkPcKAcXCDQU7dkPs/BftlE7i21lKZouM2xPVOxwj6
	NYtF6D8Q==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:38132 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uvZrv-000000076DT-0ZkQ;
	Mon, 08 Sep 2025 13:17:06 +0200
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
Subject: [PATCH] arm64: dts: freescale: imx93-phycore-som: Remove "fsl,magic-packet"
Date: Mon,  8 Sep 2025 13:17:05 +0200
Message-Id: <20250908111705.2956825-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
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

FEC WoL (Wake-on-Lan) functionality depends on using Ethernet PHY in IRQ
mode. However, on phyCORE-i.MX93 SoM, polling mode is used instead for
the FEC Ethernet PHY. Consequently, WoL is non-functional. Thus disable
it by removing "fsl,magic-packet" property. This allows us to save some
power during device suspend as PHY is not kept awake.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 89552ae70660..3f069905cf0b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -67,7 +67,6 @@ &fec {
 	pinctrl-0 = <&pinctrl_fec>;
 	phy-mode = "rmii";
 	phy-handle = <&ethphy1>;
-	fsl,magic-packet;
 	assigned-clocks = <&clk IMX93_CLK_ENET_TIMER1>,
 			  <&clk IMX93_CLK_ENET_REF>,
 			  <&clk IMX93_CLK_ENET_REF_PHY>;
-- 
2.34.1

