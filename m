Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3743A221291;
	Thu, 22 May 2025 06:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747894095; cv=none; b=Va89aB6FvpE0m4X3lri+h/yUAiaDir5Q0Bww20OPlREE7JhdI2fGDmYaBgWnxBcy5wcXg7D7HPC3cJEXzay/nmEkKGdBftUDJ7krovlYjXIdrDUp5gJ3MjDqST97sh5DfhulY+Rig7e9pJghcqgPf7p7A/clAJFD25IpPWJKcuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747894095; c=relaxed/simple;
	bh=1E/r0oyI6fmkvpJ5TQ6+ch48sHttRVAa4ut8aFDXwPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t2RQwGhvmoN2Slq4d0PKwo7qSWIcDFhWFBktRXjomRUS3VrEHtA9K0Nb42dho/s9jHzL4AieIfuK1wbbrzjlPFV9zh82szSHEl/ZtBUOHCP9KY+LOq3h1p6w2JGPDKM0WvSR8Ou5xy/zZc6bZBEWos/SwrqWVTrHCrQVcNjinvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQlF1den; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQlF1den"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22d95f0dda4so77902705ad.2;
        Wed, 21 May 2025 23:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747894093; x=1748498893; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U36H2wWEFauYEEMSa49AZxUwXKu8FeN0HzMSY10Qhpk=;
        b=AQlF1denGQUOYIPp+aB97pBNmgz2bKrc7sGdrXRoAvii59osp3lo+nw/SihhpXvXTt
         NywM/cBuxuk7AfofF/D1dz62r9XHi4y8DAzwvsQENLUCGmjFe7QkWMonZ2kq0PqhsUKQ
         viLXdFE2waMOSrC4h5ZY78lrT3ILjh6XlSSn8/mYG98uOECO8TwYfrNrWIERqCj3YH5c
         7wcNoFbCvPjmIkWoc2AAXPgJLsSc5Ylfgi/rE1Q2WfY0RGhh7z1eiwyODtL5fnDEHlbA
         kVmqdcv8IG7zswIlUKMuW0ysgX/n5hI7anxr3vmwW6fsXeGqxy0IzHUsx6BjkPQaCXAg
         Sqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747894093; x=1748498893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U36H2wWEFauYEEMSa49AZxUwXKu8FeN0HzMSY10Qhpk=;
        b=gpbiqfhS0amjN2AHzaV2iLTbuLTU9MViwQz09wSBotBU5K8c0QtEEGX3pwoLplk5p/
         9eKs0P2CPIS8QZsWzLDqk3PWO1eAdHZQnSQLHve2tHCeMhBXITZxvW58rTSqmHReFRs4
         XHQlae4P/bNSEYLYW+6KTwWymq/FhqH0jXtyalBhtz7iyXfUdKbX4NHa0+lyghOzix+n
         iFhQCI64U8Eg+wDfmv2bFOR57X5qW8FI0EBdL+1IaDVCro+P+ZwRYUhValZC1Y6WYHsl
         InGA4QH4wDWBeWKYE9qYeC/PEzILbai89QsAIpQV6ywB3WAOq/tOzZyH0lvpD4rRFaAE
         w/sg==
X-Forwarded-Encrypted: i=1; AJvYcCUId33NB3CssxwFJGgdp30vo7eGNXYOMu9cJI6+Z2z8rPsmRB0LU+es3730/BKAY5iFspJ8+mjv8A==@lists.linux.dev, AJvYcCXNGSkGI2P1kByhMc16LFyK+OZKyN+Bx4gFe8pXK8lvkhWF9s6fldKQGMGXVHLE6+Yo6Qg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxR9e1zitfLVabOjo1oerKEP6eWXrzAR1JDCxwyTNzEUnJFlbbb
	RCj/hFq2dQQWpDeF5odQTOeODpo07YjoZdbzA4grszX+oBsO19uHYm0hG89u0dQZJ9EtpT2hQx3
	yEgzPT4iQEvsKlgRetf6dZVXu7FABeps=
X-Gm-Gg: ASbGncvJamhU9KzgLOxExAvTgggcYBf4t46vKTpinc7xYXNgYUvi6KtVMcBufSCIqHw
	nTK2NN+r+SykfJktTAbcr9+YytrbY3QJazJvNjMzAliNbIyP4uhPMl36KQTYQIEUljb3aXfSuCP
	bDUbSvfX3xnWzZE6PsSHpQeAuitWFm8Q==
X-Google-Smtp-Source: AGHT+IE9W3/67pyzzG5bsjEEBnH07y8AiipEu78C3cAPr2w5kuaSHv9IVxPhv/H5TnGO4GqzACkRex6QwdqPxvVJFyU=
X-Received: by 2002:a17:902:ea08:b0:220:c067:7be0 with SMTP id
 d9443c01a7336-231d43dca32mr284472635ad.6.1747894093371; Wed, 21 May 2025
 23:08:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250425014937.3812976-1-peng.fan@oss.nxp.com>
In-Reply-To: <20250425014937.3812976-1-peng.fan@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 22 May 2025 09:09:57 +0300
X-Gm-Features: AX0GCFuVRNCfWGnfZ558VOZX_-jhCVuZC7ziACuj_BPkZuPzMGG-o1p_cqn-_zg
Message-ID: <CAEnQRZDKUHfWMXC5oe+kSpLpR5manxx63cxDOMrFEqi6a4VxPg@mail.gmail.com>
Subject: Re: [PATCH] mailbox: imx: Fix TXDB_V2 sending
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: jassisinghbrar@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	mailbox@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 4:51=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX95 features several processing domains, Cortex-M7, Cortex-A55
> secure, Cortex-A55 non-secure. Each domain could communicate with
> SCMI firmware with a dedicated MU. But the current NXP SCMI firmware
> is not a RTOS, all processing logic codes are in interrupt context.
> So if high priority Cortex-M7 is communicating with SCMI firmware and
> requires a bit more time to handle the SCMI call, Linux MU TXDB_V2
> will be timeout with high possiblity in 1000us(the current value in
> imx-mailbox.c). Per NXP SCMI firmware design, if timeout, there is
> no recover logic, so SCMI agents should never timeout and always
> wait until the check condition met.
>
> Based on the upper reason, enlarge the timeout value to 10ms which
> is less chance to timeout, and retry if timeout really happends.
>
> Fixes: 5bfe4067d350 ("mailbox: imx: support channel type tx doorbell v2")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/mailbox/imx-mailbox.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.=
c
> index 6ef8338add0d..aef8d572a27c 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -226,7 +226,7 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv=
,
>  {
>         u32 *arg =3D data;
>         u32 val;
> -       int ret;
> +       int ret, count;
>
>         switch (cp->type) {
>         case IMX_MU_TYPE_TX:
> @@ -240,11 +240,20 @@ static int imx_mu_generic_tx(struct imx_mu_priv *pr=
iv,
>         case IMX_MU_TYPE_TXDB_V2:
>                 imx_mu_write(priv, IMX_MU_xCR_GIRn(priv->dcfg->type, cp->=
idx),
>                              priv->dcfg->xCR[IMX_MU_GCR]);
> -               ret =3D readl_poll_timeout(priv->base + priv->dcfg->xCR[I=
MX_MU_GCR], val,
> -                                        !(val & IMX_MU_xCR_GIRn(priv->dc=
fg->type, cp->idx)),
> -                                        0, 1000);
> -               if (ret)
> -                       dev_warn_ratelimited(priv->dev, "channel type: %d=
 failure\n", cp->type);
> +               ret =3D -ETIMEDOUT;
> +               count =3D 0;
> +               while (ret) {
> +                       ret =3D
> +                       readl_poll_timeout(priv->base + priv->dcfg->xCR[I=
MX_MU_GCR], val,
> +                                          !(val & IMX_MU_xCR_GIRn(priv->=
dcfg->type, cp->idx)),
> +                                          0, 10000);
> +
> +                       if (ret) {
> +                               dev_warn_ratelimited(priv->dev,
> +                                                    "channel type: %d ti=
meout, %d times, retry\n",
> +                                                    cp->type, ++count);
> +                       }
> +               }

This could result in a infinite loop. I would try only a fixed number
of times then bail. Please use count to break the loop
after let say 10 tries.

>                 break;
>         default:
>                 dev_warn_ratelimited(priv->dev, "Send data on wrong chann=
el type: %d\n", cp->type);
> --
> 2.37.1
>
>
