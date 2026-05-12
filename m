Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D683002C8;
	Tue, 12 May 2026 04:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778561015; cv=none; b=grsqD8CYr8opLdfj4GVyCjBlzmq7m1Rg3FB39RxL6EaSwh+lSwIimBZ4tL/8v4oneP1id/uzJeD18UYW6VHvvZHXh3KhD8vXb6dtvHjf7nhC2JlPOPNAeMcCc/EeNNmlCAXBzYxjQVVPdvglE84tYytf/iSe7bufE51wDfi0AIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778561015; c=relaxed/simple;
	bh=h0UyEmBKfZptg+nsCznfAyVZdKs/ojj2SHuSKQTmQ0Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IYW3NTQBsLJByLcnN88aNlO4DwxJHn6peKbybBDMwXQwRD5ncxNEl36340oKsfflUWIV2Ag6vUn6gIIdfKD600B8w6bBqciWit5x5mQS8UrLnEDhsOXyiKy8fLm0OWIFVEId+IJ/aMJThs90vr7Yd1GGejWhm66tRqE8e8NqALA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwBOM6XL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NwBOM6XL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A626C2BCB8;
	Tue, 12 May 2026 04:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778561014;
	bh=h0UyEmBKfZptg+nsCznfAyVZdKs/ojj2SHuSKQTmQ0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=NwBOM6XLLaB9WhGeJFNMf0uZx7zljFgC4gfESqPmvjLqldYZ8pT/CgaZqUkyaquyJ
	 yt7CbvKN0qhficGVcOSgx3j2bHoG7Bfd8U9MZs9bxyXbMIR3Z4s0bC4S7++o8KU0Mg
	 czWx5fS1nXjcbHomDU+rn/IuKNE8JpbdVNXLuGC4gly3N5N/nPdNc/Kfob9PaV9Yyx
	 Bcme3VuMI7yPSCpqSnUvcs89++B5BUkb4HY8IaG3UXKEykzcSnZFyoVrQ3WIssJTpS
	 tJYMK050jSJpCOmRJUsKBXIQynU1qyrEUBVcZ4/5GuhLLk1qf8D/0pYwC/9KnGYZqa
	 36h211AqKDUpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] media: hi846: fix modes handling for different
 lane cases
Reply-To: sashiko@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260511103927.279550-4-mitltlatltl@gmail.com>
References: <20260511103927.279550-4-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 04:43:33 +0000
Message-Id: <20260512044334.7A626C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Hardware configuration validation for link frequencies is silently=
 bypassed because of a missing clock initialization.
- [High] V4L2 format constraints are not enforced when evaluating `V4L2_SUB=
DEV_FORMAT_TRY`, allowing arbitrary dimensions.
- [Medium] The logic to filter modes for 4-lane configurations relies on br=
ittle array pointer math and implicit array ordering.
- [Low] The local variable `supported_modes` shadows a global file-scope va=
riable.
--

commit d690502fca6d668750580bed748cc5e7a41d5785
Author: Pengyu Luo <mitltlatltl@gmail.com>
Date:   Mon May 11 10:39:25 2026 +0000

    media: hi846: fix modes handling for different lane cases
   =20
    When using 4-lane, v4l2_find_nearest_size may return an unsupported
    mode, 640x480 mode, and it is set to the default mode. To fix it,
    specifying the supported modes for different lane cases, once the lane
    count is determined.
   =20
    Link: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.s=
m/

> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index 61297ef66a0eb..c77b34a5e1662 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c

[ ... ]

> @@ -1736,8 +1740,8 @@ static int hi846_set_format(struct v4l2_subdev *sd,
>  	hi846->fmt =3D fmt;
> =20
>  	hi846->cur_mode =3D
> -		v4l2_find_nearest_size(supported_modes,
> -				       ARRAY_SIZE(supported_modes),
> +		v4l2_find_nearest_size(hi846->supported_modes,
> +				       hi846->num_modes,
>  				       width, height, mf->width, mf->height);
>  	dev_dbg(&client->dev, "%s: found mode: %dx%d\n", __func__,
>  		hi846->cur_mode->width, hi846->cur_mode->height);

Is the V4L2_SUBDEV_FORMAT_TRY request handled correctly earlier in this
function?

The API mandates that TRY requests must be validated, clamped, and adjusted
to match the hardware supported sizes identically to active format requests.
By returning early and blindly copying the format like this:

if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
        *v4l2_subdev_state_get_format(sd_state, format->pad) =3D *mf;
        return 0;
}

Does this allow userspace to inject arbitrary dimensions into the subdev
state?

[ ... ]

> @@ -1821,8 +1825,11 @@ static int hi846_enum_frame_size(struct v4l2_subde=
v *sd,
>  				 struct v4l2_subdev_frame_size_enum *fse)
>  {
>  	struct i2c_client *client =3D v4l2_get_subdevdata(sd);
> +	struct hi846 *hi846 =3D to_hi846(sd);
> +	const struct hi846_mode *supported_modes =3D hi846->supported_modes;
> +
> =20
> -	if (fse->pad || fse->index >=3D ARRAY_SIZE(supported_modes))
> +	if (fse->pad || fse->index >=3D hi846->num_modes)
>  		return -EINVAL;

This is not a bug, but does this local variable shadow the global file-scope
supported_modes array? This might trigger compiler warnings and cause
confusion during future refactoring.

[ ... ]

> @@ -1950,12 +1957,12 @@ static int hi846_identify_module(struct hi846 *hi=
846)
>  static s64 hi846_check_link_freqs(struct hi846 *hi846,
>  				  struct v4l2_fwnode_endpoint *ep)
>  {
> -	int freqs_count =3D ARRAY_SIZE(supported_modes);
> +	int freqs_count =3D hi846->num_modes;
>  	u64 link_freq;
>  	int i, j;
> =20
>  	for (i =3D 0; i < freqs_count; i++) {
> -		link_freq =3D hi846_get_link_freq(hi846, &supported_modes[i]);
> +		link_freq =3D hi846_get_link_freq(hi846, &hi846->supported_modes[i]);
>  		for (j =3D 0; j < ep->nr_of_link_frequencies; j++)
>  			if (link_freq =3D=3D ep->link_frequencies[j])
>  				break;

Does this logic successfully validate the hardware configuration?

Looking at hi846_probe(), it calls hi846_parse_dt() which uses this function
to check frequencies. However, this happens before the hi846 clock is
initialized via devm_v4l2_sensor_clk_get().

Because the clock is zero-initialized, hi846_get_link_freq() will calculate
a frequency of 0. This loop will then fail to find 0 in the device tree
endpoint list and ultimately return 0.

Since the caller checks if (fq), which evaluates to false, does this
silently bypass the hardware configuration validation entirely?

[ ... ]

> @@ -1999,6 +2006,13 @@ static int hi846_parse_dt(struct hi846 *hi846, str=
uct device *dev)
> =20
>  	hi846->nr_lanes =3D bus_cfg.bus.mipi_csi2.num_data_lanes;
> =20
> +	hi846->supported_modes =3D supported_modes;
> +	hi846->num_modes =3D NUM_MODES_2LANE;
> +	if (hi846->nr_lanes =3D=3D 4) {
> +		hi846->supported_modes =3D supported_modes + 1;
> +		hi846->num_modes =3D NUM_MODES_4LANE;
> +	}
> +

Is this pointer math relying on implicit array ordering? It appears to
assume that there is exactly one unsupported mode for 4-lane setups and
that it is always located at index 0.

If a new mode is added later, or a 2-lane-only mode is appended to the
end of the array, this offset calculation will fail. Could we use
v4l2_find_nearest_size_conditional() here instead and pass a condition
function to dynamically evaluate if reg_list_4lane.num_of_regs is greater
than zero?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511103927.2795=
50-1-mitltlatltl@gmail.com?part=3D3
