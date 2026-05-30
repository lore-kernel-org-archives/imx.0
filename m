Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D4B2D23A4;
	Sat, 30 May 2026 00:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101941; cv=none; b=Eq7009F2MudOviOYmpq2b5gRX9pQXaAnuNR7w6ttyaKQ5DpP9fdUtk0qj24Fo/dStn40sQ0VUlkk/JWAPUy8/XVUD/VF8KMjSQBO4Bd7to7//O/c1yq9ruKKpSq8PtCe5UW0vp+ahMYVR3RKHYSw7v+IEAhlal8jN+rYeZbr5fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101941; c=relaxed/simple;
	bh=7uhldFHFzREefcbWdP8tQpejikAvSzRiJQgAJisoXzA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cb8wwatTpUKxolerxV7pzTy68Sp4yzwc23JMpyBjRZGZ3jMhUTnjBFRDruLx2S5ZwN6Pu4nwL1uMYKSqqNj8+L8iu/Bog+h0wHQJzpQFom8M0+J3LFPU0MTHSLG0nYOUSqCOFdCEGob52b8KbIOP2YZVAl0sm3tBhh9ZPyLNCbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HbxAYTR4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HbxAYTR4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AE91F00898;
	Sat, 30 May 2026 00:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101940;
	bh=YvPCd6HJysQWh5b7lxsR3Bs1W+EfVdzbRc1N+z03ofY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HbxAYTR4AJYKdV1y4GV/AOqkzCbjETMn2cKgnapyweqQB9xCppXx121OznEoLAaUP
	 8k67eLfzayHHz0FSFSBR6QVCrTF+IiS6q+L/OVfail0qPx1BEMEiq/rk7uf4nUPRYf
	 tiVLDrf/DKE2FFr03MPZPKEo7DY256hmfXUipYzdszfxAG+YsjfSP00dxhW39aGWgL
	 InE2uv6pN/jtNrqSZPZwxvuKtqt1W7Al6tOm64py+Fm2wEQcbDWMFOZdEfhdQ0Bhg9
	 xDtzdRzyCFBX7o7K14w8oeSuLdurXzw3/S57SijqAhYwwm3kipb3L7r8EQtxctw9xM
	 i0oWc9TR56bGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/23] mfd: tps6586x: fix OF node refcount
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260521-pdev-fwnode-ref-v1-1-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-1-88c324a1b8d2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:45:39 +0000
Message-Id: <20260530004539.C4AE91F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The IRQ domain and descriptors allocated in `tps6586x_irq_init()` =
are never freed, leading to a memory leak and potential use-after-free.
--

commit e8eb8e919be10c86b0019b03f67b4c7e8f91a6b2
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

mfd: tps6586x: fix OF node refcount

This commit fixes an OF node reference count issue for sub-devices
created with the split platform_device_alloc() and platform_device_add()
approach. It adds a missing of_node_get() to prevent a premature
of_node_put() during device release.

> diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
> index 8d5fe2b60bfa5..f5f8054466033 100644
> --- a/drivers/mfd/tps6586x.c
> +++ b/drivers/mfd/tps6586x.c
> @@ -397,7 +397,7 @@ static int tps6586x_add_subdevs(struct tps6586x *tps6=
586x,
> =20
>  		pdev->dev.parent =3D tps6586x->dev;
>  		pdev->dev.platform_data =3D subdev->platform_data;
> -		pdev->dev.of_node =3D subdev->of_node;
> +		pdev->dev.of_node =3D of_node_get(subdev->of_node);
> =20
>  		ret =3D platform_device_add(pdev);
>  		if (ret) {

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this file I
noticed the IRQ domain and descriptors allocated in tps6586x_irq_init() are
never freed.

Does this driver leak the IRQ domain and descriptors on driver unbind
(tps6586x_i2c_remove()) or probe error paths?

tps6586x_irq_init() allocates descriptors using irq_alloc_descs() and creat=
es
an IRQ domain via irq_domain_create_simple(). The driver lacks matching cal=
ls
to irq_domain_remove() and irq_free_descs(), and these allocations are not
managed by devm_ variants.

Since tps6586x is allocated via devm_kzalloc(), it is automatically freed
when the device unbinds or probe fails. If the leaked irq_domain remains
linked in the global irq_domain_list with its host_data pointing to the
freed tps6586x structure, can a subsequent traversal of the IRQ domains
(e.g., via /sys/kernel/debug/irq/domains) cause a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-pdev-fwnod=
e-ref-v1-0-88c324a1b8d2@oss.qualcomm.com?part=3D1
