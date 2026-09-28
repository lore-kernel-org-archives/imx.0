Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC7C4BB5A7
	for <imx@lists.linux.dev>; Mon, 28 Sep 2026 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597056; cv=none; b=dvh2VM4pKZ0iWr/lS8ZUyoGqA6tidNmoW46270K1u156eEc7U7tRG5a/sVVW1hJwskLYgSALXoRveStp2JGHLqoM5odBQQnRL6QFkwjewMpvR6vsB7sAKNhM38nn82R6YtSfG/CA2I/y/Vp41NWfZBzwD7chZ58GOKetiq8R+LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597056; c=relaxed/simple;
	bh=uItfN1YhjFrLKNmXTVEdHd4oW3v8n5Y/fVX0wTQ48MU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cd+ANLBp+OGdmSTZA59h4bTC137oxr9VZ1PIf+6XT8XsA8Hr+A/7TXg4CVu0h3ScyQyTxL/nKqIYAH5/pyBQychtcfaz5ug6NdOe/3i6Alzq02SANBW7+CDvWL/Yd3p77YiWKiTDiJPJR3iCcuYL7NAfXLklgOHS16j5QxxRtfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjxbsVcC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjxbsVcC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8CD1F00893;
	Mon, 28 Sep 2026 12:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790597055;
	bh=yYiJMMOzJBKYkMgz5N5iv4U6X0pcbinGWGeuBQ2G+AI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OjxbsVcCI1oQ+OazY9K3Y3/1JOS06RiiRhiCi8RZQ/lppK1Oz0PWdlqgHk2i3kSeA
	 sUNEFdUPZxkai1cSBzfmbNMXiQ2/T2fZQ5trgRVwMt2rTliAIPSURgo45/vqmBIL9R
	 PFeVYxCwvfRjmGR45YSwefkqNSYmatDuasmpWSxZr2IPFuiekp5sTZpInjybJo3wwN
	 Bt1MmvHvYcwT+Dr6gkzWm/O+HGV4YX8w61bZGUX8FNkBQnNnXQIreE+qa4IzuH4C05
	 mYctN79/9qakeGEkccr8g8Fp+SK8vZLwe+JpldbW3s1MQ1hN/3PjUeMcMOnwIfk60N
	 rHoXd2/AHHgVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] driver core: hand off fwnode ownership when shared
 fwnode owner is rejected
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260928-driver-core-v1-1-0846bb8e0f32@nxp.com>
References: <20260928-driver-core-v1-1-0846bb8e0f32@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 12:04:14 +0000
Message-Id: <20260928120414.CB8CD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] driver core: UAF due to race transferring fwnode to tearing-down s=
ibling
- [High] driver core: UAF/NULL dereference due to lockless fwnode->dev acce=
ss
- [Medium] driver core: race between probe failure and sibling binding orph=
ans fwnode
--

commit a697546921283509d4dd33e97eef3ff8dcaff551
Author: Peng Fan <peng.fan@nxp.com>

driver core: hand off fwnode ownership when shared fwnode owner is rejected

This commit addresses boot failures when a shared fwnode owner fails to
probe, leading to unresolved consumer links. It introduces logic to transfer
fwnode ownership to a bound sibling when the original owner is rejected.

> diff --git a/drivers/base/core.c b/drivers/base/core.c
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
[ ... ]
> @@ -1376,6 +1376,20 @@ void device_links_driver_bound(struct device *dev)
>  	struct device_link *link, *ln;
>  	LIST_HEAD(sync_list);
> =20
> +	/*
> +	 * Multiple devices may share the same fwnode (e.g. the SCMI bus
> +	 * creates several devices per protocol node).  The first one
> +	 * registered owns the fwnode; if that owner's driver is rejected
> +	 * it relinquishes ownership (fwnode->dev =3D=3D NULL, see
> +	 * fw_devlink_release_shared_fwnode()).  If the owning device has
> +	 * no driver at all (driver never compiled / loaded as module), it
> +	 * will never bind, so it is safe to take over.  Re-acquire the
> +	 * fwnode here so the purge/pickup still happens.
> +	 */
> +	if (dev->fwnode && (!dev->fwnode->dev ||
> +	    (dev->fwnode->dev !=3D dev && !dev->fwnode->dev->driver)))

[Severity: High]
Is it safe to dereference the dev->fwnode->dev->driver pointer locklessly
here?

If the owning device is concurrently unregistered via device_del() and clea=
red
from fwnode->dev, the compiler might reload the weak pointer as NULL before
dereferencing ->driver, leading to a NULL pointer dereference.

Alternatively, it could dereference ->driver on a pointer to a newly freed
device object, resulting in a use-after-free.

[Severity: Medium]
Could this condition incorrectly rely on ->driver to deduce if the owner is
still active, missing the window where the owner is tearing down but hasn't
cleared the pointer yet?

If Sibling 1 (the fwnode owner) fails probe, it calls
fw_devlink_release_shared_fwnode(). However, dev->driver is still set at th=
is
stage.

If Sibling 2 finishes probing and evaluates this condition concurrently,
it will see Sibling 1 as the owner with a populated ->driver pointer and sk=
ip
claiming ownership. Sibling 1 then clears the pointer to NULL. Neither sibl=
ing
performs the required purge and pickup routines, leaving consumers to defer
indefinitely.

> +		dev->fwnode->dev =3D dev;
> +
[ ... ]
> @@ -1474,6 +1489,54 @@ void device_links_driver_bound(struct device *dev)
>  	device_links_flush_sync_list(&sync_list, dev);
>  }
> =20
> +static int fwnode_shared_bound_match(struct device *dev, const void *dat=
a)
[ ... ]
> +void fw_devlink_release_shared_fwnode(struct device *dev)
> +{
> +	struct device *sibling;
> +
> +	if (!dev->fwnode || dev->fwnode->dev !=3D dev)
> +		return;
> +
> +	sibling =3D bus_find_device(dev->bus, NULL, dev, fwnode_shared_bound_ma=
tch);
> +	if (sibling) {
> +		dev->fwnode->dev =3D sibling;

[Severity: High]
Can this assignment result in a use-after-free of the sibling device pointe=
r?

This assigns dev->fwnode->dev to the matched sibling locklessly. If the
sibling is concurrently being unregistered, its device_del() routine will r=
un
this check early in the teardown:

if (dev->fwnode && dev->fwnode->dev =3D=3D dev)
    dev->fwnode->dev =3D NULL;

If the ownership is transferred to the sibling right after device_del() pas=
ses
this check, the fwnode->dev pointer will never be cleared when the sibling =
is
subsequently freed, leaving a dangling pointer that can be accessed later.

> +		fwnode_links_purge_suppliers(dev->fwnode);
> +		fw_devlink_pickup_dangling_consumers(sibling);
> +		put_device(sibling);
> +	} else {
> +		dev->fwnode->dev =3D NULL;
> +	}
> +}
> +
>  /**
>   * __device_links_no_driver - Update links of a device without a driver.
>   * @dev: Device without a drvier.
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
[ ... ]
> @@ -762,6 +762,15 @@ static int really_probe(struct device *dev, const st=
ruct device_driver *drv)
>  dev_groups_failed:
>  	device_remove(dev);
>  probe_failed:
> +	/*
> +	 * -ENODEV/-ENXIO mean the driver definitively rejected this device
> +	 * (errors are returned as positive values at this label). If it owns a
> +	 * fwnode shared with sibling devices (e.g. SCMI creates several devices
> +	 * per protocol node), hand the fwnode off so its dangling child
> +	 * consumers can be resolved by a sibling instead of deferring forever.
> +	 */
> +	if (ret =3D=3D ENODEV || ret =3D=3D ENXIO)
> +		fw_devlink_release_shared_fwnode(dev);

[Severity: Medium]
Because this handoff is initiated while dev->driver is still set (it gets
cleared much later in device_unbind_cleanup()), does this create the race
window with device_links_driver_bound() described earlier?

A successfully probing sibling running device_links_driver_bound() will see
the populated ->driver pointer and incorrectly assume the current owner is
still active, missing the handoff.

>  	driver_sysfs_remove(dev);
>  sysfs_failed:
>  	bus_notify(dev, BUS_NOTIFY_DRIVER_NOT_BOUND);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-driver-cor=
e-v1-1-0846bb8e0f32@nxp.com?part=3D1
