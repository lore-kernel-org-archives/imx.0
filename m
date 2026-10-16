Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62039190462
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 04:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124269; cv=none; b=H/6XaGgXBZQarDJ7xy5xc7H2DEX5poJsyt0EQY6lpyk6K7Kpqi1PzRdUl5TNtla4f7B4OCT3f34uG1N075RivFbFTIFUUC+cMpWpmcWOG50Fsri2O6SSWHpVGkDY4p82XDBisaBYiorpGhYPl00SUubnp3nv0k7rUmGw1aNn30s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124269; c=relaxed/simple;
	bh=uakmQO6fUgv5KgN92cqbJviykA+JdgCzaokDJIgRPTk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Z16yJP9Lv0DbINl1068Ohsv/FP0lWM3qMvszhafJ5dgEVCGKtHtdZ59ZO3ZmM6dkV3L+M39+hhI08p5z4Pv8BsCc72jNHYoVN6CrLQA0GsPXzqNeZ+vD6ukFoyvCR88PqnbxnP2nAgw7yM8h98poj9weuqk0ejGcutHdE5IbMJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCER0M0/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCER0M0/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99F71F000C4;
	Fri, 16 Oct 2026 04:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792124268;
	bh=l8UchTfZj2/IJTFmeO4ektXiETx9InVxA0GbqtJJGpE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YCER0M0/zJ+RCYgX7bE67OkKuGr7NpVHBdGX48fWcm4fEtPm4QMzw/WZZkEiwzuvL
	 bkKoWEhZ75FL5x7Q1Xn5CnryUrNEaoNlCp+hRPE52OMyEpajPYjoYqK5KG8NwZ+5vE
	 lTzFiZT7ySDH/XcsCULLfVYBh3hsK/J/Z89zrtNFZbGQyTl7RQt//CSc3FPxL1djyy
	 laGe9L3ATc0DU7aD2vNKqQiaEdB4iGvrna+dCp6/qSye81EqDf4As9ZT42pd7Seosy
	 QBjhgFrbxS89jGMSADX3S5I4DAqC84AQzp1K919PqyFnIteEfNigDnsl9HKzPlpOLN
	 OY6LyjsJfGcTw==
Message-ID: <sashiko-outbox-173756@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/11] ASoC: renesas: msiof: Explain component open
 return value handling
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261016040946.521195-8-phucduc.bui@gmail.com>
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
 <20261016040946.521195-8-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 04:17:47 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] asoc: commit message references msiof but patch modifies fsi
--

commit 1519b8d2e5e1f740b8b8e2dcb2ad6f3443c0c1db
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: msiof: Explain component open return value handling

This commit adds a comment explaining why the open callback must return 0
on success to ensure the component is correctly marked as opened.

> ASoC: renesas: msiof: Explain component open return value handling

[Severity: Low]
This isn't a bug, but the commit subject and message explicitly reference
the msiof driver, while the patch actually modifies fsi_pcm_open() in the
fsi driver.

Should the commit subject and message be updated to accurately reflect the
fsi driver instead of msiof?

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 88618e4b052d8..74e2ea002fbb1 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -1820,6 +1820,11 @@ static int fsi_pcm_open(struct snd_soc_component *=
component,
>  	if (ret < 0)
>  		return ret;
> =20
> +	/*
> +	 * ASoC only marks the component as opened when .open() returns 0.
> +	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
> +	 * return 0 to ensure the component is correctly marked as opened.
> +	 */
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016040946.5211=
95-1-phucduc.bui@gmail.com?part=3D7
