Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D992D0C9D;
	Wed, 29 Jul 2026 01:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288908; cv=none; b=MD3x0v459npfyILuUnrK5j7slcXBfRmMM4S3p9k9qLaaF8yMZ8AkIryBxjQkv89tsbPca/QTchK6f+jmgRVm4OPvKhgFlMf6CF8R8fa7Zlw11+99tbB/GGqENbnZweRCICW9AOyxE12JOYYrPZeHQuNMXIOFNmAXLtz6z8P7ba8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288908; c=relaxed/simple;
	bh=Hc8DhQm88xcW8/eXJZ5URAcu8rZsWT3ISd8BVbdRILo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QfnnW7PZvBwKf6R6Si5qmNkjqD6NYmXqeFlKxSxZEEfjvgz9ky6mMMzeziJKnuhW5oZYuwlRJrTP4yqen9xsnSM0m0JVD1phaIHVklPq67uIHDAayyFG/T6TQ2gSWiXUQ8NzeTFL469W7H0SMJbasK7UeYG6DfbLCxKFExGuKTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrKrx2FZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrKrx2FZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584321F000E9;
	Wed, 29 Jul 2026 01:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785288906;
	bh=lZlCSTBZkQE/4Nnq1N0VKXhxEqBkevmtns5kcgvU7iE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UrKrx2FZYotrxAQh65Wq5ZDVUi+kWCC8f51edJjbG3nr8elc5WuavdIeZrmSjs0/v
	 5jlu0nZpAfl3b/SC9hhoCvNOldVojUDl9QNeYl/yQYRSno0E6GpKceXjaJe2zvO37H
	 ySUQaNnAgpSwN3yqb46geYPCV/P9mR9b2iUiY66Y8yDWvrL9PLGypBGg5bGi8XeTUd
	 hJaG/+OPmj6w5B4o/M0Ndc0bZNfpWxOwAO9Nj2Tc9gfvxLgTxWddYWEn5RSfaQUXgf
	 YKB1Z7NwExerpyAwy3hxLS3oF1lhYe3rzV2gOXFm5syVUby0OPiOMY3R1vanZExfvJ
	 Mx0JAlvDy4j8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: imx8ulp-evk: rename vdevbuffer to
 vdev0buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260729-rproc-dts-v1-4-368bca0b309f@nxp.com>
References: <20260729-rproc-dts-v1-0-368bca0b309f@nxp.com>
 <20260729-rproc-dts-v1-4-368bca0b309f@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 01:35:05 +0000
Message-Id: <20260729013506.584321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] An off-by-one error in address bounds checking incorrectly rejects=
 memory translations that exactly fit within a region.
- [Medium] DT ABI breakage and incomplete fix by renaming device tree nodes=
 instead of fixing the driver.
--

--- Patch [4]: [PATCH 4/7] arm64: dts: imx8ulp-evk: rename vdevbuffer to vd=
ev0buffer ---
commit 6ba801ee20ee0b1a91efe7b3138304a45163e3aa
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx8ulp-evk: rename vdevbuffer to vdev0buffer

The imx_rproc driver expects the virtio buffer node to be named
"vdev0buffer" to skip mapping the vdev buffer region. This patch
renames the node to match what the driver expects.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/b=
oot/dts/freescale/imx8ulp-evk.dts
> index 5dea66c1e7aa0..48a3e40053299 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> @@ -67,7 +67,7 @@ vdev1vring1: vdev1vring1@aff18000 {
>  			no-map;
>  		};
> =20
> -		vdevbuffer: vdevbuffer@a8400000 {
> +		vdev0buffer: vdev0buffer@a8400000 {

[Severity: Medium]
This is a pre-existing issue, but does renaming the node here break Device
Tree ABI compatibility?

Users running newer kernels with older DTBs will still experience the mappi=
ng
bug because the driver remains hardcoded to expect "vdev0buffer".
Additionally, there are other in-tree boards (such as
imx93-11x11-evk-common.dtsi) that still use "vdevbuffer".

Should the underlying driver bug in imx_rproc_prepare() be fixed instead
to support the legacy node name?

drivers/remoteproc/imx_rproc.c:imx_rproc_prepare() {
    ...
    if (strstarts(res.name, "vdev0buffer"))
    ...
}

>  			compatible =3D "shared-dma-pool";
>  			reg =3D <0 0xa8400000 0 0x100000>;
>  			no-map;

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but while looking at the
imx_rproc driver, is there an off-by-one error in the address bounds
checking?

In imx_rproc_da_to_sys() and imx_rproc_da_to_va(), a strictly-less-than
operator is used for the upper bound limit:

drivers/remoteproc/imx_rproc.c:imx_rproc_da_to_sys() {
    ...
    if (da >=3D att->da && da + len < att->da + att->size) {
    ...
}

If a firmware segment request perfectly fills the remainder of the region
(where da + len =3D=3D att->da + att->size), it appears this valid request
evaluates to false and the translation gets wrongly rejected.

Could this cause valid firmware segments to fail to load, and should this
check use <=3D instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-rproc-dts-=
v1-0-368bca0b309f@nxp.com?part=3D4
