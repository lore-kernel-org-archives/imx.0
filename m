Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137DD32694F
	for <imx@lists.linux.dev>; Fri, 29 May 2026 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780052551; cv=none; b=GUdQ6EiC9l2TqZ+kJnkAw7p6bv6UFSH8T/PM4ZhZiv0ELQfSprslOJUSV4sEYUPbLM8sxhUDDjAKY4WY5VMF3gzbXweibCF9MA5ScrQzSXbFl4UtNO+Q/Xe/6zQa1CsEpQ9KvLzsZ49zJB+i18Je8KrddzOdbwTiE/J40hCGhp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780052551; c=relaxed/simple;
	bh=mfHjkcMI+QMMDyruDGmyN3OrLMlnsKEoa61TmlKSmG8=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pSOg997/f06VFj9FSiOYDNCJPrSh/2mTbM/6gCObwjMVfk4/XWYQUmLhbWRMSXFIO+b6uQhaPphQmpaAtB9XabQg0ORx+enSqfe9iFHuwbjadtIlRGn80jfNZ4puGDj7OTDGDKgjDIFlof1KmIekjEoqMbeZdZTytkKCeUlYXIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/Yrfuv6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/Yrfuv6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9474D1F00893;
	Fri, 29 May 2026 11:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780052549;
	bh=w9FoVW8TCkbpyGMjO3ZT2Zz1UQPdyu8f2f7pHLl5Mv0=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=a/Yrfuv69/Zmc8yM0Ofbdc0HCL9oNLi6VRqLiA5xog4Wr0kXl6nrwHJgGdMoTlN2b
	 YI5cJE17/o8UJmcWN16JHwOAntjKYhCCzSGIy6s9nOyTs4hRCl3dQ2zR8g2K8DMmwy
	 duP8rusSeY59MdCjuupTrO465VN2pqktmUwFNX7LKLfs+ibnW4P1l3v2zdOd6CwyIO
	 byBE/Om8R/32SZ6PIa77WelvkbLdHlnsrASsU0UqJRZHYEtlpDHjlhrg4C4m6rdEbp
	 P846uODoFSguzNLF5kFgiMrTqMbVzpJ8cE8SHiUMn0f3wF6lNUUvG31DIhu065GOCx
	 UiiS/fFtnT/xQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
References: <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 11:02:29 +0000
Message-Id: <20260529110229.9474D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The explicit `.driver_data` initialization `TYPE_MAX8998` for `max8=
998-battery` was silently dropped without mention in the commit message.
--

commit 02f2c38ebeef8dff34934050c70916818fb36a18
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

power: Use named initializers for platform_device_id arrays

This commit updates various power supply and reset drivers to use named
initializers for platform_device_id arrays. It also unifies spacing and
comma usage across these array definitions.

> diff --git a/drivers/power/supply/max8998_charger.c b/drivers/power/suppl=
y/max8998_charger.c
> index 418b882b163d1..b0eda2b51e7f0 100644
> --- a/drivers/power/supply/max8998_charger.c
> +++ b/drivers/power/supply/max8998_charger.c
> @@ -188,7 +188,7 @@ static int max8998_battery_probe(struct platform_devi=
ce *pdev)
>  }
> =20
>  static const struct platform_device_id max8998_battery_id[] =3D {
> -	{ "max8998-battery", TYPE_MAX8998 },
> +	{ .name =3D "max8998-battery" },

[Severity: Low]
Is it intentional that the TYPE_MAX8998 driver data assignment was dropped
here?

The explicit .driver_data initialization TYPE_MAX8998 for max8998-battery
was silently dropped without mention in the commit message. While this has
no functional impact as TYPE_MAX8998 evaluates to 0 and the driver data is
entirely unused in max8998_battery_probe(), it constitutes a minor code
and commit message mismatch.

Should this removal be documented in the commit message, or perhaps moved
to an earlier patch in the series that drops unused assignments of
platform_device_id driver data?

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, max8998_battery_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780048925.gi=
t.u.kleine-koenig@baylibre.com?part=3D4
