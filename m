Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795433145;
	b=XGcQFyMHo8BQ1kyiBqxwmKqLVVsbBqnqh+0AiXflwsiIElm3ztHGmb18pUQhxOGE8JEm
	 Bs37wmpsfqDZ1IK7OGr8nQJP3Hnq2O+4CptjbYgGInssPhNtaaWKJgxTAiR4dQHZn8kyb
	 /vdCwJjEirVdaetNZEQxH66pGM4leakbgkX9+qWIxRnUzCWrNaUC7LwlBb0lgQZes5hB+
	 gbjGDxi0MPYNAheay6tzcgOeKjv6NC0DfDNu0ikzkXxEHglHS76rGS8JgrSIY82ELrFb/
	 hOXqvByuqGQ90GH3IwIrhnk2qsg36VA8RsgDrlnEcsi10AaBzavqNZOg9tmaoM67dvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433145;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=pOKaXS0qbD0x2/EeGlN4GmzV2jn1hcGOq+oOXXUw1Nk=;
	b=uR6xK+tfveDWhd6hFhkolMzJYr0th6VULBaqpuV9j7/OR614Ydu6WfKgiNv0hD+D1nA2
	 wexKnoVGqWxpojFZPGr1FLcSGG8idTHiRnrRHdxZwf6+VLdgv7+8DzbrpiErFtWW3vDnR
	 TZGznPFvO4/VH/vPAFWsqxg4TOG6yW5lASLHaxaQChpuPWEJWTn74pXss3RkUDLopaPn7
	 3+d8PnFM3sx3K8KHDSWjaGjen93N4eCJOQst69HvX+DBUWRjFDPbCmMJlOLXctPymjW9R
	 MWpACVz/qCrVaJb3DYMoSfd2zsTmTGmSaXnWVojjaEsVG8GaKuCTfqpLRe07VIv6zcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Yc6dCfrT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53582606A32E
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 11:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53582606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Yc6dCfrT
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6A7802007BB;
	Mon, 23 Nov 2026 12:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pOKaXS0qbD0x2/EeGlN4GmzV2jn1hcGOq+oOXXUw1Nk=;
	b=Yc6dCfrTK0bDAynaw5DasLaCruMwWMep52YvHXOSb8rdSd9Y7Dy6oRB2fXJ8tFBOwuK5QY
	BeSOdGX+3EhA93poLKMDrlJI2u6Ly5GJP5QdNTSZ+BQBYpnz4sICMNBAKKDbdsNRTvWv8s
	gcL4R+9qDN2PUz7SMq05Sd5OVmSHSQD8pUwOl9TAQx4nOHyTnRnCc60dnxIpJWfuR1unC9
	c4YzIURMPo74ZbCr8YYk3vDwUXeV0ywotZrsm9c8yi6866Z7NU0WDjMoFxN50GyGfZ3p3/
	1gQrtQY+wJ3oUNGEnW2CqC1g0bl3YhmGSiKH7eGz+P5guBV2kgqTKSj6LLoQpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pOKaXS0qbD0x2/EeGlN4GmzV2jn1hcGOq+oOXXUw1Nk=;
	b=Pz8TWViJ2WDmuPCAiX+m81fDtwn68LxbtUgNs8D8qYGvalF5l/0oRlOgTKU8gcYZFb/GLx
	9Qs8gWtgYHTngjpc7kgNxleznliCyiOCHDs2G6BY4K9sP/+8YjixxIHZdvScmGnuNJYWGZ
	+eIiwFfJ4wkQNUSxG6xErFPjlQa0kI2AGnmf6RGgs5ydTh/3OouqiLkl/NmzdLMC/w7GCB
	p4nDcQCt6epZh7zVHra/5kDc+fbczORVYVyI5EviNDTzCLwZecLu/uWNyrAxm1wg5v1X9O
	G3dcz9xxZGDUZVRn0eFnnYFR8CP+Azp/eWGKvWjak4lLw2oniS08OPGVFcyvoQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795433142; a=rsa-sha256;
	cv=none;
	b=Vk1oo19Qs4zaSzjxCWqLcACwN2olbfH4WCnYxbW/qvDKIXZWjDVGLq9uCLGMB0OpSj+BSW
	cjUaYhgNQU46WSrB4VQ+aAm0XQUKeUOYWwXu7giSQFpejeygNNgiLQfMQY+Zfyu7EButPO
	Fr3WLMjFXohBb6QiSRpidibMqu5b4yshqkDbNeqGJ7V7xvpxHE7iy+4Eqgh4KSaSYvJdcj
	e1iKL+Dv2NmEvxyUN/XdYW0KNW/g+Q0IT62DGBHpyxhiT/aZvoWg+XCg3mAwCNSXkvY7+0
	U5Jzsz19zfrSgpC2PUlVgqCueU3x9VRg/eWa1xm1oKMhkE3yD1dM2ZTMYV5FGw==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xVSB3-0016XI-2h;
	Mon, 23 Nov 2026 12:25:42 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Mon, 23 Nov 2026 12:25:15 +0100
Subject: [PATCH v2 1/5] arm64: dts: freescale: imx93-11x11-frdm-common:
 Enable I2C level shifter
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
Message-Id: <20261123-imx93-frdm-fixes-v2-1-dd97c7fca4b1@pengutronix.de>
References: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
In-Reply-To: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
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
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
index 33ed26aafde88..b3dfe516b1d55 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
@@ -216,6 +216,7 @@ pmic@25 {
 		reg = <0x25>;
 		interrupt-parent = <&pcal6524>;
 		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		nxp,i2c-lt-enable;
 
 		regulators {
 

-- 
2.56.0

