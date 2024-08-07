Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0225378C7E
	for <imx@lists.linux.dev>; Wed,  7 Aug 2024 18:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723056182; cv=none; b=OVFnhBPt3sqoUXkSS5uquXC8GPIDnMu+V161RTWQQR0ScgVsW3hxMyOobQufr16qMMsgqa+hlCJpdmapc9SnoLqmhMtOf7QrN/CBIpVuC1KVFT1DBzJd40+a48OjMmahPm+jJAYo2CcqQjy0fghf3W6XRPwHCV90U/ChZqQvNRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723056182; c=relaxed/simple;
	bh=pjQWUW7q5HQDIJGAFqqVY+CDA9M9vwP1peG/rZG94os=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BD2L2PLIpFG5OvFlpN+QSGeExREs/HghySFkfPk9P+VrSl3Zg5hiwjOUVM9s8MiCqqKl5TMbKMlo5bnMuAZdtywqLu5sdR5VEOwOPLIuQ5qJ9NZbOVcx0/Ep0Aa0+RSDADwHUCHL/VP8GzZ94NbThrtyCPPzrla9GRyWo3XZhDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOFR3uLC; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOFR3uLC"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52fd0904243so17901e87.3
        for <imx@lists.linux.dev>; Wed, 07 Aug 2024 11:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723056179; x=1723660979; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vi22Z7/z7KGaeL5sryaJg6znudrYZaucY8JSso4zVMA=;
        b=hOFR3uLC4zIkFbPgQi7MXJfcd+gk4uZs33jCQJRIMRhRkPZSVifWOKIrEnXgjG7O6D
         KGoaU92NP2EzRWtvEyUm90PDD8VzdqXFpoEN+rZko0F8Ox6GlxuZNRSwhzglHImxO/+K
         fp7d/dqpsH9l3m4HpPsjfwUEo5CdlopDp+miFjBFb1VKgZzwOxPgNKRfSiogGY1B6wxV
         JM1NPhPQ9mW45R/rBQkCOhvKLNuZPmcYvEf92L936LoILLFhs4YNh8N03X1c6ermhp9z
         rR6uRHvpl88Ms5INzhT/boQmtDFxeWxOBXs0aL3FP806piYy1e90YbofzxEQli+nV7M0
         tMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723056179; x=1723660979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vi22Z7/z7KGaeL5sryaJg6znudrYZaucY8JSso4zVMA=;
        b=b07f29u/dBSXbhG3G9DJo506HNWtRQHYqMtQVyD7GRQnhhllMboH6+/2HUTSynK4ua
         CX8DL7/Miy28XKdizoAjOUY0Z2rAq9W+IwNXaHx5nbuV1ouLNfPbcNs9Gykcm/p6X7tM
         L2/FXd9XbxXMeQSdgQ5Qc9uM9NSfArqd5YPHPEKRSxbgIboHGe3uW1uRtbzgLHXRjR6U
         /ERBQCbaTTUtMo1jroiIOIoJCvck7May9zEVm6Vuf4fY2lcoidsCkVaUh+I7lK4iUa5x
         HX95HF+erjKUqY7Hoc1me8ss4HiaQU5zdKM7o8bvXuUpFUcSQ0I3aS+UcKAfiQzUvVdq
         z2hA==
X-Forwarded-Encrypted: i=1; AJvYcCUKXsvw6xPrzjwctRaiECgoiRxp/u7HuabMYsqrFMDcIOBnrVl2EL8uIKObycCVzSM8OvjWXMW072qIYMFiwKRgMO3T
X-Gm-Message-State: AOJu0YzKK1tZp1ykzSHvBh31hWh0343wFRkknFCMr97X4EyNDwPWjpFD
	XfuXXEjYn5x2hjpO8PlGvjVqyn+qjKaZmNcwjkkI9+UQdoMnPkPSNb2rzLrmMmamjXEAyZyYMiR
	lKTTX5N4agOy98EL9zBl+BQKn6uROQw==
X-Google-Smtp-Source: AGHT+IErDQ9+7pwORIsutODey2VWREwIo+wqFfhXfY42C+j14tgspSe8U5il7QB4nP2cMGLiMo1jeiIdsiqEcMuj4xI=
X-Received: by 2002:a05:6512:31c9:b0:52f:cad0:2d4a with SMTP id
 2adb3069b0e04-530bb3bdc62mr7540743e87.9.1723056178707; Wed, 07 Aug 2024
 11:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240807-fsl_dts_warning-v2-0-89e08c38831a@nxp.com> <20240807-fsl_dts_warning-v2-4-89e08c38831a@nxp.com>
In-Reply-To: <20240807-fsl_dts_warning-v2-4-89e08c38831a@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 7 Aug 2024 15:42:47 -0300
Message-ID: <CAOMZO5A3FKPurXZ6ZoUB7zzXBC5xRLEHPsTQ-hRyDs=g2ZaqUQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: imx8mp-data-modul-edm-sbc: remove
 #clock-cells for sai3
To: Frank Li <Frank.Li@nxp.com>, Marek Vasut <marex@denx.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding Marek.

On Wed, Aug 7, 2024 at 11:52=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> Remove #clock-cells for sai3 because sai3 is not clock controller to fix
> below warning:
> /arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: sai@30c3000=
0: Unevaluated properties are not allowed ('#clock-cells' was unexpected)
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts =
b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> index 7e1b58dbe23a7..837ea79741e8d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> @@ -499,7 +499,6 @@ &pwm4 {
>  };
>
>  &sai3 {
> -       #clock-cells =3D <0>;
>         #sound-dai-cells =3D <0>;
>         assigned-clocks =3D <&clk IMX8MP_CLK_SAI3>;
>         assigned-clock-parents =3D <&clk IMX8MP_AUDIO_PLL1_OUT>;
>
> --
> 2.34.1
>
