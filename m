Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85FE3BA235
	for <imx@lists.linux.dev>; Mon, 11 May 2026 08:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489313; cv=none; b=aqdCUVKzlg7r4yTFR9Dp4tygBy3OyxPeItPEa05YibmQ0DOUG1dxtHZJsZ4kB/C8vQ5Spf+DGpPbaxAuPw+xx/JzW+K2mznEjBSnpCF25u2KgwsB0GY6pQUSKE0vf/3e7BBzh6mihLGfWUI2Li9P5y4aAbE4UueMI7EowLyHB/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489313; c=relaxed/simple;
	bh=FS9Vcj76U9RM5XIubOjoexo/Q66e6Qb8ezAJTR8qo6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X/9bg+4mTCOcjQxQDkiW54Bjge9JMl+9uv9vr9zDM+a0UbU6i7oKgVuJhFia0wo+cDRJibDM2lEOokGV/MoDGS4L+Y7jrRnM230WvLmssls7V0Ugi65L8hfFagHBT+g7P+EPrLpDvld1yG8WDMuJ832Xlm4iGF4hCa4HARNYSeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BkFL70sk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BkFL70sk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87269C2BD05
	for <imx@lists.linux.dev>; Mon, 11 May 2026 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778489313;
	bh=FS9Vcj76U9RM5XIubOjoexo/Q66e6Qb8ezAJTR8qo6Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BkFL70skeyMsxsAPovmmjWva/uA7ul3y+pIyc0IbC5Z6jp+X3h/7vsK1rfwOWZwPg
	 yyof2+cc+0ChQ2ZmGzBckVM4Lho265t0+jpyzOhL0Z85yUbVdXmfJmgY+XWgfVuLx2
	 XSMQHZ1SPx0FS7PtT6I/Kxdzu1DH/0TiUQvlV1AXSKc5p5bPkLemRqecW64jPWpgUX
	 zorFbUkVKMMpZZClvBqYJNyNSAFy401fOr/YeNklUYQUHH0RP2e73Asc+fHm7CsYUZ
	 lMVq0GCD6y86ofaHEztAM0IGwcsCFYuAtc+pTYuzFC128zk8vnCp1QfpB695rL+9Jg
	 uZ3GOxabECP7A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a86bfa2a4eso4663867e87.1
        for <imx@lists.linux.dev>; Mon, 11 May 2026 01:48:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ//2mxJ5Ci2Vriwa5Hx8IF5xfBmd2sYEQJPLrR2saCeYhihay/F2pSaqmrHNXlfz14UIHQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwSIo5ILdkxToM+gSEFdxp95fN9TTZyyeKfjFK8uJZ+3oOzOCNX
	BXNKipIfJ3klsJ759JpZ6++hN1q04UqoeRzpS9we6y6K74ttL3l2ZFRADH46DmJ9HyWs59TIOI0
	J5e3axhrLJUPmSZ6wu+QZkPobtzPuk9g=
X-Received: by 2002:a05:6512:304b:b0:5a8:6e64:a932 with SMTP id
 2adb3069b0e04-5a887cea7efmr9393309e87.32.1778489312120; Mon, 11 May 2026
 01:48:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com>
 <CAD++jLnk4q7L_cFzz+1gKkAqwhv=TW1_XSepuii7b_PHF7EPqQ@mail.gmail.com> <704e9e7b-0f45-4ed3-a686-9e20056eab2a@oss.nxp.com>
In-Reply-To: <704e9e7b-0f45-4ed3-a686-9e20056eab2a@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 10:48:18 +0200
X-Gmail-Original-Message-ID: <CAD++jLk-7UqjCsM4jCdRmBMMaNNXe8Gi_E00fJ_MRMsEGQcMZQ@mail.gmail.com>
X-Gm-Features: AVHnY4Jgw80MuyK4ZGcKlHCdHrHAFZ3YKz8oTwazlDM_Kdt2Svy6qUsv6clMxog
Message-ID: <CAD++jLk-7UqjCsM4jCdRmBMMaNNXe8Gi_E00fJ_MRMsEGQcMZQ@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] pinctrl: s32cc: implement GPIO functionality
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 11:07=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

>I don't think the current driver is a good fit for
> a full gpio-regmap conversion. Direction and GPIO mux are
> handled through MSCR/pinctrl state (IBE/OBE/SSS), and the GPIO
> logic spans multiple register regions across two SIUL2 instances.

I don't see the problem with that?

> A conversion would require stronger separation between
> GPIO and pinctrl, leaving mux restoration entirely
> to the pinctrl subsystem.

Why is that so? Sorry I don't get the problem here.

The pinmux operations have these callbacks:

static const struct pinmux_ops s32_pmx_ops =3D {
(...)
        .gpio_request_enable =3D s32_pmx_gpio_request_enable,
        .gpio_disable_free =3D s32_pmx_gpio_disable_free,
        .gpio_set_direction =3D s32_pmx_gpio_set_direction,
};

So to me it looks like the pinctrl subsystem is *already*
handling all the muxing of GPIO lines in these
callbacks?

> Would it be reasonable to keep the current approach for now
> and revisit gpio-regmap later if needed?

I'd prefer that you look into it now while you already
have all the information at hand and fresh in your mind.

You can forward my comments to your project lead
/ JIRA instance and say it's Linus' fault you have to spend
more time on this right now.

Yours,
Linus Walleij
