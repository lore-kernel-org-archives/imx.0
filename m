Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112351F03DE
	for <imx@lists.linux.dev>; Mon, 26 May 2025 11:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748257384; cv=none; b=AOb0vo63+YxmFWI6+1kM3eQ/W5GsX1MHkgn4S38NvoahltGRO8LdVBWecxXNTBMUXwIB73vFxer7zQIEytTch3tgl+0GDJTGIDKsB8RyP38J+7PMigoa7nLSoEmcCfh2hrfKNC7dc2Xp0FZpTloREM2lykivEQMwkMIuKKZbNDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748257384; c=relaxed/simple;
	bh=RPruV8pXv+YWVj6ruOLKMcAXK77+t7eyorFAZ0RyD9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qOO1ALbkIzTLT0JSEdKkZmp+qe2Vsnz3L80pCXJADFs0GjZ729JGenJyU3GgeCvvvatifBUsjb2Is4dZDPKY4Iko6Jxwmh90OswzjKd2XVd4Ag+12VziIIQOCNsTNR44O3fesFewBfn62N9SEcrtn6ZxABhTmI1IEE4kvFgHJrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1uJVbX-0000Pi-9x; Mon, 26 May 2025 13:02:51 +0200
From: Fabian Pflug <f.pflug@pengutronix.de>
Date: Mon, 26 May 2025 13:02:35 +0200
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-fpg-nxp-imx93-frdm-v2-1-e5ad0efaec33@pengutronix.de>
References: <20250526-fpg-nxp-imx93-frdm-v2-0-e5ad0efaec33@pengutronix.de>
In-Reply-To: <20250526-fpg-nxp-imx93-frdm-v2-0-e5ad0efaec33@pengutronix.de>
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
X-Mailer: b4 0.14.2
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
index 1b90870958a22e49355dd1f932bf3d84cd864b5f..948b87150be813d24fce795b737723c20f512ec1 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1344,6 +1344,7 @@ properties:
           - enum:
               - fsl,imx93-9x9-qsb         # i.MX93 9x9 QSB Board
               - fsl,imx93-11x11-evk       # i.MX93 11x11 EVK Board
+              - fsl,imx93-11x11-frdm      # i.MX93 11x11 FRDM Board
               - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
           - const: fsl,imx93
 

-- 
2.39.5

