Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17881C5D45;
	Mon, 13 Jan 2025 15:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736781966; cv=none; b=eW4cg4HxLIXy7gNij/PLSul0tS9RzjL0O8Qy9nrZPzNeyIDBj0CF37iRe6Wf7WGiWHHyvN3mkkXbsVjs7b7zHeUmHx1H+dsHVARpN+sB0F+1LExKnJTrk8NE0SAILpbOBj8RmguP4DtpYSEI+K9mLb+5Lz4XzTbwgVSEbZR7LKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736781966; c=relaxed/simple;
	bh=5GmGthLpYKunN5PaKte3BBzy6UppfieKww7/WXUP5fA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lvXlfSgwxhGxJ4Py/AhjV9Cv/6v7Q5f5CgsWPsE9/QfFv5f/69Gxb77S6XRQRRAyv1A0MjhXnvPdEt756FolGTwFrB5XvXqSQhusnrNCZIS4RIV4QHWlo0L5TWX/PsRVguB9uFoDj4/jgqHu/9MnNw5S5TRBm1r34Rtj3TImOZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWpRYI/2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWpRYI/2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0B1C4CEE2;
	Mon, 13 Jan 2025 15:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736781966;
	bh=5GmGthLpYKunN5PaKte3BBzy6UppfieKww7/WXUP5fA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GWpRYI/2DdvEHmcIowU64Rkn7Km1medSGOtScIVhKoMtIGA7Zu5Qrazfk9p4G2uIa
	 1WFsIg0MOhWDtYkhf1UeGufO4PxyeSa7B2GWF2XKoBonf/kt+vlgOnJu+Ej066C0ll
	 nYdfmW70wT6nvXb3aKxSBBexbp3uqVKuOH7HEIoObwdEkPkt6WWxt1aXXyAs2TuWSY
	 ldvWzxayMwf1OXlhDTOPrcKTaEUmnucFQVJL3k4KrXXMDTtRJ+xI6SFRO23eK80qXf
	 R7uSBy6s4a3bkvxAV3KAOHo+r2bFF5+0P8OhxnSEvDBjn1lhev1uGUAY8jUkeE7uOV
	 k+EBFdu3RJmTg==
Date: Mon, 13 Jan 2025 09:26:05 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: shawnguo@kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Fabio Estevam <festevam@denx.de>, conor+dt@kernel.org, 
 kernel@pengutronix.de
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20250112124127.994141-1-festevam@gmail.com>
References: <20250112124127.994141-1-festevam@gmail.com>
Message-Id: <173678159815.2153167.409339104856435537.robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: vfxxx: Fix the CAAM job ring node names


On Sun, 12 Jan 2025 09:41:27 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to fsl,sec-v4.0.yaml, the job ring node names
> should be 'jr'.
> 
> Change them to fix the following dt-schema warnings:
> 
> crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes:
> '^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  arch/arm/boot/dts/nxp/vf/vfxxx.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250112124127.994141-1-festevam@gmail.com:

arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dtb: spi@80010000: $nodename:0: 'spi@80010000' does not match '^mmc(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: /ahb/flash@20020000: failed to match any schema with compatible: ['nxp,lpc3220-slc']
arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/dcu@2ce0000: failed to match any schema with compatible: ['fsl,ls1021a-dcu']
arch/arm/boot/dts/nxp/imx/imx53-usbarmory.dtb: /soc/bus@50000000/iomuxc-gpr@53fa8000: failed to match any schema with compatible: ['fsl,imx53-iomuxc-gpr', 'syscon']
arch/arm/boot/dts/nxp/imx/imx6q-lxr.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8137.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: ds1672@68: $nodename:0: 'ds1672@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
arch/arm/boot/dts/nxp/imx/imx53-mba53.dtb: /soc/bus@50000000/ldb@53fa8008: failed to match any schema with compatible: ['fsl,imx53-ldb']
arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']





