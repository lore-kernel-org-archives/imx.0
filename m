Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CF04D7D21;
	Mon, 19 Oct 2026 10:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406171; cv=none; b=mkRceGGsSsE0kfbJv1SplB+p8qF7kZleTbR7R5/GzHQ2+RZxn6AoTPtJuQNqxXirNtUEP25uJhAMt/OHQNEPompyYyzMZabUiwf472kAWWdpXGaOOpUuxGGM4DNykxegfpgssnZlHQQc0axIyPjxE0XnAQCL9pS+7dcHQZELu5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406171; c=relaxed/simple;
	bh=ZiVNxqQR/u4Ci29N2YHi05R+bfI/MdekS0OCzuSYnRI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=eGvYuLCZVcaemtiFXEXopici/LUN8SoS5VvaHZLzRt3SCVD3CVvW6HMVMGndXMOTU59XbJUo1DQwvNzalwFNlIh8L+AN6Y/+7agxl/pVxGWrl/m6dEHUuerc2OOmawe+m68EYe5TfVYJCmJNDbn6kL6DEmusOB1tL7Hx87cbNOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGb2tfKG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGb2tfKG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F6E1F000C4;
	Mon, 19 Oct 2026 10:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792406170;
	bh=PI9AeKxwP0CwhGbVllNbx6krpwtM2PRvUhXT8Vzgt5M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NGb2tfKGnDil3eYBe7ZpO4AmaGnOXX2vMjzwldNag7D3T1wlMkCSK0DcZxZh8Jdhr
	 eVdf4ajMa9vNotnWujq1qzu4sh2zKR1AvtODC0Wu3TSLnPbGen1OIiyGlxBm7KxNHR
	 vkmymdGjq+Mx0ZxBsSiDSX2cS7VUElLVg2yY9YJp2xn3GA66s/RukJ5KsdqDwAgK6Y
	 vZl+0d1jUDyyr1f5arLLUZ+zwGhyYuEBV2TAPCP9P/NKZceWY5mpEeB0iBykBBcxrl
	 D1iwOseVSHRH6QZX4xYxA1ivwthJsx0FgeBBxFFYxdiKiy1CRW+J+r/osTUqFwG66O
	 Xu/ruwb0r72ag==
Message-ID: <sashiko-outbox-177001@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] ARM: dts: imx6q-apalis: Add VGA overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Leonardo Costa" <leoreis.costa@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261019-v2-apalis-imx6-enable-vga-v2-3-ef6a3a780472@toradex.com>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-3-ef6a3a780472@toradex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 10:36:09 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ARM: dts: imx6q-apalis: VGA data-enable-active ignored by simple-b=
ridge
--

commit a66c8dd73182954ba43ed81cada90ae73edf93a0
Author: Leonardo Costa <leonardo.costa@toradex.com>

ARM: dts: imx6q-apalis: Add VGA overlay

This commit adds a device tree overlay for the VGA output on the Apalis
Evaluation Board, connecting the parallel RGB display interface to a
non-programmable video DAC and VGA connector with an active-low data-enable
signal, and wires up composite DTB targets in the Makefile.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso b/arch/=
arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
> new file mode 100644
> index 0000000000000..991c2b7c27773
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
> @@ -0,0 +1,80 @@

[ ... ]

> +	vga-encoder {
> +		compatible =3D "dumb-vga-dac";
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +
> +				vga_enc_in: endpoint {
> +					data-enable-active =3D <0>;
> +					remote-endpoint =3D <&vga_display_out>;
> +				};
> +			};

[Severity: High]
Does data-enable-active =3D <0> on vga_enc_in actually reach the IPUv3
CRTC?

In simple_bridge_probe() in drivers/gpu/drm/bridge/simple-bridge.c, the
data-enable-active property is parsed into timings->input_bus_flags:

	if (de_present && !sbridge->bridge.timings) {
		struct drm_bridge_timings *timings;

		timings =3D devm_kzalloc(&pdev->dev, sizeof(*timings), GFP_KERNEL);
		if (!timings)
			return -ENOMEM;

		timings->input_bus_flags =3D de ? DRM_BUS_FLAG_DE_HIGH :
						DRM_BUS_FLAG_DE_LOW;
		sbridge->bridge.timings =3D timings;
	}

However, simple_bridge_bridge_funcs registers atomic bridge state
callbacks without an .atomic_check callback:

static const struct drm_bridge_funcs simple_bridge_bridge_funcs =3D {
	.atomic_create_state =3D drm_atomic_helper_bridge_create_state,
	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
	.attach		=3D simple_bridge_attach,
	.atomic_enable =3D simple_bridge_enable,
	.atomic_disable =3D simple_bridge_disable,
};

During drm_atomic_bridge_chain_check() ->
drm_atomic_bridge_propagate_bus_flags(), sbridge's
bridge_state->input_bus_cfg.flags is overwritten with the downstream
display-connector bridge's input_bus_cfg.flags (which is 0), and
sbridge->bridge.timings->input_bus_flags is never copied into
bridge_state->input_bus_cfg.flags.

Then, upstream in imx_pd_bridge_atomic_check() in
drivers/gpu/drm/imx/ipuv3/parallel-display.c:

	if (next_bridge)
		next_bridge_state =3D drm_atomic_get_new_bridge_state(crtc_state->state,
								    next_bridge);

	if (next_bridge_state)
		bus_flags =3D next_bridge_state->input_bus_cfg.flags;
	else
		bus_flags =3D di->bus_flags;

Because next_bridge_state is non-NULL, bus_flags is read as 0 from
next_bridge_state->input_bus_cfg.flags without consulting
next_bridge->timings->input_bus_flags.

When ipu_crtc_mode_set_nofb() -> ipu_di_init_sync_panel() runs,
sig_cfg.enable_pol =3D !(imx_crtc_state->bus_flags & DRM_BUS_FLAG_DE_LOW)
evaluates to 1, driving the data-enable pin active-high instead of
active-low and gating off the VGA DAC output during active video.

Should simple-bridge implement .atomic_check to populate
bridge_state->input_bus_cfg.flags from bridge->timings->input_bus_flags
 so the active-low polarity is propagated to imx-parallel-display?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-v2-apalis-=
imx6-enable-vga-v2-0-ef6a3a780472@toradex.com?part=3D3
