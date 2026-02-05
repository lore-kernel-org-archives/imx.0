Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F041B3D7D66;
	Thu,  5 Feb 2026 13:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770299317; cv=none; b=G1o8Th4/5fMphWaqz/SNXFJkzav/1lI/EzFhRMTDSHglA9QVJhpy52OTuXikxqaW3URsKoKLYDSXmgqKJZbcFZZ5gfxwaaUSd3ZLd1CQT6t+SE9UHb9HcBHqD8zYffBysJpmj+0xDVqBNfUHDpl8vrgjqtiuA2lekla9ePYbIL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770299317; c=relaxed/simple;
	bh=Cn/EAtedZedYK0uwF8Wq9LrAwIhhurB1Z5r8jOfkbbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FwzW5oiaUjQCeppHwOGBtDoZWT+LxAYKonmODJ+H7lE3RMBtUJo6Udf+Ykdk8+5v545S1VJn7DAd/+dqDCslc+JfdWRYVy0dX08yw38ZfTPH86YuSWozi0CCew2u00qGPjO3WVOxsSdumdBIpiGXhxxJREFfLBgmNhic2gMVsao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqzVgEzN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqzVgEzN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAE98C16AAE;
	Thu,  5 Feb 2026 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770299316;
	bh=Cn/EAtedZedYK0uwF8Wq9LrAwIhhurB1Z5r8jOfkbbY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XqzVgEzNjyHwC5ZCkCixwqYrm1jLIJILBWKaECAC+ucgA2qhE11aY5hgQmSTB0xbi
	 qKRV4M3RBUuzD1AQN9qfS1adfG94ELk6qTPZP0TjGxM9tNZT61xabJ2yQTLNX0Fe1V
	 c+hjelofT3yqMVLmecXvawhr2Ib28wrE3mfwZmbyFXXot+gmZ9ctUEGq+Hg2nJYZ4w
	 TGmgMQS33qqeRY+HBam5MSpEPZ5IzmtaaCWvD+Wa6DCQrNmSKuL8IrVpN4nkFuCxtr
	 bcvUW/rdaC04dASR8QjkV4PeO+nXoGFbdhowWVt+IDeEDJYJRJsUeH2WfvemXBi6Kc
	 ziGlqxkVYTt1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2128EC1EB9;
	Thu,  5 Feb 2026 13:48:36 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 05 Feb 2026 14:48:25 +0100
Subject: [PATCH v6 1/5] dt-bindings: arm: fsl: Add GOcontroll Moduline
 IV/Mini
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-mini_iv-v6-1-f7cdd8f88144@gocontroll.com>
References: <20260205-mini_iv-v6-0-f7cdd8f88144@gocontroll.com>
In-Reply-To: <20260205-mini_iv-v6-0-f7cdd8f88144@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770299315; l=1193;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=algPq/arrGx+pf1g3Tkp7Enc4ftUcdmvQiHVariAEtA=;
 b=c4+YM52B9c2HTNxpMVCWvx0euSMVsO0pWdEoTxuvfBUW2pf9LVaJF8GyBtqlRr49CiIRXuBse
 A4+BTgKNksjDzS+1ndtl8V+2pHmoHq02trvOttLwT81o3g4lMQXC6Jt
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

Document the compatible strings for the Moduline IV and Mini.
Also add a compatible for the Ka-Ro Electronics TX8M-1610 SoM that they
are based on.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..c76c1731b4f7 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -996,6 +996,14 @@ properties:
           - const: engicam,icore-mx8mm             # i.MX8MM Engicam i.Core MX8M Mini SoM
           - const: fsl,imx8mm
 
+      - description: Ka-Ro Electronics TX8M-1610 based boards
+        items:
+          - enum:
+              - gocontroll,moduline-iv-306-d
+              - gocontroll,moduline-mini-111
+          - const: karo,imx8mm-tx8m-1610
+          - const: fsl,imx8mm
+
       - description: Kontron BL i.MX8MM (N801X S) Board
         items:
           - const: kontron,imx8mm-bl

-- 
2.53.0


