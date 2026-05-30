Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D912D949C;
	Sat, 30 May 2026 00:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101943; cv=none; b=Ce4Pp47pgC4eE0fjbpTzjmEUlXPp+oq+B5n4Q9MhPYDdRauVDkQP78ap6taZdlaBlDjapJAw3NVJz52WmHvObnw6l8XqDQQZjoSWCOi3/REdgC3/2SHQVKrbKBe92yiS+PQJBozG9Tw7YWsziKRRwHDpfGhX2+jLuHi2cWmll3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101943; c=relaxed/simple;
	bh=ftezeYo2IDWYPG9ID0g2Rgt71TIyqPUn3QPZ/DUKRBI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZMCkESZmlVRNZ5r4TIvRPack713ArW++OdneHwEqTHh5nx4Hn5i8iVvb5uCaZ88SxJsjFZ8EQogHzRi34ESrGQMB5kNkgy1lSmbO9jzMKOuZZGyQyIaLotup4/Kotp8Mrmd9I5ejK2e71iaOnl+V7jzb/weLBAklVi+FqO98H3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OD/tkyzB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OD/tkyzB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04701F00898;
	Sat, 30 May 2026 00:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101942;
	bh=1A2V2ZCSpNCIZalH6mMWfrZsX0gDBSZNOdXsLAhmFxM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OD/tkyzByI/rsQVGH97qGP6t7x0aw8iIfY4BgsJD8IszFPfzI99dSKKQhqzPerD2q
	 TnQfLS5ftPiC2WiuTO+EJWFi2OE+6+yKNrsse/zYi8ffUr0mKmQgVowVwpsOFwYacx
	 HtYqStOoF1TgOPSOgUqDMvRbnoq7VUMG6+Z+QxggYBOw6mqFmdRtFQg2hyqIB9QrCi
	 yi4CnXBQSfwMedUPX8pqaqx97+MemY9nPSeA8azo+hCavJ7oHcVorrEimZYX9GLiF+
	 QFjq4tY+NIvQzhC87t0nhq0xJvhomna9XDPYKgHKgDOj+FkQgP03sM+oLnLwaWB+sS
	 4lh4tcu0FkdZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/23] pmdomain: imx: use platform_device_set_of_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-pdev-fwnode-ref-v1-14-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-14-88c324a1b8d2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:45:41 +0000
Message-Id: <20260530004541.E04701F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] OF node reference underflow leading to double-free and use-after-f=
ree in gpcv2 driver.
--

commit bd67fa18bf0839e7723c9cc2462ace1f391ce4b1
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

pmdomain: imx: use platform_device_set_of_node()

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index 42e50c9b4fb9f..abca5f449a226 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,8 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev)
>  			domain->ipg_rate_mhz =3D ipg_rate_mhz;
> =20
>  			pd_pdev->dev.parent =3D &pdev->dev;
> -			pd_pdev->dev.of_node =3D of_node_get(np);
> -			pd_pdev->dev.fwnode =3D of_fwnode_handle(np);
> +			platform_device_set_of_node(pd_pdev, np);

[Severity: High]
This isn't a bug introduced by this patch, but does the same fix need to be
applied to drivers/pmdomain/imx/gpcv2.c?

In imx_gpcv2_probe(), the scoped iterator for_each_child_of_node_scoped()
drops the reference on np when the loop iteration ends. However, the child
platform device's node is assigned using device_set_node(), which does not
increment the OF node's reference count:

drivers/pmdomain/imx/gpcv2.c:imx_gpcv2_probe()
    ...
    for_each_child_of_node_scoped(pgc_np, np) {
        ...
        pd_pdev->dev.parent =3D dev;
        device_set_node(&pd_pdev->dev, of_fwnode_handle(np));
       =20
        ret =3D platform_device_add(pd_pdev);
        if (ret) {
            platform_device_put(pd_pdev);
            ...
    }

When the platform device is eventually unregistered, or freed on the error
path via platform_device_put(), platform_device_release() will invoke
of_node_put() (or fwnode_handle_put() after the refcounting rework). This
results in a double-free of the OF node, since the initial reference was
never taken.

Should platform_device_set_of_node() also be used in gpcv2.c to properly
handle these reference counts?

> =20
>  			ret =3D platform_device_add(pd_pdev);
>  			if (ret) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-pdev-fwnod=
e-ref-v1-0-88c324a1b8d2@oss.qualcomm.com?part=3D14
