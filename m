Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1426E2F3C1D
	for <imx@lists.linux.dev>; Fri,  4 Jul 2025 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620334; cv=none; b=WwZgDDaqegiwbkVCrCHX6iyDhYTbdEMKARJOhrl/kSIox3FVS8e58r1S31SoWzWpwbbZpNPnl0MwwmwJmvgHDSiVvNGOT/JR/C02jncCff5TjhC7OgR8vhDpDcNTefXF8yhp20kTEXqtaAZEQWWlFs2ng6kv3yaok+NS5FTkl0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620334; c=relaxed/simple;
	bh=6cDZJ3qB4J8b5zsWmQr2zNx2Y1qp7sgokKOOCeCt7n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6Q8yj8o3cSFLQ5YdVQ2lB1XuHLrHG1Tg3JmJivSxDMT9RU2raNuM/2BkS+IbPdawIE6ZcXsqnp8xtF3YltvIcLnhJ7XE8sU2GgYVL7PsjF2QU7jFv5YmHask30abvBNLJE6gAUa/FOBgv12C7UjwCgoEzQD82pKU2C+I7SULPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUUAnY8F; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUUAnY8F"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so997159a12.0
        for <imx@lists.linux.dev>; Fri, 04 Jul 2025 02:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751620331; x=1752225131; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KptkojN101D7RtN6vbUFu716Ck19MPKgSUb97X17FaE=;
        b=MUUAnY8FWU+wreKcWEN8420XM1ciyGnrhMKtuQQDCia41DTepdYLNPt2OL4XNkcstC
         Jk65VTQuKDGqNKTY+B3SCHqpl53UB5oyGSm0GtKoOUv7ej/EUwheNbTkTmDMQCQNg9JE
         ItAMCSbQTdOsuBHqlQiTafD0LAaItihR8iTcbVmv4LOAcjr/SaNL9aH7KSWS4QeYj3BD
         Nfl6Bs6lePwoz8kXZKGyohOabKqSocifzJt7v9P5y5c1axKrSPQ/OYP0jIbE4kuhG+g/
         AyrzmCFOSbQx+MlTIf+hKLqVJecdHlT5TBNU+0QNU0mpcHPZFsEAX5Eeu2u4TZgjxkuL
         EZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751620331; x=1752225131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KptkojN101D7RtN6vbUFu716Ck19MPKgSUb97X17FaE=;
        b=L/eEX5BGtH6IUywjKLq38Qt3Z2q7mlvYrZ5m59ngKAjMvxEWOec0YXQ9c0AyTbaj9h
         uzOV2maEk6cS8yu+mKAExMR/cT5fwQJeMfttvpBTAOHZDE36NMZVvj6UGM7QCGwO3D+B
         e2S0bR/sa2H5HJLVXq7C1I/1oJEGT/MgkyVqHlIK1PdaE0uOABI9EAdY6yGcqaiyG5Mo
         WvukdhDBKHLYwSNLga9AG7agA9dxRFiCxt35VwCqWeLH9ekNlwjl9hwqrsW35blonIE/
         6rA4yIW/annY3hW447W6a+cz4aF0aZy442faMc7WlWDcFQaVHoqLk2Iui/Q+vTQJL+Do
         Almg==
X-Forwarded-Encrypted: i=1; AJvYcCUjEFZaqLSz/CnqcwqtDko8k8UjQ905EiTxAlA0BzFZsFgBDQ7f7Wlxqq6iY3u5zPP0csY=@lists.linux.dev
X-Gm-Message-State: AOJu0YztpuTa5R7A0ylTRtVNuAil7qKCDcYLimxO4nU/urFffczM21VF
	FaNo6SjenqKRwTMlbdFdOzU9ANJTx7qPMK5ITGhMiw2e+o/CoVHXCU+z
X-Gm-Gg: ASbGnctfVi/T91KfNfnWS1F6oVduRmIUofqYRAIxjYuJquyPkpQIl+qmUs9wxaeH0UB
	Ad14nxjX5ydDEK+3aeSBr9w5EfqBA1TO+9F5agJj9IEs/8jSjBNpiC4kJ4nC7l2p5ugURQYJINe
	T/XUblGs/rNhnSCpsifWmHfR5Y57Pc1bPdjvzeWebZ0R2XHF1ozuGwa0ZO2Q8CblYlsHJzJAu1n
	GTfPOOnVTcyG9n9E/cVkNyBJAIaD5G6MeBZfalftvd0VqqTW5BSk9Jr9RcabhSZWQPYYfvJk44m
	HNN7YoyMbjk+ZvgEOMJUGNcUY+YIawcyhkw9qraf3CSwuMZJivaCsEGBITYXm6ANpkyIAfUfRVe
	G+KvtpJdsm6jBODRcDeUglOejCMB+bpu2XhwZ1RwZMDBT0XORZDfiMpsPJ7M=
X-Google-Smtp-Source: AGHT+IFdp3dnaPNX2K9juktcKvt9T7MKTZPR3ZqZ1DcevNm+PpERG7zIx/J5e+1Xs4SiNQ/M23vBdQ==
X-Received: by 2002:a05:6402:50ce:b0:607:f431:33f8 with SMTP id 4fb4d7f45d1cf-60fd6d90e62mr978981a12.24.1751620331153;
        Fri, 04 Jul 2025 02:12:11 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb8c80c4sm1016517a12.75.2025.07.04.02.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 02:12:09 -0700 (PDT)
Date: Fri, 4 Jul 2025 11:12:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Douglas Anderson <dianders@chromium.org>, Lucas Stach <l.stach@pengutronix.de>, 
	Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner <christian.gmeiner@gmail.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Qiang Yu <yuq825@gmail.com>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Damon Ding <damon.ding@rock-chips.com>, Ayushi Makhija <quic_amakhija@quicinc.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, imx@lists.linux.dev, 
	lima@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 20/80] drivers: drm: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <gh6mdzdl4gzs22zxfigdpbep3xcaf37fhjis5bvuvrjbxyxhkt@53hdnb53m32p>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075413.3218307-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="73fi2dtgof2ecl74"
Content-Disposition: inline
In-Reply-To: <20250704075413.3218307-1-sakari.ailus@linux.intel.com>


--73fi2dtgof2ecl74
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 20/80] drivers: drm: Remove redundant
 pm_runtime_mark_last_busy() calls
MIME-Version: 1.0

On Fri, Jul 04, 2025 at 10:54:13AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
[...]
> diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submi=
t.c
> index 2430fcc97448..5e0e76ebc5be 100644
> --- a/drivers/gpu/drm/tegra/submit.c
> +++ b/drivers/gpu/drm/tegra/submit.c
> @@ -502,7 +502,6 @@ static void release_job(struct host1x_job *job)
>  	kfree(job_data->used_mappings);
>  	kfree(job_data);
> =20
> -	pm_runtime_mark_last_busy(client->base.dev);
>  	pm_runtime_put_autosuspend(client->base.dev);
>  }
> =20

Acked-by: Thierry Reding <treding@nvidia.com>

--73fi2dtgof2ecl74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhnmucACgkQ3SOs138+
s6EwIA/+Lm7/OgfvX+wbCwmhCbQp5/BVsRO878lwGCmlqPoYL2WYHH/eSzmXSvUK
xb7ZYOHW0fzKZGrQhw4CoKbIEoD5so8k56hh1QQ0y0nlSTnW1QGrQjINcBXXen12
xKQLm3Iim4xi+haF9Bo2v0tpjEQynVvV2rsLqtanwUoo2ZUioMdNfDGVRtm+xShI
HAqxFVcL+aJEkbX1Z/3H4Nb1UKYe8tqXo8KurA3XuWDPGpCBPfUhgm61rWnq7DGu
OqKFeqdRAhEL1SMd5Ptl4qNV5vQHpjdhgpnUWL24Sj+DCSh9SrRAeZA5svDx/pVW
gFYa7SGUyHxt8GXmUM7RAJwTD2+DK1NaUWD5LtvjYFZ703AavEfPJcUULNZj25Lk
zCUs5TJkF9xOaJeosrm97c0515FHwcX/bRD90PTuzcvtXTpSPIR6NcGTvIzEV2gU
McLf0pU3g7TSh4VRi14oBS8mjPeEgFpnWbYc9VT2JwkE4WTzx3FBtC1k3auDQel4
s00mGYbkG+5LLz0SBCWnDdRB4tPYzytyAfnhv0MOBHhAO4EQ1GN6WeNlnqQJed5m
f5j4zUjT5xCp7d/ADR6ZqKH0OrxA1zTlZliRsxW44FPl5QHhozZKNP0Wqa7F1HQ+
mAr8c/EP9BLSaE2mF6jelG8TDZfTyTraHew1D/JwRkgK53rNmHY=
=z+c+
-----END PGP SIGNATURE-----

--73fi2dtgof2ecl74--
