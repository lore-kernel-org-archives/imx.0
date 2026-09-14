Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68194313522;
	Mon, 14 Sep 2026 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395922; cv=none; b=LEDI4KLPjeK8SPup0yND2q5gL9bOXNTQTVKTg5a3GqJikwY5bnF1/GyMa2CRuUmHbSlVgf42USHJhU2ZfkYNsQixAOK+qL3SDmT7Rm8JElr7QV/FwRSq7KD3c1K14iCf3rWa2nmdCaakMCfqTWG00YOBGrV6DKCJUw8it9pWVsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395922; c=relaxed/simple;
	bh=tMOcf0VSmgrOTAYKc0LUcVv5zdjbLnYbielD0+ul63g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ivE6uBnVziutyM+fi8KkA5CVSZBlvSsoTy6lQbE0FzQ1nhEUKPE5rwmqIC5kmgPEpUsVJqjO3GrJi6994tCpnh9VDWLyJPr6Vxkx2TLcvPohNXy4eXopU755YfheTgt8iEfiz7swPI/BARcjRB/qtVWmhCjtXWPX0IBMDdIBbaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fa8Vo/+9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fa8Vo/+9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A706F1F000FF;
	Mon, 14 Sep 2026 14:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789395921;
	bh=g/oiuJ9HHblMLLh8Pc2n3fKfKnpbDEmBGeMJ+bGYrLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fa8Vo/+9cNwmIwwV4xFI/VH9nJnpXmN9UsdDxA+88r57Sd70iQ37QepvNhq1MQn6j
	 HemcoJfcPwmW5+o5JQYsKjxBw2RDI17vWbtJE6O8wO4OtJzX2UCLNgD5B4nq3sY0hu
	 bft6ClgrbjHeTVpYcH2BbOZgJj2BHr/LhCOzWy0wo6ICISHKQlqNGEcfpiYOUnTaLa
	 MXn8wxn5SEUzfZODP6NmNr5XW1QkVzoCBilDRgx5hKQpCOlmDXCe6gXzZCxB9KxbA2
	 aTfPuY5llvda/GgIrmbbbOB0yZS+IRUAct9qYDmYmIKD7CxVnlHzC6Y78hLGk3ArmF
	 uzdi5hV/w3/aQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/9] arm64: dts: imx8mm-kontron: Add GPIO labels and
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frieder Schrempf" <frieder@fris.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-7-8e12bc5f1f10@kontron.de>
References: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
 <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-7-8e12bc5f1f10@kontron.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 14:25:20 +0000
Message-Id: <20260914142520.A706F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Undocumented functional change in hardware pin configuration
--

commit d302aef127127e0c0034e70e30def7814e7b8ba2
Author: Oualid Derouiche <oualid.derouiche@kontron.de>

arm64: dts: imx8mm-kontron: Add GPIO labels and comments

Describe the GPIOs and their purpose using labels and comments.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/a=
rm64/boot/dts/freescale/imx8mm-kontron-bl.dts
> index 1f3d0577f10c9..72588af057d21 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
[ ... ]
>  	pinctrl_gpio4: gpio4grp {
>  		fsl,pins =3D <
> -			MX8MM_IOMUXC_SAI1_TXD2_GPIO4_IO14		0x19
> -			MX8MM_IOMUXC_SAI1_TXD3_GPIO4_IO15		0x19
> +			/* CAN address DIP switches 1-4 */
> +			MX8MM_IOMUXC_SAI1_RXC_GPIO4_IO1			0x19 /* CAN_ADR0 */
> +			MX8MM_IOMUXC_SAI1_RXD2_GPIO4_IO4		0x19 /* CAN_ADR1 */
> +			MX8MM_IOMUXC_SAI1_RXD3_GPIO4_IO5		0x19 /* CAN_ADR2 */
> +			MX8MM_IOMUXC_SAI1_RXD4_GPIO4_IO6		0x19 /* CAN_ADR3 */

[Severity: Medium]
Does this code introduce an undocumented functional change to the hardware =
pin
configurations in pinctrl_gpio4?

The patch modifies pinctrl_gpio4 to actively configure four entirely new pi=
ns
(GPIO4_IO1, GPIO4_IO4, GPIO4_IO5, GPIO4_IO6) with the pad setting 0x19. Sin=
ce
the &gpio4 node references this group, applying this patch alters the hardw=
are
pin multiplexing state during boot.

The commit message strictly claims to 'Add GPIO labels and comments' and
'Describe the GPIOs and their purpose using labels and comments', implying =
no
functional behavioral changes.

Could the commit message be updated to describe this functional change, or
should these new pins be separated into their own patch?

> +			MX8MM_IOMUXC_SAI1_TXD2_GPIO4_IO14		0x19 /* DSI_MUX_SEL */
> +			MX8MM_IOMUXC_SAI1_TXD3_GPIO4_IO15		0x19 /* DSI_MUX_OE */
>  		>;
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-upstreamin=
g-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de?part=3D7
