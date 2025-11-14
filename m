Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A723123EA9D;
	Fri, 14 Nov 2025 14:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763129511; cv=none; b=cuSka4qs5McZS3VsAkwpmzrPSR9y70M8dQ5I8lNj+r9Mg0TZcZMbxeHi9VkX9EAA/gMi/h99lo9I0+GAAah6oS50IRASImBIMpkmbYqiW0uvD6pdGwjugP0BSXKsKsan0vDktrfbxOEpyWO5qa+nazEv9R282dGnuk0zl/TGdqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763129511; c=relaxed/simple;
	bh=lFyHXiW8eQKZRawEtiDEZVselgFhEc+I403Sfjrv5nE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nWMa+xGd2NSGGuvJUbHJCKISGJUMOO+sCgoYMWZjil4iaoss6jZIQysNrjqtbmn6gRUPBAkAdIjMKc0joG7zc06LkVglYnun3N14WxLwXRYpZ2JkS+n7UTbatZpF5blrObIQbDjl9HaYXvcRBUw7vor82gzXWsy60GkPru04bOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mj/Fnd3c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mj/Fnd3c"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FFAFC4CEF5;
	Fri, 14 Nov 2025 14:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763129511;
	bh=lFyHXiW8eQKZRawEtiDEZVselgFhEc+I403Sfjrv5nE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Mj/Fnd3c4n9KxMkQb5t+L1Rii94o0KHEZrfJbvcldFImrfldLr83tvUOHqd5RHwo+
	 nc4i2xjkt57Undp9hinjjP2ygMyzML9PeaPIZm1P1EQe2mOhoIzvPtLfMV6DbAmlkX
	 6c++YxrMCFtI6cm+WEGNSij5angEgJ/VKUbA3wfMrSbPuTtDgp3Ps8WDx0wNcO79BV
	 y+EaqK2ao1NAei1JsEH8WSjpQBGPQ6L1E94rB4P5ibAIBEl+6CuMlWApll/4TFtfFF
	 dLWdUDyCBvedCVM5dkBmg2p70wKxp4Zd8EtaYwvyUDxnWEiJivAc3tBrzZBZjI6nef
	 OLNyT5CQqsJ7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015FDCE7B13;
	Fri, 14 Nov 2025 14:11:51 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 14 Nov 2025 15:11:49 +0100
Subject: [PATCH 1/3] dt-bindings: arm: fsl: moduline-display: fix
 compatible
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-disp_fix-v1-1-49cbe826afc2@gocontroll.com>
References: <20251114-disp_fix-v1-0-49cbe826afc2@gocontroll.com>
In-Reply-To: <20251114-disp_fix-v1-0-49cbe826afc2@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763129510; l=1897;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=cPzXiysl1EG0EkoKoONRk8NQGmBoNj8mxEDjnCk/Jyw=;
 b=VbHh+QiEHZ9IHuc+DsoaXZn9xZLIF20aL4tsd9tC6LUbw3UHwsFyhO2BtRI3W6tj08XtOHOXx
 Y4NgyT05i8vDoFivjM/ujXX7x3/vBOn6U4Z+ulEc6yZM+StoQuV0S/c
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

The compatibles should include the SoM compatible, this board is based
on the Ka-Ro TX8P-ML81 SoM, so add it. Also add the hardware revision to
the board compatible.

This is a breaking change, but it is early enough that it can be
corrected without causing any issues.

Fixes: 24e67d28ef95 ("dt-bindings: arm: fsl: Add GOcontroll Moduline Display")
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 21b7168d61f5..8949a98acd87 100644
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
@@ -1163,6 +1162,12 @@ properties:
           - const: engicam,icore-mx8mp             # i.MX8MP Engicam i.Core MX8M Plus SoM
           - const: fsl,imx8mp
 
+      - description: Ka-Ro TX8P-ML81 SoM based boards
+        items:
+          - const: gocontroll,moduline-display-106
+          - const: karo,tx8p-ml81
+          - const: fsl,imx8mp
+
       - description: Kontron i.MX8MP OSM-S SoM based Boards
         items:
           - const: kontron,imx8mp-bl-osm-s  # Kontron BL i.MX8MP OSM-S Board

-- 
2.51.2


