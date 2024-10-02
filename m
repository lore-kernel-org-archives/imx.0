Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E53A14A90;
	Wed,  2 Oct 2024 03:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727841061; cv=none; b=mwgCPhB3Q/dTMQb85d5xlwv1AZpHIEoWTI2HB8jI+l1+tvIsvHe9AoPihoSE659MwhOcqkfb5zRcneIPpfavYkiw2F5uRMRVV5IAwA7e+/Tm1uYMcDBgk+3lxfNp6zqKTuq2vwc/rVlF7lS9ayJjZNjkza4BwRIo7VBmtoqNmJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727841061; c=relaxed/simple;
	bh=2nMQFJJLL5n2/FSYA9/7DFV+JhhTE/XS+Rf6chkuTCY=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=d5gaRIhk5r25q4SF/jij66HOEkdBPU2aOUTZhlRaqJebaSt2DBVqEvdf3K4im2BKArdhMt4XC7tq2qvpJQ3RSPou1gAElNl1SgnfO8fmBq9kxEBk34ZSgnrmP3SGUP7Fo9mTofI66H6CYS/i63wDPRCUgGq7iktjY4jkxt0IbdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nN0W2Y5A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nN0W2Y5A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90126C4CEC5;
	Wed,  2 Oct 2024 03:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727841060;
	bh=2nMQFJJLL5n2/FSYA9/7DFV+JhhTE/XS+Rf6chkuTCY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=nN0W2Y5AYbrug5dPrdIXEj2+CFv0gHItzaFlseYctIiieNWm5s17ghJkgkOwN5oYh
	 fC/BT5qVZWfWmWM34X/ckq9qhzQ3gPqh8wed1NrPw7GSSMBhhCIgHoKa1JQ5BUZxyb
	 UckoRcn4NetQjSUo76voFKd9znHpQ7DMql/kLkXo4vkxmavJlmN4YtSKXsWP3DgSH8
	 jn7+ujqVq75kGx2bN2gCV+kcbQiwDq0a/45jDxwEbCHzulcrtv01Te4/F3RfZanjQ2
	 TUr4tMGtEEioi4teoTrTjGQokGUV6exewUjnLzaYkYduhJdlZ4fz2V+yg8b8Ejrvf1
	 td34iBkv4QCcA==
Date: Tue, 01 Oct 2024 22:50:59 -0500
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
Cc: imx@lists.linux.dev, Michael Walle <mwalle@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, devicetree@vger.kernel.org, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Max Merchel <Max.Merchel@ew.tq-group.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Mathieu Othacehe <m.othacehe@gmail.com>, 
 Hiago De Franco <hiago.franco@toradex.com>, kernel@dh-electronics.com, 
 linux-arm-kernel@lists.infradead.org, 
 Joao Paulo Goncalves <joao.goncalves@toradex.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Gregor Herburger <gregor.herburger@ew.tq-group.com>
In-Reply-To: <20240928234949.357893-1-marex@denx.de>
References: <20240928234949.357893-1-marex@denx.de>
Message-Id: <172784021443.525771.3308795793210058076.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Document DH electronics
 i.MX8M Plus DHCOM PicoITX


On Sun, 29 Sep 2024 01:48:08 +0200, Marek Vasut wrote:
> Document support for DH electronics i.MX8M Plus DHCOM SoM on PicoITX carrier
> board. This system is populated with serial console, EQoS ethernet, eMMC, SD,
> SPI NOR, LEDs and USB 3.0 host used in USB 2.0 mode on PicoITX.
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


New warnings running 'make CHECK_DTBS=y freescale/imx8mp-dhcom-picoitx.dtb' for 20240928234949.357893-1-marex@denx.de:

arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#





