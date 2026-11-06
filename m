Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793940739;
	b=OBlBlCqLbWcjN4fo1+Tjj8YwhA1y9jGObn1TLvtMPgSjHqPTDQs+eSMLGdSULyZMzyo2
	 mLeuavL/xL/o8ko+4a6t10f/RHj0SnZqOKpWEUZeI0vzlK4OZ4abTlmNbEqsdxCJ71iIc
	 tGTLAg7Lb5HPn1I7eQjjkRXx/F1oWnpWIHzvKGJKqecvUoU3eLimum0Xe12KU3pZL90Cw
	 uqhTb/c2q0+4ap8l5T9Z9Rxx8Zg8CWuv7fNCQoz+Wgub8L9/H9aRWjGZ+3axvjw5qJ7lP
	 i47cjaTs3EA7FnMStoy9wCZDaJ3XZ0i3nJGao0A1olx+hbgG2ErSw1n5r7FLja7JtUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793940739;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/z6px1sXRDUe60S1VOk/wqtyXzsfQRdiBY7Q2mFtblw=;
	b=mUerPjp0a9xG+xTCpiA1Aw7bu+RAjQZDCHCH7e2PszeRsm/Oo6+ZhSk/RTqwvm8w+WBx
	 ryQ3Vq+nGtvuFKZhj/naXO07snLB5tH/jU36PFJHXZkT6bhKeL3ISx+HuldihtAKG+tKE
	 CFblcKw6dXWQnq5rXOl7ypQhtgcT3lzgNCkdfYbrKIf/tyxo1ky1MhlB3EWIelejdmdh9
	 IgNHqfaCzoTbXa6sES0F9RiFb1L3rlUQJMPXzsmFjiWxerh5APKj0R+mio5rv5OE5k87c
	 My8gi5+GVwA7URJQSsQ626/FpAzoyoYMJ6E+ePYRV3cm0mrYm28aF6K2SFr/gvaezcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DurzKOiJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C9F606A31B
	for <imx@lists.linux.dev>; Fri,  6 Nov 2026 04:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DurzKOiJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122861F0089F;
	Fri,  6 Nov 2026 04:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793940739;
	bh=/z6px1sXRDUe60S1VOk/wqtyXzsfQRdiBY7Q2mFtblw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DurzKOiJnZ7Ezx6neJ2KIJlhNZnfoPhgjYR+8nZDuxhnBPbqsQvc6cu2bCnP+qRWP
	 tGovQZ7ZqK3yF7GTM0Ine4LQzF/s43juaM6mNcwSlbu+wVK3/BFf/K5LeOLr6lh005
	 nHSpP2Up9N+dm2bCW+7VTaDYntxR9PUxYXMlg2LZaILoThKnXtj8ndP/OWaKpygIqF
	 SBTOQPjJij5AiZuoWs+JZqQZ8ltgPcQi/VhnVev7+pFa8HLP/UAn8NRRpv8Vz0KuPp
	 Cr2/erbBHcAWkStoWwdy6KMpUiyyemFFo5WX0qSEptWpP+CyAVKBkTBbV/PWcBkMfd
	 c073sA4E1ObKA==
Message-ID: <sashiko-outbox-200773@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] software node: do not resurrect swnode being
 released
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261106-swnode-race-v1-v2-1-f8bc7b14d578@nxp.com>
References: <20261106-swnode-race-v1-v2-0-f8bc7b14d578@nxp.com>
 <20261106-swnode-race-v1-v2-1-f8bc7b14d578@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 04:52:18 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] software node: sysfs and parent collision in software_node_regis=
ter_node()
--

commit 24164332b4b2134522c9b4a2c4cf027c9a0ece19
Author: Peng Fan <peng.fan@nxp.com>

software node: do not resurrect swnode being released

This commit updates software node lookups to use kobject_get_unless_zero() =
so
that software nodes whose reference count has reached zero are skipped inst=
ead
of being resurrected while awaiting kobject cleanup. It also introduces
software_node_register_node() to return the newly registered swnode referen=
ce
directly to device_add_software_node().

> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 84a77ffa3dc4b..965e960156876 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
[ ... ]
> @@ -977,21 +1014,39 @@ void software_node_unregister_node_group(const str=
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
> +	if (parent)
> +		swnode_put(parent);
> +
> +	if (IS_ERR(fwnode))
> +		return ERR_CAST(fwnode);
> +
> +	return to_swnode(fwnode);
> +}

[Severity: Medium]
As reported by Sashiko on v1 [1], what happens when a named static
software_node (where node->name is non-NULL) or a parent-child software_node
group is removed and re-registered before kobject_cleanup() runs?

When the last reference to an swnode is dropped via swnode_put() ->
kobject_put(), __kobject_del() (which removes the sysfs directory),
software_node_release() (which unlinks swnode->entry from parent->children),
and kobject_put(parent) only run inside kobject_cleanup(), which is delayed
on a workqueue when CONFIG_DEBUG_KOBJECT_RELEASE is enabled.

Because software_node_to_swnode_get() now skips the zero-ref swnode on
swnode_kset->list and returns NULL, device_add_software_node() and
software_node_register() proceed into software_node_register_node() ->
swnode_register() while the dying swnode is still present:

1. If node->name is non-NULL, swnode_register() calls:

	if (node->name)
		ret =3D kobject_init_and_add(&swnode->kobj, &software_node_type,
					   parent ? &parent->kobj : NULL,
					   "%s", node->name);

while the dying swnode's sysfs directory with the same name has not been
removed by __kobject_del() yet, causing kobject_init_and_add() to warn and
fail with -EEXIST.

2. If a parent-child node group is unregistered via
software_node_unregister_node_group(), the dying child kobject still holds
its reference on parent->kobj until the child's kobject_cleanup() runs.
During that window, software_node_to_swnode_get() on the parent node still
succeeds and software_node_register_node() returns -EEXIST when attempting =
to
re-register the parent.

3. If an unnamed child node (node->name is NULL and node->parent is non-NUL=
L)
is unregistered and re-registered under a live parent, swnode_register() ru=
ns:

	if (parent)
		list_add_tail(&swnode->entry, &parent->children);

while the dying child is still on parent->children waiting for
software_node_release() to run:

	if (swnode->parent) {
		ida_free(&swnode->parent->child_ids, swnode->id);
		list_del(&swnode->entry);
	}

Can this race on parent->children without synchronization or fail with
-EEXIST on deferred probe retry?

[1] https://lore.kernel.org/r/20261104-swnode-race-v1-v1-1-9406a67e25be@nxp=
.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-swnode-rac=
e-v1-v2-0-f8bc7b14d578@nxp.com?part=3D1
