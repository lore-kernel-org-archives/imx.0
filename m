Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D184E5327
	for <imx@lists.linux.dev>; Tue, 13 Oct 2026 23:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791934787; cv=none; b=gMAxOeuVF+xOIv24LwcUifWpOa+zRPIzRgwIOe58kcxbHFy6+zNGHoCHGpQ+Zt220f4HM2qccWI9pmn7uTagxKMSEKD+TtT4IrOJLTCWOCBNcHG/94iGrrCpkhz7nQpcJ0qH6fozfMVQ/WX2yu9lLjcT+ivetj1ft+Ko43bVZqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791934787; c=relaxed/simple;
	bh=JcDoLuPhHtsthqN6OlSJt2B07gH5Ch6EunMouvXcfX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=corxTEpIcDinyTJfzn4UUN2z86XniowG26Egx4Dx3cnkGPKUBiBaZObdYy7SgOnPuU8EsNn7rUQ8q0pl9f28IJmIcjCKmoSYhOVmXIaLfXv7FYr7XkRNQFXbxpR567ucGrHQsgGdaFX0hA+zJY/CJ5c92Vm6hZIdurrxQDCq+j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nX3lHDWw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nX3lHDWw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678751F008A0
	for <imx@lists.linux.dev>; Tue, 13 Oct 2026 23:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791934783;
	bh=JcDoLuPhHtsthqN6OlSJt2B07gH5Ch6EunMouvXcfX4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nX3lHDWw3cLxd4fNmUOu94gijN5EvKbh+LyuJpyNKDIEDXqLBlI9B5ihZGE7ikvn2
	 SJq6dEnWBgcK2aR/hdHWutHM5lE15OQmgoDy5LIyeCxbNSsR8JGtttz/DVRitb3Xqi
	 eWvUhhB7SInvdsGRKg8fmKdDSf0FcKpMU1jcxWzoK5qFX2M3XaZ77o8CO6jDSgiE1Q
	 w6C6PRQi7nKpM2nImjHc6OtEkOlOrUkbzbcf3TaOpwhMNmxfobJAu8AO8i/GFRXwhg
	 1nM7an1oewJQnOAHpfgvi+iZaLNU9zVlsXxY+T+MjPbRzgxIdh+iv9LThvZS5ojt4m
	 8hMnQCUwbvsgw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a9761758adso29104541fa.0
        for <imx@lists.linux.dev>; Tue, 13 Oct 2026 16:39:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy7Clk/5ytNbRcfji+frF5bEqG0FQCruxBpZOXzP5fOCfFFNWqQlBHnyuU6mY0wqgT1v/A=@lists.linux.dev
X-Gm-Message-State: AFq9FYJSDLwAY77GGNCmEcm0JKwUEfzncZ/bsXuxaUtt6bu2m6lJ/IjM
	+eVRJN0ihMxTYGy+yvX2hAYSYBhIsmBs8aVA3JXT+M11Ny6PRll6Yn941j1Eh31DJcCoT70KkYT
	zA2VTwTE79p6jKTeew2d0aUkakPphRSo=
X-Received: by 2002:a05:651c:510:b0:3a7:8372:61b7 with SMTP id
 38308e7fff4ca-3a9c56e47e1mr31458331fa.25.1791934782126; Tue, 13 Oct 2026
 16:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com> <20261013-gpio-mxc-cleanup-v7-4-c4d769587d3e@nxp.com>
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-4-c4d769587d3e@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 01:39:29 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Jz=JCzcA8Z=SZRwKkk5-mL87Z85h6s3aPgydJ+2ypeg@mail.gmail.com>
X-Gm-Features: AclHuK_hIX0DEmnlWKNMSJS0IkXsyO_5VG56dU3LHEgn8JxPCAbGDIRoOljCGmk
Message-ID: <CAD++jL=Jz=JCzcA8Z=SZRwKkk5-mL87Z85h6s3aPgydJ+2ypeg@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] gpio: mxc: fix race between gpiochip registration
 and IRQ domain setup
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:01=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> devm_gpiochip_add_data() makes the GPIO chip visible to consumers
> immediately. Since the chip sets .to_irq =3D mxc_gpio_to_irq, which calls
> irq_find_mapping(port->domain, offset), any to_irq() call between
> gpiochip registration and IRQ domain creation will operate on a NULL
> domain.
>
> Fix by moving devm_gpiochip_add_data() after the IRQ domain and generic
> irq chip are fully initialized, ensuring port->domain and the irq chip
> handlers are ready before the chip becomes visible to consumers.
>
> Fixes: d37a65bb4663 ("gpio/mxc: Move Freescale MXC gpio driver to drivers=
/gpio")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
