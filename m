Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13C517FE;
	Tue, 14 Jan 2025 00:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736813091; cv=none; b=h8sVX0Tmh91gZP89TB6zydy9u3gmQENnOIGu+/aDl/IT2NKrrknT81sM/jVnd6ScYDrXbFW8ueJE8icng3YgkuK9/nM6gsk9oFTDDWf2XnmS435bWeDxw2Y03APJL67w31x3MMA+U9NZ/3BJKXRneyL2bpWss94HqsRkUQVJ9ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736813091; c=relaxed/simple;
	bh=NrgMw8h+fitbqMNvG385KgsvxtlRiPe0cIHOPL1U6Vg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SE4beW0QPups5E1qlNVMyIaE1alT+aRX5emKasxnYbqFyC+YKXaIkGTbRQo1RONF/MoNMOVSl2pEoAYbPn4TgvdAkTosF3GT42bpOKnyj926QLulX1lu3FXoZLvEGy/whHSckkPhKiGKjeEtrEijCBvlJzU9w762JrEhLN20cYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r1CZwdgd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r1CZwdgd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16401C4CED6;
	Tue, 14 Jan 2025 00:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736813091;
	bh=NrgMw8h+fitbqMNvG385KgsvxtlRiPe0cIHOPL1U6Vg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=r1CZwdgdgX6W24ySZ8xoXJ8FoA5BU2ZIs96Owad1lg66t2hErixPRqi7xRpLfRYxO
	 gIIDE4jFe2Y4VCxtIxUGYQkqnrAscy0Qm2AQPXxTD21BMEn42/lV6wvtBNAV3AEvNS
	 4hEd0zFUO5CZdG59s//mzyXiiS0+uyB8z0LpreNyb6KCXYQWTx0pruRUJZuBa424Sa
	 rZujphiQsDzskqZgYyE5hM8gdJVddaBo8u3KgiRnZFcfO4PbRA6nldsVeqwd3YaxSV
	 fNXd8vhlPcZ+I0mvN+gaetlnJrkAUeYc8Wd6TK+6dk8lGTda6C1HUAGSa2Fgo+2mpi
	 FHUAF1ejMU8rQ==
Date: Mon, 13 Jan 2025 18:04:50 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
 Shawn Guo <shawnguo@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com>
References: <20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com>
Message-Id: <173681284597.3684963.16712339968479881126.robh@kernel.org>
Subject: Re: [PATCH 0/4] arm64: dts: add imx95_15x15_evk boards support


On Mon, 13 Jan 2025 13:01:58 -0500, Frank Li wrote:
> Add related binding doc.
> 
> Add imx95_15x15_evk boards, which have big difference with imx95_19x19_evk
> boards.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (4):
>       dt-bindings: arm: fsl: add i.MX95 15x15 EVK board
>       arm64: dts: imx95: Add #io-channel-cells = <1> for adc node
>       arm64: dts: imx95: Add i3c1 and i3c2
>       arm64: dts: imx95: Add imx95-15x15-evk support
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml    |    1 +
>  arch/arm64/boot/dts/freescale/Makefile            |    1 +
>  arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 1064 +++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi          |   27 +
>  4 files changed, 1093 insertions(+)
> ---
> base-commit: 1300d5fe48f1e09a9a7d2dfe3b2e74be8ccaa322
> change-id: 20250110-imx95_15x15-6a64db8c0187
> 
> Best regards,
> ---
> Frank Li <Frank.Li@nxp.com>
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com:

arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: i3c@42520000: Unevaluated properties are not allowed ('inctrl-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/i3c/silvaco,i3c-master.yaml#





