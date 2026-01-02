Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BEC2FD1B6
	for <imx@lists.linux.dev>; Fri,  2 Jan 2026 18:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767376852; cv=pass; b=dsHZODPBoKUTkPnj3Rgtpa30mb9gsGE3okT0hbc3jOwyDetqA+RXpPLkce8fgHvN8+WfYe7vYqCVlEeglhopylOBspPEJ8VnnkAAcuGFDZj+q4tSVc9kA29n4QBFGR+R6IOpvQrrQiHpmM0vSv9y1kwTFYUkwk4zDScZDBQg/o0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767376852; c=relaxed/simple;
	bh=UmB/Zvj2CEeBiKzr+kPyp+yV+9d3byoCdoSJYcTCbbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=upq+Bo5Wrljwkw2XyqzIm9neSEukQzc7a4Mg1mm6RWZpAKT18ru+6uX04uxD3ZKZc2igUA8KJEsf7IRz9oDD7emxO/PhWiOnY5+rM88+Bhxd52Gyz3/5MXI0esRxVwLfNzamKQqEP8CInndViuFBP4RJXhJE7bd/S5hPM8vd9EY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jm0.eu; spf=none smtp.mailfrom=jm0.eu; dkim=pass (2048-bit key) header.d=jm0.eu header.i=@jm0.eu header.b=hBWflBbP; dkim=permerror (0-bit key) header.d=jm0.eu header.i=@jm0.eu header.b=fmb8knCD; arc=pass smtp.client-ip=81.169.146.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jm0.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=jm0.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jm0.eu header.i=@jm0.eu header.b="hBWflBbP";
	dkim=permerror (0-bit key) header.d=jm0.eu header.i=@jm0.eu header.b="fmb8knCD"
ARC-Seal: i=1; a=rsa-sha256; t=1767376838; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=IU13SRqmCuFz9WibsWO/8sQOEN80qhuPtyZRd8wKJQKek8tiyRMTB7FZ0B7rptqeGs
    Box2RXeI9zKHlQXTuuuH6B1O+mOdCFNWmyYux1BPlFM7MKbUA1Xdc3lvaadcrbBKzspb
    S6wGIGOJ2F2jGm//mW1SzeN1ZoNQcYM+gcnSche4ZKid8ptY0NFty3SRU76CDVgW3xs9
    /aJibXQsBNDvy39LEOPVLzBhoFQeecWPK9pGhjpP95/v67FXJ1w2gz3Eww+A5xEta6nW
    M35qM+yhhWRwEnqLNPwB9tHwZzEqtgUbRL2FbCQ4cNMBqX3eRe63WYN/X8VKIUxYVr8h
    AGRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1767376838;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=0Asg95GJHRYYRrgfRPhQS05Ear6e3z4tU5KMDrFBRZM=;
    b=WxV3tD9apIoYO05ioQL48rEXrwFHBm6zsbwIvtI5AL6MBS7VB+WvXBam22gA1HzC3R
    n3h8S2nHEJa6u7k5bVAJbf/GgCjcuk/juGpvg8geLN+zqK4UCERvB7YEFQtJ1M5Ge6dV
    +485P1WUOECAHTTnEWdWTwg5ljXenHWd6sbaABBXi+kux3jVRcnWSxrfWmzQ79DA31SR
    2p8QTMXwF3QmIZZT7MCAuw024twWXgxi859VkXkOW07A4ymS7fXoXrG+6THMzziYOn2r
    mZoxjZlr/DApL8jYooSUcICEhgC1vuJd+GDq/HR8JKnqBWielTKH74ZtyhAzKnww2r4y
    +z1A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1767376838;
    s=strato-dkim-0002; d=jm0.eu;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=0Asg95GJHRYYRrgfRPhQS05Ear6e3z4tU5KMDrFBRZM=;
    b=hBWflBbPWgIWIkwGBCSYV7bMa16sPrtjxIIHg9nIae7WEn/Gmf2nmBhaxG3imBXf06
    F6kFW2WXTYh1ba7E/Mc4Y/qLCwHWY6Kvm1pDJHJHxYzscUlHDSowC0+gaI0V+RTe1iU5
    eGX/Jphx+VGvlyKM4akWZvbKXawRIFPV9jDKCNRwcpDinrYvyNYWnLcCJcghm0nlYLa6
    aL0GXfyKuBSCb/jZKXO2UpwvOKWxmALP6R8RsnI9KVktI1K8Z2BvJzAO+yjWJtAcmJal
    LzoZIiLMoPZczOYFsW6atYqVde3U5PnScQcXUyB6m9cTLrY9WyFRSPNGYnkOJTh4nFdR
    12FA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1767376838;
    s=strato-dkim-0003; d=jm0.eu;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=0Asg95GJHRYYRrgfRPhQS05Ear6e3z4tU5KMDrFBRZM=;
    b=fmb8knCDGGGisSp3Kuir/I1mSfTxi5qH2pieptBtj5sTYFEhIUcwRvDFaMYsFElXSO
    5uynNR/unyG+dScGicCQ==
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPTeoCaRth8YQivJ4sfKeu9QyRDNI="
Received: from Wablet.localdomain
    by smtp.strato.de (RZmta 54.1.0 DYNA|AUTH)
    with ESMTPSA id z0d4ec202I0bEUA
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 2 Jan 2026 19:00:37 +0100 (CET)
From: Josua Mayer <josua.mayer@jm0.eu>
Date: Fri, 02 Jan 2026 19:00:31 +0100
Subject: [PATCH 2/4] ARM: dts: imx: imx50-kobo-aura: add description for
 battery
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260102-kobo-aura-battery-v1-2-501f2a8fa575@jm0.eu>
References: <20260102-kobo-aura-battery-v1-0-501f2a8fa575@jm0.eu>
In-Reply-To: <20260102-kobo-aura-battery-v1-0-501f2a8fa575@jm0.eu>
To: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua.mayer@jm0.eu>
X-Mailer: b4 0.13.0

Kobo Aura has a rechargable battery that is monitored by the embedded
controller.

Battery markings: PR-285083 3.7V Typ. 1500mAh; 575327416288 5.55Wh.

Add description for this battery and link it for monitoring by the
embedded controller.

Reviewed-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Josua Mayer <josua.mayer@jm0.eu>
---
 arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts b/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
index b1a6a9c58ac3..dc8d9fd45cd2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
@@ -16,6 +16,14 @@ chosen {
 		stdout-path = "serial1:115200n8";
 	};
 
+	battery: battery {
+		compatible = "simple-battery";
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4100000>;
+		energy-full-design-microwatt-hours = <5550000>;
+		charge-full-design-microamp-hours = <1500000>;
+	};
+
 	memory@70000000 {
 		device_type = "memory";
 		reg = <0x70000000 0x10000000>;
@@ -151,6 +159,7 @@ embedded-controller@43 {
 		system-power-controller;
 		interrupts-extended = <&gpio4 11 IRQ_TYPE_EDGE_FALLING>;
 		#pwm-cells = <2>;
+		monitored-battery = <&battery>;
 	};
 };
 

-- 
2.43.0

