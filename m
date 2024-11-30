Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EB51A08AF
	for <imx@lists.linux.dev>; Sat, 30 Nov 2024 17:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732988258; cv=none; b=gbrmQSZoE39IQZ0Tvd4nlgQYDfAePr9L5htQvQCdOnqNoshvVCa4XeK6i/rshSdlBKlL7ov512VK/h/spdotVBfvp8Ah10iE0hYcc57AcZWtLgxZq8ssXyAGMsRWN2h2JJA8vbPtU10dU7n85PSO+Khnm+P+lhBTZvvp0Mco3xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732988258; c=relaxed/simple;
	bh=7CM5G7Xn+7l5Qz3KuLpZNfYg9HsfB3Hv+/ezrxcQa9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q5x+t6yz7eyvtLpSFJLFop08iTUlw7dRxsvnDF9LMiEPVX2TxoKueEuE+2iYUlZbUX+N4zXzSs2sKwpQshuMz3qtSFAmur0i//pfYUYNgKHlGMtcKCAFOxXT8ePqaVFjd7MjK+GwabUQ0+I5JAScaAQYMEaUN9DNlGrve1aKy9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=G7Jb5UUa; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="G7Jb5UUa"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so454375f8f.2
        for <imx@lists.linux.dev>; Sat, 30 Nov 2024 09:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732988255; x=1733593055; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OHsN6TaNp1079VuBOcy+ma3PsSKaKXviIRckoZ4F6Sg=;
        b=G7Jb5UUa7mJo0p0XwcjmLTwIrGlJnVNF54D5djqikrWcQy8uNuFMvKbNXodrYijOC+
         IdN1t2mLmzlc5p8CDTMtRpVjhHNxHCCrq+Xrh0jumo0vPhBWJZBVtr9Fy0fR/hJwAde2
         ELW/nrtEu05imxeT42M2ZzXG2bGVc1oBgl3P/iYIh0k5DI0u9iGpA082LD8B6k4g4mKU
         WvRaZSOVHHBy7YMYJEDYCXTFpztW/U/PJphOFonNJLAYDYU+BMhPRZygYI74NpwYix/0
         PVW2JTnUxMc/ZQmYWYLYg/ol38FCEm6pmDWZHwd6SI8Tis3RVrKyN7tX9bfXbrkIkt8N
         F/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732988255; x=1733593055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHsN6TaNp1079VuBOcy+ma3PsSKaKXviIRckoZ4F6Sg=;
        b=Ocs9n7Ra795G1nsi4Xb67wMUCQR/W1i+RyTecjXf9ciYC1k+tk/f99mjjKAqi6SASL
         of+GjYVKhITwsi1NSoW9L8+C7kXh4adBTx1m+q/m10M9+YrvHXfPY91W+/3foUSVd3tp
         Rf1XFaUVS6oxxtEjCQD6KvKcDgFEB3DxNhhAVXytsAGvsOgy8Tz1SIpiS+9li6VpSzpH
         eLtZpXnJmRGM1US4XdztfiWMspdYkMnF5q8li3HXIT9mWCSy2tYx3FgkCHOQleJifQSk
         wdgeLP691cv9JI7SiI6hM/0ECVM1ChRMaJsmaBSVy6uH5Tn+PpSpP5smvE2J+xOwIbP2
         vqMw==
X-Forwarded-Encrypted: i=1; AJvYcCX4ciwNlzVRepYgi9XZ3rpwnAHjauetY/kC7mbeJ1ZkNMbxOwTr4yNnQS571cDGruJTZkk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8iITsZtcTxNzmk3V8Hylp32rLTmVJi/jwvg/Nwipv+gaJLqFi
	oDjTE7K/Fe+R8+VHh5v0ZY4BpugqmracBdERjMo89LC4fDyLbThVthhUTM0eXv579vnLGM5+9J4
	stdk=
X-Gm-Gg: ASbGncts1QejZB/OtTvWqhDj+1yzWQTGglv+EeTlychxZrQlSkK4kBPxJtLkLRKNCUj
	T8AkSXNFuG9RaS53glVVTm4rxqAEahJGmNmXJ9fNmWMtuUrbbNQFZuXflvYFaopUB1IY7eo2r66
	MZKkvoG6S51icMOn4GClatsWobzuUVpCHfz4oyi2LbrFkrtkkGJJ7LAD/ise+mRGzI8wQT7yYO0
	ptuhB6yKWzybQ4XlvSkrbtAZMU09fWoPWKxjwgqHJ3A2PG4VzoR0Ck=
X-Google-Smtp-Source: AGHT+IFwFQ2rSjeB0u3yaS6t10AI+CYIIMAsPZIeMkH7fQN0rD+w3+XGwsQFyRldnEvjiwCvxiOdhQ==
X-Received: by 2002:a5d:59a3:0:b0:385:cf9d:271d with SMTP id ffacd0b85a97d-385cf9d2858mr8248469f8f.21.1732988254848;
        Sat, 30 Nov 2024 09:37:34 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385eb10bf7esm453594f8f.14.2024.11.30.09.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 09:37:34 -0800 (PST)
Date: Sat, 30 Nov 2024 18:37:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org, 
	aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com, 
	dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v4 09/19] drm/imx: Add i.MX8qxp Display Controller
 display engine
Message-ID: <gyt3z6jisr4cea4wwk32hgzbatbczibppgrv6copcl4qo2chlx@w5kcqulhoe2p>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
 <20241125093316.2357162-10-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4chv2ajqebpzf4n4"
Content-Disposition: inline
In-Reply-To: <20241125093316.2357162-10-victor.liu@nxp.com>


--4chv2ajqebpzf4n4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 09/19] drm/imx: Add i.MX8qxp Display Controller
 display engine
MIME-Version: 1.0

Hello,

On Mon, Nov 25, 2024 at 05:33:06PM +0800, Liu Ying wrote:
> +struct platform_driver dc_de_driver = {
> +	.probe = dc_de_probe,
> +	.remove_new = dc_de_remove,

Please use .remove here. Also in a few other patches of this series.

Best regards
Uwe

> +	.driver = {
> +		.name = "imx8-dc-display-engine",
> +		.suppress_bind_attrs = true,
> +		.of_match_table = dc_de_dt_ids,
> +		.pm = pm_sleep_ptr(&dc_de_pm_ops),
> +	},
> +};

--4chv2ajqebpzf4n4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdLTVoACgkQj4D7WH0S
/k4Tewf9EssJcTTmbhrMd+Z9OEMUakhfq+ufnw7+fdnL5bSz1UG4O6BpXKdSHEOG
3GVGRRTto7bFTDc8d6AjAymdKak5N9qoiKUvbjXBcqqw/yrQnatqoSbVaGXl1AhM
bC3ACa2Jk+hpxBLZ0ADQNIsiTHt1JsD25oyDT+LdjtBWwGcao8CWuPNQY9vu/+np
jeqbvSKy0ZxJyb9DtQkAErXp6TDgbDIus7W/t+SER/BSZVQuZQH1cZ/Il8Fyf41K
jlKO+ARu3pWEngcNyxZmR5mUzZdh6+0Gfoy31/tdmao58gaN/fLFirQ0NruQFDEM
3M2Ee3lQXE8MXaOGn2uhWj312eKAZw==
=RpIh
-----END PGP SIGNATURE-----

--4chv2ajqebpzf4n4--
