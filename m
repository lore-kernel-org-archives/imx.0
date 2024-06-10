Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B694E14D6E9
	for <imx@lists.linux.dev>; Mon, 10 Jun 2024 20:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718050489; cv=none; b=f5p3Kqvm4eYVXK3m3BjqvR5ig3xZtvPHiFgLVL0I8M763apIEd7gobVwwSWzuohBiywqSXpGekC4/hMrPYshp9kMzYUF7diABHr6jnOcXd/vCFL2IQAgdEF8mS9cHe5/8oZGkhrCbbYPAjNEfqi1V/vDZm/HOPP0eXcFgAGut2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718050489; c=relaxed/simple;
	bh=bdvJlbw1/chnYOtLBpIve21xjV9IQLVV4o87fmIs9pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8cCeByvAubcB/8q7YRCmG+KJ212bGdDLoBhqAZ9lQYLiemrAABwDvkZL1zC0oLZcN0Zl+EkNj3Wam+sRtBrsU5zUkkGyU65JEiCzoSaVWXMlLuoTOrAp6k26OkE5GZ/yOI2Qbv7uAxVuqUwuHYhECiElenCCZZI8w2RmPMrk4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=twx9GJqs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="twx9GJqs"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8CE3C512;
	Mon, 10 Jun 2024 22:14:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718050467;
	bh=bdvJlbw1/chnYOtLBpIve21xjV9IQLVV4o87fmIs9pQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=twx9GJqsl9G3bcmwUXpH6J5IOTOjz8S3xKO3CrI/3+sQ07n9QjwcrFfk/NzYrqUut
	 +XOfpLbG3QWcDl882laJ8sT7n1ilyAaNAlBrHe7CjvDXt1Ksb5EhhCt2eR0cLTwyCJ
	 5FOBMNmfIjiHt9JMMlgEN1Orua4ePV95Zj1idzeE=
Date: Mon, 10 Jun 2024 23:14:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	FrancescoFerraro <francesco.f@variscite.com>,
	Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Harshesh Valera <harshesh.v@variscite.com>,
	Nate Drude <nate.d@variscite.com>, Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Marco Contenti <marco.c@variscite.com>, imx@lists.linux.dev
Subject: Re: [PATCH v3 0/4] arm64: dts: freescale: Add Variscite i.MX8MP
 DART8MCustomBoard v2
Message-ID: <20240610201420.GO26663@pendragon.ideasonboard.com>
References: <20240608180447.31378-1-laurent.pinchart@ideasonboard.com>
 <171804879863.2984705.9370632116551818195.robh@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171804879863.2984705.9370632116551818195.robh@kernel.org>

Hi Rob,

On Mon, Jun 10, 2024 at 01:55:15PM -0600, Rob Herring (Arm) wrote:
> On Sat, 08 Jun 2024 21:04:43 +0300, Laurent Pinchart wrote:
> > Hello,
> > 
> > This patch series adds support for the Variscite DART8MCustomBoard v2
> > carrier board with a DART-MX8M-PLUS module.
> > 
> > The device tree code originates from Variscite's BSP, and has been
> > heavily refactored to adapt to mainline DT bindings. Some features have
> > been left out:
> > 
> > - Camera: cameras should be enabled through overlays as they're not part
> >   of the carrier board itself. I have successfully tested both camera
> >   ports with modules that currently require out-of-tree drivers, so I
> >   haven't included them in this series.
> > 
> > - USB OTG: the carrier board has a PTN5150 but doesn't route its
> >   interrupt pin to the SoC. It should be possible to work around that in
> >   the driver by implementing polling, but that requires more work that I
> >   can perform at the moment.
> > 
> > - WiFi, Bluetooth and audio support: those are part of the DART SoM
> >   itself, for which schematics isn't available, so I can't easily
> >   troubleshoot them.
> > 
> > - PCIe: I lack test hardware for this.
> > 
> > May I tempt someone from Variscite to submit patches to enable at least
> > WiFi, Bluetooth, audio and PCIe ? :-)
> > 
> > The LVDS display panel is integrated in the carrier board device tree in
> > the BSP, I have split it out to an overlay in this series as it is
> > shipped with the development kit but isn't an integral part of the
> > carrier board. In the review of v2, Shawn pointed out that this overlay
> > caused the DT compiler to spit ou warnings. This is still the case here:
> > 
> >   DTC     arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb
> >   DTC     arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo
> > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:54.3-16: Warning (reg_format): /fragment@1/__overlay__/touch@38:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:52.11-68.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/touch@38: Relying on default #address-cells value
> > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:52.11-68.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/touch@38: Relying on default #size-cells value
> > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (graph_port): /fragment@3: graph port node name should be 'port'
> > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:85.15-87.3: Warning (graph_endpoint): /fragment@3/__overlay__: graph endpoint node name should be 'endpoint'
> > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:85.15-87.3: Warning (graph_endpoint): /fragment@3/__overlay__: graph connection to node '/fragment@0/__overlay__/panel/port/endpoint' is not bidirectional
> >   DTOVL   arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtb
> > 
> > When compiling the overlay in isolation, the compiler doesn't know in
> > which context it will be applied, and thus lacks information to validate
> > the device tree. I don't think the issue is specific to this overlay,
> > and I don't know if there are plans to handle it. If this is a blocker
> > for the time being, patches 1/4 to 3/4 can already be merged without the
> > overlay.
> 
> This has come up before. My suggestion is that you add the necessary 
> information to the overlay. Specifically, just add the #address-cells 
> and #size-cells to the overlay. That might mean you have to move up a 
> parent for the target path.

It's not ideal as the overlay should really not care about that, but it
will probably work around the warnings for this specific case. I'll have
a look.

Do you envision we will fix this problem in a nicer way in the future ?
I wonder if it would become part of the DT connector support (or
whatever becomes of that). I've heard multiple people telling me they
would like to revive the proposal (or see it revived), so maybe there's
hope. I know I have many copies of essentially the same overlays for the
same Raspberry Pi camera modules connected to different boards which I
would like to upstream.

> > Laurent Pinchart (4):
> >   dt-bindings: arm: fsl: Add Variscite DT8MCustomBoard with DART
> >     MX8M-PLUS
> >   arm64: dts: freescale: Add support for the Variscite DART-MX8M-PLUS
> >     SoM
> >   arm64: dts: freescale: Add support for the Variscite i.MX8MP
> >     DART8MCustomBoard
> >   arm64: dts: freescale: Add panel overlay for Variscite DART
> > 
> >  .../devicetree/bindings/arm/fsl.yaml          |   6 +
> >  arch/arm64/boot/dts/freescale/Makefile        |   3 +
> >  .../imx8mp-var-dart-dt8mcustomboard-v2.dts    | 529 ++++++++++++++++++
> >  .../imx8mp-var-dart-panel-gktw70sdae4se.dtso  |  99 ++++
> >  .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 340 +++++++++++
> >  5 files changed, 977 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dts
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi
> > 
> > 
> > base-commit: 41f93a496af2696d970cbcb3814261a9b32dbaa2
> > --
> > Regards,
> > 
> > Laurent Pinchart
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb' for 20240608180447.31378-1-laurent.pinchart@ideasonboard.com:
> 
> ti,x-plate-ohms: size (2) error for type uint32-array
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: touch@0: ti,x-plate-ohms: size is 16, expected 32
> 	from schema $id: http://devicetree.org/schemas/property-units.yaml#
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: touch@0: ti,settle-delay-usec: b'\x00\x96' is not of type 'object', 'array', 'boolean', 'null'
> 	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: touch@0: ti,debounce-tol: b'\x00\x03' is not of type 'object', 'array', 'boolean', 'null'
> 	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: touch@0: ti,debounce-rep: b'\x00\x01' is not of type 'object', 'array', 'boolean', 'null'
> 	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: /soc@0/bus@30800000/spba-bus@30800000/spi@30820000/touch@0: failed to match any schema with compatible: ['ti,tsc2046']

I'll check that. Sorry for not noticiting it before.

> arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: interrupt-controller@32fc2000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#

This one is caused by an issue in imx8mp.dtsi. A patch has been posted,
see https://lore.kernel.org/all/2690282.X9hSmTKtgW@steina-w/. I think
Alexander would appreciate feedback :-)

-- 
Regards,

Laurent Pinchart
