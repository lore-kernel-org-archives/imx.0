Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02691A9F9B
	for <imx@lists.linux.dev>; Tue,  2 Dec 2025 20:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764706906; cv=none; b=AH76e4MfL503t0W1KKrGxQynYqxAHlnfJCH/J8edosYyIVmeFRBkhP+JsPGUhC01kn//qv4h3Vh2OR0XuUKjGHh7/m+IWNnhu/spi88OgatNKW3AVkkV8xh3PqAuezX6bsUkAoDdR28/mH0kqFby3VAy1sgFRN+9of/VhAk7Y/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764706906; c=relaxed/simple;
	bh=A0PSVgMbPgZnF/0MjPtEhWWUYOjFqFjkifaKlO/6NJE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ETHn0fqD0CWwWe+tIWpJuXDuGH7N+KROYEkZLimjGiSJ5ASukOEHS2cX36KYhDvaHIUc9pwGRrkRsLojFfJpxzaQ2AxG3gGAV71OCorZgmSRi7tWNxKoMKO8Jt3COArQxbBAkOARvoI9QY5Znid8jpkZW6BvrZo2qRPOTvsVBWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=IVMkg2xP; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="IVMkg2xP"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b2dec4d115so594991485a.0
        for <imx@lists.linux.dev>; Tue, 02 Dec 2025 12:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1764706904; x=1765311704; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A0PSVgMbPgZnF/0MjPtEhWWUYOjFqFjkifaKlO/6NJE=;
        b=IVMkg2xP3HXUb1idWYFcYxBQ85XfMU6FQf1v0XvtqB/g07IResqD/11ba78fmwimRK
         OzRhN8TEZvbtLwnLQdl/+9sXzk/QFn3Sdd87xzZbWa+r5+3geVrUSOM6l2NJety2BiEp
         nnXUc7mMXxgRO/2bRZk8aK3qUURM9rDHmHLXwNovRh6W9//QkUvoY7YDfS6WjaLJI9I8
         WdAcL9A00M6NrRy6MkmRAEB+9T3SPKykoT/86JdkO/E+RmNrWawoeF47XaUe7aPWH49d
         DJoPVqbwsdufCtyioxElkNoz3Xcwp4gME+cCs4VwixLaYUFU+wLix3ciadatacia+BBw
         nb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764706904; x=1765311704;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0PSVgMbPgZnF/0MjPtEhWWUYOjFqFjkifaKlO/6NJE=;
        b=NOv/6a4Fx5T/sV7cgOmeKg/og3R7MuuzEsLLDfK+GMW0UmufJ1JmAYlP2k0jHZr9Es
         Iw4dOk4VmTml5LU5Nsvue48aVqTNzZmCJPR4fVfJI4Z+yrXxXcXqaCPfdXD5rgrK6SKL
         erZj9nr0BK0QTTtJ1DwjOcw52ydn+nJ/kwWErwII0shUa6IrcLn29iNtqYIbaRJjzgUT
         E9iGv/8hL41XHVuksZ7EYnwSadcDdpfV+aDVqutlEOnEWzTMkzzfjXvUfYmmSajYBaDq
         q0gbt0HUgHzNWe2+yIrKGXmhEuvpDQf+NefeFd2VvRl98sRwe+vw47GAo3eOTSyimVdy
         o4Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVZ8wFouD5DRcDVaR4lmInxmWWxC4MMuHPhe1yFIEtPR4rz3oOucNClu8GeB/GJs7oHTF4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWlEGxcoHMWXpyPO4OOL5yT7l5XnkoLgayUGPq9FwEegpvBD/S
	XX+CbiQQRU/ksh9gRwn2QSdNuFl4Vg7AO+f70cxu45XfrmyLabhAKjgi9wEHrH/jjV0=
X-Gm-Gg: ASbGncuvxLA8IhCSEMSu70KfUv6c3mdNpa9XEATUaYYV6gx2R0sx/rtYvygiq74nXIi
	Z7zz7dnA4cjVxI06b+KXkhhkeEoEXzgln22sDXQYEGiPiuse/bh+MUbye4DqF1uouFeALh9usRE
	cQwRNgfKzZV8Od8QdY2nQZ4uaaeRc0UW3aAW+tWqw+aYqoiTJVFD1+pHe7KGu7PgjF3OLzgCaX9
	POjziNqR7rtNTfLtP75o9QmQP/X8HBQgNplSDLL7Mokin7wY5At9KCHnL91IfHZOwyZp8xM/Vhc
	WPmvvKHLsrjUks3LgsyK7zL5iKePenWhK/l+DyAWttOgGypDvjAFObrQuFcFaVE1VuoExBLXund
	2QrVi3TUdlhS7CN50lL+ibrUevLW+S3TsS0tvkNUOmvidHAP/E18pLzzjFa9bIyxMUjwNBWaXp5
	qA2ZvZ26HPP/6UQA1t
X-Google-Smtp-Source: AGHT+IGB/lTPqo8FUB1K8vcEzaAXKNJ3jkLu9HLwdfEC+eATOB31NhxyLoJxF149M0NnfHLXi/G67A==
X-Received: by 2002:a05:620a:1a9b:b0:89f:1204:504a with SMTP id af79cd13be357-8b5d2f12a5fmr116472585a.57.1764706903517;
        Tue, 02 Dec 2025 12:21:43 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b52a1b74f3sm1140019585a.26.2025.12.02.12.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 12:21:42 -0800 (PST)
Message-ID: <570d444a92b0e49a11379cabc8f7f838e5228f7a.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: verisilicon: Avoid G2 bus error while
 decoding H.264 and HEVC
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 ulf.hansson@linaro.org, 	s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 	linux-imx@nxp.com, l.stach@pengutronix.de,
 Frank.li@nxp.com, peng.fan@nxp.com, 	eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 02 Dec 2025 15:21:40 -0500
In-Reply-To: <64ad3d66-4edf-4a0b-8992-0db0e90a32b0@oss.nxp.com>
References: <20251128025117.535-1-ming.qian@oss.nxp.com>
	 <20251128025117.535-2-ming.qian@oss.nxp.com>
	 <46e9a5a881946d879d1b2af3421d574b26256ae3.camel@ndufresne.ca>
	 <64ad3d66-4edf-4a0b-8992-0db0e90a32b0@oss.nxp.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-fFM28PG+mNKcm637EtVe"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-fFM28PG+mNKcm637EtVe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ming,

Le lundi 01 d=C3=A9cembre 2025 =C3=A0 09:52 +0800, Ming Qian(OSS) a =C3=A9c=
rit=C2=A0:
> > Then instead of this, I would like to add a kref to v4l2_m2m_dec, I che=
cked
> > already and this is both safe and backward compatible.
> >=20
> > Then in the get function, you will walk over the compatible that are
> > different
> > from the currently probe node. If you find one that is initialized, you=
 will
> > call v4l2_m2m_get() to obtained a shared reference. In _remove() you wi=
ll
> > simply
> > do v4l2_m2m_put() instead of v4l2_m2m_release().
> >=20
> > Hope the others are happy with this. For Hantro drivers, this will make=
 it a
> > much more powerfull mechanism.
> >=20
> > Nicolas
> >=20
>=20
> For v4l2_m2m_get() and v4l2_m2m_put(), do you mean defining these two
> functions in v4l2 m2m, instead of just adding them in the hantro driver?

my idea was to add a kref to be able to share v4l2_m2m_dev. One thing I not=
ice
is that its the v4l2_m2m dev that creates the media controller on all other
drivers. Note sure why Hantro does it own still, maybe it predates, maybe i=
ts
something else.

Its quite weirdly glued together, since the v4l2_m2m_release() function jus=
t
happily free the m2m_dev without even trying to cleanup the media controlle=
r. It
totally orthogonal to the job queue, maybe it shouldn't be there.

I'll make an RFC for the kref anyway, if that has a change, I'll try and sp=
lit
out the v4l2_m2m_mc_dev on it own, so driver can share a m2m and use the
helpers.

Nicolas


--=-fFM28PG+mNKcm637EtVe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaS9KVAAKCRDZQZRRKWBy
9FwpAQCE8mMTD4iXjzvjVTfRBA1nQ1p6o6DmW7kVwZdUjhgwmAD/ZZDhUJ/ZxJ5m
bTyOTlRWmN/+KTAIgA9It8hO1jE00g0=
=pT2D
-----END PGP SIGNATURE-----

--=-fFM28PG+mNKcm637EtVe--
