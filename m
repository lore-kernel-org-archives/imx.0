Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795179199;
	b=LtyulEU65OWEWJobwhAeNwoR8l1c8lz5dK/8f+h/sM0NLKKuhaloX3R4CueLEeF9xCmY
	 /VTSpdEHey29IK0wzyUDiAFMreTiDHix/NA/1cMsCvBvDILLaKFXr/2P4jjE4eX/y9+Jg
	 RLYwZxs2tBq8E7dQuJTvwHiyMC3cINxdtLmka+oKr2CXjsBod0iFKhKTmeX/z2nARoA1G
	 PBzxBehuhusaqfiphRsjFEZlqeY1UJaOUWLnCYORnoIcpBUwIWFA1q8y1oS+uGZQ95N9X
	 hKU1J/b90Rnawb40j8GneR1FN1HFbt4dLxdvTzPILAPpV2qT76b1tODb6WIFwcEmayQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ieYBoPMUvb4s/PCH+V30xJw7NXondGMmODLCCsted48=;
	b=jmzTmTv8YKVbXMkbS1TekakBGG2io53534X0cZnbBLKeTXsvsRsp7ocE95iLk5okkO6R
	 3q+4P42PdaQT4TeYiHV85GnRGbZ0uD2EHlw5Ej/GOODba74AXj/CBrBlQeu/ouyJNULCO
	 EAfp1oczZ2evBYydNZufBvnYZsqj5Zk4o/j40J06ynz0h6yW28YGCjAsrl83Q8TT5oeX1
	 IaBXNPuszajg445S4QmLjrRGq4jNc87LxdWB6RDLNwAWmDcRaV/r8lQU4FNpNdh0iyNfj
	 QpeXeb917mOZ0rM41D5NOcoENrRgHfYsZp72lSaZxdIRGhwK4aFzaLCL+cKryX7PoYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Evh9YsWB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8B460A2601
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 12:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A8B460A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Evh9YsWB
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4eab91bcaso5206807b3.2
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 04:53:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795179197; cv=none;
        d=google.com; s=arc-20260327;
        b=AWZdXWsuG8JNI27s0AlZDvxJEcYwK5Pcm5uimCk7OuDXrkfW+Er9IkZuE1ge8O7E+J
         HnK0vCe2XTe/vVYVvUW9OkxnEy7swoR7ptQ2UJib9K0qkKWDMDACr7W9FCkniMOQniNq
         IzUSNuYT6k/cweyF2Qf+81kzCn+RL1u1H4MDqRT1kks1+ZbOf4l/41FGwrrEFVo3b6NM
         e4OP1dAyjV3Gy9DJcxRjamBx9EGNkVE8o03SDVGZLgn2HtfjQhPNeOEl01XyNpym0BOY
         2CLuxXd2fvcFj/L3+HpDMDsCcJp416+LK/AeuKf1jtCSXxWdxgQVQgXS0qGiYabCRidX
         ZMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ieYBoPMUvb4s/PCH+V30xJw7NXondGMmODLCCsted48=;
        fh=xF7SAzvWUBXRFTK4GTO0NpP8sVUTiCMx9nv+t8sDJ3w=;
        b=TtJJgeR9t/4NP9T3SuKf+RLY8+t2kGtpvfNTduX57WUACLiEJTr5lqu0C9bBlKQLQW
         e/x1HVa6cpck0JjnOrkkItDmvllHy8im5g4Xl+nZ8IKg1uyBtgP3OHed4AHvvTqTixDT
         S67n/sro7JRz1LRzDh384HcpgQlKZezec5m+ceLssvpqpTKS16LXoI+RfrNh8NGCxiwP
         GdGZJMDRZkKwnSr9dy1WQ77fqc7bjo2yyizQ+SVwM5M1HnxNt+QTTHRYQ7BZRy6KK81o
         0xOtekO3lyBRRtrz+8kF9bzmp9rPPX+DXl67lWh1SYDeFVSU+5JmHDgCKcWhzKXW46g/
         Dk6w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795179197; x=1795783997; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ieYBoPMUvb4s/PCH+V30xJw7NXondGMmODLCCsted48=;
        b=Evh9YsWBfcmsU8kxQk2Mnf1yQS51k5MbTbyOVCxWZJFm1MEI7pI5x+/8LXinBCoKT+
         YhK5PZalnwzKxGE6sDbs1GvSJmjZXFBGoo9WpQ1OFzFIitG/jrdeCY0uF3kgnWpnEkcc
         z/FsdofVLtma/geOLj4n5M9iWbWowhtnrrF6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179197; x=1795783997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieYBoPMUvb4s/PCH+V30xJw7NXondGMmODLCCsted48=;
        b=II4h6FMext5XXxTil5h/LwJeMgPbh9bov5Jd8rgGcu3fhPJPx5pL1bzPcySkZhsGiE
         CeLtfwnEDifkbNlfZSKTk1NTkhWrMnHpG8sPLztQK8V3yuBYWy2JHiM1UWM2KJREtZdg
         o1C7qUB/0uk+PdOYea/wuCtU4gOa5DR5Vk3OfQdhWm1HnQUN3q211SoccnK3QmJZglyY
         WFhPzpl3oNg03Bj0PdK8kxRCaowEvbKNQYtuMCWKoDEJMFJn3z/g4R4OVltGphRnL/QG
         VKB1vO7aOuTASTzCoF6ImvBpJLtjGHiGEPu27T73BeLE6MnslB/lnf1/wMdy39Hk9qC7
         W1eg==
X-Forwarded-Encrypted: i=1; AL+hErFAMce0yZGhYpHTmaVNbEgezYdi9eIoHxk6Gyd0X6jEjn7kqzaTMgCW96WxnPlotxAcjYQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9F6tx1CrmcA4TFXced37nkCKSWuBA5zURdCRNsn7ovXthNh0df
	qdfx085z0/wTr9/R+xoX1oZPAqcVzmu1HjnMimpc2GJKRJwzR3qjq0MVhnRiy2y0DhPgCrTEJq6
	eBlAJlhZFG+i8I3MYHip+aUMrrl0dEAulfwwKWUH+Jw==
X-Gm-Gg: AZFdTZfOmjv5oKmjOQuBPIhxJAnMKJpIe1yqTf3uZz+bLBfgBD9Zhx+/eHoJKGiNjm2
	zF0feML5DBMPUdlkjlmgt2bjPpDnwupsDbqncNlA94mi2I6rF83IFF1nq0Xg+dOCiEBqTiMwTS6
	UIXuibJGyM2ZvX2NJs99Aj/vxuCu6n8XggW1ysvcaCNl9pN1mC+A6IxiSX+hCuWo9418cty2OBJ
	55uYKKr7F6aPR62ink9r4weElzwzFPwznQHGXsOI9H2Oe4NDKDTUr5evauBoMjClWIEZzHIVMzU
	AFOVTOk3jN8kW7yJey31YkrDI4AaEZGhFJnXTcdh7mp4JNzHyZpwxLV+SKb37obCoHirRHJeH2P
	dG2dPLeqis7BYIykm3qIa26ZEkiQ9dJd33midxb/mK/GXFkpv3ZHWvmWxWHfunPqBagE=
X-Received: by 2002:a05:690c:e3d2:b0:8b2:e0c3:1f4d with SMTP id
 00721157ae682-8b5204ab2a6mr13766787b3.37.1795179197354; Fri, 20 Nov 2026
 04:53:17 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 20 Nov 2026 13:53:06 +0100
X-Gm-Features: AclHuK9f8_4hj4WZI7U8R_PPW4mheeI6fjAZW22lb_dsLGyAMF1kCmKW69Uy0Cc
Message-ID: <CABGWkvoKQksL0vKOi2bLY5o3j998SzkAhdkkP4_ftySjbgqBrA@mail.gmail.com>
Subject: Re: [PATCH 0/5] arm64: support Engicam i.Core MX8M Plus FE C.TOUCH
 2.0 board
To: linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, Fabio Estevam <festevam@gmail.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Markus Niebel <Markus.Niebel@ew.tq-group.com>, 
	Maud Spierings <maudspierings@gocontroll.com>, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stefano Radaelli <stefano.r@variscite.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

Gentle ping on this series. Patch 2/5 has Krzysztof's Acked-by, and
the series still applies cleanly on next-20261119.

Thanks and regards,
Dario

On Fri, Oct 30, 2026 at 5:35=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> This series adds initial support for the Engicam i.Core MX8M Plus Fast
> Ethernet C.TOUCH 2.0 board, based on the i.Core MX8M Plus Fast Ethernet
> SoM.
>
> The support includes device tree descriptions for the SoM and for the
> C.TOUCH 2.0 carrier board, together with an overlay for the 10.1"
> LVDS display (C.TOUCH 2.0 10.1" Open Frame).
>
>
> Dario Binacchi (5):
>   arm64: dts: imx8mp-icore-mx8mp: enable the watchdog
>   dt-bindings: arm: fsl: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0
>     board
>   arm64: dts: freescale: support Engicam i.Core MX8M Plus FE SoM
>   arm64: dts: freescale: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0
>     board
>   arm64: dts: freescale: add Engicam C.TOUCH 2.0 LVDS display overlay
>
>  .../devicetree/bindings/arm/fsl.yaml          |   7 +
>  arch/arm64/boot/dts/freescale/Makefile        |   8 +
>  ...ctouch2-overlay-am-1280800w8tzqw-t00h.dtso |  53 ++++++
>  .../freescale/imx8mp-icore-mx8mp-ctouch2.dtsi | 166 ++++++++++++++++++
>  .../imx8mp-icore-mx8mp-fe-ctouch2.dts         |  17 ++
>  .../dts/freescale/imx8mp-icore-mx8mp-fe.dtsi  |  62 +++++++
>  .../dts/freescale/imx8mp-icore-mx8mp.dtsi     |  13 ++
>  7 files changed, 326 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctou=
ch2-overlay-am-1280800w8tzqw-t00h.dtso
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctou=
ch2.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-c=
touch2.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.d=
tsi
>
> ---
> base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
> branch: engicam-imx8mp-icore-fe-ctouch2
>
> --
> 2.43.0
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
