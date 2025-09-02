Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913F5341662
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 17:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756835415; cv=none; b=dQPFEJnf44N37eWVsD8QmnEPhQKqAOVn6UrHGToWAfoK2IafwmtB7FB4ux7lva4+ERy6zHCo2HsoxW/CL5K8+rbKpMmkwk8KgdRUp8NuWm64ayDMl/EfZvCacI65x7lypTpk5mh8PwZrKN1MhJLA1LQ8ERPdrz5vA4hq/XHawWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756835415; c=relaxed/simple;
	bh=Qq79ok73NgzUNSPN3ElH84ehBnROIulXyA0yyA4cddE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fq9cOjirY6G8SNSrJoRmFtaxWAjzw5LCJC0GO16Y1Q6dXME7iJoWQQ8EiUpQR9pIyr2ax37Bq0XwJLzHMKTKqbhekXyLzIzxqLUrWNGJl7s2hX3L276yvRSrVcWlTbW7m/33rIMwvLlkhncP+GlyEch2M4vmlx6UptjYs62hjFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=krU/Kc5Y; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="krU/Kc5Y"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f74c6d316so3100838e87.0
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 10:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756835412; x=1757440212; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qq79ok73NgzUNSPN3ElH84ehBnROIulXyA0yyA4cddE=;
        b=krU/Kc5YHegNP72pvf3zzsZPqpmvFvsXgAycBpUA2gXPEj8d5GEgwZzBBYEgSgkstf
         YkALUTK7bXSCdGEbHq9/hfg1k7JTaqe8gUFzpiJJB51AdRXkWcu69HDnhOVHm8tkLeQ5
         dtFCxZdbmkYSnFZyN3aveFyDnp+xk+ibZvnZS3dnZlJgZ2PG+Rud/ONbAj57yfRNlBg8
         yUDVQd5UPZC9DHhWm1aogigPfy7FaOyCzuTUVF7cypzRCF1kyq+jhIL1fSXT5IHWOZmv
         E8wH2UpJqeOr9oCsg2jMx5BAsmkIxevdpa1hE72XnrtTCvnWBJ6apW8WudWJ3/koIcOE
         pRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756835412; x=1757440212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qq79ok73NgzUNSPN3ElH84ehBnROIulXyA0yyA4cddE=;
        b=RuwseSng9TvWB5DMnfWkuddYDpU3+cu7xQEpGHsjGSL0M8glsYkg/VQNRIHoD8nr4b
         NCT0YpfrPXW2Qx3wVnsNF04Atg0okdfp5l2Xu3ZzDyJpjY8s1HA28e92bVVBrfKNpE6k
         +VjWjg2xXy9KjDRb89qS9Sd65AsQlSsY6c7uW7HMsMP0/YJmBEGWmUI259rM7ZYBQKvA
         JbnfkFUZ0PxGikWF1sq63RZfWFKWc11lgD5NpI/MFAg/90uLG8edsTjNutd8eQxsFv6y
         c5jyDsRpSy1gF4+36UoLnfbuGh8ZWd+6l/RG1fJpuwuUI+vzeMmhnygeabpVJyZbxtnZ
         rDcw==
X-Forwarded-Encrypted: i=1; AJvYcCUfXw0+iWvHCIiBGaaic/bgfaBvP5zwZohX4DzrrhKgWWZWUkaYxY3OpTr8ZE+Yr37kTA4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyQfT8p+I8rZfv02sOnYgd78fC1mOFAjfh4mjes0RZK+ug7pVW
	L6VULLPYdeD0alIWZ70rGQdkhI9M1e76xT53snsAG9hQj5OV2hi0gLRbVHmdNbfoosz7g2PX9j9
	ov+7T67wien8msyxkIu8FmKafXh8xyOPMXljYj5GDjg==
X-Gm-Gg: ASbGncvdSHfs7vAb7D3EN9f+wZecqu6tGzkdfMdheuNzcGG1hCXdXpDEavNIc8NUetf
	OiETgiO7PVLw7I+1jLtNyLGgwFadk18y2utAjBYhtTu77U4yjgEyCHGz+7lMaImcja/EvI1XJLu
	iYgNYgJ5Byp4M+zurKxVfYlgShgUO3zU16TmgeaTABrl2MyrYN9Jd0qlCYHTTQQB8ZV0noalgAQ
	eGdaD9GAN7MYe86aaiO+vh6AjQfUl5LmkkT/Rf1eIfiwYlI4A==
X-Google-Smtp-Source: AGHT+IHWxMY/UX5pahdxyPomER2R5wCG7WJNOYIC76WLDnRgZXryLWeY1Ce628zgGwqGftmJqN1QawcJ1KuqTk6lVI8=
X-Received: by 2002:a05:6512:3b12:b0:55f:4f99:f3c9 with SMTP id
 2adb3069b0e04-55f708ec830mr4334057e87.32.1756835411674; Tue, 02 Sep 2025
 10:50:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-13-bb091daedc52@linaro.org> <aLb_pOG-yc-CHoiY@smile.fi.intel.com>
In-Reply-To: <aLb_pOG-yc-CHoiY@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 19:50:00 +0200
X-Gm-Features: Ac12FXzmJRg8_mGsvbk9kTYEAk6i5wfrx-8rp8gdl4L5LHxLn-6rA1BsDeyDmdo
Message-ID: <CAMRc=Mc-NEFawz11Lr5JGStoe=PU7b91E-MVB3xkdBr_JoiStQ@mail.gmail.com>
Subject: Re: [PATCH v7 13/16] pinctrl: allow to mark pin functions as
 requestable GPIOs
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

On Tue, Sep 2, 2025 at 4:31=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:22PM +0200, Bartosz Golaszewski wrote:
> >
> > The name of the pin function has no real meaning to pinctrl core and is
> > there only for human readability of device properties. Some pins are
> > muxed as GPIOs but for "strict" pinmuxers it's impossible to request
> > them as GPIOs if they're bound to a devide - even if their function nam=
e
> > explicitly says "gpio". Add a new field to struct pinfunction that
> > allows to pass additional flags to pinctrl core.
>
> Which I disagree with. The pin control _knows_ about itself. If one needs
> to request a pin as GPIO it can be done differently (perhaps with a new,
> special callback or with the existing ones, I need to dive to this).

What? Why? Makes no sense, there already is a function for requesting
a pin as GPIO, it's called pinctrl_gpio_request(). And it's affected
by this series because otherwise we fail as explained in the cover
letter.

> On a brief view this can be done in the same way as valid_mask in GPIO,
> actually this is exactly what should be (re-)used in my opinion here.
>

Except that the valid_mask is very unclear and IMO it's much cleaner
to have a flag for that.

> > While we could go with
> > a boolean "is_gpio" field, a flags field is more future-proof.
>
> This sentence is probably extra in the commit message and can be omitted.
>
> > If the PINFUNCTION_FLAG_GPIO is set for a given function, the pin muxed
> > to it can be requested as GPIO even on strict pin controllers.
>
> So. this changes the contract between pin control (mux) core and drivers.

Yes, that's allowed in the kernel. The current contract is wrong and
the reason why we can for instance confuse debug UARTs by requesting
its pins as GPIOs from user-space whereas a strict pinmuxer will not
allow it. But to convert pinmuxers to "strict" we need to change the
behavior.

> Why? How is it supposed to work on the really strict controllers, please?
>

Like what I explained several times? You have pins used by a device.
User-space comes around and requests them and fiddles with them and
now the state of your device is undefined/broken. With a strict
pinmuxer user-space will fail to request the pins muxed to a non-GPIO
function.

> > Add a new callback to struct pinmux_ops - function_is_gpio() - that all=
ows
> > pinmux core to inspect a function and see if it's a GPIO one. Provide a
> > generic implementation of this callback.

Bartosz
