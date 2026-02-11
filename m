Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380502DB7A5
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 15:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770823321; cv=pass; b=iqLEmMdGQyi/9ttfdHYnc/bxCg93Z+ImIZQJFFMIplxhVGX3F8/5UBfZFckv71aoIX4hAzIWf4kwJ1So1AVLKFIqmbtdRPV+54I9IeJ8OiX8WHdeUJz0pVlpXCU6DQ6qYB8JFmJAQaosUUfMTCwwnM3p1J7i6Lljq6kYIVvDnUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770823321; c=relaxed/simple;
	bh=jKgnH55cP6rygXD28uxPooGQFmgnbRJFPJU7uSCkyCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rLSDNDcD2iukn/GBFqJY9auKWgqHEHl08cFtaMGX7bE0J+58n1/pTsk/H87hrkZDFop6TlVMHGyLTWUQCvwghYYv6XOd5KpiRBbeBqGa5pskcfWhOsg7D6A55HiUmjcR9acxnFr7wEt3am/wyeh4WYpnHoMM3fGLwFio79i3Bao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v1x4LdFZ; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v1x4LdFZ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59de0b7c28aso2261601e87.1
        for <imx@lists.linux.dev>; Wed, 11 Feb 2026 07:21:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770823318; cv=none;
        d=google.com; s=arc-20240605;
        b=GU2KCbw19Sg65LybSuVViYP8m5gAJSE0S/+Xutg3Su3SnfSUYuX2oISklNjqGbcOER
         PqsF4YQQdUOoGeAOpYeH3dlaIXtUN4sF96IvEbx8s3EE4HYuem4faHN1wKRMHu2PDG0V
         jr5+fuPxvn4Ulal6mSk6DD+LNhhk/r4mOuRqAG6EaWF6MxQ7bMHYiRT6Kd6b2cVxQPaU
         8lBrBQow4rJWoEVZD+7otqL4ZUOAgV+8QpzwjZ4w65Evxx7dqF+E8crRXBa4I5lQqgaI
         d3lbtAi7csgF7OBDVtNLnmpfAK4A0q6KLwPcQSBLSPHpx8ljznAYs8KqwBL7ki5HdUON
         S5IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D8tEaQ6SYPSExfheur4wSJ9KP74RCbKGRXJfEtk6eHc=;
        fh=COWOOKsjs3YKl89g+diWMNfOPrPuFTYHG4gNqIr+D5U=;
        b=DG2ZU8NKxeqpbjLvo3vDvHkpQ24dNF5U1YBY0Uvyx1R9Ulc9ujQpMT7xiToh68GHLu
         DWuUpHPmxxL/9lpRIFo2GmDT8kO+RkhDtvpGLR5ufP8NttshfwIS4Kurle8U9tOvTyaR
         18ZDqSs3MoEcx08O9SU0/PoMvhHLFNq3aJKJ0Gpi3CzY2Ju/FqCj8g4IUvhxncBxyjbs
         1oV79Um0i0bs3V6vcpUSd1j2mwAxo6m619HnN8EPUiu0MEyO64HbXJN2jdjH8OA9J7ez
         6CSxUHcuke382sQmrrCCGhAkCm2v8WyrtfjbCXDCkNrJPmp2RmGfzgQBTUE2hl43J9vh
         Zz8w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770823318; x=1771428118; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8tEaQ6SYPSExfheur4wSJ9KP74RCbKGRXJfEtk6eHc=;
        b=v1x4LdFZjY8MmHorwezQpqUDbBabxRsGJR17j+t3btr8mQRbjSauNyTmn5QDvyIuor
         tJcngVoc+D2Q0XjZO1bRzmKTsNeCclI67ti07EOaC3F18Ecc9jcwGIagu9/gG6su3hLy
         QKj5DyagCOZpi5I1uIT1WHR7ks25DuKzJocdnjwhw9WYjeXtpVB2hxj3ilo7TQXUpzyg
         8LTnWlB97jPhojwOsl3EXEoF99kQpxXot/EAuREZri5PwHKUvU+QuvZyzKE1RVg4kPKh
         xG9BlHOuluD+ga1gL/FyUvzqMZzpxGOEcLsV/+8uxscRkh2VPCFRjCJfq2RYzRbExg0R
         rLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770823318; x=1771428118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D8tEaQ6SYPSExfheur4wSJ9KP74RCbKGRXJfEtk6eHc=;
        b=rkCGgQu7Xts5tQ76JuF0RbG1Nzg08o+/AvPNnjmfCVor77aS/cH9I35Mb9KS5fz8hg
         kJ5yCNDDELhGr4AuWO39NCjTnd222xnFZR8qOgRNsOW3BtqVY2IgX/yUSMAQumUqb+TU
         xH+4O/hK9SNUVSBKiFRUVXXO5QgiV0udqgBxI7ACBbKrsf/4zSHi311tqYQkI7ouyXym
         //+POWSN7bguE/y9Bdv3dwbfI5fXJqvwEdNaxm5v2BqX3uKnstTwoLaNlfkAtKnBmsPc
         q/4gqzVCwTWHgLv97yLGVGy1dpf9880ZDoxi5yFZlsf7wWnFWifQCzBMRibq0XcfYgjS
         En4w==
X-Forwarded-Encrypted: i=1; AJvYcCWyv/zw93LcO/ZmD6L1Nvdv92NPg9c1DSd5AS2RSh7vYD49iUSCdo8W29RxEo6Xlu04WVQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzWBjx40aP900E3MQMES+cszXhJMnxADKnmzGkNdAvus8fZVc6
	GzFeb/Evkpfq1B5+EReTPN5sph629KOEsCq4rcb8Wz5fFsuSqcKiVcOtWvJ+1JP+S17YDUhqVX1
	R7WASiWMdhgUfh5ZgGvf/uEB14/CL0CGBaO87qb0xZA==
X-Gm-Gg: AZuq6aJLkoJVcl48cRh7qhu1Ye49YX13AWtOl5wzherS+4QwlnCZ7C4bwfPmCWn3s42
	bYTZ3wFj1jUVJFTX8j7dUkjD5ThmF6zigiAI/imnWZDcG7ujy+LyZhxGP4r3FTbLXvjSgK9cZ9j
	0iHcnKFLM/FyRgcmVJz8CeQZv87qweWmR/NzgFmEZcfcr2yoc6Fug+P1All1XkHOZ2SFlC+25XF
	x1lYnaVkNX4rEVrvB5mtN8MDsfYH+jNYnixugNY0W8Pzcde87+pyEH3qLh/8xsK1F6OvAPTfJGO
	KhDhIrVN
X-Received: by 2002:a05:6512:15a9:b0:59d:e5dd:2bf8 with SMTP id
 2adb3069b0e04-59e45043c8bmr6830204e87.4.1770823318175; Wed, 11 Feb 2026
 07:21:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260206-imx8mm_gpu_power_domain-v4-1-52fb603da502@nxp.com>
In-Reply-To: <20260206-imx8mm_gpu_power_domain-v4-1-52fb603da502@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 11 Feb 2026 16:21:21 +0100
X-Gm-Features: AZwV_Qh6uuJ5R6yExA5NxdnwgpEPG3g1Bp9Nwj2TBDZ8Mr0Gl4mQPg_5pQZVBWI
Message-ID: <CAPDyKFqkXBa=9qW0rd4=Cf2gjVAVDw3No5DbnSQ4OFuze00Yfg@mail.gmail.com>
Subject: Re: [PATCH v4] pmdomain: imx: gpcv2: Fix the imx8mm gpu hang due to
 wrong adb400 reset
To: Jacky Bai <ping.bai@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Lucas Stach <l.stach@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Feb 2026 at 15:42, Jacky Bai <ping.bai@nxp.com> wrote:
>
> On i.MX8MM, the GPUMIX, GPU2D, and GPU3D blocks share a common reset
> domain. Due to this hardware limitation, powering off/on GPU2D or GPU3D
> also triggers a reset of the GPUMIX domain, including its ADB400 port.
> However, the ADB400 interface must always be placed into power=E2=80=91do=
wn mode
> before being reset.
>
> Currently the GPUMIX and GPU2D/3D power domains rely on runtime PM to
> handle dependency ordering. In some corner cases, the GPUMIX power off
> sequence is skipped, leaving the ADB400 port active when GPU2D/3D reset.
> This causes the GPUMIX ADB400 port to be reset while still active,
> leading to unpredictable bus behavior and GPU hangs.
>
> To avoid this, refine the power=E2=80=91domain control logic so that the =
GPUMIX
> ADB400 port is explicitly powered down and powered up as part of the GPU
> power domain on/off sequence. This ensures proper ordering and prevents
> incorrect ADB400 reset.
>
> Fixes: 055467378bf1 ("driver core: Enable fw_devlink=3Drpm by default")
> Cc: stable@vger.kernel.org
> Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

This doesn't apply cleanly on my next branch, can you please rebase
and re-submit a new version?

Kind regards
Uffe

> ---
> Changes in v4:
> - Add the Fixes tag
> - Link to v3: https://lore.kernel.org/r/20260123-imx8mm_gpu_power_domain-=
v3-1-3752618050c9@nxp.com
>
> Changes in v3:
> - Fix the Suggested-by tag typo
> - Link to v2: https://lore.kernel.org/r/20260120-imx8mm_gpu_power_domain-=
v2-1-be10fd018108@nxp.com
>
> Changes in v2:
> - add prefix to patch subject as suggested by Krzysztof
> - refine the patch to move the GPUMIX ADB400 into GPU power domain
> - Link to v1: https://lore.kernel.org/r/20260119-imx8mm_gpu_power_domain-=
v1-0-34d81c766916@nxp.com
> ---
>  drivers/pmdomain/imx/gpcv2.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index b7cea89140ee8923f32486eab953c0e1a36bf06d..a829f8da5be70d0392276bd13=
5fb7fc1bbf10496 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -165,13 +165,11 @@
>  #define IMX8M_VPU_HSK_PWRDNREQN                        BIT(5)
>  #define IMX8M_DISP_HSK_PWRDNREQN               BIT(4)
>
> -#define IMX8MM_GPUMIX_HSK_PWRDNACKN            BIT(29)
> -#define IMX8MM_GPU_HSK_PWRDNACKN               (BIT(27) | BIT(28))
> +#define IMX8MM_GPU_HSK_PWRDNACKN               GENMASK(29, 27)
>  #define IMX8MM_VPUMIX_HSK_PWRDNACKN            BIT(26)
>  #define IMX8MM_DISPMIX_HSK_PWRDNACKN           BIT(25)
>  #define IMX8MM_HSIO_HSK_PWRDNACKN              (BIT(23) | BIT(24))
> -#define IMX8MM_GPUMIX_HSK_PWRDNREQN            BIT(11)
> -#define IMX8MM_GPU_HSK_PWRDNREQN               (BIT(9) | BIT(10))
> +#define IMX8MM_GPU_HSK_PWRDNREQN               GENMASK(11, 9)
>  #define IMX8MM_VPUMIX_HSK_PWRDNREQN            BIT(8)
>  #define IMX8MM_DISPMIX_HSK_PWRDNREQN           BIT(7)
>  #define IMX8MM_HSIO_HSK_PWRDNREQN              (BIT(5) | BIT(6))
> @@ -794,8 +792,6 @@ static const struct imx_pgc_domain imx8mm_pgc_domains=
[] =3D {
>                 .bits  =3D {
>                         .pxx =3D IMX8MM_GPUMIX_SW_Pxx_REQ,
>                         .map =3D IMX8MM_GPUMIX_A53_DOMAIN,
> -                       .hskreq =3D IMX8MM_GPUMIX_HSK_PWRDNREQN,
> -                       .hskack =3D IMX8MM_GPUMIX_HSK_PWRDNACKN,
>                 },
>                 .pgc   =3D BIT(IMX8MM_PGC_GPUMIX),
>                 .keep_clocks =3D true,
>
> ---
> base-commit: 0f853ca2a798ead9d24d39cad99b0966815c582a
> change-id: 20260113-imx8mm_gpu_power_domain-56c22ce012a1
>
> Best regards,
> --
> Jacky Bai <ping.bai@nxp.com>
>
