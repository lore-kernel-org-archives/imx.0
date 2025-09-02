Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EA6322DD4
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819855; cv=none; b=sk9xBaL4SS1iUJC42+sgNqiPiBitsN41rirQwhijaENkmRP8W9mMexM30CKuOuIkqME9hNMqL6T3Yt8isrmdHmBJZOPrHjvFkyCYx+H8z9/Pfy2aYBvwVQNscgoW0Ia2nssjPcTBf/i+ff3yzh4C0MaHx7hecciCXt42UGruN/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819855; c=relaxed/simple;
	bh=OnwD5QXlkWRXkwweSWm2YbRhyhJnp/UrnZINov1baPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lw/bjlKYX5W+1Ez1KWjovi6vYbT1A68uEvM1vBOOEe8Z/aKO5wh46t9651yDQk6aVLQAzMJ0YVNSqkmL5kNcehwqbow1XiJGWZrTb/DMdUIglEGw/gEboR8C6xjbf6gLoAS07aLuebhaMJuoJ1DbvYJWBGpffJMvxjoEGi888W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IVqKRItj; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IVqKRItj"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so3014077e87.2
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 06:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756819851; x=1757424651; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZhR5vC+b5jGByrsGl+I17mSTr+5gAmJbDumtIuc2ZA=;
        b=IVqKRItjpWxnrLrirnHvzD7xF1HZqEezJ366Nb9MQ0qDGlSYiFiK91GubFY6nfCgNc
         GJEPrSFe6ZwsBPJgQfqLgkV/zlfr/qIE9OEu8LgBfo5Au+P5YCEdOaK1ePlD3bbywP12
         1DbVN5ySUyZIXX18zIB4KaO/T4Oy4t/icVMhQ5Ec4FE8lc02zpU8Kl0nDU8Fx4qJDVGZ
         ZyWuurGY69t0nch3TJstitDw9xzAn9lKUlbFPW61GZU/bvEB2gKZMxVIvNcvs70qbzOD
         NBBLMwxpgumnPseYMZuR5K3SoKgjUfw7iiCuTUSQMIyo3MgYmZhxZD8hOPGvp4GAeW+l
         ssnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819851; x=1757424651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZhR5vC+b5jGByrsGl+I17mSTr+5gAmJbDumtIuc2ZA=;
        b=Sux9bOyfhXvFAB8ajCGvZUcLgBQXMrl05WsAtayksgHJ11MLNKSZcjRUeErm33dArP
         APp5iJeVBMK+GyIaYwh1usxWuDt99hOciPjp6tBDft1eM6yRW8t+zqqG/nA1GHIRQn+j
         GYmU5QT/DcFXka9thJ4/TUpBUAnpx1ajt6fReiyHTiVNFFI6rykrFqqePw1IAXn1qr9/
         fyFXRsVEroM2jtMmsGJcWs1IiWxlmff/btLIsDTan+JtKLvkGbCPBkveiTXnqfjqcLP4
         2AKsNLHGSqCrUbSEpalEDi8XapDgpTu0e/5NPPQKGX/NaX+8piXFTzmnFg76AepXs2zV
         trCw==
X-Forwarded-Encrypted: i=1; AJvYcCVNfLIVtW8aTkd43sMaEhZv25NbLxuhEv9LoIIH4fOlHVvpS8gAW35JOmHLFBUTtPuQBoI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFd1alL31RpTNg7F3TZCLSsE31RGGXxx7jxnIqGIjfMfMiDwQc
	hZQ0HTezVCrywMeenSrbfq0hJb7byeCUHImgNnIM0+6fdjP6TVXiVWatsn+GNTBvE0AkHVRZbjn
	URxv30/YEgojEjV0zXIq+Ro3BJmH5Zj/dr9rG6Ze1Nw==
X-Gm-Gg: ASbGncvp7pJrvumfZZATd8vDAZeKSZ0XBiyL5pJHUxcH5MoN7MEyoLg5bqEqCbDF5vr
	ysIXnE3YI/oirqFhBTKeGo93qga22805UCnulSqpO1vqnfEqSXgtpUrCk+0cGQmprqGuiD4uLIp
	utbj92be6/KRicDxP+eLZTqTLfNBbeYJsn36jaNbu26lkdYwaKROv+uxjwunbIZmU3czdUrndVO
	h1ZasYx/uIgk8tmT3UJlPtOQ78TV081WewpErY=
X-Google-Smtp-Source: AGHT+IETXrXrPtCI9kHaUsOk3PiYBtzLQDyO5BpniBUPpd4tNEA5zWWpm33Zl8pshGOfywjYNp9sGHw+kB/41Th8Wwg=
X-Received: by 2002:a05:6512:2522:b0:55f:4429:15a6 with SMTP id
 2adb3069b0e04-55f70967db8mr4302395e87.48.1756819849325; Tue, 02 Sep 2025
 06:30:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-8-bb091daedc52@linaro.org> <aLbsr4s7nfvCKLnd@smile.fi.intel.com>
In-Reply-To: <aLbsr4s7nfvCKLnd@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 15:30:38 +0200
X-Gm-Features: Ac12FXwa7a499RP9JirYFVy7SbY2WfOVu2ugSGxCUkawbutvsj6hahPNBLiFvFg
Message-ID: <CAMRc=MfgXac4kRgeiw+SkNUZS_ThoX5qcXeRX5bPWm-t3JQ9Xg@mail.gmail.com>
Subject: Re: [PATCH v7 08/16] pinctrl: keembay: release allocated memory in
 detach path
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 3:10=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:17PM +0200, Bartosz Golaszewski wrote:
> >
> > Unlike all the other allocations in this driver, the memory for storing
> > the pin function descriptions allocated with kcalloc() and later resize=
d
> > with krealloc() is never freed. Use devres like elsewhere to handle
> > that. While at it - replace krealloc() with more suitable
> > devm_krealloc_array().
>
> With that in mind...
>
> > Note: the logic in this module is pretty convoluted and could probably
> > use some revisiting, we should probably be able to calculate the exact
> > amount of memory needed in advance or even skip the allocation
> > altogether and just add each function to the radix tree separately.
>
> ...
>
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>

Ah, I just ran b4 trailers -u and didn't check the result. :(

> This tag is not applicable to all patches, I do not believe this has been
> tested.
>
> ...
>
> > -     keembay_funcs =3D kcalloc(kpc->npins * 8, sizeof(*keembay_funcs),=
 GFP_KERNEL);
> > +     keembay_funcs =3D devm_kcalloc(kpc->dev, kpc->npins * 8,
>
> ...switching to size_mul() also adds more robustness against too big npin=
s
> values.
>

Eh... ok, if there'll be a v8.

Bart

> > +                                  sizeof(*keembay_funcs), GFP_KERNEL);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
