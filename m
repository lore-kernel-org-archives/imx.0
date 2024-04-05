Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65942172BCE
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 21:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712353620; cv=none; b=bGGG7H4vdcsS3qkKmiXlueBzhguTISTvYHioKP+47cqs3CJl0fm9Qdb4pv6rbhjbU8Kx7+1UwsJo/PQax2+tR/QlGyuFwLSSsZicw0FesTDjzyID2i2SrP1rQgxA6T0VXTwE90RzW9anTrIOHu0WCPZ3J7mpIStER00Vsz6FfZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712353620; c=relaxed/simple;
	bh=+WbW32YtS+hL3osIvG0GYz3KZQt08kEjTVfW0mrOoLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MklAsYpiC6VRBpGUkfwR4553tOHV6QJz3ytQwF2PMtADWrJ0yM8pMSkOw2q0+YnvzLhfGyEq3wd0gvRtBvmZ7s7eWQ57JmH1Kg70zoVGhqX1EKcd+S8D0VWO8LhLhGIU6srlRNZf4J5FF2OID+pvTxM7EjfCLC6YPz6M6mCaE6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rsrOW-0002yr-D8; Fri, 05 Apr 2024 23:46:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rsrOV-00Ad3N-Gd; Fri, 05 Apr 2024 23:46:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rsrOV-00FZoU-1N;
	Fri, 05 Apr 2024 23:46:43 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v1 01/49] ARM: dts: imx51-ts4800: Use #pwm-cells = <3> for imx27-pwm device
Date: Fri,  5 Apr 2024 23:41:48 +0200
Message-ID:  <c1989247cf9c59b1dbbaa031319d2f53d99899e1.1712352665.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712352665.git.u.kleine-koenig@pengutronix.de>
References: <cover.1712352665.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=+WbW32YtS+hL3osIvG0GYz3KZQt08kEjTVfW0mrOoLc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmEHAiSYg19nzGlxI6EAhR5Q07agiQLW5oxO39S HEzhI/jXDeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZhBwIgAKCRCPgPtYfRL+ Tn/5CACeLu1XcbqTpWiUrId7nRbfwsU12+r9eWSaB+PSh+l7zyJRsV4lSwOt7s11DBu/Qvb6mxx JCWWFRVyzs/Y8ZB9aHXbNaq+zhbldpPrXTQH8SOAjV4eDzc9k3dO4QwgXvKRGXxplfMw1XLVZ5O tb6TzvCtG2J/zdjRoGYm2s92hIZuKg0t6G88LIMnsVlYNA+B7+LyJRUq8aunXnlTPOx9d3zaarA EZMvJMk6NRYgwyOemAOPnRbcN920tFXmB5Km9ZITFj4ahNowWE6fx/V0CPb5iXSkCkvKGQjdAAO ndkTYl/xO0YY7T0YetHwleN17QmKrOw0tAMMBOXW5HEiT6b7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

The binding dictates using 3 pwm-cells. Adhere to that.

This fixes the following dtbs_check warning:

	arch/arm/boot/dts/nxp/imx/imx51-ts4800.dtb: pwm@73fb4000: #pwm-cells:0:0: 3 was expected
		from schema : http://devicetree.org/schemas/pwm/imx-pwm.yaml#

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts b/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
index f7408722d68a..2bd0761c7e90 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
@@ -45,7 +45,7 @@ backlight_reg: regulator-backlight {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pwms = <&pwm1 0 78770>;
+		pwms = <&pwm1 0 78770 0>;
 		brightness-levels = <0 150 200 255>;
 		default-brightness-level = <1>;
 		power-supply = <&backlight_reg>;
@@ -113,7 +113,6 @@ &ipu_di0_disp1 {
 };
 
 &pwm1 {
-	#pwm-cells = <2>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm_backlight>;
 	status = "okay";
-- 
2.43.0

