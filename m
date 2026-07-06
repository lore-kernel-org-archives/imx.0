Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4008381AE9
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 15:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350398; cv=none; b=Fr5M0Dr7n8CPGRFJTm4xpIhBjHfPJvZbgkBW/bjnQ7t9OsVslhzpjulTYC6EX8MW0NPoOybDq+1yFJ7bnmcTUxVc5cZ5gbQZ6/yWBoJvJoMF0tN9zJJe6O0BQe6ThMMd19CKUxJ+GkOBEfF/siBEbNNufosanhYPSG5O/ezhHJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350398; c=relaxed/simple;
	bh=EGl9CutSylFdqT/667nKWWcDF3XA0gbSaEcU5Vq5IWc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VRt+v7/TfYKq9Apmg+t4YOvrwP1pxXCEjq00tZvKmD12sMQYUerGxiKfT+b6vxleLJ4/QcA7EoSYf3EXKitk52t4fGGtN9rrU4tNU+32DkVD32+N65UbSrqCXuUsp3bzHkwdxglACAbNXSvTnOKKp6Mm+GfOUr4Byky9rBABGb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4G1tmeZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4G1tmeZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430131F00A3D;
	Mon,  6 Jul 2026 15:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783350396;
	bh=2jNcmxF2li92w9Nds7KbSrYp59kmlXO0HeRGSw/RgKA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W4G1tmeZc2vJvQLdRfX29VfxWYd/0862mOq6HsHYlDzvSLXZsSfoPNVIPbtCxugnR
	 npi30ktEhsx2MrL47B6FggE8mV6TAnD0P9B2Uyob1A1ZO+UtqtO5LR9JnR92jtpqrk
	 8N+9K1BT4hqu2Rhp4Lg3kTnG/F7KkUgCbdQYDgomSK10W8jTUKhlPnFN8W25kZt+fz
	 VRGh28+gdNg5e2pYxeipDP/EVgauo0ZhmJGPDWEw8EwBDO03pZ2aY5QKLIG4nQPXkn
	 rwl1xpapne6cOlHTNjv9ex+YYzRCTn0ErHcJj/2xOxqr46VVtX2g7uCsrYAGEIe3MX
	 PvgbYIiXg//Ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] soc: imx9: devm_kasprintf error handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <2026070610-regime-badge-e99b@gregkh>
References: <2026070610-regime-badge-e99b@gregkh>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 15:06:35 +0000
Message-Id: <20260706150636.430131F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing unregister mechanism for the SoC device causes a Use-After=
-Free if the driver is unbound via sysfs.
--

commit 84c9267e8e5f768b0aa5bc1444220a55eb7de229
Author: Griffin Kroah-Hartman <griffin@kroah.com>

soc: imx9: devm_kasprintf error handling

This commit adds error handling to devm_kasprintf calls in imx9_soc_probe()=
,=20
ensuring that memory allocation failures return -ENOMEM rather than silentl=
y=20
continuing.

> diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
> index 58eef7d4f9089..23b54b7d75027 100644
> --- a/drivers/soc/imx/soc-imx9.c
> +++ b/drivers/soc/imx/soc-imx9.c

[ ... ]

> @@ -52,11 +54,18 @@ static int imx9_soc_probe(struct platform_device *pde=
v)
>  	rev_minor =3D SOC_REV_MINOR(res.a1);
> =20
>  	attr->soc_id =3D devm_kasprintf(dev, GFP_KERNEL, "i.MX%2x", soc_id);
> +	if (!attr->soc_id)
> +		return -ENOMEM;
> +
>  	attr->revision =3D devm_kasprintf(dev, GFP_KERNEL, "%d.%d", rev_major, =
rev_minor);
> +	if (!attr->revision)
> +		return -ENOMEM;
> =20
>  	uid127_64 =3D res.a2;
>  	uid63_0 =3D res.a3;
>  	attr->serial_number =3D devm_kasprintf(dev, GFP_KERNEL, "%016llx%016llx=
", uid127_64, uid63_0);
> +	if (!attr->serial_number)
> +		return -ENOMEM;
> =20
>  	sdev =3D soc_device_register(attr);
>  	if (IS_ERR(sdev))
>  		return dev_err_probe(dev, PTR_ERR(sdev),
>  				     "%s failed to register SoC as a device\n", __func__);
> =20
>  	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but does imx9_soc_probe() lack a way to
unregister the soc_device on driver unbind?

If the imx9-soc driver is unbound via sysfs, the driver core will call
devres_release_all() and free the devm-managed attr structure, along with t=
he
strings allocated by devm_kasprintf().

Because soc_device_unregister() is never called to complement
soc_device_register(), the soc_device remains active in the system.

Could this lead to a use-after-free if a user later reads the soc_device
sysfs attributes (like /sys/devices/soc0/family) which reference the freed
attr memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026070610-regime-b=
adge-e99b@gregkh?part=3D1
