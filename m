Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223C013B5B2
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008261; cv=none; b=MC0jGv0hgYuHNADMknbDY0U1KzDnkUMhy+z+20T6WxNuk2t7xym4zoCB7883Rx+mWeHgKXPHrwZztl7Bdt4bBqiA2lh/qBUJPuPDtLEhxGkK6oSHH/rhuxKs09C8/IqQ+K9GPCJoILhco8ThNWsZ4THnP3pQScVlHgB9bk4G+1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008261; c=relaxed/simple;
	bh=2XuBubiy+Z+LGvaSOYBE2L+kNIeG43J2PHYZeIMq73I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZFeJu1pcGXd6gM83+yI2V2oAuE5BsNCZpLXnIJWtT6B9V8SJj77IOfiekrdLNQObndBMhhAOuwfa2pKGDPlIXE00ms5ogSGiA0jBg36yAhJJtPVxEkZG4tpUh8jbCux8IEqSlZirKeFcOTRwI2DI2luK35fzpySh7t8BHRzY8Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1sOyib-0000j0-IG; Wed, 03 Jul 2024 14:04:13 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1sOyia-006qIe-Np; Wed, 03 Jul 2024 14:04:12 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1sOyia-004d9D-1y;
	Wed, 03 Jul 2024 14:04:12 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-arm-kernel@lists.infradead.org
Cc: imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux@ew.tq-group.com,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] arm64: dts: freescale: tqma9352: Fix watchdog reset
Date: Wed,  3 Jul 2024 14:04:09 +0200
Message-Id: <20240703120409.1103787-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On the tqma9352 the board is reset through an external PMIC, so
set the fsl,ext-reset-output property to enable triggering the
output pin on a watchdog trigger.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
index 9d2328c185c90..e9d89b4bbba04 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
@@ -151,6 +151,7 @@ &wdog3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog>;
 	status = "okay";
+	fsl,ext-reset-output;
 };
 
 &iomuxc {
-- 
2.39.2

