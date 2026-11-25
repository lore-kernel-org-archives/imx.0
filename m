Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629817;
	b=Z6QiBiuL8X16saAcP5FYAAXRe+p641TrouMD1a7rm79ErloLBV2uu7z+z/6Ea15ZeYfG
	 aAkrbh7G9wfr2h+bd12YMjLUJd42HQSmWlDkbyJIoKRwheHu4E7edgx7x3PcIo5e/b8wv
	 VtbwadY3A+vX20Tb0qPwiJDL09VwLuuDs7+OScHvZ1rq1/6N6u+N9ajnr0wXjzaoyJW9V
	 Bta21T5GTyBU1DVmDOR+ZBQcOr97trI3g1gwG8bv9ln97rwaBjahktMgZ5bgBhwAF2pAF
	 z8r2ltrwvl34kC+EP/Q4oyQqujL8KlMWy8gOULTcqJxPqMp1+OQfG+y9SnuLHOGRJ5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629817;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Jjg2AizMoO8fgmQX9TPrWTlZoBJhv6b0qu+vOHQoQVE=;
	b=TbWrb5v+PxRWZ/dkj409fGry8eYQz9hgNijbHeBWK9rNInSLArDJApvBSqc0Y3CyCFWm
	 Zf+36Rl75M4AzqRibbOXFjd11BYwsbylkafRzAJreE5E7rWw0TBVlNA7yXbMEXCo50npA
	 BOs81EvozWzJy+lNUMm4XarJGyGCXEw/SPjvaW69rNuJHO9BM7kETBirnWemkv3beV9PO
	 zjwKI6RX4xPT15DoYYOZV/hJh6Itzc8zK5mwUhcYwDXUkodCmFYppIeo0pHFGHqMJLDz+
	 lylDB0jLiM1B4NWNA+WatZtVrYMIyY5OnMI4gbpCZXE9uW7F6a/ai9GNNwtwoYLgdDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K3ru4BVM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC03606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K3ru4BVM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC961F000CF;
	Wed, 25 Nov 2026 18:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795629817;
	bh=Jjg2AizMoO8fgmQX9TPrWTlZoBJhv6b0qu+vOHQoQVE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K3ru4BVMi1a/1cpmTvefmjUQCfyRawe3Ce6r/Htv1He99OJnaLEGr9A10J8N3v7cN
	 SwX6cn91KSzn8hUdta9hrw7PlaZOt5EsMxSXOhKyWPJjlkxSsw0fdcb0sPHBed4EjM
	 D7SpB6j7IkXDBac36tR1Css38nbbPE8Xzpp+9SumJSBUAzrUK1Xgv4m1Pc5CqTdIw6
	 bwU+sGcf/Jx616UBrhvJnshce9ZeRMR/uJIEvOF6Gcdqsl3d6WtGrt2rSA2+xG2qTx
	 ggvzSLJf63goWxQdKmpQNg1FI17uoYvKocTOkTtbFG4CjLUXXHMyAnoi+RThhUrayT
	 thmVDCj1kH/dQ==
Message-ID: <sashiko-outbox-233898@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/32] drm/display: bridge-connector: hoist error
 management to common code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261125-drm-bridge-hotplug-v4-8-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
 <20261125-drm-bridge-hotplug-v4-8-822722850492@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:03:36 +0000
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
- [High] drm/bridge-connector: int return in
  drm_bridge_connector_initialize()
--

commit a701ba5bb1c19c7b9fcfc98010ada24b2c5ec042
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/display: bridge-connector: hoist error management to common code

This commit moves the error check for drmm_connector_hdmi_init() and
drmm_connector_init() out of the if/else branches in
drm_bridge_connector_initialize().

> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index 19cacae617dce..f4a71801e8a3b 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -1057,15 +1057,13 @@ drm_bridge_connector_initialize(struct drm_bridge=
_connector *bridge_connector,
>  					       &drm_bridge_connector_funcs,
>  					       &bridge_connector->hdmi_funcs,
>  					       connector_type, ddc);
> -		if (ret)
> -			return ERR_PTR(ret);
>  	} else {
>  		ret =3D drmm_connector_init(drm, connector,
>  					  &drm_bridge_connector_funcs,
>  					  connector_type, ddc);
> -		if (ret)
> -			return ERR_PTR(ret);
>  	}
> +	if (ret)
> +		return ret;

[Severity: High]
Should this return ERR_PTR(ret) instead of ret?
drm_bridge_connector_initialize() returns a struct drm_connector *, so
returning an int fails to build with -Werror=3Dint-conversion (and breaks
git bisect before commit "drm/display: bridge-connector: use a dynamic
connector" restores ERR_PTR(ret) later in the series).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-drm-bridge=
-hotplug-v4-0-822722850492@bootlin.com?part=3D8
