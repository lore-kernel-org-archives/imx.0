Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010806;
	b=bIP4zF/iiAoijLAIHCjU3xD+caSnfJRRzRiJhVl3SLEqfBtWeexSRVPUA2YYFqY1wiAc
	 +4RrCyjy1Jhd1MG2H8RTM+ZRPvsJ5ec6JuoLmwo9oCKR16qnefgQ1vr9xuM2/PdtzoWZr
	 5prKwETTWDKn+rm8DkRknbUx7N5GO6oBFs/sIbF6Jd7avD2lxnZu0hBI7r0M/zSCuiaOi
	 9J0lynq/ll9RsbrC1HW8C/+AfNu9xELS3vvqVh8jIBMipiTM0tLnPc32tq5KUE+d21zrW
	 zkP6RJVK6HQt5o5cnL8V1zLHlTqAb/VpMI2nYO8Zu6QMf3FdR7vcRkzTC0R7SyMB9oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=O8kUxWwNMGGKdJF+2JBGIvhWCx8VFS9Gq0fs2XPEP3c=;
	b=epmwTBRNh8l40x4PC5wiRAOJ7E1HXY8RbC/EqN0R94ELeMmC6CGLW0Ui5Qyf2OdAUNoE
	 5JQ/GKpj4tC200xCe0ZbNW9iHnvSzZ1BzTKarNYfFmMZVhtkZi/YfLy6ri+FKggbXj3sk
	 BYYNMX/6ExJFl5kl5fnSG2SfICeFyum5UczfZqKsUBeG9UyuCy12nlfiGpPPJNM9Cw/pu
	 +H3a3Yn128qE0ckxvmBRBBm6s/tVMeYxEaS/ey5GChqsVba9Dq5Ane/E0+t/Usx9I9HJb
	 wkCz7Ud9TjIqHPpc7miDxqUM0B70WWWwNSQh2nKzvXNxRxrC/YU07k0Q4nEwUmw1zRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=m+xbdE2k;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8DA606A32A
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 14:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F8DA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=m+xbdE2k
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so8953125e9.2
        for <imx@lists.linux.dev>; Wed, 18 Nov 2026 06:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795010804; x=1795615604; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O8kUxWwNMGGKdJF+2JBGIvhWCx8VFS9Gq0fs2XPEP3c=;
        b=m+xbdE2k5CCVtpBP577o2tkxcRdCBv8X0ubrc4Nn7qvC4s7OT1ONYtLDkxTy81wS5s
         XLRxhavPkNIyPjaAfZ6kanIOp/tyFL/uG4Faezv5bA6NYiFOnyy1oPi3XQBSvAMea7aK
         ltrHwWADMWOV1HqENeFcmmHZOUlHBXT0MtECSc41tppkRmtQbVOd1Iw+W/9bRFPg0xwZ
         AfOa6Xj4i9j5ebEXys5PkCUIFA6nAUcOmu3Sxzy3pFSURiCUsqKkBSDMD0t53bG7ur2+
         ydjYlSXuGjuc7BAbkG3yeDi9kwk4d92sCO9wZLm1CgzZa+DWoaEd/Oy3RS6bWfeG8hdq
         GTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010804; x=1795615604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8kUxWwNMGGKdJF+2JBGIvhWCx8VFS9Gq0fs2XPEP3c=;
        b=R4iyy2uK4ZUo3IBDdtK4K5CEH0QWeErxnMAz3PZ6g8O37k9xw1R9wDrWW6LqPhi6tL
         t7aXHx5MF97x0IDpEOySD7emIJPPR0lvi/4+QtfUpguzDEGZO8pqwHakvogmN6/XtwYe
         krFx8jB4H0E3/TVYkfKi+nk2WlZJN8aLkQQRb3Vd9PWhjw87jwxAJPl4zFnt67Te49P9
         3yaLZ9+U19MU7cSdTSuAhG9fkJ4QTCfgn6/B4tW9+CTIpnL4noTOZCd93N1OlnynwRHr
         /i9OOaJXF+J4EcmiBgd48c8Fubxvus3Cm76Ty0RJiqcerjsWCTlzJ4dCrUOUBJy6Q6tl
         f8QA==
X-Forwarded-Encrypted: i=1; AL+hErEvgz7h0iY8fVIQxNku6G4z6xsyQSLV6HWUQg3vGv0J7sE4lbuVSGi/y6OH3WTlefySVWs=@lists.linux.dev
X-Gm-Message-State: APuU4Z+OhOYARjLbiKwOLZxZH1QxlmxHQhnjdueT4QmaxlVg3OP68BTB
	Qw6BV2Ei4ixVpuWiylE9e5sjFrX6tnY9ZFi4BmXfn+ChSBS235tFYkNR5qwggQG5qAY=
X-Gm-Gg: AYBFou1f18zmv+k46g8Hd0gPRqRtv1Nt4Ab51vT6VUEzbY9nnagibkui1qj3h3kXeQc
	01Pedz+0j+5Ee7+U3UrwPmsRkdtEp61cGjheHAzS8V9XDbf7YxApUV4VlVnFTSOe+wpqBpsBTKI
	i1X2jZokeA8gKtaDeG3vyrgNlNoOoqcUo6hXXQowNcaH5aSQ/UVI6Sr9OzBLhb1T7As/H7qP4vx
	v+bZwv7RdCUB0EdLHzMDmpKfEB15ytPbk+hq9TXf4/0WY0F70GRizpTGeIXTDkgeW5v+VztVKF7
	mB10hky4bC9xMgFwDr4+T8Q1/yW5Q0KMt8Jopsr+RooLONENy6YDx9s4l1koMm/0Xsug9vxjDaG
	Tw4CoaECHQEd1wfS4l0Wk5HjmLxrGpMhu+RrG/T/Y7JfKAApwBmkmFJNBi1dYX/ernIb0XMkKa0
	s59HuCibc1CRC/QOGzS1YpTJW6wSWpx4F4CnshG+rX+7eGpYQcYUoUYHCTRmh9PcdgluJFycWdh
	ETYkqphES2vQUTmVjAeQiy1uXgKQCacUXZ0mzh1dXB/W6sqqoONlUDh7g6YNf8e8L9WSZvT5dJ5
	5Gmc0QTD5dsjvkWb0l+JrZbxOCt579SZvPo=
X-Received: by 2002:a05:600c:3509:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb7da03954mr52120315e9.9.1795010803953;
        Wed, 18 Nov 2026 06:06:43 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb7d256f64sm61534715e9.1.2026.11.18.06.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:06:43 -0800 (PST)
Date: Wed, 18 Nov 2026 15:06:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sasha Finkelstein <k@chaosmail.tech>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	imagination@lists.freedesktop.org, linux-mips@vger.kernel.org, lima@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 9/9] drm: Unify coding style for *_device_id arrays
Message-ID: <av2rKJQ0AKU9CFZI@monoceros>
References: <cover.1795002467.git.ukleinek@kernel.org>
 <a2d5ce256b8ec150de4a6494c177b19693a33222.1795002467.git.ukleinek@kernel.org>
 <7692c160e418e7ad0528739fcc879b11fbac8ab0@intel.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5c6ped4sw6nigwko"
Content-Disposition: inline
In-Reply-To: <7692c160e418e7ad0528739fcc879b11fbac8ab0@intel.com>


--5c6ped4sw6nigwko
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 9/9] drm: Unify coding style for *_device_id arrays
MIME-Version: 1.0

Hello Jani,

On Wed, Nov 18, 2026 at 03:27:40PM +0200, Jani Nikula wrote:
> > [...]
> >  drivers/gpu/ipu-v3/ipu-common.c               |   8 +-
> >  drivers/gpu/ipu-v3/ipu-pre.c                  |   4 +-
> >  drivers/gpu/ipu-v3/ipu-prg.c                  |   4 +-
> >  254 files changed, 1155 insertions(+), 940 deletions(-)
>=20
> How do you expect a patch of this size be merged?

Using b4 am :-) Honestly, in the cover letter I wrote about an immutable
branch and offered to rebase to 7.4-rc1. When trying to apply this
series on top ov 7.4-rc1 there are only 6 conflicts (1x modify/delete
and 5x content); these are all not so hard to resolve (and even dropping
the respective hunks (i.e. resolving using `git checkout HEAD`) is fine
for me.)

> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i91=
5_pci.c
> > index 84a7dc6ab5db..faceb3de4fa3 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -870,7 +870,7 @@ static const struct pci_device_id pciidlist[] =3D {
> >  	INTEL_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_info),
> >  	INTEL_ARL_IDS(INTEL_VGA_DEVICE, &mtl_info),
> >  	INTEL_MTL_IDS(INTEL_VGA_DEVICE, &mtl_info),
> > -	{}
> > +	{ }
>=20
> Personally, I would *always* use {} instead of { }, and would rather not
> change.
>=20
> Across the tree, {} is slightly more common than { }. IMO changing them
> is pointless churn.

It depends on how you count. My statistic looks as follows (on top of
next-20261117):

	$ git grep -l device_id | xargs -n 1 perl -g -n -e 'print "$1\n" if m/devi=
ce_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*}))/' | sort | uni=
q -c
	      2 	}
	      2 {
	      6 {  }
	   2598 { }
	   1262 {}

So over all *_device_id { } is more common by a factor of > 2. This
series fixes one {  } and reduces the number of {} by 37. For only
pci_device_id it's:

	$ git grep -l pci_device_id | xargs -n 1 perl -g -n -e 'print "$1\n" if m/=
pci_device_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*}))/' | so=
rt | uniq -c
	    159 { }
	     32 {}

Without the context of an array initializer there are many empty
code blocks (function bodys or `do {} while (0)`), empty dt nodes, and
{} in Rust code, which IMHO have to be considered off-topic for this
statistic.

Best regards
Uwe

--5c6ped4sw6nigwko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr9sOcACgkQj4D7WH0S
/k4vggf+PQfM4MkbLgaQRCdXRWWsc4/Fa0tTMBQAl4gjx2p5NE/N7TDUO571o3+N
oWcelzY5O1uRcc2qHZVnu3vAxFqzk4YHfGjsbGHsxQAibxnIFW7ttYTzt0w5a9NH
v65V6+sebCdwLrPVE5ilcqzFFSgmnv1wTNm2vCEUxdKGacifySaGRmg4+ax+fLb1
CL+RS7fM2EkQxG1k4iDEPv1Onrm9S4DtwTts0wxkK780rWYD9FoSLjHyX/x21Y8x
SZKaXeNZlxtHJpQLq8ub8AL/t6k82nC020wYZOUbUmvPyqxhNoUuuS0/RVlz9xT6
kXiliIwWzcMtAKt4ik8nbTRO5JERhQ==
=0alU
-----END PGP SIGNATURE-----

--5c6ped4sw6nigwko--
