Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808460;
	b=CGmjfgr5scXmXdxCy5b6yBGZpIIqSXLmI0zP1ErG3OZzY801gk/6c0gHj/Cs/Iiyk4+p
	 F2Ejm7de8jtPKOaW8BJyZrP9LWzqVXUfLqdYhw6DIy9iiku0Cb89HlfiCQWOZQVcvvowN
	 yT+wic9X7XAz94n7bxTMDZ0w/V6nbTHD5gGAtPTN/0/k5d5vYmLKnR2Oe6VG1fpMZkWUg
	 P+fJxy5USlIcf1UdmO7/9QiqA+uHQIV4u/JY8vQr2jo9/57sGV4bZxbJARaBUuLpjFRxZ
	 3hdlzDWxP0z9rzzWlYBNazNrC4E+vffHZMOkhDqO1AZUb3vmoZFYY8DiVKkGfVS3pJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808460;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jAQE6XsGNYs4FRrRUOdVXVIOk2qnYo6/djLUL1uif54=;
	b=ORlADLDbcFjaV7PeszvkK9+i4Tkn8mVuVVNSrJV9VUXGSnBEZNYcZAkKEwTZvfARJcX7
	 qOUu2rvtjKbuYYDNpJd8gyBe1fI6Xn0lEsgcilDALIVdFbFPpKjH8MBOSPf+G6qUk8Gew
	 ptiDTe8m1HHAQ24SnqZwLe5AvqgKsPNy7743qKg14kEoYnp273UULqaV55ixWf2C8+1yK
	 u96wM5gH6vBFGVVQxb38l8ht8ddVJZHLhdhyl9v3AzyTdCxvBCmFcisZqsxG4WvPlTPwL
	 aA2VSJkPG0T8dkBSSD73Tbh6Bxc2cl+nYNk+fluCTWktMB8HF+tm91amWMeBg7F7dxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jtpbcmbm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97A1606A31B
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 16:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jtpbcmbm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351241F000C1;
	Wed,  4 Nov 2026 16:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793808459;
	bh=jAQE6XsGNYs4FRrRUOdVXVIOk2qnYo6/djLUL1uif54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JtpbcmbmFpOB9+9KnsfGyq8bWt+Nw1MfGMJYN00bFBXw+ZRE/yJaxWsVkqzd8Rt3/
	 4d2PayILvz+VIaL4WVG2SMrB+fn5HlOHyh3DLAGYbkjzogyOOO6LAtv1n9IJomKmsS
	 6VhsD5pY0cHcom3nfzzcGF6h+ccGbFMn2zqj+6oPe9SkPpmRd6zXaZFTicbqAUcB/G
	 D1kxhv5nnwqUmlfx7HpwxFyZJmXzk9ZpiuG3Zycme7jNNHvvx+4NSGRUCti46aK3Tq
	 WnrcRuvZat/Fgm2H34tKHv/wqWR8UpIjR977s/WXvEt3MiwPKvW02IOZrtfR0pEBWA
	 eFLJnvdTcQs+Q==
Message-ID: <sashiko-outbox-197571@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] software node: use kobject_get_unless_zero() in
 software_node_find_by_name()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261104-swnode-race-v1-v1-2-9406a67e25be@nxp.com>
References: <20261104-swnode-race-v1-v1-0-9406a67e25be@nxp.com>
 <20261104-swnode-race-v1-v1-2-9406a67e25be@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 16:07:38 +0000
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
- [High] software node: use-after-free on swnode->node in software_node_fin=
d_by_name()
- [Low] software node: wrong Fixes tag for software_node_find_by_name()
--

commit e919f34826aef89486e543d4a209837a0357d8a1
Author: Peng Fan <peng.fan@nxp.com>

software node: use kobject_get_unless_zero() in software_node_find_by_name()

This commit updates software_node_find_by_name() to use
kobject_get_unless_zero() instead of swnode_get() so that it skips entries =
in
swnode_kset->list whose reference count has already dropped to zero.

>     software node: use kobject_get_unless_zero() in software_node_find_by=
_name()
>    =20
>     software_node_find_by_name() also walks the swnode kset list and take=
s a
>     reference with swnode_get(). Like the pointer-based lookup, it can
>     encounter an entry whose refcount has already reached zero but which =
is
>     still linked until its delayed release callback runs.
>    =20
>     Use kobject_get_unless_zero() and continue scanning when the entry is
>     already dying.
>    =20
>     Fixes: 80488a6b1d3c ("software node: Add support for static node desc=
riptors")
>     Signed-off-by: Peng Fan <peng.fan@nxp.com>

[Severity: Low]
Commit 80488a6b1d3c ("software node: Add support for static node
descriptors") introduced software_node_to_swnode(), while
software_node_find_by_name() was added later. Should the Fixes tag instead
reference the commit that introduced software_node_find_by_name()?

  Fixes: 1666faedb567 ("software node: Add software_node_find_by_name()")

> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 19a4153f3fac1..9095d50ba146f 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -831,8 +831,8 @@ software_node_find_by_name(const struct software_node=
 *parent, const char *name)
>  		swnode =3D kobj_to_swnode(k);
>  		if (parent =3D=3D swnode->node->parent && swnode->node->name &&
>  		    !strcmp(name, swnode->node->name)) {
> -			swnode_get(swnode);
> -			break;
> +			if (kobject_get_unless_zero(k))
> +				break;
>  		}

[Severity: High]
Can dereferencing swnode->node->parent and swnode->node->name before calling
kobject_get_unless_zero(k) cause a use-after-free when scanning past a dying
swnode?

When a software node is registered via software_node_register(),
software_node_register_node_group(), or device_add_software_node(),
swnode->allocated is 0 and swnode->node points directly to caller-owned
memory rather than an internal copy freed in software_node_release():

drivers/base/swnode.c:software_node_release() {
    ...
	if (swnode->allocated)
		software_node_free(swnode->node);
    ...
}

Once software_node_unregister() drops swnode->kobj.kref to zero and returns,
the caller can immediately free or unmap the backing struct software_node
while the dying swnode remains on swnode_kset->list awaiting kobject cleanup
(for example when CONFIG_DEBUG_KOBJECT_RELEASE delays release, or before
kset_leave() acquires swnode_kset->list_lock).

For instance, ipu_bridge_init() in drivers/media/pci/intel/ipu-bridge.c
unregisters a heap-allocated node and immediately frees it:

err_unregister_ipu:
	software_node_unregister(&bridge->ipu_hid_node);
err_free_bridge:
	kfree(bridge);

Similarly, fwnode_pointer() in lib/tests/printf_kunit.c registers
stack-allocated software_node structures and unregisters them right before
returning from the stack frame.

Should software_node_find_by_name() acquire the reference via
kobject_get_unless_zero(k) before dereferencing swnode->node, and drop that
reference if the parent or name does not match?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-swnode-rac=
e-v1-v1-0-9406a67e25be@nxp.com?part=3D2
