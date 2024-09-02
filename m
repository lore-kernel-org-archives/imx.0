Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72631D6C60
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 11:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725277638; cv=none; b=OaIdoSgig56U9NDX0OBtCGOSGI191OLN75RMs0bwMeLpeqZ72ybLbdL1O9t4ANyBUzicRIMURzrTMCoptx/VIgBpYXptkSDJzbfc+/PL2VHqqZL3Ko1ZmgClUaczD2/RqMkBTQVgDAvE02Q+7MgcdrZdhlc8y4dV9HVanL1nIl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725277638; c=relaxed/simple;
	bh=ph0MXoamEmViMh9DYvXuPU1uK0cgYTDOZbMQjokOiXM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PdnpsgO5eLikYUkefDGZ/VvDaWT9RxOyM4rstz54vRc2o9t6rOJ/i1ia3oJzs1BRuAAB+4CO34k+7RL4l2ZhxYamyT5PIZIjunCx55uSd3PfAlfBjQfg5SirB4SXYm/CUwuvm3B2NfDynVRnZexUSfj7wo78Een+H45iAw9TN18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=oD1K7pIx; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="oD1K7pIx"
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 940A988785;
	Mon,  2 Sep 2024 13:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1725277629;
	bh=P4vx2HgIR3izh1J5lW2uPXrQvIDhXOL/Lp6N6ZdGDzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oD1K7pIxexTWCY7Bpg/yDdcKIIYW6UbhmtpLBQw6/13pL7deVunHNSW6wXqVZkmXd
	 vCsSr3XOytu1FotzH78pvrSPcYO2338QaKleWvugJRUjEUvkfJBg7C398EDm01BP3y
	 WlgR1wMpK7Asml0OqWrg7GQw0FhOunjx4IGOeeVgYcMw0Dcho0yO9CQ4tK1y3kmrgW
	 SE9TCf1kcgcvwdeyHWXGkRQfMsO5ybGFipYAoiXTjFkt09NxJc7siaPu2UCeodb23i
	 Iz1LLF0yNkdfhhOMvDFY+n/mwcaf1Ut4vBSqhoLflgWQHn7fKALmAoymhtN2RL5HsS
	 kemOQWfhcwkQQ==
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH] ARM: dts: imx28-lwe: Remove saif[01] definitions
Date: Mon,  2 Sep 2024 13:46:52 +0200
Message-Id: <20240902114652.893272-3-lukma@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240902114652.893272-1-lukma@denx.de>
References: <20240902114652.893272-1-lukma@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The saif[01] nodes are specific to other group of the imx287
based devices, so need to be moved to different devices description file.

Leaving them here causes issues with next revision of XEA device.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi
index 0fc74eeac217..410dfe17f8ca 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi
@@ -55,23 +55,6 @@ &i2c0 {
 	status = "okay";
 };
 
-&saif0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&saif0_pins_a>;
-	#sound-dai-cells = <0>;
-	assigned-clocks = <&clks 53>;
-	assigned-clock-rates = <12000000>;
-	status = "okay";
-};
-
-&saif1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&saif1_pins_a>;
-	fsl,saif-master = <&saif0>;
-	#sound-dai-cells = <0>;
-	status = "okay";
-};
-
 &spi3_pins_a {
 	fsl,pinmux-ids = <
 		MX28_PAD_AUART2_RX__SSP3_D4
-- 
2.39.2

