Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196E3433D8
	for <imx@lists.linux.dev>; Tue, 27 Aug 2024 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724745339; cv=none; b=BLXGm3GaAauo+akNtZF+yYQPLxbXtVaLqbHW15RBfAlQ1GwlOIsJd/CDzLgQNa0ReoXMnRASSIyv2QkBMrGSRKtDA9SirnEPPSut3IchCZJKHz81ksDNlVs4R6VuF1Bux0TEuZNcgJc7uhZCPds51YZayB7/9mhny4LBRhIMKTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724745339; c=relaxed/simple;
	bh=hB7ZwdMBPkDMj4TZ0j8Pz1hCtIfwUxbSGIFo0L0U7yQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oAOAsr0noVaQeAMypzrBDzgRf3mb3PsN8s4SLd+UfO1KD2LwTIRk0tG7X4KybTry9NHkmRVwVeZ7BC8ua6DzAXjODZh0OLGSXyrt8gEJE334dz3P1IC01pI5Yk3qT1oLohI/P9VskZkbCyDu6/tPQOSCMhmtFqJdXsu+98e/AZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e13e11b23faso5173333276.3
        for <imx@lists.linux.dev>; Tue, 27 Aug 2024 00:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724745336; x=1725350136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4JN30GN77x4NUy5z6yHPloDIcCANz9yHy+MUlnyZj4=;
        b=RpZaqnONJhyA5+qsG59wM4cdMiFRoFqq9wYwEztIszOqZTIMAkZSK04qd0DFql45AT
         UlP59s6ViQkkniQnaA1lfW0+UzmiOdNqGXVlIylwnZNHYfiHfZIzf5TkI7DRema8Icyj
         7NE42gDgul6KmMGMZmEAclF5LZdN2uOBTDuyTlm6BwpiIr74e3bQLMQQEtcfeTTv17UG
         NRqYsBJtlrxSL+YGA1UcUA5SfQLg7n8M4asY21HqUpj7J51jTdNRj2auGAPIPHOiPucC
         pB63GU9DJb5j1CaHQe7vmTybdhahgKB5IHCKK3a32NI1jh3FmdUkqRMAmCrdmuASHccC
         Bkhw==
X-Forwarded-Encrypted: i=1; AJvYcCUINbxocNyfmNZ/hjYhaCtMS8gLJ/auLAVRQupqUelmKDDjtcDmL1CuSWcwNEC/lHntp6s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0Ce6pCUlboVdEZroKBWSPSQfKpr2tgMYXrMOP5xHgoD7QfgH8
	mkujIL9fbHUDDs/ebMRgn+Q1Rt8A3LlE+uTsdQi6RVWdt5mZrJR4SHOtS9Ij
X-Google-Smtp-Source: AGHT+IG7beQDy07Oa4BGxB6XRIirUhgls+8tXW0zwrRhPRrJvXdR95eix8a8Eh1av4k4lQtdqjPZaQ==
X-Received: by 2002:a05:6902:a90:b0:e13:e11c:1d5 with SMTP id 3f1490d57ef6-e17a866e2d8mr13233869276.57.1724745336436;
        Tue, 27 Aug 2024 00:55:36 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39a75667asm18368827b3.54.2024.08.27.00.55.35
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 00:55:35 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6b44dd520ceso50114307b3.0
        for <imx@lists.linux.dev>; Tue, 27 Aug 2024 00:55:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUj4FMCHtIsuIL+VWsSzyC9qPGyP4dQyibGaX9xsGhMuIUvhFUc8AQ/BzqtkqmifUxijvQ=@lists.linux.dev
X-Received: by 2002:a05:690c:d8c:b0:643:aef1:fb9d with SMTP id
 00721157ae682-6c624229802mr164962817b3.4.1724745335406; Tue, 27 Aug 2024
 00:55:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org> <20240823-cleanup-h-guard-pm-domain-v1-10-8320722eaf39@linaro.org>
In-Reply-To: <20240823-cleanup-h-guard-pm-domain-v1-10-8320722eaf39@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Aug 2024 09:55:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCPJz=bNZppMExGdhCdzuTVOV-EcvnkZfBYCGnT7A7ZA@mail.gmail.com>
Message-ID: <CAMuHMdXCPJz=bNZppMExGdhCdzuTVOV-EcvnkZfBYCGnT7A7ZA@mail.gmail.com>
Subject: Re: [PATCH 10/10] pmdomain: renesas: rcar-sysc: Use scoped device
 node handling to simplify error paths
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Fri, Aug 23, 2024 at 2:51=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Obtain the device node reference with scoped/cleanup.h to reduce error
> handling and make the code a bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your patch!

> --- a/drivers/pmdomain/renesas/rcar-sysc.c
> +++ b/drivers/pmdomain/renesas/rcar-sysc.c
> @@ -348,12 +349,12 @@ static int __init rcar_sysc_pd_init(void)
>         const struct rcar_sysc_info *info;
>         const struct of_device_id *match;
>         struct rcar_pm_domains *domains;
> -       struct device_node *np;
>         void __iomem *base;
>         unsigned int i;
>         int error;
>
> -       np =3D of_find_matching_node_and_match(NULL, rcar_sysc_matches, &=
match);
> +       struct device_node *np __free(device_node) =3D
> +               of_find_matching_node_and_match(NULL, rcar_sysc_matches, =
&match);

Same comment as on [PATCH 9/10].

>         if (!np)
>                 return -ENODEV;
>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
