Received: from mail2.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD47F2C08A2
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 13:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421468; cv=none; b=qc7ASWPpQ6aLhxDcbvKaRp7pbbCEbN11XWwycBBBg80bNYiD8R8vPYcI234IL+aTY+nOk2IorsN9mFech0daXo+lzLGg4OUwGiI+bW1t/zMG8I16e/vnCLECnn5DUPW2RlByLArYu6yGYtO+k+AldvkijzkJZXwaWfHL0QhNBUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421468; c=relaxed/simple;
	bh=wLp8Vx2xDX3zudNkp8Sd58yem/MLCzlw3B6cs7yvBuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MHpXnqk9eZqgktRhXcE38EGbxblZCMo9DFe4vf84C36+gWaFaM7en3iR+JbbpOwfvbzqKkF7S2TGvaWlIEuXxhafTDsWYNaxwIRzuvEj1mVjatJQXDwVCoO4iVAb3knvegkHe34peWWdJ7508L1nBNZzlPNY5dI9NL/KxKcZV50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=A9BtxREd; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="A9BtxREd"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1771421125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OkuqcMPgMhOvktAdO4R0HEr+0KhxRtMn3MM65yMphGE=;
	b=A9BtxREd6FMLfp7RNjEc2V3SW2Q/lX2PmWk1ZcrmL5SS9WRR/JrmkZ1Ni+as3fUyufn6lZ
	YLpJ3UgJhTvRACai4t//8PGHf3iJ0+QnQ7eqI9aCpSD2s/Vwcies8SfjZ5hyv6tVWKO+jw
	XdD777G9VAm+BSZOMaIIAebvMHQDieprpwFyreAdJcYdTbuXrcNnGK8D8S6Z6+TkZ+ulbG
	W2hxdUa1Za+LRFIt3XjOrE9Gh/WT1gXsc2vUsy35KpGO+N0/62uhUhRqLTlz6siFHfRfrt
	fcyN22mecKB7AhPv3wsE8Mj9T81K28+BHKYzUv/Kcm5XLOvXn4bYYMuSlV5+Ag==
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 2/4] arm64: dts: imx8mp-kontron: Fix SD card supply on SMARC eval carrier
Date: Wed, 18 Feb 2026 14:25:06 +0100
Message-ID: <20260218132519.74570-3-frieder@fris.de>
In-Reply-To: <20260218132519.74570-1-frieder@fris.de>
References: <20260218132519.74570-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The SMARC eval carrier has a power switch for the SD card compliant
to the OSM standard definition. To use this as already specified in
the OSM base devicetree, stop overriding it in the board tree.

This fixes the power-supply for the SC card.

Fixes: 6fe1ced5ccab7 ("arm64: dts: Add support for Kontron i.MX8MP SMARC module and eval carrier")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
index 2173a36ff6917..74d620dd06b7b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
@@ -249,6 +249,5 @@ &usb3_phy1 {
 };
 
 &usdhc2 {
-	vmmc-supply = <&reg_vdd_3v3>;
 	status = "okay";
 };
-- 
2.52.0

