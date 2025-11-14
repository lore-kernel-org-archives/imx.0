Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA073101C7
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763116200; cv=none; b=iTrYfq3gkpq4JrFz2kkBn5djrRU1KG/QAS0y69AiNnmEcQzjSoIryvj2GkRCdvQ/I2TZSVCpdpHYSbokCsq6aWsI+vNLQrUWh3ctxSnJQzMTmHPr5P9NGx3w8mu9WVmj8UX3er+mhoWa46Jdrsx1bdKVP8Oi/1FMd3Dm3BKPJwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763116200; c=relaxed/simple;
	bh=UBbZsb4dMttftP1M96cy0ber+qZ1LFIDjn4+NP/XX9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDGgf/wv6E3xyUSLKuXELGLQEwphs9Ug+quRy/Djqydf/NanmT80IUTMgcc2/HtSwWuadSZT9h+YPbHpmunJCmSuYVMQpXk21ZRt8KejayTKQbKkvPG6zrZUBWamPRjZFX/P1H+xGBZNnKc5ri6v+mPfVu3k898vIC09BAotTSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=il5c3XKN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="il5c3XKN"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2957850c63bso18814335ad.0
        for <imx@lists.linux.dev>; Fri, 14 Nov 2025 02:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763116198; x=1763720998; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3y1+oIlNcBvHQ2j5491FzfotPp6frKmcPxBxDRPYTII=;
        b=il5c3XKNwOGn1U2wxo36Qki3oailcaJOZePjRh9s+YSiHqfYcI0RqxcQnfppgpQyRX
         i0o0G2hilKdHBE3VJ+kxYjkrCJk+P9TBXI8FFFLdeOMnmllOl/Cop36KMYan6K1UUVIF
         Q4+Buyc71tlo0PqU9JOKshQx6HTkS7D7GKa0iE672xPoBJNMgroMbM+hk199wgQhojEq
         gsTyBb2KWX6+mTHf3qMQN+2jBdfiOyGxy/IgkjrcpabFw1MEjFbh4yMo2kBwe+DSbYRc
         wmW2SL9KojUnPNP/HosM8rGJnpp68gGhU/dBBF9+YZ0ClFRy1UvmGbxyrzaStPGWA7nQ
         0g6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763116198; x=1763720998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3y1+oIlNcBvHQ2j5491FzfotPp6frKmcPxBxDRPYTII=;
        b=fqhfWfhANCOY5YzLNWk8yQ0YrCtC1UX/lYqvI6Y4osQ+moiASKh4sA257XqJeGTlh2
         RUJ2n+pL3RKGZ+MOB4iO4QVEVeAJx7zMKH6wmfgBn4WR1bQ1ITdWmI/DNCpMRzeb5PR+
         x9vMb9Eftdy4MkdnjFOCAkVKwLKxRiCvxJgTEYF70PvWUykBcaatAzXzeGFum5R8tEh7
         jaUCLTgiyVXqiv57sLT4kehBfSc0EaQOgJB6RQvJ+MTT0VqJS+OPXDl52b5nlOfjbe78
         pksDeITj8UEyZWsVSPC4DLFcKXZDPSLWJvo3QrCSEWVehJ7mIZrsMYopu7OnToxlMxAN
         rm4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+J6acHUgu0DFpamPxK/1MpZzZAWB4XRd52Aj22Dy5LxXc57+ewKLlMhlxJTIjBuv6Ejk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRlYIKjtZt327Fx45qaboAV7pvv1c+dn00EnSN3EDVM6mi05cf
	8ZIq1yLUaFj/a0rqoBNnxhxLaSrA9MHQPzdUlzmOZSTOrbExGM3vUsRe
X-Gm-Gg: ASbGncu4DuiM2lSh8Tsmff7TfvG5AD16M3mFcx1j0CJRRGXVWCdVJOEmjEgU8DQpvGC
	qj5ERm4/L8hTItueQ7WuJw6RPKkP5iTjtObklQO7ezuWeu+w6bPO6clGkSxnEtR6DeWTMzefZ4K
	u+ZxsuKQ/tBq8OSuBvcp7qweERs9QpBYVTD3eM7I/myRUCC146ILRlnoP1EYozY7OheYyjzTZKH
	HXifqKwFol3D/ba4m1Zv6Nz0jXLsLdc0Xhd1PAjykJI9P0Jo9pPpaKL+6qZYCJ5Ji+v/SmMkzkY
	JyzawN6pUhxPZ7HKcrUrKzSZlJJUvecbyqrjPebYzERw/vZViTzMFdxydngroNzp3K2kEdqyOpo
	Cw/o3qzd6SzWPMzUu3lia1JD6axx2xv6V51Kugenc5a21u36b9md4TV24TfKrctMNEcQqTf4Nwn
	/NhywpkotE7Bs=
X-Google-Smtp-Source: AGHT+IF+0G1Z72gXcZasFEt+dR8TBz4EQdEyh5TXVK7VWrLSbxyg9r+z6DMShwpU4TKnPXmx9Qni9Q==
X-Received: by 2002:a17:902:e5c7:b0:295:6850:a38d with SMTP id d9443c01a7336-2985a52b1abmr69212555ad.19.1763116198280;
        Fri, 14 Nov 2025 02:29:58 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0710sm50609975ad.66.2025.11.14.02.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:29:57 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 95E2D4207D09; Fri, 14 Nov 2025 17:29:54 +0700 (WIB)
Date: Fri, 14 Nov 2025 17:29:53 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>, corbet@lwn.net,
	andersson@kernel.org, mathieu.poirier@linaro.org
Cc: dan.j.williams@intel.com, cedric.xing@intel.com,
	pasha.tatashin@soleen.com, kevin.tian@intel.com,
	skhawaja@google.com, yesanishhere@gmail.com, taimoorzaeem@gmail.com,
	linux@treblig.org, arnaud.pouliquen@foss.st.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, rdunlap@infradead.org,
	daniel.baluta@gmail.com, imx@lists.linux.dev
Subject: Re: [PATCH 2/2] Documentation: Fix filenames for remoteproc/rpmsg
Message-ID: <aRcEoX9saonpQuvf@archie.me>
References: <20251114065746.901649-1-daniel.baluta@nxp.com>
 <20251114065746.901649-3-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+twDMHafNSzP9Og8"
Content-Disposition: inline
In-Reply-To: <20251114065746.901649-3-daniel.baluta@nxp.com>


--+twDMHafNSzP9Og8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 08:57:45AM +0200, Daniel Baluta wrote:
>    This document describes the rpmsg bus and how to write rpmsg drivers.
> -  To learn how to add rpmsg support for new platforms, check out remotep=
roc.txt
> -  (also a resident of Documentation/).
> +  To learn how to add rpmsg support for new platforms, check out remotep=
roc.rst
> +  (also a resident of Documentation/driver-api).

I think "also a resident of ..." can be dropped, since it's redundant (it's
already covered in remoteproc.rst cross-reference which transforms into
the link when you build the docs).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--+twDMHafNSzP9Og8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaRcEnQAKCRD2uYlJVVFO
o5FeAP41XfZ1+B4P84roVhLdJjUIeYsbQoCOQ0JR5L2Ed+SfzQD/TQHSHzxQVA2Z
NrSRvC/d/fqFsQeTCtXU7p2M914xbQw=
=Lenc
-----END PGP SIGNATURE-----

--+twDMHafNSzP9Og8--
