Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8748E2417D1;
	Wed, 29 Jul 2026 01:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288994; cv=none; b=hgWJ9iOsClJA+U/CwskB+ssXsDfdnja8lwl3e2tnYMshZBwcOhZq8Gj5h6Ed6NiJZpc4rlKdPWZfF/xRxyiMASFsffiDjKJbDoGULRNqH9wIm0aSh2fwaapz8lb30NhhiNLYIIH4xTjopDRTnrgstLRaA/hTFAZt4Zw0LzChnDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288994; c=relaxed/simple;
	bh=ErAMrKEZCdRnZMD555KoFluujwhfSI+M/HXEMbUI6ms=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GlXzad5Y8QBlId8WgjWighpIQefyuQyXp+gnFfH80zaYDXjJvUgxNkMZRvp6TidS3chlI6Eya890eKINPemRBiVgYlq0iLU6ntVzSsky90hu1g8NdycVL16cVFZ676r3BCulsqPaUQ8oy2L3YN4LCDvxw5ltaEgtFpgTSqe1UL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ig1FhA3g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ig1FhA3g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB00A1F000E9;
	Wed, 29 Jul 2026 01:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785288993;
	bh=xShIzjDAgzOj8/7HMGb2nFPI75srvttSd87jkabKynw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ig1FhA3gPQtWrJdWlHLOy8eIcjmUTbvCTtrze2sm2WnrwHG9recSYt9lFWKGZ718W
	 K1zFj/IldK3CttCu6m/uUXw+ucb7fUnF4Dp5ZUVv5qvpczWQC70F8taOBE3GJaOXw7
	 pDAW6PErYalIj1AhqAZvFLBf9q6o8V8t+siv4fxm+UIDybqlBnLuhVk9/kFaXwme+4
	 L9iBZ83NVrx6lX3WIlNkdSkA2xQBeaOxd6bE3zrgBx9I9dbdjl7ijyIkr7RtM24EX/
	 0LNjKizUJcjdrC5dQ1qqhadgh0HpMh+zloJ0bnc6QgXAsZhMZLMQ3nM0BFoYODTrXY
	 tV59ztvVJYtPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: imx8qxp-mek: rename vdevbuffer to
 vdev0buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260729-rproc-dts-v1-3-368bca0b309f@nxp.com>
References: <20260729-rproc-dts-v1-0-368bca0b309f@nxp.com>
 <20260729-rproc-dts-v1-3-368bca0b309f@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 01:36:32 +0000
Message-Id: <20260729013632.BB00A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix for remoteproc driver node name string matching, ca=
using wasted CMA memory and broken resource table loading.
--

--- Patch [3]: [PATCH 3/7] arm64: dts: imx8qxp-mek: rename vdevbuffer to vd=
ev0buffer ---
commit 3123a86d4f3fafc543a5613360cdacc5946dbc06
Author: Peng Fan <peng.fan@nxp.com>
Date:   Wed Jul 29 01:25:38 2026 +0000

arm64: dts: imx8qxp-mek: rename vdevbuffer to vdev0buffer

The imx_rproc driver checks for the name "vdev0buffer" to skip mapping
the vdev buffer region. This commit renames the device tree node to
"vdev0buffer" to match what the driver expects.

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boo=
t/dts/freescale/imx8qxp-mek.dts
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -267,7 +267,7 @@ rsc_table: memory@900ff000 {
 			no-map;
 		};
=20
[Severity: High]
This is a pre-existing issue, but does this incomplete node renaming leave=
=20
other remoteproc string-matching checks broken?

Since this patch corrects the node name for the vdev buffer, what about the
sibling nodes like the resource table above, or the vrings?

The imx_rproc driver's address initialization relies on the device tree
node name string to filter memory regions:

drivers/remoteproc/imx_rproc.c:imx_rproc_addr_init() {
    ...
    /* Not map vdevbuffer, vdevring region */
    if (strstarts(res.name, "vdev"))
        continue;
    ...
}

Because the vring nodes (like vdev0vring0) and the resource table node are
still generically named "memory" in the device tree, they will fail these=20
checks.=20

Does this cause the vring memory to be unnecessarily mapped, forcing
rproc_alloc_vring() to dynamically allocate CMA memory and waste the
pre-reserved regions because it cannot find its pre-registered carveout?

Furthermore, does the rsc_table name mismatch break the fallback logic
that loads a memory-provided resource table, since priv->rsc_table is
never successfully populated?

Other boards appear to have identical issues. For example, in imx8qm-mek.dt=
s,
dsp_vdev0buffer is also named "memory" instead of "dsp_vdev0buffer". Should=
=20
we update the node names for the vrings and resource tables across these=20
boards as well to fully fix the string matching logic?

> -		vdevbuffer: memory@90400000 {
> +		vdev0buffer: vdev0buffer@90400000 {
>  			compatible =3D "shared-dma-pool";
>  			reg =3D <0 0x90400000 0 0x100000>;
>  			no-map;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-rproc-dts-=
v1-0-368bca0b309f@nxp.com?part=3D3
