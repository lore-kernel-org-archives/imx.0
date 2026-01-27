Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D320B29E0E7
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 07:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769498422; cv=pass; b=ilpRAEmhDWKzTTwXFiQa4DI24rLfxf8jZWqbZFUoZD0OtRqq/3L8y9kCU6gKEE1fA9ljaaA1UwN60Yet+75n2iEDbfy6d6ZpFgdinLI8v+ncZCuNvDh/zgIZ4d2OTp16wC69SqRuHMMu3SUEHUlbpGTvpSkVzCA2ixepasotzCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769498422; c=relaxed/simple;
	bh=YMG4tPCm2wVq+It4Oh6OZkpOwTIQOkPleIu2cazCjO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b17a6Msja+bYOwNYTlOtpzKHD9gpo6FOkgqFCVhoWHq6enGU14232M7sgTNnRywD+JlSZTfJclPxawaIysd0GXzsDTLA/k1wqUvOqMKK+c7YR7Rz6VfHXvGCpa44OHWqyi4Up2vTOStFA7qvhTfyxSEP/bkOY2mY+Q/NkUCTdYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwK/x8Bm; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwK/x8Bm"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1249b9f5703so1422085c88.0
        for <imx@lists.linux.dev>; Mon, 26 Jan 2026 23:20:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769498420; cv=none;
        d=google.com; s=arc-20240605;
        b=bJeaqiXcGMPqerlriX3nWr4NTYsdNwp57TzBjGR+Ac+bFqahBL9ehqdC7YxXJ+INXc
         dGa/cYVh2d1RDHxRRULmclh0EnqgopyNVRRTh1I14w0A9Lsiyo5reFQPn5Q21HVC9Kec
         V11IPPhu6Tl86iFFZKoWUeZRlyrPTOwCk/7ff3+g1onGg79N2rgSi9esFqIG4u6c9/fc
         L90NtgeK3pZSUvykckFuG1Ks8a1CR10BStXk4Hp+O04FPgLEE/ce9wm3kXs2pMNOfjy5
         SZLKgHlnwHI0IWaBnYR8HcWcxgDYAzGlqG/QROv32PYjmskeB1iFCMCj+ioe5aVYAy3u
         aYMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UP+mUbp/HODYFS6sc6VTtIV7GbMmQ0JMHLMxJM8aRDw=;
        fh=4jiXJBw8G0Mov/D/cUBl3/l0pDwO2Zb+GJwvodFvMxU=;
        b=hUiFhDb7nFZTbpQ5op5L87+oqeJOr5qSS8NWiuU5mHoiNa/WeU1CCJUQIc+F0hHGnL
         Uu3fPRqKZWf1Ki0ZV1OaHveRvZ2sxICzwhrlQNQCmdvaDqXhXa0U1PoL26eTBu9zd6ct
         OQRru8wchyQ6kWMBzZVfJUhidP7E2Pn0XkJeYgSi2psN2174Y/bBlISLmnGzKirzvAnZ
         GGvrQ9RSsk1Kt3n+KAANR71NNPKFk7qz+PPrld87oqtdZoh90WadVZd5ob76C2vdBOmF
         4wAnxF6tU3khGKu037AJNdgbD0m4JarfxHDNui047Aqd0iphFXoEKmnZlAPNhN/anI9w
         isWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769498420; x=1770103220; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UP+mUbp/HODYFS6sc6VTtIV7GbMmQ0JMHLMxJM8aRDw=;
        b=fwK/x8Bmv2Ip25kN2q1rfkcQe56tJ+iZn6f2w9gTWNkjvDpf1lSEyAbiA0S4/sF9BX
         pnmiQr9CqjhvWD96EjYWAPbREn772IV+eBTQ5OFupAq0/ZNHAWlocpO0zvcq9+E6VI4d
         eh6FYzOxmH6lnrex/B/3uVA6ZUhBPXgLY+2MGhhRT3d7MRu3/BKtuMPHiCASOdHHpx48
         tUdMlo+60I+7Qyaln3oVA+5Fzn/kHasZlYHSGMX8xe3udK9j1Z2sX0XfbeRU7r6ZRzkD
         xLCbB1R1bZfzaqaM3hSDnnrs12U4FBgSK9mn1xDW1m/h2uD/ziYYEAHbF0aAhcPHUqWe
         7jDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769498420; x=1770103220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UP+mUbp/HODYFS6sc6VTtIV7GbMmQ0JMHLMxJM8aRDw=;
        b=GvKpAV1moJRz0waxS7TTJlR+Hvwll6X4Z/azrur3fPvMvXXmAhEubSzAfi4I2548JS
         xtNvH3x0gk7yIsB/ShOqAe6QUFERQruVB0VEYPfhqJvg6nfShrzvVx0YP/y2is+gZZyY
         FqvuBCcq/III6IOJGGvICfvCT7+H02UTR+0uMXH5mxmwqZkEdb7sf7py2nfYrWwqGe/v
         HmAc/1oRLpukXlfNipYvNZcjtVxWMHcNNErVEq+x1FAWwSrGMqrbkoCfq6P/f9MkaUkt
         dh+J5nDhLQyGzIOm/9ggKJ6dGiB4yTJuIXBNkgw0IO6k4l9ez89VI7cVC3yaYOIrKhie
         TC8g==
X-Forwarded-Encrypted: i=1; AJvYcCXTmjY14WsiQh0ldoMpId6Kpua0z48Hs9bnryCnCAlAtAkMRoZ44VEp45WK2LQXY4kl6Kc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7xr72RxCiPXlHozorvsjLorIMJwkf8SFgyHGw+RTRCJEJlWiB
	Gzldom894+VzOrGrsqDmx1wkGKxajXJ58ejElTNF5CWbmeKlji/JnisK+cHxkoeyMMAmA1UY5Yw
	XxlU3x9S9G1pKORU21+bbk1EW5c/iD+Q=
X-Gm-Gg: AZuq6aLBd6pAOnmU/GZgA8QDcxlUb4B48A242aP0AqXnmgBLGAhdZwIF5oTpWRfDGEp
	GClrdnKu761fGptJcAzHhooib9NzaG1D+JL8bzsdopk/bod79sJ6rOYtIXEMgeiDKcuzPWcwaFS
	PmeOmUFTSUNcUWuUQKNMi+MvE5T2KFFtWMsMTM9iM2SkfzuYPhb53UqWudRq5WGWRjDOOANIkrD
	IBW0Kpld37zUahk54rvmsEbH0Fr8gGnbe1zC6DD6CR9MN7S7a928qQYKAXyzTsZ3aL4ZvWBJhwk
	Kuf2S8bWdJD9kSz3B7ocpHsfvHvIroGin2y2N+qx8KMSB9WZpUy8IM9annhi5YOXO0Pi4rDk1+K
	R5f3V1qTJcudZaA==
X-Received: by 2002:a05:7022:608e:b0:11b:9386:8265 with SMTP id
 a92af1059eb24-124a00e4ef2mr592857c88.42.1769498419874; Mon, 26 Jan 2026
 23:20:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260127025740.2601841-1-onlywig@gmail.com>
In-Reply-To: <20260127025740.2601841-1-onlywig@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 27 Jan 2026 09:23:03 +0200
X-Gm-Features: AZwV_QjajkSN5Eu31Sb_5L2tR2fgv-siHFOW2oZdIrE_vROYKnR4g6BIl7DjWw4
Message-ID: <CAEnQRZBmexggNdR78p8yTnpReLKxuDC_LKZqpHvXLzSzkDbfqw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: freescale: add pixpaper display overlay for
 i.MX93 FRDM
To: Wig Cheng <onlywig@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	zaq14760@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 5:02=E2=80=AFAM Wig Cheng <onlywig@gmail.com> wrote=
:
>
> Add device tree overlay to support the MayQueen PixPaper e-paper display
> on the NXP i.MX93 FRDM board. The display is connected via LPSPI3
> interface and uses GPIO pins for reset, busy and DC control.
>
> The overlay configures:
>     - LPSPI3 pinmux for SPI communication (MOSI, MISO, CLK, CE0)
>     - PixPaper display device with proper GPIO assignments
>     - SPI frequency set to 5MHz for stable operation
>
> This enables support for the Open-EP Community pixpaper-213-c module on
> the NXP i.MX93 platform.
>
> Signed-off-by: Wig Cheng <onlywig@gmail.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
