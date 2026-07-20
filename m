Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E25A3AE183
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 06:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784528951; cv=none; b=K+VJkePrBeh45wYqNBCRfSxs3nLHoaWP7KjE2salxxVag3aKox+FtRoABbrXfKAg2NMetnrDPWiqPvcDBjmG91n+SPex8p6plWSNaecP4rielb43rQz7wTkHFe1hYqEZ0R0I+RPCt7QuvVPRUTR/cQkOU3wgz6y72+RmFC64l9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784528951; c=relaxed/simple;
	bh=MCxYQH6C6E+392J8+R7SV6Ki21qSiRYz0BakWTh4rxg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uWd8mwjbuFS/v8wO4rrjH/IwsKkDUg43FX4nJn7icaMdGwwaodKdu/oelfQQT9Cdi5dcrVr6SeCL1ET+3eFlolMSZmvStriyC3Ol6fDR8Evx22WwWZmsx7OYnDuOsZeEKYIMTZFz4fvx7ibuu9gx7CMZyvf95WNDZtOT12ZNcDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2GwocAc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2GwocAc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173371F000E9;
	Mon, 20 Jul 2026 06:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784528947;
	bh=3KL9WEAFOag7JqI1wZ7bZj+F9PyPZ72buyQvHiFHQow=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R2GwocAcGcxxNOOCC257j5r4aryquCYe4NmWh1kFejCKxRGnNQKgzrBTMfpOwK8Mo
	 72lGxY9bf78Q1IjEB71spDTCqfrozzSjMqlaccl9MitYDePN/8KaWrd5BYhxlgX3WD
	 AFS9VPnYxEy+hi08acIrXVFHtLzsAdq/wAkLqnjIBkI4bL67ynJjaSEJ1xqyieiIgv
	 9pBqJ1wyoTDZN/Im9e7MuGktcyxmDZK1cMwMAIutoX/+ThzkUAK/AoyrORs4OI0UpI
	 HJDfZ/Hfo6qbx7ZOuFRilRYFYZ6afWby2LpRcDPAyrYQz1SJVsnprK9G8DidiffGXH
	 z+pBL/MWn/ogA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] ASOC: Unify code style for platform_device_id
 arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <093867d47c079d2aaab06bccaae734c54c342a7d.1784528081.git.u.kleine-koenig@baylibre.com>
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
 <093867d47c079d2aaab06bccaae734c54c342a7d.1784528081.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 06:29:06 +0000
Message-Id: <20260720062907.173371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit introduces a style inconsistency by missing several smal=
l platform_device_id arrays during its mechanical refactoring, despite the =
commit message claiming to use a 'compact one-line style for small entries'.
--

--- Patch [6]: [PATCH v2 6/6] ASOC: Unify code style for platform_device_id=
 arrays ---
commit 03434ab8a73c8818fd87d755c26c0b8e9e4f5807
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

ASOC: Unify code style for platform_device_id arrays

This commit unifies the code style of platform_device_id arrays across
various ASoC drivers. It updates list terminators to use a single space and
attempts to use a compact one-line style for small entries.

[ ... ]

> diff --git a/sound/soc/intel/avs/boards/probe.c b/sound/soc/intel/avs/boa=
rds/probe.c
> index 73884f8a535ca..4053d14289b95 100644
> --- a/sound/soc/intel/avs/boards/probe.c
> +++ b/sound/soc/intel/avs/boards/probe.c
> @@ -64,7 +64,7 @@ static const struct platform_device_id avs_probe_mb_dri=
ver_ids[] =3D {
>  	{
>  		.name =3D "avs_probe_mb",
>  	},
> -	{},
> +	{ }

[Severity: Low]
This isn't a bug, but should this entry also use the compact one-line style
mentioned in the commit message? It seems like this array missed the single
line styling update that was applied to files like da7219.c.

>  };
>  MODULE_DEVICE_TABLE(platform, avs_probe_mb_driver_ids);

[ ... ]

> diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boa=
rds/rt274.c
> index a689f4c80867b..289f1230851f4 100644
> --- a/sound/soc/intel/avs/boards/rt274.c
> +++ b/sound/soc/intel/avs/boards/rt274.c
> @@ -261,7 +261,7 @@ static const struct platform_device_id avs_rt274_driv=
er_ids[] =3D {
>  	{
>  		.name =3D "avs_rt274",
>  	},
> -	{},
> +	{ }

[Severity: Low]
This isn't a bug, but similar to the probe.c file above, should this entry
be compacted to a single line? There are several other files in this
directory (rt286.c, rt298.c, rt5514.c, etc.) that also seem to have missed
the compact one-line style update.

>  };
>  MODULE_DEVICE_TABLE(platform, avs_rt274_driver_ids);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784528081.gi=
t.u.kleine-koenig@baylibre.com?part=3D6
