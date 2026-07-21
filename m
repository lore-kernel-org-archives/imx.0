Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F6D37CD59;
	Tue, 21 Jul 2026 11:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632111; cv=none; b=gBDm3YmwBt2ilt7B6WhgGkV4U1AjOacJNtTt+YZ7vCxq/vecScrxd3Lo4I3u2UP0dx/CQeNVbK0rfKvW+ejXJLSDGb6+4N+1wtYrm0Yr/qv/JJl16s1qdNbaqPzMWIjWetAiA5N3iXnlQ84srV5pMluKxYTaIkGl+kvOEE5Yj5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632111; c=relaxed/simple;
	bh=l6D3CVQ2UVUE9gmIjiaws2QnDBlFriLqA3lu4+VOz6A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QjsKfq/Afg693GKWGHG6duXPz0HByNHDRiUbJECoczC0hrL/vYJU9+ke8G7YB6fYCS0vKRx+yHrMUHPeZeRgkvFCP7yLvlNSbQ44tN+NKTJk7k3bTigybjsBDi3mBAW83oXZYj17xixzVYdAKCue0EhDC6bruzxtvRXmOts6I/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5EcKV6H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5EcKV6H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E8A1F000E9;
	Tue, 21 Jul 2026 11:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784632109;
	bh=UAIHbPK4p2u1v9Zkk+6CeqNRey+SyiH6KV9nZ4NdmE4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V5EcKV6Hpjn6il69rrvQy5QBbAJYXYS6TapiIYNQ/kcM2jTGneucANQ4veO6h3YMI
	 mGdfmZss8VytH7+1q/ETEHHM9JoLUebytBxu/E5cZNC5KoATRNtDbIe+tWedgXBflu
	 itaPz+43MP6vp0GyqRIut1Zp/hCo6noKfUoOIZejGvgo4oAEIYPpCOaVWREtPmtTJV
	 8l0+iXQRjvpOdSv+dQ0HKaN9glItXBYg9E1y14GZKCZlB8V8luykTbFyn3ZNu6vwwJ
	 +7jTivJmWbHMCO40AhMn6hpvi7qeBtVyzUT71Dc9PRiXPlW0QLFIjcC5iCIoMnNQgt
	 Ig95Xca8hUxIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] device property: add test cases for
 fwnode_for_each_child_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260721105448.2109894-3-xu.yang_2@oss.nxp.com>
References: <20260721105448.2109894-1-xu.yang_2@oss.nxp.com>
 <20260721105448.2109894-3-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 11:08:28 +0000
Message-Id: <20260721110828.B2E8A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] KUnit assertions bypass manual cleanup of globally registered soft=
ware nodes, creating a Use-After-Free condition.
- [Medium] The fwnode_for_each_child_node() iterator leaks its reference co=
unt on early abort.
- [Medium] Mock device_node structures are initialized without the OF_DETAC=
HED flag, triggering kernel errors when refcounts drop to zero.

Pre-existing issues:
- [High] Test cases combining primary and secondary nodes trigger pre-exist=
ing infinite loop and double-put bugs in fwnode_get_next_child_node().
--

--- Patch [2]: [PATCH v6 2/2] device property: add test cases for fwnode_fo=
r_each_child_node() ---
commit 277f54edf9f4c448f3aa8bc3a07e347d304940c6
Author: Xu Yang <xu.yang_2@nxp.com>

device property: add test cases for fwnode_for_each_child_node()

This commit adds KUnit test cases for the fwnode_for_each_child_node() API.

> diff --git a/drivers/base/test/property-entry-test.c b/drivers/base/test/=
property-entry-test.c
> index a8657eb06f94e..855e73b9b21f2 100644
> --- a/drivers/base/test/property-entry-test.c
> +++ b/drivers/base/test/property-entry-test.c

[ ... ]

> @@ -489,6 +491,139 @@ static void pe_test_reference(struct kunit *test)
>  	software_node_unregister_node_group(group);
>  }
> =20
> +static struct fwnode_handle *create_device_node(struct kunit *test,
> +						const char *name,
> +						const char *full_name,
> +						struct device_node *parent)
> +{
> +	struct device_node *node;
> +
> +	node =3D kunit_kzalloc(test, sizeof(*node), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, node);
> +
> +	node->name =3D kunit_kstrdup(test, name, GFP_KERNEL);
> +	node->full_name =3D kunit_kstrdup(test, full_name, GFP_KERNEL);
> +
> +	if (parent) {
> +		node->sibling =3D parent->child;
> +		/* set the node as the first child of the parent */
> +		parent->child =3D node;
> +		node->parent =3D parent;
> +	}
> +
> +	of_node_init(node);
> +	return of_fwnode_handle(node);
> +}

[Severity: Medium]
Will this mock node initialization trigger kernel errors when the node's
refcount reaches zero?

Because the OF_DETACHED flag is not set on the device_node, of_node_release=
()
will assume the node was improperly detached and will emit a pr_err() and a
stack dump when releasing the structure.

Should we set the OF_DETACHED flag before initializing the node here?

> +
> +/* Verifies that fwnode_for_each_child_node() can output correct childre=
n */
> +static void pe_test_child_iteration(struct kunit *test)
> +{

[ ... ]

> +	/* 3. Test OF (primary) + SW (secondary) node child iteration */
> +
> +	of_node->secondary =3D sw_node;
> +	sw_node->secondary =3D ERR_PTR(-ENODEV);
> +
> +	i =3D 0;
> +	num =3D ARRAY_SIZE(of_sw_child_array);
> +	fwnode_for_each_child_node(of_node, child) {

[Severity: High]
This is a pre-existing issue, but will this test case trigger an infinite
loop and double-put bug in the core framework?

When the primary OF iterator finishes and drops its last child reference,
fwnode_get_next_child_node() in drivers/base/property.c passes that=20
already-put child to the secondary software node iterator, causing a=20
double-put of the kobject reference.=20

Then, when the SW iterator returns its first child, the next iteration pass=
es
it back to the primary OF iterator. Since the OF iterator does not recognize
SW nodes, it treats the child as NULL and restarts from the first OF child,
causing an infinite loop.=20

This test case currently fails at the KUNIT_ASSERT_LT below due to the
infinite loop, which aborts the run.

> +		KUNIT_ASSERT_LT(test, i, num);

[Severity: Medium]
Does this assertion leak the child fwnode reference count if it fails?

The fwnode_for_each_child_node() iterator holds a reference count on the
active child node. If KUNIT_ASSERT_LT() fails and forces an early return,
the reference count isn't released via fwnode_handle_put().

> +		KUNIT_EXPECT_STREQ(test, of_sw_child_array[i++], fwnode_get_name(child=
));
> +	}
> +	KUNIT_EXPECT_PTR_EQ(test, child, NULL);
> +

[ ... ]

> +	of_node->secondary =3D NULL;
> +	sw_node->secondary =3D NULL;
> +	software_node_unregister_node_group(group);
> +}

[Severity: High]
If any KUNIT_ASSERT_* fails earlier in this function, doesn't it bypass
this manual cleanup?

A forced early return bypasses software_node_unregister_node_group(),
leaving the software nodes permanently registered in the global sysfs kset.

Since KUnit automatically frees the mock of_node instances allocated with
kunit_kzalloc() upon test exit, wouldn't the globally persisted software
nodes be left with dangling .secondary pointers referencing freed memory,
creating a use-after-free condition?

Could we use kunit_add_action() when registering the group to ensure the
software nodes are unregistered even if an assertion fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721105448.2109=
894-1-xu.yang_2@oss.nxp.com?part=3D2
