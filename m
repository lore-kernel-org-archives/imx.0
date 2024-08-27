Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0413D18654
	for <imx@lists.linux.dev>; Tue, 27 Aug 2024 07:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724744904; cv=none; b=GyhMH+nq5ugFO/wdKdrqOjuvRjd+PDlntss4e1GG8N/iCRtozUbRw0mFuWjZuB9fbOOMx0ZkKlXRfoncSYbpRAD/7guLvr4LlUYR5b6PSo7erqRdCpm+fPnmJ3fvZF7ObuyzG16qXx4Ry94aKOrbsitnT39Cejm1Nfoln2qETM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724744904; c=relaxed/simple;
	bh=NxA9s7sQqwLGwuxcChr5dnPp7Nj2BlckKRYtzA+FACE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVYh/EGBkvo5FOtPTKvX4va7jYiCrSbixBzbgWtd05DWEot52+QDdw14F9c9cCxroxd7rzKb4ait/v9YJDW0Ype/CrZfvnpf/YRPDYisydWNbMUa2kC6jlUIH4ZFvn0pabGb/fzZNyp0bEc1P2DfHA7Kk5wABoqlt8h1dhUatDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6c32daf0797so51797287b3.0
        for <imx@lists.linux.dev>; Tue, 27 Aug 2024 00:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724744901; x=1725349701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyFU1QyCNa7lptSAN0cFkDNgjLOOwPVrcUvkymW1zfc=;
        b=QzPrtq6YMJnPn5vyr1QhPGvqzF9QPdPNlXytlzfx1an0Bf0arFfGJ9vdaRE4g8JdFt
         p0+IETrF06Bs1JCt7FjiVNl7rDbwjH4e2nYnX2I06Hqs0cSsK5jbPvf0X39GL+Alw89k
         CD8zAcT6ZpXln4l9+4HF+74KPp4+p6FZPWuSC8UjK+CoXGIiQvPbUgm/pNrl8GGZiWbo
         lQunATIfOTwGH3cAR4WDysQSbWyNseVZihmXDOh3iJF2A7pT++UcTFxzh0t4l2nEW4U/
         251eOPz89iU7qiW/sIkEFVvr5D7q+7dhb5k4KSYOpuE53YY/Vo/JDec/kY8hWpeJcMuE
         c/qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNx1Sy0lYzcO0Dul1XT3vWk53BZRn6jPbMCuwpvK3qKHzCIDaIDpG5YEuBjxeD5CD5HFc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKTEk8RopUCxE2Jvc9lPZEBAxySe/pYm16mq+/9olBjU3mKGwh
	tARSS5/qMYxxA/5nAiTbWd/tOHKg8VkbzoEz5NKPqnjaySJt2dq4F2sfxnYF
X-Google-Smtp-Source: AGHT+IFFUIBUiwiYvbwulGNJMb/VaPJDkcQpT69CJsGoOxxIyMFH9NIGgcqOxnf7JldS6FRytYPHag==
X-Received: by 2002:a05:690c:f16:b0:61b:1f0e:10 with SMTP id 00721157ae682-6cfb94145c7mr20547657b3.4.1724744901545;
        Tue, 27 Aug 2024 00:48:21 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39a7525bdsm18429607b3.31.2024.08.27.00.48.21
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 00:48:21 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6c49c9018ebso45221757b3.3
        for <imx@lists.linux.dev>; Tue, 27 Aug 2024 00:48:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXPC0Vhi7+m/08vmOD1nXh1GfL0edT7XrhBLNyu0AeqOsh/VjdU1cjabOcy+IbsEz5jyg8=@lists.linux.dev
X-Received: by 2002:a05:690c:dc3:b0:62f:b04c:2442 with SMTP id
 00721157ae682-6cfb9415ebdmr25153437b3.7.1724744901130; Tue, 27 Aug 2024
 00:48:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org> <20240823-cleanup-h-guard-pm-domain-v1-9-8320722eaf39@linaro.org>
In-Reply-To: <20240823-cleanup-h-guard-pm-domain-v1-9-8320722eaf39@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Aug 2024 09:48:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0R0+u1eCiUOHhL5w-wzge9KhgyumJSd28oF9kQmnx_Q@mail.gmail.com>
Message-ID: <CAMuHMdV0R0+u1eCiUOHhL5w-wzge9KhgyumJSd28oF9kQmnx_Q@mail.gmail.com>
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

Thanks for your patch!

> --- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
> +++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
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

This breaks the declarations/blank-line/code structure, so please move
this up.

If you insist on keeping assignment to and validation of np together,
the line should be split in declaration and assignment.

>         if (!np)
>                 return -ENODEV;
>

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
>
> -out_put:
> -       of_node_put(np);
>         return error;

return of_genpd_add_provider_onecell(...);

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
