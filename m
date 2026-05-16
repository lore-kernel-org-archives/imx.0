Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C849E2EC0A4;
	Sat, 16 May 2026 19:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778959201; cv=none; b=ArpSL62Z7WTItVDDKecioZT5JnLn5GLfVPNXrgmS/f6UQTroxNq3WPJnSaVV+IwxrD8sztj/hZGB7NsDB21EjI8X6ukrQidsz8R8ajZFwr7XlVRvIbL5ZsMeLfJ5KeXDxZ4A7u1aXAA/vetDsZ6G1hUWgrn/JYFOYzSWVsFvKc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778959201; c=relaxed/simple;
	bh=xpnbXdC7DEafCl4a3hRxkRaK1iet2Pxhvq1itahaKVU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p8xxyI/l3Timcqa+iJjAMsfveadwfcE7Oj3I4e7pbaVJhTwUfdh4WOy0xuyj2044S/dsZaDqJ+80YQ8ehpN6ZusAn8P5jDAJFPG+le6PLYQYODtTgezR1udsqe2ROUWHtrdTG3tDMhCdXb6cw1aDqB/zPu7DUdz15W+/fZWef+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ev/Umnah; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ev/Umnah"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E4EC19425;
	Sat, 16 May 2026 19:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778959201;
	bh=xpnbXdC7DEafCl4a3hRxkRaK1iet2Pxhvq1itahaKVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ev/UmnaheJKlVOlwgkfKxcsIMyRAkvXjWcbSDrqxZKKOtLOzxg1v+xTMAQWv9wJlg
	 tTwPCDyBnOWc65C65/Xid1bZmoJXQqDmK+cjeVDX23ovSQHYyqIkdKkWjCBxPPyQkk
	 OZAZe7o3VxfUdW38cSQQRWMJRRaGIrnm6+LoD4wWulX2IVZ5PlpzyJm/QYfn8boWvs
	 7vXoFTpVVrkBsEgCNL3iWRq8zJN2uVE8l5QuRSlfCmwYDb5wDiMpXrMa7kB692TNQI
	 KpV1Pju1aIWWYH5rLuqiZXa/T4vmYCjq+qR2B2ewYD5O1Qr55mbNEhOpPMn2BdSByb
	 Nml4T94bUK3Pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 13/22] drm: bridge: dw_hdmi: Use generic CEC notifier
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: Frank.Li@kernel.org, linux-sunxi@lists.linux.dev, imx@lists.linux.dev, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260516183838.2024991-14-jonas@kwiboo.se>
References: <20260516183838.2024991-14-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 19:20:00 +0000
Message-Id: <20260516192001.27E4EC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Use-After-Free and Memory Leak in CEC notifier cleanup due to drmm=
 and manual lifecycle mismatch
--

commit eb59f6fe976b03aa5f719b79a28355b27f403bfe
Author: Jonas Karlman <jonas@kwiboo.se>
Subject: drm: bridge: dw_hdmi: Use generic CEC notifier helpers

This commit replaces open-coded CEC notifier handling with generic CEC
helpers using drmm_connector_hdmi_cec_notifier_register. It also removes
the manual notifier unregistration from dw_hdmi_connector_destroy.

> The drmm release action for the generic CEC notifier should run just
> before dw_hdmi_connector_destroy(), closely matching the lifetime of
> the replaced CEC notifier and the connector.

Is this lifecycle assumption accurate for drivers that do not use drmm
for mode config?

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
[ ... ]
> @@ -2547,9 +2543,6 @@ static void dw_hdmi_connector_destroy(struct drm_co=
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

Since drm_connector_cleanup() zeroes the connector memory, and
drm_bridge_put() can drop the final reference to the bridge (which frees
the dw_hdmi structure and its embedded connector), could this lead to a
use-after-free?

If a user-space application holds an open file descriptor to the DRM device
during driver unbind, the DRM device remains alive. The deferred drmm
release action will only execute later when the file descriptor is closed
and the DRM device's refcount drops to zero.

When the drmm action eventually runs, it will dereference the freed
connector pointer.

Additionally, because drm_connector_cleanup() executes
memset(connector, 0, sizeof(*connector)), won't connector->cec.data become
NULL? This would cause the delayed drmm release action to silently skip
unregistration, leaking the cec_notifier object.

[ ... ]
> @@ -2609,15 +2600,8 @@ static int dw_hdmi_connector_create(struct dw_hdmi=
 *hdmi)
[ ... ]
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

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516183838.2024=
991-1-jonas@kwiboo.se?part=3D13
