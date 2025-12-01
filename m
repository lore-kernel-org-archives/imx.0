Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88104191F91;
	Mon,  1 Dec 2025 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764590219; cv=none; b=RGCw8qLCqBXkLueVvpUybMyOslCHpwL2rma/dLdpfhcgo7cv4mN5zqnwIyk5N+0wLt5zJF1zDc1iNZYksRzlLaTyhs/7tyYiHWy+7sJlj9Wp/RYzETEbG3Qa7CGgPyAEOEyAY+RHiMhdeskzptybrIaE2w2oB6qPYKdww2qm15A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764590219; c=relaxed/simple;
	bh=f9QEnmqnsWDZUfL2GXKBxdVY8OzItJOp3WQ9SYd3RfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oV64s/ezg0sgBGG/woy33T/zohm8i1Go/sLzCsKKC1GCNjqJ8lL4vbbgccGeL+Z4V8qe8nV8m/NIVWSgNv4Jj3BCYI8aqPzkzhW/TJWeJZUQwgO0awyXr3j+CS6hSxMa6+CoGHqFnna9By9BdlZbiF7u1LYby22uQETMKW4LzNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UiA8GHek; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UiA8GHek"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46D81C116D0;
	Mon,  1 Dec 2025 11:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764590219;
	bh=f9QEnmqnsWDZUfL2GXKBxdVY8OzItJOp3WQ9SYd3RfY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UiA8GHekIF9RrRKE4o4mtTsFsjQe1Epo2rAx5qpeLKyzNJGii172bBNfVi2R74Vo+
	 B8o0S1A1Qusyz9sA7l0CKLNa0TOgRk4uDMEQWOa0EUg//cBpBCU6NV0ZjRYAu7IXty
	 xuOotn6h3X7UrCLWDOIQRdAfIV4inEoQTlAZLC5wWt9V1fvSXjrdGzDtTycK5xUE64
	 szzFcfcbMdbvFE6I/TRmZViQKeY31xkDAjywRysI9QOrHZ3/kqL1zasECtv7mCtDY7
	 8aIEH0TTe1j1IPfWyIy/oZiLvvLsjqxznGxQDiWDTJ+xiIn56Ji1j/1KrydslhJql4
	 bnaFpRt1dtnFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3558CD116F9;
	Mon,  1 Dec 2025 11:56:59 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 01 Dec 2025 12:56:50 +0100
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: moduline-display: fix
 compatible
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-disp_fix-v2-1-9b03026311b6@gocontroll.com>
References: <20251201-disp_fix-v2-0-9b03026311b6@gocontroll.com>
In-Reply-To: <20251201-disp_fix-v2-0-9b03026311b6@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764590218; l=2122;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=wXt3WiP0vtdg5opoCrY8YMr9jeuCt1sqacON3Gj18VI=;
 b=dGEyya9PxoluEeZNKYrLl9PPX4+vSLb60Xx6eXUGHdjyI2MHA6A21Qi622qMi+FBszZYctbLr
 FrYwekqk62ZAb3l4F26PBa5BgS8yq/OWSLp3MLJsVqCXdnuTfkyWBcB
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

The compatibles should include the SoM compatible, this board is based
on the Ka-Ro TX8P-ML81 SoM, so add it to allow using shared code in the
bootloader which uses upstream Linux devicetrees as a base.

Also add the hardware revision to the board compatible to handle
revision specific quirks in the bootloader/userspace.

This is a breaking change, but it is early enough that it can be
corrected without causing any issues.

Fixes: 24e67d28ef95 ("dt-bindings: arm: fsl: Add GOcontroll Moduline Display")
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 21b7168d61f5..0aeac16843b5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1105,7 +1105,6 @@ properties:
               - gateworks,imx8mp-gw74xx   # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw75xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw82xx-2x # i.MX8MP Gateworks Board
-              - gocontroll,moduline-display # GOcontroll Moduline Display controller
               - prt,prt8ml             # Protonic PRT8ML
               - skov,imx8mp-skov-basic # SKOV i.MX8MP baseboard without frontplate
               - skov,imx8mp-skov-revb-hdmi # SKOV i.MX8MP climate control without panel
@@ -1163,6 +1162,14 @@ properties:
           - const: engicam,icore-mx8mp             # i.MX8MP Engicam i.Core MX8M Plus SoM
           - const: fsl,imx8mp
 
+      - description: Ka-Ro TX8P-ML81 SoM based boards
+        items:
+          - enum:
+              - gocontroll,moduline-display
+              - gocontroll,moduline-display-106
+          - const: karo,tx8p-ml81
+          - const: fsl,imx8mp
+
       - description: Kontron i.MX8MP OSM-S SoM based Boards
         items:
           - const: kontron,imx8mp-bl-osm-s  # Kontron BL i.MX8MP OSM-S Board

-- 
2.52.0


