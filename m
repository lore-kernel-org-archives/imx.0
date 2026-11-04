Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808871;
	b=U+Fh5kM6XMFR/3OlGSQV2eLflYI93QwaPVdSEZbttFAFzP3BIq0AmfQqs/QDc6gZMDZa
	 h+1Raytd5xl2H745LyN9/C/632Rt/p+noBBqzGBtf89VI1mTVAz8O1gk0/V8AS5UJLArj
	 guItyO4AVkBM6vd5Dw9aJ2gMSeESbaARDkrvvr832F9FlPdFDB52yrT+Ngr5eI0Y1u/YR
	 BYwdAfimy4rXgp8w8MDQOmVl68NUdsSF/DYkLpnHOezR8skpzoWatZJQYvk6RHM9zcUvr
	 2XzTCrF8hRmNLcaJGbTAI8GHoam4X/TtmfmBdj0pBkiygoxFXwVT/gq2DeEj7muU5CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808871;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DYfvP5I6LaWeZJLSvfTEgGDFzH1eXhtcJdGRnG3Bocs=;
	b=nOvmXbDQMGWTgi+rBREW2d+myfrBGGs3q3MiCJYJ6Mntep9kpalVU9jzPqEsHm+bHHBy
	 po6PXFRa1TwTpPCOqsJbBD7wnAdDGGCQERFzRtutO7eKfJWSsJRbwvH7hvLgh67WRraRC
	 of5M2ca2wSD1+FqINqNpi7Jz/TxO1hOUVy5Y5oQO+Abrg59BIftiP9YaAuFUFSSOMi4pc
	 bN4NeVSsxXrBGDWwcs5Iqw+qxLkIx5fDClRmXVFc/x9DpFH7k9LObcTpQ0selCsv6nKOv
	 YjE5C2VTx3JzYR9V1bjVMn3M58kOgMjyqX8i7yfW5PD2o7IhMDy9KaqZeHGLkj6HKKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gGqxzxLq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9890E606D804
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 16:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gGqxzxLq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A291F000C1;
	Wed,  4 Nov 2026 16:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793808871;
	bh=DYfvP5I6LaWeZJLSvfTEgGDFzH1eXhtcJdGRnG3Bocs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gGqxzxLqucS4xhm1UFjqv7dKvM26NW9VD41UNlHAeO/aTVp2SxzHkKflbXSwjhD8h
	 FaSLcWhCZuv7fXzp6X3h06EadkJCfSppdV4gYhMY9tQxE181bpTmYr1Ze39GJHLKwL
	 5pb01pV83LcWSszcuawX6P2JsMsfVQWYTTlwo8VuaXLY9ggWPQLfPBVUb60MzoL6J8
	 536PJi4QJpX5Bp3Tjy3ir3iLShWhnWW4OO4Rfyez4B8/CCzhEq6JUhsrU0xN1vzSCf
	 2Yrvaza9LR/ao8g+XBBhlIIIkKId0CEMJAfhAQQ02psQODi2h65mQh+G8hDi3ufecd
	 z5ajReMVj4eQA==
Message-ID: <sashiko-outbox-197590@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] software node: handle missing remote endpoint node
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261104-swnode-race-v1-v1-3-9406a67e25be@nxp.com>
References: <20261104-swnode-race-v1-v1-0-9406a67e25be@nxp.com>
 <20261104-swnode-race-v1-v1-3-9406a67e25be@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 16:14:30 +0000
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
- [High] software node: refcount race in software_node_graph_get_remote_end=
point()
--

commit 248da443d964ed22789819ccc10771552e53780f
Author: Peng Fan <peng.fan@nxp.com>

software node: handle missing remote endpoint node

This commit updates software_node_graph_get_remote_endpoint() to check the
return value of software_node_fwnode() for NULL before passing it to
software_node_get().

> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 9095d50ba146f..4d95a59a27f0a 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -676,6 +676,7 @@ software_node_graph_get_remote_endpoint(const struct =
fwnode_handle *fwnode)
>  {
>  	struct swnode *swnode =3D to_swnode(fwnode);
>  	const struct software_node_ref_args *ref;
> +	struct fwnode_handle *refnode;
>  	const struct property_entry *prop;
> =20
>  	if (!swnode)
> @@ -690,7 +691,11 @@ software_node_graph_get_remote_endpoint(const struct=
 fwnode_handle *fwnode)
>  	if (!ref->swnode)
>  		return NULL;
> =20
> -	return software_node_get(software_node_fwnode(ref->swnode));
> +	refnode =3D software_node_fwnode(ref->swnode);
> +	if (!refnode)
> +		return NULL;
> +
> +	return software_node_get(refnode);

[Severity: High]
Can this race with a concurrent unregistration of ref->swnode and cause a
use-after-free or refcount addition on zero?

software_node_fwnode() calls software_node_to_swnode(), which acquires a
reference via software_node_to_swnode_get() and immediately drops it:

drivers/base/swnode.c:software_node_to_swnode() {
	struct swnode *swnode =3D software_node_to_swnode_get(node);

	if (swnode)
		swnode_put(swnode);

	return swnode;
}

Because the caller of software_node_graph_get_remote_endpoint() only holds
a reference to the local endpoint fwnode and not to ref->swnode, if
ref->swnode is concurrently unregistered after kobject_get_unless_zero()
succeeds in software_node_to_swnode_get(), either swnode_put() inside
software_node_to_swnode() or the concurrent unregistration can drop the
last reference before software_node_get(refnode) runs.

software_node_get(refnode) will then call kobject_get() on a dying or
freed swnode.

Should software_node_graph_get_remote_endpoint() call
software_node_to_swnode_get(ref->swnode) directly and return
&remote->fwnode (or NULL) so that the reference acquired under
swnode_kset->list_lock via kobject_get_unless_zero() is retained?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-swnode-rac=
e-v1-v1-0-9406a67e25be@nxp.com?part=3D3
