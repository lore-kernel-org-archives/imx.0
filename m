Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B19334B404
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 14:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761141962; cv=none; b=mjYH/ZZTGe36eOUKlQyw0SPp6lXem96DGwvKHz9R2H53AK0JvH7wuBVyoq4kTmy1rHtqIdaWHUPih3zhKm6r89qXYRIy4NUk4gxtExIiWQyTAPtCfVS1hdvVohj95ItlP11K67iENFQLv7t67O4jtKOoegOWp9tfQjFXf4QC8yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761141962; c=relaxed/simple;
	bh=saR8fkaJhtju6P79c4vYgBM9mvrqeVO8oSr3Gib3Q7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XrsCobHrnLMalU/BDz3n06huCLDd4/swwe6ZS9WszRCVSQWJ3rye3eXTxI7Gx2pnT5qbCyslRBgJtcJDdEAE/b9RmtVOAmowcXGGe6Kqh1EWTp4spU5HZ4TT5YVckPjfxJhgSrwL7eQZOcjOnO6PAP2ZyPk+Q1rv1uvj/0/3aE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1vBZTI-0000vR-CZ; Wed, 22 Oct 2025 16:05:48 +0200
From: Fabian Pflug <f.pflug@pengutronix.de>
Date: Wed, 22 Oct 2025 16:05:22 +0200
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-fpg-nxp-imx93-frdm-v3-1-03ec40a1ccc0@pengutronix.de>
References: <20251022-fpg-nxp-imx93-frdm-v3-0-03ec40a1ccc0@pengutronix.de>
In-Reply-To: <20251022-fpg-nxp-imx93-frdm-v3-0-03ec40a1ccc0@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Fabian Pflug <f.pflug@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Daniel Baluta <daniel.baluta@nxp.com>
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
index 00cdf490b0620..c47407640e995 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1416,6 +1416,7 @@ properties:
           - enum:
               - fsl,imx93-9x9-qsb         # i.MX93 9x9 QSB Board
               - fsl,imx93-11x11-evk       # i.MX93 11x11 EVK Board
+              - fsl,imx93-11x11-frdm      # i.MX93 11x11 FRDM Board
               - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
           - const: fsl,imx93
 

-- 
2.47.3

