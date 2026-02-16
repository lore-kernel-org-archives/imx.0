Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91132FFDE1;
	Mon, 16 Feb 2026 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771247239; cv=none; b=GN0Y4nq+f9EQ4VnTz/3amCgLd5/SpswnWxKCe2DJvCiBkfXDXLMqc9RSavLttV2v3NbTvQ8mWvrbCPtTjbRpIvn0Hcbm/Gdk9yA1IDATd1czn///5fGgMiWLtGSzOP0zKB4QitRd0UqTRmf2tHAp8+vwhzBOrtD22DGKk36g5E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771247239; c=relaxed/simple;
	bh=t7mc8h6wdur6fw9C3zYZUzQS2fGxcRyDjbJei3wLb5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LuEk8RtqP4LR5DVRE8Y6V+0WbMuEJ4A/PuViC5xD5hi95Hi4iT7gkyTTDMMoExbHc2blDb/R7BRZguNsk6tctPJqe9RTxFgwD7A1VbOqDyisF+iHDM7r2A29+WfFBsse7m4cHT2cPb8BLxXg+WCeT4IoCPfnXQUMWegtWfbSajc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRGwzYM7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRGwzYM7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85D31C4AF09;
	Mon, 16 Feb 2026 13:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771247238;
	bh=t7mc8h6wdur6fw9C3zYZUzQS2fGxcRyDjbJei3wLb5c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PRGwzYM74lTLpjgAl5Inopj8bsTg76DTYwPnl/bXxxl9pP2JVlauD+R9BYKkiQc/C
	 T8zsrg6pAaIGGCwTycAzrTuq3/UlQIJxz50LPg96Q2hvvQqK0XNwl3wg3ZASdNvgQJ
	 B35HhTHVkdtNov4zGtpgzuPZ1IJ8ImCju+JtSN81oCaxetiQ+dv88MPjUP+lrJba9w
	 PTmAqCeMjTVm6iGORyzUtLsiskl0pwGCnNtHGr97ndhrzZZ9UNM8tiFwaQ5oQUQKx+
	 9xdXBxfHqZGWzQFvjcSN/PvoSrMdEtyFuXj+Std6COxh+bXLJxgNFQLrn+SAeLcFkm
	 BknT38BbGx8/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FFBE7BDB4;
	Mon, 16 Feb 2026 13:07:18 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 16 Feb 2026 14:07:08 +0100
Subject: [PATCH v8 1/5] dt-bindings: arm: fsl: Add GOcontroll Moduline
 IV/Mini
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-mini_iv-v8-1-8d528e7cb454@gocontroll.com>
References: <20260216-mini_iv-v8-0-8d528e7cb454@gocontroll.com>
In-Reply-To: <20260216-mini_iv-v8-0-8d528e7cb454@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771247236; l=1188;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=6IJfd0YMc8bGgvz2beaVfM9bpCeb2oZi6B9JfUEwk04=;
 b=NaNE3aKgiPJekNQmIv2+rV4c5ET4l3RFR22+XI/cYt7dZfNGAGC960PDcT/EblPFNpF9JHfas
 R8Agd9q2pG6Cx27thEf3qAAPOqrDWqCqHxwG2yKrqikfCMvmmczrcAi
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
index 5716d701292cf..2897d535c3d72 100644
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
+          - const: karo,tx8m-1610
+          - const: fsl,imx8mm
+
       - description: Kontron BL i.MX8MM (N801X S) Board
         items:
           - const: kontron,imx8mm-bl

-- 
2.53.0


