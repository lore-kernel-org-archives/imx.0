Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF7B20B20B
	for <imx@lists.linux.dev>; Thu, 13 Feb 2025 08:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739434434; cv=none; b=pQDMIkLOtzicsEWLHRrNKikphK9+oRjQoZ3Aooj33K/PdIzu2RXXz0tDyziSJ1ByOsmEiIVFb8emRmYYQ4R3Agoh8VwCedI8bUOHMv7c4pBgUTzaze3E/JF9LxMzbXMIWJTak2O9uyn70DIxHsK3CAcKNgobvTpdMTGr/3MzTUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739434434; c=relaxed/simple;
	bh=5vZT6XRac5Sw20P5sZfV62hmlC+ZCKjlScO/x0rmuYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YELU/cSG3fFldAWZ6+eeHxRXMAatIH7xuBqylB40HC3tVTTCoJ0c3FXGycRWYBDbf227v9PKXOd5K+yYouHD9fm8g5qwzNZWUsm9RwaL/Royqv6U4M90czMegNPo7ZOsGHCaGNlxapjYGFSC1aJwRQEZTxurgtdtm2Es4XuImn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jPr414WV; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jPr414WV"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5439e331cceso648086e87.1
        for <imx@lists.linux.dev>; Thu, 13 Feb 2025 00:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739434430; x=1740039230; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmuftgvnuZZgHkOz1gVQFljvkOd+vXnZycbJ9gQVvqU=;
        b=jPr414WV5ehp6e8eqXXhyzjlz5vQvW8NxP9mtivjwVesOvNQRN+v12tJoqKbGv/rbq
         0hyNuru/3b5GxtaYMHjW9Px0wLNzRmINO4seSNDrP2ZSLegXrC9ILNjXiR8J1/dVvLxN
         74VKrWOFIr3vcnJxpDfxI1d0FjBqBWFWIhR3EliRLRKqsCm6kHnmxmD0abe2BwG7GYbN
         sN65nALqsi6MuWXr8u1Y0YrVQ60hmbjAIF6UM5f7lucjfckBzQFrt+qz2gz7lg7KYqtr
         eYipSxvAXkdxkgYWVkjomDAjutWuTy+RkMd/0I+3aOvj9t2ITynzZVqErd1jgyiobsEQ
         3Vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739434430; x=1740039230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmuftgvnuZZgHkOz1gVQFljvkOd+vXnZycbJ9gQVvqU=;
        b=jMxW2IzaKPwhtnq69E36kMmoiIEHuUi2eoFh52YlrDW6RwFUZameMENhbbRZxlV38H
         pxcaw6jUc7ZDh+TORzFfTtugQ+P4vUd140UtUhRIo7ba1/lLvqL/bMroIQCrpK9LjYay
         9CDBcfBmmsvvz4ibsRRD6XVUdL/R23oexyKFk/H01O20JvN6oOBY3HLEgY6ANeoeayCB
         IXnjpu1uhrHjcexsduZAjEK7jZWLyP3dXGXVQPvF09vnr1HVcVk5arIGfLcNJBGTVX6Z
         49Vk3OtN4pP9Ri67/NKiljBfVQpikZj7YVuAF/xgqOG4EeZQgaOvZZ/xr4tD6Mfmgcxu
         hNgA==
X-Forwarded-Encrypted: i=1; AJvYcCU3SDKBIDmnnu4LoaeqLAJ1YomyNC1bLdHDOyZDQFiMutFWULNBzy1mXt140GLzehgWq+g=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnukK3WQmanQRzDr9c56Gpgqd5llwNbTStmBNzQWOa3j9i4itI
	c6jwit9OjGP9ZFQb6IqUMybVEWPVCVb8KuV+ZTSNMhOIiCpFypAw+Vvh1HAh1EFPsOF3oYLFYrs
	MRud3UcCIyKFLERIsEg3G/q3PPYNgSCaiBn/r
X-Gm-Gg: ASbGncvXGUlKWlt4P2yJ3/arTohijO4m9PJx5TGhqkvAXShZ/MOiwfhyERc4rnJBiRy
	cS6J7UDmFZoNJ2Hox46Ndx6sqj4V3gm+bNiJBloYVV6mNx794THwuIhsHmAc4968fkhOkNQ0=
X-Google-Smtp-Source: AGHT+IHxDaK7ENYXtLhPy5Kf93LWj2N5S6iojG3fU8e+7THrJ3l9WM1h9CK9jmfpQxgM8xkKRYjCh9V5QtuuPWJHPGk=
X-Received: by 2002:a05:6512:ac7:b0:545:646:7519 with SMTP id
 2adb3069b0e04-54517f86d1fmr2003992e87.0.1739434430158; Thu, 13 Feb 2025
 00:13:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com> <20250120-scmi-fwdevlink-v2-3-3af2fa37dbac@nxp.com>
In-Reply-To: <20250120-scmi-fwdevlink-v2-3-3af2fa37dbac@nxp.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 13 Feb 2025 00:13:13 -0800
X-Gm-Features: AWEUYZns82i0k5Ijag1LujAqT5WjKXUA5FWo3NR6_9wBOcWaDsE90ePdb8ZFdME
Message-ID: <CAGETcx9+BzSoHj54koiGniUOUPfY9yZ9cAedbb2A-hb+2D1sGw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] pinctrl: freescale: scmi: Switch to use machine_allowlist
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 19, 2025 at 11:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> With machine_allowlist, only allowed machines have pinctrl imx scmi
> devices created. The fw_devlink will link consumer and supplier
> correctly.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinct=
rl/freescale/pinctrl-imx-scmi.c
> index 8f15c4c4dc4412dddb40505699fc3f459fdc0adc..058b4f0477039d57ddae06f38=
5ad809cbb4784d6 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
> @@ -287,11 +287,6 @@ scmi_pinctrl_imx_get_pins(struct scmi_pinctrl_imx *p=
mx, struct pinctrl_desc *des
>         return 0;
>  }
>
> -static const char * const scmi_pinctrl_imx_allowlist[] =3D {
> -       "fsl,imx95",
> -       NULL
> -};
> -
>  static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
>  {
>         struct device *dev =3D &sdev->dev;
> @@ -304,9 +299,6 @@ static int scmi_pinctrl_imx_probe(struct scmi_device =
*sdev)
>         if (!handle)
>                 return -EINVAL;
>
> -       if (!of_machine_compatible_match(scmi_pinctrl_imx_allowlist))
> -               return -ENODEV;
> -
>         pinctrl_ops =3D handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PIN=
CTRL, &ph);
>         if (IS_ERR(pinctrl_ops))
>                 return PTR_ERR(pinctrl_ops);
> @@ -339,8 +331,13 @@ static int scmi_pinctrl_imx_probe(struct scmi_device=
 *sdev)
>         return pinctrl_enable(pmx->pctldev);
>  }
>
> +static const char * const scmi_pinctrl_imx_allowlist[] =3D {
> +       "fsl,imx95",
> +       NULL
> +};
> +
>  static const struct scmi_device_id scmi_id_table[] =3D {
> -       { SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
> +       { SCMI_PROTOCOL_PINCTRL, "pinctrl-imx", NULL, scmi_pinctrl_imx_al=
lowlist },
>         { }
>  };
>  MODULE_DEVICE_TABLE(scmi, scmi_id_table);
>

Definite NACK to this. Please don't depend on indirect
conditions/flags. There's no guarantee that this check will hold true
in the future.

-Saravana
