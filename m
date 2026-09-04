Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9474231197C;
	Fri,  4 Sep 2026 08:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509003; cv=none; b=mV/nW3C2g9YMbqlUAqIzIEr1ivPDcKm+nAzLfyqAcjSlI/aTVdEsui9XIKCM7hlMDtgSKeD9zRZRNFMzvO8sAQBhT6JZhCmUQJ9hTGoSc7SwyeNM48950krqYQxJ87fhjTjOnBl+/f6gUiuIop23NbqXakXH5U3mQ+HA29XniWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509003; c=relaxed/simple;
	bh=UTVbtymEi2WyVxX6kY1xTG9xnWIK5ZAnjkMeeTBTyn4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oRCEb2JLi7tUWOQIsD6EikAyWJS546BgCrJQ1cI1tAebHPkwGR9UMNMWZKwWIK5Kzg+algfORzHSVao2LYbZayXo/90qHepBLbh66GNEGSAECu+catnmOhQzPSXCkEkdRKNnIVtFS2sONr5A3INyRKB9i2Hn2RdgyP1m74aqp5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JX1onWhG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JX1onWhG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1651F00A3D;
	Fri,  4 Sep 2026 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788509002;
	bh=s/zSK9glIZgaFavTSPNYXa7U6OoG5C31lrRAZTpFKNM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JX1onWhGrn8yxZQlI4CcfGk1Co/Ts8c37PwXDDg2T+jC54nLUaTpp090KAzSaKW3J
	 tmo/kKR5GYiNERbc5KkAkg9Y95BFv92UmfQjFAmEEEeiopDVd9EPzxw4I1IZmBLShg
	 unCF4IrawZqXg7CgeorqOZO4K9lg18yIVi5GYwDkaKPe6lJFy3yQjD5vyysnkqYfJ2
	 4cqJYB0IpWU02C21TF2jttWzRfX8SHt8fZyr3TTB7JbxHOd/xSOCdFSCeRdMDbUDn0
	 JOnih7BeB3GqnM+WTdXZE1REQgm1058SV44yVg+nnGeqndHduL7M5zQM9e9spAJfp8
	 4EL54/ab+gkBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/13] drm/imx: dc-ed: Drop initial source selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Ying" <victor.liu@nxp.com>
Cc: robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org
In-Reply-To: <20260904-imx8-dc-prefetch-v6-10-26643e3f6cb7@nxp.com>
References: <20260904-imx8-dc-prefetch-v6-0-26643e3f6cb7@nxp.com>
 <20260904-imx8-dc-prefetch-v6-10-26643e3f6cb7@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 08:03:21 +0000
Message-Id: <20260904080321.BD1651F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unconditional dereference of potentially NULL component pointers d=
uring pixel engine runtime resume.
--

commit 0e56cfa8da82fa905cb37a791e64c203dd9bf7e5
Author: Liu Ying <victor.liu@nxp.com>

drm/imx: dc-ed: Drop initial source selection

It's unnecessary to set initial ExtDst source selection because KMS
driver would do that when doing atomic commits.

> diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-e=
d.c
> index b8ab41271bb40..803b3e891a1e6 100644
> --- a/drivers/gpu/drm/imx/dc/dc-ed.c
> +++ b/drivers/gpu/drm/imx/dc/dc-ed.c
> @@ -202,7 +202,6 @@ static inline void dc_ed_disable_gamma_apply(struct d=
c_ed *ed)
> =20
>  void dc_ed_init(struct dc_ed *ed)
>  {
> -	dc_ed_pec_src_sel(ed, LINK_ID_NONE);
>  	dc_ed_pec_enable_shden(ed);

[Severity: High]
This is a pre-existing issue, but does this function dereference the ed poi=
nter
without checking if it's NULL?

Looking at dc_pe_runtime_resume() in drivers/gpu/drm/imx/dc/dc-pe.c, it
unconditionally loops over fixed-size arrays:

    for (i =3D 0; i < ARRAY_SIZE(pe->ed_safe); i++)
        dc_ed_init(pe->ed_safe[i]);

    for (i =3D 0; i < ARRAY_SIZE(pe->ed_cont); i++)
        dc_ed_init(pe->ed_cont[i]);

    for (i =3D 0; i < ARRAY_SIZE(pe->fu_disp); i++)
        pe->fu_disp[i]->ops.init(pe->fu_disp[i]);

If any sub-component of the display pipeline (such as extdst, constframe, o=
r fu)
is marked as status =3D "disabled" in the device tree, the component master=
 in
dc-drv.c uses for_each_available_child_of_node() and only binds the availab=
le
components.

The pointers corresponding to disabled components remain NULL. When
dc_pe_runtime_resume() executes, it passes these NULL pointers to initializ=
ation
functions like dc_ed_init(), which immediately dereferences them when calli=
ng
dc_ed_pec_enable_shden(). It also directly dereferences them when calling
pe->fu_disp[i]->ops.init().

Disabling unused display pipes in the device tree is a standard configurati=
on
practice for generic SoCs, but doing so appears to cause a kernel panic here
during device runtime resume.

>  	dc_ed_pec_poweron(ed);
>  	dc_ed_pec_sync_mode_single(ed);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-imx8-dc-pr=
efetch-v6-0-26643e3f6cb7@nxp.com?part=3D10
