Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB36175563
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 21:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712353621; cv=none; b=BpQIWEqEQtA/PRdYdsIvFVnM4yL4saAS9GCRQ3XBAvv06op7MrRQQBir6uv8ZZ3cJnvTfITFhUivadLFUPlMF/r6l3tnmP1GTMjC/aeHtNHVCL5Xb23s5eTexMFNG9RCpSRcxovgJaUfddDBmElfoG3NGzMQyidBbsCYman58ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712353621; c=relaxed/simple;
	bh=tqhhSMwKFLNKV+dI9piJQ5+BnhchO+cCkkYeIgbQowA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b0CHugF8jDCD08zwVMCV7SkNVOCRTIJ7fLYJyZvRiis1sjTw3IIU2L4rsUBxeYSrqKi7NQMd/uZx9vioCooKALh1BNCnq3aBHQ5LUMY9agluPX0nMhweStb+Nj8nMsN+kadOJkDYIjBIJz7Zi4Q6xvqqniiXxCio9VooTzPGZec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rsrOh-0003xW-IL; Fri, 05 Apr 2024 23:46:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rsrOf-00Ad6B-MZ; Fri, 05 Apr 2024 23:46:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rsrOf-00FZrO-1y;
	Fri, 05 Apr 2024 23:46:53 +0200
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
Subject: [PATCH v1 46/49] ARM: dts: imx6ul-isiot: Use #pwm-cells = <3> for imx27-pwm device
Date: Fri,  5 Apr 2024 23:42:33 +0200
Message-ID:  <cbb2c12e6a36c6bda22b56298dc256a62cae5d60.1712352665.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=tqhhSMwKFLNKV+dI9piJQ5+BnhchO+cCkkYeIgbQowA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmEHC6/oEEMfkGFMBwYRD/LhuCn6h1/L10CjgSQ DI6cFqQLAaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZhBwugAKCRCPgPtYfRL+ TjceB/9qkTt+bi9RGXG1ZNmYLpIQkCagwC1SBT+jqfWyIqKFPKUY7bmcvikadp6IoScwjmdaNB6 eMUQ0vQ5n3sMN/T3ip0tVQ4PQGwDdesxOWC+zykmwi3nATLoKAmYe8IFmscPIj98FDxBF9n6L+D tBIf02z28GSNTsoTfuXPUJ3v/kZyItT2v6iVq1ljwNezd3YFM0ak43ZW7FEjOK9F7fjAPJlct6a uHgMvxa1PCje7q92dQQFrmeP5cFKR8TE74DiuOu8Esoe9t0G+gLmAA0m+MvlRL4sHnzJQrjbb4+ UAKOJPyVnmbVvs9f6iX2x71DiqaN06hviJvWOf/QUbGX6J/+
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

The binding dictates using 3 pwm-cells. Adhere to that.

This fixes the following dtbs_check warnings:

	arch/arm/boot/dts/nxp/imx/imx6ul-isiot-emmc.dtb: pwm@20fc000: #pwm-cells:0:0: 3 was expected
		from schema : http://devicetree.org/schemas/pwm/imx-pwm.yaml#
	arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: pwm@20fc000: #pwm-cells:0:0: 3 was expected
		from schema : http://devicetree.org/schemas/pwm/imx-pwm.yaml#

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
index 14fc4828ba4e..ee86c36205f9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
@@ -20,7 +20,7 @@ chosen {
 
 	backlight {
 		compatible = "pwm-backlight";
-		pwms = <&pwm8 0 100000>;
+		pwms = <&pwm8 0 100000 0>;
 		brightness-levels = < 0  1  2  3  4  5  6  7  8  9
 				     10 11 12 13 14 15 16 17 18 19
 				     20 21 22 23 24 25 26 27 28 29
@@ -187,7 +187,6 @@ timing0: timing0 {
 };
 
 &pwm8 {
-	#pwm-cells = <2>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm8>;
 	status = "okay";
-- 
2.43.0

