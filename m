Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490677;
	b=I/l5qncnexTJ6hzXj4diVs58ewXQiT/lHQ4U7nFSyV2N7Jk+GYX6TrgHcXNKoA0f+6QV
	 JX0nUnLdY7wV/jeICbG1uAMzd/QiY2RN6DjXl96CHndMzbGOGKyYVJdW7XIoWGH1wiyfS
	 LTSqUaDl37/Jt3qAPkVcSgGen6lkBUL06Mbfm2g/ie/0GTVyPIa+fKGZSHYwcXbXA3hAh
	 5e6OV8jVIYicvJ+UFqRI0tcKkIfFwDVKRKjGSvqV1FlTBPk93gitmJo6ABT56XG4BxglC
	 otvTGn7kAc8TbGXFyK/Nv9S2TvaN8GwhkciAqW3ZosiBfGx8CXBkQERuWd0iM17xc0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=U0/lnzk5hFsVd5ZzP5Fnt4j1JlLknKQhx8BKtAG3IEE=;
	b=Mv54FHThXzDM4L/eGR4MxxhtSnrokEpAVKe9vLUsD0QcfSCdeX5cPurdu8Yr3Sg4L4bO
	 +ifG5x9V1yaTGi74+Si6PmBL0UyJcDxs1UysVTHvydheKGuL8tBDcqUrcFQ7yDEjxU99Y
	 BDbdQrNuoZTPFkezd0CNn5q9gUAe08clI5vpXVr79HgFjDFse/5wXyTwjETh+hWuYs7O8
	 HiFDlloEV15EUsNe2n6/Og2ZPKTQkLw3YMKQJg7egHpPQnY9THYMyvVFj7hNB6n8teM52
	 0ECQ4hqFCXgoKoEKfNUgp2HyD/+znIYDwc6blH7ZU5zlv1wgzE0wFNxYF3vVuZzqk2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o+2RxzIm;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BF5606A31D
	for <imx@lists.linux.dev>; Tue, 20 Oct 2026 10:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75BF5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o+2RxzIm
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-188406bb948so397040c88.1
        for <imx@lists.linux.dev>; Tue, 20 Oct 2026 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792490676; x=1793095476; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U0/lnzk5hFsVd5ZzP5Fnt4j1JlLknKQhx8BKtAG3IEE=;
        b=o+2RxzImk6rim5NkI4UGDo51eHi0wrk3XL7J5fZP2AFG5N/SPPqTMIgzh+zgeZ7dX3
         YvxVA0yfigOY4FIunIqPF+gGfAQe5Ay8CAhNY9UDZqYr+SjdJu7P5fHznEXrMj4Pf2Po
         ToHJcDh+BgDhmOPqMF5mOCl5EtPmX/qL9Y20DD2pKmgvydaL23I9jAQ6PRaP8B/V3NM5
         nyJDrlrp9W3KqoObz+U6y8YgrySuq4+NpYPO3VwVBt7JcBOAJwBrTemNwwfj4Z+XaOb4
         DWB6cExiGHG0Rb8QHP/0+A6Dgra4vEiVO5UGZvWhf9PMkxqxXJd5nirJqt8B7x4ZmZa1
         PWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792490676; x=1793095476;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U0/lnzk5hFsVd5ZzP5Fnt4j1JlLknKQhx8BKtAG3IEE=;
        b=BcOtISkaK+tAuov0XmKSzVc5WiMcZi1PkOe+co4S6hfDmvgeAdwK4TLuAHhBSG6+4X
         Tb5geK8u7jNwgl6s4CRJiFKiALtNzrYS2Lnrof6fwbOWCAPwWSy+Ucv1N/bO9O1ubMWL
         bT97c0qmH6smImhppZ16zdFWxpskDERZUe3o61M9E1lVuAitEHvh6BaeEBzCPcYkeIqO
         gcgBX82BPS/A5TB+UmqksT8pINgDLxHMGUkRG10Y2NgH92Mn/0H/twNac3QmfQ1lV1Nn
         DyQM+xRWzExtjwRaBfJYY2AhEvaNmZ7ZY5CrluhNDrtqObWRkecwaY3g/OeEpuZwd9yo
         cJ4A==
X-Forwarded-Encrypted: i=1; AKwUvBz87uZu4CZ48aI01DQ4Ctt5Ee/Xw6MUFdLZveJ2YBleThtMqksOplTME2z9fy8dRFrAZ6s=@lists.linux.dev
X-Gm-Message-State: AFq9FYLWjSEgVZZJ4mHpMO4j8s/BRsIPxexUTtUWByMITJItW+yrqxkA
	BeHAF6U07ZEBebfh7jnh1hProgHSyOyp3p+bRee2V1Hpsucl2tYBGzPW
X-Gm-Gg: AYBFou2pYLyF7KzUF0Y/APbYmf8cNAry6llvlq9nTbLf3OfrTeW+LGgzQyv2fX9S5vl
	F1A6yoGg6zvzro5A6fI7wEkODWsV8kIiOH3v7rcwIcfofK2XvUiVW9ZxFDKYa3mn9Whhb69d/rt
	VjbqphJKAhEkHIBgZk2AXmTSCw1L1FuKz2IOo/Ec4EWnmM77mNABbERhdXQmw28bpbNX+DxOqMI
	srj2ipTlD+lfTP2aHfGv2LbGNLb4l0EauqTk6YdAZIOng9k/6QOnUpPyTm9Fo1+d+AaAcoEuYf8
	BLcJ5DzKt85Uo95I/KRnecT6psgMuKokWKwi+sfwRTjfphF+zrHGcyXjGnzLC7NpytMssqzNTWL
	js4f0JoJtZv6k3ZJlBVsr1kUpa/V+tr/Aht/doaWyP1Lwwvq6C+YyXD+RAo8T+8Fowvem3iPDyx
	FnP8Aedj0BgRRjyHxDsQgro+PXhqE4NTEAxnPRNIYZkuUi/EJHOPEJaB9KZbmKf+LKh7858/2Ir
	V7hFs3fUpDLG8DEUQ8mU/70Ep1lZKR6OhMRMNNHp4o9AveDjfEwyQbPGnwPwg==
X-Received: by 2002:a05:701b:204f:20b0:151:7f08:5961 with SMTP id a92af1059eb24-1850c9cf541mr15980378c88.4.1792490675971;
        Tue, 20 Oct 2026 03:04:35 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831996071csm36076766c88.9.2026.10.20.03.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:04:35 -0700 (PDT)
Date: Tue, 20 Oct 2026 07:04:29 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v2 3/3] ARM: dts: imx6q-apalis: Add VGA overlay
Message-ID: <t5mkri7cbalmy55ylrb7stanrnmxc7ep4vhmtw2nzulhgdi6wm@jsdhywrqubwx>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-3-ef6a3a780472@toradex.com>
 <sashiko-outbox-177001@kernel.org>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-177001@kernel.org>

On Mon, Oct 19, 2026 at 10:36:09AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ARM: dts: imx6q-apalis: VGA data-enable-active ignored by simple-bridge
> --
> 
> commit a66c8dd73182954ba43ed81cada90ae73edf93a0
> Author: Leonardo Costa <leonardo.costa@toradex.com>
> 
> ARM: dts: imx6q-apalis: Add VGA overlay
> 
> This commit adds a device tree overlay for the VGA output on the Apalis
> Evaluation Board, connecting the parallel RGB display interface to a
> non-programmable video DAC and VGA connector with an active-low data-enable
> signal, and wires up composite DTB targets in the Makefile.
> 
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
> > new file mode 100644
> > index 0000000000000..991c2b7c27773
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso
> > @@ -0,0 +1,80 @@
> 
> [ ... ]
> 
> > +	vga-encoder {
> > +		compatible = "dumb-vga-dac";
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				vga_enc_in: endpoint {
> > +					data-enable-active = <0>;
> > +					remote-endpoint = <&vga_display_out>;
> > +				};
> > +			};
> 
> [Severity: High]
> Does data-enable-active = <0> on vga_enc_in actually reach the IPUv3
> CRTC?
> 
> In simple_bridge_probe() in drivers/gpu/drm/bridge/simple-bridge.c, the
> data-enable-active property is parsed into timings->input_bus_flags:
> 
> 	if (de_present && !sbridge->bridge.timings) {
> 		struct drm_bridge_timings *timings;
> 
> 		timings = devm_kzalloc(&pdev->dev, sizeof(*timings), GFP_KERNEL);
> 		if (!timings)
> 			return -ENOMEM;
> 
> 		timings->input_bus_flags = de ? DRM_BUS_FLAG_DE_HIGH :
> 						DRM_BUS_FLAG_DE_LOW;
> 		sbridge->bridge.timings = timings;
> 	}
> 
> However, simple_bridge_bridge_funcs registers atomic bridge state
> callbacks without an .atomic_check callback:
> 
> static const struct drm_bridge_funcs simple_bridge_bridge_funcs = {
> 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
> 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 	.attach		= simple_bridge_attach,
> 	.atomic_enable = simple_bridge_enable,
> 	.atomic_disable = simple_bridge_disable,
> };
> 
> During drm_atomic_bridge_chain_check() ->
> drm_atomic_bridge_propagate_bus_flags(), sbridge's
> bridge_state->input_bus_cfg.flags is overwritten with the downstream
> display-connector bridge's input_bus_cfg.flags (which is 0), and
> sbridge->bridge.timings->input_bus_flags is never copied into
> bridge_state->input_bus_cfg.flags.
> 
> Then, upstream in imx_pd_bridge_atomic_check() in
> drivers/gpu/drm/imx/ipuv3/parallel-display.c:
> 
> 	if (next_bridge)
> 		next_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> 								    next_bridge);
> 
> 	if (next_bridge_state)
> 		bus_flags = next_bridge_state->input_bus_cfg.flags;
> 	else
> 		bus_flags = di->bus_flags;
> 
> Because next_bridge_state is non-NULL, bus_flags is read as 0 from
> next_bridge_state->input_bus_cfg.flags without consulting
> next_bridge->timings->input_bus_flags.
> 
> When ipu_crtc_mode_set_nofb() -> ipu_di_init_sync_panel() runs,
> sig_cfg.enable_pol = !(imx_crtc_state->bus_flags & DRM_BUS_FLAG_DE_LOW)
> evaluates to 1, driving the data-enable pin active-high instead of
> active-low and gating off the VGA DAC output during active video.
> 
> Should simple-bridge implement .atomic_check to populate
> bridge_state->input_bus_cfg.flags from bridge->timings->input_bus_flags
>  so the active-low polarity is propagated to imx-parallel-display?
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com?part=3

This and the other comment regarding atomic_check are addressed by the
patch series below, which is listed as a dependency for this patch series:

    https://lore.kernel.org/all/20261002-v1-simple-bridge-atomic-check-v1-1-ef5d8332b078@toradex.com/T/#u

Leonardo
