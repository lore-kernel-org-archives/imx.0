Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795433145;
	b=VQ01l/UqEp/QWIsMG66vOAZBp8dE5amlf2G989dt3OO1HOG99zBmNfQ0quHFetdekyHR
	 D+GxJvLBUh8xAaQNoBPeTfdpcca//MuDFOFE6YL/tSGMKSLt0Pix+qW6QfE+hsYUGkEn2
	 R4KdSpf9hlEWFveku/Qb3veOOP9/38JAsQcttIXpFfzGvfIfwu201s0HRuSSgxIFlb6p+
	 FJPFoNz4k+ynfdOIC6vXeTU55gYGHtLPtYq/bKwxpZzLfKos1aS8vIuQi71o65gsSzsLU
	 0637gsJN511DJry4Y7hZY3z632PP6dKzKNXruibFXZdyz6VQB30Vn2yCG9dH52vF5Hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433145;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=9i619VUkzjRlAOTYasUS9lnWRT+j5nIwsaaf6wvh5Wo=;
	b=wcbdRxnKiWwiTF/ODSkYc/rhPynZ23S+BhMh46cV8QaiB2chKsT2rCv2jK0oacNUS3BJ
	 DYwXqIAnMWx0yZcQ4+d6KFUJTBs1dndhB7Jf1D972Ib9wH/bez8lpuLotzAmjikShoNYZ
	 lBJQ7RUzsiVv2qAJ5gg0cllpT9LMN81RUc1/j5Majpo8KyDshT4jg0axohYZ5nJpd99XN
	 YQDeJnBniXuMUtbi9tXK6jGQFfw9huyz5TpyNHVWWUPy+DuPrPrZVexDO9zBLkuVtpmwd
	 hhDRVHzwwtwkiYkaWfodO5XHCQ8GhYylMNQ925st3mqj1OAjAcqeIshqXgcfH1c48Nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=QELFWCRI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506B3606A31F
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 11:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 506B3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=QELFWCRI
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 85108200B79;
	Mon, 23 Nov 2026 12:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9i619VUkzjRlAOTYasUS9lnWRT+j5nIwsaaf6wvh5Wo=;
	b=QELFWCRI/YMRTODpYMAaTVzFpAbrLSxBSoCzoAIbpuZzj2q/xElkwa8mT119G7ZIJ938SD
	+mskMFKwJGsgn2UR+Qdkh17dkXkIfKGXtN7BXSkzah+xtHFIzO5ETaWhPhC8p67vxpW1Ia
	l0/276Fs2qp4z2KO8ON3koCkNpszu5oGGxljpYwOEHGExdrtGxO3tcyP2AsdBfKhiC/oHz
	/FqtDo+65t7x0iK+AX/GY7NBFW4smrFuE5vkSLusAVC5eY6T+Fj0LuuEZUg6bRIR41+sNH
	2gegrZzzpBafny9Q1oat7kHNkcUueD06/mHZxrmykik4ij7D9SFB3dCAh/21Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9i619VUkzjRlAOTYasUS9lnWRT+j5nIwsaaf6wvh5Wo=;
	b=D99SckPceFM8GjoWU7L9lZM/tSQS370rhm4HivDfgrFy4yX7AcjwXiotNOenOVkRqBTF0u
	pQye6/ntdUaN8Mghi4UsM0AVoTtogzv25i7Ab+8qF5qyOypXpqMdrr0oUCvbK2FhAFp0cq
	rpD5MCVVpu1jBjI5ii4RP8GNGd7ZdCcPv1bV/kjV1jUnOwCufX+yFnM+Cqa7cPhGF8h+RY
	L/Nl20PT3Ext0OpPwrLzR9WrST9/jAqCbYL92RS6Sd7qMoYw8PZGyt+Gy5JsGsQXQ8moGc
	4mjdq4NO/VEcGafa5kjw55LcZRqd6iTWrXJ2JdgPRg6YCJspDJ4XCmn3u75jZw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795433142; a=rsa-sha256;
	cv=none;
	b=U9h+4/Q2VCp+yKWW0T2gaD11LHgBvKnCai8ccpp+YVyr+YQ9lozLZNlW+4DL6/OPVjyjB0
	ww1BgKUPBpkfZob7SoJC4eChOBlVU6gX1Jk/2vXFayeBrReYJeiuD4kI22IVTN20+WBzFf
	FRL5+Z6sry86JxGxaw3AxN5OjJgpRdRdWkSUaYHw0u3TPmq76fycOPmo0VljMTCfYegN95
	lH7repmWO+p/43B1FlchKRH1gSHcCDLap35RBAWNuoFnKp0ewvNuMPdOQzFH3Estraikt5
	FYsMKWVVlxir8RJQbY+Hod3B1J6gSL/1HUp9mxeNXoQpfInFaL2Lg5fHlcdtJA==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xVSB3-0016XI-32;
	Mon, 23 Nov 2026 12:25:42 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Mon, 23 Nov 2026 12:25:16 +0100
Subject: [PATCH v2 2/5] arm64: dts: freescale: imx93-11x11-frdm-common:
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
Message-Id: <20261123-imx93-frdm-fixes-v2-2-dd97c7fca4b1@pengutronix.de>
References: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
In-Reply-To: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
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
index b3dfe516b1d55..e81b2342c50dc 100644
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

