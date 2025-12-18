Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A97E314B62
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766057999; cv=none; b=BUr07KVLvIzbnGmS0ofGaJQhazkjW/NK8Z3rwEbk0tn6Kqhm0TQyPmmfT3JjLQqluQXpVLFaoefYI+QI66rNoCmQ3pWHZ7mGWTLnEi3mPfLWUzAIGs06NQ1WNIUODvAwzteZAfAEdSZAuFKMY9ueLN9DQ8qdwd9U3G580oway4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766057999; c=relaxed/simple;
	bh=P3W/nYa416JRQb/FrNf77RdefDEHVchQPWDoMF3Ijng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZsRy4gqQTQ2PwIP0HBlrw7y6ZKWS5IJjVjcxnRzKJaiW4VFvKFPOdeCaL62OU4QDoFM/g5KqPbE3Atdizb0/iNNx6PfIzcj25yCKxUrYWooXBTNFaNR1RzODhAPBmTiBZsB0dhYVqlNsrirhoCW8atjYi5mMLJjSJ9+R3OPTQyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1vWCMB-0001vK-3X; Thu, 18 Dec 2025 12:39:43 +0100
From: Fabian Pflug <f.pflug@pengutronix.de>
Date: Thu, 18 Dec 2025 12:39:21 +0100
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-fpg-nxp-imx93-frdm-v4-1-cd3a9f6ac89a@pengutronix.de>
References: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
In-Reply-To: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Fabian Pflug <f.pflug@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::5c
X-SA-Exim-Mail-From: f.pflug@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Add DT compatible string for NXP i.MX93 11x11 FRDM board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43b..eab81799b0793 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1419,6 +1419,7 @@ properties:
           - enum:
               - fsl,imx93-9x9-qsb         # i.MX93 9x9 QSB Board
               - fsl,imx93-11x11-evk       # i.MX93 11x11 EVK Board
+              - fsl,imx93-11x11-frdm      # i.MX93 11x11 FRDM Board
               - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
           - const: fsl,imx93
 

-- 
2.47.3

