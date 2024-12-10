Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB711AAE08
	for <imx@lists.linux.dev>; Tue, 10 Dec 2024 14:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733839361; cv=none; b=Zb2RlQUIHP5qDE75Hr0jhkne39k6ikeeepHkzvFRjj1axJAg1So4mpBDmc6XyglEjXHv9Y7dcxwDsgRLR1nyhk2zJmLxLvsXexOPVG+GXTMmxA4hiLd7yz/JE6SeZAJi2DR2NtfAaDE76c49oX2vPXVuSTcBx6z15cROxkQxqEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733839361; c=relaxed/simple;
	bh=+VAbStbA6Dtk2xH4PoQloVbS2Ysd+xnTztR7r3KJspw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qrn1afsfuRi1MMav+8uSwyEa4BRccU1y6gboaqR+8WB5gJZ83PFtFf0oRgd2AOwb2QNUDO7EOPxYV5GaOU+eYW3+BmxNkoinw6qJzuVVOf/HVVtrwNvf0+O4u7XrF1LoCW8tGKs6d6AY9nBkn/1pucSYK7qphMeIaprie+arNEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vo46Gdld; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vo46Gdld"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e39779a268bso4861923276.1
        for <imx@lists.linux.dev>; Tue, 10 Dec 2024 06:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733839357; x=1734444157; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=svYQuLfhEmqpsKGv5zmj/4CoEXZ8crstXQtR8B+VCUI=;
        b=Vo46Gdldhh1IpC7XRcCdX5RtM36FmPgVOGdob/aDqxC2G1TcvV88h9ZOR8wzP/K5pE
         dJX0Jr8vnjLuEOW0G7YnZzHw0MGJwcD7FUBYHVgfv44KYMwNunaCTDc9aR+2xwDtPG+G
         5pPTTxSzgJdLLQfLl94324Bf782acYhU8gbqYyuzhgj4ea992hOaYN3P2Lh9o+bgaBj9
         ctQhtZhwFc6yJ5wNEzpbReVpVKVCC1FT5+uDULW7iEuwK0N3kUoPIOVtPx7L2xWxlRIy
         hemBR/A/pYZXwWFu5O8OtemXlWxU1waxKR4R5UvJvqzh09CQ7RGWjcg29I4yWCKyJTrA
         th6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733839357; x=1734444157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svYQuLfhEmqpsKGv5zmj/4CoEXZ8crstXQtR8B+VCUI=;
        b=A2NSegF/NlUPP0qqHXPv0b6+FuhLLG0q08ahDe41R5zr11Gsg/wT67oWN2lOOlyjS+
         agsfPpWc3n9NEbdVfvEOv5lIYdj9y6fJMQlTOeJbjIy6Ef5F+9ZPLuZp92lZ8hJjhrEb
         +RYmo4jcwa363fC8RSsakuB1Xtd5Cs8j04KUqaRWCxQDo+iy83TLtwnuX1wxHnMpBHmO
         aWuPt6l9I5UhEvnnH7h/Uikzb6f0Q7QMdzpNRsn3RBO+gGl4ATgDrUtxBFwUtkvqAZDR
         RhUaGEdyJoVV6M0VytXEQas8/ieJfqsNWAgjQrSBnFQn5cO0vwFEdamb+mWQqJ9Eht3h
         MjGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoM3dYct7LB8ltbhpY2db8AKxHqmvl3cSSdy2myQC72QQgMp3rGgsh4Wl/DL1vY4FFHGc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGMwzJRyPf6vwQxKIAwJrMBTCe+dEiM8VHZ3FeaK4Ze/1mg61X
	QnZt4amNhhN3HbpXtwdBfjSc5t5U+fenUg4/gIddzdAUCIDi234q0Rwe2XVgHwzvT2W0WlOw+RV
	gc6/8SOKfHHEzazZM4O5IX56a4dldBGJFtYVuLw==
X-Gm-Gg: ASbGnctCzk2Z52GWL2XKaHN/sGmyZFkYflYhD3nwod7b0vFghIuzhkUJk9yjVxebv89
	TlIPljvbCDiqTAv/3kR8uDOtZdR0sXcLUkyET
X-Google-Smtp-Source: AGHT+IEzJ57H7PCrVou6RI7FrtDurF9EfDkpfB6eGI/q6LZuE371TG4kiUTgbNmxJFhn26kfli9GuUqdDrNxsUfzIjY=
X-Received: by 2002:a05:6902:1501:b0:e38:b399:590b with SMTP id
 3f1490d57ef6-e3a5da3808amr3395172276.2.1733839357084; Tue, 10 Dec 2024
 06:02:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241206112731.98244-1-peng.fan@oss.nxp.com> <20241206112731.98244-2-peng.fan@oss.nxp.com>
In-Reply-To: <20241206112731.98244-2-peng.fan@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Dec 2024 15:02:01 +0100
Message-ID: <CAPDyKFpWfqpgmMpuq+69ee2FU7wOSgHUmfEcLpS1Dy2vx8c-MA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pmdomain: gpcv2: Suppress bind attrs
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pm@vger.kernel.org, aford173@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Dec 2024 at 12:28, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> The gpcv2 drivers on imx8m series are registered as platform
> devices and this opens the possibility of reloading the driver
> at runtime.
>
> But this doesn't actually work. There are some hardware sequence
> dependecy between blk ctrl and gpc, also power domains are used
> by other peripherals, so fix this by explicitly suppressing bind
> attrs.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/gpcv2.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index e67ecf99ef84..4db4d666f5bf 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -1437,6 +1437,7 @@ static struct platform_driver imx_pgc_domain_driver = {
>         .driver = {
>                 .name = "imx-pgc",
>                 .pm = &imx_pgc_domain_pm_ops,
> +               .suppress_bind_attrs = true,
>         },
>         .probe    = imx_pgc_domain_probe,
>         .remove = imx_pgc_domain_remove,
> @@ -1549,6 +1550,7 @@ static struct platform_driver imx_gpc_driver = {
>         .driver = {
>                 .name = "imx-gpcv2",
>                 .of_match_table = imx_gpcv2_dt_ids,
> +               .suppress_bind_attrs = true,
>         },
>         .probe = imx_gpcv2_probe,
>  };
> --
> 2.37.1
>
