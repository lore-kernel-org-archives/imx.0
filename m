Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F8E54720;
	Wed, 16 Oct 2024 15:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729093112; cv=none; b=iA9scdNJhv6fvrHSg15NNkCq6eg8HtST3joZRjDcGdoe00RISLIoKPiYaFminAkcWa6nFmcZGHxNQBgbvn/2wuMD3eCmxzhNeR2X8huRafriWzT64sK/Zd7oacZR5PYAAj/emdc6UPs43Pyc1eLXKeHM0CBwp4yuAHqletoJ4UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729093112; c=relaxed/simple;
	bh=k2wypWjK1foZ+sNQTA32n3M+Lugry0K6atxdPAGsDWE=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=NDr5cDj31jnXoJWxHSvhxhG1uoEV4v/8kUJEphRESwkpHHgLTdL/8tWu6i2JQ6AZPXxYJZ/IlDtAJqArVXaDAXXYRjp4SCACHuveuPOBLQsqRxhs/Z1S36YCaC3XYp0Ldvvb4SozUV6kpszDVPA66CQeKTJ8AYqj9B2DaUdzaLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q3pdi1pN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q3pdi1pN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A8CC4CEC5;
	Wed, 16 Oct 2024 15:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729093112;
	bh=k2wypWjK1foZ+sNQTA32n3M+Lugry0K6atxdPAGsDWE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=q3pdi1pNXWe3THWKcAdQdUY4WoZUpQOPqBtlvx6fE6Rj+ROX/gSeLNjc4czfwsiZH
	 d6U7MRr9FLFT4hnWO6g//H5P3TAT2Q1PzCGtTXUPCj9jstk0h2/8qo18z9u32cJqml
	 oIIw+UC6/jaefyjMhrkjlZXXKtU+7yHN3VN1796F9FvEG/q/NkwppWlq22ccGbq7yp
	 7a2fhAtgp91WqNlu0LnNJRlD7tBacl0hyw+LfCA6gbdxGCXwnNgkdjaK/4prjtt+i7
	 i7nJ2QSeuALy7AkLSVmOQtg7AmpucBfh0V5iTE9DkRLsXDHKrFRZ61m64XrvwQQmK8
	 hrWg7VPrd7I5A==
Date: Wed, 16 Oct 2024 10:38:29 -0500
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
Cc: Joao Paulo Goncalves <joao.goncalves@toradex.com>, 
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Gregor Herburger <gregor.herburger@ew.tq-group.com>, 
 Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Parthiban Nallathambi <parthiban@linumiz.com>, 
 Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
 kernel@dh-electronics.com, Max Merchel <Max.Merchel@ew.tq-group.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Mathieu Othacehe <m.othacehe@gmail.com>, 
 Hugo Villeneuve <hvilleneuve@dimonoff.com>
In-Reply-To: <20241015235926.168582-1-marex@denx.de>
References: <20241015235926.168582-1-marex@denx.de>
Message-Id: <172909288999.1676333.15859258003756492401.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Document i.MX6DL DHCOM SoM
 on PDK2 carrier board


On Wed, 16 Oct 2024 01:58:35 +0200, Marek Vasut wrote:
> Document the DH electronics i.MX6DL DHCOM SoM and a PDK2 evaluation board.
> The evaluation board features three serial ports, USB OTG, USB host with
> an USB hub, Fast or Gigabit ethernet, eMMC, uSD, SD, analog audio, PCIe
> and HDMI video output.
> 
> All of the aforementioned features except for mSATA are supported, mSATA
> is not available on i.MX6DL and is only available on DHCOM populated with
> i.MX6Q SoC which is already supported upstream.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Gregor Herburger <gregor.herburger@ew.tq-group.com>
> Cc: Hiago De Franco <hiago.franco@toradex.com>
> Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> Cc: Joao Paulo Goncalves <joao.goncalves@toradex.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Mathieu Othacehe <m.othacehe@gmail.com>
> Cc: Max Merchel <Max.Merchel@ew.tq-group.com>
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Parthiban Nallathambi <parthiban@linumiz.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
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


New warnings running 'make CHECK_DTBS=y nxp/imx/imx6dl-dhcom-pdk2.dtb' for 20241015235926.168582-1-marex@denx.de:

arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/bus@2000000/pinctrl@20e0000: failed to match any schema with compatible: ['fsl,imx6dl-iomuxc']
arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/bus@2100000/i2c@21a8000/pmic@3c: failed to match any schema with compatible: ['lltc,ltc3676']
arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: gpio-keys: '#size-cells' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: gpio-keys: '#address-cells' is a dependency of '#size-cells'
	from schema $id: http://devicetree.org/schemas/reg.yaml#
arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: panel: 'power-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#





