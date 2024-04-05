Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BB7176FD5
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 21:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712353629; cv=none; b=KqFGQkGsVbX9kZpfB2m3QKnZxVLQ/8cYKUuwUFCFGUP/sq3VXTQbHrdWdVLxZbg2fVOt7cg12BGbEWD5S2FZdDgWGjx776lgFjE5xo7yysXMvOL/XjhV/5slsNboq45D2V6Eha1andSs7CE2Ga9dSZtQkXLZSiKMWlJtmDoYAzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712353629; c=relaxed/simple;
	bh=0dYl1SyOidFE2v7fVyYEZ+EClZfh/dUkxtDv1eKQvQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WDzC/tIOqhSEZh3OYqRFeoBSLh42Bg4RDqQ+csmXRbxnC8Y0/jaj5o+4pW4WYwH6CRKxiyH2g+JW1e+BpIWAoOmnKdZBzwYUXtBROdC2EMiQEBpW/RDgIBQzO2CU+WvzZvAb+8HUIyL+Mk2FJUjiW7DvXYgAipsgDmBOVY/ELOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rsrOe-0003hO-Jl; Fri, 05 Apr 2024 23:46:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rsrOd-00Ad5j-Lu; Fri, 05 Apr 2024 23:46:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rsrOd-00FZqs-1u;
	Fri, 05 Apr 2024 23:46:51 +0200
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
Subject: [PATCH v1 38/49] ARM: dts: imx6sll-evk: Use #pwm-cells = <3> for imx27-pwm device
Date: Fri,  5 Apr 2024 23:42:25 +0200
Message-ID:  <fc97afe9931150a5adabe383c6b7beedb4445675.1712352665.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=0dYl1SyOidFE2v7fVyYEZ+EClZfh/dUkxtDv1eKQvQo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmEHCsMqZnBgKoCLHGXu+yPPXh7yVtYkJ8JSMoe SYXvaXyo0CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZhBwrAAKCRCPgPtYfRL+ Tq6SB/wLgWKq0+7sflyws74XETZIvf1enpRx4hzC5MHWdPiqlxQhzVhjsOcOxjwulq91EbObC+O phCLAzNvaTAbD8BPjDKyHhCdcR2lnVmdBlgpT1X4sZYN3iXxQDjmk8f+9+bm8d82pq96L+c9sUw svio6j8voHLFAggyumpW9WBDrEkqd6rO+pzaDufzQd2j0vb+mMBZ/8wYqbl32WVnio8Nqxo2MBt HaqWL8tJ9phw1agvUYzjuvvgKarEBy6UARe96vK9loo55m5VsLtmBVe5TI6T22HFQPnwKD4GqXO ywRLFjqRzf3XDEvrDUaBFnptbXNDFWUPxibSvD29yMlqz+xj
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

The binding dictates using 3 pwm-cells. Adhere to that.

This fixes the following dtbs_check warning:

	arch/arm/boot/dts/nxp/imx/imx6sll-evk.dtb: pwm@2080000: #pwm-cells:0:0: 3 was expected
		from schema : http://devicetree.org/schemas/pwm/imx-pwm.yaml#

There is no need for an explicit status = "okay" in the pwm node as
the soc dtsi doesn't disable this device. Drop this property, too.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
index e3e9b0ec4f73..febc2dd9967d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
@@ -26,7 +26,7 @@ memory@80000000 {
 
 	backlight_display: backlight-display {
 		compatible = "pwm-backlight";
-		pwms = <&pwm1 0 5000000>;
+		pwms = <&pwm1 0 5000000 0>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
 		status = "okay";
@@ -314,10 +314,8 @@ display_out: endpoint {
 };
 
 &pwm1 {
-	#pwm-cells = <2>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm1>;
-	status = "okay";
 };
 
 &snvs_poweroff {
-- 
2.43.0

