Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14C624024B;
	Mon, 13 Jan 2025 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736781968; cv=none; b=howJyNXjP7vHi+ZI00yAbjvkEmoU6Y12F04TOanvCS4OK5GNpPSmP1LRMzjNxfgwiIoa9LQjUXyKwdUX5pcauOMVWAyJISDG1xkL/2ujjgakQWGj/Zzv8gesZ0BnNjQBevhxiZy1Zg9t81/t//kEXjjx1WCMrjwIJYQ519vpwG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736781968; c=relaxed/simple;
	bh=PDn7b4rZVG80Mpecsub3/9L/gDd/HzzWKwGdflNiHpo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=D5LBRfOVRfv8XcDz3jgfTL1AO0DKGnxZGiG9xMJFUJ6t2Dey49lA4KNBeZN6rO/uo4Po6IpZr6LBn1DakpNHKxDQSKQ6fsu4PQv3UPihJF2ZVaWXhunOF9blaNDYRdQC1zLtEoYV1EtjexftJLNjflp6iW/9m8GyjFCTjXotHmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6sd3x9E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6sd3x9E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505FDC4CEE8;
	Mon, 13 Jan 2025 15:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736781967;
	bh=PDn7b4rZVG80Mpecsub3/9L/gDd/HzzWKwGdflNiHpo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Y6sd3x9EfE9NDXbhAt1sPTUbu89mP9g32MfuibLmihWDWTwIFgLAMcqC6Mf0CptFr
	 AGmbffW31KHAo84ukeBA0bWtSpzOCmcxl8pYc01OL/Xpmu8Z0aTeipFyXpeLHZIE/3
	 58pF0MwEvqwfAfE5zeKhC2dhtCRVMTsFeo+1EomeLXI+XrOOJKkyMC5wQ3a4NXk1Pz
	 B0dmrvD20MLFxZl5yVRdA4nQVj942FzdrDQIhYCsMSSlPKYZ8Zr/rkGjR2XjkASluM
	 Lh6cI1xcfNRmJ4oSBgoHe8Iwg+K/PRyu94VAxvqhvq8ymeuI+qfCT5tv7EwiHHz2bU
	 r06z1Kgls05cg==
Date: Mon, 13 Jan 2025 09:26:06 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Fabio Estevam <festevam@denx.de>, conor+dt@kernel.org, 
 kernel@pengutronix.de, devicetree@vger.kernel.org, shawnguo@kernel.org, 
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20250112152745.1079880-1-festevam@gmail.com>
References: <20250112152745.1079880-1-festevam@gmail.com>
Message-Id: <173678159965.2153204.13999632845078780464.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: imx5: Fix the CCM interrupts
 description


On Sun, 12 Jan 2025 12:27:44 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> On the i.MX5 chips the peripheral interrupts are represented directly only
> by their interrupt numbers.
> 
> The CCM nodes are not following this format and cause the following
> dt-schema warnings:
> 
> ccm@73fd4000: interrupts: [[0], [71], [4], [0], [72], [4]] is too long
> 
> Fix it by passing only the two interrupt numbers.
> 
> Run-time tested in on an imx53-qsb board.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Use interrupts = <71>, <72>;
> 
>  arch/arm/boot/dts/nxp/imx/imx50.dtsi | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx51.dtsi | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx53.dtsi | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250112152745.1079880-1-festevam@gmail.com:

arch/arm/boot/dts/nxp/mxs/imx28-apx4devkit.dtb: pinctrl@80018000: compatible: ['fsl,imx28-pinctrl', 'simple-bus'] is too long
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: sram@20000000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-iris-v2.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dtb: gpio-keys: 'power' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#





