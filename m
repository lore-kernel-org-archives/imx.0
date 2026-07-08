Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB09442668B;
	Wed,  8 Jul 2026 11:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509893; cv=none; b=Vli9lXIrcGoRGBlLR18jXix2oEjCZGIVU0ZFSL4euQX57oiG5pWoGorw4U2zSBXCGMlwY+XvffBsS67ECBDa7LCAqjqk6g5hUb+qKKpx4DhrjmTZgHr4n+V/1E4To691LkNsFszBja7VIhlOFR83lIrsdQc9ofh2N4yZ0enV8I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509893; c=relaxed/simple;
	bh=uOhezVA16oqSHTgcT29vfZztnAQ0yDTyLZj5+Fj9EX0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LrfY7kLIQNlvt10S4FobiOLk0A3t129Qc6rTRAR1c1dV5JofJtrN/apn9ljKl6ka5plTWLq68L2cuQ3K42GmjbcuRnxbjHoozuo/eSWHyDvODAiJz9vQVLfxQKF+ZxOmHn73Xdto7XYHKWzyEEyJh2AHGw+rEWNl+evVBb841QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ssw+0ZhE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ssw+0ZhE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D676D1F00A3D;
	Wed,  8 Jul 2026 11:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783509890;
	bh=zdG/2jpRBmT8eXA0W9SFjtBYDV5NI81Sd3ZALOlZp2w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ssw+0ZhE0KkBBLFDll8s3f0xWSP8HIeMa6W1xEKy3yXsDjUhjLD/svOld+tpjMDFy
	 LBCdCHvj8O92Gw9TYJatjztGQFJw8KIMe71LLTrBIQnISikE8xzaE14/4qJ92Ocw34
	 J398C6qcUDobxNu9DQjB90RRyDT6zVTdqWhVzor/VARJzXDQYwO2dxIa7awgsMusb+
	 mmgM3fcMk5HIjCQV926Ju0VqY3LEkeMaKRQT9yZK8gWAyxoBCF+9rbXs4oydeBVfWW
	 x5eg+XzaO35HaCqPdVAZmnE36O5mnRSgmuN4qQ7vbbqvfKteDRQFiquKQwKCgX0j5C
	 z2Slyca7hXLpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/23] mfd: Use named initializers for arrays of
 i2c_device_id
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: imx@lists.linux.dev, mfd@lists.linux.dev, Frank.Li@kernel.org, lee@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <5aec0fc2ac0cd1d2e27027ad0c180e2647bd494e.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <5aec0fc2ac0cd1d2e27027ad0c180e2647bd494e.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:24:49 +0000
Message-Id: <20260708112449.D676D1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `rsmu_i2c_id` array is missing its required null-terminating s=
entinel element.
--

--- Patch [13]: [PATCH v2 13/23] mfd: Use named initializers for arrays of =
i2c_device_id ---
commit f026cb9dcb83c5116a80b49dec846447e0d9699f
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Use named initializers for arrays of i2c_device_id

This patch updates arrays of i2c_device_id to use named initializers
instead of relying on positional initializers. This improves robustness
against future changes to the struct.

> --- a/drivers/mfd/rsmu_i2c.c
> +++ b/drivers/mfd/rsmu_i2c.c

[ ... ]

> @@ -328,14 +328,13 @@ static void rsmu_i2c_remove(struct i2c_client *clie=
nt)
>  }
> =20
>  static const struct i2c_device_id rsmu_i2c_id[] =3D {
> -	{ "8a34000",  RSMU_CM },
> -	{ "8a34001",  RSMU_CM },
> -	{ "8a34002",  RSMU_CM },
> -	{ "82p33810", RSMU_SABRE },
> -	{ "82p33811", RSMU_SABRE },
> -	{ "8v19n850", RSMU_SL },
> -	{ "8v19n851", RSMU_SL },
> -	{}
> +	{ .name =3D "8a34000",  .driver_data =3D RSMU_CM },
> +	{ .name =3D "8a34001",  .driver_data =3D RSMU_CM },
> +	{ .name =3D "8a34002",  .driver_data =3D RSMU_CM },
> +	{ .name =3D "82p33810", .driver_data =3D RSMU_SABRE },
> +	{ .name =3D "82p33811", .driver_data =3D RSMU_SABRE },
> +	{ .name =3D "8v19n850", .driver_data =3D RSMU_SL },
> +	{ .name =3D "8v19n851", .driver_data =3D RSMU_SL },
>  };

[Severity: High]
Will this lead to an out-of-bounds read during device matching? The
terminating null sentinel was inadvertently removed from the end of the
rsmu_i2c_id array.=20

The I2C subsystem (specifically i2c_match_id()) loops over i2c_device_id
arrays until it encounters an element with an empty name string, so it will
now read past the end of the array.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D13
