Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7A82D837C;
	Mon,  5 Jan 2026 20:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767645603; cv=none; b=gIIlKuDp53jrPhvWyYlvuqdrGBQD5PWF2uBbVJ/A1QNDLzktFTNm4iK075t9+7nQbfOH+uGcARDDGqpWYLc5oT2gH53ZRryO8MzWDPV259RKm4CFnibADmJ4XSREsjcpmefbUF61mUsIeN1f9MGemU25eutIvWY2b0js33skxzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767645603; c=relaxed/simple;
	bh=bs0gu352/b2VPHCY6L9bgBSN3iHfKWpitMMSdUXLot4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LSX73AG6yO7PY3GOd/ykmQ+WCWBEkKMNPhcUnHZAjCvDD/ZThPiEwpORw/Zp6Xa5PZVJIPIDmz1hwc7O+d1ylQh68GtXwWbXJP4rAVrEijGyUnodd2AkEGgTBjusznoF8g8rnI8UeFcfqy919g4Esiy2e/yZRie4ZQMjt+nAf4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HszwU1xJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HszwU1xJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15C16C2BCAF;
	Mon,  5 Jan 2026 20:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767645603;
	bh=bs0gu352/b2VPHCY6L9bgBSN3iHfKWpitMMSdUXLot4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HszwU1xJeK+By8y7hwv/zMFFVDu6LKfHUqN8TnzvVA1vHJAoh+b4So8c0GeYZkFqR
	 mjj9o98qQBQlTLP2otu9WryI7khM1EP/JQt80ejUBIxUZry9S9n+mpzZhSu6tmK6Pk
	 PZHGzjq5e3zbSgKmaXgqFjf0KO8y4adC49UPnHe+rf9fA4U0p58MWh7o63+MzPP0rn
	 6Gw6X/ZlJs6pHHsZOExKtCszRVFtWPWiBMYNWA+5wK3LwDxgrGr6s/5yb4vUkopnJL
	 ppzCqLUFoWmo+ZT6dvmz4XBcS4ZWNNU8wEw2oOa/pu6xSQBPlK7uGEDZWmt5FgiJgs
	 6HSRNWYDzXRng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0D3C98335;
	Mon,  5 Jan 2026 20:40:03 +0000 (UTC)
From: Sebastian Krzyszkowiak via B4 Relay <devnull+sebastian.krzyszkowiak.puri.sm@kernel.org>
Date: Mon, 05 Jan 2026 21:39:41 +0100
Subject: [PATCH 4/6] arm64: dts: imx8mq-librem5: Limit uSDHC2 frequency to
 50MHz
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-l5-dtb-fixes-v1-4-f491881a7fe7@puri.sm>
References: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
In-Reply-To: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@puri.sm, Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=irl0zhAfm+ZidJ+mS4bm54p88aI15LNArncdYbrSJ70=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpXCGhUa/B36vt29Ky4lgETJGIUeQ0rm65f0UdJ
 asJVvLUtAaJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVwhoQAKCRDo8jXPO9vD
 /2w3EACl0zjF+MMlFtfaFDFk1Y+cQQHLZ22n6aJaMgKrMq+ocfwXWavoV/XvyutYmAPpyAIBBSi
 oSTL9U1qVWzv9v+mnmaO2TRVS/QtVxxlT4Teqg8HdmWEuACgveNenz3IVAef2N/QYIm2Inw49Xs
 Wc7n3mmo+O5OpZ7SMbn2uPbPxtdil6hQUTePXKCqe609IHNzc5/NdI6AX9+Ahm8qXyCY6Zs8Muc
 ljY5uW+A7/FGxKlpdIdQWefVBMzKH/5QayxErwI1dWRIRTsqEZjP02wvBCWBhAXH0XZDYwfVZN7
 2dq69it3T9skgza68vQlmdjz/zKfD1Jsw6+PY1NK2eth/vLAsfTiapq74/MLzIjBezfgtCwoJOi
 vzSosG96x1riMq/cGA/31QtzxoK3FmFoseX7Anjm0N9TQ81darAs4wdJ95fE9ODhhBmlMDI8b+x
 zSaGfmX2alecTymxvsKgtqvi8A49NbRm8HrKbYzMeGmvelGIsKEU8TgY7bq+ewEozHL8aJS4ycB
 4DgZFlwM7zADiU6fy7Oa+DWNv0Ne54+oKUVJmiIpVBax9cfiAsMnTJMh6G1I9ux8yR4gnmCehNK
 TFjnGGwRWgRlBgbg7TRBLqcU8jYr8WxOgm8OCZkEHYMAiI93mwNIrhuumnRzWdpPfRS2cibbnfF
 aKivrdCcZgPhIog==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-Endpoint-Received: by B4 Relay for sebastian.krzyszkowiak@puri.sm/default
 with auth_id=32
X-Original-From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Reply-To: sebastian.krzyszkowiak@puri.sm

From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

SparkLAN card has stability issues at 100MHz. It still appears to be
able to max out its throughput this way, so limit the frequency to
ensure stable operation.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 8c37b1293699..0e3c103dd7ff 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1424,7 +1424,7 @@ &usdhc1 {
 
 &usdhc2 {
 	assigned-clocks = <&clk IMX8MQ_CLK_USDHC2>;
-	assigned-clock-rates = <200000000>;
+	assigned-clock-rates = <50000000>;
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc2>;
 	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
@@ -1434,7 +1434,7 @@ &usdhc2 {
 	mmc-pwrseq = <&usdhc2_pwrseq>;
 	post-power-on-delay-ms = <20>;
 	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
-	max-frequency = <100000000>;
+	max-frequency = <50000000>;
 	disable-wp;
 	cap-sdio-irq;
 	keep-power-in-suspend;

-- 
2.52.0


