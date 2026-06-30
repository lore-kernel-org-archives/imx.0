Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A433537F9;
	Tue, 30 Jun 2026 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811124; cv=none; b=htVplP+SaRKP6HTS+61Kxh+tzjpiaG0G8RJnZxjEZggslG6/Xsf7wC5+yhItbg+4H5qwBEovIMA0v8SfxFNp7MHsRmVaYKnOUF7PanavjExHaJKLj37dmRoLO5gC3hPLjsuqBUW5VbYClLlN34s5H+mItwZSM8Bg7BZIGsSOwqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811124; c=relaxed/simple;
	bh=yzGKDmVGP3AUw9LwpdPjleo/babIFsWUcOySeTLhklM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qv5e+bmXcedYoXgR7cGM2Z6WJsld/xoki4DHNoJehOuApq8txVLlnku8edh2TxnkIx+jkO7xQXVoCrx/tZFoi8JqN7Nj/tBn2J6x1giUSZ1nkxkGpqqs5xIfyyVFCDIoMMhkP06UxBEnvyzzVnkMK3Ah/PPyvG7ejJY77VFnBT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDN4GIX1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDN4GIX1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE2F1F00A3D;
	Tue, 30 Jun 2026 09:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782811123;
	bh=9OH3q4zyN12p0WjlOzyD0rZl+9v/3ZiPP5Jehec6diA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nDN4GIX1F8Ob8rJfntIJzBUXdUCidFseMnZzWe1UROIM5t3UT7nvTjlmbJjc7OQTS
	 93CtTLqvn3ZliBHtch3PXjK4+jGUdQU8ggMQnVAz/W2Kk9JkCYzrvUKIu1XuP6BV66
	 MoPPDwSFyzhZTymBdQjenZhBqg9zfEGsh2capCVE6hyjiGU3emFVUWYnAFcT85fa4S
	 aX8Xc/oqlUoF1i/EK7/uUtRT8SbbPHnJExYnxaJP4upobPORw4NY21GnaAPmUHpKD2
	 eG1oTyZqlQaC5p35ANR9+8vQipvIyIs3h/tpgufOhtaz1MIRL5ctKi2IW1MgbBGU+0
	 ZUEXbUHfzDPrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 19/19] driver core: platform: count references to all
 kinds of firmware nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev
In-Reply-To: <20260629-pdev-fwnode-ref-v2-19-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
 <20260629-pdev-fwnode-ref-v2-19-8abe2513f96e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 09:18:42 +0000
Message-Id: <20260630091842.BCE2F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Memory leak of `of_node` references in platform device release
- [High] Refcount underflow and use-after-free of software nodes on platfor=
m device release
--

commit f2aa250a52f31d368fee3251e58597913170101a
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

driver core: platform: count references to all kinds of firmware nodes
   =20
This patch switches to counting references for all kinds of firmware nodes =
by
replacing the of_node_put with fwnode_handle_put in platform device release.
It also updates platform device setup helpers to properly acquire fwnode
references.

> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index f24a5f406746b..bb5f5bddd047d 100644
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
Does replacing of_node_put() here cause a memory leak of of_node references?

Many drivers and core APIs manually acquire an of_node reference and assign
it directly to pdev->dev.of_node without setting pdev->dev.fwnode. For
example, in drivers/base/core.c:device_set_of_node_from_dev():

	of_node_put(dev->of_node);
	dev->of_node =3D of_node_get(dev2->of_node);

When a platform device set up this way is released, fwnode_handle_put() will
operate on a NULL or unrelated fwnode, failing to drop the of_node referenc=
e.

[Severity: High]
Can this fwnode_handle_put() cause a refcount underflow for software nodes?

Platform drivers often inherit their parent's fwnode without taking an
additional reference. For example, in drivers/gpio/gpio-arizona.c:

	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));

Before this patch, calling of_node_put(dev->of_node) on a software node was
a safe no-op (as of_node was NULL). Unconditionally calling
fwnode_handle_put() here will now invoke software_node_put() and decrement
the unacquired reference, potentially leading to a use-after-free when the
device is unregistered.

>  	kfree(pa->pdev.dev.platform_data);
>  	kfree(pa->pdev.mfd_cell);
>  	kfree(pa->pdev.resource);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-pdev-fwnod=
e-ref-v2-0-8abe2513f96e@oss.qualcomm.com?part=3D19
