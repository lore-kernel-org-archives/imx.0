Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0850920DD72
	for <imx@lists.linux.dev>; Thu, 13 Feb 2025 10:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739441180; cv=none; b=ZZeLkj3sEIfdf6/G3RtYcv1Kyp8pLvjjjnmL0OgZP90IxOpVbwTYIFjOsFiqgLsnW5knmb994uqoOGBX3iAvZnn//QDOHDATsl35S8RP2f4W47z1xVX7E0YrglFQWRiwTmpArAC+A+WtPGv3TmuqJORHqVftUjq7ID8tY7iwUig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739441180; c=relaxed/simple;
	bh=T1BdMlO7VJaJKDxI8etm5Q6HJrt/8gfc9adcoeDYceo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KGwKsvqjYI/vxQLjXzwTaiAP+HZsRYUY1vdPKhqVPf722rWdhWIdFiWC4k4Ws87CT4qkk1+p3isS9llqYj83XFoGsm0p/4XzCdlLdYP/QPO1eueSfuHRyqdiMVKRF3gPPjx704Wvaunja4VIX4SKV21vvd2cIvrZGDIJAoo1EI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-868e986092cso125612241.0
        for <imx@lists.linux.dev>; Thu, 13 Feb 2025 02:06:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739441176; x=1740045976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ET9GwN+uLjDsvjU0KoNteKFJwQHfNy0LS4Dkz43P3s=;
        b=BgKafN/ZbVw0g3c9Yz1XOZLGnETR1cAMSdfPx1Lz/DtBYIboouA01ZHe24tzzud8c/
         Mb6Q997YQzzYX8282qXAaKNDmQhXHxnKS2LL5cO8CKlVR+GqhOpwdpzYXLcOxjVTSIfY
         ZfoltOhqymFYjf1xxqOeVbdMbS6bWfPCY20s+i8cwdx4IqcYS+ir3eBokLHJ25eH9I0S
         ufTU4jGXQ9ZPg+TWyAVQi25dIFWVaOimw2ovwHvGwR87qtfhB6bo8iINMCH/HcL7JPmW
         ZRRWJYV2WOizMU8bqRHvZ347JF6VIzhsYr8j2fg8ZId86w8pDnQWy90mT5Po41Zl5nVF
         OG9g==
X-Forwarded-Encrypted: i=1; AJvYcCWlSqsTxLgQ98B16/bEW7qQ8L2jwBTE1ecviYfptO6Qc1N/yRhbNRXfcYgPzWP/iHbDpwk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxxU01VR4VQwclMnV5w83Do1ISLXKkqoCghnU0ckbRywNoKTN6
	FoDtqOY6wQNLj+Na30MbA61Mc9wwe6dVwg/oDH75HtjNmJNwwYCkB11a460PsI0=
X-Gm-Gg: ASbGncvOwDh91ndMTigYGZtW7/dJ9ca5pJGlT/Oen2Ud78Ck8TvcJ/5vpydg5fyKcSg
	jl3FGEaqirCG4UYiHWFBMs2fTgiVpgwhvExn5gKUTXIO1//+FsIFEkyz1SYwKKwCzBPg2ZPUjWw
	1wwlUHjB7eoyl2Yo/t7UCquxDFEt+/k8FAgs43x4ittzwugpU/zATI5a+thavO1isKMKM1nW0gs
	5E3+OsBPDGcGgZcHwmWMNdDSd6Z/BDnUJl7pcgzBoPf2x325Fe5So8pmjpBYVbQZVJtgwE6ScEI
	u29PvWlUFrbHWunX7/qcmnqchvw4cDD2dgBtClGi3rFmUQ9EPmr94g==
X-Google-Smtp-Source: AGHT+IFkTxW/7/mOwWdMfQUZLBSGTqes92J5e48rFMo+Rmw+3RyuUr4JfEqICM1yv5vRAcaia+VLqg==
X-Received: by 2002:a05:6102:3f94:b0:4b6:18b3:a4db with SMTP id ada2fe7eead31-4bbf21c8337mr7301522137.8.1739441175751;
        Thu, 13 Feb 2025 02:06:15 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bc0796192csm128617137.20.2025.02.13.02.06.14
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 02:06:14 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4bbf29bad0cso184065137.1
        for <imx@lists.linux.dev>; Thu, 13 Feb 2025 02:06:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVD5V29gSB0e9AOTGFaijPcyw3eBbqe7gQl9eXnyy/s1wySd7fAmdRJ8FA+AlH0Q/7ENRA=@lists.linux.dev
X-Received: by 2002:a05:6102:3f94:b0:4b6:18b3:a4db with SMTP id
 ada2fe7eead31-4bbf21c8337mr7301506137.8.1739441174414; Thu, 13 Feb 2025
 02:06:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com> <20250205-clk-ssc-v2-1-fa73083caa92@nxp.com>
In-Reply-To: <20250205-clk-ssc-v2-1-fa73083caa92@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Feb 2025 11:06:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWn+sKiC1B4MF1vHwS2ArFYQXGzpYi2EcsyERPSCc9bvQ@mail.gmail.com>
X-Gm-Features: AWEUYZlvlExVgKAlPqcQ55dSJRN4GqYY50RVEAwpoHERFHUH_dWoi8JrSM7k46E
Message-ID: <CAMuHMdWn+sKiC1B4MF1vHwS2ArFYQXGzpYi2EcsyERPSCc9bvQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] clk: Introduce clk_hw_set_spread_spectrum
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Abel Vesa <abelvesa@kernel.org>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Hi Peng,

On Wed, 5 Feb 2025 at 10:51, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Add clk_hw_set_spread_spectrum to configure a clock to enable spread
> spectrum feature. set_spread_spectrum ops is added for clk drivers to
> have their own hardware specific implementation.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Thanks for your patch!

> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -84,6 +84,28 @@ struct clk_duty {
>         unsigned int den;
>  };
>
> +/* Aligned with dtschema/schemas/clock/clock.yaml */
> +enum clk_ssc_method {
> +       CLK_SSC_CENTER_SPREAD,
> +       CLK_SSC_UP_SPREAD,
> +       CLK_SSC_DOWN_SPREAD,
> +};
> +
> +/**
> + * struct clk_spread_spectrum - Structure encoding spread spectrum of a clock
> + *
> + * @modfreq:           Modulation frequency
> + * @spreadpercent:     Modulation percent

E.g. Renesas R-Car V4M also supports 0.5%, 1.5%, and 2.5%.

> + * @method:            Modulation method
> + * @enable:            Modulation enable or disable
> + */
> +struct clk_spread_spectrum {
> +       unsigned int modfreq;
> +       unsigned int spreaddepth;
> +       enum clk_ssc_method method;
> +       bool enable;

Do you envision a use case for having a separate enable flag?
The alternative would be to add an extra enum value above:

    CLK_SSC_NO_SPREAD = 0,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
