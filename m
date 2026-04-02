Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E6238F93D
	for <imx@lists.linux.dev>; Thu,  2 Apr 2026 10:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775127378; cv=none; b=qWq/qZN8Mpw3vZdpQtA5Sw3Nc7Qdy+l0ODRS8/FvpppY2bpxcU9I0jv3LzEd3+QTezGoQvC7Mfi7JZA0bIMT4oueC0DcK+g8vaR+wLRPB7n1a3/8R/hi7ZyABt1fBkAsivbZyn8jd60Urwk/YX6pw/OfKC5bWie2CAumVa5vhWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775127378; c=relaxed/simple;
	bh=aVNyOMB7K99Q/tfIlQEz1ZjLmo9g/+w4zxVwTDYBaWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3mgPBkFa5GwtrGtPCH40d6l8Ed9lkZTXcHnBjYlg2IehtGIce0cayC9/ciJiid+DufRKJPKW4wPtSl5RFuLF4mhvNiP59lzrApeGX/WAA6Cv9b/0fkbqHI8IX1FmkwVH2o/sJ1wrAhiLsELuu+GG2KMtNTJocb0B31SRFPVwLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=NmdUmx9f; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="NmdUmx9f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5RwpJzCL7Lr8TkyLgWHg7Ghg5pZTTcT+TXyI+ra8kLE=; b=NmdUmx9ffuL67TRnDP7u3xL+Ha
	bUwNWOvlGC51sQbp0PYMekm/hPQXbISKec9JLYKNIjETyqqLSOfno7/FPc9P1DXAhZPLmipZnBqET
	pXVCvUVuw/YaPFe3jJte3UecdAtQujQ3YrH6fXmUDFX97LI64yJRgDVcgSOrAfT2orfWQkuz5Hm3n
	5l1tpPQvrwbAOhoyjx0giJ1NJWg0N7UGxW0itjmCYu4jIbKUJNGpJTy2nKObwal5bZAuik/CMdou8
	GNzJiALVtHqYUiAMd/oe52+cc0dOsHSP5+FoXXci7aS4YjJVsmy1KVSgTAlWnMy8cP1AR8BWWXQRA
	r8Gcf+BA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:52086 helo=florijan-nb..)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <florijan.plohl@norik.com>)
	id 1w8Fig-00000009fYO-3IPa;
	Thu, 02 Apr 2026 12:56:14 +0200
From: Florijan Plohl <florijan.plohl@norik.com>
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
Subject: [PATCH 3/5] arm64: dts: freescale: imx93-phycore-som: Add gpio-line-names
Date: Thu,  2 Apr 2026 12:56:11 +0200
Message-ID: <20260402105613.1303871-3-florijan.plohl@norik.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402105613.1303871-1-florijan.plohl@norik.com>
References: <20260402105613.1303871-1-florijan.plohl@norik.com>
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
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: florijan.plohl@norik.com
X-Authenticated-Sender: cp2.siel.si: florijan.plohl@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add gpio-line-names for GPIOs with a defined board-level
function on the PHYTEC phyCORE-i.MX93 SoM.

Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
---
 .../boot/dts/freescale/imx93-phycore-som.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index ebc57841f27f..94eb04ace96e 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -90,6 +90,28 @@ ethphy1: ethernet-phy@1 {
 	};
 };
 
+&gpio1 {
+	gpio-line-names = "", "USER_LED";
+};
+
+&gpio2 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "I2C3_SDA", "I2C3_SCL";
+};
+
+&gpio4 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "RESET_PHY", "",
+			  "", "", "PMIC_IRQ_B";
+};
+
 /* I2C3 */
 &lpi2c3 {
 	clock-frequency = <400000>;
-- 
2.43.0

