Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8210F12D1F1
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 19:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784145105; cv=none; b=sSu1L2duUwombHPHr7jKj4kldyGuBhNtG50w2WRYZgn/sBzZ7crHOMQEAWsqInaPwjtNhyW+n7ui//0rJSdJAqtoeznACafD+Cp5TkMAKScAsH58SgwRIkD0boMc8dwnwIKVZdNajMl66DvmHzXvEUpF+mTuETqn55tcRsRbOm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784145105; c=relaxed/simple;
	bh=gJODdSsQ3nRamnrm61dfkj602g9rgnQ1OMch7Ad7to4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J3qbpcrElOWofh9gYVKmkOBz/hOwtU1wbCz+ehp2vdLJj+TrPGlL+qH4JEfRakXm0A63O9ZwW/bxof16m0D4xLsGFXJYsU0EaEbvuJdEMNuEWYyAGpFyR6zMtA/5QcyzVuLQ8t+VHMpe0g/uFWcTIUGJMEx/OKbT8nSRf8ED4hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Px+rAKub; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Px+rAKub"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEFC81F000E9;
	Wed, 15 Jul 2026 19:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784145104;
	bh=8WeDMpjQ081xnHpfRTxwpB2j24z/XPWqrhS+gQenDjU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Px+rAKub8k5SLRkqcoXatRCU2zvMplBWtaaj3HnFqTcZybv5jzaad9gMxwhCovqmM
	 FQvMzhO582J8CkjXOZdwpn/eI2FxuLQtMyFwumTW9d+39y/RfHgt1f6Muk2Y00aXzz
	 H5G+2+Ontar+Mpd5V8ReiB6Q7L47W6tB9sjfW+1oK0xmVTpQ6RFihGAv3D3S/Pmoal
	 P545xdIeL8OWEU3Fg/lSNOUgsAqFRopTLSmAOCDIJIiIaP/qAyoHb+dktYqaCdeulN
	 or4Q6sNLGDPGmlvUx9MqM7QpMGThySgAgNF10VUBVCVqZoRh+lvXY9I7ubosUeGYOJ
	 ow7MrBs9nXcgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] pinctrl: pinctrl-generic-mux: use
 mux_state_try_select()
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260715193546.2852108-1-Frank.Li@oss.nxp.com>
References: <20260715193546.2852108-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 19:51:43 +0000
Message-Id: <20260715195143.DEFC81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Replacing `mux_state_select()` with `mux_state_try_select()` cause=
s silent pin configuration failures during driver probe.

Pre-existing issues:
- [High] Concurrent radix tree insertions and data races due to missing loc=
k in `mux_pinmux_dt_node_to_map`.
--

--- Patch [1]: [PATCH 1/1] pinctrl: pinctrl-generic-mux: use mux_state_try_=
select() ---
commit 8b69728953c0e1594fa409568136b389105c9d0b
Author: Frank Li <Frank.Li@nxp.com>
pinctrl: pinctrl-generic-mux: use mux_state_try_select()

This commit updates the generic mux driver to use mux_state_try_select()
instead of mux_state_select(). This prevents the consumer driver from
blocking during probe when the mux state is already selected.

> diff --git a/drivers/pinctrl/pinctrl-generic-mux.c b/drivers/pinctrl/pinc=
trl-generic-mux.c
> index da5a5ec015833..202b72351efb7 100644
> --- a/drivers/pinctrl/pinctrl-generic-mux.c
> +++ b/drivers/pinctrl/pinctrl-generic-mux.c
> @@ -93,7 +93,7 @@ static int mux_pinmux_set_mux(struct pinctrl_dev *pctld=
ev,
>  	function =3D pinmux_generic_get_function(pctldev, func_selector);
>  	func =3D function->data;
> =20
> -	ret =3D mux_state_select(func->mux_state);
> +	ret =3D mux_state_try_select(func->mux_state);

[Severity: High]
Does returning -EBUSY here lead to silent pin configuration failures?

When mux_pinmux_set_mux() returns -EBUSY on contention during a consumer's
probe, the error propagates up to the pinctrl core in pinctrl_bind_pins().

Because the device core intentionally ignores most errors from
pinctrl_bind_pins() (only propagating -EPROBE_DEFER and -EINVAL), it
swallows the -EBUSY error. As a result, the probe silently succeeds while
the device's pins remain unconfigured.

>  	if (ret)
>  		return ret;
> =20

[Severity: High]
This is a pre-existing issue, but is it safe to add functions to the radix
tree without locking?

When multiple consumer devices probe concurrently, their execution paths
can run in parallel and invoke pinctrl_dt_to_map(), which calls
mux_pinmux_dt_node_to_map() on the shared generic mux:

drivers/pinctrl/pinctrl-generic-mux.c:mux_pinmux_dt_node_to_map() {
    ...
	ret =3D pinmux_generic_add_function(pctldev, np_config->name, group_names,
					  1, function);
    ...
}

Because pinmux_generic_add_function() modifies pctldev->pin_function_tree
and increments pctldev->num_functions without protection, concurrent
insertions can structurally corrupt the radix tree.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715193546.2852=
108-1-Frank.Li@oss.nxp.com?part=3D1
