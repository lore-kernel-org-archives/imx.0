Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C995714900E
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 02:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785119530; cv=none; b=jTVi7GIAFKufPnZoV6UMCEFNUcOBxsQWr8fAtZo2bkYz0svWvLBEgYo/za9DxYYyjLXOnUj48xU7OIZ0MKnHhQrtF2qtePVDPpDSDnC8Ji0O03YBlOjsam8kz7nKjZkdNOrXYgD5ouMIvkuiZSAeSKYSge2FJ0wjImBrXPwtjBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785119530; c=relaxed/simple;
	bh=64PMluG1DNpwPFAXiOuswDsMoxLeslxRQJwL7V5dZW0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=L4W6NjGLjHkhB7JC6+AqW+ywajj73UR3nk6Wwq7TXVJZW6eFuAa67bNjAWA667MOWWzeOW5V25ZvN72iM+jkIgZ2B1NYs67PXS73fdTF5DFOAu7bgDXWB+Sfy7NEY6T1ESw+iEDD3NLjIaNrVQGfl9SC1218j//sHFkBap3LtQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 10:31:26 +0800
Message-Id: <DK901N0TGX2U.2GGI3J30WG6AK@oss.qualcomm.com>
Cc: <Frank.Li@kernel.org>, <imx@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/8] drm/mcde: replace struct drm_simple_display_pipe
 with regular atomic helpers
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-3-cd5dc89858c6@oss.qualcomm.com> <20260726195753.39C951F000E9@smtp.kernel.org>
In-Reply-To: <20260726195753.39C951F000E9@smtp.kernel.org>
X-Migadu-Flow: FLOW_OUT

On Mon Jul 27, 2026 at 3:57 AM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Sleeping functions called from atomic context in CRTC callbacks
> --
>
> --- Patch [3]: [PATCH v3 3/8] drm/mcde: replace struct drm_simple_display=
_pipe with regular atomic helpers ---
> commit ba616a75cb8eb47f91848c4e4530a9f09433e557
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
>
> drm/mcde: replace struct drm_simple_display_pipe with regular atomic help=
ers
>    =20
> Convert MCDE to explicit plane, CRTC and encoder objects.
>    =20
> Handle pending page-flip events from the CRTC atomic flush path using the
> commit-local CRTC state, and avoid manual connector/encoder attachment
> before the connector has been created by the bridge path.
>
>> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/=
mcde_display.c
>> index 257a6e84dd583..50c90cf84a9a3 100644
>> --- a/drivers/gpu/drm/mcde/mcde_display.c
>> +++ b/drivers/gpu/drm/mcde/mcde_display.c
> [ ... ]
>> @@ -1149,16 +1168,15 @@ static void mcde_setup_dsi(struct mcde *mcde, co=
nst struct drm_display_mode *mod
>>  	*dsi_formatter_frame =3D formatter_frame;
>>  }
>> =20
>> -static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
>> -				struct drm_crtc_state *cstate,
>> -				struct drm_plane_state *plane_state)
>> +static void mcde_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					   struct drm_atomic_commit *commit)
>
> [Severity: High]
> This is a pre-existing issue and not a regression introduced by this patc=
h,
> but does this function call sleeping APIs from an atomic context?
>
> During non-blocking commits, CRTC atomic callbacks execute in an atomic
> context where sleeping is not allowed. Looking at the implementation of
> mcde_crtc_helper_atomic_enable() in the wider context, it eventually call=
s
> regulator_enable() and clk_prepare_enable(), which can sleep.
>
> Can this lead to kernel warnings or deadlocks when this path is invoked?

False positive

>
>>  {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_plane *plane =3D &pipe->plane;
>>  	struct drm_device *drm =3D crtc->dev;
>>  	struct mcde *mcde =3D to_mcde(drm);
> [ ... ]
>> @@ -1298,9 +1316,10 @@ static void mcde_display_enable(struct drm_simple=
_display_pipe *pipe,
>>  	dev_info(drm->dev, "MCDE display is enabled\n");
>>  }
>> =20
>> -static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
>> +static void mcde_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>> +					    struct drm_atomic_commit *commit)
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does the disable callback =
also
> sleep in an atomic context?
>
> Similar to the enable path, mcde_crtc_helper_atomic_disable() runs in an
> atomic context during non-blocking commits. However, it calls
> regulator_disable(), clk_disable_unprepare(), and directly invokes
> usleep_range().=20
>
> Could these sleeping functions cause system instability when called from =
this
> atomic callback?

False positive

>
>>  {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> +	struct drm_crtc_state *cstate =3D drm_atomic_get_new_crtc_state(commit=
, crtc);
>>  	struct drm_device *drm =3D crtc->dev;
>>  	struct mcde *mcde =3D to_mcde(drm);
> [ ... ]
>> +static void mcde_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>> +					  struct drm_atomic_commit *commit)
>> +{
>> +	struct mcde *mcde =3D to_mcde(crtc->dev);
>> +	struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_state=
(commit, &mcde->plane);
>> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(co=
mmit, crtc);
>> +	struct drm_pending_vblank_event *event =3D crtc_state->event;
> [ ... ]
>> -	/*
>> -	 * We do not start sending framebuffer updates before the
>> -	 * display is enabled. Update events will however be dispatched
>> -	 * from the DRM core before the display is enabled.
>> -	 */
>> -	if (fb) {
>> -		mcde_set_extsrc(mcde, drm_fb_dma_get_gem_addr(fb, pstate, 0));
>> -		dev_info_once(mcde->dev, "first update of display contents\n");
>> -		/*
>> -		 * Usually the flow is already active, unless we are in
>> -		 * oneshot mode, then we need to kick the flow right here.
>> -		 */
>> -		if (mcde->flow_active =3D=3D 0)
>> -			mcde_start_flow(mcde);
>> -	} else {
>> -		/*
>> -		 * If an update is receieved before the MCDE is enabled
>> -		 * (before mcde_display_enable() is called) we can't really
>> -		 * do much with that buffer.
>> -		 */
>> -		dev_info(mcde->dev, "ignored a display update\n");
>> -	}
>> +	if (crtc_state->active && plane_state && plane_state->fb && mcde->flow=
_active =3D=3D 0)
>> +		mcde_start_flow(mcde);
>
> [Severity: High]
> This is also a pre-existing issue, but does mcde_start_flow() ultimately
> sleep?
>
> Inside mcde_crtc_helper_atomic_flush(), the code calls mcde_start_flow().
> If mcde_start_flow() disables the FIFO via mcde_disable_fifo(), it appear=
s
> to use usleep_range() to wait for the FIFO to drain. Since atomic_flush()
> runs in an atomic context during non-blocking commits, can this sleeping
> function cause issues here as well?
>

False positive

>>  }


