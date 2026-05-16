Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E7617745;
	Sat, 16 May 2026 19:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778959730; cv=none; b=GO7eBAv7tHOZqf2VzErt1SYLtfFTWzXaPOlPBdThia5Imx1Cmv+Yc9/ZdBYmsKV3+w74rSGttU2KPzaw7likbyyI8Jq7mcAAE5ps64IeuL5Ni8pHfW94NYjhzkbbneEaGHj8Lz0dbgfIuH5oUGSmWQZWHKUWuoilszHpTLetoww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778959730; c=relaxed/simple;
	bh=kdNY2alaMStejlo6KBLA3Br+ap4kunbgPI48PZpoaHc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o9ljTNGbYp5YuHA5zZklsdICoiFiqcMePYnLdzyALOefXKFQkf+yA/zEBhWhchgGmz9IR+dkWmmk5cThJZecS2j7iO+Q8VBKRhdKiWalfR/3MMXWhPVtAegS9t4W7PJDctq2dphl4HkDoRkU8WhCtzRLmGuBmoaM34+uhbdHVx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mj6/5EVW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mj6/5EVW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F9CC19425;
	Sat, 16 May 2026 19:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778959730;
	bh=kdNY2alaMStejlo6KBLA3Br+ap4kunbgPI48PZpoaHc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Mj6/5EVW606TCWotv6XzApLqVDcjnwBiyo+suiQ4rw8F6LxQGrGNnrIH3U8wvNTwU
	 tUbshkHDVRSALIFbJBU/pX/3uDypHEgXVvY3h54UXNOyFPs+LR6eQ2TxuTuLwGzM4f
	 pNFllqexVagUVKfzLtdji0R7PQngXRJEoCCufv4Mv1V2UHhoN4/05tdOZwrt1aNCLk
	 JLj9yKLM6OKHVbYAoZPWD5HuPw9j9vnqzyaTeD5nFK1fp93kFm/yhBpObnTIGom98j
	 Gxr3RtO1CFyYkXBkoLB24yLnbS1hGZU+hJkijM7k1jSn7656maPbZXybDCsIPSBUSf
	 QHnBPooXw6Vmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/22] drm: bridge: dw_hdmi: Unregister CEC notifier
 during connector cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260516183838.2024991-9-jonas@kwiboo.se>
References: <20260516183838.2024991-9-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 19:28:49 +0000
Message-Id: <20260516192849.E0F9CC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Moving `cec_notifier_conn_unregister` to the connector's `.destroy=
` callback introduces an asynchronous state corruption vulnerability, break=
ing CEC functionality on driver rebind.
--

commit 8c5f1d529adb3a91696d1e624a0b3dc31d5287ba
Author: Jonas Karlman <jonas@kwiboo.se>
drm: bridge: dw_hdmi: Unregister CEC notifier during connector cleanup

This commit moves the cec_notifier_conn_unregister call from the bridge
detach function to the connector destroy function. This is intended to align
the lifetime of the connector and the CEC notifier.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index cbbd155780425..5fd26ff8f55b4 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2532,6 +2532,11 @@ static void dw_hdmi_connector_destroy(struct drm_c=
onnector *connector)
>  {
>  	struct dw_hdmi *hdmi =3D container_of(connector, struct dw_hdmi, connec=
tor);
> =20
> +	mutex_lock(&hdmi->cec_notifier_mutex);
> +	cec_notifier_conn_unregister(hdmi->cec_notifier);

Could this cause state corruption if a user holds the DRM file descriptor
open across a driver unbind/bind cycle?

Because the connector destroy callback runs asynchronously when the last DRM
file descriptor is closed, its execution can be delayed indefinitely.

If the driver is unbound and then rebound while the old file descriptor is
still open, a new dw_hdmi is allocated and a new connector is created. When
cec_notifier_conn_register is called on rebind, it looks up the notifier by
the physical device (hdmi->dev) and shares the exact same cec_notifier with
the new active pipeline.

When the user eventually closes the old file descriptor, the old connector's
destroy callback will fire and call cec_notifier_conn_unregister. This will
clear the connection info and invalidate the physical address, which would
destroy the active CEC state of the newly bound display pipeline.

Should hardware-coupled state like the CEC notifier be invalidated at
hardware boundaries like detach, rather than software refcount boundaries
like destroy?

> +	hdmi->cec_notifier =3D NULL;
> +	mutex_unlock(&hdmi->cec_notifier_mutex);
> +
>  	drm_connector_cleanup(connector);
>  	drm_bridge_put(&hdmi->bridge);
>  }

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516183838.2024=
991-1-jonas@kwiboo.se?part=3D8
