Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025F64A9D6E
	for <imx@lists.linux.dev>; Wed, 16 Sep 2026 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551768; cv=none; b=jkg31lX9T3fAciXsCscrX6iHzdmy5xA/RR/F7n49I8q9i8SzIPY9mCcRQa7NZ9FBDT+h0MhrqBtH4h5AuWQv0+P64TjjqvmKrxE9IS99PgwM2R7Kvc3jQNhzq3aNJJFYf6tBX97/omoXWPg8ELXeyLtSC0mpHzDRd3Tnq4IV7aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551768; c=relaxed/simple;
	bh=cqFwpLQ8DQqnuEuDbC3MvqV/smDD3aMRxr/k52wr/tA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VAl6lmpPL9y8phi5kEf05dgZJ+q4t3ruDIDfb4xOqCQJUXeF/vROVBJldVxIGMFYA2TqyRtL1BDa+RxgyvAKVO3wIKF6knDabsIPbCvy523IH6dyqTlr87ZMSfxYb/F9jk+uKwXESOUopxlShZyDwhNQdOMIIxRV8cxch0W1+/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7eU4G/q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7eU4G/q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197B01F00899
	for <imx@lists.linux.dev>; Wed, 16 Sep 2026 09:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789551757;
	bh=cqFwpLQ8DQqnuEuDbC3MvqV/smDD3aMRxr/k52wr/tA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=V7eU4G/qrJYsraslV6xwAcefnxEd00KhIxhPEEXG0ZuENbAkBucxaFewyR2UTGxa0
	 9ydt/ClWnz185qyQ7fd4yeJrwDinu2SKt7ryBVdt+c0McLlNcCYV1Bkv/sZ28uttnK
	 KZbkvPrNlGdv+B3qYqkMPq9M3rU3YQ1L6yCOELVnQ2TagAwNUVShxFaue6DWqChOoq
	 FDIVvzekshgLL9so84s+ideUO50YTnopKWCytdGygPqghQro1DMSIPsNcEfFaj4Mxv
	 LL6ah6mijWVBZxMoMZxZIE44e65n7I7cL2BDpmSeynGgJ5CJvXKdFZ3CB4cNfE6fP9
	 0py1tNBKuJWoQ==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d7eso6267461fa.3
        for <imx@lists.linux.dev>; Wed, 16 Sep 2026 02:42:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzCN9CMx0dPqpRou0xdv2oiUIOpeGSCfKHe+qAOAU6TeVvBZ4iy1vd0RQB3tJ6OIKQIAzE=@lists.linux.dev
X-Gm-Message-State: AFuF++mVLDmzxepPoB/wpwYGYS3UGtCmD9oCeWIgxNQkwRs5PF8c4d2y
	OPboPtoc9LWYAzOuxfSMGq9L7vJWOZsVE1wBBYR00Qd9/V+jB8ZivaRPg1YJbex8mcFQ1rjFM+B
	XwcJJv+Yt5mYZvmP5c5wYl39XxiViANW3MKyDt2c3gw==
X-Received: by 2002:a05:651c:a10f:10b0:3a4:9881:8ded with SMTP id
 38308e7fff4ca-3a5dc9b4b1amr5756261fa.5.1789551755778; Wed, 16 Sep 2026
 02:42:35 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 05:42:34 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 05:42:34 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260915080501.329424-2-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915080501.329424-1-mehmet.fide@gmail.com> <20260915080501.329424-2-mehmet.fide@gmail.com>
Date: Wed, 16 Sep 2026 05:42:34 -0400
X-Gmail-Original-Message-ID: <CAMRc=Md5hu0ec_vNOy4mK8F4cw7Rz6qONVZ5jRH87JaRbjMLiw@mail.gmail.com>
X-Gm-Features: AcwNN1VnRspipPNfEKlhy5QnZsTJ24KTRx6W07m7ha1B5smjeCWweV0ATyt3qGE
Message-ID: <CAMRc=Md5hu0ec_vNOy4mK8F4cw7Rz6qONVZ5jRH87JaRbjMLiw@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] pinctrl: make the CONFIG_PINCTRL=n gpio config
 stubs return -ENOTSUPP
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Haibo Chen <haibo.chen@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sep 2026 10:04:58 +0200, Mehmet Fide <mehmet.fide@gmail.com> said:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> With CONFIG_PINCTRL=n, pinctrl_gpio_get_config() and
> pinctrl_gpio_set_config() are stubs that return 0. The getter reports
> success without touching the config it was asked to fill, so a caller
> reads the packed parameter it passed in back as if it were the pin's
> state; the setter reports success for a configuration nobody applied.
>
> With CONFIG_PINCTRL=y the same callers already get -ENOTSUPP from
> gpiochip_generic_config() and gpiochip_generic_get_config() for a chip
> without pin ranges, and gpiolib treats that value as "the backend cannot
> do this" and carries on. Return it from the stubs too, so a kernel
> without pinctrl behaves like a chip without pin ranges instead of
> claiming success.
>
> Suggested-by: Haibo Chen <haibo.chen@nxp.com>
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
