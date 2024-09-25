Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D1018D63A;
	Wed, 25 Sep 2024 14:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727275000; cv=none; b=RklEqeytM4TCq1XpdeCL66CIkCOIj/IMUZzDngJNUhv7nva5+yMmagkvvDelZO58AViKs5EiSveSr10hHuEiO0vK4GwnreN+hlcyvVYY/8MCIXcwTplaIvACMGXqhsv1KxrLt88CtnAWKQLojaZ7pzpKnS6O5BRpWH05eB21OME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727275000; c=relaxed/simple;
	bh=Ert2lKYcJ2X2SLzrJ81CO5UTwvnROUgTf7IrVGGMRNY=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=iAv5T/YJ2OIngk/GIBQtrcnnvpI/UBUeaMWWUNGmnkDGefWUIDGOQjeju0thJm1Okbl1F5wx0nNpUlmxZPmKqPLHSrLLQp91mjX2e4qPfRCxYYmpKtN+hGpIrHoHv02JVxl7HwFiiJK7TZ96MeUI0yHU78uxJQNbgDy7QleEsmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXuQFsKg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXuQFsKg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9522C4CEC3;
	Wed, 25 Sep 2024 14:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727275000;
	bh=Ert2lKYcJ2X2SLzrJ81CO5UTwvnROUgTf7IrVGGMRNY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=gXuQFsKgNXqZ8SeLc/t3X0hIErY9o7Z8sVwCNsRn3fsApDaJuB2AIee0QJDmp0gF9
	 /d8/FE2hx9DKhHHL/yIK79dHmZl8O7rQMCYTsvD4enOqAKW7WnxOAZUS8Dmqyo7tDt
	 xPlCeE2Cs6ejfrDVNbCTphdnLwl2KCW1zuHby/Gggjq/6HstZuG1ldKphDYfgJSFvG
	 Sl/qSE8M1YDckxdLoZQ12FvUSmtQM3hTvx9jSzU6REAYaQGYp8yiC56nN852N/q4mo
	 mD8PodrAI0yoQeQTtQarT2kOktS/Ddo7Y79K/NYDMw9IsHNFgJkLQ3kwLY4/zOjcjM
	 xAO31BeJ4goiA==
Date: Wed, 25 Sep 2024 09:36:38 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Shawn Guo <shawnguo@kernel.org>, 
 Max Merchel <Max.Merchel@ew.tq-group.com>, 
 Mathieu Othacehe <m.othacehe@gmail.com>, kernel@dh-electronics.com, 
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Joao Paulo Goncalves <joao.goncalves@toradex.com>, 
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Gregor Herburger <gregor.herburger@ew.tq-group.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Hiago De Franco <hiago.franco@toradex.com>, 
 Michael Walle <mwalle@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev
In-Reply-To: <20240925001628.669604-1-marex@denx.de>
References: <20240925001628.669604-1-marex@denx.de>
Message-Id: <172727480539.1213967.8200946984046949022.robh@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mp: Document DH i.MX8MP DHCOM SoM
 on DRC02 carrier board


On Wed, 25 Sep 2024 02:15:16 +0200, Marek Vasut wrote:
> Document support for DH electronics i.MX8MP DHCOM SoM on DRC02 carrier board.
> This system is populated with two ethernet ports, two CANs, RS485 and RS232,
> USB, capacitive buttons and an OLED display.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Gregor Herburger <gregor.herburger@ew.tq-group.com>
> Cc: Hiago De Franco <hiago.franco@toradex.com>
> Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> Cc: Joao Paulo Goncalves <joao.goncalves@toradex.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Mathieu Othacehe <m.othacehe@gmail.com>
> Cc: Max Merchel <Max.Merchel@ew.tq-group.com>
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y freescale/imx8mp-dhcom-drc02.dtb' for 20240925001628.669604-1-marex@denx.de:

arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#





