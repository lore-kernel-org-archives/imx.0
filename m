Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7237A3EFFC8;
	Mon, 20 Jul 2026 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784545361; cv=none; b=JgaJ0nGxE0OSlmL4WHXCte2HASlEM0mpHJAX2+WW0K14LOeKbvryXYKk2EktdFAIXxH9RKtPMudwCJl728m+8e8yyvRajrmSt4eZf9/BAB3GQsRqnlJQn8iSTNv8mD3hQoB0/eI3KNMD3N1lPd2yO9EZXxpEH899Ixrk6RyNzDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784545361; c=relaxed/simple;
	bh=xCN1mk1FMy4KfCd0OITCSdYAljjG4eZ/dbWYz1AjSGg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DGRYjTju2BWphwfb2A4Dstk4ZLCcmvtNUxiIfCKrcLSz4Jfxn45yHs5sqafhx4Xweb70jtV2rDGtUWyesG9o+c+Y6zcxWDqoORxUTacEZQMTo0Wr8zSrLnY0rP+WXcylNS50+AjDcEFRJkOW7HHju4wdunobEJAkXsotQ85iHzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWR2Ih8Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWR2Ih8Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080CF1F000E9;
	Mon, 20 Jul 2026 11:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784545360;
	bh=8eOs/ngiXJv2wHNupc+79ZWEgSRrZ9y/U9NPug89TSk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mWR2Ih8ZJV5N8vRyAdkWjgUfufR7D90Xy/75Su/DmtldoS0u/XVjJ3TcfY99MkJ+c
	 d7uu6tv+jO24bFaSSpqtjP/6DzOypqoeuZbmG4nlluIzp1JHjhpIC4bIMne/CaM09E
	 3UFHK9OKjIzJXTrW0HukMYI8U3UVI2wz2bj65aMZ25Bba4MhjxY4Jexnrji0mNiLrY
	 hmT8PNhn+EzprFeN8sZ7hccywK+1whDo6ndPs3gsL1s3tTyKQy54ZjJcKKbRV37DMH
	 yexvYk5rjKTjXPW2hVFwtX1wiEyoR7X24seNGk8/A7x8UWMA/HkCS9BzZiFca/eieW
	 WD0Xqpy4bSK5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] device property: add test cases for
 fwnode_for_each_child_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720104730.1285552-2-xu.yang_2@oss.nxp.com>
References: <20260720104730.1285552-1-xu.yang_2@oss.nxp.com>
 <20260720104730.1285552-2-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 11:02:39 +0000
Message-Id: <20260720110240.080CF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The KUnit test fails to use `kunit_add_action()` for global stat=
e cleanup, permanently leaking software nodes on test aborts.

Pre-existing issues:
- [High] The newly added tests expose pre-existing infinite loop and double=
-put bugs in `fwnode_get_next_child_node()` when transitioning between prim=
ary OF nodes and secondary SW nodes.
--

--- Patch [2]: [PATCH v5 2/2] device property: add test cases for fwnode_fo=
r_each_child_node() ---
commit 6f128f7ffab2a2787ad6820b967d94a17fcbcbc2
Author: Xu Yang <xu.yang_2@nxp.com>
device property: add test cases for fwnode_for_each_child_node()

Add test cases for fwnode_for_each_child_node() API.

> diff --git a/drivers/base/test/property-entry-test.c b/drivers/base/test/=
property-entry-test.c
> index a8657eb06f94e..a3d1caf28cc7d 100644
> --- a/drivers/base/test/property-entry-test.c
> +++ b/drivers/base/test/property-entry-test.c
[ ... ]
> @@ -489,6 +491,139 @@ static void pe_test_reference(struct kunit *test)
[ ... ]
> +	/* 2. Test SW node child iteration */
> +
> +	error =3D software_node_register_node_group(group);
> +	KUNIT_ASSERT_EQ(test, error, 0);
> +
> +	sw_node =3D software_node_fwnode(&node);
> +
> +	i =3D 0;
> +	num =3D ARRAY_SIZE(sw_child_array);
> +	fwnode_for_each_child_node(sw_node, child) {
> +		KUNIT_ASSERT_LT(test, i, num);

[Severity: Medium]
If KUNIT_ASSERT_LT() fails, it will immediately abort the test execution.
Does this bypass the manual software_node_unregister_node_group() call at
the end of the function?

To prevent leaking the software nodes and causing sysfs conflicts on
subsequent test runs, should kunit_add_action() be used to register the
cleanup immediately after registration?

> +		KUNIT_EXPECT_STREQ(test, sw_child_array[i++], fwnode_get_name(child));
> +	}
> +	KUNIT_EXPECT_PTR_EQ(test, child, NULL);
> +
> +	/* 3. Test OF (primary) + SW (secondary) node child iteration */
> +
> +	of_node->secondary =3D sw_node;
> +	sw_node->secondary =3D ERR_PTR(-ENODEV);
> +
> +	i =3D 0;
> +	num =3D ARRAY_SIZE(of_sw_child_array);
> +	fwnode_for_each_child_node(of_node, child) {
> +		KUNIT_ASSERT_LT(test, i, num);

[Severity: High]
This isn't a bug introduced by this patch, but these new tests appear to
expose a pre-existing infinite loop and double-put bug in the core fwnode
iterator.

When fwnode_for_each_child_node() transitions from primary OF children to
secondary SW children, of_fwnode_get_next_child_node() drops the reference
on the last OF child and returns NULL. The core iterator then passes this
same child pointer to the secondary node's iterator:

drivers/base/property.c:fwnode_get_next_child_node() {
    ...
    next =3D fwnode_call_ptr_op(fwnode, get_next_child_node, child);
    if (next)
        return next;
    return fwnode_call_ptr_op(fwnode->secondary, get_next_child_node, child=
);
}

Does this cause the secondary iterator (software_node_get_next_child) to
unconditionally drop the reference a second time?

Furthermore, when iterating over the secondary children, the returned SW no=
de
is eventually passed back to the primary iterator. Since to_of_node()
evaluates to NULL for SW nodes, of_get_next_available_child() restarts from
the first OF child:

drivers/of/property.c:of_fwnode_get_next_child_node() {
    ...
    return of_fwnode_handle(of_get_next_available_child(to_of_node(fwnode),
                                                        to_of_node(child)));
}

Will this restart cause an infinite loop in the test runner when testing
mixed primary and secondary firmware nodes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720104730.1285=
552-1-xu.yang_2@oss.nxp.com?part=3D2
