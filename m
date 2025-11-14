Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1AF2FCC1E
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 08:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763110178; cv=none; b=R4IBo1nebVxYXfI3fcpjY/Qw/98J+y73aZigHEfbOmFg6qy9gDM0lXjEpVtD+DG1c5qynZfRYkS3ErHVWzqNMfe9+Ew+YgWCGaQCk8Oar0zCC4yD24l77XaOsK7dDryvb8S1exVvPwQ6gcQihSXmhq8rs1gA8/Tk3oLtGmD5cVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763110178; c=relaxed/simple;
	bh=qhWrVdkJl/bh943Rpg/Moi+ra3osyEZ5mvlznsHPeR0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K8UCW8z3yes6iLkFnosOhc74CyywpFkN3aXgcx8Mo05wFHUhGexEhQkyupbxQr07cW+lf2yIEo8NTYc9prf5xlx+Oqzuk7L9hD/yCMOcrrPrk65rJrkDIFPUJQgJOnh0anKFtrpFxeME7V10XroCn+k49aobpBEBqvM5Yxex9cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIulnRRa; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIulnRRa"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477632d45c9so12829765e9.2
        for <imx@lists.linux.dev>; Fri, 14 Nov 2025 00:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763110175; x=1763714975; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YeYjS1oDyvjSvHSS5QjEowfSx3Ga9VJevXqRCYptZeQ=;
        b=JIulnRRah6VFjl0qLCHmZl78L9+V615eO8aNexQspz79rn499PXBKM4Mp6vwFF3wsq
         sxDQvJUYc/6jgEPvkzrUkbN+5ZA6WtWvPQbSpGL6B49/0vDyHH+kdSSGL8cFqHXela7+
         BkvVlKd9MUIQzcjmX+0pVY4bmblf+efNtxaU3SlzZy19Cd1oJtVRki7grgy3aE+orFKe
         dz4RotLtU4GlsW+zK8Kf5LnfgAdChf+ys+VFyTtozn6xxJdu/xkzmFj+7t/DsUxMyiwe
         AE4oNqpLY7V9EvNKev1I93eFfmYHwgtobBRVDlkObXUFcbbiYh6tBqOmgTvs3t6sW/Jl
         V3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763110175; x=1763714975;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YeYjS1oDyvjSvHSS5QjEowfSx3Ga9VJevXqRCYptZeQ=;
        b=iF7VEFMAyTpJei9cTHJXN/hPg60x8uTbsvT+K/J0jzNfwLWpVHHnCiL+buLBLF35P0
         6ou7bfnawA3VbQETG+Y6pasYPdwFWYZTYVKc2ff99pGTBT7snk+x1QZjnR+oehcBrP4E
         dYiT7J4HtDbRnhBv3SqI4hdNWzVGiBm3ArIyvwYbFqaUgAK8l32PFSV7Y3XF71lKDfoT
         e3GlnVeFZgnuixhWCXDSX+hoAQZMvXMPazb+3sQ9CDwthnm0/hnmH5sviZpj+Jth1A2z
         7+AOAloHAMoq+2tu/e/6P1tFuQeXHje1wd4fZcdsPN1Ku7edNIDDriztvzJ1kAQnQuSF
         nl8w==
X-Forwarded-Encrypted: i=1; AJvYcCVw2FyQe/DaYgHs2g9avUvPGO3Gik1LwRLeJv3WCNioJPp1/aSOT5xlbYvDEFVoB0+eQzM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyeyw9FMu7Cv6Md0ytTtW8dwgtV7Lg36sfbSGCRnalfWQnzr5ek
	V2ULGZ4K38DUc5uln1XPzZQz5vbFf+G5uEwsFxHuZbT6wLLZ/6MS/mpa
X-Gm-Gg: ASbGnctmodOZQHsC0JLC1Tr8zdMgeEpogyzhaTgRS586BSd9zt1QeAo/E5M6asFuKrH
	nSXdRVYAw+2YwENPap4P6AL7MymFTYtqz3jUihb1BYdX2cpH5JTy/jzgmigkBk67oWjwcmPDSu8
	E56Y+5QJh4MtrYW+Wnl4hbFR7CT1OouSM+RcHq7AMGU8AvPbazaXTPPDw53CKDz/I+6xUL45f9T
	4gRGWesPj8orU/CgT8lrDnztmb43fpAaBzfpFSgKUr6tiOr3giEhlBLhlb80e4dANHeKEnFK4MN
	1FiW384yJN98Uu9jC/r5A6oFfkdr5KA3Sj8l5Vidd7j9CbZUoX4yvehJt3VTXivoOKt3WyuVHdf
	uvqGhKIAoEdD05XB42RKtj6H5as3dVUBCob526NvfndAuhOJjloL6VMD1MvboAloHzDlQcXFnvA
	AjOq37OiZ9
X-Google-Smtp-Source: AGHT+IEkod5fG6AAsH4ctHoDhGlcXc5CZv0N8Qu+3OArUyWUzrS5cYCQoO9x4HYN//zKqgCfS/g6sg==
X-Received: by 2002:a05:600c:c4a1:b0:475:dd7f:f6cd with SMTP id 5b1f17b1804b1-4778fe96c46mr20560365e9.35.1763110174886;
        Fri, 14 Nov 2025 00:49:34 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bb454a6sm40623555e9.2.2025.11.14.00.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 00:49:34 -0800 (PST)
Message-ID: <149fcf8e5df47fd94f9596498e9bfd7171cc7c5c.camel@gmail.com>
Subject: Re: [PATCH] pwm: adp5585: correct mismatched pwm chip info
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: ziniu.wang_1@nxp.com, laurent.pinchart@ideasonboard.com, 
	ukleinek@kernel.org, nuno.sa@analog.com, lee@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Date: Fri, 14 Nov 2025 08:50:12 +0000
In-Reply-To: <20251114065308.2074893-1-ziniu.wang_1@nxp.com>
References: <20251114065308.2074893-1-ziniu.wang_1@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2025-11-14 at 14:53 +0800, ziniu.wang_1@nxp.com wrote:
> From: Luke Wang <ziniu.wang_1@nxp.com>
>=20
> The register addresses of ADP5585 and ADP5589 are reversed.
>=20
> Fixes: 75024f97e82e ("pwm: adp5585: add support for adp5589")
>=20
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> ---

Ouch!

Thanks for the fix!

Acked-by: Nuno S=C3=A1 <nuno.sa@analog.com>

>=20
> =C2=A0drivers/pwm/pwm-adp5585.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-adp5585.c b/drivers/pwm/pwm-adp5585.c
> index dc2860979e24..806f8d79b0d7 100644
> --- a/drivers/pwm/pwm-adp5585.c
> +++ b/drivers/pwm/pwm-adp5585.c
> @@ -190,13 +190,13 @@ static int adp5585_pwm_probe(struct platform_device=
 *pdev)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static const struct adp5585_pwm_chip adp5589_pwm_chip_info =3D {
> +static const struct adp5585_pwm_chip adp5585_pwm_chip_info =3D {
> =C2=A0	.pwm_cfg =3D ADP5585_PWM_CFG,
> =C2=A0	.pwm_offt_low =3D ADP5585_PWM_OFFT_LOW,
> =C2=A0	.pwm_ont_low =3D ADP5585_PWM_ONT_LOW,
> =C2=A0};
> =C2=A0
> -static const struct adp5585_pwm_chip adp5585_pwm_chip_info =3D {
> +static const struct adp5585_pwm_chip adp5589_pwm_chip_info =3D {
> =C2=A0	.pwm_cfg =3D ADP5589_PWM_CFG,
> =C2=A0	.pwm_offt_low =3D ADP5589_PWM_OFFT_LOW,
> =C2=A0	.pwm_ont_low =3D ADP5589_PWM_ONT_LOW,
