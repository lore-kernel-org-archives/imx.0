Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141F4282F34;
	Sun, 30 Aug 2026 16:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788106579; cv=none; b=U1X/oNaynQCCWUlTjyCjIxGCKl1JxeK5/mG2K79QEzZ9IBFFYSlEKBPGmZ6SL7WfY/Xv4+9fVwUzzteCtYFItyAmql6W63gNdaXODe9X7pdVByf0Xl8B5gwPQpIXkvS6FvwMEML6TmUYM+PR+/4OVMsHsJ2WotXtFVFFjBP79yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788106579; c=relaxed/simple;
	bh=giSwBD8sYK1+xIAYwunqayqBmN1R37eIpfpaT/C5Ll8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YGX788AZJc1t9O+atX7TEhUPuwajTW+GZEnYcc1LxPXphbZHNHqABGMafCsYyDnncuvPW4HccaKx1gRWe6HX+PsvTzWSwtm/cB5pD7PANPNWnmip1OTXPKdh5WR9hfcq+oIyX6KQuB7R7yA7OOJxEzAIin/aeY6qheoc4E3rgNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2o3Yode; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2o3Yode"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487981F000E9;
	Sun, 30 Aug 2026 16:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788106577;
	bh=vozzY3dPcDo8p+Ua+yFZkxlsg9r5/Ab4MMigkkLRGB8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h2o3YodepKfXcgPDuLPN2VoD1U/11oADQUyK1FbAyA3Z5WmWMZjFFp1ZRXRaapiiT
	 OCEk++6T+w7jvHwEb+pIseohIcS5o2y9WiuWYO4KhBDh+ZvjvDRwINLwATK6x7EFg5
	 SAeFFEPh4ftOOo41Ozi856c8x/957ndxcgz2J7oe7Z2ljBVAUFot6bCfYjVz7O/v7O
	 bv3WypxKwG6XwJNs4Xp62ugo4RgHs+y6JwCTiKV6Wm/zxR1uLALv2C66a3y2lavZRg
	 ah0QkAjXRXZ0yofuzD3u0o7E7g/q9qLcVG1wga+TUPaGSATDqFOXuZNiLnd6ZtY86P
	 3f8QzAKxXRgGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/5] media: hi846: Fix modes handling for different
 lane cases
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, Frank.Li@kernel.org
In-Reply-To: <20260830160025.211384-4-mitltlatltl@gmail.com>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
 <20260830160025.211384-4-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 16:16:16 +0000
Message-Id: <20260830161617.487981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] v4l2_find_nearest_size_conditional() can return NULL if all modes =
are filtered out, leading to a NULL pointer dereference.
- [Medium] Missing mutex_unlock(&hi846->mutex) on the error path in hi846_s=
et_format().
--

commit 76f8fe21d198e6d98886ca4cb671239b0ef7030d
Author: Pengyu Luo <mitltlatltl@gmail.com>

media: hi846: Fix modes handling for different lane cases

When using 4-lane, v4l2_find_nearest_size may return an unsupported
mode. This commit uses v4l2_find_nearest_size_conditional() to filter
it out.

Link: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.sm

> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index 2f8624f9bdf3a..26b4290148b61 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
[ ... ]
> @@ -1736,20 +1751,6 @@ static int hi846_set_format(struct v4l2_subdev *sd,
>  		return 0;
>  	}
> =20
> -	if (hi846->nr_lanes =3D=3D 2) {
> -		if (!hi846->cur_mode->reg_list_2lane.num_of_regs) {
> -			dev_err(&client->dev,
> -				"this mode is not supported for 2 lanes\n");
> -			return -EINVAL;
> -		}
> -	} else {
> -		if (!hi846->cur_mode->reg_list_4lane.num_of_regs) {
> -			dev_err(&client->dev,
> -				"this mode is not supported for 4 lanes\n");
> -			return -EINVAL;
> -		}
> -	}
> -
>  	mutex_lock(&hi846->mutex);
> =20
>  	if (hi846->streaming) {
> @@ -1760,9 +1761,12 @@ static int hi846_set_format(struct v4l2_subdev *sd,
>  	hi846->fmt =3D fmt;
> =20
>  	hi846->cur_mode =3D
> -		v4l2_find_nearest_size(supported_modes,
> -				       ARRAY_SIZE(supported_modes),
> -				       width, height, mf->width, mf->height);
> +		v4l2_find_nearest_size_conditional(supported_modes,
> +						   ARRAY_SIZE(supported_modes),
> +						   width, height,
> +						   mf->width, mf->height,
> +						   filter_modes, hi846);
> +
>  	dev_dbg(&client->dev, "%s: found mode: %dx%d\n", __func__,
>  		hi846->cur_mode->width, hi846->cur_mode->height);

[Severity: High]
Does v4l2_find_nearest_size_conditional() have the potential to return NULL
here?

If the device tree's link-frequencies property does not match any mode for =
the
configured number of lanes, filter_modes() could filter out all modes. If t=
his
happens, v4l2_find_nearest_size_conditional() would return NULL, which would
then be dereferenced in the dev_dbg() call immediately after.

Could we add a NULL check for hi846->cur_mode before dereferencing it?

[Severity: Medium]
In the error path slightly below this diff, if hi846_get_link_freq_index()
returns a negative value, it appears we return without unlocking the mutex:

	idx =3D hi846_get_link_freq_index(hi846, hi846->cur_mode);
	if (idx < 0) {
		dev_err(&client->dev,
			"failed to get link freq index: %d\n", idx);
		return -EINVAL;
	}

Since hi846->mutex is acquired earlier in the function, does this return pa=
th
need a mutex_unlock(&hi846->mutex)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830160025.2113=
84-1-mitltlatltl@gmail.com?part=3D3
