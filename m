Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630092;
	b=fZ0RTV9SMVcNpEnPDsrip9uXPhRmWozayPI+RLp4ttWV9AbxLjQBDWzUauI6FHEQCUio
	 4s9UIFJ0J3Wnhwx+3ng6Zj04BF+qaKPgpfWytrVTFD7EPg+/pzd96uhkWQuLMJRQosV/R
	 bBqxrYVP33Apc4R2kdbRzeZxNNEL5o/x+V2naOXYnJF74a32LOstRQZik7nRn3cy0HwJW
	 h0+c7HDfeVZ0SZeBQ58+0eK1h/8P3lXWLSBq/ns40A9KcOLrkbq1yDmO1zB/mp/0rqdAX
	 4/bCbelqbVfaDOsZmim1ZFkKqrYWG92VrCz19lwwgiN2d4bn79YY9hee0FUJhOgAnUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630092;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=s11Rv7KUePQs9knFLFl7A4wK9PqxTnOyZXfBcGNyr60=;
	b=LHdvQ8U4k14hVqiqNWkVRQZtV4k0aFJhR6Y3xXuHSNCI694VqqHDREzwk2ZSNdiRH+nQ
	 EanQd++eF2WF+DKalyTgJiHDX0mH1EgvqBACLwYMb66mnddZMIC8QRSPnQQJ14u80LrV3
	 Oeqz52phKaoIN/HTZXavbi+NVHV9UjItM9WsfuqtDE6VksMG2UqEXynL7B350E6EUUA9H
	 LOxHt47aXnW3KikXA2fKyWFI/FkGZLcVL8Cr0y4fNxA/Or1ojv86zpABafOW4mERMZI4Y
	 esFyQRqjNoQuWVvHSXnIoJXKvsVIPJVfQD1MtmlMxQt+j+TxwX7sNy6uKyBLWko4B6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C8LqMofm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7563B606A333
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C8LqMofm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BEED1F0156D;
	Wed, 25 Nov 2026 18:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630092;
	bh=s11Rv7KUePQs9knFLFl7A4wK9PqxTnOyZXfBcGNyr60=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C8LqMofmDIQl5tEIKNe8ixEHiJNmlJIeb67x0rvU1we/xNAx0NqQ2KD0OlZkjn9zh
	 lo8+UZ7c9k+T/V4SX+j7Qd4rzpFzKyrwnkhjFtOeGdcgfjWTaSzD19OdR/oZDO/L8X
	 fnntqkr7gGNchAA80JktCruriAhX5d4ouLQhDAbkHRcknAKNM0wenuKv8AIa6Sjtg2
	 IYl0APy1kHanLxMxFcWVuAbwim029iFeY9D9pTkG/11IIU1fMuLc1iq4/ZRvkuapF7
	 4b+oVJH3M2IXETj3vznPn2PdoFbREecd7K1juo9tErJ3bnBu4bJJvD6rrhne0UyzVR
	 wqnFQ6UZqtQ6Q==
Message-ID: <sashiko-outbox-233910@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/32] drm/display: hdmi-cec-helper: add non-drmm API
 variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261125-drm-bridge-hotplug-v4-2-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
 <20261125-drm-bridge-hotplug-v4-2-822722850492@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:08:11 +0000
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
- [High] drm/display: missing lock and clear in
  drm_connector_hdmi_cec_unregister()
--

commit 6c19735a9b5d351aeeed042f0b7e6649c04d3e13
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/display: hdmi-cec-helper: add non-drmm API variant

This commit adds non-drmm drm_connector_hdmi_cec_register() and
drm_connector_hdmi_cec_unregister() helpers to support hotpluggable HDMI
bridges.

> diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/=
drm/display/drm_hdmi_cec_helper.c
> index b79c41703d539..81b271659ad9c 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c

[ ... ]

> @@ -160,6 +150,38 @@ int drmm_connector_hdmi_cec_register(struct drm_conn=
ector *connector,
> =20
>  	return ret;
>  }
> +EXPORT_SYMBOL(drm_connector_hdmi_cec_register);
> +
> +void drm_connector_hdmi_cec_unregister(struct drm_connector *connector)
> +{
> +	struct drm_connector_hdmi_cec_data *data =3D connector->cec.data;
> +
> +	cec_unregister_adapter(data->adapter);
> +
> +	if (data->funcs->uninit)
> +		data->funcs->uninit(connector);
> +
> +	kfree(data);
> +	connector->cec.data =3D NULL;
> +}
> +EXPORT_SYMBOL(drm_connector_hdmi_cec_unregister);

[Severity: High]
Does drm_connector_hdmi_cec_unregister() need to hold connector->cec.mutex
and clear connector->cec.funcs?

drm_connector_cec_phys_addr_invalidate() and
drm_connector_cec_phys_addr_set() serialize on connector->cec.mutex and
check only connector->cec.funcs before invoking the callback, which then
dereferences connector->cec.data->adapter.  Because
drm_connector_hdmi_cec_unregister() frees data without holding
connector->cec.mutex and leaves connector->cec.funcs populated while
connector->cec.data is NULL, a concurrent or subsequent hotplug path such
as drm_atomic_helper_connector_hdmi_hotplug() can trigger a use-after-free
or NULL pointer dereference on data.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-drm-bridge=
-hotplug-v4-0-822722850492@bootlin.com?part=3D2
