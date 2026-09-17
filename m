Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46F245000
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 19:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672397; cv=none; b=Wp9RSj9/Fvj5LGqnxS1doNHL+Kb3ehf6uDnMVO0o/HqRoj9sP0uRK6U4uDrsnSfvO2xqWMCVIYRJdkAXruovVEylW6421By25IbZ0JKQtgvWNRH67mpaPfIrlsKcVu35SJMowQFYiPFbDdNecLdoSRSBxCnr5WTv95yvDrkLYk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672397; c=relaxed/simple;
	bh=xNDN7iKT9koljI/NzriTb6aOur0AqbnHnNcmxBvNcDE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PrO2bcijAn8GFlhSQjyRLrRI/0JLpxBq0mZegVKqe0gsizVwF1hF2rUIRFvYp+sQCrvrs45mgIAOHU66Hgruous6D22hE97FSM+AvV6YuRTqnP6baqKQLsNzgRIR76TgGg+x89FOInrD9UkBm0WSjDA3AUiC80s2EjL0dEKzaJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1khq2ui; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1khq2ui"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AAA1F000FF;
	Thu, 17 Sep 2026 19:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789672395;
	bh=AoYAaS0Wl+1Bp3w1XWIZtuQkZ017bGXeFYY64aZhmNw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f1khq2uiov8Ie++aZQP4zIrkYCtRDEdtUsPZJX4IYJ9HwrriU54w3LQCcx0m9LB/o
	 3K/fi8O6nTvwfPqJxvMAa2HbiSXMPrOmjFi57j6/jt3jS/USLTJGot6l8VUAeZby+G
	 KV5Fxl56csw2hFzpFofjZ2J+ro6EPU2jK3vAbT+0CfyXlcfiyk3nN+9yzN4yRoD9NZ
	 tBFxDcO5FWaQ9AIFdAtaQUebXBf+276UZwVHM3z4ZZnnzgxWg61UP4Q3wSv/+tcvK6
	 oQZG0z0Dutgww84897ikRYuK4elydaWsFdAY2WHd9ieRWYnRyy8ZBJPzmKaGJTt8qN
	 WG2Y6DKMlW+mg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] media: m2m-deinterlace: replace direct
 ->device_prep*() calls with standard DMA engine API
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: media-ci@linuxtv.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260917190420.1189246-1-Frank.Li@oss.nxp.com>
References: <20260917190420.1189246-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 19:13:15 +0000
Message-Id: <20260917191315.85AAA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] media: m2m-deinterlace: unused variable dmadev
--

commit e18b2f587554971f1ebf19a1e3732c9502cf2d48
Author: Frank Li <Frank.Li@nxp.com>

media: m2m-deinterlace: replace direct ->device_prep*() calls with standard=
 DMA engine API

This commit replaces direct invocations of the DMA engine channel's=20
device_prep_*() function pointers with the standard dmaengine wrapper APIs.

> diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/pla=
tform/m2m-deinterlace.c
> index 9dcc4bd6cbdd5..57a91ff2269f2 100644
> --- a/drivers/media/platform/m2m-deinterlace.c
> +++ b/drivers/media/platform/m2m-deinterlace.c
> @@ -330,7 +330,7 @@ static void deinterlace_issue_dma(struct deinterlace_=
ctx *ctx, int op,
>  	ctx->xt->dst_sgl =3D true;
>  	flags =3D DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
> =20
> -	tx =3D dmadev->device_prep_interleaved_dma(chan, ctx->xt, flags);
> +	tx =3D dmaengine_prep_interleaved_dma(chan, ctx->xt, flags);

[Severity: Low]
Does this change leave dmadev as an unused variable?

Looking at deinterlace_issue_dma(), dmadev is declared and initialized
earlier in the function:

    struct dma_device *dmadev =3D chan->device;

With this change replacing the direct device_prep_interleaved_dma()=20
invocation, it appears dmadev is no longer referenced anywhere else in the=
=20
function, which could result in a build warning.

>  	if (tx =3D=3D NULL) {
>  		v4l2_warn(&pcdev->v4l2_dev, "DMA interleaved prep error\n");
>  		return;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917190420.1189=
246-1-Frank.Li@oss.nxp.com?part=3D1
