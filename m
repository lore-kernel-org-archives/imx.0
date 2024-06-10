Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679C11B7FD;
	Mon, 10 Jun 2024 21:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718054781; cv=none; b=IuD2ZGvkyeqJYtynKfrJortijuDFM3AoOs0V2wIuwkdsCZA2C0BAdhJcHK0EpiJ0Sdi+MElI1RH2lvgzVlyOhaTI5gWUOHMNNh/vFIVZiMcN9KO/hOhdSGHoQj1jsc5E1M3YO183BLAV2TTYq/jeaRWlMaiYgL9zJcMeVJCVzxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718054781; c=relaxed/simple;
	bh=A++antt0ngnPaH7P9ajVsd25v87qidwiVx6G2IvSwm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQqzxiZs+UeOP90kFaIrwND7hDifUmj3JQQ8FcnXRDLa1gz0LlK3oaw+cCZuk7XJK4NU6eIZtR6/gEYTuCK0x4ZekUAJH1t/uppCSf+v/LwJknYlLIgQOpnCXx6NI5MNgm6nIFcdnfxh9DwQfnohBR0AWHTrlt2gEi2hsI6j5lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORu9PJOD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORu9PJOD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4B9C2BBFC;
	Mon, 10 Jun 2024 21:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718054781;
	bh=A++antt0ngnPaH7P9ajVsd25v87qidwiVx6G2IvSwm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ORu9PJOD1WfIIfxqrIcuyaB44TIMdzqFvF9p0XsxJploDjdabCY0WW+NuQKejmVqu
	 cpMNbbKFhMh8bhh8A1sMbY5dOymDAUyu9j4ZSoXs8A775jrecevG88+tHwMet4lJPC
	 7NEmpz3Oa2krsq98rhVAcKnEo6aGyoFeXBhvJnanUlaipoDHJHhYXDJ6Zh5Bm0DEIT
	 ke92Gtyarj3V3trvbNCTj5j3XOg6z1GU3CATcJREk99Kc8EjhkvGnnVxdN8iOWlGgA
	 Gq1M9XZhg1TM7rUoq0lUDWFMnwRtzwTIZ9GkutzZGQ10YcaJP1csMV6+sXl0iP0n1p
	 rxuiSMVtcC+sw==
Date: Mon, 10 Jun 2024 15:26:19 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org,
	FrancescoFerraro <francesco.f@variscite.com>,
	Li Yang <leoyang.li@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Harshesh Valera <harshesh.v@variscite.com>,
	Nate Drude <nate.d@variscite.com>, Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Marco Contenti <marco.c@variscite.com>, imx@lists.linux.dev
Subject: Re: [PATCH v3 0/4] arm64: dts: freescale: Add Variscite i.MX8MP
 DART8MCustomBoard v2
Message-ID: <20240610212619.GA3067703-robh@kernel.org>
References: <20240608180447.31378-1-laurent.pinchart@ideasonboard.com>
 <171804879863.2984705.9370632116551818195.robh@kernel.org>
 <20240610201420.GO26663@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610201420.GO26663@pendragon.ideasonboard.com>

On Mon, Jun 10, 2024 at 11:14:20PM +0300, Laurent Pinchart wrote:
> Hi Rob,
> 
> On Mon, Jun 10, 2024 at 01:55:15PM -0600, Rob Herring (Arm) wrote:
> > On Sat, 08 Jun 2024 21:04:43 +0300, Laurent Pinchart wrote:
> > > Hello,
> > > 
> > > This patch series adds support for the Variscite DART8MCustomBoard v2
> > > carrier board with a DART-MX8M-PLUS module.
> > > 
> > > The device tree code originates from Variscite's BSP, and has been
> > > heavily refactored to adapt to mainline DT bindings. Some features have
> > > been left out:
> > > 
> > > - Camera: cameras should be enabled through overlays as they're not part
> > >   of the carrier board itself. I have successfully tested both camera
> > >   ports with modules that currently require out-of-tree drivers, so I
> > >   haven't included them in this series.
> > > 
> > > - USB OTG: the carrier board has a PTN5150 but doesn't route its
> > >   interrupt pin to the SoC. It should be possible to work around that in
> > >   the driver by implementing polling, but that requires more work that I
> > >   can perform at the moment.
> > > 
> > > - WiFi, Bluetooth and audio support: those are part of the DART SoM
> > >   itself, for which schematics isn't available, so I can't easily
> > >   troubleshoot them.
> > > 
> > > - PCIe: I lack test hardware for this.
> > > 
> > > May I tempt someone from Variscite to submit patches to enable at least
> > > WiFi, Bluetooth, audio and PCIe ? :-)
> > > 
> > > The LVDS display panel is integrated in the carrier board device tree in
> > > the BSP, I have split it out to an overlay in this series as it is
> > > shipped with the development kit but isn't an integral part of the
> > > carrier board. In the review of v2, Shawn pointed out that this overlay
> > > caused the DT compiler to spit ou warnings. This is still the case here:
> > > 
> > >   DTC     arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb
> > >   DTC     arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo
> > > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:54.3-16: Warning (reg_format): /fragment@1/__overlay__/touch@38:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> > > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> > > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> > > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> > > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> > > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:52.11-68.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/touch@38: Relying on default #address-cells value
> > > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:52.11-68.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/touch@38: Relying on default #size-cells value
> > > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (graph_port): /fragment@3: graph port node name should be 'port'
> > > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:85.15-87.3: Warning (graph_endpoint): /fragment@3/__overlay__: graph endpoint node name should be 'endpoint'
> > > arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:85.15-87.3: Warning (graph_endpoint): /fragment@3/__overlay__: graph connection to node '/fragment@0/__overlay__/panel/port/endpoint' is not bidirectional
> > >   DTOVL   arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtb
> > > 
> > > When compiling the overlay in isolation, the compiler doesn't know in
> > > which context it will be applied, and thus lacks information to validate
> > > the device tree. I don't think the issue is specific to this overlay,
> > > and I don't know if there are plans to handle it. If this is a blocker
> > > for the time being, patches 1/4 to 3/4 can already be merged without the
> > > overlay.
> > 
> > This has come up before. My suggestion is that you add the necessary 
> > information to the overlay. Specifically, just add the #address-cells 
> > and #size-cells to the overlay. That might mean you have to move up a 
> > parent for the target path.
> 
> It's not ideal as the overlay should really not care about that, but it
> will probably work around the warnings for this specific case. I'll have
> a look.

If an overlay uses "reg", then you have to care what the cell sizes are. 
Sure, I2C is fairly hard to get wrong. But what about an overlay with 
MMIO devices where the sizes could be any combination of 1 or 2 cells.


> Do you envision we will fix this problem in a nicer way in the future ?

I think the current overlay format is crap and that's largely due to 
inheriting FDT format limitations. Primarily, I'm talking about 
the __fixups__ nodes. That exists because there's no type and size 
information stored within the FDT format. We of course would like type 
information for other reasons. We could kill off #foo-cells for example.

I'd really like to us rev the FDT format to add new tags to store type 
information. Frank captured some discussion on this a while back on 
elinux.org. The problem is 'new FDT format' becomes a shopping list, so 
I don't hold out much hope. It's been discussed for at least 10 years 
now. If we at least did enough now to allow and ignore unknown FDT tags, 
then we could add new tags in the future with little pain or 
compatibility problems.


> I wonder if it would become part of the DT connector support (or
> whatever becomes of that). I've heard multiple people telling me they
> would like to revive the proposal (or see it revived), so maybe there's
> hope. I know I have many copies of essentially the same overlays for the
> same Raspberry Pi camera modules connected to different boards which I
> would like to upstream.

I think a connector would largely avoid this particular problem. Take 
I2C for example, we'd just define an I2C bus node for each I2C bus 
under the connector node and then map that bus into a parent bus. So 
you're going to have the properties to be able to parse things anyways.

Rob
