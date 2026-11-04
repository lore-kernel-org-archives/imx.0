Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807688;
	b=ctgJ6YLGt1Ao5BGgD5ABY9CoS+KXsppMdkbaqXCRKjX2ECs2f1slTF2eND9jTnj3dg6r
	 4GK8ICPKOgK3yJFKmjf40qVAxpw9PtiXyPdh1ayx9F9mtXNb+7A7kXDwfSN8vHaFhvpNK
	 qRhTXImvASdQ1y3P43HksTpGQQABJtNvj7Sk88FZOPwnBFTvYJHsi9pJ6PtF7E/6xkHTz
	 cdkyWN+k3DGV2ZVrXxW0WOTDmDZ64A4B89Yu5oMceVowzzKLTTeIYAqyan0NVjwxtPn7F
	 UgKKIYBBix+qRVKue01uDa/Rg1mIDxLMG0FMGCjSPuk810F/M1O3k4NPj5vZuMIQTPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807688;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=W3sPLxs/2FYKtV7RaEcipLq50eZ4Fy1Gqkk+n6jgi0c=;
	b=0hxjJ1n4g+OArS3DdpJt97RNW1oMRygT49nCGcO0R3lVTclPZOi5HcrVKh1OhJEL/jS/
	 Yu4uOURxgP8oj2idJgPCV/6GHE1NdpgrR1l6EevjBQE+G2Y12ULrCsyRekuYJgJoVoXP2
	 YlBfaYpIauKCjYxUVXQX5eCgSvEzkDWlomFXdVxJKvHTmS4Dmu5tEYJwqUmCEgSBAMDOL
	 AnMGqR5wJn4M25mVv8OzH/uoMfPmvnsOqrW7LpJk7lmensgW7IokzEejftFNFRCJ3PkZg
	 mrxZuJU4ZlE76Rlgnu4K2awHCUfbs6lkHPfmXgqU3bkqzCN7FZTpc+m+nKdgZTIsOZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TUse1VAC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B8E606A31B
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 15:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TUse1VAC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8D11F000C1;
	Wed,  4 Nov 2026 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793807688;
	bh=W3sPLxs/2FYKtV7RaEcipLq50eZ4Fy1Gqkk+n6jgi0c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TUse1VACS/FTTvKUwIM7W9xSHRNUUFK5M3OpDIR+0PxlQOHVIBJse2lC0pjtRFn5s
	 +LOZ0YPxrjyA2qOXkiXOPmZTK46GWF6KnVJ85WR0ZEr8p3wVGqqq3EAvQpjurkN4Oc
	 byRL/JjAU0HJhHj8R9Ic20/kWyKQ50XVaGMPNkXYmEkNWPUSA2oNPvqYEpUiq8Kwzo
	 11ygecGMkQn3+6TvdWH4aTNZk02zhe2FO8U5hxyeghob2+bHgBkXMXNw3ib7D1AsXc
	 ifA7+DsKQjcDwrE10UOF+9gECwKQh6xsmSOvzrWUfCXD/Ji/VKLV6ncCU4cVvj0MpM
	 2sbpTnnsfpV1g==
Message-ID: <sashiko-outbox-197554@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] software node: do not resurrect swnode being
 released
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261104-swnode-race-v1-v1-1-9406a67e25be@nxp.com>
References: <20261104-swnode-race-v1-v1-0-9406a67e25be@nxp.com>
 <20261104-swnode-race-v1-v1-1-9406a67e25be@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 15:54:47 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] software node: transient ref in software_node_to_swnode() risks UAF
- [Medium] software node: re-registering named or parent node hits -EEXIST
--

commit d02f059d143a3e75e357a6d906b17afb37852f09
Author: Peng Fan <peng.fan@nxp.com>

software node: do not resurrect swnode being released

This commit updates software node lookup in drivers/base/swnode.c to use
kobject_get_unless_zero() so that zero-reference swnodes awaiting release on
swnode_kset->list are skipped rather than resurrected. It introduces
software_node_to_swnode_get() and software_node_register_node() for callers
that acquire a reference, while keeping software_node_to_swnode() as a
wrapper that drops the reference before returning.

>     software node: do not resurrect swnode being released
>    =20
>     software_node_to_swnode() walks the kset list under list_lock, but the
>     last kobject_put() drops the reference count to zero before
>     kobject_cleanup() removes the object from the list. A lookup can
>     therefore find a zero-ref swnode and call kobject_get() on it, which
>     triggers refcount warnings and a use-after-free.
>    =20
>     One way to hit this is the dwc3-imx driver on i.MX95: when
>     dwc3_core_probe() returns -EPROBE_DEFER, dwc3_imx_probe() removes the
>     static software node from the device, and the deferred probe retry
>     immediately adds the same node again. The previous swnode is still
>     waiting for its release callback, and CONFIG_DEBUG_KOBJECT_RELEASE ma=
kes
>     the window large and deterministic.
>    =20
>     Fix the lookup by acquiring references with kobject_get_unless_zero()
>     and skipping objects that are already in their release path. Use a
>     reference-returning variant for callers that keep the node (register,
>     unregister and device_add_software_node()) and keep a borrowed-pointer
>     variant for software_node_fwnode().
>    =20
>     To avoid looking the node up again after registration,
>     software_node_register() now uses an internal helper that returns the
>     newly created swnode reference, and device_add_software_node() consum=
es
>     that reference directly.
>    =20
>     Fixes: 80488a6b1d3c ("software node: Add support for static node desc=
riptors")
>     Signed-off-by: Peng Fan <peng.fan@nxp.com>
>=20
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 84a77ffa3dc4b..19a4153f3fac1 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c

[ ... ]

> @@ -98,6 +124,21 @@ software_node_to_swnode(const struct software_node *n=
ode)
>  	return swnode;
>  }
> =20
> +/*
> + * Borrowed-pointer variant of software_node_to_swnode_get().  The calle=
r must
> + * guarantee the lifetime of @node by other means.
> + */
> +static struct swnode *
> +software_node_to_swnode(const struct software_node *node)
> +{
> +	struct swnode *swnode =3D software_node_to_swnode_get(node);
> +
> +	if (swnode)
> +		swnode_put(swnode);
> +
> +	return swnode;
> +}

[Severity: High]
Can calling swnode_put(swnode) here drop the final reference and free swnode
before returning it?

In software_node_to_swnode(), software_node_to_swnode_get(node) acquires
swnode_kset->list_lock, increments candidate->kobj.kref (for example from 1
to 2) via kobject_get_unless_zero(), and releases list_lock.

If the owner of the swnode drops its final reference (via
device_remove_software_node(), software_node_unregister(), or
fwnode_remove_software_node()) before software_node_to_swnode() runs
swnode_put(swnode), the owner's kobject_put() only decrements kref from 2 to
1 instead of releasing the object:

1. If the owner immediately re-registers or re-adds the software_node during
   that window, software_node_to_swnode_get() sees the dying swnode with
   kref =3D=3D 1 and either fails software_node_register() with -EEXIST or
   reattaches the dying swnode in device_add_software_node().

2. When software_node_to_swnode() then calls swnode_put(swnode), it drops
   kref from 1 to 0, invoking kobject_release() -> kobject_cleanup() ->
   software_node_release() -> kfree(swnode), and returns a dangling swnode
   pointer to its caller.

This is reachable through software_node_fwnode() when resolving referenced
supplier or remote nodes (whose lifetimes are not pinned by the caller) in
software_node_get_reference_args(), software_node_graph_get_remote_endpoint=
(),
and software_node_add_links(), as well as through software_node_unregister(=
):

drivers/base/swnode.c:software_node_unregister() {
	struct swnode *swnode;

	swnode =3D software_node_to_swnode(node);
	if (swnode)
		fwnode_remove_software_node(&swnode->fwnode);
}

Also, the commit message mentions using the reference-returning variant for
unregister ("Use a reference-returning variant for callers that keep the no=
de
(register, unregister and device_add_software_node())"), but
software_node_unregister() still calls software_node_to_swnode(node).

[ ... ]

> @@ -977,21 +1006,39 @@ void software_node_unregister_node_group(const str=
uct software_node * const *nod
>  }
>  EXPORT_SYMBOL_GPL(software_node_unregister_node_group);
> =20
> +static struct swnode *
> +software_node_register_node(const struct software_node *node)
> +{
> +	struct swnode *parent, *swnode;
> +	struct fwnode_handle *fwnode;
> +
> +	swnode =3D software_node_to_swnode_get(node);
> +	if (swnode) {
> +		swnode_put(swnode);
> +		return ERR_PTR(-EEXIST);
> +	}
> +
> +	parent =3D software_node_to_swnode_get(node->parent);
> +	if (node->parent && !parent)
> +		return ERR_PTR(-EINVAL);
> +
> +	fwnode =3D swnode_register(node, parent, 0);

[Severity: Medium]
What happens if a named static software_node (node->name !=3D NULL) or a
parent/child software_node group is removed on -EPROBE_DEFER and
re-registered before kobject_cleanup() runs?

When the last reference to an swnode is dropped via swnode_put() ->
kobject_put(), __kobject_del() (which removes the sysfs directory) and
kobject_put(parent) only run inside kobject_cleanup(), which is delayed by
1-4 seconds on a workqueue when CONFIG_DEBUG_KOBJECT_RELEASE=3Dy.

For unnamed nodes (node->name =3D=3D NULL, such as dwc3_imx_swnode),
swnode_register() allocates a fresh IDA ID and creates "node1" while "node0"
is still waiting to be cleaned up. However, when node->name is set:

drivers/base/swnode.c:swnode_register() {
	...
	if (node->name)
		ret =3D kobject_init_and_add(&swnode->kobj, &software_node_type,
					   parent ? &parent->kobj : NULL,
					   "%s", node->name);
}

kobject_init_and_add() attempts to create a sysfs directory with the same
name as the dying swnode that is still present in sysfs, failing in
sysfs_create_dir_ns() with -EEXIST and a sysfs_warn_dup() warning.

Similarly, when a node group is unregistered via
software_node_unregister_node_group(), the dying child kobject holds its
reference on parent->kobj until kobject_cleanup() finishes; the parent's
refcount therefore stays non-zero during the delayed release window, and
re-registering the parent in software_node_register_node() still fails with
-EEXIST.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-swnode-rac=
e-v1-v1-0-9406a67e25be@nxp.com?part=3D1
