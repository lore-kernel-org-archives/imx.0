Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629590;
	b=SUXUAMK07gMKf6di6y9/BOKC5h7QoqpBvDP0x1NdYB7FqBQ2tb7I6aXemyHLD/yq4m65
	 nj8YP/4jKkEBO9pOfbouRJnqtK/YFgr/2aF3PaWl71BwSfBX7GYbEZ0XpNYvNoQKAfmY2
	 Q/v1sNaszVZTFGfZyE1BnoXtCzHvV+olH9R2htnwKQ14E/udT4JYU9Ya4aCtUkOW2eoLb
	 LS3LdPQnGQo6XysrhHkhOkczy0ZoQ+5xgHCCw9tLhi1HBEuqi+3uNLk5/K1nEHvODQxFw
	 v5b6+Cxla8ZkUs6bB5mh2N2TDIkRdwinQtFC+7BP4fo+DYnP9wiBCZD7d49lUDqi3Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629590;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EvLUU+i87Xih6BMRkCTHh3iFiwDCIvyzWq2UAlrVtYA=;
	b=Z1rXeqIouTmMCOog8SOkBaVLslt/1L8joaGJ4dehXY6gVMMP+1ebkSQ+/MCGgTt5imaZ
	 XDo05harLGVER3Tm6SdbAhHRV4IvYmOI5CHFidCaAAYWBxBDhcNibg1LXT6uOlzfVXJ8v
	 w4S5CoFfzHFYfdodGalFIctr3P05JzkUKcVMW2kFdUW0I+LwYjqA2p9I05YmT/+pKFea1
	 XqzLCqdrc6GcQTlQeJiZ0lX0i+rd9EDVrwBt8JsE3j1YLXskHqlZSyoXMDst8ufk2zkbp
	 a+krDs/S+WPccR7efnMs8k4vdH+0XcgFuNFRlT5PR8J6d6SLiPBITyrHpt6fm/RS7cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hmk730E4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290C6606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hmk730E4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15031F000C4;
	Wed, 25 Nov 2026 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795629590;
	bh=EvLUU+i87Xih6BMRkCTHh3iFiwDCIvyzWq2UAlrVtYA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hmk730E4nUTvBUK/u10u+zA0ONEv3JG6CQshHIFd2jABxgXOy8sbVcMX7o7c13m98
	 Gt8QtmS9WZ6brXc/XVD3M9sLIr3g0XZjFAhcHrrHYPlyBr3PoOvi/v2BQVEBRji3Oc
	 Zj2zPyViXdHp7Sq1BbuJ5/BJ7O/k5ClyYcmwAs+EXXvkJTNuhml/4NHAj8zLoGGQVF
	 qN7/kUzJ253abSl1fq+VFvQOdA9doyaTbvzgVeoQXXFHllKiDY1tf2P9p8o9wP9Jl+
	 a1eZAje07hwMDi/uNOjYzeeSZ2sbirAC6nZlqA0agyNgA8I3K37urIU1kArnMchKEm
	 RC2xgfJq45SYQ==
Message-ID: <sashiko-outbox-233880@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/32] drm/bridge: constify
 of_drm_find_and_get_bridge() device_node parameter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261125-drm-bridge-hotplug-v4-11-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
 <20261125-drm-bridge-hotplug-v4-11-822722850492@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 17:59:49 +0000
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
- [Low] drm/bridge: non-const np in !CONFIG_OF
  of_drm_find_and_get_bridge() stub
--

commit 7679a18d386b4f07d4526f35667dbb513f3a913d
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: constify of_drm_find_and_get_bridge() device_node parameter

This commit changes the device_node parameter of
of_drm_find_and_get_bridge() to const so callers can pass a const pointer.

> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 12ca7f6fb5243..d6ef020c4cc9b 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -1274,7 +1274,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, =
struct drm_bridge *bridge,
>  		      enum drm_bridge_attach_flags flags);
> =20
>  #ifdef CONFIG_OF
> -struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np);
> +struct drm_bridge *of_drm_find_and_get_bridge(const struct device_node *=
np);
>  struct drm_bridge *of_drm_find_bridge(struct device_node *np);
>  struct drm_bridge *of_drm_get_bridge_by_endpoint(const struct device_nod=
e *np,
>  						 int port, int endpoint);

[Severity: Low]
Should the !CONFIG_OF stub of of_drm_find_and_get_bridge() in the #else
branch right below also take a const struct device_node *np?

include/drm/drm_bridge.h:
    #else
    static inline struct drm_bridge *of_drm_find_and_get_bridge(struct devi=
ce_node *np)
    {
    	return NULL;
    }

Without const on the stub, passing a const struct device_node * in a
!CONFIG_OF build fails to compile with a discarded-qualifiers error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-drm-bridge=
-hotplug-v4-0-822722850492@bootlin.com?part=3D11
