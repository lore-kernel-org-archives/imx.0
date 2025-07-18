Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1C928B41A
	for <imx@lists.linux.dev>; Fri, 18 Jul 2025 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752836280; cv=none; b=KKLMiTUaHuV/xoEU6aghUVuNPlK/RwmAxcggDdYkuLk4BYQe6NlMUJOHY7hPhWDB0mLPhm3+Mr776BRhPyCWaxpboFjPumFONXx9m+WGZFjPHn28g41OZCPUGKpwQvhJtbPwhXTLDDygTh8YaOGfWkIrh2ontt87IHHg+tySHjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752836280; c=relaxed/simple;
	bh=n56fvNCbZYpjA+6v2NlTwoRSF0+TcObwWezUlSX3UEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rAmDIlU6aaFTkAzRiPrXND+U0lzC11vORBU6kUuFFXd3mi5fYWTF+ixyN1rjgEPa8BKdmzL4gw5m7nzqPCBUgbO/F3MHge+GDG2+WTtcZpZ3+OKL+k6Ioih1Q5lcTA9P9rur4Y0Mw9bFME2GDGsvGrYWfAhF4ut5+jngo6qsVQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nguTyx0T; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nguTyx0T"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-31ca042d3b8so1686203a91.0
        for <imx@lists.linux.dev>; Fri, 18 Jul 2025 03:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752836279; x=1753441079; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crJfUyaZFUd3zm6f6eWNF5fFGcJayPgP/WBKMvt7miw=;
        b=nguTyx0TzfGYnXa77bMlgA5E2DB8kEyjH6dISUV/NrnOu8P/DRx/d9uujJSvsMSaG1
         /KuRp+ZMVtRP5aPUheS5+KHnd7FFv7VOWljVipwBDl8UuG9aSO74nP8EujV3dfivMZBx
         7VsiLixAaV2cOWW3C1ThVvNuadXboLlJCmID4JEP+94sMk1WciIoQRsk9ZnKLWg1n2FJ
         tjDqeTnnNt1cfSWZM5/TJo7TxVqaeV4liwylAsUbkANYrqVnIYkJxz3LdY8etckpB0xo
         FwC9/7NFNpMsCoK03zkmEQJQw+0C7T4TnaRO2mrmIox+qzKpti0R67mkHpq33IQn6lXT
         0TEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752836279; x=1753441079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crJfUyaZFUd3zm6f6eWNF5fFGcJayPgP/WBKMvt7miw=;
        b=ZCOG0Trnt3runLtMe25A7TCn2dVVTrU+O55LP06PJSZbvO067v53cUjfBBRMqXLHo5
         j5Yvk+I+/H+t2CAvxBZbbGvOHJ+Ik3Q0oSWEDHv4OT/P9C12JU0SBq4SZyXsNkhBgfhs
         eDL0nibAj6RUZq396k7mFqMKdEu6saCY+Yw1MnC0Jm+36IJL6wsPN8k35oEHDO7TIz24
         42dHLIxLYKOZbMAkB/W8NrUbz9NnRTVDnW/qGEQvYyavMNrI1WEcKVFFqzoRsCcsQDQN
         /HAM74ZCx/xAz96Lr2tfZ+qZJcd2X2AmW6E66RME7KRD3MuNGWobE4HgW+ojdrhB3YoK
         4zaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZxywpaWSjiwtXUsF/kt0T1E/z5k3JLPFKY/wa2v5MbcJL5UmlHmAvIHJ9QLzfF9iq79g=@lists.linux.dev
X-Gm-Message-State: AOJu0YwU72HQAQ8dBPeaqh9bRvEOojumVwO3wZZQX6QgQwthRqbfBRhH
	kX4cOODLD1LhYAfjER6VnKO7Vgaje711uycYUUGoH9mfa3VF226PtxS6fo7ZsbCl/O0RC4cibHI
	bn+NSQvgV386SNCYX1K8bPusiRXYYD+k=
X-Gm-Gg: ASbGncvlnu8jAzZbBcThYANKh3/eYueMV/92X6+k/D/f1pgOi4FvzzudybUCwGaS8BS
	P/rMgjfSx3NqoeWPrr7eOz1yHV5cpaUSlKY02Y8bZkZQGKbib6zfZn7zIm2BN+6tqYHcgUzCIkT
	RcvHb11FDzFk/Mj9LMUbRMZ2IVCL7wYbKw1otDQbwB/uHE4nyghVDZJgnFMsm6oZ8VVe5Jv+jIP
	Yf7
X-Google-Smtp-Source: AGHT+IG3K+OJchpvRdKs3tFgBFIPgoho17ujC5cDtqCUPyeRXXDSSMCfEs84NE1rrM2vaVhaZ1ZL/UjRgJAtRS/XdRE=
X-Received: by 2002:a17:90b:57c7:b0:311:eb85:96df with SMTP id
 98e67ed59e1d1-31c9e75b966mr17155358a91.17.1752836278553; Fri, 18 Jul 2025
 03:57:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250704052529.1040602-1-shengjiu.wang@nxp.com> <20250704052529.1040602-2-shengjiu.wang@nxp.com>
In-Reply-To: <20250704052529.1040602-2-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 18 Jul 2025 14:00:03 +0300
X-Gm-Features: Ac12FXyvAM2zuSZO19tjGTn3I8j6ZBYP1ezDycsLSWPMXkx77mmnhd_OLQ_GFhA
Message-ID: <CAEnQRZDeXrhHaU-tiAizXL3cNK-6rpbACx9QGNVpV8GBEKAPYQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 8:29=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.com=
> wrote:
>
> When recovery is triggered, rproc_stop() is called first then
> rproc_start(), but there is no rproc_unprepare_device() and
> rproc_prepare_device() in the flow. As the software reset is needed
> before DSP starts, so move software reset from imx_dsp_runtime_resume()
> to .load() to make the recovery work. And make sure memory is cleared
> before loading firmware.

Hello Shengjiu,

Commit mostly looking good but the key point when writing a commit
is to explain why the commit is needed and less about what the
commit does (this should be obvious from the source code).


So, I would start with the context and that is:

Following commit: 6eed169c7fefd9cdbbccb5ba7a98470cc0c09c63
    remoteproc: imx_rproc: Enable attach recovery for i.MX8QM/QXP

enabled FW recovery, but is broken because <and here explain the reason tha=
t
you mostly described in the original commit>.

Then at the end add the Fixes tag.

Also, allow me on more day on Monday to test this patch.

Thanks,
Daniel.

>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 43 +++++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_=
dsp_rproc.c
> index 5ee622bf5352..ba764fc55686 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -774,7 +774,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>  {
>         struct imx_dsp_rproc *priv =3D rproc->priv;
>         struct device *dev =3D rproc->dev.parent;
> -       struct rproc_mem_entry *carveout;
>         int ret;
>
>         ret =3D imx_dsp_rproc_add_carveout(priv);
> @@ -785,15 +784,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc=
)
>
>         pm_runtime_get_sync(dev);
>
> -       /*
> -        * Clear buffers after pm rumtime for internal ocram is not
> -        * accessible if power and clock are not enabled.
> -        */
> -       list_for_each_entry(carveout, &rproc->carveouts, node) {
> -               if (carveout->va)
> -                       memset(carveout->va, 0, carveout->len);
> -       }
> -
>         return  0;
>  }
>
> @@ -1022,13 +1012,39 @@ static int imx_dsp_rproc_parse_fw(struct rproc *r=
proc, const struct firmware *fw
>         return 0;
>  }
>
> +static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware=
 *fw)
> +{
> +       struct imx_dsp_rproc *priv =3D rproc->priv;
> +       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
> +       struct rproc_mem_entry *carveout;
> +       int ret;
> +
> +       /* Reset DSP if needed */
> +       if (dsp_dcfg->reset)
> +               dsp_dcfg->reset(priv);
> +       /*
> +        * Clear buffers after pm rumtime for internal ocram is not
> +        * accessible if power and clock are not enabled.
> +        */
> +       list_for_each_entry(carveout, &rproc->carveouts, node) {
> +               if (carveout->va)
> +                       memset(carveout->va, 0, carveout->len);
> +       }
> +
> +       ret =3D imx_dsp_rproc_elf_load_segments(rproc, fw);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
>  static const struct rproc_ops imx_dsp_rproc_ops =3D {
>         .prepare        =3D imx_dsp_rproc_prepare,
>         .unprepare      =3D imx_dsp_rproc_unprepare,
>         .start          =3D imx_dsp_rproc_start,
>         .stop           =3D imx_dsp_rproc_stop,
>         .kick           =3D imx_dsp_rproc_kick,
> -       .load           =3D imx_dsp_rproc_elf_load_segments,
> +       .load           =3D imx_dsp_rproc_load,
>         .parse_fw       =3D imx_dsp_rproc_parse_fw,
>         .handle_rsc     =3D imx_dsp_rproc_handle_rsc,
>         .find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
> @@ -1214,7 +1230,6 @@ static int imx_dsp_runtime_resume(struct device *de=
v)
>  {
>         struct rproc *rproc =3D dev_get_drvdata(dev);
>         struct imx_dsp_rproc *priv =3D rproc->priv;
> -       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
>         int ret;
>
>         /*
> @@ -1235,10 +1250,6 @@ static int imx_dsp_runtime_resume(struct device *d=
ev)
>                 return ret;
>         }
>
> -       /* Reset DSP if needed */
> -       if (dsp_dcfg->reset)
> -               dsp_dcfg->reset(priv);
> -
>         return 0;
>  }
>
> --
> 2.34.1
>
>
