Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DFA18FDAA
	for <imx@lists.linux.dev>; Mon, 25 Nov 2024 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732525371; cv=none; b=bzQl16mZ7iLylAhXkPjuJ/Z4hdsL7Svk54JUj+NT9diyzYy/xoP2jLIxQ1Yk8LYVuZsi3WJcIakizR5OK1OLqjbv/cN8a+cl78iw/JEbbzQgV7I02ZMAtwz3+sG0VtEV/qNDMvWt2Rm7R67OVFzgQ/6qcXboa2zswWCazkLVvFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732525371; c=relaxed/simple;
	bh=uZT2iBXe9UuhlJ9TygrX1VqYtFP+FE4SxrxENxyx7QQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=chsny/jnCWLyGjIOufIOm0GhdnX3e4rQWTY0lqoEfnYavAEmGLqEAoN6ljUT0OdCAL2BOHn+XzjBxS86RfLsb8dxHDgxWlow+iIIq4A3X+FnHv2lR13KOHI/+47fE3wasnLCHnyBxSBppQBxS9VznByTITG4RUiwMnbgqMMJf+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=Vv/Ejg7m; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="Vv/Ejg7m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2VSk0YkTxmS7lNUnuFUnvEgxZ7d4xlsb3g/LizjVEFY=; b=Vv/Ejg7mXXs3XOL0J+2qpzgPC/
	x6atx0vBWZIaDYLP1fJGIbY7DsKduQ02SiTIusyF6/uEpqmbGre24O3EL//tRc//JHeGdyhf21RHA
	ZZ8304pDgeanf5XQy+4XLAr3j93kA4HUD1hLYEjJMHJqzPSm1NSpvj6tQwL9icJkla8aynUE6916O
	BitYvWDPaTV6uggcR7AznGzf82lGwxlRgzJfdBaGm2lliHPbcZi57T2INdtSwRLZfKY4eEsGEua2H
	mEuqIcDJzcoBErh42TA1kreiq47N9Ck94gW1fF8dVNP3l0dyH82nvmbXTWxzXJbiww/ZpOZvrzhNX
	7muhO9DQ==;
Received: from [91.26.50.162] (port=58340 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tFUIp-00Eq70-0m;
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
Subject: [PATCH 04/15] arm64: dts: imx8mm-phycore-som: Assign regulator for dsi to lvds bridge
Date: Mon, 25 Nov 2024 09:18:03 +0100
Message-Id: <20241125081814.397352-5-andrej.picej@norik.com>
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

From: Yashwanth Varakala <y.varakala@phytec.de>

Add a missing voltage regulator of 1.8v to the sn65dsi83
(dsi_lvds bridge) node. Due to the absence of this regulator, a fallback
dummy regulator is used and that triggers a warning message from the
kernel. Assigning the appropriate regulator avoids the warning.

Signed-off-by: Yashwanth Varakala <y.varakala@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
index 8de5a46512b0..7e859c65317a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
@@ -286,6 +286,7 @@ sn65dsi83: bridge@2d {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_sn65dsi83>;
 		reg = <0x2d>;
+		vcc-supply = <&reg_vdd_1v8>;
 		status = "disabled";
 	};
 
-- 
2.34.1

