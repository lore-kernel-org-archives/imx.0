Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585F915098E;
	Mon, 10 Jun 2024 19:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718049317; cv=none; b=PQuBvtgS58jK5OdPhM2SLU/yRff0axJkiFmAGZLYLkApnwRLDlC4HJ8ZDp+OTb1ZWLflr3Kd7ncJAfk4B19475bhd70QsCoJpWw1we3y3KmlNfdt8KMD1MVuHTer/9tIVx9KRaqGLrLO/kGfvG5DfD5IxC7f4gqByE4+JOZsR+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718049317; c=relaxed/simple;
	bh=FMJO4ULCYTIM7qrpWE1pAVxm9TK6/kPaBt39/nRm6Q8=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=lxnlBFGH+t337YQMVK8wcrZi60SBO5CQBhYnVuzjpSoNkb0Z8uX3RRyME7PxKfzkLqFbonSjXcbH4FfNmlGZff3QdMQro5L2Ql6SumE43T1BuBdG780ghVPC+uQB6MBmFizOZ5EtfDLniYKSQeE5amFJKfXE10BG1Qv0dz+SgXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NY1lwu5H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NY1lwu5H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB33CC4AF49;
	Mon, 10 Jun 2024 19:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718049316;
	bh=FMJO4ULCYTIM7qrpWE1pAVxm9TK6/kPaBt39/nRm6Q8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=NY1lwu5HVhW/dJDtsIInDzWrIkbm/3gMJq34meF+F28eZdiZlKRI1n0ABh8Nwt5BF
	 HsuUt+gP+U6djyGdDUtyRYDJnHd+ASwsAV60/wajItY3VS4lEYKt5F34lI3EQDl/Fa
	 +9LOBv/uRF8QaWJijJTgJTflXAv6E8CABAzqgtOG2bzEK9G8gIL/3Uqt9AERGM2Nu/
	 IcQEbDo/mHoD7VMlRhoVw7ohGkni/01gIxQsZ9uON1Jh85uSivHDg9xqy/0WyNqStr
	 ZryDQGF/C+gzRPSR6c5/MOPESknkZ2uJsRo4NRxfSIl4ZEsRRjtuU5VfZJvnCoXMbF
	 spW2e+0jC+iMg==
Date: Mon, 10 Jun 2024 13:55:15 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, 
 FrancescoFerraro <francesco.f@variscite.com>, 
 Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Harshesh Valera <harshesh.v@variscite.com>, 
 Nate Drude <nate.d@variscite.com>, Shawn Guo <shawnguo@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Marco Contenti <marco.c@variscite.com>, imx@lists.linux.dev
In-Reply-To: <20240608180447.31378-1-laurent.pinchart@ideasonboard.com>
References: <20240608180447.31378-1-laurent.pinchart@ideasonboard.com>
Message-Id: <171804879863.2984705.9370632116551818195.robh@kernel.org>
Subject: Re: [PATCH v3 0/4] arm64: dts: freescale: Add Variscite i.MX8MP
 DART8MCustomBoard v2


On Sat, 08 Jun 2024 21:04:43 +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series adds support for the Variscite DART8MCustomBoard v2
> carrier board with a DART-MX8M-PLUS module.
> 
> The device tree code originates from Variscite's BSP, and has been
> heavily refactored to adapt to mainline DT bindings. Some features have
> been left out:
> 
> - Camera: cameras should be enabled through overlays as they're not part
>   of the carrier board itself. I have successfully tested both camera
>   ports with modules that currently require out-of-tree drivers, so I
>   haven't included them in this series.
> 
> - USB OTG: the carrier board has a PTN5150 but doesn't route its
>   interrupt pin to the SoC. It should be possible to work around that in
>   the driver by implementing polling, but that requires more work that I
>   can perform at the moment.
> 
> - WiFi, Bluetooth and audio support: those are part of the DART SoM
>   itself, for which schematics isn't available, so I can't easily
>   troubleshoot them.
> 
> - PCIe: I lack test hardware for this.
> 
> May I tempt someone from Variscite to submit patches to enable at least
> WiFi, Bluetooth, audio and PCIe ? :-)
> 
> The LVDS display panel is integrated in the carrier board device tree in
> the BSP, I have split it out to an overlay in this series as it is
> shipped with the development kit but isn't an integral part of the
> carrier board. In the review of v2, Shawn pointed out that this overlay
> caused the DT compiler to spit ou warnings. This is still the case here:
> 
>   DTC     arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb
>   DTC     arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:54.3-16: Warning (reg_format): /fragment@1/__overlay__/touch@38:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:52.11-68.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/touch@38: Relying on default #address-cells value
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:52.11-68.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/touch@38: Relying on default #size-cells value
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (graph_port): /fragment@3: graph port node name should be 'port'
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:85.15-87.3: Warning (graph_endpoint): /fragment@3/__overlay__: graph endpoint node name should be 'endpoint'
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:85.15-87.3: Warning (graph_endpoint): /fragment@3/__overlay__: graph connection to node '/fragment@0/__overlay__/panel/port/endpoint' is not bidirectional
>   DTOVL   arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtb
> 
> When compiling the overlay in isolation, the compiler doesn't know in
> which context it will be applied, and thus lacks information to validate
> the device tree. I don't think the issue is specific to this overlay,
> and I don't know if there are plans to handle it. If this is a blocker
> for the time being, patches 1/4 to 3/4 can already be merged without the
> overlay.

This has come up before. My suggestion is that you add the necessary 
information to the overlay. Specifically, just add the #address-cells 
and #size-cells to the overlay. That might mean you have to move up a 
parent for the target path.

> 
> Laurent Pinchart (4):
>   dt-bindings: arm: fsl: Add Variscite DT8MCustomBoard with DART
>     MX8M-PLUS
>   arm64: dts: freescale: Add support for the Variscite DART-MX8M-PLUS
>     SoM
>   arm64: dts: freescale: Add support for the Variscite i.MX8MP
>     DART8MCustomBoard
>   arm64: dts: freescale: Add panel overlay for Variscite DART
> 
>  .../devicetree/bindings/arm/fsl.yaml          |   6 +
>  arch/arm64/boot/dts/freescale/Makefile        |   3 +
>  .../imx8mp-var-dart-dt8mcustomboard-v2.dts    | 529 ++++++++++++++++++
>  .../imx8mp-var-dart-panel-gktw70sdae4se.dtso  |  99 ++++
>  .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 340 +++++++++++
>  5 files changed, 977 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi
> 
> 
> base-commit: 41f93a496af2696d970cbcb3814261a9b32dbaa2
> --
> Regards,
> 
> Laurent Pinchart
> 
> 
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


New warnings running 'make CHECK_DTBS=y freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb' for 20240608180447.31378-1-laurent.pinchart@ideasonboard.com:

ti,x-plate-ohms: size (2) error for type uint32-array
arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: touch@0: ti,x-plate-ohms: size is 16, expected 32
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: touch@0: ti,settle-delay-usec: b'\x00\x96' is not of type 'object', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: touch@0: ti,debounce-tol: b'\x00\x03' is not of type 'object', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: touch@0: ti,debounce-rep: b'\x00\x01' is not of type 'object', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: /soc@0/bus@30800000/spba-bus@30800000/spi@30820000/touch@0: failed to match any schema with compatible: ['ti,tsc2046']
arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: interrupt-controller@32fc2000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#





