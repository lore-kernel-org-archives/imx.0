Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB39275AE4;
	Tue, 12 May 2026 04:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778560872; cv=none; b=T1QDIUTRxxSl6SMHcVugBCxLCcm72aCIWLET0riQKYG86mhSa5+bwYtyTMIEV8BE1Jy4r1nb3DYheX4lrMDxRt6wVwn2n2WsEq2f0QF72hXKq1HY2dggoI092ZW03pPV77DwsxHDmiPu/wnVjo2w11htmrx3bAd9wZX9tX2BNos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778560872; c=relaxed/simple;
	bh=lES+rNhv3qS+Mu8/p5bnQU/Jkpc7b1kdN7iYwhweYqA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F0z3dZWt1auZdT8GQuSk9mLB2l9CdqKPxtEhB0ho/Mal7c0+jbPNFQHbI3EIM8SXaBcKSRtAUKUQUfPVqwZ07FK4VO+/4PGxdQdMC17ZiX28D2xA9YRsGIAAem5iFPt+DkTh486HwNmqe9RSQZbyi4iNf9RDx9ZnwDQHpfxauiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Th+c51lB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Th+c51lB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF05FC2BCB0;
	Tue, 12 May 2026 04:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778560872;
	bh=lES+rNhv3qS+Mu8/p5bnQU/Jkpc7b1kdN7iYwhweYqA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Th+c51lBGKQML0+dhIomWeXZ+AI3TLi9bJSVkZItqdY+VoIUbLneII5QtT9jZVH9T
	 n7tBdOPde/RxoHrItxN0MS1IcO2MwNKZPoaBYTAe86gwnHWOgxxPd8yt6l/TpN5GOR
	 W5F/Cu5xUlqBGH9TqAhA1+lzsbGJDY0ToZQWwkS9aHT8zhXToc0yXKMcueBgSRX1+e
	 gUkh/Qkno4mwkjSphuetG27dfursIprsqVUYjLFecjAFME/CXBR95RIjRMw6dKwF5F
	 z7gELfwGHzvNUokAn/CmdK560MdmueSIlmlhdg/+MH8xVi3qvT1yM4sg4rIlu51MX2
	 0u+VN6hfFDx4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 14/21] drm: bridge: dw_hdmi: Use generic CEC notifier
 helpers
Reply-To: sashiko@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: linux-sunxi@lists.linux.dev, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260510124111.1226584-15-jonas@kwiboo.se>
References: <20260510124111.1226584-15-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 04:41:11 +0000
Message-Id: <20260512044111.DF05FC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Use-After-Free and Memory Leak due to lifecycle mismatch with drmm=
-managed CEC notifier registration
--

commit f25787cb94e7936f6b23599ef90d85d636679290
Author: Jonas Karlman <jonas@kwiboo.se>

drm: bridge: dw_hdmi: Use generic CEC notifier helpers

This commit replaces the open-coded CEC notifier handling with generic CEC
notifier helpers, specifically utilizing drmm_connector_hdmi_cec_notifier_r=
egister.
It also selects DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER when DRM_DW_HDMI_CEC
is enabled.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 6fb21399f1370..bf893c754539b 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c

[ ... ]

> @@ -2525,9 +2521,6 @@ static void dw_hdmi_connector_destroy(struct drm_co=
nnector *connector)
>  {
>  	struct dw_hdmi *hdmi =3D container_of(connector, struct dw_hdmi, connec=
tor);
> =20
> -	cec_notifier_conn_unregister(hdmi->cec_notifier);
> -	hdmi->cec_notifier =3D NULL;
> -
>  	drm_connector_cleanup(connector);
>  	drm_bridge_put(&hdmi->bridge);
>  }

Since drm_connector_cleanup() clears the connector memory with a memset, co=
uld
this cause a memory leak of the cec_notifier?

Because drmm_connector_hdmi_cec_notifier_register() ties the notifier clean=
up
to the drm_device release, the delayed drmm action will eventually run. But=
 by
that time, connector->cec.data will be NULL due to the memset in
drm_connector_cleanup(). Will cec_notifier_conn_unregister(NULL) then
silently return and leave the notifier allocated?

> @@ -2587,15 +2578,8 @@ static int dw_hdmi_connector_create(struct dw_hdmi=
 *hdmi)
> =20
>  	drm_connector_attach_encoder(connector, hdmi->bridge.encoder);
> =20
> -	cec_fill_conn_info_from_drm(&conn_info, connector);
> -
> -	notifier =3D cec_notifier_conn_register(hdmi->dev, NULL, &conn_info);
> -	if (!notifier)
> -		return -ENOMEM;
> -
> -	hdmi->cec_notifier =3D notifier;
> -
> -	return 0;
> +	return drmm_connector_hdmi_cec_notifier_register(connector, NULL,
> +							 hdmi->dev);
>  }

Could tying the CEC registration to the drmm lifecycle lead to a use-after-=
free
if the bridge unbinds while the DRM device is kept open by userspace?

The dw_hdmi structure (which embeds the connector) is typically allocated v=
ia
devm and tied to the bridge platform device. If the bridge unbinds, the
connector memory is freed. However, the drmm cleanup action remains queued =
on
the DRM device. When the DRM device is finally released, will the drmm
cleanup action dereference the already freed connector pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510124111.1226=
584-1-jonas@kwiboo.se?part=3D14
