Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84100176FBE
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 21:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712353628; cv=none; b=QSX4sVCp9YD4PZh813anukqTTIk+93JfRcCvTH5VJDVQR/RTPnSdBiivLD9hZrQ29RKfWAxK3cDw1gS28QDJtLi5g1wkTXQvrHLQUgYG8VPQ/YX3LkY99PAS2IvioVL4QhZg3ts/1U5VFGptv+B2NIBhLi1DMGtEOwZvnhVFPkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712353628; c=relaxed/simple;
	bh=0VSmB2CEsOD5lHKuDMcdo/tWm3UBeB8pQLyKiuGzXZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P6Deb+sPd+xk52ZKPdAkvTkIZiXx1A2DZRYlUgxTQAELLWQ00MPtl5OqPu2s/BZWXIsDVefzune07+dvRetNU89Zof8Lp7AN+emb6wbDNypaIffNG+1nkz8IugFHxqsNwvqjy7qvBqyj7KIuuZxIRATW7gjCK9ocxw7HICX/qO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rsrOa-0003KU-GR; Fri, 05 Apr 2024 23:46:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rsrOa-00Ad4g-1g; Fri, 05 Apr 2024 23:46:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rsrOZ-00FZpq-37;
	Fri, 05 Apr 2024 23:46:47 +0200
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
Subject: [PATCH v1 22/49] ARM: dts: imx6qdl-nit6xlite: Use #pwm-cells = <3> for imx27-pwm device
Date: Fri,  5 Apr 2024 23:42:09 +0200
Message-ID:  <f974f05e63fd9f7d01249e1606a71a3585e1352d.1712352665.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1758; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=0VSmB2CEsOD5lHKuDMcdo/tWm3UBeB8pQLyKiuGzXZc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmEHBsy3oz+SpZr06sHR1df0iPzYWN+moGbDGZ2 1OUqUBIgYaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZhBwbAAKCRCPgPtYfRL+ Tv31B/9IlYPHpju9QZTAkLXKEyzSObBX3NN7xwKcI8hkxd/IywPo8nrsfcabU/1+vPXj1EPnc81 iBI5A4QGhhaxCS6I47OcTMZZpsRl/nyAv5RWXswHBagLotYHfDRr6nuROxhQTMvcNIEe30SXTEK Ra17U+U+XGEPTsF28FW5VE3El7OQvU/fdq9NR0+EJ6kvRSaLlqWaXgTm4G2XxVldbkw8B+kEtX9 dWPKaphmej3IILOxkTEqidX2NFIqrlQbP+0rkFHeuwX87yYV1unWlUxBneRzxelBvnlpq3Aha3H XoZUsBj4foh31AyeQKvhOhL8ccoDKTfKWlJ/kZkZv1cRRc0L
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

The binding dictates using 3 pwm-cells. Adhere to that.

This fixes the following dtbs_check warnings:

	arch/arm/boot/dts/nxp/imx/imx6dl-nit6xlite.dtb: pwm@2080000: #pwm-cells:0:0: 3 was expected
		from schema : http://devicetree.org/schemas/pwm/imx-pwm.yaml#
	arch/arm/boot/dts/nxp/imx/imx6dl-nit6xlite.dtb: pwm@208c000: #pwm-cells:0:0: 3 was expected
		from schema : http://devicetree.org/schemas/pwm/imx-pwm.yaml#

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi
index f2542d725ce7..a30cf0d06206 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi
@@ -108,7 +108,7 @@ led-j46-pin3 {
 
 	backlight-lcd {
 		compatible = "pwm-backlight";
-		pwms = <&pwm1 0 5000000>;
+		pwms = <&pwm1 0 5000000 0>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <7>;
 		power-supply = <&reg_3p3v>;
@@ -117,7 +117,7 @@ backlight-lcd {
 
 	backlight_lvds0: backlight-lvds0 {
 		compatible = "pwm-backlight";
-		pwms = <&pwm4 0 5000000>;
+		pwms = <&pwm4 0 5000000 0>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <7>;
 		power-supply = <&reg_3p3v>;
@@ -499,7 +499,6 @@ &pcie {
 };
 
 &pwm1 {
-	#pwm-cells = <2>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm1>;
 	status = "okay";
@@ -512,7 +511,6 @@ &pwm3 {
 };
 
 &pwm4 {
-	#pwm-cells = <2>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm4>;
 	status = "okay";
-- 
2.43.0

