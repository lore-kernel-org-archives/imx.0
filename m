Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914483D45CF
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 13:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861121; cv=none; b=uFgpN33u2zAzTfZOYXXx/c0KYeFFX87end6PPlWL3j3a4bIbfAVp6emWdv2foocZxrTY57oe48B48lPTKmO48Fcx1vx6Gt43ZBXC/6rG9eXQ1SMYVUFlrhE/kuhd41dDh4Nt8VihCzmZTd8QMTuRd73ApN0rmHAXTzkW5KfaPc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861121; c=relaxed/simple;
	bh=nZG/abR5hcK+lrAMKya8hkkOZtNEMzhOzzSYEYPsu5E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eYLkncO8g/RxGhbiy2Z5Sk7TFmkXiTcOY9Px1WjI+H6uCqvxmN3R0yzGbNxXbkZiuNCCWgRLwF51LbmL+x7bbRg54v7Jp0Xpl1U8X18Zt04p7T/bQo/Y4qoTzUtoVK1B1keg6gam2sOxBXI7trDProgcTiDycWSWtxwtnk+pcJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0pCHXCP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0pCHXCP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B421F000FF;
	Thu,  1 Oct 2026 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790861120;
	bh=7uDSSXgHpLPmo8DtUMbDbifSXys+MSfcOxbXoyquKd0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q0pCHXCP3dRBOSooWVpP+fIYmx5Jz9k/Rjg5H5R3aO67oua8HQL2oP6WsXEBv2aTv
	 vEncs0fH1RmEVVlFs4xlzWeag3nNVFCQSG2gjoNIpIq3T//uJS0PBvFNwiRKJ3v7R/
	 0/vx5wXHbF9jysZLaqpYPGtPnnnoEWF95tdst+A4I8oQb6CAh6IjbF016hfwnjHo5t
	 knbST85GnQ2b8PgrOIvFTWNUEp00MFBV+zPltUs4wG1iusV1RdRzdDPw9G+XjL4JJU
	 +mmlgH4BDVKDIRStE9xOsKN4Ua4qimw/b8ha93XsIpN3UuLObB6gXl7zk6ppAWqCMX
	 dugO9ZagzDt3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 21/24] drm/bridge: ti-sn65dsi86: implement
 .get_next_bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev
In-Reply-To: <20261001-drm-bridge-hotplug-v2-21-8e34986dcb68@bootlin.com>
References: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
 <20261001-drm-bridge-hotplug-v2-21-8e34986dcb68@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:25:19 +0000
Message-Id: <20261001132520.00B421F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/bridge: refcount underflow in sn65dsi86_get_next_bridge()
--

commit ed254bdda2bfa941d8761ef842227d71a55ce971
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: ti-sn65dsi86: implement .get_next_bridge

This commit adds a get_next_callback function to expose the next bridge in =
the
ti-sn65dsi86 driver.

> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 48b83df9aed61..e981d98a39b96 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -743,6 +743,13 @@ static int ti_sn_attach_host(struct auxiliary_device=
 *adev, struct ti_sn65dsi86
>  	return devm_mipi_dsi_attach(&adev->dev, dsi);
>  }
> =20
> +static struct drm_bridge *sn65dsi86_get_next_bridge(struct drm_bridge *b=
ridge)
> +{
> +	struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> +
> +	return pdata->next_bridge ?: ERR_PTR(-ENODEV);

[Severity: High]
Does this callback need to call drm_bridge_get() on the next bridge before
returning it?

The get_next_bridge API expects the returned bridge to have an incremented
reference count. Callers of drm_bridge_get_next() will clean up the returned
bridge using drm_bridge_put(). Because this function returns the pointer
directly without acquiring a reference, the subsequent put operation will
decrement a reference that was never acquired.

Could this lead to a regression involving a use-after-free of the next_brid=
ge
structure during pipeline initialization or hotplug events?

> +}
> +
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-drm-bridge=
-hotplug-v2-0-8e34986dcb68@bootlin.com?part=3D21
