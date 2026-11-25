Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630040;
	b=mognO/PSPWT+7aJyy4e0tur5+4oP9/fQOZxWL7Y4tI249ki9zGMx8yuNVENG1Vj9HEic
	 bCl0R+jI2eoSe5Y8F/wdJ0dD1Baab6SO0DS1ONtD/yhVaHny9MQj2yryJ+wFB4Bm2Uxwi
	 hWbOhX3Q049UI0RAx3jnEXQYLoq8L+VxWSilpjJ3v9/M+KGFGhigZMYjTB0dPcteSEmjy
	 wI4GQhLZvGFXYiQXFVv6FmJi7kHkl/Ed8/KMCDfD9F8GYMgu3uYJjjVizBjgqOirzHLcM
	 n4mrYXWwBDCHYMXT2KYgDTLfaO86RRqoGa3S5zxh/aMIs7nIkxZbfkBIQgc6/9DvtBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630040;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0pQHbF5+Ci3aZyc1Gn2UFrIqsyZHRfTcxPO9IkIezYI=;
	b=cD7ohkZk11vnpSl/9YZmUUnVwyigG3P41GgFypAU/HHCGsOCqj6glGbnCg0KYx0IfJQX
	 fWEGsUWNYzxrk7oiGcA2Cf7RUol5A81opTwD5a8/85IGb2NZNMGVj4fO8k9SC0+nApoyG
	 OTrMSpFXjP1SC7Zk2xc1CgfYk7c6iUyZhJjDR38QRJgma8cbKORnMjB+/fuxF3IYdqfJy
	 dlAN58jp0U5Nhvgeja0rdzrwqIV3pGMll+G7X32SxfTw5AbcegObdM+t5SoLb2PQrf1bI
	 Tqd5GiXZh8YMD02wZGrvhlwPJCWgt/kGIQNLcxVQmP/ZMEDtgHFuhuzCnbpQ2+YB8Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HwYUUfWd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C29606A326
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HwYUUfWd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FA31F000D4;
	Wed, 25 Nov 2026 18:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630040;
	bh=0pQHbF5+Ci3aZyc1Gn2UFrIqsyZHRfTcxPO9IkIezYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HwYUUfWd2SI2d55amZ+9EnV/a+rYqV1PiYXxfYs4oLQaUEoVTZE+anNFavI3Yqtx/
	 hdnyqvZP41gC03As6BRr+4WHEzmYVrEPs29Oy94L0bIvfKx0VSkAzHrXp/e8EVHOQY
	 c1x+4BdhGGTD1gBdBK7KsljvXu8gSuG962V9DCwqmmLCvgGEg6nOGpRIzjH5x+Jomp
	 da3/H9JQurK8mAfzif+BfU5iQuy3hvfFOMudN2bB5ODtWfAQR8Rr1MfZl3+it5bqx6
	 GgztygDG9f6Uw58fxnVIbgvBoCuxO5cdCvhabTEWzl+pOfUDPyhrkjoPiVcXUY+ETn
	 +UxjdNtxwt4ug==
Message-ID: <sashiko-outbox-233907@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/32] drm/display: hdmi-cec-notifier-helper: add
 non-drmm API variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261125-drm-bridge-hotplug-v4-4-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
 <20261125-drm-bridge-hotplug-v4-4-822722850492@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:07:19 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/display: missing cec.mutex in
  drm_connector_hdmi_cec_notifier_unregister()
--

commit 524d66733b09456c82258b5e235e9f87be3e61c7
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/display: hdmi-cec-notifier-helper: add non-drmm API variant

This commit adds non-drmm register and unregister helpers for the HDMI CEC
notifier so that hotpluggable HDMI bridges can dynamically register and
unregister their CEC notifiers.

> diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c b/dri=
vers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
> index 47662bdc5d08f..2f30844fcdad9 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
[ ... ]
> @@ -58,6 +57,27 @@ int drmm_connector_hdmi_cec_notifier_register(struct d=
rm_connector *connector,
> =20
>  	mutex_unlock(&connector->cec.mutex);
> =20
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_hdmi_cec_notifier_register);
> +
> +void drm_connector_hdmi_cec_notifier_unregister(struct drm_connector *co=
nnector)
> +{
> +	cec_notifier_conn_unregister(connector->cec.data);
> +	connector->cec.data =3D NULL;
> +}
> +EXPORT_SYMBOL(drm_connector_hdmi_cec_notifier_unregister);

[Severity: Medium]
Should drm_connector_hdmi_cec_notifier_unregister() take
connector->cec.mutex and also clear connector->cec.funcs?

drm_connector_hdmi_cec_notifier_register() sets connector->cec.data and
connector->cec.funcs under connector->cec.mutex, and
drm_connector_cec_phys_addr_set() and
drm_connector_cec_phys_addr_invalidate() hold the same mutex while calling
those callbacks.  When a hotpluggable bridge unregisters its notifier at
runtime while connector detection runs concurrently, the lack of locking
allows a use-after-free on struct cec_notifier:

CPU0                                    CPU1
drm_connector_hdmi_cec_notifier_unregister()
  cec_notifier_conn_unregister(connector->cec.data)
    cec_notifier_put(n)  [frees n]
                                        drm_connector_cec_phys_addr_set()
                                          mutex_lock(&connector->cec.mutex)
                                          ...->phys_addr_set()
                                            cec_notifier_set_phys_addr(
                                              connector->cec.data, ...)
                                              mutex_lock(&n->lock)
                                                <-- use-after-free
  connector->cec.data =3D NULL;

Leaving connector->cec.funcs non-NULL also allows subsequent physical
address updates on the connector to keep invoking the notifier callbacks
with a NULL connector->cec.data pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-drm-bridge=
-hotplug-v4-0-822722850492@bootlin.com?part=3D4
