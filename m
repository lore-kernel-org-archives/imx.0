Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C498C19F466
	for <imx@lists.linux.dev>; Tue, 30 Jul 2024 13:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722344669; cv=none; b=kgeMgzM5apAyp8V7PvRzX84r4eC41LWtqmiIzVqnoRwGbxzhtCo0QyVf6bTeQnJEc9+0JB69o2Hq1pPb1jSrUPE/7/wrhnJ0XDrS5B/px2iPc2Vmv6+Qumx3bapFbSSg0/hVrfVhoS66G0wfrGihIU6c/RLhzsnfQa3LJBUzhqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722344669; c=relaxed/simple;
	bh=o7jV0TsjHShHuJW+lvGQPrtCv1eUSRwbwdqYfZNvf5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYs4goctbnjXmqt0Om++8VY/g3r9vVrBl8t0D5sqYxGJMyIfdRMbbdIiaukwXFGin9jJ7g+SinSnGpeX628a1ugOmz06LD5kx4Zxez/LbN06n5n1mQGH1yooiUJ00wWAf4OpoDfTBhAli/sjC+u0azJ/HV1vv0vurDnj5VPllyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFPKnHPp; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFPKnHPp"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-6bce380eb96so2590428a12.0
        for <imx@lists.linux.dev>; Tue, 30 Jul 2024 06:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722344667; x=1722949467; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeccX9FlLPnJUb8SbtR469SLQigZSvmfeJTapPIcJEo=;
        b=jFPKnHPpUhSyL4ivHeEbpdfYMEhSRqrG4HhCY6AlFOK+IB4m/9rx9sUvpSFkfiw+p5
         zQnAekW47foT8Eb9yS3RYbchBHkMDC+ax7de1m8G9cnlzdelojyQMDz/P33+GrwRMxtK
         zG1qbFWsH89oBHECXaqcWKaKzys95mcxBED2EZQY5nrDjz+Zws6o/CmTBY19XNRe8It0
         +6DUsLtyWwT29YtvEXMrVTfXBER/9sS07H4V2P7wxoc2TPHeDc+lY40w0xBgDCvutb0o
         1dGKxUf6kDUJVjp/OnqAJZRbBaQb8/01o/yiT0URifVsDp6/uBoJWNHlKzuB6AW1J+pF
         zy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722344667; x=1722949467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeccX9FlLPnJUb8SbtR469SLQigZSvmfeJTapPIcJEo=;
        b=avm11zFGcdDoyFWg/cVng8TRMT5G7oL97UWXGN7XicNkWfLTyvqY4w4cqUcTLA51PS
         luJDF9pJHhi88eu6Rykvs8PF0pLcnqGVAmceJqjlwqQ3rIQt28kFRuWTKTtFvZRJc+ta
         BUV+jFbhewkm2d6KBW2oIrTcaL30+KUkGitEqK7ZCScZ9jLje5QZQtiTo3Ddajf0XmxA
         5znPNq1t3VaDc5mjMAn1ulTr8NrnZwLP+nZseNv8Diu+ahB32H4OtEgzR4b2Bf0k+Uny
         4bzA9ayIu/A/jXF+lTPy9y5dvw2phdeJFmurmI2yp5iu42cI79sOYxqEvN3SqJgohUIU
         0ECg==
X-Forwarded-Encrypted: i=1; AJvYcCULP4CNYLViyLqhpQwwqx/kUxkmElwbxgrD+0YZbfQUvJI5h1LbIS3uOaqRdoSQohjEBxCFKsOj4d/CfUm3Bi8csw0R
X-Gm-Message-State: AOJu0YyOhf1EoizHAjyQjCZJgEvDnv0cvy7GRBngjS5jLrRg7riIHeRA
	RWTxWhQ4EDyuWGPY2SWaG1CGODD/Gb7qOSYGHidUOQXDydb9m935TdqzuCSe84jHfhZX4jNWaWD
	btgu9UKMOPu6ljd5/FzO6vkFfENw=
X-Google-Smtp-Source: AGHT+IHgcXQCsSqKIUHuUWZSHKpsG+ja+gPjqOUYutQQRnCj/8Yw7YUXnXOnDA1PxG+ZugQo8W1m/pNBPvI+7DKcWA0=
X-Received: by 2002:a17:90a:ac2:b0:2c9:5c67:dd9e with SMTP id
 98e67ed59e1d1-2cf7e1ff4e8mr8772739a91.19.1722344666339; Tue, 30 Jul 2024
 06:04:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240714172017.422811-1-aford173@gmail.com>
In-Reply-To: <20240714172017.422811-1-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 30 Jul 2024 08:04:14 -0500
Message-ID: <CAHCN7x+_M6Mmo8OmvA4EWcWwtedSHB4uFT0+7n+s6iVK+dxrkw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-beacon-kit: Fix Stereo Audio on WM8962
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Lucas Stach <l.stach@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 14, 2024 at 12:20=E2=80=AFPM Adam Ford <aford173@gmail.com> wro=
te:
>
> The L/R clock needs to be controlled by the SAI3 instead of the
> CODEC to properly achieve stereo sound. Doing this allows removes
> the need for unnecessary clock manipulation to try to get the
> CODEC's clock in sync with the SAI3 clock, since the CODEC can cope
> with a wide variety of clock inputs.

Shawn,

Any chance this could get reviewed and/or applied?

thanks,

adam

>
> Fixes: 161af16c18f3 ("arm64: dts: imx8mp-beacon-kit: Fix audio_pll2 clock=
")
> Fixes: 69e2f37a6ddc ("arm64: dts: imx8mp-beacon-kit: Enable WM8962 Audio =
CODEC")
> Signed-off-by: Adam Ford <aford173@gmail.com>
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/a=
rm64/boot/dts/freescale/imx8mp-beacon-kit.dts
> index 1871c10f5c12..de5b64fa479a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
> @@ -222,13 +222,12 @@ sound-wm8962 {
>
>                 simple-audio-card,cpu {
>                         sound-dai =3D <&sai3>;
> +                       frame-master;
> +                       bitclock-master;
>                 };
>
>                 simple-audio-card,codec {
>                         sound-dai =3D <&wm8962>;
> -                       clocks =3D <&clk IMX8MP_CLK_IPP_DO_CLKO1>;
> -                       frame-master;
> -                       bitclock-master;
>                 };
>         };
>  };
> @@ -544,10 +543,9 @@ &pcie_phy {
>  &sai3 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_sai3>;
> -       assigned-clocks =3D <&clk IMX8MP_CLK_SAI3>,
> -                         <&clk IMX8MP_AUDIO_PLL2> ;
> -       assigned-clock-parents =3D <&clk IMX8MP_AUDIO_PLL2_OUT>;
> -       assigned-clock-rates =3D <12288000>, <361267200>;
> +       assigned-clocks =3D <&clk IMX8MP_CLK_SAI3>;
> +       assigned-clock-parents =3D <&clk IMX8MP_AUDIO_PLL1_OUT>;
> +       assigned-clock-rates =3D <12288000>;
>         fsl,sai-mclk-direction-output;
>         status =3D "okay";
>  };
> --
> 2.43.0
>
