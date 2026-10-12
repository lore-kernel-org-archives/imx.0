Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A8F361675
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 09:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797284; cv=pass; b=cz4mV9nmxBYsX2jEHJE8jOfI09Tv9q48YsL75oxi5FrrybbE2a+O2E95hjgtqwVEgBld/ma6S/QqoUFQ+oPlUNOtwVNnghFwzWlrhO10SJ9QSI7+XsENdQiajDJObgqZ3g4JUGRINwsIUFhnJP4iY9+hB2IVY2K3nXUKEcQEXYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797284; c=relaxed/simple;
	bh=ZQmvARbCgXiJ/YFm0TMPhZiaIp+RRWfinoq77aEij7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G4OuA+ZI0XHtAip0rGwBOV4T7t7Smjxi2jNRrWpGzOzMI3cOk9TX67/q9ZCEV0OmsBjof2Dt3pmGj+MzzieCP3bIXw8pqXdt7w9saxNsosPsvHgILHN+S75poysbTYRnlHnlNS5+k6G3jfBx2jnV6tSCiMWcQm0mUG6x0sJ1skg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeSeEjB0; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeSeEjB0"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a1585728b5so16270001fa.0
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 02:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791797281; cv=none;
        d=google.com; s=arc-20260327;
        b=g96Fn1qt8RqlNmfPafKSVMTSGRVDVEEa9WkPFbXO6CciwQ91Ava90D3e5pfsHm+eay
         IieHCfptLD421ypJtA5HRtzKs4FG00S+TgAlurNKeU70w09GsYVSGJS2f0rdhflyR0OP
         L7KILeUZx9+7Gcvs6nUTx2sF3z8AvJ3uOnKyS+37Y1I1P7fWuU9Xx/2oIr10E7kRa9jb
         s5DHyA9vz7RHkF2T4UtpLA1wU6xgMqyMWz2fUZnP+1Tf3JSRED8KLNjSDXOLnBhKbjJd
         KdJZXy6+FZavCWj8Wqx5GZHhZuDkT6gMC+SjxVmLrcPKGF2Y3ej6aPZ8cTp3dGm1scYs
         DcYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DvmpQMhsElKYIhMGMYI2OVNGAllui7WBWbcRWxS8qE0=;
        fh=cwEepCniHCzvhaPaPW/sR1dTlFGa1Bes/JKcBi1jOVM=;
        b=V7ZVFQdbUlwh6zpRpObjpF4LjULCT+RlFxP2/VPqtrx32RKEws8Lv02/UmJ39KBrzy
         Z371iVv32nm2fGLhiaRHOOyKNyz0MELaBNht3aIGFib0yl/zejcwAActLmHekUYak/Vs
         tS9k2MfjldqEut6hTnSm+KfFf+1VCqASRskUym3kMBMWID00N+X8ZNA4vtr4YfPRP4gQ
         GyILFHkQOPX+7clWojNRVj0r0TFId663DGHJWZQYhn2ne8bHyKhhhUzpwTXRll5XvHzP
         i2f656P1BqS3yltZiMkppbRon5PyW2Pl3eCf1A3ZS+hkGHC7RYd+24fWuC/u3hdPK8B3
         Yn2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797281; x=1792402081; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DvmpQMhsElKYIhMGMYI2OVNGAllui7WBWbcRWxS8qE0=;
        b=jeSeEjB0DEJUwsAdepRoMCA356HZTxqph71SSjqf7HjIKNCR4ukJYQu8Bm2npipBZN
         TwVHuWp/YZ4BtwmwJHXA8aKN/qCoP53Eq/CdzdGLuB50Re7O2oiKxz9bWVekxDh9S0cr
         8QRjOzILnhHz0jIcAaxeIkBMpYW791pCYFM0BGYaaw068N2VD/zQZUbL+lBwHbRFmcz6
         X8i4uMK5p4rcf8vA1bW9bHmXowi6/tYnHNPHqRw1XhEvZ9ZhsVobFKKmL5bjfxzCVqFh
         FdVKOso3ad3ww/JCDMu4L50ahoKm+7GLwtbAXWrthhhRIXQHS18giun7iTU0O+XevJTP
         N8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797281; x=1792402081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvmpQMhsElKYIhMGMYI2OVNGAllui7WBWbcRWxS8qE0=;
        b=JCHp6C21tjTIR/NioJ/zss6jP4+ONIpcan9WfrsR33gGxUxUA3ViPT6Z5dHAhIdQgx
         huRV8xrW7qhi3xUae+TVEh/L2f3Ac8ziawl1XtCi2GY8BuvVoqAazECscWecCvZ8YZ0P
         RVx13DsD9p+NyGxpKLWfhPgxewfpEujXZsIOZgp7bP+bPc95POPAxvVfJDr96tfQgoqO
         wik7iOSmrteintbgVOrtqREpWlKd0CeBXFpr6NR8yaTgXeL47JqOEk1WnLmkml8bZxPl
         DLDu92pA1eGT7Kywef9z0BkBPkSCVaqAqd8S1xx/pY+X6x1NhdG2VuL7f6pHK5tMOe+x
         Zc8A==
X-Forwarded-Encrypted: i=1; AKwUvBzDSvzEFKqhYCxQGy7KNBaLDY7ZmIKh5FDE3Pnd6yYEHFNn3SZG4zFP2WTkl7bczDXMWOk=@lists.linux.dev
X-Gm-Message-State: AFq9FYL55n7ej9nYKxr4Aac4Df8gf3N0mOF86VlD8Uc+CAidfqW5Fn26
	05Hcp1dkgiypkFAOy5bCrrD/YhE2+YETr6cwhTgHrGwztk/Pnt+eUXSJsU0AhQFmp91IuzdT0wi
	jupTaIm73nHgg3rwbltI/Syvv9rKX4Ow=
X-Gm-Gg: AYBFou0XZhHbC5KT6ypL3JkVJc0aDUmkHXdMyZmwJltp/XxKtnfk+gANfM7tVwliNFn
	Ub0UlsznBsI60N7QcjA+2DcmFNnucWwjZSFgNpTPoayBQ2SG+e7HVEcG4k9Xm+OdO2XTnQ7Okkj
	3J7twmXYK+Jl8+zenSbSLm2zXYNFX2CifOyKyoP5XEjT7ZhplG9RuD0yrY16xWcVJSLXnezLVBN
	UhhxSJqP4aTDiNklu4rh3zQUPwDOFRXxhCNGL6lYEEj0vbgXlDafyZxaUBLbmjnEFwyBCVh9Ns6
	gWEu673l9vv9H8Zjx1In9jQ2CpiRVZsGySeVRZAQCw/mW+RwB9smeULtBMeRkweZ9X5pJwJIH3k
	8OarjAFVuMzPuBm8cAXiZr69X3nw0gTdxm9wsx2NeEn2N+CpcuHo6BZTVOIHxZAE6swFLYx2KT5
	Zj4/VD+kKOz5gqyq4aWxE5ta9IIYWe4MNfxkeQwHzkxjGOpJWDGGo=
X-Received: by 2002:a05:651c:2105:b0:3a9:7244:e861 with SMTP id
 38308e7fff4ca-3a9c512683bmr23826781fa.3.1791797280833; Mon, 12 Oct 2026
 02:28:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:27:24 +0300
X-Gm-Features: AclHuK_r2Y_fKFcYo0k3f82kRis_dPW1IUC88HSmLwzwEEkzairYJHYuqRzAsKY
Message-ID: <CAHp75Vdkh50W7j6oh9mg=DqyNu0ZZYX-aA0goqW+Knf0MmJ1ag@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
> of_device_is_compatible() on every invocation to determine pad wakeup
> capability and i.MX8QM-specific behavior.  These properties are
> invariant for the lifetime of the device.
>
> Extend the hwdata flags scheme introduced in the previous commit with
> MXC_GPIO_HAS_PAD_WAKEUP and MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN, adding
> dedicated hwdata instances for imx8qm and imx8qxp (also used by imx8dxl).
> This replaces the repeated device tree string comparisons in the
> suspend/resume path with simple flag tests on static per-compatible
> data.
>
> While at it, clean up mxc_gpio_generic_config() to use a local ret
> variable for clarity instead of the =3D=3D 0 comparison.

...

> +static struct mxc_gpio_hwdata imx8qm_gpio_hwdata =3D {
> +       MXC_GPIO_HW_DATA_COMMON,
> +       .flags =3D MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN | MXC_GPIO_HAS_PAD_WA=
KEUP,
> +};
> +
> +static struct mxc_gpio_hwdata imx8qxp_gpio_hwdata =3D {
> +       MXC_GPIO_HW_DATA_COMMON,
> +       .flags =3D MXC_GPIO_HAS_PAD_WAKEUP,
> +};

Okay, if you want to deduplicate that, make another data structure
inside hwdata, or wrap hwdata with flags. But really, kill that
definition.

--
With Best Regards,
Andy Shevchenko
