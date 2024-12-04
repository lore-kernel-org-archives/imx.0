Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D11E20ADCB
	for <imx@lists.linux.dev>; Wed,  4 Dec 2024 16:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733329572; cv=none; b=O6du3pKehCwJesGpnnPJuxGko4DCho4SO1sYmS5aadR2mf3aXiuG9lU+fQRlZmI+TgGD7n7yvrunveQ4NMTjuMeOURN3Dvj49Dx7MLidGRZUOPnblI/S+S+Rn64IQtoyLfW+THXRBo1qMmwa9uTq39IyK5r/vfaFQPlin8OYl84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733329572; c=relaxed/simple;
	bh=CySl2OhgJgVkeRcK+TzjcCOnqGEVHnmeriCYAaYqB1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1n59D17XqQLMb85S+97qtAbPy0SqF6TBs7cHip1yQaHWKQE/eRNYV9qOvtyQlAvUQhgAO7qPguIcBMt25K13YUfcPy9twVUHM5z9raE1NcpgOaTBAwQ1K6XF5pFXHfmRky922dx0lhPf7uobTDkdIAHUNAR3tzDBZ0gJd7gV00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mi1uQulA; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mi1uQulA"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ffa974b2b0so69819051fa.3
        for <imx@lists.linux.dev>; Wed, 04 Dec 2024 08:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733329569; x=1733934369; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=avsElWR/fKi9kOjnFO0ifEAxNLupFUHqYpFEY06aggo=;
        b=mi1uQulAJJRMB5EX8NhyKub6eozXZeLp/mKGDBuN4InKcH9+H089qJ1zIc756MMlWn
         MT8/kxf0gOJ3gnrkkrojL1y8Sly8JSTZNpvt8JAvbPF9OSUWMnk18DJ9XAc+0oFtDijs
         XkkrIEVS7ChsJtwVJEFE3zaVww8uJsWceqa4dYnkF6zFiL9NHXEdl5Gb+k1nM0e0p5vS
         6jadBVfAJJULQX8pCw5FdNnruntK/G/QSqffgq087x+s/w1VbbEqEkr+V/6TBVr+FaSA
         kXMdNarYV2ythVJ490knl7F7t+0eG+qct9tsZuP7YqtV38RtGm8IrJ22HyOd2py5afLB
         bK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733329569; x=1733934369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avsElWR/fKi9kOjnFO0ifEAxNLupFUHqYpFEY06aggo=;
        b=Jx0rJiV99tN0WkK1U9l3bFTE06RSWkPqWJOYTSJv8PwGyuLPcMkuzn/cfb+/XxOHXb
         KYTIfQ96Wf0aBFtsOnSv2wR11t/peyCHVf8H9OD6wOyUe39soD3Sd2iEtULENdwV7I5e
         kvUuZoyxbFVQapb5vJe48SP0GHhGd5Mpx1mpAR0PV4mVJ7RiiyvKXgFXE6gR+bJE5HLD
         fqWjmnfg4flk6C96CuIFclKepmDqJQfC4yCQBK0u/e6GgcYmbCknQ4ExvC+mW6juI26Q
         6MDhd3sdsBdQudhONuwYaoRMgvzVsPCgkfVsUAU9QkC5jaMV5xs40QPN83lKdl/Slxy7
         0COg==
X-Forwarded-Encrypted: i=1; AJvYcCXQcbrfhyuDpmFM2VCvPxLjKTClgBJ7+BuRVpaAc7crJVfeTET+GA6Jbs/izLySITQS2L0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwDKMdJ4l2Hw6GZa0t/wWM9mN4B2SvWBGzebsblOfc9UfKVmy2
	7sZ1t/0FXRCbWU6Zp2dPWH6GIDLM828CxpW9e/8ACJotIXfrz11l
X-Gm-Gg: ASbGncuDwr00YaLRPA/fNORQBXmOV7nOuT8jcTmVpyX4g08CHJVfb32uJM4Xn1CAaMQ
	pmImQG6HHL2XNnbOJ8Kit8jNqjUN+NJZTOaV6nhrYDKqcyX4EIv9OC0nQtaq/qZVgdFfWFNZynh
	B+l31gt7xw+uZo6CPygbSIOBLQHJ0qR2YzkrnXZqR3PpBcE8kOhPY1pqykWsZpENbSyR6ri/Uwe
	2RG66rVRCfOBHGkvSpnryp9Mr/SJAXnUo0wOgh6ptcbIHxEQVumuSgvzECgpe45OYBwiefkCNPQ
	ZCU4R49d4hE=
X-Google-Smtp-Source: AGHT+IHZ1hSLNbyVNKzBWLLPkHij7c2uDQguaytbWO4jC4VLwSaGA+Z10qe03u3qav3/qIqYzj4nJg==
X-Received: by 2002:a05:6512:3b83:b0:53d:d41e:b1a8 with SMTP id 2adb3069b0e04-53e129fdd48mr4338645e87.20.1733329568568;
        Wed, 04 Dec 2024 08:26:08 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f19csm2252958e87.150.2024.12.04.08.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 08:26:06 -0800 (PST)
Date: Wed, 4 Dec 2024 17:26:04 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/9] ARM: mvebu_v5_defconfig: rebuild default
 configuration
Message-ID: <Z1CCnGZvuBLZ2k2P@gmail.com>
References: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
 <20241204-defconfigs-v1-5-86587652d37a@gmail.com>
 <303c44ca-879c-477c-a96c-9741bf3bf31a@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kilpMY/xPkg/Gz5s"
Content-Disposition: inline
In-Reply-To: <303c44ca-879c-477c-a96c-9741bf3bf31a@lunn.ch>


--kilpMY/xPkg/Gz5s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2024 at 05:04:25PM +0100, Andrew Lunn wrote:
> On Wed, Dec 04, 2024 at 04:56:47PM +0100, Marcus Folkesson wrote:
> > This configuration contains obsolete configuration options e.g.
> > CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.
> >=20
> > Rebuild this configuration by run:
> > make ARCH=3Darm mvebu_v5_defconfig
> > make ARCH=3Darm savedefconfig
> >=20
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>=20
> You probably want to wait until Arnd big removal patchset lands,
> because this is going to be immediately outdated.

Thanks for the info, I wasn't aware of this.

I will give it another shot when his patchset has landed.

>=20
>      Andrew

Best regards,
Marcus Folkesson

--kilpMY/xPkg/Gz5s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmdQgpcACgkQiIBOb1ld
UjLPcA//Y76oK6kUD1ojWaB5BoNve4LYgzpwUuIeHXLEpw6zWShBHmqs6RM3dzs9
13xOZUPx4wFAWbYi06fdTM33ep0akpMgVwbNG6z12mI3W3MbRsz/CZ7cM8oVTTIo
NViHeU9Jk8EZVX1udBAFToQIOeO5v1TICeBQF8aWhaNv5MgUNL6H2hQ/AaHxpjmv
P8Trltk+r3A4d6g0ZcJ7LvQcIdePls3jPwnHMNHcb8YkfPCwTAo3mqWm3N9mT/SO
CdRsblLyGHBqu+c/9bgqAZglgyAi4xjIhWJVBwdqVn9AgHRsKwmxBkX6Pa3dqr4l
5P+PBnoqv/CAtlO9nakNDPu4NyeYJ8M6MkKU/5wjcVIuTNnsz9ntcdsJimmC48y9
F9HI8xvUpJjiRtd5VnrCbU0fbw1nh2G6kpCArhsgmpq4Th5EAZxhOBV6yV3ClzJJ
5zXckqwRG9XbFZMQ5nuC9J+qIzyjqTEfIKEgOB+ZlbAs4in0H25z02z7wmUVvkNS
yj6neRSyB2xea+W7wkSdIcxH+1WFH24AdV6nxyYtzZjrLAT87yIf+EUQUJZztk7H
plJs5NLilJBeeKsgC0Sj67Z//MtLLv+3FQZmyOTZg9eI0qvVd3A1SKRQLopTE2vT
oF2TutNMWmnnauYXBXta/Kk2yC0ubur3Ne9bYG4sKni3yEI6WE0=
=vnf8
-----END PGP SIGNATURE-----

--kilpMY/xPkg/Gz5s--
