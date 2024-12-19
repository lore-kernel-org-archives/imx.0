Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE86217F4C
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 07:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734593274; cv=none; b=VFGPeNCmmd1iZ7iXwoGkjiXhzydj7wxt51IlxlVT8rdVqG+9+Z9aUGT0us6ud3w5U6HwZQAAJx8ZnVRP4MC77B01Cjhw/5A0K5GgLVozeujaSBs6uSyn3uKPv1jR5XuF1gCrQOz8rpafaL2upa4TpLBGG8x9TeAyt2LbHAgmn2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734593274; c=relaxed/simple;
	bh=4wlXlrcvAoFBD5bO4p74HPRRLLelFGeOYkDT9zVIU6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b8IMFrHpfzpMhJpI1COg0ZIEHKXBD4IxVGGdmYF55eL1xUD4giLlJoGT8CtcOO5xBD49EibBOLHeT/SPjNCKE0I+GTz9F8m8p/faaPsRomeaHnfghWfofFLBguuD7ZerdOmZScHHhxkes/O+40oS2FZC1p2Sh5EAt6S1LbJvux4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAwX-000728-N6; Thu, 19 Dec 2024 08:27:33 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAwW-004AP6-1J;
	Thu, 19 Dec 2024 08:27:33 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAwX-00Gewn-0J;
	Thu, 19 Dec 2024 08:27:33 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Thu, 19 Dec 2024 08:27:32 +0100
Subject: [PATCH 1/6] dt-bindings: clock: imx8m: document nominal/overdrive
 properties
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-imx8m-clk-v1-1-cfaffa087da6@pengutronix.de>
References: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
In-Reply-To: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abel.vesa@linaro.org>, 
 Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.13-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

The imx8m-clock.yaml binding covers the clock controller inside all
of the i.MX8M Q/M/N/P SoCs. All of them have in common that they
support two operating modes: nominal and overdrive mode.

While the overdrive mode allows for higher frequencies for many IPs,
the nominal mode needs a lower SoC voltage, thereby reducing
heat generation and power usage.

In any case, software should respect the maximum clock rate limits
described in the datasheet for each of the two operating modes.

To allow device tree consumers to enforce these limits, document two new
optional properties that can be used to sanity check the clock tree.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 Documentation/devicetree/bindings/clock/imx8m-clock.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index c643d4a81478..a6ae5257ef53 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -43,6 +43,14 @@ properties:
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
       for the full list of i.MX8M clock IDs.
 
+  fsl,nominal-mode:
+    description: Set if SoC is operated in nominal mode
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  fsl,overdrive-mode:
+    description: Set if SoC is operated in overdrive mode
+    $ref: /schemas/types.yaml#/definitions/flag
+
 required:
   - compatible
   - reg
@@ -95,6 +103,12 @@ allOf:
             - const: clk_ext2
             - const: clk_ext3
             - const: clk_ext4
+  - if:
+      required:
+        - fsl,overdrive-mode
+    then:
+      properties:
+        fsl,nominal-mode: false
 
 additionalProperties: false
 

-- 
2.39.5

