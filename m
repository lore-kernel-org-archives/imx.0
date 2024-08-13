Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F6E39AD5
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723537926; cv=none; b=dwbeZcTtEngdKlPy9nx8xS6c/9y+ZotakWYeq511x//tETHt+5jotKTxCQeKhRJtr/Q7dY6v7FQvuIwVf4A6pF+jPGCTZrfScBs65DS4hwgvkp9xJb0kU8tpFd8zg/wWFpon6RKEP0nDsU97QlW7iTaSJZhgJySlIgurqFOlFnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723537926; c=relaxed/simple;
	bh=lEgV73oQFb4wSPPKQYw/Kz/gUusFzSP+RDDMV2j5zvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I7dxeW/ZWGWmfKKgicTorFPk8PhPqLisuZSOTRTE409hWDGPnWiE5FZA19V6tS8vXrs0AJmea/WOYHNNSvXRWaIHkDMwm/0sswSjKl/ARBouVCd5bCGIwQdg2eSV6OEP7p7FvxebuVoVR4Jq58K11ZQ7E6bUJ9rGEzs43rI/pxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=LI/fd74i; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=f7U1MbxW reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="LI/fd74i";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="f7U1MbxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723537924; x=1755073924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SoUo98Y/KDhV7rpJ07j6/bY/KoM1M5CslouXTk6xr6s=;
  b=LI/fd74ipSGGCLhCaA8JrKGWPfc+dTV6vGd+QsH6RgjpfykgPCKThgFA
   18ifZIFqSPp/b7zARgKDbwNZg0Xtw7LxfmjhyBdRVJtiFpiiwPRLQvp15
   w3yH25/OKL8V5aMr1SHwiZPOYzBadN32liTSa1B34Q07eT2u76uFtdkmv
   r8rFPPqTyNImezg77WwDjp/WnUe81edeTnsmvKUfP7L5JimNEGFpW6eSg
   HJAF6GSgzoR6NgdiqXgFXqkUiqLpQ/lzlqK5wPrOq18dRbMl2saWC2Fvo
   MNj2vZuD7seMG0jEYYOS7x11VD0LuCLLSjbluaBsFNCLZU62OGygfnNSo
   Q==;
X-CSE-ConnectionGUID: vGd+0kVFQiKGuuo/XImVXw==
X-CSE-MsgGUID: gZ+q8cY4Rpq48ZcAUaia6w==
X-IronPort-AV: E=Sophos;i="6.09,285,1716242400"; 
   d="scan'208";a="38378889"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 13 Aug 2024 10:32:02 +0200
X-CheckPoint: {66BB1A02-34-2C7A84BB-EFCBC4CF}
X-MAIL-CPID: 862DDC47C70EC59211A7B638BF404C29_2
X-Control-Analysis: str=0001.0A782F1E.66BB1A03.001B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 292F316A381;
	Tue, 13 Aug 2024 10:31:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723537918;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SoUo98Y/KDhV7rpJ07j6/bY/KoM1M5CslouXTk6xr6s=;
	b=f7U1MbxWI7PKKpMLHpKITmuKiPBqwLodORc8x3brT7LuBOYYQnvSi0xjlvDHUUzJLf+Bk4
	BBVogR8wbrNSInsGu9BK6mfmditXIc7KJ0JRSxmK0Elle8oxIgD4a3WxXotY0uN1T63yma
	0VMwwblvBFtkqKQDqItD7jD6cbEztKJEMFzkZByPTIKaEXRqK43kwm8QuXZfrC9834gcUz
	xoU6jcU+U/XJvdqpDk5fOjKJMDKliE3ar3fgLQusHUMRiO1R3kg0M/tSFZ50RynmIMKjpG
	8gdzyMuZ0apgv+2QOQp0CwFQ3p+r1DQDmPpKe4M0eXNOvymQ4i+0H306F4aOQA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Gregor Herburger <gregor.herburger@ew.tq-group.com>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux@ew.tq-group.com, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 07/17] arm64: dts: fsl-ls1012a-frdm: move clock-sc16is7xx under root node
Date: Tue, 13 Aug 2024 10:32:00 +0200
Message-ID: <3581541.iIbC2pHGDl@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240813-imx_warning-v1-7-3494426aea09@nxp.com>
References: <20240813-imx_warning-v1-0-3494426aea09@nxp.com> <20240813-imx_warning-v1-7-3494426aea09@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Dienstag, 13. August 2024, 06:35:02 CEST schrieb Frank Li:
> Move fixed clock "clock-sc16is7x" from dspi to root node to fix below
> warning:
> arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb:
>     serial@0: Unevaluated properties are not allowed ('clock-sc16is7xx' w=
as unexpected)
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts b/arch/ar=
m64/boot/dts/freescale/fsl-ls1012a-frdm.dts
> index 2517528f684fe..75081ce3e9a6f 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts
> @@ -20,6 +20,12 @@ sys_mclk: clock-mclk {
>  		clock-frequency =3D <25000000>;
>  	};
> =20
> +	sc16is7xx_clk: clock-sc16is7xx {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <24000000>;
> +	};
> +
>  	reg_1p8v: regulator-1p8v {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "1P8V";
> @@ -69,12 +75,6 @@ serial@0 {
>  		clocks =3D <&sc16is7xx_clk>;
>  		interrupt-parent =3D <&gpio1>;
>  		interrupts =3D <13 IRQ_TYPE_EDGE_FALLING>;
> -
> -		sc16is7xx_clk: clock-sc16is7xx {
> -			compatible =3D "fixed-clock";
> -			#clock-cells =3D <0>;
> -			clock-frequency =3D <24000000>;
> -		};
>  	};
>  };
> =20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


