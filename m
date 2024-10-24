Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0635B14A62A
	for <imx@lists.linux.dev>; Thu, 24 Oct 2024 21:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729803699; cv=none; b=LrTd6z0fr5o6tqeFAZKOBatOjuG7IHjW+sDWF9CofhqpnkoUIZsewoJkXMvS26BUeTm5sbJH0PguohDJQLqQ5lfjUGw2ik41OKkIiQS8MOOQEBpVlw6MyBR/PtXccXL1dq7GPt4wXVeyiT4Nh0ZSHR/t5+hyUmFgxidjlm59/eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729803699; c=relaxed/simple;
	bh=uv7hyJ4FTR31Ja9uZHyKgXxSqgj6zZHZZ1kWSBNG9Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2tzkMmttZWn0TIZLp19XHz0ytj2eug3TrBufNZmqU8Dj7hidHGuWxdW2r0Lzf3QLhKUz9yMGs8XWUOusgMOHfVtwUvAJPo1CKY7kRzIiLIzQR2bK4LUPXYR3fjBxWL0dPmE9nDuoElQDjMWJJadk81EN/Fm2JX5zNQkU/o7crE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gsP/eNkA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gsP/eNkA"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43159c9f617so13686485e9.2
        for <imx@lists.linux.dev>; Thu, 24 Oct 2024 14:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729803694; x=1730408494; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vVeHxFOlpm7vmwFphRpkxStlmC/W0v5aNc36nSPpWmc=;
        b=gsP/eNkA3M4TeN8J2/dC/O4qJVcL5b+XDgvvQRmFGFzZT09ZCc4etaxQsvx+uVkTzl
         YjFTzoulOtr01z2jPtGqaCTudItXCxv1ZHlfYgxVm6q2sE55mldd8RSNObeLSBs7Iwwc
         AxNRDSerrKhTm1bBEOMd7MDx3OpVLPRSUDr9qRYBEjgSzP25PmaV/2gvyZCXVWhXLJJc
         JkciTLCGjEMsMwouzR9ihdfJVbA2/ILr2EAMsASeMLgGHqNqEbN5TNZL8kOLpIB8cWkC
         K2GNwuu469DCjNvoAHQL6gZaJrhwK21y5GipSQ8Rs5e05Nolk3W753bW4zf4y3y9c5ey
         +qCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729803694; x=1730408494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVeHxFOlpm7vmwFphRpkxStlmC/W0v5aNc36nSPpWmc=;
        b=e4TTljY2hojteOsBshL81xVZxPJxk0ICf7h1ky1oqrGFGD6hVqtF8WeWtSOicAfWJJ
         WlL1aUvm/r94uoiPXlSzUURyOfsv1CqukN3a4kUXqX+upc71VXsvd/yuwGgkNXp/ZkBZ
         1j68JeuGnmiAqK+nRgSmCFzmxOEHDhcptaQK7xWxY5OgzdwX6ZOFi7DVwFGc/tFL7dop
         R/NXs5h8fsj7ntlJlP/tQ0JkZbOPsflSkLozc8nwSrilgJpX2CpXARrA4BmiQQL7g9yt
         HhI8OFV54cSezjev09Nbw/D+VHVIi/XjgFMhP6xpLbflYP02eY3R1YMtbBd1GGoHB2Al
         3p0A==
X-Forwarded-Encrypted: i=1; AJvYcCVvdeAM0XWzyH0Fb5JhjrHeGDE4RPfKGEvxXi25zZd3jTcN05dRiUYSNqcVJbtUROLWKmg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfcXcoswn3o3BCp7W8LnlYmgkE70KJycxZd42Jqnbu/yKnX6bK
	2xfldWzmMaYW9/80DlyJRVoUwouGhkIWpI0voaMUMevvSQo5t8FPJPIkUW+Sy0E=
X-Google-Smtp-Source: AGHT+IHGL2Dd1tCBiG6JOVa+iPPOY+Ojg8AJron0OjLTDMAI3qhPj8i7GxizFBH7+p2Vte+JfMZqgQ==
X-Received: by 2002:adf:f80f:0:b0:37d:4956:b0c2 with SMTP id ffacd0b85a97d-380458f2712mr2168793f8f.58.1729803694102;
        Thu, 24 Oct 2024 14:01:34 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:b203:5494:7e5a:8c7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37b7dsm12123329f8f.24.2024.10.24.14.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 14:01:33 -0700 (PDT)
Date: Thu, 24 Oct 2024 23:01:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Erik Schumacher <erik.schumacher@iris-sensing.com>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>
Subject: Re: [PATCH v2] pwm: imx-tpm: Use correct MODULO value for EPWM mode
Message-ID: <wqjwdjqsjn5yngbkdpbinwtonxdpugy6n6nide7fcodhpto4hh@7yxigtrvvu2n>
References: <91bfd0c1726d2e6d10c96a3f2e141a7315b08467.camel@iris-sensing.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vghwwyw4ni4jtc4u"
Content-Disposition: inline
In-Reply-To: <91bfd0c1726d2e6d10c96a3f2e141a7315b08467.camel@iris-sensing.com>


--vghwwyw4ni4jtc4u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pwm: imx-tpm: Use correct MODULO value for EPWM mode
MIME-Version: 1.0

Hello,

[dropping anson.huang@nxp.com from Cc]

On Thu, Oct 24, 2024 at 06:41:07AM +0000, Erik Schumacher wrote:
> The modulo register defines the period of the edge-aligned PWM mode
> (which is the only mode implemented). The reference manual states:
> "The EPWM period is determined by (MOD + 0001h) ..." So the value that
> is written to the MOD register must therefore be one less than the
> calculated period length.
> A correct MODULO value is particularly relevant if the PWM has to output
> a high frequency due to a low period value.
>=20
> Fixes: 738a1cfec2ed ("pwm: Add i.MX TPM PWM driver support")
> Cc: stable@vger.kernel.org
>=20
> Signed-off-by: Erik Schumacher <erik.schumacher@iris-sensing.com>

No empty line between these trailer lines please.

> diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c
> index 96ea343856f0..a05b66ffe208 100644
> --- a/drivers/pwm/pwm-imx-tpm.c
> +++ b/drivers/pwm/pwm-imx-tpm.c
> @@ -106,7 +106,7 @@ static int pwm_imx_tpm_round_state(struct pwm_chip *c=
hip,
>  	p->prescale =3D prescale;
> =20
>  	period_count =3D (clock_unit + ((1 << prescale) >> 1)) >> prescale;
> -	p->mod =3D period_count;
> +	p->mod =3D period_count - 1;

This looks bogus if period_count is 0.

Best regards
Uwe

--vghwwyw4ni4jtc4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcatakACgkQj4D7WH0S
/k4v5AgAoynsE1256Znci8l+VfnrzUQeRlgpkK0Dq4OS63K/RlHB1OdCuHwilJ3l
bblW1Og6wzb8hW/yic+otowhI+bH5gN7w4g+c2r/ktINgpKRQjAgg6vr0QGcfjj2
bHVxUoHZDyzwyfWT7bcDQcjp/Zm52nvCCdqe2e0247fKvFeXIMLOM2965MqHrpH5
BP23T5KLr52w1wz9OatP3YMG6blO9o2V+5qnzDo7qzs8c5vWRpwQWoS8OzEzJplQ
B1ldjt5+0A2exi6m0WjnNjt3YcYLbvCgrEt6TGuaYCHRoq23t+gDfofAQcpx/BLi
iY7/d+uS99AvcDUkbIQHNxk0M8i9Eg==
=HA4T
-----END PGP SIGNATURE-----

--vghwwyw4ni4jtc4u--
