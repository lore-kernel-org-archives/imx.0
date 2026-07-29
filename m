Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CC5280331;
	Wed, 29 Jul 2026 01:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785289021; cv=none; b=m3pMZqSwwCw35gWaH1tFOdT8d8NGezl7FVYAW2TszGHNJW5HHjpnqoNyjPcQc33lAqZiiFnIaQq7D9rJRKl35AilBYry7QsShVnTTrqPJ3bPP5vrzn6iVZWu/egbPQSNNcz6s/iiJ+hneoMqFACffHdZEZGnoRHqpDI/N9h/cJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785289021; c=relaxed/simple;
	bh=BCAR6OvOdWgZzxqtf41SNV5DZkqVDA8m6Bt3LPRXVfs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PIb9z0FaUWkO4XyCl5rt61z4zUPzP83si7SO7UOl8IGXKvXTfXlvgv/0J6watncFsNbhsLKJA7hHe1hwlGa2qPcOubp8srromkKOeXN1RSY0Kmmj45dsVo+HQ0Jrz2bTMHpBfcf5fsa743Zs3xpAMYK8IzRqfNXyndwATsgleTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFkM9AFQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFkM9AFQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080EC1F000E9;
	Wed, 29 Jul 2026 01:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785289019;
	bh=1aCZPjSzxbtGy8NEbEjQEnXdlEkAsjIKlbRvmczrGqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AFkM9AFQzKTz8NKwW6tCjyWvoEztzITzcODALyV3tiKij7WgDdM37v8y3QxbouHss
	 Cba2djaQ69Jc9ogfxg7WzmEpEIm7wbVg+YreP09sJfnanDQfI8XmaCGPSSbUDObQiu
	 pFvfCm8ZeTBQE/lA8imD2mjSbS+xgtp6Rq3U5or8b9pXfmTl5wmyIY6pNzwI2vAH7j
	 VXFWVns8Pm7rQ1tfZf5K09tG7QEuAbaypfN4wM4EudwMMWC8rhQmIUOt/SFd2JEqXY
	 WhQRXa8T/0rRSOs106ycMIfqFA4UQLfwQaKQW8IAEBtffzmSfWbBvKYb6tuEfbj8YV
	 bOUWW228KwbWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: imx8dxl-evk: rename vdevbuffer to
 vdev0buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260729-rproc-dts-v1-1-368bca0b309f@nxp.com>
References: <20260729-rproc-dts-v1-0-368bca0b309f@nxp.com>
 <20260729-rproc-dts-v1-1-368bca0b309f@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 01:36:58 +0000
Message-Id: <20260729013659.080EC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix leaves vring and rsc_table nodes with generic names=
, wasting memory and breaking attach mode.
- [High] Incomplete fix across the subsystem: numerous other i.MX device tr=
ees retain the broken vdevbuffer node name.
--

--- Patch [1]: [PATCH 1/7] arm64: dts: imx8dxl-evk: rename vdevbuffer to vd=
ev0buffer ---
commit e44444bca004c2c221c3822282c9e7af15531374
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx8dxl-evk: rename vdevbuffer to vdev0buffer

This commit renames the "vdevbuffer" node to "vdev0buffer" in the
imx8dxl-evk device tree. This ensures the imx_rproc driver correctly skips
mapping the vdev buffer region, avoiding an unnecessary duplicate mapping.

> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/b=
oot/dts/freescale/imx8dxl-evk.dts
> index 0ede0c7ed422c..6f79aaef2dbb7 100644
> --- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts

[ ... ]

> @@ -90,7 +90,7 @@ rsc_table: memory-rsc-table@900ff000 {
>  			no-map;
>  		};
> =20

[Severity: High]
This is a pre-existing issue, but does this fix leave the rsc_table and
vring nodes with generic names that will also fail the driver's checks?

Looking at drivers/remoteproc/imx_rproc.c:imx_rproc_addr_init(), it expects
a specific node name prefix:

	if (strstarts(res.name, "rsc-table"))
		priv->rsc_table =3D priv->mem[b].cpu_addr;

Because the node is named "memory-rsc-table", this check fails, leaving
priv->rsc_table NULL and breaking imx_rproc_get_loaded_rsc_table().

Similarly, if the vring nodes are named "memory0" and "memory" instead of
"vdev0vring0" and "vdev0vring1", they are registered with those generic
names by imx_rproc_prepare(). The remoteproc core's rproc_alloc_vring()
then searches for "vdev0vring0", fails to find the carveout, and falls
back to dynamic allocation, wasting the reserved memory regions.

> -		vdevbuffer: memory-vdevbuffer@90400000 {
> +		vdev0buffer: vdev0buffer@90400000 {

[Severity: High]
This isn't a bug introduced by this patch, but are there other i.MX device
trees that still retain the broken vdevbuffer node name?

For instance, arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi still has:

		vdevbuffer: memory-vdevbuffer@90400000 {

Since drivers/remoteproc/imx_rproc.c:imx_rproc_prepare() uses string matchi=
ng
to skip mapping the vdev buffer regions:

	if (strstarts(res.name, "vdev0buffer"))
		continue;

These other boards will still fail the check, causing redundant carveout
registration and wasted memory.

Should all affected boards (such as imx8qm-mek.dts and
imx93-11x11-evk-common.dtsi) be updated to use the expected names, or
could the driver be updated to rely on memory-region-names instead of
node names?

>  			compatible =3D "shared-dma-pool";
>  			reg =3D <0 0x90400000 0 0x100000>;
>  			no-map;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-rproc-dts-=
v1-0-368bca0b309f@nxp.com?part=3D1
