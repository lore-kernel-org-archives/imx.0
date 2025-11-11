Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170CC274B3A
	for <imx@lists.linux.dev>; Tue, 11 Nov 2025 15:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762875290; cv=none; b=UvD7Sq76XCpDIo4bjUq+NlKLssmVJ9U2jO9DaeKT0RWFMr3xjTfZn15UrpP86J3ctYYR8cYmdweJ/BHeMzWTPcm4Um857uN7yaga5akxZQgRMFrBzR+DPoXFD43dAVWIE84RfkjBFgSQKFOYlWM9w3mbT2nWAwQkNqp8S+twKD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762875290; c=relaxed/simple;
	bh=hOmcafjZPg6SHZr+V8PE6clFN6DZIDqO+9oH38VUBuU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=AodVGt57nBzOojdjUQSJG2Gn/MZ4/GO1IrMg1zq9w+LrtyuArAodGEtcohMhc9VZ8VSrRYsDy9wdtOj3aO87nC48oZRTzan9nnZGQNQlL4mg/SVMOTADTje21byX5ByymmC6Rihy7sy4kkVd7k0CVVmYdaWPSHNBpNNkzyn8gWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dcWoxlhb; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dcWoxlhb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 37B541A19D5;
	Tue, 11 Nov 2025 15:34:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1AE3606FB;
	Tue, 11 Nov 2025 15:34:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 617AD102F24BC;
	Tue, 11 Nov 2025 16:34:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762875285; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AZNoYO2KmFfwFwuTUFR8c8puoFPJACFPh0RfsqqUzSw=;
	b=dcWoxlhbghOguWX14zZ4+4NalkiXI6Xkf/Mk6ulAA4ZHs3HbWJsrpQdbJtjmvOWVGIWXW9
	5qeBCfSRcI768hrd+wydfZgANmSkqGRc/5K6cUXxTqkRiCT25hskAQ5IpV6QhJm+yPM2zg
	mJhotskErvWENo8gnEqwDQ+aWtZ/xDo8mH+GN0QzgZaPR8W9BXLPLase34n0e3kuOdLJu0
	GS56OuHkXYFmdLmIVbCkLH6d7R9yLdKRDgs2TEO6HukJGjh2T47e09LcWusCF8C3+f4DW8
	X4xW3f8D8FnmWPkabEcTkJiosazMyinaaVu0PG0xviD6Tswp8ifk+kVj2ucs/g==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Nov 2025 16:34:39 +0100
Message-Id: <DE5Z4R8JBA2F.1SKUAS1R6BCGY@bootlin.com>
Cc: <dri-devel@lists.freedesktop.org>, "Sandor Yu" <sandor.yu@nxp.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
To: "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>, <imx@lists.linux.dev>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 5/9] drm/imx: Add support for i.MX94 DCIF
X-Mailer: aerc 0.20.1
References: <20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com>
 <20251103-dcif-upstreaming-v6-5-76fcecfda919@oss.nxp.com>
In-Reply-To: <20251103-dcif-upstreaming-v6-5-76fcecfda919@oss.nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Nov 3, 2025 at 4:30 PM CET, Laurentiu Palcu wrote:
> From: Sandor Yu <sandor.yu@nxp.com>
>
> The i.MX94 Display Control Interface features:
>  * Up to maximum 3 layers of alpha blending:
>     - 1 background layer(Layer 0);
>     - 1 foreground layer(Layer 1);
>     - A programmable constant color behind the background layer;
>  * Each layer supports:
>     - programmable plane size;
>     - programmable background color;
>     - embedded alpha and global alpha;
>  * Data output with CRC checksum for 4 programmable regions;
>
> Signed-off-by: Sandor Yu <sandor.yu@nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

[...]

> +static struct drm_bridge *dcif_crtc_get_bridge(struct drm_crtc *crtc,
> +					       struct drm_crtc_state *crtc_state)
> +{
> +	struct drm_connector_state *conn_state;
> +	struct drm_encoder *encoder;
> +	struct drm_connector *conn;
> +	struct drm_bridge *bridge;
> +	int i;
> +
> +	for_each_new_connector_in_state(crtc_state->state, conn, conn_state, i)=
 {
> +		if (crtc !=3D conn_state->crtc)
> +			continue;
> +
> +		encoder =3D conn_state->best_encoder;
> +
> +		bridge =3D drm_bridge_chain_get_first_bridge(encoder);
> +		if (bridge)
> +			return bridge;
> +	}
> +
> +	return NULL;
> +}
> +
> +static void dcif_crtc_query_output_bus_format(struct drm_crtc *crtc,
> +					      struct drm_crtc_state *crtc_state)
> +{
> +	struct dcif_crtc_state *dcif_state =3D to_dcif_crtc_state(crtc_state);
> +	struct drm_bridge *bridge __free(drm_bridge_put) =3D NULL;
> +	struct drm_bridge_state *bridge_state;
> +
> +	dcif_state->bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
> +	dcif_state->bus_flags =3D 0;
> +
> +	bridge =3D dcif_crtc_get_bridge(crtc, crtc_state);
> +	if (!bridge)
> +		return;
> +
> +	bridge_state =3D drm_atomic_get_new_bridge_state(crtc_state->state, bri=
dge);
> +	if (!bridge_state)
> +		return;
> +
> +	dcif_state->bus_format =3D bridge_state->input_bus_cfg.format;
> +	dcif_state->bus_flags =3D bridge_state->input_bus_cfg.flags;
> +}

I haven't reviewed the entire patch in detail, but the refcounting is
correct now:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # bridge refcounting

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
