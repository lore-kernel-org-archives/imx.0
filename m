Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F04333C1BE
	for <imx@lists.linux.dev>; Thu,  7 May 2026 06:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136644; cv=none; b=T4G49ZA98n2U1oFRQVQNWpeiRG3mcG5MdL5XwCDVNUF5U4hw50E2MM2dfsk/B4f3g0a4sTajx3dvBONLTMnDsxK10BsS1xQtnAO5rTun8FpRG3B8QQsuJe6e0vgxHfsG9z/FIaKoGUGFQkgzh2dGCaCPR61TKIIIeeMsGYlQ8u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136644; c=relaxed/simple;
	bh=zV3h3YZUqwMAzlsfJlUFtxTEwGS817hDx6OayXGeU/8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o4mzBlF0Jrrpx8EBSR3FcUdHavg+pYYNVX/npqSbms3+5K27uQfEUSAI1p/NZ5LA/vyG6pJtcmr5R9E4uNLnw8zkyjsiFpMaEwIMn72jVm99g/zFNvQgUK1TAKk4sIToF4SpSD4I545ug4KaflbZ16cfsXqPRVV874K56k4UwYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=WbLCmWzz; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="WbLCmWzz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XndlQw1vEUKvftg+tDwjaYGyrUBmct9QSEEl9yDREPU=; b=WbLCmWzzRRAB0itnHzJJsvQ8ys
	wW9q2qm+pHJcq58Zz7oQa5Lt1xfPDgHeE4gHW2Idd8uji5zwE31GtFLPAv2CJZoEI5de7iJqVGFEF
	fZ+ns0VC3MOUrZVALHSCP7yMfW4O2ycOipxDLDRZiVBJsmHcrrhw5ddx5JJMB1LzGun8es/uGsA++
	YBuQgkz993L+3Wj8WcCkXfcnhh5sNawQYl2EpxGxZzYgk5Gr7sBxalGcyKwqc20vyOOmuzvhPsbYw
	WxHDWsegVEN7j/oloXfY7urn9olB1TGkkE/FqjvV9k5uBZm1VIcM6dC4VMQ2gHXloqEUdmeC9CWc3
	VRj+mW3g==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:40514 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1wKs6Y-0000000AGWs-3Wgs;
	Thu, 07 May 2026 08:21:02 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 2/3] arm64: dts: freescale: imx{91,93}-phycore-som: Adjust PHY RST drive-strength
Date: Thu,  7 May 2026 08:20:57 +0200
Message-Id: <20260507062058.1711292-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507062058.1711292-1-primoz.fiser@norik.com>
References: <20260507062058.1711292-1-primoz.fiser@norik.com>
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

According to measurements, the PHY reset signal shows an overshoot on
the rising edge that exceeds the specified limits (max 2.1V) when using
X4 strength on ENET2_RXC. Reduce drive-strength to X1 to decrease the
overshoot and bring signal within specification limits.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
index 19e7e84ad6f7..8038d92da2aa 100644
--- a/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
@@ -220,7 +220,7 @@ MX91_PAD_ENET2_TD0__ENET2_RGMII_TD0		0x50e
 			MX91_PAD_ENET2_TD1__ENET2_RGMII_TD1		0x50e
 			MX91_PAD_ENET2_TX_CTL__ENET2_RGMII_TX_CTL	0x50e
 			MX91_PAD_ENET2_TD2__ENET2_TX_CLK2		0x4000050e
-			MX91_PAD_ENET2_RXC__GPIO4_IO23			0x51e
+			MX91_PAD_ENET2_RXC__GPIO4_IO23			0x502
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 626160132e3c..a624aed48efe 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -222,7 +222,7 @@ MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x50e
 			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x50e
 			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x50e
 			MX93_PAD_ENET2_TD2__ENET1_TX_CLK		0x4000050e
-			MX93_PAD_ENET2_RXC__GPIO4_IO23			0x51e
+			MX93_PAD_ENET2_RXC__GPIO4_IO23			0x502
 		>;
 	};
 
-- 
2.34.1

