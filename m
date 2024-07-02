Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ECF1BC07B
	for <imx@lists.linux.dev>; Tue,  2 Jul 2024 15:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719935091; cv=none; b=dIR919Bkkw55nr5HNqaJJCvVlUen7IKOl+xOa41Fa8Po+ygGiamchsleLnOdypUBeVwNQS9gEAbor4curHgK6P32QdZdya8VH/BUF8WrXQloRuQpJRuBuOc3K7wGTJesI9GAzRz+FCdSjBvKeqpvwY9CtEqhVVQw4sF842N5MwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719935091; c=relaxed/simple;
	bh=+B5HFZZzPNn2JmY4lkyPmQPkOj2DqJDKtWdUCztVPkw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S2dF0SgDHY8SpD1cKoDpHHmBFb+/8Fv441CylLyw6sqS4jcuzZUDU3sR58RfZl3vuu7KsPY/zobijvi5w0YofIrfMhAana/z6sXlW3MAL1Isbee6fB5yNkXaNcDLTfd90OYuWTPaMyaLlUAYt/EqY1yulRpUNv0CmnL1VzmSLMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=fail smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=VHYqLSid; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="VHYqLSid"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19E50BFB06;
	Tue,  2 Jul 2024 17:44:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1719935087; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=CBORLJR9aM7cMwsJ5VoFFFTmCJUb5MCP6fApLxgN76E=;
	b=VHYqLSidx9XZxGm0XQ8WvkbUTiDGFWnj8DPr6Ygt5KJU9rQQism1V9bbZYou0uIExwjypV
	XYRvwpsWZZ5WXgxStFicF6lB2KpgtjXodBDbW2xDlj3A0vYv9WXaqhsS+y0H/mEl53rgas
	fM5T9sJttWYT7JvKnhlhsaWvMKFjKYZSsgvb+R8ydv7hjwtz2xG3FABt4dTh3zLocB0+GM
	6Ry5u6DQYZ/qQsRZ6KdwpuceGkBgn+JRxtXfdlk23Khnt0MFdR9g87tAiYZwUppjyVvF7W
	s6OxCqcH2dfst2wqeyHENhZkDSrLuM9fB6Kvfqn6zWizSCIbZllyiRbCv21HXg==
From: Frieder Schrempf <frieder@fris.de>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH 0/3] Add support for Kontron OSM-S i.MX8MP SoM and carrier boards
Date: Tue,  2 Jul 2024 17:43:18 +0200
Message-ID: <20240702154413.968044-1-frieder@fris.de>
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
Patch 2: OSM-S i.MX8MP SoM and BL carrier board devicetrees
Patch 3: i.MX8MP SMARC module and eval carrier board devicetrees

Frieder Schrempf (3):
  dt-bindings: arm: fsl: Add Kontron i.MX8MP OSM-S based boards
  arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier
    board
  arm64: dts: Add support for Kontron i.MX8MP SMARC module and eval
    carrier

 .../devicetree/bindings/arm/fsl.yaml          |  13 +
 arch/arm64/boot/dts/freescale/Makefile        |   6 +
 .../dts/freescale/imx8mp-kontron-bl-osm-s.dts | 307 ++++++
 .../boot/dts/freescale/imx8mp-kontron-dl.dtso | 112 +++
 .../dts/freescale/imx8mp-kontron-osm-s.dtsi   | 908 ++++++++++++++++++
 .../imx8mp-kontron-smarc-eval-carrier.dts     | 224 +++++
 .../dts/freescale/imx8mp-kontron-smarc.dtsi   | 271 ++++++
 7 files changed, 1841 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi

-- 
2.45.2

