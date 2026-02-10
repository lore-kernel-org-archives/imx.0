Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D3E33DECB;
	Tue, 10 Feb 2026 08:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770713145; cv=none; b=oyIiGjJEFhTz62hldZuh9/BIu667YgLWqBySEIwmjVzWIDxmiXVUcCsyoK0tUVKF5fK7UR+SYkuCkZexLQgrA7F9y4hsKG80uPeDsfZmo12rOS31JDNsRAjAL1tMtKhSMb7IumM2da87ioV4Yr9tbKLwuIvZ4ZuSZYTPc6iY46w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770713145; c=relaxed/simple;
	bh=Cn/EAtedZedYK0uwF8Wq9LrAwIhhurB1Z5r8jOfkbbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AlZCfYP45Wpn4FWYN2dqS4vOtFThcnAGea8NRX8T+TXxA9eduxE+DZzhG1jkJ+NFcjkJ1YxzXZdzFQeNgQ7lPObtUbww22M5DXYXH9WtzaDj8zfp3PF8Q7bmTqZN5aYpVWq7qlZOVSww2OKKL7SCj8bzu03pfxLaWeraYKx2cXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTW2/WTg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTW2/WTg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF23AC19423;
	Tue, 10 Feb 2026 08:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770713144;
	bh=Cn/EAtedZedYK0uwF8Wq9LrAwIhhurB1Z5r8jOfkbbY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FTW2/WTgldLyGfEnOkOm6OZT+xXaXOR/jcEg9gkjGhKNIsbayoRoLKaFZ4dnKrUNS
	 wB/3YVyQAUdetK4Skl0Q7JWpTXWc0ia/13TPMJoY0SH3Po4HmaTVt4baM1hxTREmiM
	 Z8CAvJLtok4kCTtZcn4W2JKX7rBoyeHZnkA8cr4rwWdWyplEIroUGA2N3wTk7WF4up
	 7BbOpKTRFrva5cXhPH8TvwJ7bDU7fqLo05q4OeT7KKkncseKr+ZeHuFtLCWMRLQbOW
	 +eEPl23keC780uR0S+DFnS+AyG5EvBFh/BhMN44hy8H+lrVia1G0py30HJeKo+UaLq
	 TosYXi9B6XagA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE4EEA3F22;
	Tue, 10 Feb 2026 08:45:44 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 10 Feb 2026 09:45:39 +0100
Subject: [PATCH v7 1/5] dt-bindings: arm: fsl: Add GOcontroll Moduline
 IV/Mini
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-mini_iv-v7-1-a3ad8e7ddf0d@gocontroll.com>
References: <20260210-mini_iv-v7-0-a3ad8e7ddf0d@gocontroll.com>
In-Reply-To: <20260210-mini_iv-v7-0-a3ad8e7ddf0d@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770713143; l=1193;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=algPq/arrGx+pf1g3Tkp7Enc4ftUcdmvQiHVariAEtA=;
 b=LOoXIRGdb5Q0XkniyBxhSrhM+HrO3jKKnhitagvu8ObMWQ9cAz7VNgsFZLCj38gtkj4iE2wpy
 F7xvHIk+L2cDGtfT24gG/uh1dZu58PDVwS+XzTrEY3wIo+rWPprR8vG
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


