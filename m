Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D233EEC0;
	Thu, 22 May 2025 14:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924000; cv=none; b=hJYyccsRc83ZNcuEjDN4oJBFmu2OUpNYELwkfChBCQumrjYaYMY1eS8y/hNekC2MBggUXABccQQ7m4n0cc9n/ye9xxwGC5IPxDRcCo3jQPU/d5LErOXq0o2qZcq+MHhbeKOXLoUYuNMrDi8w0OKIJ4yQo3d3Mw2VdKuBFP+kTc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924000; c=relaxed/simple;
	bh=pFm2zIvgiBGcCdXpksFzoUZ8o0UGo7b59ZsWH8nK9Og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=adrpsEtpZj0Zqg8vCd+EvzlrPmXa8R96sFZj1uJTvm2njFWnTCMHY5LrgN9/bAu893slb5w3K1bHSsBMC1TMi4YWub0zKFNqIvFb6p1ayYqbz2qlPmPCIapE/ImcZRu7GIyS5qMVT6rF3kyCYnTPaWwFzaTKpFtHMLYr2spGG94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8I1lCpN; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8I1lCpN"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2db2f23f174so3495952fac.2;
        Thu, 22 May 2025 07:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747923998; x=1748528798; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/A33PMiQZi7B+yBG25G8T9Mv2qAG7AQkcIksX5iQLc=;
        b=C8I1lCpND1sc792khXdWfx8EYutzcnkjUu6Hd7dC+t4kgEof5kgH4pTI1NlnSfctnD
         7eyMxecS8IMAryj+sFX3gOSjhJYgi65Gu5jGu6qrFtAfPH7vYWHKiZbfmg8eKbg8/8ht
         C+8PifotTcgyjkPybQqgU2Awxx2NXYLApPt6sbQTOliPZWV4vJrAWu2bwPtNKmBOljFS
         nOh+OVJsbUzXqupjLEQuV4PZPvkGBuDP5m1nBb1IjHLfWAOTuUEg5Po7euARq7D1MORF
         ujAE753cYgCcxp8oAxlY7ecYISbrxrpYRfNgsVpLf2nBJuH6Plrcp92vy2ccGCxEZOZv
         B6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747923998; x=1748528798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/A33PMiQZi7B+yBG25G8T9Mv2qAG7AQkcIksX5iQLc=;
        b=gaS5Wft3+O+M//xf8hAUnBEQ8P3jRTPPokTpYSYNx5QZsp9r8ZLbF2AdG2bnFWtWxp
         B3z6m1mzU7PrYAioa+smcyPzU4g/m7hbw67zX68sY5vu9FXSnyl/EyNf31qPb2273vjS
         dqvF+cSQJGrrIwog+rMZaH9HLdaOt1y8U2LuCHiAKiSzTica8iTTy30glXme5HM89D+J
         jay/O38mLa9GjSx0r4UYmnxpmFCljguHIDSate31s8e/GD65s+0stpMQbt1f8dxnfarU
         qGrcy5Cbzn05g19VEfUbfkYCXHFd9nhRCrkRNksWhtz3r0R9Ic9Na54LU8uUdf65oJ/w
         uYEA==
X-Forwarded-Encrypted: i=1; AJvYcCUT0djF1ZBPiy+Xaeafg/eMoLJeOgsANjRPq/D6N5aP5P+DmZPUGnbYGWMkg6/oYeOgPQLdhsn76g==@lists.linux.dev, AJvYcCVE9UgSECFKd4bYcwXqkD2SKRLklzexqoZjuaUrPF020dhjLMLIDB7o2GyZL+wEoZ2AB3w=@lists.linux.dev
X-Gm-Message-State: AOJu0YznwRS/NFoaVAyWXndNjuORcC+FkdI+vRgX0Fz+74Or4B7DdXA6
	vOoa2qSf0/9a6TU7aE6XYA2sNrTD2mgl9P01gszxK0UvFSb2R2XdA/aPu8yrN1OSJitSxlgvyxz
	Gj/R/qlhSqondwsI6HoLzdDJaX52Pp5Q=
X-Gm-Gg: ASbGncvsKxGkj4VH7zmKNPLbYfjIaYOD1Iot3bUS/LhM1QAffzn3rjNrt681X6NSG+j
	ZJ2Unn3g6XgX1EGDOXMNmMwzOnbYPGLHd6zO4z3NkGf6CEIJx2u/ONasGl8PLugbqsOkmhEKL4t
	YNOB6wAJ5tRrTUAVsjASXl+bUV9zB90Qrrgg==
X-Google-Smtp-Source: AGHT+IFasGXYJwj7OJUMsTUB4kivLSdn/44D8WhpmTf+mhlWsPkahY4qS13v4kKGGOknI5Fo1nq5EbXL83EaOftSvd0=
X-Received: by 2002:a05:6870:9e0d:b0:2c2:5b08:8e42 with SMTP id
 586e51a60fabf-2e3c1ed9f7emr16579212fac.27.1747923998032; Thu, 22 May 2025
 07:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250425014937.3812976-1-peng.fan@oss.nxp.com>
In-Reply-To: <20250425014937.3812976-1-peng.fan@oss.nxp.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 22 May 2025 09:26:26 -0500
X-Gm-Features: AX0GCFtasETiZuNGdlMvkRCVQ4E8fN8ZJu-KkF_A9xx8QyFPXNOI67oep8lmyZo
Message-ID: <CABb+yY0dqgPhe5_p+=cyRAbSwSL+qCZXV1G+QQ2kQh7Axh_7Tw@mail.gmail.com>
Subject: Re: [PATCH] mailbox: imx: Fix TXDB_V2 sending
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, mailbox@lists.linux.dev, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 8:51=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
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

Maybe    while (ret && count < N)  ... esp when you already increase
the timeout from 1 to 10ms.

cheers.
