Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439E01F91C8
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 19:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755718280; cv=none; b=PT5bviGdZdS7373Qd5ebgXc+9MBWsP2ZjC7cyPFEjLy0yYzfl6JtbFjawEbPjqirBK9+CLdKRdeK4ZUnYOsdiFb4/5evdELl3zTFj7/SGQ1arrzF97+LvGqgOJL89xP5u5jKFD1x3P8OP5saaUNCTciEDp3xxMYlFecEMhzcvsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755718280; c=relaxed/simple;
	bh=JdMnN/QvHNdC14uZpSWSeOLbLF7avgHXV6bfeFE314E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d8AFtRJh0WCv9geguixlNJMeQE51X8LXqMywsTFDUvFqM7GjARCusGp0d7E1IiQzP7wlM0FTnwxgyDsxvYB+6X3IIzaVLaIq4wq9iOjUB5cm+gkQVRijugdT3cu/DpBzyhASixnm+At6gowx1s/6NwILUnykOlsCOBjjsAgosc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGhHMttE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGhHMttE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFBC5C4AF09
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 19:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755718279;
	bh=JdMnN/QvHNdC14uZpSWSeOLbLF7avgHXV6bfeFE314E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RGhHMttEkXppx0xIcllcHsXLmLQQzOdjxYuV/xm82W+tSpLj5siXsGatCtlz88msg
	 2kBwqKy5UBeiVfHuLZmptxFi73Zpxv/U9awFSIry45ieagzEsDibzMG1wAP3gxnkhW
	 raADuSVol+35H9SGVkQgHnkq5ZvoxRqgzaJ5nqp8/IExM7a4xIdtlcK3QcBxNxqBtm
	 KK/V1xpMYSVAS7R01YfN+CYcrvBHMjdmhrWPW+JZTdHhCYbshF/pY90CjAsTW4ka3t
	 Rd/tFqZozHdiLnaXYd+is6lZXoeiYPHaynU5+quh2DQJRYYBKUUeAlmyR3mDi8VG5s
	 b2OoQldEU+zEA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb61f6044so48951166b.0
        for <imx@lists.linux.dev>; Wed, 20 Aug 2025 12:31:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEWqFi59FLBgJfDQ4NnPZxSs8bGdvsceAugZ0rsLQywf4dEQAH51cDb0bUJ9Ms3OZwrCo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDvEdUDqeBzoP2ajZDjQovWNc5wEpFu3+NPqdg2fM0mI610NC2
	aPhJ/R6D647N9RTHUcx+EUgexAuDQ/BGU72sibY7Fyo0MNQ1lUegWStNz4L0e3NjiOkAOBzRGTY
	Z2lVmdHek2xrBfvoHsv3gr7QxCw7wcw==
X-Google-Smtp-Source: AGHT+IHMduLqupXwUu5+wGeCnTMcG3KEnZjSMqXY8A1R3KzTvJxS2yEXoVkoMeeJWEbKS/NfptZmMJOd2EyU0/q6v2E=
X-Received: by 2002:a17:907:6e8b:b0:afc:aac3:6d2 with SMTP id
 a640c23a62f3a-afe02b475a2mr72725966b.2.1755718278469; Wed, 20 Aug 2025
 12:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819213831.1368296-1-robh@kernel.org> <CAEnQRZDga2cX=YPY5Z9NDyro94bxFjK9k5Xm5Vt2vVzf4ysKyA@mail.gmail.com>
In-Reply-To: <CAEnQRZDga2cX=YPY5Z9NDyro94bxFjK9k5Xm5Vt2vVzf4ysKyA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 20 Aug 2025 14:31:07 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ1btLjZO_Z7H+qYZhWwTn0Wpq4Ji=deKdUxTwLHw-pTA@mail.gmail.com>
X-Gm-Features: Ac12FXyzu14Kh1oSkN3MJaRVyez-SIK2NK1snFRbS1U4LOUdSfMmoXWd92DoGYw
Message-ID: <CAL_JsqJ1btLjZO_Z7H+qYZhWwTn0Wpq4Ji=deKdUxTwLHw-pTA@mail.gmail.com>
Subject: Re: [PATCH v5] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
	Aisheng Dong <aisheng.dong@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 3:19=E2=80=AFAM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> Hi Rob,
>
> This patch will break IMX RPROC support.
> <snip>
>
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
>
> <snip>
> >  static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmwa=
re *fw)
> <snip>
>
> > -               priv->mem[b].cpu_addr =3D devm_ioremap_wc(&pdev->dev, r=
es.start, resource_size(&res));
> > +               priv->mem[b].cpu_addr =3D devm_ioremap_resource_wc(&pde=
v->dev, &res);
>
> devm_ioremap_resource_wc works only for IORESOURCE_MEM resources:
>
> lib/devres.c:124
> static void __iomem *
> __devm_ioremap_resource(struct device *dev, const struct resource *res,
>
> =C2=BB       if (!res || resource_type(res) !=3D IORESOURCE_MEM) {
> =C2=BB       =C2=BB       ret =3D dev_err_probe(dev, -EINVAL, "invalid re=
source
> %pR\n", res);
> =C2=BB       =C2=BB       return IOMEM_ERR_PTR(ret);
> =C2=BB       }
>
> while the devm_ioremap_wc doesn't care about this.
>
> So we cannot use devm_ioremap_resource_wc here unless you add
> IORESOURCE_MEM flags
> to  of_reserved_mem_region_to_resource as discussed here:
>
> https://lkml.org/lkml/2025/4/28/759
>
> The same issue we are already experiencing with Sound Open Firmware
> where the change was already merged
> and we have a bug already reported.
>
> How should we fix this:
>
> 1) Add  res->flags =3D IORESOURCE_MEM; in  of_reserved_mem_region_to_reso=
urce

Sigh. I thought I rolled that change into it. I just sent a fix[1].

Rob

[1] https://lore.kernel.org/all/20250820192805.565568-1-robh@kernel.org/
