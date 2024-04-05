Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E5D175552
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 21:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712353620; cv=none; b=WPwxgHk74G9DgoZ5cZlB29Y/8jDExL5/5DnKbW600hgQCGoaXDSIEbVetfes6WAb3xlR0iBGxlRuZymVUvDjwV39Xa4SRNLh68l7e//0ypZRt9Gh1XFA4HFH+/Rh1pdCGCVmWNtm2TvUuIn5vWvBS8W2YjPFoGkW5vFYKjsrhFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712353620; c=relaxed/simple;
	bh=+9PTGxWmr+eTAeWWxaedtE/sNqrPdWonG/X3qZvE/qI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MGUwBZirkouAwwxDWnUzbTKxuWxjuKUzmsmvEAS77FUci+pQw+u4B5b6C0lRyO2CaW2ElpsyYZf0Cv8/rMSxYc3FW7sPcGSHdG8iq3hNXWY3PoekIjf7wRz52ZF9ioiqYougsVCPBYDhNVtqdPsDgQtKaNdsSHr/iUP96UEHtP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rsrOc-0003UK-Ap; Fri, 05 Apr 2024 23:46:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rsrOb-00Ad5J-U0; Fri, 05 Apr 2024 23:46:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rsrOb-00FZqQ-2k;
	Fri, 05 Apr 2024 23:46:49 +0200
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
Subject: [PATCH v1 31/49] ARM: dts: imx6qdl-skov-cpu: Use #pwm-cells = <3> for imx27-pwm device
Date: Fri,  5 Apr 2024 23:42:18 +0200
Message-ID:  <492484649c1cacd874a2110d3f6ca48b028846cb.1712352665.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=+9PTGxWmr+eTAeWWxaedtE/sNqrPdWonG/X3qZvE/qI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmEHCGGsOnhZmYb5h1USwSEuzA+CNJ8RDXI+lzz QUgag4Xr2qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZhBwhgAKCRCPgPtYfRL+ TsXJB/93TgQRMxYE/XFwoG3W6T1ybLZUXFfP8KGktF5KpSXInrSSOP/GTib1ptj5MpV+O1yrzpL cJHUS9EHBfKZ0w0l7D++iO5vH+C830X1fkU1TxNgrRrQe3OzYqhG8gWbQmDBRASxT4sKZu0oYMG ACf+giathsIXeWgvCpVoI3UWuyR+gbfwYQXqeMdPHh4JSUjVTeEUpK0pp46Ks/2U2OOchuYO5oU H8ORaoa4SGEcI33tSvXQtmLWIAel3JQUZnuqZxhfxk057Gnr/vGrf+vmLn07GOR9O0za8g3R1fi XKfVnwqEknPX7gxcWtfXAxlkJ9DvQJLJsA//g2O7Rdj+v87w
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

The binding dictates using 3 pwm-cells. Adhere to that.

This fixes the following dtbs_check warnings:

	arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: pwm@2084000: #pwm-cells:0:0: 3 was expected
		from schema : http://devicetree.org/schemas/pwm/imx-pwm.yaml#
	arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: pwm@2084000: #pwm-cells:0:0: 3 was expected
		from schema : http://devicetree.org/schemas/pwm/imx-pwm.yaml#
	arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: pwm@2084000: #pwm-cells:0:0: 3 was expected
		from schema : http://devicetree.org/schemas/pwm/imx-pwm.yaml#
	arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: pwm@2084000: #pwm-cells:0:0: 3 was expected
		from schema : http://devicetree.org/schemas/pwm/imx-pwm.yaml#
	arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: pwm@2084000: #pwm-cells:0:0: 3 was expected
		from schema : http://devicetree.org/schemas/pwm/imx-pwm.yaml#

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
index d59d5d0e1d19..6ab71a729fd8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
@@ -282,7 +282,6 @@ i2c_rtc: rtc@51 {
 &pwm2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm2>;
-	#pwm-cells = <2>;
 	status = "okay";
 };
 
-- 
2.43.0

