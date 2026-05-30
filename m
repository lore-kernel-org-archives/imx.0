Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500932D7DF1;
	Sat, 30 May 2026 00:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101949; cv=none; b=fPWWjLdBfxWi68foRdbmYLOuZKmRZl2TZM7aYX2UckRxEXUipE7KiGSxVRKd3cMpIlV8x22TYYR9eB2GSyv/lW/E44kVreTWPCueHl9/NkGV8SUebJygSA1OeJtiuBAL/RgXMF/NcPFhroFVeJMvle0cH3FaSvDJxbvJKRHgDbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101949; c=relaxed/simple;
	bh=/D+vH2SZalXb14m43HU9IPE4XF5ZI1Paf+p0oZviLA8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mZ4qpcYHV4+DgtnDMX4Q4Oe47G50zY3lZc1Ybp+b8ac63GKlvkRCq9asKUFM682ueqNsR86WqsHePwWMNcauSgjoOpR6wRYAxfupvaRCAQvO+e4pxJUh6bMzSd985hHeLWnTRfn1UoBxYe+JOpQCjKvUacCUaDMBc8A2Pz2UHCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JECxXyhy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JECxXyhy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91B81F00893;
	Sat, 30 May 2026 00:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101948;
	bh=Z6thopVeuYagUKjURL7CZmXOVTCSuAiIorhEWntvAJk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JECxXyhyOKz3SVsbU+btJ2IS7up7ruJ/8Ck52NhBHI7iOOoBK28R5Soumy5TYTB+P
	 Ca0be+4aaVqkdjMxrtdYrwF4T2d8AY5GnXlRMUjn0kL3d9IBcBhRt1v4tzjCpW2NOD
	 26mZbXz3HmGq2bMSVWwGruKi/VyPaohmHomsqgDt7KAKrpv4dbifTdY4myW8S7yk5e
	 SGwZ64zKB5rTBQvJe3W3U5bM7TkRZbgMY0LDpeKClb3+4c7NC1Km/Q5oOaWt3nJ2ov
	 Wq8B3Tp0kY7fl9/B7YmBl4wlJHgi2taRGVFSBmRzl4xaQln8bo33Oy97J34Br6jcE5
	 DHdtBxuFh63vQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 23/23] driver core: platform: count references to all
 kinds of firmware nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260521-pdev-fwnode-ref-v1-23-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-23-88c324a1b8d2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:45:47 +0000
Message-Id: <20260530004547.E91B81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unconditionally putting `dev->fwnode` in `platform_device_release(=
)` causes refcount underflows and use-after-free bugs for dynamically alloc=
ated fwnodes manually assigned by drivers.
- [Medium] The firmware node reference acquired during `platform_device_reg=
ister_full()` is leaked on the error path because `ACPI_COMPANION_SET()` cl=
ears the `fwnode` pointer before it can be released.
--

commit e4918f4a259d02413dc609fd6279d8c955cad207
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

driver core: platform: count references to all kinds of firmware nodes

This commit switches the platform device core to manage references for
all firmware nodes uniformly, rather than just OF nodes. It updates
platform_device_release() and assignment functions to use fwnode APIs.

> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -599,7 +599,7 @@ static void platform_device_release(struct device *de=
v)
>  	struct platform_object *pa =3D container_of(dev, struct platform_object,
>  						  pdev.dev);
> =20
> -	of_node_put(pa->pdev.dev.of_node);
> +	fwnode_handle_put(pa->pdev.dev.fwnode);

[Severity: High]
If drivers manually assign their parent's fwnode during probe without
incrementing the reference count, will this regression cause a reference
count underflow?

For instance, some drivers assign the fwnode directly:

device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));

Previously, of_node_put() was a safe no-op for non-OF nodes like software
nodes. Now, platform_device_release() unconditionally calls
fwnode_handle_put().

If the parent's fwnode is a dynamically allocated software node,
software_node_put() will be invoked without a corresponding
software_node_get().

Could this prematurely free the node and lead to a use-after-free for the
parent and other devices sharing it?

[ ... ]

> @@ -921,8 +918,8 @@ struct platform_device *platform_device_register_full=
(const struct platform_devi
>  		return ERR_PTR(-ENOMEM);
> =20
>  	pdev->dev.parent =3D pdevinfo->parent;
> -	pdev->dev.fwnode =3D pdevinfo->fwnode;
> -	pdev->dev.of_node =3D of_node_get(to_of_node(pdev->dev.fwnode));
> +	pdev->dev.fwnode =3D fwnode_handle_get(pdevinfo->fwnode);
> +	pdev->dev.of_node =3D to_of_node(pdev->dev.fwnode);
>  	dev_assign_of_node_reused(&pdev->dev, pdevinfo->of_node_reused);
> =20
>  	if (pdevinfo->dma_mask) {

[Severity: Medium]
Does this code leak the firmware node reference if an error occurs later in
this function?

If platform_device_add() fails, the error path executes:

err:
        ACPI_COMPANION_SET(&pdev->dev, NULL);
        platform_device_put(pdev);

The ACPI_COMPANION_SET() macro expands to set_primary_fwnode() and clears
pdev->dev.fwnode.

When platform_device_put() eventually calls platform_device_release(), the
fwnode pointer is already NULL.

Since fwnode_handle_put() acts as a no-op on a NULL pointer, will the
reference acquired here by fwnode_handle_get() be left unbalanced?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-pdev-fwnod=
e-ref-v1-0-88c324a1b8d2@oss.qualcomm.com?part=3D23
