Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE11370AD9
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188339; cv=none; b=uOpr1sz3qRTbfNm2pFTRllEh+y89InAJogUme9uA4+VgvBefnH1vPjqBgALb5Fnnb0KcY1V+hYxPnMDcU8Is4HYFt/KXKH5RxyGapXXmfdH983pYmzRptFBu3G2351sxcsjWMYGYxg+nDzge2AOaNuTTHv62XS73tLP1eD2KFOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188339; c=relaxed/simple;
	bh=DFQekLqjGp1eJz1UwVyKa5jYe4UmIU1QDYGYQKM/kII=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AnbwYLa2bmVb7qoCRe1AYigog+P1FSEV3qt86Yf3wwKJY8G9b9w/xCnG7XZ5fFUj2LfFFvA7ed4GwYnOxav/907dA+lglwAlMwtQIYzGgomkKZUhZkHNWNPTc2uIzh3Sl0/aKiPM5hO+r5AcE6tTXYOSdhYkDSt3BGDEpgRUcKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZrwOpyy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZrwOpyy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A371EC2BCB3;
	Tue, 19 May 2026 10:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779188338;
	bh=DFQekLqjGp1eJz1UwVyKa5jYe4UmIU1QDYGYQKM/kII=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=pZrwOpyyRScU8yosEfzlH7FOFCDqPV3kgXct/yrrstFxyYbprV1nhKczP1yQ7pk/7
	 6x6vqGC62phh9n49+4K58taYeiyAYvDd2hTIHrap+5x9fIaeFRM+N3F+54PuhOImsF
	 aHbKWsxBoVIfLjozZMxFFgcaDDlRthNL4b8360rqZImdjriGa0N144IpR4gdBAW2yC
	 EGrUpn+YgkKEVAMK/YipuaVWn9OuiN6R6NEInGrAUkcJKbHfKfbKpL2Tc/12YMIS+g
	 0Z1fppfD2aFK+j0XQ05AYCCTwG2HcWr0EgqsZoR+j24U/ZBtGBSjoPdVzbcX2SvDmU
	 jFCq9ljfTA27A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/37] drm/display: bridge-connector: return int from
 drm_bridge_connector_get_bridges()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519-drm-bridge-hotplug-v1-8-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-8-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 10:58:58 +0000
Message-Id: <20260519105858.A371EC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The check `connector_type =3D=3D DRM_MODE_CONNECTOR_Unknown` incor=
rectly compares a pointer to an integer constant (0) instead of dereferenci=
ng the pointer.
--

commit c54583277f834cc9c4092e1b01aee8c02b7a7b4b
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/display: bridge-connector: return int from drm_bridge_connector_get_bri=
dges()

This commit simplifies the return value of drm_bridge_connector_get_bridges=
()
to return a standard integer (0 or negative error code) instead of returning
a struct drm_bridge_connector pointer or an error pointer.

> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index 97d9a4c6d1665..d8a033ed8f41e 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
[ ... ]
> @@ -926,9 +925,9 @@ drm_bridge_connector_get_bridges(struct drm_bridge_co=
nnector *bridge_connector,
>  	}
> =20
>  	if (connector_type =3D=3D DRM_MODE_CONNECTOR_Unknown)

Does this condition check the value or the pointer?=20

Since connector_type is passed as an int * and DRM_MODE_CONNECTOR_Unknown
evaluates to 0, this acts as a NULL check on the pointer itself rather than
checking the integer value.=20

Because the caller passes the address of a local stack variable=20
(&connector_type), this condition will always evaluate to false, meaning=20
the unknown connector type validation is dead code.

Should this be checking *connector_type instead?=20

While this logic error wasn't introduced by this specific patch, it was=20
likely exposed during the recent refactoring that extracted this function.=
=20
Since this patch modifies the return statement immediately below the condit=
ion,=20
it might be a good opportunity to fix the check.

> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
> =20
> -	return bridge_connector;
> +	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D8
