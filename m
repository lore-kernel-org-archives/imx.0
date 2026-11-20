Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795167428;
	b=uEDzaMhB/dgM4doaDeOcft/sq4MTKhF1amucB1+/FQ5//ak34HiYXnfBvNDa0DD3D4iD
	 M6bkyLzkL6dgEKW/X3z+EQhVyqOs5ncRfEniWPcK56J+gmKX9j8F5sHKcQ3ZK/FycKDuk
	 t/3Ng1ZLxL2uWolXNMCkGE4BB3fRstc9oqJ9Ub29aSjWwV6ZqfVX0Fq4h7E/1Qi9DuLRU
	 N1SFFC74apVC3/jGV8I/jsxVVkCW/i+YcnwXJyza0R9rQ3hd2Pe8pdtzOKEyNjuVXM+3y
	 eDQ8bcFfR590ITNY2x0cU5Isatjef+Vqh7NLhB1P0KBDzkhQBet3MlEw7qVmkieMXsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=+u2FXK4znTAqjZJ6FO3Ims1b2AnL3vTXsMI+XlF8czs=;
	b=LA4iMfupB2j0BfUv/UqSgAJM4MGfox8etWad9ugBK0mFSWWJ9pGlrktmPgE3yg7zkPfz
	 MNALVaiziShjhNV1QcE8QlGlfqMvyOAlpXc6zldseeT2i24baAJsqkZ6wErQ6ASwnLQiJ
	 dnlgyqdtTuO6yt2FgGPfXX8tkuU0iGQm3Sa6NtMc8oj0CuYmYmqp6bmZUtQP/8qk4IB90
	 4r7E7qDfefSBCwRUnldEU8cOP+8Dzl1Gz2v0LTsU+gxSiFRmodSbTlqPGK6OcAmZDUr30
	 dxL0k2naAlNaT+zWPNm4wyJRfnz6kVhD0RzCuHCPuKGH2TM5SHUTJcozHq/Ia2f6YEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WuKZonIL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9893606A33B
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 09:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9893606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WuKZonIL
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id CE934205B3E;
	Fri, 20 Nov 2026 10:37:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+u2FXK4znTAqjZJ6FO3Ims1b2AnL3vTXsMI+XlF8czs=;
	b=WuKZonIL+YDeptxHrhGYNbKjjZqwqrio1cZL/F8ZzrOQPmrMiuPSwNc9o3/WlXOf35ZAYd
	dESumHV5L5qMTPen2CyWbCnw8zjRR+3plBd/QJqjScn3pE8B6tI6ZSKZRiCHqdLX/KRQ8w
	hgTpQDrz7F2R+uiSAra5nozciLlk2fNMAp6vGow8aQZ/aCp4b5Fchxc3+kHlX+8S/Au7nz
	kVdUf1T296rSnfFzaPMg/OpqnEEAun2OopM5MTODaf/bj5DiHqCEbIxFPwPJiq+BAoXlP0
	OUvrX0Og9Vei8k35FElzE2AK39wjrIlBeg/ikFfyrOBNcQ3sAAHS1oZwjBqzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+u2FXK4znTAqjZJ6FO3Ims1b2AnL3vTXsMI+XlF8czs=;
	b=ctzx0h7Po2n3uMHOrnG+CsJuZYGk2zzQmVUbSSWT6hF7pZO0GDsDYY8hIxUmo6wsHbQsoy
	+jmDiaoHzfjbh0zlbMgT8/jfPJJgO7C0dDEEzEYyLNrGrNau876U1iXxFnGXtZPB9c7bXc
	4H6GzuJMTOiMbLdyUk0HsnYhwrzRqOneocEc0Zihq1XBKSOGVN2fMwq+1Q8C0eMIxWJ1V2
	rcWfjkIGvyF5xAX9Uhe3j+NzxooyrwMhNRh9xmXNj/OomvNosmTEA2VyVNskF3Wh4oOiu+
	XnF1wvU4+vZfGDf2TeER7hJ69owR08Ycp0YUJu5ZcKp4EEwXRlyDChbTDuOyEw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795167425; a=rsa-sha256;
	cv=none;
	b=Slc+e+svzZDkRlhI4NqDF+JHHOvHFuqqXOFaM4AgbXDsXQUv+Qb3GzOo5iQr4cRCArJRKl
	/HT2Z3oN4WbI595j30QL0s21TKa6veYPNHBkilfJAlLs74zjCaFFktEUb14BAKmFhmtsja
	KxPEAKBpWhQhXB52fzXyFNGlGKc5uzhBxC7QUBiS8m73IP8Syj2XOJ3qvFCQhnda4ui7Ek
	rA3H+galYpteoM8Uf3uXi9DNFehYb3fPle6p6V3iQ532ZXSd4rf7J7oAmDYcjAcbCeXeKk
	FDlTsEXMxUBhouA9oBfDFQk9NwvJeOp3AidQhh/+A9EV0smt+lA1i426kQLeDQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xUL3J-000dRE-0n;
	Fri, 20 Nov 2026 10:37:05 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Fri, 20 Nov 2026 10:37:05 +0100
Subject: [PATCH 2/5] arm64: dts: freescale: imx93-11x11-frdm-common:
 Describe PCAL6524 supply
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-imx93-frdm-fixes-v1-2-78dde22a56fe@pengutronix.de>
References: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
In-Reply-To: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Freimut Diener <f.diener@pengutronix.de>
X-Mailer: b4 0.15.2

The PCAL6524 GPIO expander is powered by the PMIC's BUCK4 regulator.
The PMIC in turn uses the expander as its interrupt controller.

Referencing BUCK4 directly through the expander's vcc-supply
property creates a circular dependency: the expander requires the
PMIC regulator to probe, while the PMIC requires the expander for
its interrupt.

Describe the expander's 3.3 V supply using an always-on fixed
regulator as a proxy for BUCK4. This allows the GPIO expander to
acquire its supply without introducing the dependency cycle and avoid a
respective warning:

     pca953x 1-0022: supply vcc not found, using dummy regulator

The proxy does not represent a separate physical regulator.

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
 .../boot/dts/freescale/imx93-11x11-frdm-common.dtsi      | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
index 33ed26aafde88..617f2229b559b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
@@ -49,6 +49,19 @@ button-k3 {
 		};
 	};
 
+	/*
+	 * PCAL6524 is powered by PMIC BUCK4, but the PMIC uses PCAL6524
+	 * as its interrupt controller. Model the supply with a fixed
+	 * regulator to avoid a circular device dependency.
+	 */
+	reg_pcal6524_vcc: regulator-pcal6524-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_PCAL6524";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -207,8 +220,7 @@ pcal6524: gpio@22 {
 		gpio-controller;
 		pinctrl-0 = <&pinctrl_pcal6524>;
 		pinctrl-names = "default";
-		/* does not boot with supplier set, because it is the bucks interrupt parent */
-		/* vcc-supply = <&buck4>; */
+		vcc-supply = <&reg_pcal6524_vcc>;
 	};
 
 	pmic@25 {

-- 
2.56.0

