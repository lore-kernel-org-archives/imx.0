Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E921245022
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 12:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758197995; cv=none; b=KaAEhBAoQjQCToyIfXhe4ivC3Dmyqmga/c0yEQQbQzeMXUt+OIciBy4u+1LlYWGS/jdNcQJR24gi8BjyJd+P4/uP8j68loaNRkrCKXzH66yHY7K91WvHnc26J+AgCyx8FX/++y1RxLGE9XId1mnrwuoBDMiVZcIT9jgWX4P0kts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758197995; c=relaxed/simple;
	bh=XlKfsKtW3FVkpMAoRTgKAJoNasJl5xeOqrWbpeh/7Nk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UV5hHjAmj6MwhvMZ/ID/S/ah6kH3eaCFQahHE+pFOt/7KiBsiJ84rJ4ji9QaJy4eOMYJhT2nTcGNzBZ4tTFOySrZy66QJcMPXWDgMkCoFNWbcyxjZo82FtPb+AbBh+o0wrv+iouVCiABDKuznIttp4nD7UkUeDBE4ndoixOV1KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1uzDc7-0006mw-Ea; Thu, 18 Sep 2025 14:19:51 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Thu, 18 Sep 2025 14:19:45 +0200
Subject: [PATCH v2 2/3] dt-bindings: arm: fsl: Add Protonic PRT8ML
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250918-imx8mp-prt8ml-v2-2-3d84b4fe53de@pengutronix.de>
References: <20250918-imx8mp-prt8ml-v2-0-3d84b4fe53de@pengutronix.de>
In-Reply-To: <20250918-imx8mp-prt8ml-v2-0-3d84b4fe53de@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.15-dev-7abec
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=XlKfsKtW3FVkpMAoRTgKAJoNasJl5xeOqrWbpeh/7Nk=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYsg4/ePp/KRtal9yvstzSXKnz2T0jinkzbz275fRjr+9V
 TG2cbOmdJSyMIhxMciKKbLEqskpCBn7XzertIuFmcPKBDKEgYtTACYS9Zzhf/rny0fZquQF5//X
 5OST7ba63RJ30pPl7pfsX/MLtJo6Qxj+RxQeWxFhv/H2meBX+mvWr1azqr3+zUIi5MvE+J3h3Ja
 n2AE=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Add DT compatible string for Protonic PRT8ML board.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b062..b135f6360733 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1106,6 +1106,7 @@ properties:
               - gateworks,imx8mp-gw75xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw82xx-2x # i.MX8MP Gateworks Board
               - gocontroll,moduline-display # GOcontroll Moduline Display controller
+              - prt,prt8ml             # Protonic PRT8ML
               - skov,imx8mp-skov-basic # SKOV i.MX8MP baseboard without frontplate
               - skov,imx8mp-skov-revb-hdmi # SKOV i.MX8MP climate control without panel
               - skov,imx8mp-skov-revb-lt6 # SKOV i.MX8MP climate control with 7” panel

-- 
2.51.0.178.g2462961280

