Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430C1242D74
	for <imx@lists.linux.dev>; Tue, 20 May 2025 13:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747748086; cv=none; b=Qs6zYXoPgnGG/OEJ+K/5k0W3mBtR9SaNeIOevBUeZwzkyOKahAV/1fn+I8ysbo+SkDaAwHbSLHXk69I9gGMlkqhZvaVKSboCbDBumlLNo2mZCL1+QO3vxodo0jILMLU5Ay2L9UZ1S7ri7KbuwP6SI0CyGySrTjJjHO8hyYQd7TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747748086; c=relaxed/simple;
	bh=gFVBHCCsBHL4lLZoEhsrJGKq4vpU6nZU7dUlkmtYGok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gqQPW+oiyW5b62pVcG9BDTSzOAS5UUYRQ61bSeGMR2MGGt82fsFLS+NxD70S520+efWtYSfmWQ/+2U3/pGLf1ezcGpWa8K1xXFfj3Apd6ns+YKakiNIlnq4rYaPJyIADU+90X1H10r7Lox93COTqYWWoKYxu/I2Jvm0BINdTeEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L24ANmMw; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L24ANmMw"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so7091834e87.1
        for <imx@lists.linux.dev>; Tue, 20 May 2025 06:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747748081; x=1748352881; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfD1s22Ic364TvVTHCagUpXijjIYK42cBGG9M8zpn10=;
        b=L24ANmMwP/wpCTcJl/FwupDkFbiBL3lLrgyt+gPsB1GYJGdAv2+wdKjALgW7McQ3xs
         qo7sIuyltpHylde6mtWUkI4uk/x2fTsysAkj8NcR/cYVeZBc8z0mjmsec+zHTU/+HWTW
         iPbHz2LTKF1rxJjWHSUdVlRELXJ1AzXGxElxuwCdNYbi676SGs9OPezBDSJbU8Ig2bcU
         /9pPvIILlcjUcyIQXZ58tBUXVjkAshk5Ia3cN93oDRhzYUtpj9xEQWl8vJ7weeYwBsGP
         E4BtMImje9cICRY4LL1+V+L48vx8clSGn11uE3o7PCV54kEwds08d1R7zTexXfjwFNPp
         krIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747748081; x=1748352881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfD1s22Ic364TvVTHCagUpXijjIYK42cBGG9M8zpn10=;
        b=VuBmnI1k4Su6Reu07U0qDSFkdVlb0PV5gjEsM0IG2mdJXquaK/H1kdCnPBf+PCpKn5
         cMxPqoYI8IA5+e9Zb3sya5Xnov39m9WfxbtsndSekQcx7uQC2BEGwQHjIEZu4s+CigDf
         ta25j/2mGf5JsTKNb0vbNPeRZDTxiOYnQxOyDt17jVIUR5g55j72dUegtuirazAvCMxZ
         S2PFFof/Xbno0jxZawOiGc0BjAvhAL21Ai7bpB1GZLrU1/q+xkqU1EB5CuYkqtWuyWU5
         yJS6vOcOoaKUUlxXURWEKCazr9qcs+UPbbo4pwqpMiPVI1Q3r0tyedS0KQ2tEsLi3ZQ8
         ckPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqYmOxF8d+dzE7SicmRmcitHhviBGdYXORexUWitKPTIDr2ecrXM4uB9la27f5BtPKGMQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/Zl2univzL9Asq84mway3wP45HpqVCKcvc3Nqvff3Oa0AD6Io
	TLo3+iAR+liWUipPzkn8Kv/SmGQEDZJEuoDKJCBVgSB5FJkZUr/m2iWGamEb75vX0IfcoGkKZe4
	uZ9R4Xb5h0Kf+GDwR0Qc57hKFj4lAmUM=
X-Gm-Gg: ASbGncuYXkeiOh5Frca6gB/QwScBEjn+1npIuQSFRGbkSs9wXkkJ7s+SGXKm8MU4LDP
	sfqfAe4i/eWfOHwUAktXOpeCXxM6/BYLJi9DWrmyT1hCC102EXz3fyr4Zuy6WQKaCY4IgqGat15
	u2hD7Y216Mpaw9FPm3P0TCLXjI5WgxzwNXtroX1Fy5txKzEOs3NVkB5dryqj0oDTM=
X-Google-Smtp-Source: AGHT+IGOdVh5BabNP6weiWFLJXZ3ZVMdQGC/USr/zeCgTmal+W0BVS9hJ31uxCQihRwgnGjI33KrTTR4UAo6HbnMaFc=
X-Received: by 2002:a05:6512:4602:b0:549:490e:240d with SMTP id
 2adb3069b0e04-550e71d7d90mr5140507e87.28.1747748080897; Tue, 20 May 2025
 06:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250520115143.409413-1-c.stoidner@phytec.de>
In-Reply-To: <20250520115143.409413-1-c.stoidner@phytec.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 May 2025 10:34:29 -0300
X-Gm-Features: AX0GCFu-SKgKDmlyHEywfDCC8Hm0Dm6pbXAwBI2nvYfhldnFsrevIPgWdHRuit4
Message-ID: <CAOMZO5D8giOiBCeV5AP1pL+hCFQt9bs3gFsr2mCgMSSbcbCovw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
To: Christoph Stoidner <c.stoidner@phytec.de>
Cc: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 8:52=E2=80=AFAM Christoph Stoidner <c.stoidner@phyt=
ec.de> wrote:

> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/=
arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> index 88c2657b50e6..c08f4b8a65a6 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> @@ -58,6 +58,9 @@ &fec {
>                                  <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
>                                  <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
>         assigned-clock-rates =3D <100000000>, <50000000>, <50000000>;
> +       phy-reset-gpios =3D <&gpio4 23 GPIO_ACTIVE_HIGH>;
> +       phy-reset-duration =3D <1>;
> +       phy-reset-post-delay =3D <0>;

These properties are marked as deprecated in fsl,fec.yaml.

It would be better to place the properties described by
ethernet-phy.yaml under the ethernet-phy@1 node.
