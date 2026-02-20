Received: from mail2.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA0633F373
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 10:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771583814; cv=none; b=Cf8DMRNu9Nre4CskY5O7A5SkdQBOii4QP0LYOFI8yQF7YV+bbDOV+6D4GeY2R2SYx2mvxJq12XRcMKtDdWcGJaARKD12IhbSmTNrU8MeKxCdR6CifVNDu4XyPfW6+kPMMUi1rUD9zFzOJ1J2eMec6ZF6i4yBsaPteAUsKzbfg+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771583814; c=relaxed/simple;
	bh=KYZ8W+OseSCq20we598SP8S/rg3A5OHZtPnSr+hfXmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QX27IoE3RWNzawAmPcbyoBs3WRchMsXoLZPf9lXdb1chbgHKKMcVmazYkUjLeHJv4uRYkl3GBzF/d+QSvjVou/LR7m/Qa8qnqI1/YgPoDb4gKGLz9t4l5Lal661DEBVqtsIy0glBxXMx+41XS5ouGJw8Z01Fi6cQyPhkRMg0YiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=0PGmqiJH; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="0PGmqiJH"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1771583806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ncaVl8FmjKo1MU54nAIJ5qmIEEBB3+ip6lPVKRFzkRI=;
	b=0PGmqiJHpNVwmVI44CQvWvovGJZ+7qLLsqK8dGW50OqtjYILi5uhxHVIXe1PTtikO0ddRT
	zCb7uxXqYLv+DHmP1HCzr4i2GImt/p8nkKsmsP1CV0mYOqpg5g2z1kgo4a7vX8EXvLdjQj
	DkYbFeLKf8i7lR/n+S/xWJK+e3Fng8NWA9DWWmfT+3Nb1IkJ9gHDvAEfY+IPyr+KD2GMlO
	pCLKlZq98gZTO25TqAN40rzhNd47AbZlNmP5jzq3fp1ugcG12qnHLQAzVppb28NMn39THK
	HxYsSroQo80OyxNmoKNhXfKiO6YwQYncs5pJKkG7UXsw8NHiAROYLqiC84FeUg==
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
Subject: [PATCH v2 2/4] arm64: dts: imx8mp-kontron: Drop vmmc-supply to fix SD card on SMARC eval carrier
Date: Fri, 20 Feb 2026 11:36:17 +0100
Message-ID: <20260220103636.9697-3-frieder@fris.de>
In-Reply-To: <20260220103636.9697-1-frieder@fris.de>
References: <20260220103636.9697-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The SMARC evaluation carrier provides an SD card power switch that
complies with the OSM standard definition. The OSM base devicetree
already describes this correctly.

Stop overriding the vmmc-supply in the board devicetree and rely on
the definition from the OSM base DTS instead to fix the power supply
configuration for the SD card.

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

