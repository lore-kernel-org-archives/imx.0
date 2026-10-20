Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495520;
	b=tINknnhe7vQyeuIAgWV3atL5bj3j+x6/K4KIqYggSJ+Fm0x2NjMFKDyT/ZO+dSA3auts
	 bp8tr8oybeyDGTYW3SNz6YaL2zzx2a7kQeNVdfErtJGc/3mYGxKi+A2Wnhs3DFbvr2hTp
	 SJE7FGpKa2FKUHDiMicZJ8JVP2jcROHeNju2pVwbe6FQ8bJ76BkponpV7waXtHv76sMXY
	 az9oDJjC4P5+oznXA6xxzuh+y1v7B/AmXhz6lSfeq9XZFecttIlsYEFPidvotOipRzNf+
	 GhFHUwbhRfoSTI2oN7kNjRJsHMPDRbyPsdY6N0IW7RMmxsLEi8ARLqiAcjop/UCQqxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=4DDHfULZCMXfKJmNIYoOvk990SrMTlrtJb/r57iKJOo=;
	b=Gbikj9hm69zu5CozQE1RTn0YDh/iXEj4ugjwBhHVFV1glaYVopr0jT678SBopUrcvzJJ
	 RVPuwoN6HMltf3FhlS6JgpjDjTtMOCCjjC2mVvC2x4sAe19OonRfpdsI18ejtz5RGw5PV
	 hA+K3XcwT5baYTNPx75zb4cpGKyEMwaquvQP4HCQVUJmREhCsHjo5p2LjqDxqP2w/v2ut
	 GZMbOmCmVkHXwsxafgVNqnDDVxiGjGrjVsEmDbsLOKXk0zQqDSqS/SvslgeQx6cCEoYMA
	 e/Qfn7D0cvJ5r96TQOcktWFHEOpcBoE6t3iG+UD/sUoLrYbJ9OJ5K0ZGAiUnznGIzVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AfbkziFD;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8399606A319
	for <imx@lists.linux.dev>; Tue, 20 Oct 2026 11:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8399606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AfbkziFD
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35d0be18c71so671175eec.1
        for <imx@lists.linux.dev>; Tue, 20 Oct 2026 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792495519; x=1793100319; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4DDHfULZCMXfKJmNIYoOvk990SrMTlrtJb/r57iKJOo=;
        b=AfbkziFDAOh1ELKdHSa3PgKiFeBavSdNhD7xUIFTofHo+/cu/zuRPtyo7Z1Eqm21je
         qPY22hQ5RnJN5AXhm5JwPoLTsfe3bnT6XKnjdor+pveEvW9EJszl8Qz6casv9NKRD8vx
         c6G4kh+HPtxvfxAs0PRESWyaTa6rX32YbB728zWIHhJOLz+JMVkMu3wir1zRnPqw62jy
         eGhx7+udAVUvfl3fXZq+Va6n8QaOUziEZFgaqyw1bV+F/CK4hAeWUY6NCa+yB4rOhxTt
         goW5UhGjY67PQ+9oc2OLwmF16ZJ8nJhyJg35jQJlrjEnL1+5NQc7CmfV7vmLU/qZM5TC
         VL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792495519; x=1793100319;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4DDHfULZCMXfKJmNIYoOvk990SrMTlrtJb/r57iKJOo=;
        b=DSIh0gHNqpCmlIiIChCysNE82muAEUBPXmxTdVH+Ooe0CXzEPfmDJArda169KOtvpT
         4rUBDjkwvY9feI1zehBKGuM18dheUO//Z4SeFUh1GanIW8f+ylNJV/7Od44t6StwNXke
         cEkO9TRYJY7F8CxObNtspWJY5cob4UV9c0hmcr8IpquBZKSuiPDKSAnvyurA5LZTiyuQ
         D6IRXZ+gTwg0By0/ndksp1o/SFOIjeaMkIOJM8AItraDmVKynnnyqjJxUt9SB0lxO0Ar
         O4odwaLpIcI8e0UabkZqQTIFtfmhn5fSSIBp78JAPALpGaaqgeMvSOLeD/IGkK8cfesQ
         WLKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVJmq3d986XCxnNxZ0nnCYnfE8+9uhaMrhd3yJ3MxgUJc96X9dwfZwo5LKenw5tfBi2Co=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ1Okt4FtdWJ2ogo5AchGsse79C6LmkShehQKdgLvoOH8OSOS3z
	KCj/rykW29/gmR0iWvCHnMfPV/Ud7KfIzHS5xZc5imlXZoIn2UFGkc9R
X-Gm-Gg: AYBFou0RiCWOdxdSxku2LBTuGscKcyKEF83FJte9EB6mYbUMH5O49mrxf3snn/1d0rm
	CcYqag1ges8LZa3Iz6nkSOKsCEqAcVfpp7vdSk37rN2vDDFUyQEjgEz7hKTZOjGspL///rDyGLY
	Vs5d6gSEkXIXJrBOnrPSG4XB8qm/1sdoF/UXH+WkZbAUE9pPLb7wyzxExwGCo8FRqb3IXS2xNEA
	ccsHCPj0NlEqsqT3XH3/nYp0kiCJjMqpiFfnAtQmZjeBFU0xSNkXVfAgHG+/fGmiEmOG03bxPwq
	BNPDI8xF/QutkbJDgwszTegLx77PW+PY5zWmnQKuC9OhnlqeJLU81CRV2bspIDdGziICuo4I6xX
	l3BV+LwzWER5++VoLvyV2/Z9cDlxi9t4hL5UE1Hkan358tdZtodf2oc/AYisQSYvmDWD9MfqvAJ
	cEKFOvgd1TteNv1KpcEvenOqJF1bLh/8NXwTicR5vkxgcojQdIRaWe5jJVotG34ivMmV4WbF5uW
	Z76
X-Received: by 2002:a05:701b:4553:20b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-18db9f2cfbbmr2343488c88.12.1792495518528;
        Tue, 20 Oct 2026 04:25:18 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm48988354c88.16.2026.10.20.04.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:25:17 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:25:10 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: sashiko-reviews@lists.linux.dev, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Frank Li <Frank.li@oss.nxp.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v2 2/3] drm/bridge: simple-bridge: Support
 data-enable-active endpoint property
Message-ID: <svnjkyubpps5ocerr3pdaylmhsvlo44olqax7fcco2hahahocd@xnvocnkddfu6>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-2-ef6a3a780472@toradex.com>
 <sashiko-outbox-176995@kernel.org>
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
In-Reply-To: <sashiko-outbox-176995@kernel.org>

On Mon, Oct 19, 2026 at 10:34:06AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] drm/bridge: simple-bridge: missing atomic_check() to propagate DE bus flags
> - [Medium] drm/bridge: simple-bridge: timings devm_kzalloc() lifetime mismatch
> --
> 
> commit 17d03fa8dcd99e5bb3af7da622344c856ca2c887
> Author: Leonardo Costa <leonardo.costa@toradex.com>
> 
> drm/bridge: simple-bridge: Support data-enable-active endpoint property
> 
> This commit reads the data-enable-active property from the input endpoint in
> simple_bridge_probe() and allocates a drm_bridge_timings structure to set
> DRM_BUS_FLAG_DE_HIGH or DRM_BUS_FLAG_DE_LOW in input_bus_flags when the bridge
> does not already define its own timings.
> 
> > diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> > index 3fba7002322e9..393228bed6e28 100644
> > --- a/drivers/gpu/drm/bridge/simple-bridge.c
> > +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> > @@ -171,6 +171,9 @@ static int simple_bridge_probe(struct platform_device *pdev)
> >  {
> >  	struct simple_bridge *sbridge;
> >  	struct device_node *remote;
> > +	struct device_node *ep;
> > +	bool de_present;
> > +	u32 de;
> >  
> >  	sbridge = devm_drm_bridge_alloc(&pdev->dev, struct simple_bridge,
> >  					bridge, &simple_bridge_bridge_funcs);
> > @@ -208,10 +211,26 @@ static int simple_bridge_probe(struct platform_device *pdev)
> >  		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->enable),
> >  				     "Unable to retrieve enable GPIO\n");
> >  
> > -	/* Register the bridge. */
> >  	sbridge->bridge.of_node = pdev->dev.of_node;
> >  	sbridge->bridge.timings = sbridge->info->timings;
> >  
> > +	ep = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1);
> > +	de_present = !of_property_read_u32(ep, "data-enable-active", &de);
> > +	of_node_put(ep);
> > +
> > +	if (de_present && !sbridge->bridge.timings) {
> > +		struct drm_bridge_timings *timings;
> > +
> > +		timings = devm_kzalloc(&pdev->dev, sizeof(*timings), GFP_KERNEL);
> > +		if (!timings)
> > +			return -ENOMEM;
> 
> [Severity: Medium]
> Can allocating timings with devm_kzalloc() in simple_bridge_probe() cause a
> lifetime mismatch with sbridge->bridge?
> 
> sbridge is allocated via devm_drm_bridge_alloc(), which manages the container's
> lifetime through sbridge->bridge.refcount and only frees it in
> __drm_bridge_free() after all drm_bridge references are dropped:
> 
> drivers/gpu/drm/drm_bridge.c:__drm_bridge_free()
> 	if (bridge->funcs->destroy)
> 		bridge->funcs->destroy(bridge);
> 
> 	drm_bridge_put(bridge->next_bridge);
> 
> 	kfree(bridge->container);
> 
> If pdev is unbound while an upstream bridge or encoder still holds a reference
> to sbridge->bridge, devres_release_all() will free timings immediately, leaving
> sbridge->bridge.timings as a dangling pointer that can be dereferenced by
> upstream drivers (for example, in imx8mp_hdmi_pvi_bridge_enable()).
> 
> Would embedding struct drm_bridge_timings inside struct simple_bridge (as done
> in lvds-codec.c and ti-tfp410.c), or pointing to static const
> drm_bridge_timings instances for DRM_BUS_FLAG_DE_HIGH and DRM_BUS_FLAG_DE_LOW,
> avoid this lifetime mismatch?

This seemed to make sense to me, but I'm having trouble implementing either of
Sashiko's suggestions in a proper way, as both seemed problematic to me when
actually trying to make the changes. 

Adding static const drm_bridge_timings instances for each of the flags goes
against the current pattern of using these to list configurations of actual
pieces of hardware.

On the other hand, embedding struct drm_bridge_timings inside
struct simple_bridge leads to duplicating information in the driver. It would
look something like in the diff below. In this case, when the bridge provides
a timings struct, the embedded drm_bridge_timings needs to receive a copy of it,
despite serving no purpose in this situation, it seems to me to add too much
complexity.

Laurent, do you think this is still better than adding a compatible for the
Apalis iMX6 VGA bridge, as was done in V1? Let me know if you think any of
these concerns are not actual issues, or if you think there is a pattern that
better fits this driver.

Best regards,
Leonardo

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 848c2df2a276..9787eb7f7b82 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -28,6 +28,7 @@ struct simple_bridge_info {
 struct simple_bridge {
 	struct drm_bridge	bridge;
 	struct drm_connector	connector;
+	struct drm_bridge_timings timings;
 
 	const struct simple_bridge_info *info;
 
@@ -183,6 +184,8 @@ static int simple_bridge_probe(struct platform_device *pdev)
 {
 	struct simple_bridge *sbridge;
 	struct device_node *remote;
+	struct device_node *ep;
+	u32 de;
 
 	sbridge = devm_drm_bridge_alloc(&pdev->dev, struct simple_bridge,
 					bridge, &simple_bridge_bridge_funcs);
@@ -220,10 +223,24 @@ static int simple_bridge_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->enable),
 				     "Unable to retrieve enable GPIO\n");
 
-	/* Register the bridge. */
 	sbridge->bridge.of_node = pdev->dev.of_node;
 	sbridge->bridge.timings = sbridge->info->timings;
 
+	if (sbridge->info->timings)
+		sbridge->timings = *sbridge->info->timings;
+
+	ep = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1);
+
+	if (!of_property_read_u32(ep, "data-enable-active", &de) &&
+	    !sbridge->bridge.timings) {
+		sbridge->timings.input_bus_flags |= de ? DRM_BUS_FLAG_DE_HIGH :
+							 DRM_BUS_FLAG_DE_LOW;
+		sbridge->bridge.timings = &sbridge->timings;
+	}
+
+	of_node_put(ep);
+
+	/* Register the bridge. */
 	return devm_drm_bridge_add(&pdev->dev, &sbridge->bridge);
 }

> > +
> > +		timings->input_bus_flags = de ? DRM_BUS_FLAG_DE_HIGH :
> > +						DRM_BUS_FLAG_DE_LOW;
> > +		sbridge->bridge.timings = timings;
> > +	}
> 
> [Severity: High]
> Will setting only sbridge->bridge.timings->input_bus_flags actually propagate
> the DE polarity to upstream atomic encoders and bridges?
> 
> simple_bridge_bridge_funcs registers atomic state callbacks without an
> .atomic_check callback:
> 
> drivers/gpu/drm/bridge/simple-bridge.c:
> static const struct drm_bridge_funcs simple_bridge_bridge_funcs = {
> 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
> 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 	.attach		= simple_bridge_attach,
> 	.atomic_enable = simple_bridge_enable,
> 	.atomic_disable = simple_bridge_disable,
> };
> 
> During an atomic modeset, drm_atomic_bridge_chain_check() calls
> drm_atomic_bridge_propagate_bus_flags(), which overwrites
> bridge_state->input_bus_cfg.flags with output_flags from the downstream bridge
> or connector (0 for a VGA connector) and never checks
> bridge->timings->input_bus_flags:
> 
> drivers/gpu/drm/drm_bridge.c:drm_atomic_bridge_propagate_bus_flags()
> 	bridge_state->output_bus_cfg.flags = output_flags;
> 	...
> 	bridge_state->input_bus_cfg.flags = output_flags;
> 
> Because simple-bridge has a valid drm_bridge_state, upstream bridges and atomic
> encoders such as imx_pd_bridge_atomic_check() in
> drivers/gpu/drm/imx/ipuv3/parallel-display.c read
> next_bridge_state->input_bus_cfg.flags instead of
> next_bridge->timings->input_bus_flags:
> 
> drivers/gpu/drm/imx/ipuv3/parallel-display.c:imx_pd_bridge_atomic_check()
> 	if (next_bridge_state)
> 		bus_flags = next_bridge_state->input_bus_cfg.flags;
> 	else
> 		bus_flags = di->bus_flags;
> 
> As a result, bus_flags remains 0 instead of DRM_BUS_FLAG_DE_LOW or
> DRM_BUS_FLAG_DE_HIGH.
> 
> Should simple_bridge_bridge_funcs implement an .atomic_check callback that
> copies sbridge->bridge.timings->input_bus_flags into
> bridge_state->input_bus_cfg.flags (similar to tfp410_atomic_check() in
> drivers/gpu/drm/bridge/ti-tfp410.c)?
> 
> > +
> > +	/* Register the bridge. */
> >  	return devm_drm_bridge_add(&pdev->dev, &sbridge->bridge);
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com?part=2

This second finding was a false positive, as per my response in the 3/3
patch.
