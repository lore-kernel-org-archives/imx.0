Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2110F13AA31;
	Thu, 28 Mar 2024 21:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711659669; cv=none; b=dIFo77meHd8PwyZqaIU+UcBEaGbVkld8wInLYXZfYrcZKqPN6uGv4u7nq2YYRqT/rkOKCIP/MFMN40QoVf0U59a7dFfTLV5yzcECDBWzUEW6dFOrGWMyBAjXeolmSFDN4VxE1ulgSwOHtcFhBqvgfxM6KIFyQP0hSoYih+CIB4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711659669; c=relaxed/simple;
	bh=cjvFOrG60Gr0hyCI8FeQFybYfL/zDNuhXIbJTZM5ZWs=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=ttFMFFrh5OZxNcxgHrgzfNHUmvlATyv4kIol4rTs+onNtnXQsOANTu6qTg8SPpOGG8Nuf6drwPS468twIUOvEpmCHpd/M1bWYdojrci7f+U1PvVtfb8BsJT4CHAEMsiUghwV3iFRBoUbDYna2n1QX8tMfS8IKDV3xIUvH5WTK9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfhnGO2z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfhnGO2z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B253C43390;
	Thu, 28 Mar 2024 21:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711659668;
	bh=cjvFOrG60Gr0hyCI8FeQFybYfL/zDNuhXIbJTZM5ZWs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=MfhnGO2zoRvqnJn+HsbeRSQXrk9A1Ubg7paHB4ronSqEXG7slRUxhB5A+sOaidHRU
	 6YS286vQmqb662H9b5T5gxQJqm5yHbs7YCabKOKENVEFSWGv9+fpnWs8QcxkshZcLq
	 acjV1/wJ0FsZ3syRdVoROQ/sRyz9YbDqneHW1ybw/HNlvCyFigKSOQlMLvB3ZfQAWD
	 xw0uZgaVrDMQW7iImIP2B4v0H1NONnAi9IoXfSJ1Tq2Hq7kOoY7uG9zZBXVsYxha7d
	 tvpVkltUvfLqbDT6yFriEau09c2Gb/zyHB4V1NkcADMXJqz6SyQYm1RCbScwIhNp18
	 ra7kuXd4Z1UdQ==
Date: Thu, 28 Mar 2024 16:01:07 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Gilles Talis <gilles.talis@gmail.com>
Cc: shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org, 
 festevam@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, 
 imx@lists.linux.dev, alex@voxelbotics.com, 
 krzysztof.kozlowski+dt@linaro.org
In-Reply-To: <20240328202320.187596-1-gilles.talis@gmail.com>
References: <20240328202320.187596-1-gilles.talis@gmail.com>
Message-Id: <171165955958.338166.637159959517861082.robh@kernel.org>
Subject: Re: [PATCH 0/3] Add support for Emcraft Systems NavQ+ kit


On Thu, 28 Mar 2024 16:23:17 -0400, Gilles Talis wrote:
> Hello
> 
> This series adds a device tree file for the Emcraft Systems NavQ+ kit [1]
> 
> The first patch adds a new vendor prefix for Emcraft Systems
> The second one adds the board to the arm/fsl.yaml DT bindings.
> Last patch adds device tree file for the kit.
> 
> [1] https://www.emcraft.com/products/1222
> 
> 
> Gilles Talis (3):
>   dt-bindings: vendor-prefixes: Add Emcraft Systems
>   dt-bindings: arm: Add Emcraft Systems i.MX8M Plus NavQ+ Kit
>   arm64: dts: freescale: Add device tree for Emcraft Systems NavQ+ Kit
> 
>  .../devicetree/bindings/arm/fsl.yaml          |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../arm64/boot/dts/freescale/imx8mp-navqp.dts | 435 ++++++++++++++++++
>  4 files changed, 439 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-navqp.dts
> 
> 
> base-commit: 4cece764965020c22cff7665b18a012006359095
> --
> 2.39.2
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


New warnings running 'make CHECK_DTBS=y freescale/imx8mp-navqp.dtb' for 20240328202320.187596-1-gilles.talis@gmail.com:

arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: pinctrl@30330000: 'pmicirq', 'usdhc2grp-100mhz', 'usdhc2grp-200mhz', 'usdhc2grp-gpio', 'usdhc3grp-100mhz', 'usdhc3grp-200mhz' do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx8m-pinctrl.yaml#
arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: pinctrl@30330000: usdhc2grp-gpio: {'fsl,pins': [[188, 796, 0, 5, 0, 452]], 'phandle': [[51]]} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#





