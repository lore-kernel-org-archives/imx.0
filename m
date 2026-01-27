Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A33A35CBAC
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 14:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524090; cv=pass; b=NRr++KQI6EsorVJSSVhJLfBLEoNyIKlDzdh4wDSVJ2guuhBfepzh1xBv1d3kQBirlp/RoRRHQKq59E9H8Vgbay05St4Nr3ItPD+MR7tS/gzOunY1Osb2dXOFiOozPxJIdU/x8RIpVAetic4n0WQ9FTW7mTlsxeXp+xzhv/KfRnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524090; c=relaxed/simple;
	bh=OiTeEcGKcBFXkRotAq2rLJUFGoS2e/8S4B3ZUHMIoc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcQ2N1yrRf+WVFeOBIZkqn4NWfONCVm6Cvk0DjawsznL9KNnBWHPwZDC6loZwfsE2uQauM2dFD/edEqvCWsQ3PJcOS8MhEo+hF1xeWSn6MrYhJDQoBcvuN/xgIlb6nrKsjIZHOOnsni6l+SqoVeCS7UOFLFfLAqlV7amkOF2wQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SZ4WzNZh; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SZ4WzNZh"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59ddb31ddcaso6159077e87.2
        for <imx@lists.linux.dev>; Tue, 27 Jan 2026 06:28:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769524087; cv=none;
        d=google.com; s=arc-20240605;
        b=CQArdKNaWJjLyWr6+JIFZnbZCBEDTn9TdMshtRw5jSK/AS8S/PNi2rNqyttH+i8pqh
         BjW9sZD0qGJV6DFJhxCYbcXt7F2Lbs2c7X2TAM0BNRDX0SEgy50qcgv193lwa8sgPWWX
         tcQuVe0urmzMHpPhohtmzmo21H0LN4UDC6fX/xJ/rIji5dHvXManpxo/07MRZzNN75u1
         uEmay/EhhnnVSAteBsZfkSL1gICorCZNLH7Xz7zbzVlzxNcqgW4OODx6jXu53mDxzaQ/
         VrXjUUd5dLoZ0OwcQkjxkQ0KCs5zya4yekYaz9iZ3+aGov4fZQsGsWDYmEABVOG93S8e
         uogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tYoopOl2EeQQVQoZQ/OaPmSnvdUbaPF603nZGlMkhL0=;
        fh=6Nj7IKiknAE0DrPDoJyTbtnTHNVXsvXBqIc2gfkzDNg=;
        b=LNGAWShyp93HJKB292ZvsD5b9Bp9lKJVqwgo30nBBXyB6/3zWWCPF5V1oVHr05+L1r
         3VGFKCPCisScFETLERQsCqlr4dFV3gHzlu/i0eodidKWxCrtOTrpBfmA0+QO/6YDTy5v
         tjXhGRWoQWn9/4/RjiCyQo5ZHmMAG1U2KYqmI5qdQHeP7K9kiBb2mJkpcECodXziyeOX
         DPgN4YAJ2EdRwqBpGMye5iD50WvM1v7Xc4vams7UkriVYZh86dlL3oSUmu0UimykL69h
         WrTuDnTwLqqxC/FH7ScDj5QsndOzHJbDkfW0CLbFHAyXcvwVN1lxN86z/ai9RUimdK9+
         r/uA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769524087; x=1770128887; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYoopOl2EeQQVQoZQ/OaPmSnvdUbaPF603nZGlMkhL0=;
        b=SZ4WzNZhTEWZD3zJWYvG0kKdaZES+nI6hWmcNrN9A0dLZtYVcVKphBWCO68YgvW4rN
         9u0FXkZagF8rhg9T5MN7AXmIQOG3wpJfq1DD9BSgE8zP8WwtI7JjS9ezp9vMXKKtyNN2
         51Tl5f0HwKWVhJYKU8Pbea6lT/b3yr2b82K/HnUiY//4ZYktg+wAedi/6xlG7/kMglTQ
         IecYNYV5VlpXWC0yKbZJoptVgRPO0IZ9tfYpyTN8Ec8MDuM+CZp4iz5Ju1P4CWZHQeTa
         efCZqyQybf62WRP0RRgJYem+03uBJMB37jH0QS6pJOVKW65ZulzNE3YjxERgDp/uEAR8
         p51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769524087; x=1770128887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tYoopOl2EeQQVQoZQ/OaPmSnvdUbaPF603nZGlMkhL0=;
        b=NXo/mfQfsqeZoAb2NS7Iy3JHW/hZj4atpGHKg2u3Nhhg/pxyahUTi52dmCpLT92s1I
         3cM0ElBvMLS+uPl2pqO9FgfgKEZgTUMdG6IAbLy4H7VQNkaWJACeNHbav7TbikqiGb4i
         nVuux549YF/+sjSp+wZasiU2++Jqd7y/rw7V9joFeagf/RobApkYxvvQTwGbQjpgFOuk
         GpPNSnh0ICa9BKQ/znAJePQZvahIiG0xeMlAtcKoC2EOWERSsZl1/8He/3m9U6Jy3pn6
         Rq1lmL4zSx3q2H19CYkNKarSsRwNGyyx0Czh+mLEmQ8jZVCTcbsVUU9eHB4j4f/YtALl
         kDNg==
X-Forwarded-Encrypted: i=1; AJvYcCX61kIzrysxaANWhbJX0ILnMSNbtWzMFR82aNEVw9G9c/GkbfN3aVIdYXLgZiWNq5lF7l8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0bYh2iN8I+6NRspy87pEu3JYKOAuK/yV4rIZHrb7HVEjVUtlu
	CnND621qlNu5Eqv1VjZAoOuLVogT71a1KJ/uavFO0HIvuFueYLEWZO9903mMUtEHpVZCLJFSJKt
	MhfkyxnedSWEKQbc+eqv/fMgWU+uZK+uhSC3Y8FV9/A==
X-Gm-Gg: AZuq6aJWqKggK2xcyEpBYyvgcAJeAoQM/VbUDvX+QmnfNG98T3F4/QEWZDr1HjL+2ih
	/q+D4NYSeIp+VRbLlkGac5Pe9L3FDm/b8bK4uLQfknyQwDXaPxHU9PEte5JFMG7NBT8PHLk5g5t
	HxQGwia6NGE6Vdod1Fh25+oCQkqJdighPv6vTYg1kA6QfNzah456XJQAMkmfGaaXYLsNWM+xnmv
	Adwrv4THXrSwLP3Ilv6IxKpDZUe/nRKXP5URMxv36tRn9Rq+ecyCoOa3X8h6YBfRQ3I3pGE
X-Received: by 2002:a05:6512:92:b0:59e:417:27fa with SMTP id
 2adb3069b0e04-59e041728cfmr750014e87.48.1769524086693; Tue, 27 Jan 2026
 06:28:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260123-imx8mm_gpu_power_domain-v3-1-3752618050c9@nxp.com>
In-Reply-To: <20260123-imx8mm_gpu_power_domain-v3-1-3752618050c9@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 Jan 2026 15:27:30 +0100
X-Gm-Features: AZwV_Qjot6TJIfN7wNGu1pyiZ5mH2AbueFO2BcAtWkdlZPb-DGIO_mxVmpUYEnk
Message-ID: <CAPDyKFr9pLaZRBXypf-9cZWahJOMcBc6QB-udY46GEvb0tFyNg@mail.gmail.com>
Subject: Re: [PATCH v3] pmdomain: imx: gpcv2: Fix the imx8mm gpu hang due to
 wrong adb400 reset
To: Jacky Bai <ping.bai@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Lucas Stach <l.stach@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 23 Jan 2026 at 03:51, Jacky Bai <ping.bai@nxp.com> wrote:
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
> Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
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
