Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354E03346AA;
	Mon, 17 Nov 2025 15:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763391720; cv=none; b=FgkuUVSuNqajiIYT99/gvea/D07QcypY9nOfXjEJD8ELrlBmrZX6IUVLUWFc6VElcfyousUQuXVfbQRP1wP8usRlznBWY+RGV1/TrvR/x4z9udG6OkxoamI3F1jiPRpu2ooASgZe5q9fLWeB9PPbzkF6a6yp6c9wMySSW3wEDto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763391720; c=relaxed/simple;
	bh=WVhkVI43mZR4TTe2ywSYk1PNVt0cTNKe3qu+BSXpGsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j1wICHPyqFScXjy+224VkEmqVsIJgP9xW0i6WefUwXq9z9B25zgvxlJY+1a/boGQx9rXviRefcH4+IHVaci3nTtpcgE+wpQSWFEgojjmhWi0Of42ybeoDZ6lQVbvAHEOFUGpqwdoo514XGo9r9Hag1eEODtm7HAIpOGh9gmzkno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WUZ245Gs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WUZ245Gs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCE8DC4AF09;
	Mon, 17 Nov 2025 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763391719;
	bh=WVhkVI43mZR4TTe2ywSYk1PNVt0cTNKe3qu+BSXpGsY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WUZ245GsG3Ki9vnzh6xAdNwg6SUQ6KEXcpEAlRPTujC8G+rWRreXpQTPL06BBvzl5
	 0DJFTqnbjkQdgVeQxU6gzJbnvVMyip7V2FJxRu3jxp68p8CicGHS9V9JvwWf1fWm9U
	 hWQJcjsYTQ59RL8/L3B09TBdvKzPXzNlgMK/kHAoXdUd6Qk3be6QEmAHNDrIe9+O+p
	 Gp7qHZQmP7URsrOqBuJgDjErxL55ogzu4C9eo1rUO/nLCbe9aIUiniEffVpbAh9Fs9
	 uJjncCc1JO/k3EYcJxaS6uQvj3b8wPtm6z1vbnM/6pIpMFwWkUHU1ug68Sca1B0ubZ
	 qR+Ui/Z1ko9pA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA54BCEACEF;
	Mon, 17 Nov 2025 15:01:59 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 17 Nov 2025 16:01:26 +0100
Subject: [PATCH v4 1/5] dt-bindings: arm: fsl: Add GOcontroll Moduline
 IV/Mini
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-mini_iv-v4-1-5aa63832f51a@gocontroll.com>
References: <20251117-mini_iv-v4-0-5aa63832f51a@gocontroll.com>
In-Reply-To: <20251117-mini_iv-v4-0-5aa63832f51a@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763391718; l=1193;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=e39i4zu3s9/c6HgQhcCyPlzrP1IUgsBuKYZ7/TJjIeU=;
 b=2Freo+oXoswOXdTh2C0zCcMYrVRuXqF95ft/AbUwOelknt8ty9oDI4sYqEKvoRdJWOtQzthxA
 8dYP+DrzkxyA6lKFiFCfGiI68qHoZ6yxKqxRtThEmjz9RGsJ0lLeNz0
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
index 00cdf490b062..15000923b648 100644
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
2.51.2


