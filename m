Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C3F2A1CF;
	Wed, 12 Mar 2025 01:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741744031; cv=none; b=nueYwTbv0uapmdPaCMdi2We3AHSnYtnVbusBqIoJv3mWU/TJVDqnWod5BBO6ic/KEScNvFKCiCaJ127YqXc7ZvLZtbwftLqYoCvMUrKtFYxbFSXBAS8oiKypIhGLDwrKggS1DA3Vv2kKCgeJL/+En2vzZE/33BCjVg7S/dh00Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741744031; c=relaxed/simple;
	bh=2PiPcKwe8hU1SLSkxJ19ZbCFbcTwG0fVISzDHAZRDhg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Ou9wIy2Q9+PUQlArUm8nnjpNV4Kl8K5XLjaQIKZVlRKioKLUXs56POmiiUqLfDZtiJHFhAGrgmar6kvnrE91Do8zXi+KXFVDWXxxdE5iEMauf+hCFudrB/sSi1V2inixvvTa1idKdq0jAXVgbzZSf7pxOgns+e/yF61q+LHdFos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqAwRXDD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WqAwRXDD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B1DC4CEE9;
	Wed, 12 Mar 2025 01:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741744031;
	bh=2PiPcKwe8hU1SLSkxJ19ZbCFbcTwG0fVISzDHAZRDhg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WqAwRXDDKFC4K1SfTyLzadROtE69ikIcMNLT2cAKhZWQgbUNN6yGpJMu2AN2w+8Sw
	 jP7vOfLmRC56paRFDBDLCK8TwNM5jkcWKDhHMacVFNL4MbetNqoAji2UCwcrwq6wYE
	 fzdPL0/v76YP2aiaChIKzMxxSGsnjwZIT7Oci/mkz9PY5UOBEfHfQNHFWve+OzjccJ
	 3t6jOtLRfQKdcrxMpvr/RxNsEVE16ThXNv2cZKEs53/OYkcj5PuRRUqUHV6jEgpjcm
	 K7n+La3KxorCl4sc+97J0+g6iG+g8rp8g0Kh8a37eUEm32TG/LhVDwor6CdI883hOb
	 uxhPDM38CEH5A==
Date: Tue, 11 Mar 2025 20:47:07 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.li@nxp.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
References: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
Message-Id: <174174398131.182748.13049437230815741677.robh@kernel.org>
Subject: Re: [PATCH v5 0/3] add sof support on imx95


On Tue, 11 Mar 2025 12:32:52 -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add sof support on imx95. This series also includes some changes to
> the audio-graph-card2 binding required for the support.
> 
> ---
> Changes in v5:
> - added comment in the DTS regarding the reserved DMA channels.
> - addressed Frank's comment regarding the widgets/routing properties.
> - changed codec and CPU EP names to include SAI3/WM8962 in their naming.
> Previous naming was too generic.
> - picked up some more R-b's
> - change soundcard DT node name to the more generic "sof-sound" as the
> soundcard might support additional DAI-CODEC links in the future.
> - change the soundcard label to "audio". Same rationale as above. The
> SOF core will append to it the "sof-" prefix, thus the resulting name will
> be "sof-audio".
> - Link to v4: https://lore.kernel.org/lkml/20250211225808.3050-1-laurentiumihalcea111@gmail.com/
> 
> Changes in v4:
> - addressed Frank's comments regarding the DTS.
> - squashed commits for common and imx95 bindings.
> - dropped patch introducing driver. This was already handled via
> https://lore.kernel.org/all/20250207162246.3104-1-laurentiumihalcea111@gmail.com/
> - introduced two new properties: 'reg-names' and 'memory-region-names',
> which are now needed by the driver to work properly. Because of this, 'reg'
> and 'memory-region' properties had to be moved from the common binding as
> 'reg-names' and 'memory-region-names' depend on them (you'd get a failure
> when running the binding check otherwise).
> - added missing 'bitclock-master' and 'frame-master' properties to codec EP.
> - addressed Krzysztof's comments regarding the imx95 binding
> - added Krzysztof's Acked-by
> - Link to v3: https://lore.kernel.org/lkml/20241216145039.3074-1-laurentiumihalcea111@gmail.com/
> 
> Changes in v3:
> - Ordered DT nodes alphabetically
> - Removed 'cpu' and 'cpu_ep' labels from binding example
> - Some small changes to the binding commit messages/titles.
> - Link to v2: https://lore.kernel.org/lkml/20241113195240.3699-1-laurentiumihalcea111@gmail.com/
> 
> Changes in v2:
> - Added new binding for 95's CM7 core with SOF. fsl,dsp.yaml is no longer used.
> - "hp-det-gpios" and "widgets" properties now reference the definitions from audio-graph.yaml
> - Removed extra empty spaces from DTS as suggested by Frank
> - Ordered 'edma2', 'sai3', 'wm8962' DT nodes alphabetically. The order of the nodes
> placed inside / is kept the same for readability
> - Ordered driver header files includes alphabetically as suggested by Frank
> - Removed "reg-names" and changed the maximum size of the "reg" property to 1 to align
> with the other NXP CPUs sharing the same programming model (i.e: audio processing with SOF).
> The region described in the DTS is the SRAM and the mailbox region is now hardcoded in the
> driver as an offset to the start of the SRAM region.
> - Added new binding with properties required by all NXP CPUs sharing the same programming
> model (i.e: audio processing with SOF).
> - Various driver adjustments made to accomodate the DT changes + some bug fixing related
> to the mboxes not being requested/free'd on resume/suspend.
> - Fixed value passed to "dma-channel-mask". A set bit means the channel is masked, not the
> other way around.
> - Link to v1: https://lore.kernel.org/lkml/20241023162114.3354-1-laurentiumihalcea111@gmail.com/
> ---
> 
> Laurentiu Mihalcea (3):
>   ASoC: dt-bindings: support imx95's CM7 core
>   ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios
>     support
>   arm64: dts: imx: add imx95 dts for sof
> 
>  .../bindings/sound/audio-graph-card2.yaml     |  4 +
>  .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 64 ++++++++++++++
>  .../bindings/sound/fsl,sof-cpu.yaml           | 27 ++++++
>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>  .../dts/freescale/imx95-19x19-evk-sof.dts     | 84 +++++++++++++++++++
>  5 files changed, 180 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
> 
> --
> 2.34.1
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250311163255.2664-1-laurentiumihalcea111@gmail.com:

arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: pcie@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: pcie@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#





