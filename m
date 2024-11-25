Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDC318F2D8
	for <imx@lists.linux.dev>; Mon, 25 Nov 2024 09:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732525205; cv=none; b=iix5m8Z1eUlFM4cpfWPhVKypk5acP57EDbuEHZvPIhhEOuv7PIPMV4c6v0PKQuzTv43nAQCnyj+BfESfnaP8AZDktHr37rxybW1GG/Qqf3gzKxleoM1PgtD98XvidwES087mNe0qhyZSBD79spe1wHqfR0B0PkYR8imBPbjxkWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732525205; c=relaxed/simple;
	bh=csjcfXV3CN2ALKI/1ludNXYw8ASjSMwU8C6nJA/jRZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QR1C+CatE0r2xRmhcleAl5snVLvGW900MlRv3y/3SmGf5gx4GNStavb6g0ERvGgP9+Cm6xXzvDXwSdycg4m+5lByE9NAQmzdYUTLMkRzFE/M3cLYpMKIMVGhK7oa73ZPbfnA07fiF9WKOdOR99kYrMuazERp4QDhsiOEr5F/eD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=eBq6Vc5X; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="eBq6Vc5X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wWUv3FkBKHF+8McgMhLSJ10i4Rx+uwnusU/56aljWuk=; b=eBq6Vc5XnQ4P5bI9JLTp2aoS3W
	FS8oEeqjnxDf+/g5rQr4nzC9rTlIUdD9qZVC3dsjn8gcxOoDwvo87FQbZwdtAMTDJPJxTsk1XI1e7
	ucXZFw6dyQsftR25ct//qTmLf1X+AAFy74OhPT+PMt/0WAXy535LpWQ0F3NlgjEAdiVwxya+Wuw4V
	4W8XeMyKoI6InYemZsRFxXryBMWixXZLGHf1NqesZw/DX+5DSvarsBGVDGZ2wYlAdamRVE00x1C5U
	/EpW8T5ClDj2x9CQJPMlMG1Vku8y3LXy9ejOugHkiJZwSfb4rnK5GrtZN4xWPR5Yhood+hGfvuBNJ
	BxMU/QNA==;
Received: from [91.26.50.162] (port=58340 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tFUIo-00Eq70-1m;
	Mon, 25 Nov 2024 09:18:38 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 03/15] arm64: dts: imx8mm-phycore-som: Remove magic-packet property
Date: Mon, 25 Nov 2024 09:18:02 +0100
Message-Id: <20241125081814.397352-4-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125081814.397352-1-andrej.picej@norik.com>
References: <20241125081814.397352-1-andrej.picej@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From: Teresa Remmet <t.remmet@phytec.de>

Remove device tree property "fsl,magic-packet" as WoL is not working
on the SoM and so not required. This also saves a significant amount of
power during suspend as the ethernet phy is not powered down otherwise.

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
index 7761acc5c510..8de5a46512b0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
@@ -69,7 +69,6 @@ opp-750000000 {
 
 /* Ethernet */
 &fec1 {
-	fsl,magic-packet;
 	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy0>;
 	pinctrl-names = "default";
-- 
2.34.1

