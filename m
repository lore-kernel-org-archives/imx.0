Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809344;
	b=ZmoEFq5323+RuKQ47352n9VYCX0hhQHWGpjVnN+S4r63yu+a2wC/j49awG23ccIwifOi
	 9gA7RvFZ842jpSy/y13GFAbbpuohXzDmS7bNfTCLmfmib1mMsxaFqB64O4flQlaKJj6wN
	 CfZ+nv3PI3Ucnb3x6MtWlVF+xs713BuWuiKLUly2XtKg9uruKBWvZWB/+J72N+RBkjlAv
	 VVGlJO8xUCH9UTpvRtmwMCykcGL5aK4dEBP2taQiDXtKF0Jjk+tF9K4d61mXfk+dIVnz6
	 ItypIS5j89KXOYIOa/NyRbDCHBxMRL+U9pVr6ESCzfngpWDloS/0WEVLSzUEDZ7+38w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809344;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZrujsrUixHhrfRdSd6ooDFhT1oU69rbCIYLhaBazN2U=;
	b=D8qFgWESH2AuVBO4jlTTKeQo70vIHUhUHA6QqREgp63KcAX3hS89VVwioQxItTpBid/d
	 7SxLOMIiB9l43k903SYH0bzsyfPSgnXuTqdY675b+0gnAMPRrakKogmUmMdgCtQxDnngx
	 PytZgWM9iA3Aj2MJXr3XZCY4jZ4y8klTnqmIBgWUtP9vd2YDzh7HVHcUwRfj3bvJioVXw
	 rMpyHT3QQLGN1DRixW2AzHnyq3/4JrcsK6muGrJ8UHFZ8fcJ6fPc7Kae1pz5dMiHxlA/X
	 vaSwQ6+afkjB8XFR2lRyYDl38aahr6K1x17x3sorWN3wiXQ8uQhDIwSAayMgWpRMbhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nKQAuDNG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D294D606A32C
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 16:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nKQAuDNG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF751F00919;
	Wed,  4 Nov 2026 16:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793809343;
	bh=ZrujsrUixHhrfRdSd6ooDFhT1oU69rbCIYLhaBazN2U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nKQAuDNG8EsPgrgYZ9CzwkTjfy47M+ZR4+O6pDYa/m9Uz/N7AJeo6V9WnWavlVxh7
	 NnfshPZBf+f1FTDFYoxTyPhYhQK3QT/6WWsIxwA6/HlB1RSIO0pvOXpoyY/ItWl0cu
	 GOfXWAjoHoNHjyoZwnQtOZXwMYEqDgKRuqby3bSEb+x/dPRxCEMV087y78WH+wex/m
	 nmUcSH3YJAfc0jHeEw/dFHVxWRuyJ9e/DaVvVg2nUGoHcM8dUQy12l3vnDtULIfHES
	 uvpvbZUi6gfNWft1DgxwlIPHsVojDsLCh07iCJUyIWpRifc1EWKNaw/R+A3Ua+NK8z
	 4+3TqhKCJFRYQ==
Message-ID: <sashiko-outbox-197598@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] software node: skip dying children during traversal
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261104-swnode-race-v1-v1-4-9406a67e25be@nxp.com>
References: <20261104-swnode-race-v1-v1-0-9406a67e25be@nxp.com>
 <20261104-swnode-race-v1-v1-4-9406a67e25be@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 16:22:22 +0000
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
- [High] software node: unsynchronized child list traversal races with rele=
ase
--

commit 9feb88166afe18788cf51497c2968b7148e1d347
Author: Peng Fan <peng.fan@nxp.com>

software node: skip dying children during traversal

This commit updates software_node_get_next_child() and
software_node_get_named_child_node() to use kobject_get_unless_zero() so
that child swnodes whose kobject refcount has reached zero are skipped
during child list traversal.

> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 4d95a59a27f0a..1354447069e10 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -515,7 +515,18 @@ software_node_get_next_child(const struct fwnode_han=
dle *fwnode,
>  		c =3D list_first_entry(&p->children, struct swnode, entry);
> =20
>  	fwnode_handle_put(child);
> -	return fwnode_handle_get(&c->fwnode);
> +
> +	for (;;) {
> +		if (kobject_get_unless_zero(&c->kobj))
> +			return &c->fwnode;
> +
> +		if (list_is_last(&c->entry, &p->children))
> +			break;
> +
> +		c =3D list_next_entry(c, entry);
> +	}
> +
> +	return NULL;
>  }
> =20
>  static struct fwnode_handle *
> @@ -529,10 +540,9 @@ software_node_get_named_child_node(const struct fwno=
de_handle *fwnode,
>  		return NULL;
> =20
>  	list_for_each_entry(child, &swnode->children, entry) {
> -		if (!strcmp(childname, kobject_name(&child->kobj))) {
> -			swnode_get(child);
> +		if (!strcmp(childname, kobject_name(&child->kobj)) &&
> +		    kobject_get_unless_zero(&child->kobj))
>  			return &child->fwnode;

[Severity: High]
Can walking the parent's children list and skipping zero-refcount nodes here
race with software_node_release() and trigger a use-after-free?

Unlike swnode_kset->list, which is protected by swnode_kset->list_lock in
software_node_to_swnode_get() and software_node_find_by_name() and unlinked
under that same lock in kobj_kset_leave() before software_node_release()
runs, parent->children has no lock serializing list_add_tail() in
swnode_register(), list_del() and kfree() in software_node_release(), or the
traversal in software_node_get_next_child() and
software_node_get_named_child_node():

drivers/base/swnode.c:software_node_release() {
	struct swnode *swnode =3D kobj_to_swnode(kobj);

	if (swnode->parent) {
		ida_free(&swnode->parent->child_ids, swnode->id);
		list_del(&swnode->entry);
	} else {
		ida_free(&swnode_root_ids, swnode->id);
	}
	...
	kfree(swnode);
}

In software_node_get_next_child(), when kobject_get_unless_zero(&c->kobj)
returns NULL because c's refcount has already dropped to zero, nothing pins
c in memory or on p->children. A concurrent software_node_release() can run
list_del(&c->entry) (poisoning c->entry.next with LIST_POISON1) and kfree(c)
before the loop checks list_is_last(&c->entry, &p->children) and advances
via list_next_entry(c, entry), or even right after list_first_entry() or
list_next_entry() loads c.

Similarly, in software_node_get_named_child_node(), list_for_each_entry()
walks swnode->children without any lock and dereferences
kobject_name(&child->kobj) before calling kobject_get_unless_zero(), while
software_node_release() may be concurrently unlinking and freeing child.

Does traversal and modification of the parent's children list (and child_ids
in software_node_release()) need a lock to synchronize against concurrent
child release?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-swnode-rac=
e-v1-v1-0-9406a67e25be@nxp.com?part=3D4
