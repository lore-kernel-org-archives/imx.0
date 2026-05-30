Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBE82D23B9;
	Sat, 30 May 2026 00:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101948; cv=none; b=ObgKKCJmiU48hO+1COP9T+sEzjd2J9TQXTjbZhvl8WJ8aPsA70ahGZM9mqOjTOoAgC8/EqipmXLZ5iIb8TKH1WBsO8RzHEWngsGtXc1YiANxWf+JwIcLLfAdjvqPPEwbTOX6PDK3133y4TSG/pJHWhixG6bIe53H6hR4ZJBi7DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101948; c=relaxed/simple;
	bh=v33X0Xlo5mH9DxYvlj4HM38oxABXpgBqD3PjHMpwvxM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z4ZXVwiB1o91aWhCV+kahWwkoCbpM7+YwZ3//0281dLcn3ZaaTE0xfFUIjb/ymaU3DYV2nFXCQYqa+IFqcqklNTOflaOAs/lVaG6ZSEzJB9dH/zKU8z/twQnVkaPUL4CV6p86q9WUr9Ao5ea5Ax2iz0qKCdZ/JtWalWGkyaydjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXFHftII; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXFHftII"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BCDB1F00899;
	Sat, 30 May 2026 00:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101947;
	bh=Wo7KoMw0haLHy+OvK9vK27jhm5WlWE+1m3m5Ab0azr8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eXFHftIILzQdmiiNaoWbfuHjoTdwy6KbIMxgEOnETv94jIbIim4bTglORckqmKxib
	 pU4pj+U08qM4/mvInIFNL1TMHSNYbYR9jQSHTUzkIaGUXEiHryYBPJiCbppAW+EHkf
	 a3vJ22xOLdym6D4U8inmWqxn5vtOQP6waVWgRIiXz4V0r55bwusm4k8eZ3ve7Q98I/
	 vmS9YPsWj6aQqySs/YqWliGw3WwmE/DsxbuAxQKpac3KNRVz2u3VxRX9yeHM5qVy8x
	 Ac9gpsD8NavmqKLzQ7slCQA29S9EIKBTNUlQcU1ruYdgSkuCSnKfQfU848pBnhnhuV
	 mDpDFe/DBqLHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/23] drm/xe/i2c: use platform_device_set_fwnode()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260521-pdev-fwnode-ref-v1-18-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-18-88c324a1b8d2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:45:47 +0000
Message-Id: <20260530004547.4BCDB1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `cancel_work_sync(&i2c->work)` in teardown path leads to U=
se-After-Free.
- [High] Missing reference count on I2C adapter across asynchronous handoff=
 leads to Use-After-Free.
- [High] Unhandled I2C adapter removal leaves dangling client pointers whic=
h are double-freed during module unload.
--

commit a13cd1dfe26fa249e61eac41fbff512943d0184b
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

drm/xe/i2c: use platform_device_set_fwnode()

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the firmware node for dynamically allocated
platform devices with the provided helper.

> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index 706783863d07d..af4ebd93ad8e6 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -123,7 +123,7 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
>  	}
> =20
>  	pdev->dev.parent =3D i2c->drm_dev;
> -	pdev->dev.fwnode =3D fwnode;
> +	platform_device_set_fwnode(pdev, fwnode);
>  	i2c->adapter_node =3D fwnode;
>  	i2c->pdev =3D pdev;

[Severity: High]
This isn't a bug introduced by this patch, but does the teardown path miss a
cancel_work_sync(&i2c->work)?

The xe_i2c_probe() function initializes i2c->work, which is scheduled
asynchronously in xe_i2c_notifier() when the I2C adapter is added. However,
the driver's teardown function xe_i2c_remove() fails to call
cancel_work_sync(&i2c->work) before returning.

Because i2c is allocated via devm_kzalloc(), the memory is automatically
freed by the devres framework shortly after xe_i2c_remove() completes. If t=
he
background work is still pending or actively executing during or after this
teardown, xe_i2c_client_work() will dereference the freed i2c object to
access i2c->adapter and i2c->ep.addr[1], which could cause a use-after-free.

[Severity: High]
This is a pre-existing issue, but does the I2C adapter need its reference
count incremented across the asynchronous handoff?

In xe_i2c_notifier(), when a new I2C adapter is added, i2c->adapter is
assigned the raw adapter pointer and i2c->work is scheduled. No reference is
taken to ensure the adapter stays alive (e.g., via i2c_get_adapter()).

The scheduled background task xe_i2c_client_work() later accesses this
pointer to instantiate a client device via i2c_new_client_device(). If the
underlying I2C adapter is unbound or removed (e.g., via a sysfs unbind of
the i2c_designware driver) between the notifier firing and the work executi=
ng,
the adapter memory will be freed. The workqueue will then dereference a
dangling pointer when trying to register the client.

[Severity: High]
This isn't a bug introduced by this patch, but can unhandled I2C adapter
removal leave dangling client pointers?

When an I2C adapter is removed (e.g., by unbinding the platform device), the
I2C core (i2c_del_adapter()) automatically unregisters and frees all
associated client devices.

The xe_i2c_notifier() does not handle BUS_NOTIFY_DEL_DEVICE to track adapter
removal, so it fails to clear the i2c->client[i] array, leaving it populated
with dangling pointers. Later, when the xe driver is unloaded and
xe_i2c_remove() runs, it unconditionally calls
i2c_unregister_device(i2c->client[i]) on the already freed client pointers,
which could lead to a double free or use-after-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-pdev-fwnod=
e-ref-v1-0-88c324a1b8d2@oss.qualcomm.com?part=3D18
