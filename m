Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14682182D6
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 08:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895814; cv=none; b=oWnn5g5dR3czJ4r/Y0uugrraZ5GS7jzIrbZ01gzeeZi3zRoUMnD9N8TPnkpsvkXbd3Opjgew1emDQjfz4aSLr58TPd95Wm/5fOxR9Wc9nirPPdyNB9vvFWSTqKS0Cr0tqF7PCKHmi2TUg0WB2Se4Io+qY/Hq+Gcz+sgUEUFbIL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895814; c=relaxed/simple;
	bh=tJ7+6MByt1nyT31HcUe58b7rgwBTJK3odAjzUrII9Ac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gDjnnHA1tiC6FrBn1eplaChElzNC4yPuYq1vzq3zIs2S38oO8gr9GhtKEZMHCi/v4uxhBYiCQdiC26uosmD3dpsHGeic6Nlr6Jxb3e4E1VssU7OWkSWTg3Q4SBnov9SAfa9qekqS3j+3nsCbbazqsQI5ImFcJkk5b67+xBUAwI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1weqLE-00051f-KD; Wed, 01 Jul 2026 10:30:44 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Wed, 01 Jul 2026 10:30:22 +0200
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: add compatible for new Skov
 I.MX8MP variant
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-1-d74f7e3f8293@pengutronix.de>
References: <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de>
In-Reply-To: <20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=tJ7+6MByt1nyT31HcUe58b7rgwBTJK3odAjzUrII9Ac=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ5bLBePAT7ervQ3Yv4sJ7D5wb9eGC3dvNasv9vv/+fmaU
 HP25C2mHaUsDGJcDLJiiiwqCyv4RD0+eEZOE+GCmcPKBDKEgYtTACYiwMjI0J4vHW2pfcflMUcE
 x/WAK0ZcvZsmPzo10eVbru4CG7kd9Qz/XXSqL51bF32jUnTDeT3li3fq/nhI3dlio+jxfevdu0U
 afAA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

In preparation for adding a new device tree variant with a different 7"
panel, describe the DT compatible in the binding.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59a..402f140fb5170 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1147,6 +1147,7 @@ properties:
               - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP climate control with 10.1" panel
               - skov,imx8mp-skov-revc-hdmi # SKOV i.MX8MP climate control without panel
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
+              - skov,imx8mp-skov-revc-jutouch-jt070tm041 # SKOV i.MX8MP climate control with 7" JuTouch panel
               - skov,imx8mp-skov-revc-jutouch-jt101tm023 # SKOV i.MX8MP climate control with 10" JuTouch panel
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
               - ultratronik,imx8mp-ultra-mach-sbc # Ultratronik SBC i.MX8MP based board

-- 
2.51.0

