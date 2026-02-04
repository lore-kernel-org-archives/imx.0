Received: from finn.localdomain (finn.gateworks.com [108.161.129.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2252518A6CF;
	Wed,  4 Feb 2026 22:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=108.161.129.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770245439; cv=none; b=tbMGGThnihW80cZuHjVK5gz5f7oAz+UDi4ueEZE+8DP9wF5dzsClq4OuLfEMuUu3BpppGw/rv08cuPQIQPo2Hy3yGxSdM657MGbgSm7TGcFjFylQKfu9Warvfb86coPOKav1ItlruK+a8Ft7QRF39ag3TshcU6jzW9EMCgkp4zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770245439; c=relaxed/simple;
	bh=2iOjVWu3Nf3HYasYRcQ/8hom6nIkI1TdZvoNYPS2UTA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dCW+4kujwYXMDpE8wNFWqnNaUKoTkpIrXTdle2F4g8CpeKnj+6ZGTeHZMH7Ki4cadwTAIqXr11HnVWta3zM1VEK4LmuDCJJxH18a3vZY88u5OICjZWY7LVO+hLze1P3QekYmdlBXMGATFMZuKrPB+p71nyt58HqhgsQ60Z2608A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; arc=none smtp.client-ip=108.161.129.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1vnlhW-00EvLM-FV;
	Wed, 04 Feb 2026 22:50:22 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: Add Gateworks GW7906 board
Date: Wed,  4 Feb 2026 14:50:19 -0800
Message-Id: <20260204225020.2039367-1-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Gateworks GW7906 board based on the
i.MX8M Mini SoC.

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
v2:
 - no changes
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..46a85f8f9e5c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -963,6 +963,7 @@ properties:
               - fsl,imx8mm-evkb           # i.MX8MM EVKB Board
               - gateworks,imx8mm-gw75xx-0x # i.MX8MM Gateworks Board
               - gateworks,imx8mm-gw7904
+              - gateworks,imx8mm-gw7906   # i.MX8MM Gateworks Board
               - gw,imx8mm-gw71xx-0x       # i.MX8MM Gateworks Development Kit
               - gw,imx8mm-gw72xx-0x       # i.MX8MM Gateworks Development Kit
               - gw,imx8mm-gw73xx-0x       # i.MX8MM Gateworks Development Kit
-- 
2.25.1

