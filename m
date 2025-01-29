Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E415A1DF279
	for <imx@lists.linux.dev>; Wed, 29 Jan 2025 16:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738168213; cv=none; b=LrHTJ1rikjE0V5x5tkpaIGc8mXvMdvMT/YF6bT7KkAJGExhuf9kVa9a3IwESJyBlbsLcbV+jxtK+cjXJoXEhDMjW147CYdve8Com9791oMhZLPVpY4x8rORSEmiw7/tPUvsoTfs8Tnsa/dT1OsOg8GOlo/XaAFCZcEgaH8tEPj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738168213; c=relaxed/simple;
	bh=kncPR1x+HrgO/UNoa6XCUy62lvyXubVaayCMa0/G3/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZxZ9t0RDISecuUuNzRgI0tU/dp2ULsGwtn4csynCYCHn/VMQy2Drurh5bHHXWC+5BIRMZlOgP5KuEF59kbLfsNLNbnL4cRx/z5y24KXNHgflcS4Ed3ZuBwZtnT8oh8MDt/BAZoN7GYY2K+iOQhK3gAFVhOhobq8hOmFV9wWB/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnL+q+zu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnL+q+zu"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43690d4605dso48255215e9.0
        for <imx@lists.linux.dev>; Wed, 29 Jan 2025 08:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738168210; x=1738773010; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kncPR1x+HrgO/UNoa6XCUy62lvyXubVaayCMa0/G3/c=;
        b=AnL+q+zuM1dN7pXtTBG/swVZSs4sMltDzjIWkdex/OCIaEb6rz7Q+Twtt5CwBkY6is
         rcVYcMWbK6EC9l9dXE8rwQZ00wMNVM/U983zY0uXgSIIePjSVR/bJSZvqDWcvSGxxQTD
         aUMLxSmpnMvmERVx5O/mFhlr7N6NZAfcev2sR4WsqezysqwpfdK2uyA5t6vxEj2759xT
         x1Cljxx1BhFBNoST87ozOFIr/OzjsSCufhV43A3nnbW06fLcfjjQSfcdDA/k7rzwM7kq
         qe6tqDUwsSXRUHSRRXGPdOjUlq8vOGOSlXucGSVTOZU7MDeKF8U2skw4a5xQ3A5dSTZR
         1HMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738168210; x=1738773010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kncPR1x+HrgO/UNoa6XCUy62lvyXubVaayCMa0/G3/c=;
        b=tsOAvhVpKSE1QZpFXanP5EpCjn/RRU93oNrk6oXPWhuUw6En1EsNGAyrBmYAETmZny
         nTcUt/+5qDFt4ZdvtV5J5q3LVNuA5C0atU+zM2NKiGKyjyVq1+82mSBHB5fPoDq7I2oH
         fZua3zdyMzV3ddAN7+jYPZM3mmiIKjgQxmKnyhP5z2OA+9x/FJJ5fwYEYPSJDu8eAKoq
         rlckPLkVv06154h0qll9wwaa8UCCDcfFptRM+2GUObcE/ukQZorKEbmA46tm/zoElZ0G
         axqth9AZEhuTBiquYkpcl0Xk3NbOOEEqBU3dhHe1k+pXVbU/0H9ZZ0frMchzE7ighugq
         NBew==
X-Forwarded-Encrypted: i=1; AJvYcCVfVZr1rCukmx6dX4rz07s7TgG2mossiXT5GWhx38Rlc6Zzh7Dd02Zo34iCZw2FF4PVRDc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0gc2uPKlZaZoLcwtnsSqZhiOdEumIDbHneJFXTWfjRDBuYZwT
	oMKPHYUXBoRU965UhQsU1hQx2riyeq80CUkjPXrvixsbAqsdAsFm
X-Gm-Gg: ASbGncs5OOLVhR7P1ZuNnOLWVdsmC0d9sx2qyKJSAVQozQVRSUighBbGOsWk/uNN2ou
	Sp2t6IRqsZ/NEtPqOJ3D5sDn57Xrlq9LWhUEKnUFeaf9Lirm24ZF+zlXmZHJnFVGxDKu+Zqjt2S
	aSx1QXiDljtwEUcJc/nvw4Zh8RRSx4ZMCxqJX3ocTYj9lmGHUTaDTcyt8+hREnw9iWmQijQeiK9
	+dkJBrXC3qCBwwr5AWKQ61O9aUOZ+U9YenEiy9KsPghc8gRbvwrKmfiMe3JDM4NVxf6eKsREdW1
	WDzxImMrwa6y9ILx5gZRodS6FibJr6ud55+S5XeQTKZHogqQMH8B+jS8D+PU390ZqD6Di0lk7Sl
	iMQ==
X-Google-Smtp-Source: AGHT+IFm5Jm3zy7mcGZVwWe1YgDmOIk+BMdUjzsviFL4g+X0VoNE5WMhP+abocamyyaYUsUSJGXvKA==
X-Received: by 2002:a05:6000:2ce:b0:38a:8e2e:9fcc with SMTP id ffacd0b85a97d-38c520b7692mr3030462f8f.45.1738168209834;
        Wed, 29 Jan 2025 08:30:09 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb0besm17773109f8f.79.2025.01.29.08.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:30:08 -0800 (PST)
Date: Wed, 29 Jan 2025 17:30:05 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
	Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
	Xinwei Kong <kong.kongxinwei@hisilicon.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 14/14] Documentation: Update the todo
Message-ID: <54mqpk7elbn3y4o4w5skiwbx6kpkpbsg45l7tfzuphf6rzziej@laywqtj7tfpw>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-14-0d1609a29587@redhat.com>
 <a389f799-442e-45f3-8609-2eb2f0b7a825@suse.de>
 <li2awsqmdoye3u7n3gi2mrhbfxs77e3edjmsg5zclnyjinsnul@2bjkc5agyu5u>
 <2y3lwycrggmktamu3j3gj65uco7quvtu7tlc3724e4mpokhjz2@icedc3kervme>
 <4jn3dfea3eb5yuqobjwvbzfxhwatpvvhtpxbmt6npyrypkyruw@mgtmxignyvt5>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vlfdakvgoj7a5bm2"
Content-Disposition: inline
In-Reply-To: <4jn3dfea3eb5yuqobjwvbzfxhwatpvvhtpxbmt6npyrypkyruw@mgtmxignyvt5>


--vlfdakvgoj7a5bm2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 14/14] Documentation: Update the todo
MIME-Version: 1.0

On Wed, Jan 29, 2025 at 04:28:49PM +0100, Maxime Ripard wrote:
> On Wed, Jan 29, 2025 at 03:41:32PM +0100, Thierry Reding wrote:
> > On Wed, Jan 29, 2025 at 03:31:50PM +0100, Maxime Ripard wrote:
> > > Hi Thomas,
> > >=20
> > > On Wed, Jan 29, 2025 at 02:06:15PM +0100, Thomas Zimmermann wrote:
> > > > Am 28.01.25 um 23:29 schrieb Anusha Srivatsa:
> > > > > Remove the TODO now that this series addresses
> > > > > the changes needed.
> > > >=20
> > > > While your series is fine, this TODO item is unrelated. It's about =
various
> > > > ancient fbdev drivers that do not reserve their memory regions corr=
ectly. So
> > > > please drop patch 14 form the series.
> > >=20
> > > Is it? Could we rephrase the entry then? I'm the one that suggested
> > > Anusha to work on this, and it's still not clear to me what it means
> > > exactly if it's not what she worked on :)
> >=20
> > The text in the TODO sounds pretty clear to me.
>=20
> The title is "Request memory regions in all drivers", and the first
> sentence is "Go through all drivers and add code to request the memory
> regions that the driver uses". It's definitely ambiguous if only fbdev
> drivers should be considered, even more so in the DRM documentation.
>=20
> > It says that not all drivers request the memory that they are going to
> > use, and suggests to add those missing calls.
>=20
> Right.
>=20
> > But all of the drivers in this series already do that
>=20
> Nope.
>=20
> > and the only change here is to convert them to use some of the newer
> > helpers.
>=20
> For some, yes. For others, it actually adds request_mem_region.

Ah... indeed. Well, on the face of it this looks like just another mass-
conversion to the devm_platform_ioremap_resource() helper, so that's
also confusing.

Maybe the right way to do this would be to split this into two series,
one that actually does what the TODO suggests (and maybe updates the
TODO to make it more obvious that after this only fbdev drivers are
left) and another series that does the helper conversion.

Thierry

--vlfdakvgoj7a5bm2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeaV4kACgkQ3SOs138+
s6Fc5g//QZiZGAOOwS/HvsPWCl3EAnXTtEOaH4XXTZswARVZDGZdl3jYwiZim7x3
Odn69X6NAQl5pFytjbexpzii+zH/UQZVz5kndydjXtK/JWz5VeXlKUrxYKMU+GEM
+9dEecjXOqKAtLPF/QyA387/Xp6qIIsQDHM5/akoAifYOd3TbuCl4AqBU/LYuGt6
F86Eaa7n8kChb6BpZ3Km6NfzkhJhTIw9/VZXxp21Y9izQUZuHAVvyt3e2hLr9L9W
S0XFv1mPAYUcBAao+vvEF3kJvrnVXjXDZnjVPpiKuJe4e0l2aDMNW9TEr7are4m5
8JlrAMkbGTKEKzTQlHIgKuFJYcmTyvqs4KBrxmX1bEqm2gsRqnNXl/7yvbY+s/s5
QSM9otV5y60e0IZkmuJjoEklKJ8SmyPgbrnb04ua2KQXrRvnDO+BQSWerziVyz84
6RNfGTuacRhr5C2KlI7MdELGzweRPD6TA8Qa3k71gpCXKg9063+1aRanPLWbpwue
vIBmrFZZcJRMxftEjPMRJj7IcBvIZY12Zij2eu7fWDaeXujcre4Apg3rClGnYxOq
RT0DHxbnFi9msAWdCAFZTUiyzyFZ0Vq/op7JUugsAq/nYKK9lXSyOdVvLd1Ojgm5
CBtQAEdJXMKCwmB5yb7bRv2ag/y/oiQtUsnkgViwm1FTPUFD+gY=
=XiY9
-----END PGP SIGNATURE-----

--vlfdakvgoj7a5bm2--
