Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7701283FE6;
	Tue, 12 May 2026 21:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778620604; cv=none; b=d8RVoF2mFTMSWnZuHKVLcBOIGtHd0UMg35iOkzFebCs2bn0tQbGVHs7zxkSXKBrGU3NOG13AwaosqRyLCm996BVK+ck0OnvHbOFJ6NXi2iyaJj03fJCLPD4JBIs0K7UGsVJaUBQo55Klhx/oagcCp/Ugf7choWhl06A42jv+KYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778620604; c=relaxed/simple;
	bh=APePLdspSN7hGGceShzyPLNA9Svo0jqkScnt1ljbgPk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=snXYnnFf/jHAQp1M5/UmXu6yR2P0EHBDDiNmRytMEX/9EX/VNbIBFoPaW2lcWZHoGwgSHLorruhRfDD6nuMG29w/lEZgdApMlTwEQFsCvylSqkxixTVUINlXOicV4tKfhu9TqiJD4DZLKCljhEbXoXwraH4lnj729fD6BHxjLck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRYNSHl6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRYNSHl6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5A6C2BCB0;
	Tue, 12 May 2026 21:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778620604;
	bh=APePLdspSN7hGGceShzyPLNA9Svo0jqkScnt1ljbgPk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=RRYNSHl6ns4OxYdPq99u8gvDxeoiaw/GZh0Zb+x+FA3tAJ0DQrMdFMNZetSh+GB0L
	 0Fs3MZeEQZFQJw8dAKGkkT67BTyTE1ObP5zPs8Rq6Krnw2iu7mWEwZEIdEe+Fvc2OV
	 7Tdqgn9302W2VI7uWdh8c9U3P84AtAicOL+Rv0l0ZkJ+LLtwCLRATseD88JcIW+nA4
	 m1oUrUOGYoEtkRGrYzvbVqnCbx+S017QoaEawMDRLlnewa7hCqkIva28Icsd/YriB3
	 DcCKD3dsY6RlPUZTE8W/IB+Q17Lvr6P0groVzGl2Yqz6NMCMxQ2P2KKW9ROUtVYj3X
	 P0vrJ8a+b8Q2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
Reply-To: sashiko@lists.linux.dev
To: "Herve Codina" <herve.codina@bootlin.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260511155755.34428-3-herve.codina@bootlin.com>
References: <20260511155755.34428-3-herve.codina@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 21:16:43 +0000
Message-Id: <20260512211643.EB5A6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `dev->fwnode` validation in `fw_devlink_pickup_dangling_co=
nsumers()` leads to a kernel panic if the device's fwnode is NULL.
--

commit eebf7e6f50a0aa0439d5a1099141444a70ec8219
Author: Saravana Kannan <saravanak@kernel.org>

of: dynamic: Fix overlayed devices not probing because of fw_devlink

When an overlay is applied to an already probed device, fw_devlink logic
is rerun. This allows newly created dangling consumers of overlayed device
tree nodes to become consumers of the target device.

Link: https://lore.kernel.org/lkml/20240411235623.1260061-3-saravanak@googl=
e.com/

> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index bd2ddf2aab505..478aa3fbf1e83 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -235,6 +235,79 @@ static void __fw_devlink_pickup_dangling_consumers(s=
truct fwnode_handle *fwnode,
>  		__fw_devlink_pickup_dangling_consumers(child, new_sup);
>  }
> =20
> +static void fw_devlink_pickup_dangling_consumers(struct device *dev)
> +{
> +	struct fwnode_handle *child;
> +
> +	guard(mutex)(&fwnode_link_lock);
> +
> +	fwnode_for_each_available_child_node(dev->fwnode, child)
> +		__fw_devlink_pickup_dangling_consumers(child, dev->fwnode);
> +	__fw_devlink_link_to_consumers(dev);
> +}

Is it possible for dev->fwnode to be NULL here?

The original logic in device_links_driver_bound() was protected by a
dev->fwnode check. The newly added caller fw_devlink_refresh_fwnode()=20
appears to call this without checking if dev->fwnode is still valid:

fw_devlink_refresh_fwnode()
  dev =3D get_dev_from_fwnode(fwnode);
  ...
  if (dev->links.status =3D=3D DL_DEV_DRIVER_BOUND) {
      fw_devlink_pickup_dangling_consumers(dev);

If dev->fwnode is NULL, such as when it is cleared by a concurrent
device_remove_of_node() before device_del() runs, the nested call to
__fw_devlink_link_to_consumers() will dereference it:

__fw_devlink_link_to_consumers(struct device *dev)
{
        struct fwnode_handle *fwnode =3D dev->fwnode;
        ...
        list_for_each_entry_safe(link, tmp, &fwnode->consumers, s_hook) {

Could this lead to a crash when &fwnode->consumers is evaluated? Would it
make sense to add an explicit check for !dev->fwnode at the start of
fw_devlink_pickup_dangling_consumers() to mirror the structural safety
previously provided in device_links_driver_bound()?

[ ... ]

> @@ -1312,16 +1385,8 @@ void device_links_driver_bound(struct device *dev)
>  	 * child firmware node.
>  	 */
>  	if (dev->fwnode && dev->fwnode->dev =3D=3D dev) {
> -		struct fwnode_handle *child;
> -
>  		fwnode_links_purge_suppliers(dev->fwnode);
> -
> -		guard(mutex)(&fwnode_link_lock);
> -
> -		fwnode_for_each_available_child_node(dev->fwnode, child)
> -			__fw_devlink_pickup_dangling_consumers(child,
> -							       dev->fwnode);
> -		__fw_devlink_link_to_consumers(dev);
> +		fw_devlink_pickup_dangling_consumers(dev);
>  	}
>  	device_remove_file(dev, &dev_attr_waiting_for_supplier);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511155755.3442=
8-1-herve.codina@bootlin.com?part=3D2
