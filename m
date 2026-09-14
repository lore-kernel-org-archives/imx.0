Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6D94519BA
	for <imx@lists.linux.dev>; Mon, 14 Sep 2026 12:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387535; cv=none; b=eMhzEw5mqgYvPsIbMpoVaYS97lze7v0m0xau5CDXL0CH1IvX2T6Jz4SmBqkgtn8PjWIKHnYXgCwMmVJ2c+l3sSyoRQXhJjpg33opYNWIUNS2xwc18tZ7fETbZuj9yyt9mt1BK6936YtLUSmfKfvJXoyYajZBueGMj2Q/O+w1Fz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387535; c=relaxed/simple;
	bh=EPKKIl6b3EX8ev0wV8qzJhlhMCWNx423BGnboaaBEu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k5uj+zcFPwSV0HUAnfPDAnu05smESxvDhKaGTup/OufPvfVrNH9oJrZivqGjYjpXxNZt+NeWYVhq6bmkxNTwJBhYw/1c3lsCmMGmOJchwvL4ADxP/IPMVjfEoPcP++pZ9VHvLNhO7nbGOT9tt/rYy3doWHmWwrhJANCkE9KSOBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l63j0eY3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l63j0eY3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0CE1F0089F
	for <imx@lists.linux.dev>; Mon, 14 Sep 2026 12:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789387533;
	bh=EPKKIl6b3EX8ev0wV8qzJhlhMCWNx423BGnboaaBEu0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=l63j0eY3owxAwFmzW+uTH89IrGmFevi3NYadMmQhCCS1ss1AxvUwzPZhAM5U8lUSC
	 XVGeiEDAFdBs/HBm1LHiEt1Iu6qBqLULZ9TD/KS2mLUx+BGsKIdiy1FsJe24du76xb
	 oZz/FIhU47BOb8bxZ5OUSn854dyJHQTgX47StRGclbzw4BhtBED4rvhZ3K8rin9E2l
	 UewJ0rwo5JgjxAQJcdvwvJwTx0yj+GuEYBtMoyO5wEFlbI/vLlTOW6wbKnoEjqGPxr
	 EOOtGf2FBzOqf4plumIHiSmm8qwRBG3S64OkHX5Mnvw1o5X2D3icGLbmReQoFeuKNc
	 T1Z9yUPfxwEUA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b7aso2146493e87.3
        for <imx@lists.linux.dev>; Mon, 14 Sep 2026 05:05:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzXA0gF4ghE399kiY52s7xr9MMN7CdMhb1Fd9ETHZDIzzAQRSOty4Wrt6qmiBcvITQR230=@lists.linux.dev
X-Gm-Message-State: AFuF++ndDhdja24s2enyR1KhGqHLvODvJPdkirKHrdNNVn5x6EvktiYj
	MNTTBxEYW2iLoGIGiu2OH22wldf9+oDFdPrujwCBY0YW3q83EhLs9mNhVN75ZeG0uqWgCu3WRDH
	dV6WecXAV4iiJlpK/7HX8gaQGjWcZlGE=
X-Received: by 2002:a05:6512:2242:b0:5b7:65c0:8b92 with SMTP id
 2adb3069b0e04-5b8ae68d987mr1247986e87.12.1789387531865; Mon, 14 Sep 2026
 05:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903075940.2089367-1-mehmet.fide@gmail.com> <20260903075940.2089367-3-mehmet.fide@gmail.com>
In-Reply-To: <20260903075940.2089367-3-mehmet.fide@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 14:05:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLnhjQncaYeN-2KQT64AJ39iWa-RtHiX2MCvJxcD0KJ=GA@mail.gmail.com>
X-Gm-Features: AcwNN1XZ9uIL02Hv0f9jfHvvbR53KZbr_8sAwWaE8orQR7toy2YPXPWxkdZN7oo
Message-ID: <CAD++jLnhjQncaYeN-2KQT64AJ39iWa-RtHiX2MCvJxcD0KJ=GA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] gpiolib: add get_config() and gpiochip_generic_get_config()
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mehmet Fide <mehmet.fide@screeningeagle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 9:59=E2=80=AFAM Mehmet Fide <mehmet.fide@gmail.com> =
wrote:

> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> A chip with a pin control backend sets a line's configuration through
> set_config() and gpiochip_generic_config(), but has no way to read one
> back. gpio-mmio needs that to learn the direction of a line whose
> direction lives in the pin controller.
>
> Add the optional get_config() callback, taking the packed parameter to
> query and returning its bare argument the way pinctrl_gpio_get_config()
> does, and gpiochip_generic_get_config() as the pin control backed
> implementation, the mirror of gpiochip_generic_config(). Without
> CONFIG_PINCTRL the pinctrl stub returns 0 and leaves the config alone,
> so the helper answers -ENOTSUPP there instead.
>
> Nothing in gpiolib calls get_config() and there is no consumer API; it
> is for the chip's own use.
>
> Suggested-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Excellent Mehmet, exactly what I had in mind!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
