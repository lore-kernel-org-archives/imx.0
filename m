Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D048313A244
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 08:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723539007; cv=none; b=qHyPkrmNQaRgYItbq8pdDq8iON7OfE5JSaOKPIdmzyOhCVV8bo1XQePIEYYb9EgYFGeO6algLKktAxF48XkkRkf+1LeZJlpfREAu4fLbxQ4U2Xc3zOf7IgutGCTWDl6M2mMa/Qt3rzwMwcYumRMfzd9r2162YYcGbkuhU2x3W1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723539007; c=relaxed/simple;
	bh=/xwO7i1d0K7SzaMDoitk3HqY4xnvSTvIVJ4aE7SJvAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HOss3V8ZsSTpjpfnBak4pMhjQaZmXze7Hx8PUmiUwY/77LZau11NO9Ov5hcgQ+7EAEVJZrdBVlPue65hz5uWXBio4PTZMkpYg7L+/AMgKBtZNEHZQ7UsOxJlHCO0UCujZW0W2pu4uylhvLcCN2Rs1nuNO1IDOkmgKNV+IPN72pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=fail smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=daSUufPw; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="daSUufPw"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47B48BFB2F;
	Tue, 13 Aug 2024 10:49:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1723538995; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=3k1ZBl8d8rkvFQWkw414ec4CjT7YEnjNYqNTjvI5dwI=;
	b=daSUufPwlsPaOvkx35lpkmY40Zdmja7rnLNHa5h4l9iifBp7bvffFb2K1J++OccHpjZ0sa
	GLCVmQNhopBWwTasiOwHedxcVlQxyBOwApOzxqWZp2qEO5m2Y9sdf+HHnMzlqCO+iBe2d+
	FCPV0lB02jkHI7/cc3FNSABO2xORErMj8kMwbK1pMUNz1K2ORkOZqzvWlf8/D0YdmSa6xr
	TySXqK6/FO2MnB4Qzdrxkqbqdwf+aYTnxPvAJyuDOzQpJJL6mSF6RaYxE+F+CwfFaZgfjx
	y+SkXHZrr+lLCnOsxo0vB3EG/2AByvvaw9C2KhIJNe25RxcONxuOO55lm5g3NQ==
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
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Michael Walle <mwalle@kernel.org>,
	Parthiban Nallathambi <parthiban@linumiz.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v5 0/2] Add support for Kontron OSM-S i.MX93 SoM and carrier  board
Date: Tue, 13 Aug 2024 10:49:03 +0200
Message-ID: <20240813084934.46004-1-frieder@fris.de>
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

Changes for v5:
* Address Shawn's review comments (thanks!)

Changes for v4:
* Reorder enable-active-high property
* Add dedicated pinctrl settings for different SDHC speed modes
* Add SION bit for SDHC pinctrls as workaround for SoC erratum

Changes for v3:
* remove applied patches
* rebase onto v6.11-rc1

Changes for v2:
* remove applied patches 1 and 2
* add tags
* improvements suggested by Krzysztof (thanks!)
* add missing Makefile entry for DT

Frieder Schrempf (2):
  dt-bindings: arm: fsl: Add Kontron i.MX93 OSM-S based boards
  arm64: dts: Add support for Kontron i.MX93 OSM-S SoM and BL carrier
    board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx93-kontron-bl-osm-s.dts  | 163 +++++
 .../dts/freescale/imx93-kontron-osm-s.dtsi    | 628 ++++++++++++++++++
 4 files changed, 798 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi

-- 
2.46.0

