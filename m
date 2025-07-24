Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3853BBF0
	for <imx@lists.linux.dev>; Thu, 24 Jul 2025 11:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355609; cv=none; b=bDR+s+muR11xUVjWLlip1qwFWvdybC4YMXTviPg+IIYq1NQoM0hJqrfeEUlXVY5ojfGiVceiydXEy2qRbH+VEhwoKEon26Jx1eXaXthWFM7lTwLyN+BfXXMo88gIHvCwCz+oCOYruhky29sJNYD3AnQPok3c8cyRlKPbbvSwENY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355609; c=relaxed/simple;
	bh=+xsk3eLTqVSLGwJ2sXxrjX5jHw9wBvQeSl2HaOa9FDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPX2ZhcxZBKWc0ud1E/U3Ba2VF7dx3igx4LlCBM3eDZw9h9j8FlHr3Zg1JLEbvqGv4rhvUgw0/zBr2rexECBoYzG+5OFikwd2kpZFVPIOcvipO9S1qiBaITPtkE+UDM2G49yZzinvBj3SdJ/AQp58hgKHOu4/yZkNtsNMqvXlmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLtqWSZk; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLtqWSZk"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so1428968a12.3
        for <imx@lists.linux.dev>; Thu, 24 Jul 2025 04:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753355606; x=1753960406; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZNixusr+c3cACc4GCTidZUQE/E0dLpa/Bb6bVcQhms=;
        b=lLtqWSZk3IVgYe4XoRAQDk6sBiwiulTNqmbmjB/DbsAMjEZpizMyy9MnJSrxG92jtb
         3uHTgHZuzPhn/Zf9zMuGrmLcOn5Sz8GcCXpD62Z298SbqtOcCu4UiEQtGV7OcRvAqmcZ
         oQXTi1i1XuvQiNwi04xE6OMT7TIQuh001vy/ECBzc1B+pDWcasA+j5kdpHe3tj9/kcYQ
         QbG3fv9csvZOmVzTFsSXExpXClH63BnZ5qrGNRFd+b0ILz/Fg3p8/EWzLssXFSdQ9cU1
         rSi6DJkY5EkuifpLA/WDloSpOaw+kUHdYzqf+NV7TvlT9O08JT1YteY2XS8WvHeNqD7V
         dILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355606; x=1753960406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZNixusr+c3cACc4GCTidZUQE/E0dLpa/Bb6bVcQhms=;
        b=wcIV2LIPxAhmyQh4Mn2oDpdh0DqZw5qJSdEQFQjPhs71l60dIWOl3H4+wH2y8V2wnZ
         XlVkGJi6Ov0xpq6sEC7+vVeaaHzPIBmPcfnOA6ZjZlTEQaqOFfIfDjWYcUhUyOfK//Qq
         g/344J9XGDv1yU82ofD9s1DDPCqalgKWbRL4hAla4Blo9/jKKbPi2nFauaFg7pFBC81H
         OXBRDHYPXHb+paz8/bstiOC8eO0tCwS/Zx1bjJjjSaNdBSjpOrRvJnctOIWH0bYTjGaV
         /my2E2olEK7THk4A+sB46LSQ/Spf1hzjCEiYrKG6xGJdiz8Mt+FuQ7BAPZVaxjZZMo4r
         zZew==
X-Forwarded-Encrypted: i=1; AJvYcCWQXRdNikVP/ln8nSGE4lcywdyG52S8uaYbR0UFnwOzRn3I37TA9KJk0fMLnJAgHJ7uFwU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAdmq326FQu9jv8HvMNwJEgeTbxYk9cJ7ur1LTaCPUttROvetu
	m0ED8cNmYmqfO5sDrj2QXuSdNfDtl3rgLdSl4jJ49ChhoQvQDPa6zaiwo0fDUwN35F9oH8Mjdik
	0v2z3fqwyeB2WPqVpTaAY67R0Ef7D5j8=
X-Gm-Gg: ASbGncsrkv09oPbv1pVszJUiqJ0R5fd6X1ZVgKIEsfaU0a4Dvbeoa0ylCaSjWhBbkEK
	q8pb6nTi0R32ef7So2zeLAK7Ky7HsE7PzsJbkS0z088/bBsNfcxrg6S7BNaeB6g9sFtqYFqjon8
	LdfGibXPTaE8zkGHahJbu7FiBK+FiXddW0BLAyTQY1/mu/4+P1O9YqMHkd6DtbfLFgtMCvtdIv1
	IpPV3TxvP6fBy9j1lmH
X-Google-Smtp-Source: AGHT+IELZnhRssUojeUfzx03q7k6D/HSNcNEJ5i+elToR/sTLOJXIaiozbv7LfFc6lY38aKQkwYpn9FdGW+sEeYsiSw=
X-Received: by 2002:a17:906:f581:b0:ade:2e4b:50d1 with SMTP id
 a640c23a62f3a-af2f895ad43mr692412466b.29.1753355605638; Thu, 24 Jul 2025
 04:13:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org> <e1253b8a-4940-417f-b530-09e57c6a8932@lucifer.local>
In-Reply-To: <e1253b8a-4940-417f-b530-09e57c6a8932@lucifer.local>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Jul 2025 13:12:49 +0200
X-Gm-Features: Ac12FXx4uwXTilr-eVY-szF3msWYq6-eRwPAeJOQDJhF69DCjZUNeC203FQ8yl0
Message-ID: <CAHp75VeWbhuL1pYvEza44Pnb5YUufgY=1WYXSx2nNMJVfcytTA@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] lib: provide kmemdup_const()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
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

On Thu, Jul 24, 2025 at 1:10=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> On Thu, Jul 24, 2025 at 11:24:29AM +0200, Bartosz Golaszewski wrote:

...

> >  extern void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp) __=
realloc_size(2);
> >  #define kmemdup(...) alloc_hooks(kmemdup_noprof(__VA_ARGS__))
> >
> > +extern const void *kmemdup_const(const void *src, size_t len, gfp_t gf=
p);
>
> Please drop extern, it's unnecessary.

It's all over the header. This should be done as a precursor patch and
I know that usually people push back on doing that. I gave up on this.
Kernel is going to rot sooner or later... :-(

> >  extern void *kvmemdup(const void *src, size_t len, gfp_t gfp) __reallo=
c_size(2);
> >  extern char *kmemdup_nul(const char *s, size_t len, gfp_t gfp);
> >  extern void *kmemdup_array(const void *src, size_t count, size_t eleme=
nt_size, gfp_t gfp)


--=20
With Best Regards,
Andy Shevchenko
