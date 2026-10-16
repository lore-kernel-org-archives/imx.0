Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2413F32FA14
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 04:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123932; cv=none; b=Io4gGowskq2PPzcaT7P5eC1DtKpq/US/p13LEnPAxDYK399tK3Ggp23r/vTQ3R7fFoIxjbiG/G+z4YbOMLPf1oNFaaoE8bPMaSQcm1VzAqlikgLHo7Gjjw+cHKojD/+HIebWePVPW3DL4Ov3BUMY9NJ17qgaL2rHeT9VtPWK2Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123932; c=relaxed/simple;
	bh=kPgEL4QLxrjF3ZXTCCAGA5TMez6t+ev9YbeZ9I8qSlc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=XHr6Jsb0XpvylAykJGRjUl5dl65v4y3geHbMTSXR4B+U2ZMkyA9JqTdSjpMOc7CqUFEHPXtN7BCnRi8St5Wb6EwLyG9PQaOfv001J7kCjmCc63+FGGTTKkUrY+HepAOV6KyLX+PCIJVMBL69XUjOLpD4h1+m35+sYM96U1xZJWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOlnQvIQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOlnQvIQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA8C1F000CA;
	Fri, 16 Oct 2026 04:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792123930;
	bh=YXV+ACLUGKR1QAHVdiC1l0sWtfyav7Vx6247Ws883+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WOlnQvIQ36xR1q2w2sef9XcchdrB8GwthjhvlIbRr+LOZSGHI1xZrrUOD5ilhgdqA
	 U0VGk6vbv4QDS3tC0EwEXc7sz2fWG/AsDuyW7J+RoN+WdrxqqGjv9I2SJWIFWSORt2
	 ckVLT9JTdMaUNAYRMUfQfKjB/+6V851gNAixH5jleuse93YMYVwBZuxAuLgaVZUI5W
	 kK77IvmsKscncfbB0uHrsg28nqI6tWjF6EkZGAbFR0dSTAcons3ERBR0ICWjeoSFWj
	 wbm53aaIbUfvussXQm/dPEiJp+qVQJDDH1yy15UMXK3XUhh8hiZdACn6uiTUZEhAwB
	 l5UCATuQnmElA==
Message-ID: <sashiko-outbox-173739@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 19/25] ASoC: intel: atom: Fix .shutdown() being
 skipped on rollback
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261015014324.5569-20-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
 <20261015014324.5569-20-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 04:12:10 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ALSA: intel: atom: resource leak on sst_media_open() error path
--

commit fac36234f535190efd5d6e1b1740986dc014a4d6
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: intel: atom: Fix .shutdown() being skipped on rollback

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from sst_media_open(). ASoC only marks the DAI as started when
.startup() returns 0, so .shutdown() can be skipped on rollback.
This commit returns 0 explicitly on success.

> diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/int=
el/atom/sst-mfld-platform-pcm.c
> index a4c8cbfba0963..58681e007abf9 100644
> --- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> +++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> @@ -341,7 +341,12 @@ static int sst_media_open(struct snd_pcm_substream *=
substream,
> =20
>  	stream =3D NULL;
> =20
> -	return ret_val;
> +	/*
> +	 * ASoC only marks the DAI as started when .startup() returns 0.
> +	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
> +	 * return 0 to ensure .shutdown() is not skipped on rollback.
> +	 */
> +	return 0;
>  }

[Severity: High]
Since ASoC only marks the DAI as started when .startup() returns 0, do the
error paths earlier in sst_media_open() leak resources?

For example, if power_up_sst() fails:

	ret_val =3D power_up_sst(stream);
	if (ret_val < 0)
		return ret_val;

The function returns the error directly. Since .startup() returns an error,
.shutdown() won't be called. Does this leak the module reference acquired
earlier via try_module_get(sst->dev->driver->owner)?

Similarly, if snd_pcm_hw_constraint_integer() fails:

	ret_val =3D snd_pcm_hw_constraint_integer(runtime,
						SNDRV_PCM_HW_PARAM_PERIODS);

	if (ret_val < 0)
		return ret_val;

The function returns the error, skipping .shutdown(). Does this leak both
the module reference and the power state from power_up_sst(stream)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015014324.5569=
-1-phucduc.bui@gmail.com?part=3D19
