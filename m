Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281212;
	b=dDeuYc/8w3gxWdI97VvzHaOWqQxSvoph05HTzO6ssII5ubM50C1H6X2Iy1Fk4tEWr939
	 XHEF7+NA1I/QRSKbJerUUNA7bpIgthchgDbFD8YWojTsIvU91gIPjxLA6FD7CuUN1LGz1
	 +3MxjJ6mFjv8NEaZS2bLM2Ygo/9ZsK7E11dKCVf7sYd/ZJnYzl/+7up0oxscYtAM/QtWw
	 CTZWkzWj6kYcH6IPleeyHoj/IsZyui9W+KYBQv76CV554hZ1+3wWcRKlLlFvqJbBdHfIW
	 HbKApZJBYEG5BDARkTTwEFxjZmtA7l/6VBh7sX2UHwU18rTSBLH9QS3oPrgm6lj/5QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281212;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lYFx6tlO+MKqGvsV8piEyGxEzTzqCPxxgKB3kVPfWN8=;
	b=XYra1gf/s3wsIESm5nrKMakcaERkL2ru/S5iXaNR7J40bOmzR5Qnk9MIcFNS4mQeMY9w
	 srmtRXjHnvcQ9ZST087TRB4K4ExLeYSOUuNoKmvk2yspg7YeD250dQGkZ1nJoBX1STFeB
	 ZfKcuZ8FXidHa7srOhDhgHD4mk1cA4pWWG2b4jAx+S0mu3CEfX874LcpHsupDZLW0Ba5V
	 yAeHaoVFLDYMwZc4fo0wHWrlNcnJtm4BDTNvIseQpDTlBtLCFN1uoEl3c23M7Bp96UVBJ
	 /8l22VHs1z3ao3enuX5sbV0gZlQ9zt/nfSM6diopbHF1p1Zq6SCuMEFDy1Y6MEw9qMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2AbKDrH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574FE606A320
	for <imx@lists.linux.dev>; Sat, 21 Nov 2026 17:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2AbKDrH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B85E71F000C4;
	Sat, 21 Nov 2026 17:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795281211;
	bh=lYFx6tlO+MKqGvsV8piEyGxEzTzqCPxxgKB3kVPfWN8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G2AbKDrHDE7NhD0W5WUwGriocCoSzDhKQF87eSImpJwxZJIzncEoZRuiWCqa9pNPJ
	 6Nu6GMRd4RB+wPhx1aCs3vO9rymok9hhxRQDeSfI9nSOv3km/XR70IwduTWUPbBi2H
	 iFaIQJeoTsVZam4sT4w3NSaHiy5+fmIv6IQrQ/xqEGgTPHQK7PVGkJ2euwSnnCho43
	 BJtw+H/a2EGpVSeRWCtQyc2u0lIj7Pi5Jam8Jx0wEzS/5YEXaiZNiibZdqAvdTbCH0
	 si1nedv1zBeC2hjSXBJHx7N4F1ek+hh6e2vA4RPMIcnpP346uTXJRgpIYwl13JFt+5
	 TjeA+lCDWtNkw==
Message-ID: <sashiko-outbox-227197@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: v4l2-core: add frame interval monitor helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaqi Shi" <shijiaqi_develop@163.com>, imx@lists.linux.dev
Cc: Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261121170232.414316-3-shijiaqi_develop@163.com>
References: <20261121170232.414316-1-shijiaqi_develop@163.com>
 <20261121170232.414316-3-shijiaqi_develop@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 17:13:31 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] media: v4l2-fim: missing struct v4l2_ctrl forward declaration in
  v4l2-fim.h
--

commit 4054bba4817179535aaa3077407029639e3caccd
Author: Jiaqi Shi <shijiaqi_develop@163.com>

media: v4l2-core: add frame interval monitor helper

This commit extracts the generic frame interval monitoring logic from the
staging i.MX media driver into a shared v4l2-core helper and converts the
i.MX driver to use it.

> diff --git a/include/media/v4l2-fim.h b/include/media/v4l2-fim.h
> new file mode 100644
> index 0000000000000..6d649a56b08f4
> --- /dev/null
> +++ b/include/media/v4l2-fim.h
> @@ -0,0 +1,40 @@

[ ... ]

> +#include <linux/ktime.h>
> +#include <linux/types.h>
> +
> +struct v4l2_ctrl_handler;
> +struct v4l2_fract;
> +struct v4l2_subdev;
> +
> +struct v4l2_fim;
> +
> +#define V4L2_FIM_NUM_CONTROLS	5
> +
> +struct v4l2_fim_config {
> +	u32 ctrl_base;
> +	u32 event_type;
> +	void *priv;
> +	bool (*external_timestamp)(void *priv, bool curval, bool use_val);
> +	void (*wait_first_timestamp)(void *priv);
> +};
> +
> +struct v4l2_fim *v4l2_fim_init(struct v4l2_subdev *sd,
> +			       struct v4l2_ctrl_handler *hdlr,
> +			       const struct v4l2_fim_config *config);
> +void v4l2_fim_reset(struct v4l2_fim *fim, bool curval, struct v4l2_ctrl =
*ctrl);

[Severity: Low]
Should struct v4l2_ctrl also be forward-declared here?  Without it, any
translation unit that includes media/v4l2-fim.h before media/v4l2-ctrls.h
scopes struct v4l2_ctrl to the v4l2_fim_reset() parameter list and fails
to compile with -Wvisibility and incompatible-pointer-type errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121170232.4143=
16-1-shijiaqi_develop@163.com?part=3D2
