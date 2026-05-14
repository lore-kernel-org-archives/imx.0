Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEB732BF41
	for <imx@lists.linux.dev>; Thu, 14 May 2026 21:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778792420; cv=none; b=Qcbku1shf0eLcT8jluOiOGEbzvxG0DWJ4sQkBhXKgEG9Jg5p0XUWb25P/gVUvp0L6ZWFAK1e++X4RXq0qPIChE3Q95e/XL5gwWkMEhgzZPtrFP4Hbham/9GijyFtIwMvD1CMgntDyDsxY0PkEnNMkV64s5mTeJUNNINfREbjRSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778792420; c=relaxed/simple;
	bh=ATVlQX1TLJ59UJm6AtOUOqUW0tQ97xL1aOm+MPo6gAg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EPnn6cvjUINufVYjQuQ4HRZHKMYmoSB3HbkNbgJB0cAlpswG/tf9/I8RPnWrLjrGvsqkgOPDu4bVMC8OXjg7y3EC6eBscKlIq/st138vrP89gfv3W+X7rTYUB6QUuTnnDQDgUHM+boN8WFyvdLSYgdqS8cOlf01qbXMf+HfhqA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGTMiWk0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YGTMiWk0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE14DC2BCB3;
	Thu, 14 May 2026 21:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778792420;
	bh=ATVlQX1TLJ59UJm6AtOUOqUW0tQ97xL1aOm+MPo6gAg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YGTMiWk0ECXzFcAxuiAxnoJTqyAdiVUSUHW0sOf7tlye/UdIdP9kiyuyzqQ9he5Yh
	 6EGesYxXV0+VXyhOV2AvcuwHQz7LvjsSZ8cx7SC1UFMfdM9e2XIojywW8ph5ITHNH6
	 1VuNW5TzspyX1b9s/VibjpNnBbSwhRFr6P0UIz6jxKlgPl1e2hoEm3klDCclq1XO2+
	 r8iT0tHLU//zZKngRW19j3e4MPSey4at9vhliHHGvtuAuBUYhJoficQxEToYvBIJj1
	 Nhtb6yFAwReoXWOIsmuM/+Ec/jIDNTJ4n7a5+eHgHLlq0+WKNZpPw7suWow39AXRFH
	 HuuQOVhyMtu3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] remoteproc: switch exact-match drivers to
 wc-ioremap callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, wsa+renesas@sang-engineering.com
In-Reply-To: <20260514162129.1504162-3-ben.levinsky@amd.com>
References: <20260514162129.1504162-3-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 21:00:19 +0000
Message-Id: <20260514210019.EE14DC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Format string vulnerability when initializing rproc_mem_entry usin=
g device tree node names
--

commit 1e23984cace57551a1444d0f4d0c49192a7ec852
Author: Ben Levinsky <ben.levinsky@amd.com>

remoteproc: switch exact-match drivers to wc-ioremap callbacks

This patch replaces the exact-match carveout map and unmap callbacks in
existing remoteproc drivers with the common wc-ioremap helpers.

> diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rp=
roc.c
> index 3c25625f966dc..e3121fadd2925 100644
> --- a/drivers/remoteproc/rcar_rproc.c
> +++ b/drivers/remoteproc/rcar_rproc.c
[ ... ]
> @@ -73,8 +44,8 @@ static int rcar_rproc_prepare(struct rproc *rproc)
>  		mem =3D rproc_mem_entry_init(dev, NULL,
>  					   res.start,
>  					   resource_size(&res), da,
> -					   rcar_rproc_mem_alloc,
> -					   rcar_rproc_mem_release,
> +					   rproc_mem_entry_ioremap_wc,
> +					   rproc_mem_entry_iounmap,
>  					   res.name);

This isn't a regression introduced by this patch, but since these lines are
being modified, could this cause a format string issue?

Looking at rproc_mem_entry_init(), it takes a format string as the name
parameter and passes it to vsnprintf(). If a dynamically loaded device
tree overlay has a node name in res.name containing format specifiers,
could it lead to arbitrary stack reads?

Would it be safer to use "%s", res.name here?

[ ... ]
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc=
/xlnx_r5_remoteproc.c
> index 45a62cb980725..e5d1903c9636a 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
[ ... ]
> @@ -560,8 +521,8 @@ static int add_sram_carveouts(struct rproc *rproc)
>  		rproc_mem =3D rproc_mem_entry_init(&rproc->dev, NULL,
>  						 dma_addr,
>  						 len, da,
> -						 zynqmp_r5_mem_region_map,
> -						 zynqmp_r5_mem_region_unmap,
> +						 rproc_mem_entry_ioremap_wc,
> +						 rproc_mem_entry_iounmap,
>  						 sram->sram_res.name);

Similarly here, can passing sram->sram_res.name directly to
rproc_mem_entry_init() trigger a format string vulnerability if the node
name contains format specifiers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514162129.1504=
162-1-ben.levinsky@amd.com?part=3D2
