Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B7D19DF41
	for <imx@lists.linux.dev>; Tue, 27 Aug 2024 10:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724756159; cv=none; b=t8sW6SYmHSV78IIzE/kjoIb4lGHfX9oF7PKwz5l6h2JrK/4ag8M6mtdkx5XpeuXLnvCS/xlpER/e1VBR6BR0mRYsPa28MkCd7k2ETkM8bUwN71GPoHMu3dIDfeSzzdL84ILyRZC9W7m3+/s2SLyW9f6wHoOvRT1ZN2OxAmgf9bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724756159; c=relaxed/simple;
	bh=4oBV8H5bs6V7KC17pgVHrSStgbbQbPBeJsp1/aceqNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tU0vmRkcg4GVVAenpNz7tbdguzQ1CmUdzBNpkGYcqNCD7wdUeIhIm4DyLEyjI+WDM+BBSM0gtL3m5eDUJMwixwGyhjFFE6YmsScJouUu2bTPwDMSEBEhIS1FNrBdhHGD5um2hLMfrkq961jEwa5Qi9Ta3nzMLxkVRRJsZ8r8q74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e11693fbebaso5615269276.3
        for <imx@lists.linux.dev>; Tue, 27 Aug 2024 03:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724756155; x=1725360955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qo2NMwoxAQ1U2hSpFIW4sKP1B7w0umymouG5LJGc8hU=;
        b=f6EV9b+0eiyppK99BllhQJtA3Olb5P641dtN5BQ7HgqRjHAu/dymTwPJioes2YMILq
         tUQZ1bseslaGm8x3DWwmx75wWnp8T5R/pTtBL3AkThwRi6XT3m+8UxrMVHJBVysf2X3b
         y0eZbY+nJNLcp9zhHftk2kD0MoZRVtSa4ojQhSLYhrXHbu0br8PvCmixVjeVnvLfXt1M
         4BRj8IB2DzpmDYr+VI2q/y14Dw/u4a+7Vka/RSkvL9squFmhs0M4G+rdEepRSfwufr1q
         9mRA1L1XYB6NYTC/PWQfVI7EPdfJF652Y01xMxUOrM0kYbp1PZhUeXcIaeQpdeQ3FhVK
         7+EQ==
X-Forwarded-Encrypted: i=1; AJvYcCX14BNVX1mYKCw9veKisIRzyQ9OvBZkLyd0+VDTo7Jsuhh9cUh8mQYNg+KXGGk+l2ulTNU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4iGJ3D5JLy/h9izIbpcVzPYVzQJlK1qDdIS/WIyQK23ujEdwm
	JbCtRJPLzxVdyRJhZBUBVUcPM+p2qc38K3llbyHfCUUcHMhjJpkvTnMMxsxu
X-Google-Smtp-Source: AGHT+IHjoN4Ae2lzrSF9DuIQU6KCozwJhP5ku+0ELOHtWf5LJuj6171Ijy4hPKmKpkaH6esw8v/GpQ==
X-Received: by 2002:a05:6902:70a:b0:e0b:eb96:fd90 with SMTP id 3f1490d57ef6-e1a2a98fffdmr2108988276.45.1724756155018;
        Tue, 27 Aug 2024 03:55:55 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e4637bfsm2474961276.23.2024.08.27.03.55.54
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 03:55:54 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6b8d96aa4c3so45160957b3.1
        for <imx@lists.linux.dev>; Tue, 27 Aug 2024 03:55:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMHL7IqhumB7g/L80CtVVC09a6Gp8SQYwrYcmUBgwq9e1BCharfreAaViJU33KfLDe1zc=@lists.linux.dev
X-Received: by 2002:a05:690c:9e:b0:6b2:28c3:b706 with SMTP id
 00721157ae682-6cfbb6fe00dmr29288707b3.34.1724756154320; Tue, 27 Aug 2024
 03:55:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org>
 <20240823-cleanup-h-guard-pm-domain-v1-9-8320722eaf39@linaro.org>
 <CAMuHMdV0R0+u1eCiUOHhL5w-wzge9KhgyumJSd28oF9kQmnx_Q@mail.gmail.com>
 <a48f1a0b-0e20-4782-bf6b-c430da9ae391@linaro.org> <58f5d332-2f2a-4607-9662-e71fd23b1316@linaro.org>
In-Reply-To: <58f5d332-2f2a-4607-9662-e71fd23b1316@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Aug 2024 12:55:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQ5AD1QoO5F1nAy+GJoGtbi2ztKfK=2buU1MNeO8etJw@mail.gmail.com>
Message-ID: <CAMuHMdUQ5AD1QoO5F1nAy+GJoGtbi2ztKfK=2buU1MNeO8etJw@mail.gmail.com>
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

On Tue, Aug 27, 2024 at 11:39=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 27/08/2024 11:33, Krzysztof Kozlowski wrote:
> > On 27/08/2024 09:48, Geert Uytterhoeven wrote:
> >> On Fri, Aug 23, 2024 at 2:51=E2=80=AFPM Krzysztof Kozlowski
> >> <krzysztof.kozlowski@linaro.org> wrote:
> >>> Obtain the device node reference with scoped/cleanup.h to reduce erro=
r
> >>> handling and make the code a bit simpler.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> Thanks for your patch!
> >>
> >>> --- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
> >>> +++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
> >>> @@ -303,12 +304,12 @@ static int __init rcar_gen4_sysc_pd_init(void)
> >>>         const struct rcar_gen4_sysc_info *info;
> >>>         const struct of_device_id *match;
> >>>         struct rcar_gen4_pm_domains *domains;
> >>> -       struct device_node *np;
> >>>         void __iomem *base;
> >>>         unsigned int i;
> >>>         int error;
> >>>
> >>> -       np =3D of_find_matching_node_and_match(NULL, rcar_gen4_sysc_m=
atches, &match);
> >>> +       struct device_node *np __free(device_node) =3D
> >>> +               of_find_matching_node_and_match(NULL, rcar_gen4_sysc_=
matches, &match);
> >>
> >> This breaks the declarations/blank-line/code structure, so please move
> >> this up.
> >
> > What do you mean "declaration structure"? That's the way how variables

First a block with declarations, then a blank line, followed by the actual =
code
(yeah, the pre-C99 style ;-)

> > with constructors are expected to be declared - within the code.

When it matters.

> Continuing thoughts, so you prefer:
>
>         struct rcar_gen4_pm_domains *domains;
>         void __iomem *base;
>         struct device_node *np __free(device_node) =3D
>                 of_find_matching_node_and_match(NULL, rcar_gen4_sysc_matc=
hes, &match);
>
> (assuming I will put it at the end of declarations).
>
> Are you sure this is more readable? It's really long line so it
> obfuscates a bit the declarations. The point of the scoped assignment is =
that
> you declare it at point of need/first use.

You're missing reverse Christmas tree order...

> >> If you insist on keeping assignment to and validation of np together,
> >> the line should be split in declaration and assignment.
> >
> > No, that would be inconsistent with cleanup/constructor coding style.
> > Maybe this is something new, so let me bring previous discussions:

[...]

> > and finally it will reach documentation (although it focuses on

Oh, "finally" as in not yet upstream ;-)

> > unwinding process to be specific - "When the unwind order ..."):
> > https://lore.kernel.org/all/171175585714.2192972.12661675876300167762.s=
tgit@dwillia2-xfh.jf.intel.com/

"When the unwind order matters..."

So it's perfectly fine to have:

    static int __init rcar_gen4_sysc_pd_init(void)
    {
            struct device_node *np __free(device_node) =3D NULL;
            struct rcar_gen4_pm_domains *domains;
            const struct rcar_gen4_sysc_info *info;
            const struct of_device_id *match;
            void __iomem *base;
            unsigned int i;
            int error;

            np =3D of_find_matching_node_and_match(NULL,
rcar_gen4_sysc_matches, &match);
            if (!np)
                    return -ENODEV;

            ...
    }

But my first suggestion:

    static int __init rcar_gen4_sysc_pd_init(void)
    {
            struct device_node *np __free(device_node) =3D
                    of_find_matching_node_and_match(NULL,
rcar_gen4_sysc_matches, &match);
            struct rcar_gen4_pm_domains *domains;
            const struct rcar_gen4_sysc_info *info;
            const struct of_device_id *match;
            void __iomem *base;
            unsigned int i;
            int error;

            if (!np)
                    return -ENODEV;

            ...
    }

is safer w.r.t. to future modification.

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
