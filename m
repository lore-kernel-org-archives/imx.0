Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09E5275AE4
	for <imx@lists.linux.dev>; Tue, 29 Jul 2025 09:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753781049; cv=none; b=GvzbWOBfO3219UT5L04hE0n7pNqnvfXL20PDT8sLXYpc9hk7vRwcnMkJ+8JvayvYj7TYqFhFrkG92YEh5Hw5dtToHAlK8ARq53dcaqJ8ta5is5RSeuCQkM2GWtalC6zkryrfEGcFNo+QqQOpfgMCi4u/p63PmEF02IdaRwlvlbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753781049; c=relaxed/simple;
	bh=1XbJXYOtfiKvD5ix8X5FxAD5vsw1x7eclqIkLeXimps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mW/8cS5lNWVRBYepbWxvk24Ghy0EumaR4q+jdhL0f1/mFpONWRsuPq5cnh47FJOGhbtHC6McyEQeYUjp87uZPnDQXNO8XQaTeVtwUQboBssbRN2jTPY9wCMfh1KV+D/bMZubBeDmiBWhGHxXm4BJYaedy1E5Tc9avdRkbZQ2/nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=swTt7NlU; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="swTt7NlU"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32f1df5703aso43049961fa.3
        for <imx@lists.linux.dev>; Tue, 29 Jul 2025 02:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753781046; x=1754385846; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvMriwwuRsxStr2YyKe5TWPbRI0lQN4j3ZQYt22kpLE=;
        b=swTt7NlUPfn2VXpdMknIYFafFGHrKkIjQMg4dnWZnwdtl1SZ7zcekwuJOFsP8ZDaK2
         5u+U14jo8cHv7pdftf1MtZyxrlfC2xQOoXW6KoVZMMktQ/7h9MfpOxswJNg7j884T9WP
         o2qaOFRLJPEoladtHufDoG2T9LWNSf1BA7SAMK/gFJVWm0rDC5f8zg+Gp/uXoBz+Ksz/
         YbNroHnIHP7BxOLmY41o8DFlBe8UXRjcPnOvnQcHmU52Z45SbLHNaEK4/M+baJLTdBWU
         FRCrJWjOopf8GVP6uDGatZFtSiLOus/Nym/GpfVnOZ08799k8EIbO1TpZryRY8oQ0wwC
         wNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753781046; x=1754385846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvMriwwuRsxStr2YyKe5TWPbRI0lQN4j3ZQYt22kpLE=;
        b=WDKPBhcwMDUjglSRsMtxicY4P3nz07OnaGAhz5Wo3BGECmYUt80Yex6cYWpPv+o5ei
         Jvk2R8fqB+KTwTNAgpjXgI2/hCWpSxl0hNVQ5KU5JUz0BKMdbBcadyB/j85aQ+bd1pAz
         mdeSAr0ZrdPgfqCjgh55piPF1L6Gy8qN4tpz/I9KPPcfnIF+S0QlOEIhfdMGe8Wa9vFu
         w+fX3n15H0kcT6EtRMzsfhOScqce4zybI0fsTfxh5nZfoX5trQ3qUCq9+MAYJMl7mFS4
         uv03s6iBVD00ZH7KT7iV9Ds++2TYAzAJHAnoIzClN+MGKYxki8broOL2MKtutvl6AXRl
         wEBA==
X-Forwarded-Encrypted: i=1; AJvYcCUOZo8xKddV0oRAiFk84g3z1wjArdyrWJljalOhNWPf2Dr/1N1A1Uyf55wGig9JlQYfdGw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy56vvl3Lfyo+kcIW7pGwFwZa5dLVon0bKVi9O/EaLVsFvbXdya
	n88yad58suECh7IP9VaRjpm7KHfGCb2nO9NFhgsV8oY89ITCvHS/57IVXZCOKxzz/+/id6Ln49M
	Vf8TsmJIq6fotFm4XRxkqV2kbrxnma54LuBSOXQVvDQ==
X-Gm-Gg: ASbGncugXcz7272H9q38FoNNmBlrHdyzzj1FYBvXxblAUqDtOOCMW4ERc7WuosCiZ86
	N/PDdbnv+wQqcupxzKrYOv5fMMyfzW5qWqajXtC3v9PBtKQmh8MBcD22PfydEu9gTQEystdJcPy
	oDuKw8il/FgjqEieuGgXGSm5QZXrDpuCwyTq7pY5eHhoHDNi4AA8CadnSiAUdVzegTqbUDbsHI+
	epWV8NAGSPctZsnj/cXtiL8t03S+ztImApWVHy6sbbZKkPwnw==
X-Google-Smtp-Source: AGHT+IG4d8eX8f04SwumbDn+t8ORtzgwAVwNB5BHKdmUryIfl8eqxh2e3123W81layXfFQt1IEka9/bpWuzrKar7j3E=
X-Received: by 2002:a05:6512:3a86:b0:553:d910:9334 with SMTP id
 2adb3069b0e04-55b5f4df595mr4041752e87.46.1753781045533; Tue, 29 Jul 2025
 02:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-8-af4db9302de4@linaro.org> <CAHp75VdMmfV=z75K9AmB7GsWV8C1bZPLGi33duTCt+CM79spJg@mail.gmail.com>
In-Reply-To: <CAHp75VdMmfV=z75K9AmB7GsWV8C1bZPLGi33duTCt+CM79spJg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 29 Jul 2025 11:23:54 +0200
X-Gm-Features: Ac12FXwkqCsphx3p10ZENgy5ARM9FowTyJPFq-nwB_5x6uw2mPSH_J_dgheu8yg
Message-ID: <CAMRc=MeEo6p=6Tp5kORi9y5tGNJKrzh0kq7tpe_E=5TasMjgbg@mail.gmail.com>
Subject: Re: [PATCH v3 08/15] pinctrl: keembay: use a dedicated structure for
 the pinfunction description
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 1:11=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Jul 24, 2025 at 11:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > struct function_desc is a wrapper around struct pinfunction with an
> > additional void *data pointer. We're working towards reducing the usage
> > of struct function_desc in pinctrl drivers - they should only be create=
d
> > by pinmux core and accessed by drivers using
> > pinmux_generic_get_function().
>
> Any link to the discussion and perhaps an updated in-kernel
> documentation and/or TODO?
>

The discussions happened under v1 and v2 of this series. The "reducing
the usage ..." part refers to the need to avoid memory duplication of
struct pinfunction really but it's a prerequisite.

> > This driver uses the data pointer so in
> > order to stop using struct function_desc, we need to provide an
> > alternative that also wraps the mux mode which is passed to pinctrl cor=
e
> > as user data.
>
> ...
>
> > +struct keembay_pinfunction {
> > +       struct pinfunction func;
> > +       u8 mux_mode;
> > +};
>
> My gut's feeling that this type of construction will be in tons of the
> drivers, perhaps better to provide an alternative like
> struct pinfunction_with_mode {
>   ...

Nah, literally only this one so far. And I bet we could rework it to
avoid it altogether. Your proposal is too specific IMO. Let's cross
that bridge when (if) we get there.

> };
>
> Or even with variadic arguments... (just saying)
>

Oh please no. :)

Bartosz
