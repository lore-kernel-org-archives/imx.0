Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EAB324B06
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 17:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769621265; cv=pass; b=adnohcA08NbTUw0eXDaJsBJQV3LQxlqVtO4S5miyfKq1J7DwBBkUxvbF9EqoM0hl3G33nNFnDsSL3cmj9h4xlUV8SnEDn+1RFz5g7WhuaDsh8LZn9B3no7kmFQziyPq181JU1Be5xf5BAudZ+dBWSK5oVK+wHF8lB/jCJsu2DhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769621265; c=relaxed/simple;
	bh=5RnEkCjzYpz4k2iW4MASQPKjHVwhosBVIbiwaiUkDW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OnBdhzOP/Kh95UaFH4DbNiz6lEFqNTy5W9p/Rkwr1R42zltKd+fHPME1YtWrXFF8yHNUF4+bpOwmBS3TqZiM1eanZDVU82tXEm2pbwRzeMLflHUts8VB0qfeoHoIJcUdLpU/FSqyk/QJWNK665hhH494QUo7vNimd6FQfbWPoaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmAFOw87; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmAFOw87"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59de8860b94so48062e87.0
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 09:27:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769621263; cv=none;
        d=google.com; s=arc-20240605;
        b=d6P2vmHMtC2JfxmTRDD+lR1WoLtVjNJ3uUh5/I5gPyMIq6b3WLw7Vn6gdHFLdvOYEP
         YAs1RSTbK6SmFQAELQMFSDPEcbV9oLtoVBhnSnK+KpifyjE/1n7DUpUsjDhCg0srHiEf
         STemVUbvgPCuVdvuHcbDI4a/htnObQos74BIEeSNWgGCGNpTCm8N2dBCcqoisfy1Fj2e
         mMUZUMyZGrmyCD+hXkerTy4jHWZYXhQp5S6WV25mPRY2CgdVk3HiQ4DFDSkCbiCEl2Yd
         aCPkMYurQKItdC22yXNmJBX9QAJoUdvUdEPbrXBc8j48OZta//0CF+5WyjtIBp0L9GJr
         /OWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PUaTn5YCYH1aGyPr+judBHKrOAYlextt2AGAL94fdA4=;
        fh=bF+JXLg3T3mr0CCSTlT7PPs0tNiFm04NMNUHHucHxEM=;
        b=WrMm0ylR7jLVlRK7OrER1BIY3DaYwV52QVP7aQdVwUbfqR53k3MmtIpN1zcNf3X0mD
         /HAEBBuNE55osaKsWeOTptHuHKTtUidDuVmlMhqHCDVwFUidHFFk7yumOVuTcLSXBm5F
         rSs+uFbFcj9EWNoG2LpEw6MYt5YDNKGcFhw02kUgrll/w2vz6j0zznssQCTG6X9mWPF+
         FqYWAi2MLhij1k+/GNjEN2gjvy0snXlXIywf0PYyBXesG6PAOqi88IeQkVBJ+dgXu2+Y
         82/OemOZ5mRG+2lfUkDJ2l8rLYCR7FRehzbp2OJceOJBjSqV6/GauEGdtLR3ii+Z7UxN
         XSOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769621263; x=1770226063; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUaTn5YCYH1aGyPr+judBHKrOAYlextt2AGAL94fdA4=;
        b=EmAFOw87zeZgg7NOBQfgLNVlXVV/RaxNN29M5FuIKw+owJtvr21uuvAkKr+8wVj3w9
         8m1i4LkCdF1BDqkX1VeJvch10RmlR8NmUsx1i9tUUhopqoMYmMpjlMs1C3BaYStfJXMi
         ABOZEy8ZOe7RRM9HTzBZnstO4Ea359vtKcBFyjXAZymudWa7P3eeOe9OzGWbPEzwI8Jc
         raxoGiEUMpzWBL6QJoJ0ktLj5/lsO3V6392lk7CHNAVDldlQ7/vIRHvhEyyhsBaRhh9T
         d8x/H8A+smYUQ/omwti8vukfpT9uxPVoHXddjB6JEfUTJFuv0MvfBr+6vDC999dz8Ygh
         +wBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769621263; x=1770226063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PUaTn5YCYH1aGyPr+judBHKrOAYlextt2AGAL94fdA4=;
        b=ZW65tfLwZqJBuPZSLuQDt8AjLwWRrKBMDTWxfg/Ak+6F83XBaNBgECl+G67AynAfPL
         RxmWEzT9JYiX0UEM86UAvbYmKTZ/fBp63MZI5u8YIolLGVfN6RZSQp9ALkQuSdbEmn/X
         GBSFDfMlDjxQV9CmOPT28WNt5oQL3NS1nTvU5uVmffSLQXk0RnL3xf/OtXxwEuD1p7Z4
         qLoV3i8xTiZ4Wudj+2l3z6C2Zm5cdTI5s3a1FLT/F5NS015eweSGi/pFilByk3rBXFp8
         WQdaW+Cb5+ZJFjJAcTXxF8oChHurJTXRodMF3OU+Vi+WpnVBueIWaPXanHVTM/i2XZco
         aZVg==
X-Forwarded-Encrypted: i=1; AJvYcCX7ByDXRAZZmSqZ34ieGHD3PuLdHYTAKUbzigL9w2mDBunZ7P9n8eEymSqLHDG8SgfxrCM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHT80S4YhRLqsCcWVwD+MjwkMDTZnXLDf1eqxOFY519QSWfuiP
	po2+9//DWTgApi9Jf3v8QoHE4jX9OABfR5X2VCEnKXpbNIPkHrzGXEIq5JhTby1t890GjVATdLw
	dwLx6efQVf40TwJyKRUQnzOvtzfkN+CQ=
X-Gm-Gg: AZuq6aJhOX7cCuL6hWhJ19edLcdFHavwgTCqvrqbdg+3pd57k0LeXsyH/WOTbJ8tmep
	mC8MAt7pj/2rRAzfmXVWimb1CxZQ8vTfbzqO1ftmIKLo6ixzrcCV1h6E2wCHk2Z1J1siSMs+/2C
	iKePy4hyjMIxhtSNcyxgEhcWahFipEt/UW+zMRfQ7rnbJToHJWQYHrz/hW4NH7IYvE2hIM0q+OR
	k6d+2AJjNtiYFriRsjNGc4fCmyRV5dMpjHLOpo34y/NBz4Pxd28Iyrcpv0Y6RJw/5qgPOD9Sj/x
	Q080s7LMYQqwyCuIu140Zi8kyJELmhNWq5H70A==
X-Received: by 2002:a05:6512:3b9f:b0:59d:d32b:1d1e with SMTP id
 2adb3069b0e04-59e04035516mr2970279e87.51.1769621262284; Wed, 28 Jan 2026
 09:27:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260127025740.2601841-1-onlywig@gmail.com> <20260128155529.3699599-1-onlywig@gmail.com>
 <20260128155529.3699599-2-onlywig@gmail.com>
In-Reply-To: <20260128155529.3699599-2-onlywig@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 28 Jan 2026 14:27:31 -0300
X-Gm-Features: AZwV_QiCWCfgEVaf466qIPBgCbhNFFu_DgTZRC-k1mWUAV0vRzvFYLXs8kt0N7M
Message-ID: <CAOMZO5BdH3X_efJGFyAjCk-1amLTDA303Lfr9NHLJMpbPxEJcA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] arm64: dts: freescale: add pixpaper display
 overlay for i.MX93 FRDM
To: Wig Cheng <onlywig@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zaq14760@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 12:55=E2=80=AFPM Wig Cheng <onlywig@gmail.com> wrot=
e:

> +&lpspi3 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_lpspi3>, <&pinctrl_epd_ctrl>;
> +       cs-gpios =3D <&gpio2 8 GPIO_ACTIVE_LOW>;
> +       fsl,spi-num-chipselects =3D <1>;

Drop fsl,spi-num-chipselects. It's not a valid property.
