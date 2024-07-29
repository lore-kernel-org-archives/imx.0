Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3F3149E09
	for <imx@lists.linux.dev>; Mon, 29 Jul 2024 12:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722257523; cv=none; b=mLvKzOV8lYiMsDcTwDdrVprw1IvKYihA53HYtp+xDmHtkws9kbmBcYcsInnN5gcSwOaMvHZAZZIGsc9P/HEzZQB77r6tBE0NzBmUQH3piHSLE3JxafIod65iWTf1fFS1U8i/altpAM7Pm/H6uz807nKMBfJ+VOt9iQCUhvieqQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722257523; c=relaxed/simple;
	bh=sVol7CCKvMaaj4cV778tSQMTceaUobuUv8VI8vIyV3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a95rO4a/+IvzR5oIrMd0GLI+cVzLHzXncg7kZ3IwMQgrF/f3D3uvtgOZrEnwvScYu5aQQA9z8N0cQDONecPV46Sj/1pkKEPOa/TtYgoRiVgKOm20y9hOewjm0bAC/6lwyK1dEtpVxyWDmh8KX1KcMcpFW+qKPhm2yFdq4Mk9e4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=fail smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=CqF08xnD; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="CqF08xnD"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0A45BFB30;
	Mon, 29 Jul 2024 14:45:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1722257163; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=41E+2ee+3+BIiOkpYpN0gRFPVvr9+0trL/IaKGKh1Wo=;
	b=CqF08xnD+Uqyq5EmLVxFgp85xs1ioES7Ka2TTSncaPdpw62pTTBqxMHZCxDR4mUORcAX8w
	Bo3QTJ9LjRpYft4T/SNhR02m4GvYd1VxpPo/IgwJSRmYlbqi6F2eyXu2PLFOEDTBf+SlaK
	sv+5vhIyRu6RNqpyZu6f08XYLDa8ENOrHeebWUVKb5LB/2I0S0quuyJzzO0EOHLH1Aysiu
	F4TJozOmmtHjsNx/70u6tmYKRQZbLcRro2UNe6ZSSuNuwKirGPoHBGFett2FAAkmjBIlPL
	g+ZvuhEt/UaDQgVUfdtygeu1HqMmq1b+jT8SRKiKK6RiNDj9zvPK8KoO7ctVWA==
From: Frieder Schrempf <frieder@fris.de>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Michael Walle <mwalle@kernel.org>,
	Parthiban Nallathambi <parthiban@linumiz.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v3 0/2] Add support for Kontron OSM-S i.MX93 SoM and carrier board
Date: Mon, 29 Jul 2024 14:44:22 +0200
Message-ID: <20240729124450.118497-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Patch 1: board DT bindings
Patch 2: add devicetrees

Changes for v2:
* remove applied patches
* rebase onto v6.11-rc1

Frieder Schrempf (2):
  dt-bindings: arm: fsl: Add Kontron i.MX93 OSM-S based boards
  arm64: dts: Add support for Kontron i.MX93 OSM-S SoM and BL carrier
    board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx93-kontron-bl-osm-s.dts  | 165 ++++++
 .../dts/freescale/imx93-kontron-osm-s.dtsi    | 547 ++++++++++++++++++
 4 files changed, 719 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi

-- 
2.45.2

