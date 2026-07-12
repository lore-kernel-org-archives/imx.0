Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F2C28CF5F;
	Sun, 12 Jul 2026 12:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783858203; cv=none; b=Ntk3DHcSleZV1+cLtEOqScamGbcTfgB46FB1cM5zH+BbDyZ3v4vy5fGe5B+NZbkhA6xhzfpvWMYPZ3F0OueMCwTZaXhToIEiFILpgPGJ6H3qzzXBVqEcw96Ca4pABkQSzfJIG/v1bY6UH5JFMxV89J3kj8iJnCmewL3Bxy0dzKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783858203; c=relaxed/simple;
	bh=FmAVubC3OixvOWobefiVwd5ISYWd1cWlTvxP6y94u+Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ud0LVmMZVq+1eBxi180tHtZVOuhUxvKHrumnnTeY2YhwJJ7Z6wZz1SKw7oAl8HPMdr0ZZVVIud/cBcQXDHw/dAVU507hp9VKF+rsK90eLeP+rqCfXN/qe2W1NAqs73n3JxHDiWNZKatLxbOGm0pIjTfesH8TzJQ+ZYpHniy2joY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0iCUtGg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0iCUtGg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B3F1F000E9;
	Sun, 12 Jul 2026 12:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783858202;
	bh=rOTF0/Rl7N+qAeyZ3yMlTrfRKjEE8IGf2XoFMRPbf1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g0iCUtGg5oVjMTDWI7vWvMNBvYGXoRO6rni3XaKj0ejQLBECydgc3ITkfIsBl9qXq
	 UbRSBbLMUNxxWpOBjxaBe1gY5FZS1W5Mjd4/uGnOlDZ7ASuT943KFGRrlR/+Qxdhpz
	 VKUSgPId0T3NmFMV62BpzrvWxmeT3jLvavrE/clVQsCwwE3x/6b9D4PamgnNzJX/CI
	 f97ab4Qvd/EjM++As0sc5FccZQEgBcIRzlIrDSKwOcjFoBMJirobon5egVUn4N2uKJ
	 arTte++HGStqI2H8kamYz9O6eewRMocVzbWidj5tOM664j6ZT11pIuIvX72d8dltQO
	 zMQncDkMIR8DQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/5] media: hi846: Fix link frequency handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260712115012.91600-3-mitltlatltl@gmail.com>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
 <20260712115012.91600-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 12:10:01 +0000
Message-Id: <20260712121001.C1B3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [Critical] The device tree link frequency validation is silently bypassed=
 because `hi846->clock` is used before it is initialized, causing the check=
 to always succeed erroneously.
- [High] Removing the V4L2_CID_LINK_FREQ control without implementing the g=
et_mbus_config pad operation breaks CSI-2 receiver drivers that rely on it.
- [High] Link frequency validation in probe fails for all configurations be=
cause it mandates frequencies for modes that do not support the active lane=
 count.

Pre-existing issues:
- [High] Format changes silently fail to update the pixel_rate control valu=
e due to unmodified control limits.
- [High] hi846_set_format performs an unprotected read of hi846->cur_mode o=
utside a lock and validates the old mode rather than the newly requested on=
e.
- [High] hi846_set_ctrl incorrectly handles the -EINVAL return value from p=
m_runtime_get_if_in_use(), leading to an unconditional usage_count decremen=
t.
- [High] hi846_set_stream fails to track internal streaming state, allowing=
 unbalanced s_stream(0) calls to underflow the PM runtime usage count.
--

--- Patch [2]: [PATCH v5 2/5] media: hi846: Fix link frequency handling ---
commit 552600ce78beca6ba3cd666623936aecd2e1ea5d
Author: Pengyu Luo <mitltlatltl@gmail.com>

media: hi846: Fix link frequency handling

This patch updates the link frequency handling to dynamically calculate it
based on PLL configuration, lane count, and external clock rate. It removes
the hardcoded link frequencies and the V4L2_CID_LINK_FREQ control, and drops
the MCLK rate check.

> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index 7f069aca0fce5..6bcd862aee301 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
[ ... ]
> @@ -1426,14 +1434,6 @@ static int hi846_init_controls(struct hi846 *hi846)
> =20
>  	ctrl_hdlr->lock =3D &hi846->mutex;
> =20
> -	hi846->link_freq =3D
> -		v4l2_ctrl_new_int_menu(ctrl_hdlr, &hi846_ctrl_ops,
> -				       V4L2_CID_LINK_FREQ,
> -				       ARRAY_SIZE(hi846_link_freqs) - 1,
> -				       0, hi846_link_freqs);
> -	if (hi846->link_freq)
> -		hi846->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> -

[Severity: High]
Does removing V4L2_CID_LINK_FREQ without implementing the get_mbus_config p=
ad
operation break CSI-2 receiver drivers?

Several CSI-2 receivers rely on v4l2_get_link_freq(), which falls back to
V4L2_CID_PIXEL_RATE only if the caller provides valid mul and div arguments.

When downstream receivers pass 0 for these arguments, the framework relies
entirely on .get_mbus_config or V4L2_CID_LINK_FREQ. Without either, the
framework returns -ENOENT, preventing the camera pipeline from streaming.

[ ... ]
> @@ -1749,7 +1748,6 @@ static int hi846_set_format(struct v4l2_subdev *sd,
>  	mf->code =3D HI846_MEDIA_BUS_FORMAT;
>  	mf->field =3D V4L2_FIELD_NONE;
> =20
> -	__v4l2_ctrl_s_ctrl(hi846->link_freq, hi846_get_link_freq_index(hi846));
>  	__v4l2_ctrl_s_ctrl_int64(hi846->pixel_rate,
>  				 hi846_calc_pixel_rate(hi846));

[Severity: High]
This isn't a bug introduced by this patch, but does this silently fail to
update the pixel_rate control value when changing formats?

The control is instantiated in hi846_init_controls() with its maximum bound
permanently locked to the lowest-resolution mode's pixel rate:

hi846_init_controls()
    hi846->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, ...,
                                          hi846_calc_pixel_rate(hi846), 1,
                                          hi846_calc_pixel_rate(hi846));

When setting a new format with a higher pixel rate, the new rate is applied
here but it fails to call __v4l2_ctrl_modify_range() to raise the upper lim=
it
first. The framework will clamp the new value to the old maximum limit,
breaking downstream bandwidth calculations.

[Severity: High]
This is a pre-existing issue, but does hi846_set_format() perform validation
against the old mode rather than the newly requested one?

Earlier in hi846_set_format(), the code checks lane capability using an
unprotected read of hi846->cur_mode before the new mode is resolved:

    if (hi846->nr_lanes =3D=3D 2) {
        if (!hi846->cur_mode->reg_list_2lane.num_of_regs) {

This allows users to configure a mode that is incompatible with the active
hardware lane count (because it checks the current mode, not the requested
one), causing a silent failure when the stream starts and MIPI registers
are omitted.

[ ... ]
> @@ -1950,16 +1948,17 @@ static int hi846_identify_module(struct hi846 *hi=
846)
>  static s64 hi846_check_link_freqs(struct hi846 *hi846,
>  				  struct v4l2_fwnode_endpoint *ep)
>  {
> -	const s64 *freqs =3D hi846_link_freqs;
> -	int freqs_count =3D ARRAY_SIZE(hi846_link_freqs);
> +	int freqs_count =3D ARRAY_SIZE(supported_modes);
> +	u64 link_freq;
>  	int i, j;
> =20
>  	for (i =3D 0; i < freqs_count; i++) {
> +		link_freq =3D hi846_get_link_freq(hi846, &supported_modes[i]);

[Severity: Critical]
Will this call to hi846_get_link_freq() result in a zero frequency calculat=
ion
because the clock is not yet initialized?

In hi846_probe(), hi846_parse_dt() is called before the clock is initialize=
d:

hi846_probe()
    hi846_parse_dt()
        hi846_check_link_freqs()
            hi846_get_link_freq()
                clk_get_rate(hi846->clock);

    hi846->clock =3D devm_v4l2_sensor_clk_get(&client->dev, NULL);

Since hi846->clock is NULL during the DT parsing, clk_get_rate() will retur=
n 0.
The validation loop then checks if 0 is in the device tree endpoints, fails=
 to
find it, and returns 0. The caller hi846_parse_dt() checks "if (fq)", which
evaluates to false when fq is 0, completely bypassing the error path and
treating the validation as successful.

[Severity: High]
Does iterating over all supported_modes cause probe to unconditionally fail?

For modes that do not support the active lane count, the calculation uses
dummy divider values (like mipi_clk_div_2lane =3D 1 in the 3264x1836 mode).

This incorrectly calculates a bogus link frequency and demands that it exis=
ts
in the device tree link-frequencies array. When it is naturally not found,
the validation rejects the device tree and aborts the probe.

[ ... ]

There are also a couple of pre-existing issues in other parts of the driver
that were noticed during this review:

[Severity: High]
This is a pre-existing issue, but does hi846_set_ctrl() incorrectly handle =
the
-EINVAL return value from pm_runtime_get_if_in_use()?

In hi846_set_ctrl():
    ret =3D pm_runtime_get_if_in_use(&client->dev);
    if (!ret || ret =3D=3D -EAGAIN)
        return 0;
    ...
    pm_runtime_put(&client->dev);

If runtime PM is disabled, pm_runtime_get_if_in_use() returns -EINVAL.
The condition fails to catch -EINVAL, falls through, and unconditionally
executes pm_runtime_put(). Since the PM refcount was not incremented,
this underflows the usage count.

[Severity: High]
This is a pre-existing issue, but does hi846_set_stream() fail to track
internal streaming state?

In hi846_set_stream():
    if (!enable || ret) {
        hi846_stop_streaming(hi846);
        pm_runtime_put(&client->dev);
    }

Subdev s_stream(0) can be called multiple times. The function does not veri=
fy
if the sensor is actually currently streaming. When called with enable =3D =
0,
it unconditionally enters the teardown block and executes pm_runtime_put().
If the stream was already stopped, the refcount was already dropped, leading
to an underflow.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712115012.9160=
0-1-mitltlatltl@gmail.com?part=3D2
