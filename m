Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6784E7818
	for <imx@lists.linux.dev>; Mon, 28 Sep 2026 16:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613078; cv=none; b=R5+mEQK9SzANsuHT0Luu+frnYNf7OrNgfEL9Ua09oVKgarbkF6mxCtw7+O6qgdPr6wSUXbRsO1/wpTAB/VLNqiulcNyoKMuS5So3c/8QSq2KYUz7T4Dulr+g1dE06C2xj7hOM6Hvy3jpdRmcAH4V8QZhPjXjpa55XMPoVDT+G6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613078; c=relaxed/simple;
	bh=RoQlicLmDVIUozXCfpy1Xez29Xks1UpNRkgze7bF/l4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X9mN0Qu4QqdzSKyj8/rsVSenG9x3EN6KE1NjXonpJNd4ecpHS7aG/TX9WOwAZmKJInULo7mXN63gcevQSUkCssQy+K7HtCG1WFFeE4km5Is+YMFXptoyWWtIdpfULTyGLyWn/fAC0lQOjTvU4ZKtsqoOSWGCaBbC6JXmR4gVe30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiK5wGki; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiK5wGki"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903871F00893;
	Mon, 28 Sep 2026 16:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790613076;
	bh=MvnqG76g7mMx6T13To0aLLamcHlUgL5UjoR/3//u60k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JiK5wGkiCHd+AuQAMVbbB0bjav6CziarrTFptx2R/ujAOJmRPcF7z/Uuqg/kO6kQH
	 OjgQGWLMoeUwxcn8CHtwLX8bAO3qOeLpNf3XZwC8PLOHz8VxO2qJW/yHfYyDsON7xD
	 n2/DTmLQhcBxd9GJLOtveLJ+Vfng0PZsMi+XqkesBaq1UzpamplncJm5k6Xb2bwS21
	 NpSwGhP9OJQ0uFTPKV1nK4iV6syKmMbqV8htp2VvZGv8qliqmfebJVZ6e5IJBbWhD1
	 /8ImzKJeRCbdQbpAE/2GHciI1aFtdz+IN9HCQEG7cGPU8VbLKz5gyiQM9HXy6gVen3
	 hAePqNz2evoAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/bridge: add missing drm/drm_panel.h inclusions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260928161605.2271412-1-arnd@kernel.org>
References: <20260928161605.2271412-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 16:31:16 +0000
Message-Id: <20260928163116.903871F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/bridge: commit message and tree context mismatch
--

commit ac5ab6aba140c1bdb755618fe3998cc33d9cf30b
Author: Arnd Bergmann <arnd@arndb.de>

drm/bridge: add missing drm/drm_panel.h inclusions

This commit adds <drm/drm_panel.h> includes to various drm/bridge drivers.
The commit message states this is to fix implicit declaration build failures
after devm_drm_of_get_bridge() was moved to drm_panel.h.

>     The devm_drm_of_get_bridge() declaration moved to drm_panel.h, but
>     not all callers include this, which leads to build failures in
>     some configurations:
>    =20
>     drivers/gpu/drm/imx/lcdc/imx-lcdc.c: In function 'imx_lcdc_probe':
>     drivers/gpu/drm/imx/lcdc/imx-lcdc.c:404:18: error: implicit declarati=
on of function 'devm_drm_of_get_bridge' [-Wimplicit-function-declaration]
>       404 |         bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, =
0, 0);
>           |                  ^~~~~~~~~~~~~~~~~~~~~~
>     drivers/gpu/drm/verisilicon/vs_bridge.c: In function 'vs_bridge_init':
>     drivers/gpu/drm/verisilicon/vs_bridge.c:306:16: error: implicit decla=
ration of function 'devm_drm_of_get_bridge' [-Wimplicit-function-declaratio=
n]
>       306 |         next =3D devm_drm_of_get_bridge(drm_dev->dev, drm_dev=
->dev->of_node,
>           |                ^~~~~~~~~~~~~~~~~~~~~~
>    =20
>     Include the new header in all files that need it.
>    =20
>     Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to drm_panel.c=
")

[Severity: Medium]
Is the premise of this commit accurate for the current tree?

Looking at include/drm/drm_bridge.h, devm_drm_of_get_bridge() is still
declared there:

include/drm/drm_bridge.h:
	struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct devic=
e_node *node,
						  u32 port, u32 endpoint);

Because the prerequisite commit aa8a8c7e4641 appears to be missing in this
tree, the declaration remains in drm_bridge.h and the mentioned build
failure does not exist here.

Does this patch depend on another series, or is it premature for this
particular branch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928161605.2271=
412-1-arnd@kernel.org?part=3D1
