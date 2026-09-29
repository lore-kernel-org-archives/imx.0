Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC43851A14C
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 10:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679094; cv=none; b=ll8wUUjxUUJE0VUfbfg2aoYLGINOP2ESng3soHbx1lUTK5UBrRlh5uZ7a8WO9emfDqmJsO5zA7PRxqNp5eRDzn1O4sg0P+A0xown+oplrGzR7PMetFgTLu7KURaUS+CijxcO1HgiIHdqu8iGNPRh8Kic2ytKnm3dE7bKg2/HlgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679094; c=relaxed/simple;
	bh=RkwOrXcqBFUr4icAs9ioYlgqsFXBWDlmFVSOO0mjRbo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ld2FS3OKhG5dc1o4wqC9fWV1aFYPIcGbdd/DASKw6g+u9higBk5X7hq1L1nL7rOJYgJzBI4mGiHgPSpEMPqX6ji+2W4Qe2CqVY0NCVPwLsdk67B32TtbExaYgkxDZ1s6RHu3USttTZeduLcTMDA1mTXHLVyJZDsG1PZ719pjc34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdIFAZyh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdIFAZyh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59021F000FF;
	Tue, 29 Sep 2026 10:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790679085;
	bh=UCYGDT2yDOhBVf3mGdvQ5gwxucliLQxv1MZclYlfDpM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NdIFAZyh7bstaEq/Yctu3S3D75eH78/IwN/Xv84sSQ1YML17iSRVZ06jBtnVix3An
	 lMaWLfqfLHzk8x8usu7kxGrcyI6YN1he1D5bOW5wG+sa9LaP9yZWncBiSOm+qASToZ
	 pp1jiZYv42EgLQMHWiidhf9RXdqT+0DOXV7XLcXG1gPXdHOGyxHBhrl8IfzjhEnu4r
	 yaaiu64gIJjsDejagVVAT3BT7/qe6rwlMpUZyFZKaC1eNsM29u7HywQ4XBMFY5XJai
	 ggQmPGjXpzVC+xVQdZjajK5Gao1WUL/fBeMifj1Dgw4UVYCMdfAjLYaQ2ixz61cTA5
	 VnRQh87Pj7IxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] drm: verisilicon: stop using deprecated
 devm_drm_of_get_bridge()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, dri-devel@lists.freedesktop.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-2-ccb7e602daad@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
 <20260929-drm-fix-of_get_bridge-build-regression-v1-2-ccb7e602daad@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 10:51:24 +0000
Message-Id: <20260929105124.E59021F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/verisilicon: reference leak of next bridge when devm_drm_bri=
dge_alloc fails
--

commit 49db4512b47fdbbe2150c6b5f4f559940d0929cd
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm: verisilicon: stop using deprecated devm_drm_of_get_bridge()

devm_drm_of_get_bridge() is deprecated, switch to
of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() returns
a refcounted bridge, ensure it is put by using bridge.next_bridge.

Link: https://lore.kernel.org/r/20260928161605.2271412-1-arnd@kernel.org

> diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c b/drivers/gpu/drm/ve=
risilicon/vs_bridge.c
> index dc7c85b07fe32..f1e8112f0ed25 100644
> --- a/drivers/gpu/drm/verisilicon/vs_bridge.c
> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
[ ... ]
> @@ -303,8 +303,7 @@ struct vs_bridge *vs_bridge_init(struct drm_device *d=
rm_dev,
>  		return NULL;
>  	}
> =20
> -	next =3D devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,
> -				      output, intf);
> +	next =3D of_drm_get_bridge_by_endpoint(drm_dev->dev->of_node, output, i=
ntf);
>  	if (IS_ERR(next)) {
>  		ret =3D PTR_ERR(next);
>  		if (ret !=3D -EPROBE_DEFER)

[Severity: Medium]
Will this leak the refcounted bridge next on error paths?

Since of_drm_get_bridge_by_endpoint() returns a refcounted bridge, it
appears a reference leak will happen in vs_bridge_init() if the subsequent
allocation fails:

	bridge =3D devm_drm_bridge_alloc(drm_dev->dev, struct vs_bridge, base,
				       bridge_funcs);
	if (IS_ERR(bridge))
		return ERR_PTR(PTR_ERR(bridge));

Does this error path need a call to drm_bridge_put(next) to properly release
the reference before returning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-drm-fix-of=
_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com?part=3D2
