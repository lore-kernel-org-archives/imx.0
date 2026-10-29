Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793284912;
	b=bqx9HXzhTzKuS7fqtY0fQItoj5wffp1jWNw35vFlIrpYwoNh6x3VRKd14rbIOGBNQORg
	 JTRmPxYswuLIIzkLYUXGKiwPjNtbXdRFiDg1QL40RWMNXDuT8MXZ1FKSNKpN4haNwt2CF
	 TVgNj7lZQxXAxzI8aAJsZiFBD4o2dfHBXz75aljxQz9Pk2/a6IpH6mUUNsHQjJCnKK1lo
	 e3HcM8j/mwY0tqTasqtihv2QJoj1FHWQw1kinWFEsn8Nv3h3xloTijlvqGUnp11CgHKJg
	 y5QCAW6McRhlJzSmY0SrFaoXnVUhBZDsa5MQlu6ZSevDR1FmLDEJZbx2dCqqzNoG6Tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
	b=09+Sdx28SbUPsZR6GiTTRRXSS1QbS5446I1vKBjwP1QBEzxy2sY2aixf1W+4POjiSrP+
	 zQF8M5OyyW2E+vLj11gcrhAs27kS4CNKgk2CNNE81+KPnAGMzOIUJJF/jVxIag0axqoC8
	 tMONRci9GoqMfOgYkucIQDiy2cPIEue5ap2cvz5/1IeTaEpIJmFBpykuAoi5rSGw6HgMR
	 oZjJsax/dubVt8U8BSsimlXibz+mfXA6e0kB9UVFACgH+yayv++DaIKV/oXWWCKArUxtK
	 3nU+NgHY+Nq+bHQqF3XR6IskO2ov32w54UU7O8ZCHktgBJHuulKhsCnnVyc6ujmFYnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KmSQ+B5F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE60606A31F
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 14:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DE60606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KmSQ+B5F
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c46822eefb6so286773866b.2
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 07:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793284910; cv=none;
        d=google.com; s=arc-20260327;
        b=BFdtXLuXIplMopQsdXTJMWwhcd9Jesy5XeeTmD/vv/lXzRH14femdmpbPQRLGedmT6
         U7OaVi/JyWfi4EcfsNqgLNPft5+R8idiSyLEte2q9uWOg6OSuOkZnQmRga+JpJ7S0Pi4
         97f2sSzA88IwcjYdXGs/T897PwqjjRAUJ8kaaNhTxXoVEk3mVo5ylQhuaFxHmaoC7Ke7
         OpnrolVqMWWyIKTR32Dwg1X6PmLQi+49qrWi44ka11ytngjXVPYFaaf6UwCaaIR0muc5
         FxPaRKJ09s7xab7v/ubUt5irBUSYczxQl3QqwZipsfRRYm/Q5fCcZsabCbrQ+yHQBYUP
         187w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
        fh=oSQlARNfCzxYVbSSBC6ycGPL8rpm6/7kf0I1mYG74L4=;
        b=hp9ABC+6qHfxy2WgKPqRgKPLvSSW7CEqYmWSqbVVseA6B3nkcAkEaiG5m+0c4dt2dS
         omd1yGVcfo0iMl8eJAzjfdGWyUlsTflWY8Z8bbIJMOVlFRnKup55s7Ac8f8NfGxnVqTz
         70BcZsid4PEUeG814oZ4Leev20+gxl60TneqcXp23xxN96f9r+3o4YmfmVHC06JDzWIh
         UIZG4xIOlR+KEOVNbr2YC6SueGSHbs/WIWduGwJ0asj38ggnjS5S0SfPJeIi3HM/k48o
         2la13sLt/V+M32omqihKnjLynT44VYX3/JGT4d1aA+tTHtDJIV9znG8YSzQ5yYlbGl/z
         vkGw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284910; x=1793889710; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
        b=KmSQ+B5FBhUYMyoFO6EZlCyaf/YDc8GKqfLyI1IMxVYoHKOu7Tzz6vnE+8fPxJ9yj5
         1Zsp+CAPo/w0Dp77R1nzwmMwqDFWGOfpCqwR/OAwfkFhKQ0A4afL+cdr5MB99TpXBqKo
         5qAN3gXnc7EkUsqVlxh7y6oppGp4FocZa/BWXBfdKQwoz7TGDCnS2TGtabORZajOKSSW
         0GkfuI4W51nsbv0BLIGw78Gy0AcZVSNB5lcepi0a2g8oOi50K99MNdsfu9ddoV+jkzP6
         65eXbI9Sfua13XDte4ISKXYOPG9wYrk6blS/ION0MfIswixiX2uOHg2AF0cxjCgMnXxt
         LhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284910; x=1793889710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
        b=Q8Ey9f77K/t2tnUKnyb/p2YT46BUEj4wm9+B8xUvdecmIm/M7Y5WUu93j4ezNj9qJY
         FM6KCu+1ItteY9NbbEtlF/OjybTUwUHrWdFoIoGq/EBMa++rksGtPHqFVUDUIGTDTl4g
         FsehAVVIE+MVcUb3FkfcZfDqglkuodDHP99WD/VB40q/58EIyL/MHj51/D9RpcF+Mhm+
         UR/rAhdfZcNuJRNMJ22tz0USGDPbr2hQi4kTJCm6G23guq6VCsXIz+w5qatgy5gYfUTV
         jjYvHVhA7n2bzicLI1yspbyYa+QNcZhwJjImWH5MQ8892i+0d6KeUK2IBHpiAtwwgf8+
         nljg==
X-Forwarded-Encrypted: i=1; AKwUvBzgzgJ+ym624bpiltKG6HSNNnemci3MvhRW48oaZ9UU55b4zSIgsrVD9y6QQru4QRGHx7U=@lists.linux.dev
X-Gm-Message-State: AFq9FYLZHjRqSlEUnHpJxsTyMGD/JsAtzmHpALZk13chR0NddkZOy/Th
	/QhjN44EX4fhfJIhiijJC/xuRbXNvMuMDEWesDIUjxnVhk/8h4vL2tvVN2crS4Uc99ki3bamRPH
	cYk3DOyqkaLQzXkfkYbYTwqGi8Olj+go=
X-Gm-Gg: AYBFou3XqcILSX5zgy2YxJdYS7WwVg197H0NzQRIg9lU+ul7yICn+zHTR/jFbyqc7Pg
	2Wy1E22aMGpMNWpaEwkwMVdoERfEGGQQPNT+0MXKmtQbYlGxrWjsWJyEn/Ce3FnKZkVxzrBDWNh
	JdY7ocjfNmUNkFigz6Sjs/QJjxLPQxIVFGITIHZbEkdcPkdNu5k40pG/rVKYLSk12jA2CrfwcHz
	MJOo2k/JT8ocbPOVsK1RDyrqpn396OiQ3g36joj+PI7xxuM8sjrII6nWzPb8nwSvJ7dbF3cI6IV
	1jntKJ3cd3iXg8SL8fwY1WVke1KIpDdUcKx8Iqr1F1f9reTg4iN4YsVkgA9PDYVlXTV2G+1Y61c
	DOzVwCjhyYJxLdmnT367vjaKJsZvabwyzC0pT+tm0eNPuUucbJjIesx8sSa3MRlVgHqF5AvdlRx
	Jmju5hgWfsCF4Ql9KZ6k86YOUIvcYdT2e+9/CNWPHv7czykGbm3uc=
X-Received: by 2002:a17:907:a88e:b0:c46:6a50:40b7 with SMTP id
 a640c23a62f3a-c49bdf25ef1mr512176766b.10.1793284909657; Thu, 29 Oct 2026
 07:41:49 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com> <20261029-gpio-vf610-fixes-v1-6-45b484b4c434@nxp.com>
In-Reply-To: <20261029-gpio-vf610-fixes-v1-6-45b484b4c434@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 29 Oct 2026 16:45:14 +0200
X-Gm-Features: AclHuK8IDt-muCciisOmWbSe4tpMQXEP57E_Zd-8ek8gdIf0pEg9SXZFYjLfJ5w
Message-ID: <CAEnQRZCT2ghW69zvZZHPb+GHVLGFO=2A2hGxjuM0Phqjve8xgQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] gpio: vf610: drop unnecessary wrappers
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:52=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Remove trivial wrapper functions vf610_gpio_writel() and
> vf610_gpio_readl() that just called the relaxed versions directly.
> Replace their usage with direct calls to writel_relaxed() and
> readl_relaxed().
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
