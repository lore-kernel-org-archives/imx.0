Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECAA4189C5;
	Tue,  7 Jul 2026 13:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430710; cv=none; b=bjAgR6wVqkD99JEFR21zSQfCkgfZkcw2xhOYHvNI4PHvutDUlVGo+bIlRqBIhDF4WaoS+bQ2/bykjtXKwaV7E8XnEn1cM7rE90nMDW3N0LBPUhAmbAF3GlwJGXp66dAO39F3YzEz9YpwJuLyJhZtzBNarorbOcR23FNonqY4hfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430710; c=relaxed/simple;
	bh=EleOnnZBM+dhfixq6r7HFdUJR63bJmvSqZ0s17iL/Ls=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SPyCeBM6MBtzkgmkQeJ1uCnntr+SXo0HCW2OVKq0zJFPoqLIOlzOsMm3MgiK0JojPG0xzYYqVH+CJ5gNi6S5k3L9fgyMpm+G1W1WTNKIsqhVyGmvKZzvrYPEAEyu5fSc1Mf98bfutHDF4Tc73oaqSPTQO4vA9NyUu0t6mdgQ7QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezdrps5t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezdrps5t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B361F000E9;
	Tue,  7 Jul 2026 13:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783430709;
	bh=sRTsZByg3jigN6FqrDwzd3A6GFnHFsVi5eGWHjMDrJ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ezdrps5t0qJIGAcRzSumhAkuU01eJSeJuBJnO4UghsHoqNwV4KISXfbgRVxsM9ITL
	 QwOkB4lhFC+zaQWP8qUkoTYwwMMMpJ2C5uIduHqPguFElwcgWiN1M8m5GeGkjb+2Mp
	 br//pVzcdQ2bMSsdavvV1d/Z+XAte0bKrWdO7wLyM16J+DTO/fj/Qjlo8BaDVDc84u
	 aWdUizfEf5y7+UmZMx4a0/Kp4H6TX7tXMpdz8kJs4u/RzBVDGZhjS0aXp5/8GyAgEh
	 WLn/kv5QuTmlj4AiIZyiNL9qKcr+l4Y65wlGh/fo9wEEO9YZPxEQY0Z/oIejkhIp70
	 n8gB8cBHM+KJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 20/20] driver core: platform: count references to all
 kinds of firmware nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, lee@kernel.org, Frank.Li@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260706-pdev-fwnode-ref-v3-20-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
 <20260706-pdev-fwnode-ref-v3-20-1ff028e33779@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 13:25:08 +0000
Message-Id: <20260707132509.06B361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] OF node reference leak for dynamically allocated platform devices =
due to incomplete tree-wide conversion.
--

commit 50bc78e1d223d4a9addf4cc0c3c1d384a104d5a6
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

driver core: platform: count references to all kinds of firmware nodes

When using platform_device_register_full(), we currently only increase
the reference count of the OF node associated with a platform device. We
symmetrically decrease it in platform_device_release(). With all users in
tree now converted to using provided platform device helpers for
assigning OF and firmware nodes, we can now switch to counting references
of all kinds of firmware nodes.

> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 9357942d0c79b..a71015f1d9153 100644
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
Does this code leak the device_node for drivers that haven't been fully
converted to the platform device helpers?

The commit message mentions that all in-tree users are converted, but there
appear to be some unconverted drivers still using device_set_of_node_from_d=
ev
on dynamically allocated platform devices.

For example, in drivers/usb/host/fsl-mph-dr-of.c:fsl_usb2_device_register():
	device_set_of_node_from_dev(&pdev->dev, &ofdev->dev);

And in drivers/usb/musb/musb_dsps.c:dsps_create_musb_pdev():
	device_set_of_node_from_dev(&musb->dev, &parent->dev);

Since device_set_of_node_from_dev() sets and increments dev->of_node without
setting dev->fwnode, won't fwnode_handle_put(NULL) do nothing and permanent=
ly
leak the OF node reference when these devices are released?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-pdev-fwnod=
e-ref-v3-0-1ff028e33779@oss.qualcomm.com?part=3D20
