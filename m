Received: from ms.puri.sm (ms.puri.sm [135.181.196.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1201FE44A
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 20:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.196.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769458249; cv=none; b=RzFWanNdS9usYN6ThvF1CYAL6DJVzJmvCKZUEcd2AyIvHdvRCfenD6MZQ9lNwVkshwrgZlzBHHsrGeJYfm028nZv8nQB3mWJLadtU79va36ji0Nb0HMaDGMlTx0ihcbfAMmSN2+6CgXL4VsjS4xDAq8SX8wDNuNj+SWeIFct7tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769458249; c=relaxed/simple;
	bh=RdybJ+RhItlzNNAOTr267+9hICGF7MXvJl8utG+MmF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EEb2z9C134DXdyihA3iRGniLYv6P0JuzEH4iNbPX9UX5bmr+GuFJV7aNu9U4b/dn3eP414nt9ds0GMZMC4NLUVfiC90mKsFYq9GxnttE+7L9+0egdmPie0utcq6JE2fj2+/C964dTGlWLRYNO1vpXbhSJjA0XZbLczpX2Q8JJGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm; spf=pass smtp.mailfrom=puri.sm; dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b=KpLjCTdd; arc=none smtp.client-ip=135.181.196.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puri.sm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b="KpLjCTdd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1769458239; bh=RdybJ+RhItlzNNAOTr267+9hICGF7MXvJl8utG+MmF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KpLjCTddhsijq2oEtM+wJOTd6g9VSp70CIHBiklKsuY/lV5vPz4nxyzcz1wsI+NoI
	 1dIM+2hyjS2yUM+URsz9rXOwoY+wIQ6VhqezQwh+rN8Vuq1oZhAVEMRLTI9GEC6PZl
	 2QPW8GAyKxLqc44ar3zZW5W0o7xqHS3NOoOKKF5lvyogEi+X+EhKGWqd/DHWyo7Yxt
	 UYxnL1ciWY7KO9X3L4Yofht+AgwEGXzt/XIK+dze8WRUgqT8yH51gwvsFLLxtAmwjj
	 ZfN7hjhSJgfMgfskQT9Nxso/KmkVQQlf9JXmzN9JKtlHr9POMAnIEXISXbTIYmQ5DW
	 XULQEnq2sdcWQ==
Received: from pliszka.localnet (79.184.64.12.ipv4.supernova.orange.pl [79.184.64.12])
	by ms.puri.sm (Postfix) with ESMTPSA id 10A8C1FA2D;
	Mon, 26 Jan 2026 12:10:39 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@puri.sm
Subject:
 Re: [PATCH] arm64: dts: imx8mq: Set the correct gpu_ahb clock frequency
Date: Mon, 26 Jan 2026 21:10:37 +0100
Message-ID: <8657865.DvuYhMxLoT@pliszka>
In-Reply-To: <aXevH8e+9qLhWO7D@lizhi-Precision-Tower-5810>
References:
 <20260124-imx8mq-gpu-ahb-clock-v1-1-11c2e7c857b7@puri.sm>
 <aXevH8e+9qLhWO7D@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On poniedzia=C5=82ek, 26 stycznia 2026 19:14:55 czas =C5=9Brodkowoeuropejsk=
i standardowy=20
=46rank Li wrote:
> On Sat, Jan 24, 2026 at 02:55:48PM +0100, Sebastian Krzyszkowiak wrote:
> > According to i.MX 8M Quad Reference Manual, GPU_AHB_CLK_ROOT's maximum
> > frequency is 400MHz.
>=20
> I checked datasheet
>=20
> Nominal mode=E2=80=94the maximum
> GPU frequency supported in
> this mode is 800 MHz.
>=20
> Does difference grade (industry vs consumer) impact max frequency?

No. That sentence relates to GPU_SHADER_CLK_ROOT, which can go up to 1000 M=
Hz,=20
but requires "overdrive mode" (higher voltage) when above 800 MHz. It's set=
 to=20
800 MHz in the device tree at the moment.

This patch changes GPU_AHB_CLK_ROOT, which has absolute maximum of 400 MHz=
=20
(see section 5.1.2 Table 5-1).

> Frank
>=20
> > Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> > ---
> >=20
> >  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mq.dtsi index
> > 607962f807be..6a25e219832c 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > @@ -1632,7 +1632,7 @@ gpu: gpu@38000000 {
> >=20
> >  			                         <&clk=20
IMX8MQ_GPU_PLL_OUT>,
> >  			                         <&clk=20
IMX8MQ_GPU_PLL>;
> >  		=09
> >  			assigned-clock-rates =3D <800000000>,=20
<800000000>,
> >=20
> > -			                       <800000000>,=20
<800000000>, <0>;
> > +			                       <800000000>,=20
<400000000>, <0>;
> >=20
> >  			power-domains =3D <&pgc_gpu>;
> >  	=09
> >  		};
> >=20
> > ---
> > base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> > change-id: 20260105-imx8mq-gpu-ahb-clock-139ba9ca9a6c
> >=20
> > Best regards,
> > --
> > Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>




