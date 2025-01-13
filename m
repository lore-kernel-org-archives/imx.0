Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E83B347B4;
	Mon, 13 Jan 2025 15:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736781965; cv=none; b=HpEeaRXrfW78jh90c0+bg2twFFxBZ0jIeOLJ1EKTxcJeurqPaeGyx9DFc+pFWYfRNqYrajCyVCYIc85eayyRqir2ZMyvdTBxSzHBCoq2mrjSFMvADoxXTV/AMEjpiOdyh3Hiv/Bcw0aN8fYLUOZIG96dxwL0rCIw/Ml1a4scVlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736781965; c=relaxed/simple;
	bh=SsCpoMEeN0pR9CHnKptWUCXC0cbDKemvyCTlTImvvmI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=JAgcoGxg/3WBTr5nm8N+4UOxW4+PSVwwCa190RsYjAGDUPdTgAZswDm2rePKza/tuJWc3Up7eejqErmV5e9viMkAYuay+hNr3zmnXvUeMDiXZ1o7r3d/h2VyNs8aGocUKl/dezxnRV8rns1wN4SiSn+wqTX+LlwKrfCesDnuZ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DahZTjmw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DahZTjmw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3F0C4CED6;
	Mon, 13 Jan 2025 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736781965;
	bh=SsCpoMEeN0pR9CHnKptWUCXC0cbDKemvyCTlTImvvmI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DahZTjmwhI+qPyla/XXhJvbj9/7bv1nZGYlaBzwz+4vdaiIcUL1VrPLfDwfDJIZQj
	 aZToEHslHa0BWyEL5jTmUAQk6jxh1OcN3TnK3MY/pOqDi9l6i+A8jNGUqy0si0YMY+
	 95ZTFD81NRP1XyyKRoIa2FzQCcHFAUXr2KxhtvmXoxOZL0ObB9EmTVU9WzhXZfYz4p
	 b4WA0oERZFkDkUN2imFQBQ7bpNtCTrfswjl9Zycq9IsA3TSpi/UjkDAwVp6jU/eGXw
	 zB6ppLqq5pQCgeYFObSYSOBInJEdBICXGLhnrjh7m1hfDUgW7L8KF26lROEsvfFCQu
	 ZueZeJBwJhrHw==
Date: Mon, 13 Jan 2025 09:26:04 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 shawnguo@kernel.org, kernel@pengutronix.de, 
 linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
 Fabio Estevam <festevam@denx.de>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20250112122939.988309-1-festevam@gmail.com>
References: <20250112122939.988309-1-festevam@gmail.com>
Message-Id: <173678159671.2153129.12543117264770999110.robh@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx5: Fix the CCM interrupts description


On Sun, 12 Jan 2025 09:29:38 -0300, Fabio Estevam wrote:
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250112122939.988309-1-festevam@gmail.com:

arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/ethernet@2d90000: failed to match any schema with compatible: ['fsl,etsec2']
arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/mdio@2d24000: failed to match any schema with compatible: ['gianfar']
arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/ethernet@2d10000: failed to match any schema with compatible: ['fsl,etsec2']
arch/arm/boot/dts/nxp/imx/imx6qp-yapp4-pegasus-plus.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']





