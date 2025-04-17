Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825D92DFA4E
	for <imx@lists.linux.dev>; Thu, 17 Apr 2025 08:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744877745; cv=none; b=jHlveW4O3I3XIQHdn+//uF/ynSX23irF/8ShjazqBCPhiU3mg2F4qJOj+rsTIJXLXSb9Xxxpfb9z4f8y/3EMFW4dNsdqj8y+WKGXuOPFi5WQ+AGyopAyB4QTSIAesDPADcyRy4qU3KyKYw/c/g4SOEOzzZI8Uiz9/fZ/dTmiHVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744877745; c=relaxed/simple;
	bh=TAdNJmfkqVREx9I+7aJystoVlYGwpOCLoC0+4mjqVQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JY9INgkCeKJWPa2aZmjMI9RUEIz0XgIzxcS0b9DyzcxiOVYDL4xNPX6fKsFpVI8/RTMEwzeLkZDjCYpJid00S8+r5cumEe7z+sBsgQEtvmbd/Mu4yR/w4dDhqmgHaxZEHZIoWpsdFSEriAZbOnQVqTiMtWkkcGCp6053uW/eNJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=BLy7s5TO; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=R3Cz/hsc reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="BLy7s5TO";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="R3Cz/hsc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744877742; x=1776413742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7dDLIIzSQRg4ePKa66VPyPuGiB/e4Ve/L+L3EXhyXeE=;
  b=BLy7s5TOeJHvU2e3hWb8ZNENjNBg48pGDCpwcnMECRzlHPiGgON0g497
   0Ju4kN2Gg75Z/uF9rk+msMjJewcEmXy/RcGXoy0l54Kj4X7q4i/vtE/sh
   1PogGoeYXDSL70LLJXw4bxZD7etlqPT7OkdH2V9rmr/6pUX9RteHLBT91
   XsUEQ277NyJOmJ2mPcZeRWdsWdo76DYAjY/Bv8WBxOzZmEbD8XZrD11q0
   hvTaGDO3T1iXSHqMD8J61Cq9p8fXTfgcaI1q5vA2lKrZDTZ3QiSirXPSs
   Dvo87KIx3bZUTtociqzZsTzl3xP46XeKINVIRg/cT/ZflZ2JjLhysSs0b
   Q==;
X-CSE-ConnectionGUID: gEiNRLgPREq9Xp+u3Qw2DQ==
X-CSE-MsgGUID: vOjlecO2S8i+w8GGAXPlsA==
X-IronPort-AV: E=Sophos;i="6.15,218,1739833200"; 
   d="scan'208";a="43587416"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 17 Apr 2025 10:15:40 +0200
X-CheckPoint: {6800B8AC-1B-903EAEAC-E04C76C8}
X-MAIL-CPID: 937D254CC7FA1B77EF185447953CACAE_5
X-Control-Analysis: str=0001.0A006377.6800B8A7.0092,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1D1916C3E1;
	Thu, 17 Apr 2025 10:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744877736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7dDLIIzSQRg4ePKa66VPyPuGiB/e4Ve/L+L3EXhyXeE=;
	b=R3Cz/hscaI5rAOXYhFXN1pXFk2voseBsekk06MSWIpUuadu9fXQU0lwxUnXbucG+ezmZsM
	6cCzbXugsRuuRPaRuIJ9C5n0yoPQrVtdObb7/7BfOkMAJR2I7ul/BLeNVLo8IJy0HGClEh
	DgNYqujvgblPQ/F3jfw+aMhozyAIHg+uxgOaHB7IpOXMWRvikNj5eTC+MFzYkasKpU2dqw
	MaKWs2+QxtRZZI6Jqm+6mBYUu4vZ4DvMQXIU3CbR9vkap+mWn/5Kqr3ba2rxZleS9ScQPO
	RfdCAmLh9JxkVF49KaZcLRu8hMT9LL8ik0kGQ/YKkGL82z8fTWbW7w29KgHQHw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 2/2] Revert "arm64: dts: imx93-tqma9352-mba93xxla: enable Open Drain for MDIO"
Date: Thu, 17 Apr 2025 10:15:20 +0200
Message-ID: <20250417081522.1145586-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417081522.1145586-1-alexander.stein@ew.tq-group.com>
References: <20250417081522.1145586-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Using the MDIO pins with Open Drain causes spec violations of the
signals. Revert the changes.

This reverts commit 315d7f301e234b99c1b9619f0b14cf288dc7c33f.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
index fc68c79fc0d8b..c98319a8fa81e 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
@@ -641,8 +641,8 @@ pinctrl_eqos: eqosgrp {
 		fsl,pins = <
 			/* PD | FSEL_2 | DSE X4 */
 			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x51e
-			/* SION | HYS | ODE | FSEL_2 | DSE X4 */
-			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x4000191e
+			/* SION | HYS | FSEL_2 | DSE X4 */
+			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x4000111e
 			/* HYS | FSEL_0 | DSE no drive */
 			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x1000
 			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x1000
@@ -673,8 +673,8 @@ pinctrl_fec: fecgrp {
 		fsl,pins = <
 			/* PD | FSEL_2 | DSE X4 */
 			MX93_PAD_ENET2_MDC__ENET1_MDC			0x51e
-			/* SION | HYS | ODE | FSEL_2 | DSE X4 */
-			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x4000191e
+			/* SION | HYS | FSEL_2 | DSE X4 */
+			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x4000111e
 			/* HYS | FSEL_0 | DSE no drive */
 			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x1000
 			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x1000
-- 
2.43.0

