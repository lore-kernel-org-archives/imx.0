Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795167429;
	b=x79cn36kegU/GmnlCaIIhaNB7aI4mVbG8ijWXQqMS/KUlgKLWd/D7nEpJJv/bjXplgVp
	 QqdF3U9LBiA8LOwZAHgS3lnF3hxyR05fdkJF3+VGhBVnj+NolgTkBO9bLGIQIFZscnmuO
	 GGT7Al1renuQXr8FRv5Gy0CyKOPilsjDp0wf3L/ptSXvSMEz12g/feexcPYLfct5CTNRS
	 ED1sWr6KUvbQRdOnjSdZO/zPDDc2fIT/+xYS6lFPI30gLjdXjcmKv1QFCcB/houjbpLmp
	 ep+4aUfjjQHFw7wICfOGrFb/1gbRyuolNaQArcVkfucG6RDj9MB35TNVn7lbI9QWrtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167429;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=u/ea8WI4QvoCYR4Pzy9fmHlLGkTbFqkOAdCbw3usoHI=;
	b=Q+dgNU4bP0t3pAIANP2G2mYrWaMD4Q75XqNRhpGCqMnHow8fYMNd394pCbmXUAEii7cN
	 G+cKtfVd1rLrAL/J5QhY8jsMw46mdV/I2jh5bMIpD97060f6tTaSRdNd9lJDpRgsL1zIk
	 MOmRBQf95fduDjDJqnfTWcruTuwff6jTNyP7X3O1t871/t/IK44I0Q+bJ38GdNaafm87E
	 s2LiPSzmTlS4AeaZpqwoI6PmdAwC9wrOOaEdBsFpWPVAIsoICtvYxZ2Uduk3Fuwyyf6FM
	 D9C91/YnCenbZOFOiBzZ6HDt8eTgrf7X+9DhtpRRWSAW+4MR2YZro+ZIMK0jMGV8jwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="PfAvd/Po";
	arc=fail smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9748606A338
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 09:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9748606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=PfAvd/Po
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B5B4F205B33;
	Fri, 20 Nov 2026 10:37:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u/ea8WI4QvoCYR4Pzy9fmHlLGkTbFqkOAdCbw3usoHI=;
	b=PfAvd/Po6QhIQSuZQrsOBBuA4Hub+MEX9kp9LkQQ+YR9hHR7stHXu7/v2HXWbjGfNG2wlP
	SAXXG6eL78prJDGzR+1IXWn7Stz7Q+9dUkOVA/bCp7rnzupDKCVpWeTod8SgUu6wGmsX+7
	X89V358r0tyMFF2gxvcsU+vsJuNk1g1F6X3Z+v229FVCdoIQYwsprdGNaSu9uxFyQ+D1lx
	seyLWq68J33OLjgUcfZVMl8Xmij8+2lpb5RXy1M3EBLaA22o6zIg/f2OsWUgNvTSscel/f
	5rfqi96pFfi4VtLp9U3Xd3CafP1DvfQYON5jAUfXxtBE3b6Ew+kg1NbyvnzAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795167425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u/ea8WI4QvoCYR4Pzy9fmHlLGkTbFqkOAdCbw3usoHI=;
	b=e3X6WgI1tmSuAY7Gd8MVPJDKkCmPMxsA3cXHQPJ34/y9xA14bJwuwL2Q30vFtvX2PMBEap
	rXXOt9ca0kdAnvIMgYuciVn2LXuPaEWQqkseJ5zKYI4wyoIK5ESc3sa/KWyTsNQ7Mfrx8x
	Q9/bXvlf+zSbFDFrbG8As9sbPAQbnM3NyE+xmMFdlxAKEslUTHGKvlkKgAAJrPZ7MHtd48
	+WBMbnw2LB+Uyddyww3jaFOoRiFKRp1/coi22+chWI5D3ZVTzwpLiR8jZf2AKLpbbjiwLb
	QPBZP3XT2nntzg7RJWo5qc+DC8DBWD/DF8oPTQhrvDH3GqcrfoFiq1uvhrCXNg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795167425; a=rsa-sha256;
	cv=none;
	b=MkpCPF8H9gwbi8Rlht0F8Ai0tnfgNAvD6ESJeQmJEeOCs62JGk75t5BHbjtc7KlVpgVr4u
	IZnEIwPOsEGih05Xj0KjS6vQtKncjaicNxdtoXJTfkZ0ibfLIvwtJZF3ZNuDQ6W+LzqhMy
	69FFDELAYZf6/DCwrDgnVn6YktdKdisQXgOlfjoDENlkHSZ/oOALcvoQf7CSSVjp52/9OI
	Bjf7yH6fVJJuSCF7aCvycRrCo00RZh9ydFHSRVJfRfu/YCMnX4NT4x2kgMadSV40NpGg0x
	UWvfferd6p2inyU4HCL+xlgiHuONR3j+DkmjtDaSOhunxkq232Dyq/AO3AZO7Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xUL3J-000dRE-0T;
	Fri, 20 Nov 2026 10:37:05 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Fri, 20 Nov 2026 10:37:04 +0100
Subject: [PATCH 1/5] arm64: dts: freescale: imx93-11x11-frdm: Enable I2C
 level shifter
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
Message-Id: <20261120-imx93-frdm-fixes-v1-1-78dde22a56fe@pengutronix.de>
References: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
In-Reply-To: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Freimut Diener <f.diener@pengutronix.de>, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.15.2

Without the PMIC's I2C level translator enabled, probing the GPIO
expander fails with input/output error:

       pca953x 0-0020: failed writing register: -5
       pca953x 0-0020: probe with driver pca953x failed with error -5

So enable it.

The GPIO expander is connected to the level shifted I2C output of the PMIC.

Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index 6e8351d120160..fbe3543e1ee8c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -49,6 +49,12 @@ pcal6408: gpio@20 {
 	};
 };
 
+&lpi2c2 {
+	pmic@25 {
+		nxp,i2c-lt-enable;
+	};
+};
+
 &mqs1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_mqs1>;

-- 
2.56.0

