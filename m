Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0097C2FD691
	for <imx@lists.linux.dev>; Mon,  3 Nov 2025 10:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762165199; cv=none; b=FoRzCMlaRCFqqaRgRYs0GnySMkPWc/P6Gm2FgR+bUYf54RMU7//jzY0WSgnsCDMSeX527TLhcwuZ2wMbyuIF9iWeTmvbeRGSGAUtm2mlSXeio4eaS/VR219vE4xV0HNpSwVcSkoi+jyLtFe2znyx+PM4H0ET5O0SVDTKHUBe7vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762165199; c=relaxed/simple;
	bh=4QMq9wjSZaDTE+ctoXegsLcWF3J0EDdGYn1winwZ61w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/coBDWucAPSUGBCb6biCunvCIDexAEM1ucr0EYy4h9PP6LkAyQKKltVLdWxFrpeiAmXEpckx1SYzrZmuag7tq9XFaOdKABuvZFOIWfBUkEx/TB95q7WsktlhdtlGDRMw3484Q25HMvHouBt0E3NHBzD42lHomKtTN4xzMl/h3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tgecgeBT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tgecgeBT"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4771b03267bso27997215e9.0
        for <imx@lists.linux.dev>; Mon, 03 Nov 2025 02:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762165194; x=1762769994; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yk/MqQKqZE9ciR/f+72baGg6dFC+oYSceyoJ97PjXtQ=;
        b=tgecgeBTmt7nN9etpG2wUxcpLh8NCXHBnWdseW+X1CB8P8ec4rQqkJpHD4P/feoQ+/
         1KrqNrQsVrAODVFJHaKpfQgMkbTN5YQqS8XFlx+TYolAQu+6t+b5/9fc4qIbjV76TvzD
         A8kp4rRfmm4PDjNUwTWFk/DfgXxFYxAbdtj8MHocozl8kj6fCapKiEtwh+fTnbLNrfJA
         3G2IH//teFmEKS+CraJoEmIE7CPYzyIAVxFvSmyEQ6YgGRz6Wj9XT9YVjgpOjJa0NGrt
         GdU5mFGdohI3CPqbtWcdbdRtbuBmU6rWdv5jKPfIPyk5PelxHdUv15DvtEiQoKIXkUEg
         5s0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762165194; x=1762769994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yk/MqQKqZE9ciR/f+72baGg6dFC+oYSceyoJ97PjXtQ=;
        b=gyj5yytZkfCJ6a2oVcwuiknem5QvGKw4RjNHt9aGllfqIeDXu3fmpfQmJgUgtqaQOI
         haqwq/v9lIvq7bTXp/Qr3g80qr7cwpj4kKlXsFP2deOJX3F+XTy5anL9bkm0OiOUgVzX
         4M0xtVXE9aXuqypiXQJMQsHSHWIqmw3uoqXLlHvokBYNsbDBX20zTlOPUW7Mvgzt6E0x
         jjbh8TaM6HhOoc7fUAz8kKM6XwYpf33Z1D6zlgQqZjXz3ntnagSndfuCPub9OYbgN4he
         ugMZwmLXYv1FNu5lmqSw7AFSNWodo1DUOawm1HvnN3n9WVVxVHLLhncHexSpdnV+H/c2
         tlmg==
X-Forwarded-Encrypted: i=1; AJvYcCVyhy8Xft7Dv5N4YSk+UqMAm3F5uxxcRgJhos85N8yamjbQG0snphlJ5jjlM+a1Dqjxz6A=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYedBC7EQa1lrucs9QIvUAUWmUlBDeqvlVHFtRxBwb2OoRuiza
	07MWhq6A2+VbdWe+VasI9C18htI4nLYMY0j7DweFRrN/RofH/c8t5ZSanZJ4Z85mROc=
X-Gm-Gg: ASbGnctnFTwo1BS0G/uvfZ9Ob94vA8rsbE7yVfeI8Y1Rpa6RPjTomVkx9J6+rqiqRwz
	+ULlREWOQ+0R+Kzx7juKsqULr+GrAQL/vY/hNlsfnkv/316+hCQzgZ5mxWsTARsDPcBkm3FpWBh
	pObUfwaE0/1xvTLv7v5BbqA9SfcRJkI11GEl+K4sR94Wdho8vgKwbm9yy296hu/u1xvxi0mO9ia
	UfSEqj2zL24XzkZec90bU9e9xCQOz8gmzyzij1aUhiiIaZhbU4CQOjT4F4xdgMsrT/kPEpVCl/j
	GlfZbMJbjVQFP+1TQF7H0VFL/8n4f+wUa1EZc9IQRxtDAYCrIFr0cauZCddl7/O69MoeozWsdEr
	THr6nR2PoCbY6DWNKgzZ4Sq8UXAzvR7OfPsLaEc1Syx3AveGFshKU3TLRKNjmGSNGwg98EtZ6DD
	8DB1+z6wDvBI7nGInc/LbpEVM8Ix3NJdVfNYky8UYSI2m78rpmUtEI344x08dBFj3vvK37snDCO
	w==
X-Google-Smtp-Source: AGHT+IHOtduNrRBMSHOgFwat+JbsvBQbjZA2f2jjaeArzvIV58w9j8NgIBsWYYESYm2z3s+D+nQH/A==
X-Received: by 2002:a05:600c:34d0:b0:471:1435:b0ea with SMTP id 5b1f17b1804b1-47730872aaamr92764025e9.24.1762165194241;
        Mon, 03 Nov 2025 02:19:54 -0800 (PST)
Received: from localhost (p200300f65f19f5043df592b151413282.dip0.t-ipconnect.de. [2003:f6:5f19:f504:3df5:92b1:5141:3282])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c569390sm144870105e9.16.2025.11.03.02.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 02:19:53 -0800 (PST)
Date: Mon, 3 Nov 2025 11:19:52 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "Krebs, Olaf" <Olaf.Krebs@emh-metering.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] Fix IMX PWM period setting
Message-ID: <vi2hrue6l5g5ihoa3rh2u3pitgbwiyvr5su6dhztg6iowajwfw@6rj6lh5fbtb4>
References: <20251103064813.522840-1-user@jenkins>
 <1b071599b84c4519a81990fbfe09782b@emh-metering.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cs2lqjurbk5vnplp"
Content-Disposition: inline
In-Reply-To: <1b071599b84c4519a81990fbfe09782b@emh-metering.com>


--cs2lqjurbk5vnplp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] Fix IMX PWM period setting
MIME-Version: 1.0

Hello Olaf,

On Mon, Nov 03, 2025 at 06:50:20AM +0000, Krebs, Olaf wrote:
> From: Olaf Krebs <okr@smgw.emh-meter.de>
>=20
> If a second PWM is requested by a driver before the first is configured, =
trying to configure any of these results in .user_count > 1 and thus the co=
nfiguration fails.
> Fix that by only erroring out by additionally checking if the period is a=
ctually configured.
>=20
> Exapmle: Using of 3 PWM channels to control a RGB LED.
>=20
> DTS-Config for an imx93-Board:
> 	...
> 	led-controller {
> 		compatible =3D "pwm-leds-multicolor";
> 		multi-led {
> 			label =3D "RGBled";
> 			color =3D <LED_COLOR_ID_RGB>;
> 			function =3D LED_FUNCTION_INDICATOR;
> 			max-brightness =3D <255>;
> 			led-red {
> 				pwms =3D <&tpm5 0 1000000 PWM_POLARITY_INVERTED>;
> 				color =3D <LED_COLOR_ID_RED>;
> 			};
> 			led-green {
> 				pwms =3D <&tpm6 2 1000000 PWM_POLARITY_INVERTED>;
> 				color =3D <LED_COLOR_ID_GREEN>;
> 			};
> 			led-blue {
> 				pwms =3D <&tpm5 1 1000000 PWM_POLARITY_INVERTED>;
> 				color =3D <LED_COLOR_ID_BLUE>;
> 			};
> 		};
> 	};
> 	...
>=20
> Without this patch, an BUSY-error message is generated during initializat=
ion.
>=20
> [    7.395326] leds_pwm_multicolor led-controller: error -EBUSY: failed t=
o set led PWM value for (null)
> [    7.405167] leds_pwm_multicolor led-controller: probe with driver leds=
_pwm_multicolor failed with error -16
>=20
> Signed-off-by: Olaf krebs <olaf.krebs@emh-metering.com>

checkpatch is still unhappy with your patch. That might be (at least
partially) the fault of your MUA or MTA.

> ---
>  drivers/pwm/pwm-imx-tpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c index =
5b399de16d60..411daa7711f1 100644
> --- a/drivers/pwm/pwm-imx-tpm.c
> +++ b/drivers/pwm/pwm-imx-tpm.c
> @@ -190,7 +190,7 @@ static int pwm_imx_tpm_apply_hw(struct pwm_chip *chip,
>  		 * there are multiple channels in use with different
>  		 * period settings.
>  		 */
> -		if (tpm->user_count > 1)
> +		if ((tpm->user_count > 1) && (tpm->real_period !=3D 0))
>  			return -EBUSY;

Repeating my review for v2:
> Please drop the added parenthesis.

Have you considered "I wonder if a saner check would involve
enable_count instead of user_count."?

Best regards
Uwe

--cs2lqjurbk5vnplp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkIgcUACgkQj4D7WH0S
/k5zegf/ayuI0k1O/rvOwqgY2KX2snbmVt0zQXx+wWSvSz644LtOFQR+LgsDyy7u
SlZmCAUgG9sTXIZk8uCCI9YhccesU/1Tybc5sca7brEOjTlWzWVGhzliodTxVbYI
95iNCr3aNm6Lkhf6mfDO9FEVvfn7oTSZlDmeiBQyDaD9LDEVKyrHBbFC0GaEINLT
GFLi3KqbLbvJu5df5v2xnsLIwH0zaWj13fMV1oocCylH9tp+YB5tGLMl4/3Ygq9b
4R+YiqcoeL8cupykXBd0WR9S3lqUcIfME9FivoDTC3UDCTeNiMrDNgbF8mxOwd4+
39agoAx03n2Cq66N/ZG21wkBHiffjA==
=DpDO
-----END PGP SIGNATURE-----

--cs2lqjurbk5vnplp--
