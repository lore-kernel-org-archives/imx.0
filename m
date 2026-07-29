Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106232D0C9D;
	Wed, 29 Jul 2026 01:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785289027; cv=none; b=CyYXg/6wScn4g/JKMyrw8n0qK/xpbXC5TpMl0i3gf0CiqXuBOkLSNY62cMgUbIG9GLk3k1JDNLBe6boqUgcLc7i9NxZQrNZfwriWuQRzRnxrtAKbrT0R5Y/2oVB5D4DokicsFJiCSZgCUnhkn2vUxXv6KJ4xS2QjOpZJB3TVo1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785289027; c=relaxed/simple;
	bh=qtQCaIpPFLHVxA0N/Z0ctspaKmHBbzS3SCdgjkINex8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=noiiomz4opysIq/r2gvNVurEtGuDEg0MBzyDh8ZusGLmXeP9XmrTrEcQZi4Qg3agc+srX0h1gUcadvpgo9uEhECygMVDSGjGeC94ishAaC/Nrgink4yRbeMbSmvAo1r2aHJrIxvpaFhabKcs7uO4uYz/cJrK2q3ots7FtlWhInE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W7sw5JUa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W7sw5JUa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5771F000E9;
	Wed, 29 Jul 2026 01:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785289025;
	bh=l20p95C5/Qhk6MsYxIMqowshAq/EZndsJlGKyFeBdew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W7sw5JUa3a91eRWZ/hnGy2i0TT/dd7ee/0fEUscnJUyvuiq9BHI8txbS2PAS4anG+
	 MYgOJHVMv9lAEy+281tmanDHmVSqRMKffnGfuIxevbnVwQetVHoUzdTISeb2ina/6+
	 M0ue6HCo4hMdyK9nLlaKih6S6Z+GFwdSv3Q8lZT5axL8TzqpepAVoEr58sf3eDHmvw
	 1u67FEf+EVzu+gXU/EnPYgFWeGtu8xu6ay548djqTAn2EanmXvM6erYB/W3VkWTqFI
	 oU1mN76F8M19/mzK+VdLAQdiDxHvQyk0WtONhn7YqX/O4ZPjYx2OyGsghnCCymp5eD
	 u8M1y7Hscp3lA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: imx8qm-mek: rename vdevbuffer to
 vdev0buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260729-rproc-dts-v1-2-368bca0b309f@nxp.com>
References: <20260729-rproc-dts-v1-0-368bca0b309f@nxp.com>
 <20260729-rproc-dts-v1-2-368bca0b309f@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 01:37:04 +0000
Message-Id: <20260729013705.4C5771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch only renames the `vdev0buffer` node, missing identical n=
ode-name string-matching bugs for the DSP vdev buffer, the vrings, and the =
resource tables in the same file.
- [High] The fix for the vdev buffer node name is strictly isolated to imx8=
qm-mek, leaving numerous other i.MX device trees suffering from the exact s=
ame bug.
--

--- Patch [2]: [PATCH 2/7] arm64: dts: imx8qm-mek: rename vdevbuffer to vde=
v0buffer ---
commit ce17c79a2ee7822b12884c5a6ce5b992a2195b5e
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx8qm-mek: rename vdevbuffer to vdev0buffer

This commit renames the vdevbuffer node to vdev0buffer in the imx8qm-mek
device tree. This ensures the imx_rproc driver correctly identifies the node
by name and skips mapping the vdev buffer region.

> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/bo=
ot/dts/freescale/imx8qm-mek.dts
> index 9e49ac377162b..50aa1e3419651 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> @@ -94,7 +94,7 @@ rsc_table1: memory@901ff000 {
>  			no-map;
>  		};
> =20
> -		vdevbuffer: memory@90400000 {
> +		vdev0buffer: vdev0buffer@90400000 {

[Severity: High]
This is a pre-existing issue, but this patch only renames the vdev0buffer
node, missing identical node-name string-matching bugs for the DSP vdev
buffer, the vrings, and the resource tables in this same file.

For example, rsc_table0 is named memory@900ff000:

arch/arm64/boot/dts/freescale/imx8qm-mek.dts:
    rsc_table0: memory@900ff000 {
        ...

This causes it to fail the strstarts() check for "rsc-table" in the driver:

drivers/remoteproc/imx_rproc.c:imx_rproc_addr_init() {
    ...
    if (strstarts(res.name, "rsc-table"))
        priv->rsc_table =3D priv->mem[b].cpu_addr;
    ...
}

This completely breaks IPC/virtio initialization if the remote processor is
attached in a running state, leaving priv->rsc_table as NULL.

Similarly, vdev0vring0 and dsp_vdev0buffer are named memory@..., failing
their respective strstarts() checks and causing them to be incorrectly
mapped.

Could these other nodes be renamed as well to fix the matching logic?

[Severity: High]
This is also a pre-existing issue, but the fix for the vdev buffer node name
seems strictly isolated to imx8qm-mek, leaving numerous other i.MX device
trees suffering from the exact same bug.

For example, imx93-11x11-evk-common.dtsi uses vdevbuffer@a4020000:

arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi:
    vdevbuffer: vdevbuffer@a4020000 {
        ...

And imx8qxp-mek.dts uses memory@900ff000 for the rsc_table.

These boards will continue to experience unnecessary carveout mappings and
broken resource table lookups because they fail the same strict strstarts()
checks.

Could this be addressed across all affected device trees, or perhaps the
driver itself could be modified to match the existing generic names
(e.g., matching "vdev" instead of exactly "vdev0buffer")?

>  			compatible =3D "shared-dma-pool";
>  			reg =3D <0 0x90400000 0 0x100000>;
>  			no-map;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-rproc-dts-=
v1-0-368bca0b309f@nxp.com?part=3D2
