Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8722BF016
	for <imx@lists.linux.dev>; Tue, 26 Aug 2025 18:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756232391; cv=none; b=lwyYnAMOIBJ13pDbZPMSSCGR8ncwvYW4iF8qCPtGCXEsgKRO+mucShVllRgqfKTs6oyYiO3nT8WGiw6yY4giwg8aJ3FK9B3eESNkqLjvkIpnzbFhbVL/8w2uROMtZ74IIe1HyKlVDncsIc06rlmehlpeooTW4q2jKJ4rDufb1kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756232391; c=relaxed/simple;
	bh=XQz/VrYK3cwCtAlJzmwCDIZSeNenI6Rm8ZKZbd4vuEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GX2AUmGtVrNSUEJWXy7qRQtmPdr/y/7UOrG6aWiz9rYQ20szC88z3+LdKUowXRLWyTEPydIbhvuMwmZJaog7lzEHQ29VDgGQRyE74ZEbC87yYiQ2cicvwhdnsHNDNLQG2aslzRS3dqS4QqocYTjWEeIpZd99Fmh9IjVKqKgvupM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PBwbqgvF; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PBwbqgvF"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f4969c95aso2161951e87.0
        for <imx@lists.linux.dev>; Tue, 26 Aug 2025 11:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756232388; x=1756837188; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQz/VrYK3cwCtAlJzmwCDIZSeNenI6Rm8ZKZbd4vuEk=;
        b=PBwbqgvFYyax+ZCGLwLt4sYs63gJbF9GMoso76A1nYDORF1sc9R5gnSl1b3L8zZUcw
         /E/NymnA+MpiBMlSVOqN9jauuxoQ3BTgSs16kAr8JkGm313+1xAatQ1HwYvo6Q3x88Sr
         r3oOv2oNdkQcqMkxc1qGDdco0loG+rAxhO4vU8KiCclIlOniKMjuGcgTSmYu3tBy/jP1
         4AZLvxnoW6HWbRd7b3aofZmANHJQrYK+ux7/xOwftgtDbV1PxyGC9pEuVBgxZOfYQTf2
         TnlJxMBUhEajIwJMJeJ/vfYm2+2VNrzDnTOk8OGAbVA6GREmaPhDL5awA2F5PANgBHw5
         MT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756232388; x=1756837188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQz/VrYK3cwCtAlJzmwCDIZSeNenI6Rm8ZKZbd4vuEk=;
        b=v+6H5XjFHuP1lMLUMp0KBgbg2Q7hacxR/KLKHQzXXgKI4QVs6mevkoYE00Pif+APn9
         ya5pjQtaFowbd3hFbxILJuL6uJvQrFgF1/Ro2zz2KLNv5Y/hJXmy7RZZYIJqIGveViiE
         CkNnA32OhsqexTpTtWBIXggnPG48b+olHH/mGeRu8vavUcIYkwwgrU7dhs4ifnzkRlr+
         LT/a5QlU8dsvZWhXbJHijsy3/yqjPB71hYB3lEKtIixACyKpDRUb69dlxrSDPmfiW6+W
         v6pwvGvHTjD3sJ8f6tbeEP/HG2ib3E8ft1lAQa4jOrs4pzUJhjfdPkcfWurpTRTsUgfT
         seAA==
X-Forwarded-Encrypted: i=1; AJvYcCVSMN68ATihrU9WudPBfHXg1cjjDfB1/zAHyr/Ba/uP6Tl8jyV/iadVQ+XOBSyAHhYNbCU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzwPbnsY93aWpajv+0l07qhbEVJTEpAoeGBG6zTkEPCZBI1MDW
	Ln7GvzjFJs96lZW+qt8YXGQi7PfIp9XOCU1etHMWGiFYPeVRHlSTKu7L12+b52s2iSpn7RhYvaQ
	zJcWE/+a1T/MBgHHyDLrz/kugpSDXoZT05tykPLM3nw==
X-Gm-Gg: ASbGncsphkO5sYkuhcQaYmybydQKPwC+fLFiLMrackLWZm6HuJXR8/V8lSEcs32YVbD
	ekqJSFCxBtWeN+IgQJo/Ri6DODgLSEJVGV0ETYuOXGgEB8j+xrqcxfpEZsZwasSYbaW7yE9mk8l
	E0fcZNMLT0FKVqGDGfNPVWEL6E8vWjSjM7wuVCOjlhEWAx1swhJ8o1lAY9JTOpR434LlW9qoY22
	IGCfUvVAKt0ZMAbOc7MzbRyNbGn7hyMET9OJwX51yaD84o2M9FCnSzXaPyU
X-Google-Smtp-Source: AGHT+IH9/wDD1C5c1pzIo5M6703fhe2Ju79J3Cg57MCbuHB+kMzD9Ry2MpuHtwyxY9EgNTzhw0WfnDm8emGE0JQOveU=
X-Received: by 2002:a05:6512:3d87:b0:55f:3d7c:387b with SMTP id
 2adb3069b0e04-55f3d7c3badmr3365498e87.12.1756232388100; Tue, 26 Aug 2025
 11:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com> <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk>
In-Reply-To: <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 20:19:37 +0200
X-Gm-Features: Ac12FXxAYIw0w_2T1YaN-IyY2JYcpKwwddZS_ZNL3wGJGwAsl60-M2w6oLQOL30
Message-ID: <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 8:41=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Aug 20, 2025 at 09:12:49AM +0200, Linus Walleij wrote:
>
> > The qualcomm 32bit platforms fail in next anyway so I dropped the patch=
es
> > for now.
>
> FWIW the i.MX8MP also seems to have been broken by this:
>

I can't test it unfortunately - would you mind sharing some info on
what's failing exactly?

Bartosz
