Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A53A31987D
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819788; cv=none; b=nByxRRuGkII/XZ3uZegh8zjlsI1sTfUm1gjW/mtURH06LFb75XNVnQKQLmlBVTkmJ35FJy35bBsVihrp9J1V7jfeZ9kXM2UoYi3jkQytQH3uPwvHOhw+y2KC/y748JV9HNWT/HZXrqbWgg/EGwYChc3uNvr2ofLkYxtXjl7Egno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819788; c=relaxed/simple;
	bh=3QlkS9Ed9gmuv+futXyyIrRTd0WcKtKmub0+uBCFWn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwHmqcvecZ1+f2HOVJxZ9MYSilS4Bwuu9dbMhmXc7wcQs79uQAxXpNyUbdIOt2tByjQR6JUe0mKHVltGX3jSBaVM1h8mpQE+ZJPagDKrgvjUnBiZaS6wHuPFYmk93OwB16FWQAwUT5eqcj251b67mBgjVHL8aOVjhQ/UAb6RB+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EaWPHhbE; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EaWPHhbE"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-56088927dcbso59626e87.3
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756819784; x=1757424584; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZCKJv4aYcw+dSdOw+40akoqTFv6AX+SyMdRpV8+ksQ=;
        b=EaWPHhbEuIwNielBMSY9Rk+zMxG4AJvtZ3Ddv2RIc0VDssqF4KYF04DBqvEPvOjlO+
         34Vg83fsQgNNfJTNbjOTmiV9UNapQ5Hs4EmcvkJ8Mt6KiMQotfyc/ipzhGZXoJsSiX06
         ie5qUbfU04bZZALis5Y/H//KgXtdevB0O9dcZ1WmCFJa3FoRhnUD7YRCbk7UOu/3ITri
         HBx32kiXLJxpAKQPLn0ej4T1WJ+srJEpFSktsVez57z+Ssk6bi8cImiOCTSMvNxc7IbQ
         X48SvC+RXcvLdeCP9ipbphv40mCR9gP7Sctwu9J4ScVSGoAfl+VZj/girvuV40+sDljt
         1d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819784; x=1757424584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZCKJv4aYcw+dSdOw+40akoqTFv6AX+SyMdRpV8+ksQ=;
        b=CuqO3PKqUjVD/6R3OITmzLtErovVRHvgYttbNzIPFNs5bBLxO8BKNtRVdYuUa5MSdX
         copFo0LXz44oUG8Jqrv+jIy2Sd0Oi3M1/FbeFBzNvjskyDzbKh1bYvs5GmHrmBgMSXG9
         orh9AEQWOIua8fWXtQGsDpSVZ7g5NVBlbsjTz3YGYcOUyR4FYrCp3JQmwFJDLfhBA6BX
         Sdkt8/y6UmFlIPs8ikiXUCouELnEk6f0E99L8dW1UPJWUp9pAE2/NRDiJ0ygyHKBnitt
         QbBMSLQUTcEWzNXVT7KUZY1sEFN8lU97/SDhyjrD9yCwaO5alWfK4C7eoyQkycjNuiIt
         hsJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPJUuP3XND5+I4s2bmm2cloROu+ic/LzK/cx0VfkVKMkhKKdCP5tHFKSs6bih12py305k=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ7VjwtCaCcz5lki0+lH5nM7mNSo0XEuv9jFzSn/vlwAWRlGNW
	gKzkUIYLtO9mahIlH0YwYnAMNK48vs3OK5OubLzgEt/7Uh+7mW64F6nX49kP/m2aOg50itY9/6V
	LuIbCBQ/3sssqdwflS+t2Jn+dWzRpsg7ibsf/hdATrA==
X-Gm-Gg: ASbGnct1OZn2PEgncp+y6e/RGgN5kooMKDYp7zCWQBA5Eig23zrn7mJPN+FC7ZksTNq
	9/NSaQMfSe576nDsk+K5hPXCJ6kpcIlhrt1iXy1oz4vP0RJUyIaQJ+OoBsrqXJzol4Jz/GKXSCq
	xFz+Rp5k5Z+PjhJCTf/6Srfuj/tbSP7cjbw1JUaLAnhAlDI4AhGkFc8aJ9pAZiISzWmSPr+H/Qx
	fMyFW2ZEOvzoIYB9n1mANCP3uHEEanFBkrL2HaLdIGzgJfDOg==
X-Google-Smtp-Source: AGHT+IEokI8/QdZgrQf6Khw+qmZIKYKiiUgjGe2BsWGspCY5PLtcBEV9VcspomwVXiAZN5jhrLGIGNRfYpYegqH5QMI=
X-Received: by 2002:a05:6512:6512:b0:55f:4760:ffc4 with SMTP id
 2adb3069b0e04-55f709953admr2780344e87.29.1756819782757; Tue, 02 Sep 2025
 06:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-1-bb091daedc52@linaro.org> <aLbrz5DYS5Yxx_UE@smile.fi.intel.com>
In-Reply-To: <aLbrz5DYS5Yxx_UE@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 15:29:31 +0200
X-Gm-Features: Ac12FXxptM2x0FIw3VzAD9gZWlHPceo9WcRvgcocpGcthnkDE6yjXmv7vVmpP9U
Message-ID: <CAMRc=Mfx5czDM=vfEYhFtVO3MviYaW4wKBYjGZ9ZnMbr-+T4mg@mail.gmail.com>
Subject: Re: [PATCH v7 01/16] pinctrl: check the return value of pinmux_ops::get_function_name()
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 3:06=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:10PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > While the API contract in docs doesn't specify it explicitly,
>
> So, why not to amend the doc at the same time?
>

Because this series is already big as is. That would be another commit
that can be separate.

> > the generic implementation of the get_function_name() callback from str=
uct
> > pinmux_ops - pinmux_generic_get_function_name() - can fail and return
> > NULL. This is already checked in pinmux_check_ops() so add a similar
> > check in pinmux_func_name_to_selector() instead of passing the returned
> > pointer right down to strcmp() where the NULL can get dereferenced. Thi=
s
> > is normal operation when adding new pinfunctions.
>
> Fixes?

This has always been like that.

> Reported?

I mean, technically Mark Brown reported my previous patch failing but
I don't think we do this if we're still within the same series just
another iteration?

> Closes?

Ditto.

>
> ...
>
> >       while (selector < nfuncs) {
> >               const char *fname =3D ops->get_function_name(pctldev, sel=
ector);
> >
> > -             if (!strcmp(function, fname))
> > +             if (fname && !strcmp(function, fname))
> >                       return selector;
>
> I would slightly refactor this:
>
>                 const char *fname;
>
>                 fname =3D ops->get_function_name(pctldev, selector);
>                 if (fname && !strcmp(function, fname))
>                         return selector;
>
> >               selector++;
>

You can do this in a subsequent patch, I prefer a smaller diff personally.

Bartosz
