Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701C741A4F6
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 11:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803907; cv=none; b=APhp5xpBgpOIXZUvrz39BDeunqqQBdGWuN+fw8M08SGq3SbCQ8GwaGdTjL211thaIrge3CMS1POHFl860xG50e+D0+cF6zoOERoHwlHgvXDzrVQTYfn1iB8v00K+ffgfq82R9YfsooXIHNu7aSYfCTIHGDIgBcCIQUUzdbd/Mo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803907; c=relaxed/simple;
	bh=20jkYx8ujzIk6V8EjzGICADAn/dtFkP5yiHUM8K7JU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdcMXE/5JX+dVVH0ClMx7f4LQAaF/gmV24UugnQ8LDUdS5W0nYvBCG/mXaa+rCD4Ri70X4EbHUmRzRNlAaBvKyiPqTvYP53UfmqqQsVBl4w9eRgss6uMWhobqXzTkqZYM2wRddeD9nT1R0YnVuo+LXvWAFelVVXydovYnReE3rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=eA/nh7As; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="eA/nh7As"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so10803925e9.2
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 04:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791803905; x=1792408705; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ojX3hkGfX4or6LXO9A1AxAUN8SUQm9XePAgC0Ad/Cog=;
        b=eA/nh7As3D4FZTpDe+HAJ+iZSKpxTKehxyn3+nOx0wV74fglLtg72bhIBWpnIy+dZr
         WUwxKLVaOkuCl2HMlBD7pOLmGpOOJPk5RLqWCL7CkcG9jxo4lnd0x6yZVQI++hOokG6I
         pTj47+9Hisaro7xTYJ/DQMRpf030y/l0BO57HEOUCVOkXuCdsWja4DKTrQLcP6ktKBk+
         u7pO9TCNZlWmrV1+GDShid2nNG+QAYldg1s4zRS5V9UUoQDVXTVAK4mMePFKWtkGUqYc
         vz2S0hJTtVjoj6WA0lZf4RFbJL0turHFGWIv11/PdEhEI5R3uIJv7NMgo68mifb1XZPP
         l4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803905; x=1792408705;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojX3hkGfX4or6LXO9A1AxAUN8SUQm9XePAgC0Ad/Cog=;
        b=e3pyIUbcaz4L2lv8zZ4gpQmmBzveVyOPWhkKa+FjgP8P5cmDaapIKxl7oGIbclsKGu
         t2+YuEODNaJuGhQm/Z7Kh+x7GIRo59tv59O1fI6suSDFg6jiDf1M7igenpHMtuC6jv/Z
         SIkoAohJBGsjOpz1ODuxFhkTh1QyhYFJDWsQUpGzWzuTTtzlEhSGul18NnKrLLa1wOuK
         4lLI9xtdmr6TJy06iSohC5DgAoqvQKGvFZWjiEUCUk+yzAfyR8C76loiB6tRXmd9DGs6
         jCX6RwbvTeswWXiJwMlikvZYeIGO1AMh4poHTnKMRl3Am1VmMkfbJWXq5k+Pn5apipJU
         mPTA==
X-Forwarded-Encrypted: i=1; AKwUvBzZQ2/bcyqO2UCSmOYGkAjRI7DMJaVobdEhb9iGUe3sib6UnBH9YooUJKfCzBK06EfHjRw=@lists.linux.dev
X-Gm-Message-State: AFq9FYKfzsJINPFIgi+kxjoyUQhLbcR5GH2XTxlvjTVdgO0xQ2Crmn4O
	BnklbBTxEDQFZv8ROFl7EvESUfRZzCDWu7WLq04fCpFRf2C6I97UDoKb33+uHUGkII4=
X-Gm-Gg: AYBFou0YysS16NgfH7eBEow1ksuD0pSi2E1fV0JWqg0btSF0VTahSp0O7SPUlyPfzVp
	1qeQCUjfqVhgRp1+ZPP3PG6L+wW69POEaZcpfX1TJ8Fz+r7lBnQpz2Qg9vGr0A9d34IT+i3PGDn
	OcH7As/bjn/ehDrLQ5LaPpWXzhbdJR3g3pslyW9McxJVWPzCQc5HKf68/Q8VtyH9biwZQ77RauH
	jPnBIY0iDGNa3av2QsuFnPmlzFho+DGU8X66S8vX1kmin6+gy7OTOc9AnXCRMxi1u9TinPIHS9l
	L/QoaRZwGleF0Vjogddg7azUdI7zYHm9eBjT6AuLV3UcF8GmblhRWOSNKJP3G0zVlXrRSF3q/O8
	B3pExfhiQ2ZhoHNqMfxTf6OkDAk3oMw9AfwGGdB4+BusG71FVhiDdFBzEYD5oubXGDChHQE4Fn+
	/HWHALnAg9RVwd3qNip8Au95Sjlt2mGXsXsHPvJPXVvSVqebBRGmBi3JH/I4V1G9ZnU7fFNiwyO
	uWiphuwepuYviqJptlgOW6SZK9ymTJjVoji+PvcPUYWQmgqBxbv+gu737qp7Q==
X-Received: by 2002:a05:600c:6384:b0:4a1:7741:ec43 with SMTP id 5b1f17b1804b1-4a18e4b8966mr159157835e9.26.1791803904585;
        Mon, 12 Oct 2026 04:18:24 -0700 (PDT)
Received: from localhost (p200300f65f19a904ade4f69ba751c34c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ade4:f69b:a751:c34c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18bb68abfsm311754435e9.0.2026.10.12.04.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:18:21 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:18:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Ying Liu <victor.liu@nxp.com>, Frank Li <frank.li@oss.nxp.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v10 5/9] drm/imx: Add support for i.MX94 DCIF
Message-ID: <aszBIkBXoFIkkeiL@monoceros>
References: <20261006-dcif-upstreaming-v10-0-bcfb28de0aae@oss.nxp.com>
 <20261006-dcif-upstreaming-v10-5-bcfb28de0aae@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cdga4qrbhoxcfsbx"
Content-Disposition: inline
In-Reply-To: <20261006-dcif-upstreaming-v10-5-bcfb28de0aae@oss.nxp.com>


--cdga4qrbhoxcfsbx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v10 5/9] drm/imx: Add support for i.MX94 DCIF
MIME-Version: 1.0

On Tue, Oct 06, 2026 at 12:22:00PM +0000, Laurentiu Palcu wrote:
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>

Please rely on linux/platform_device.h to provide of_device_id and drop
linux/mod_devicetable.h.

> +static const struct of_device_id dcif_dt_ids[] = {
> +	{ .compatible = "nxp,imx94-dcif", },

No , before } please.

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, dcif_dt_ids);
> +
> +static struct platform_driver dcif_platform_driver = {
> +	.probe	= dcif_probe,
> +	.remove	= dcif_remove,
> +	.shutdown = dcif_shutdown,
> +	.driver	= {
> +		.name		= "imx-dcif-drm",
> +		.of_match_table	= dcif_dt_ids,
> +		.pm		= pm_ptr(&dcif_pm_ops),
> +	},

I generally don't like the effort to keep the = aligned in such
structures and don't recommend to even try it. Still more if it's
inconsitent from the start. Just use a single space before the =.

Best regards
Uwe

--cdga4qrbhoxcfsbx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMwfoACgkQj4D7WH0S
/k616wgAm56cItlrtTGYJGQMifXXyKIZEbNaNh8obfuoDdC9KTfL6OrQDbETA8n/
83AtYbd6RkC4JP7NX3SK5DlSDS/oLGmxynxAfceKMBWsUcqR4oEpGee8ZRkIFMYn
BL355LaaGTv56+1iWN/tYDLNYYgKV+jwUYXmDJferAy0J0I1aTlYgEYMNoCJGGxb
ciaSMXRD1FzuAb3vpJpUvWltH2+boMSdeaKoj6ZblcP2sHWtw4UWN3b1YEcrSVcl
zMXusjBfMNf3S6BQ3GHOW5axtmRXjnPsqxXPCouSaEqqAahemWk+g7rA/4XF+Xax
302ZWP3FujxCr3/FFyysMyUncNGZnw==
=Kiiw
-----END PGP SIGNATURE-----

--cdga4qrbhoxcfsbx--
