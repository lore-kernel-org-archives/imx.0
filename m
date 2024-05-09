Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAB81494D8
	for <imx@lists.linux.dev>; Thu,  9 May 2024 05:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715232861; cv=none; b=Q0DwYk6i0I//wnL+7G65I/88KLsGCeGDgjAvfD+fcUqjy6j1QhDoP2gqZEEFZjEcRnKv5OHSh3zv+JNO3vGSB3nWPZZNJBl8GNjLjwqrx/mBwguBadTOZAPEH0lN0Nkm66X+7GPO1BWCTvnlV82oJbAzUbDVzWZmBPSi7GSK8Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715232861; c=relaxed/simple;
	bh=fdUH87iHP9ev1kU+ajKaxLKo02sTP5LzeEqw2Aiby1w=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References; b=E/8I8/nS7Eyap8AP4T+ni9C4zwSIshEmSdf1JNkKrtqSHAozd6k2Emjd4YuCr7MLiZvpQG8SkMjenI2G6PA6fWWi8OK6wgDLQu/iVAADtFdX21oAVuzsQBvBm+NaDO0QRxmkFU6lyS9uMzOIw8Yex52UauhE632/VZCJXcoJy04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 47EFB1A1881;
	Thu,  9 May 2024 07:34:18 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F3AC71A1FFD;
	Thu,  9 May 2024 07:34:17 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 27163181D0FD;
	Thu,  9 May 2024 13:34:16 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
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
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: [PATCH 1/2] arm64: dts: imx8mp: Initialize audio PLLs from audiomix subsystem
Date: Thu,  9 May 2024 13:14:57 +0800
Message-Id: <1715231698-451-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1715231698-451-1-git-send-email-shengjiu.wang@nxp.com>
References: <1715231698-451-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Initialize audio PLL1 as the parent clock for 8kHz series rates,
audio PLL2 as the parent clock for 11kHz series rates. that PLL1
and PLL2 can together support full range of audio sample rates.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index b92abb5a5c53..459c4a54d30e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1579,6 +1579,9 @@ audio_blk_ctrl: clock-controller@30e20000 {
 					      "sai1", "sai2", "sai3",
 					      "sai5", "sai6", "sai7";
 				power-domains = <&pgc_audio>;
+				assigned-clocks = <&clk IMX8MP_AUDIO_PLL1>,
+						  <&clk IMX8MP_AUDIO_PLL2>;
+				assigned-clock-rates = <393216000>, <361267200>;
 			};
 		};
 
-- 
2.34.1

