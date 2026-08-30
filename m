Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5A62836A6;
	Sun, 30 Aug 2026 16:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788106630; cv=none; b=EzVWFgqtZ98E1oCvntdkTKjOhVFHnEsH/UpHy/Fm5XUfAHdLnLYVoBdiE+jz6EplfwkzMa8w8Ds5v59bonVSssLvodfabCoGiZrQr6Bj83jP4SHyTItdc+xBnHibYxzop2KM84Qjn/VfpBP3txxI2PZjpH66jPETWJn5svCRRzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788106630; c=relaxed/simple;
	bh=ZBuyHfcHQBQxTtOh1Ip3mu69EGnHZ6SJOil1WJnOiok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mPSCFBlikzWbTJCmqo5qH7R2oRaibgYoTnMSNo3akQzvu12NsnPj59b6a8+g9G6GTNzz9y4duH9sNJyDnS1zzTopUVpYRYvq73e8IOZX1Sd3RLU1uaByZrsG6d2r9lvfRmwSqrI0cc2wQPzzxuqBcR3fcEIh/ogvjrupuiImUBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGtYEB0b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGtYEB0b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42BE31F000E9;
	Sun, 30 Aug 2026 16:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788106628;
	bh=cqQeQ39Uqqqa1WoMbd3xF4GyGppSFOxOTriMUiaMklE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QGtYEB0bWGxJCMx25j/g8y2mapXwxVjMv8KNEJ3VIrDeIwpTdu21MRAw+q0goTH4O
	 z2/x5KjE9VwqropgmpHpUZpSyLMUhQbL0A5tcxg5j+CKPyyK2Wt+XE1Vg9Fjt3bg3J
	 joMbEIFWsJQL5Zu1jygAFkNoyaUjuIUirMOUlUkvxBmrwuh3y94szddDL3ALbprJ1a
	 vzpq1fMZRMe2/gQvHX6jVLw8btrRSdFG7lNnVcSzg68lGa1cp4173QZWiU1LzlJx55
	 x5RMcLocS1FSPKfc1DPPk9hyiaVDxMtwu+Y1NXxuC5Ti01WySCumJHsfz4ylSOfLtA
	 6mnsUM/UIh/LA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/5] media: hi846: Fix link frequency handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260830160025.211384-3-mitltlatltl@gmail.com>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
 <20260830160025.211384-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 16:17:07 +0000
Message-Id: <20260830161708.42BE31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incomplete filtering of unsupported link frequencies during probe =
causes state corruption, leading to a kernel crash (NULL pointer dereferenc=
e) in the final series.
--

commit bffa4cf45bf88ea9bb0f32956b9b2cda43e64344
Author: Pengyu Luo <mitltlatltl@gmail.com>

media: hi846: Fix link frequency handling

This patch modifies link frequency handling to calculate supported values
dynamically based on PLL configuration, lane count, and MCLK rate. It repla=
ces
hardcoded frequencies and uses v4l2_link_freq_to_bitmap() to find the
intersection with device tree values.

> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index 7f069aca0fce5..2f8624f9bdf3a 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
[ ... ]
> @@ -1749,7 +1774,14 @@ static int hi846_set_format(struct v4l2_subdev *sd,
>  	mf->code =3D HI846_MEDIA_BUS_FORMAT;
>  	mf->field =3D V4L2_FIELD_NONE;
> =20
> -	__v4l2_ctrl_s_ctrl(hi846->link_freq, hi846_get_link_freq_index(hi846));
> +	idx =3D hi846_get_link_freq_index(hi846, hi846->cur_mode);
> +	if (idx < 0) {
> +		dev_err(&client->dev,
> +			"failed to get link freq index: %d\n", idx);
> +		return -EINVAL;
> +	}
> +
> +	__v4l2_ctrl_s_ctrl(hi846->link_freq, idx);

[Severity: High]
If an unsupported mode was selected, could this regression violate the V4L2
API by returning -EINVAL here and leaving hi846->cur_mode corrupted?

In patch 3 of this series, when filter_modes() correctly rejects the
lane-incompatible Mode 0, does this result in 0 valid modes?

If 0 valid modes remain, would v4l2_find_nearest_size_conditional() return
NULL, causing hi846_set_format() to dereference a NULL hi846->cur_mode and
crash the kernel?

Also, in probe, does the default mode initialization blindly assign
hi846->cur_mode =3D &supported_modes[0], leaving the driver in an inconsist=
ent
state if Mode 0 is unsupported?

[ ... ]
> @@ -1947,20 +1979,33 @@ static int hi846_identify_module(struct hi846 *hi=
846)
>  	return 0;
>  }
> =20
> -static s64 hi846_check_link_freqs(struct hi846 *hi846,
> -				  struct v4l2_fwnode_endpoint *ep)
> +static int hi846_add_link_freqs(struct hi846 *hi846, struct device *dev,
> +				struct v4l2_fwnode_endpoint *ep)
>  {
> -	const s64 *freqs =3D hi846_link_freqs;
> -	int freqs_count =3D ARRAY_SIZE(hi846_link_freqs);
> -	int i, j;
> -
> -	for (i =3D 0; i < freqs_count; i++) {
> -		for (j =3D 0; j < ep->nr_of_link_frequencies; j++)
> -			if (freqs[i] =3D=3D ep->link_frequencies[j])
> -				break;
> -		if (j =3D=3D ep->nr_of_link_frequencies)
> -			return freqs[i];
> -	}
> +	s64 hi846_link_freqs[ARRAY_SIZE(supported_modes)];
> +	unsigned long freq_bitmap;
> +	int ret, i;
> +
> +	/*
> +	 * Since the MCLK freq varies between platforms, calculating driver
> +	 * supported link freqs here.
> +	 */
> +	for (i =3D 0; i < ARRAY_SIZE(supported_modes); i++)
> +		hi846_link_freqs[i] =3D hi846_get_link_freq(hi846, &supported_modes[i]=
);
> +
> +	ret =3D v4l2_link_freq_to_bitmap(dev, ep->link_frequencies,
> +				       ep->nr_of_link_frequencies,
> +				       hi846_link_freqs,
> +				       ARRAY_SIZE(hi846_link_freqs),
> +				       &freq_bitmap);

[Severity: High]
Does this filtering loop contain a regression by failing to check if the
corresponding modes actually support the configured lane count?

If hi846_add_link_freqs() evaluates hi846_get_link_freq() for all modes
regardless of whether the mode supports the physical lane count
(hi846->nr_lanes), could this allow incompatible configurations to pass pro=
be?

For instance, supported_modes[0] (640x480) lacks 4-lane registers, but this
patch adds a dummy mipi_clk_div_4lane =3D 8. If hi846->nr_lanes =3D=3D 4 an=
d the
device tree specifies only this dummy link frequency, would
v4l2_link_freq_to_bitmap() incorrectly match it, causing probe to succeed
instead of failing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830160025.2113=
84-1-mitltlatltl@gmail.com?part=3D2
