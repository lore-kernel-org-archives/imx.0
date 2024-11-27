Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FECA1FBEA3
	for <imx@lists.linux.dev>; Wed, 27 Nov 2024 13:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732713262; cv=none; b=ndDvlkUqjyRbtXpehFIziUwajbGle8DEQ2NtvicBxE5vzeHpEN354eAA6ua+sAUpg/4/BwBZE2PCD8ShVhwgcVPfNenP3g3XYA2fr/JVeC2peMhGhAurEBEF9/5d/HpE73UB4Ow4st1KD7eZUxkzFtgM3jt8x09q/uetN/+yfL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732713262; c=relaxed/simple;
	bh=/+8i36jXa2Ejuwzr9kyN4gfGmnCNBj1LofG1MlJFOTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3VH28Z1+xvbebS3up35fdwq6fugZ9xBBw//rRLyrlUj6UMVDobT6YrLazMh4zRZkMTNQtVn7VPXJkZG6t1+/UfA+Gu7o55pPT4YOW2hHNlOPAJBE8HJ0eyCiEIQyxeilBnrqj0ERKKJ36jUclouPWqVy1YzEcb7+338f5gL+FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5f1d2448741so1770909eaf.0
        for <imx@lists.linux.dev>; Wed, 27 Nov 2024 05:14:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732713258; x=1733318058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5N5TeqIz8Hih/q2oo/F5dFMUP3Erj9K850b0DJCwPQ=;
        b=Cmake56ygrcq3H4AtUERgIR2LAIv9MQwleB8tRtxwki5qSd1pmgjs9EpNGKXDswr3g
         8rg68K8099tJpnSJBDUcUgQkvdAEHe8QS7dhXRtyhDvbGoxSJL3WU84KIl17xuawrCYN
         ZmEfQx3imdXp59XYrJstaMVxAghuZaIlu2pJO+Y3KTCUdXvoTkQtZY5xx6iCHaCUVtN4
         LNUAyEomlkeFcHUxooaadCpxRnA452whhZz/aCHUG6U1XjXlg5bAA3a+PTfp4Fbnf5fO
         /7RNJbSzRRLTzBNaKUVFtai6V7EyC8JfVsa356p5jSGi6X5YtP6SH+e9ktAB+oCueTb3
         kbeA==
X-Forwarded-Encrypted: i=1; AJvYcCVUjWtBBlvYy6pEC9LR1II21+XWK7p4sI8EMB/8a4zubOBN/LChvH86Bayom8sQg7shTlg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyP20XYPBGX2HHjg25ffLfk2KaVv66XG2IF2D0SQox8f1tWSsUV
	gmvJ3pj56CTAp5HUjBaHfthMxax00ZiUjFnUpKYmfOysDKILY+1PrFiGZbY/pSg=
X-Gm-Gg: ASbGncvN/w5tC7+kP+b85yabE+ck/tL89VV2HVIpV7BVORWyqKx1varUOn+UU7GKbEA
	jNaIiVd31Xu75E0Yd9S146bGuLeU704qTAojSSbx5yVqHFyXzVaf/7UFTKzlg/bcKCTZTmHpNFJ
	hDO1wgTlFS35Y+eBllI49X9GLpi0XVu+W63fYP90XgMxFlAgdCoTTbyfhddOKmMguI70HNgCZPP
	i31yKoN55GtuUe8AlKKHOtQcegOcJey/rIxLvAzkwTZZ1dk+dkchYaO9MzqQrshrhHBLEZVrGws
	0zBXKkEA3IRs
X-Google-Smtp-Source: AGHT+IGVsbvoVRmo6yn14CvrKMupAOkH7TfS6nblXJls7CwuQQkbD/i4aD4KhfMOUoVXesbn04/luA==
X-Received: by 2002:a4a:ee0f:0:b0:5eb:d1ac:21e5 with SMTP id 006d021491bc7-5f209fc7947mr2588281eaf.0.1732713258279;
        Wed, 27 Nov 2024 05:14:18 -0800 (PST)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com. [209.85.210.50])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f1ebbffbefsm1843517eaf.16.2024.11.27.05.14.17
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 05:14:17 -0800 (PST)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-71d4ba17cd2so1706224a34.3
        for <imx@lists.linux.dev>; Wed, 27 Nov 2024 05:14:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMg6T4e1XMZDOcPtF97fRegoJyIwjc1tUJSDsicYdNGJG54VaS0/G1BdXaRGrib9O3r1k=@lists.linux.dev
X-Received: by 2002:a05:6358:7e95:b0:1ca:a1d1:65d2 with SMTP id
 e5c5f4694b2df-1cab15dbb24mr152078355d.15.1732713256919; Wed, 27 Nov 2024
 05:14:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org> <20240823-cleanup-h-guard-pm-domain-v1-9-8320722eaf39@linaro.org>
In-Reply-To: <20240823-cleanup-h-guard-pm-domain-v1-9-8320722eaf39@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Nov 2024 14:14:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWXUyLbypvgTrtx0mY5vF6abW8bab2poso=xn88gNqEmA@mail.gmail.com>
Message-ID: <CAMuHMdWXUyLbypvgTrtx0mY5vF6abW8bab2poso=xn88gNqEmA@mail.gmail.com>
Subject: Re: [PATCH 09/10] pmdomain: renesas: rcar-gen4-sysc: Use scoped
 device node handling to simplify error paths
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

Revisiting an old patch (the same applies to 10/10)...

> --- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
> +++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
> @@ -6,6 +6,7 @@
>   */
>
>  #include <linux/bits.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk/renesas.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
> @@ -303,12 +304,12 @@ static int __init rcar_gen4_sysc_pd_init(void)
>         const struct rcar_gen4_sysc_info *info;
>         const struct of_device_id *match;
>         struct rcar_gen4_pm_domains *domains;
> -       struct device_node *np;
>         void __iomem *base;
>         unsigned int i;
>         int error;
>
> -       np =3D of_find_matching_node_and_match(NULL, rcar_gen4_sysc_match=
es, &match);
> +       struct device_node *np __free(device_node) =3D
> +               of_find_matching_node_and_match(NULL, rcar_gen4_sysc_matc=
hes, &match);
>         if (!np)
>                 return -ENODEV;

[...]

> @@ -369,14 +365,12 @@ static int __init rcar_gen4_sysc_pd_init(void)
>                 if (error) {
>                         pr_warn("Failed to add PM subdomain %s to parent =
%u\n",
>                                 area->name, area->parent);
> -                       goto out_put;
> +                       return error;
>                 }
>         }
>
>         error =3D of_genpd_add_provider_onecell(np, &domains->onecell_dat=
a);

np is passed to of_genpd_add_provider_onecell(), which stores a copy
for later use, so I think it must not be released in case of success?
I.e. both the old and the new code are wrong?

>
> -out_put:
> -       of_node_put(np);
>         return error;
>  }
>  early_initcall(rcar_gen4_sysc_pd_init);

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
