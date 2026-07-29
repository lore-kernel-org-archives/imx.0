Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0267748B396;
	Wed, 29 Jul 2026 13:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331437; cv=none; b=TVIiPyESApp/4DSwsW4HHYJCECT6l1B79+nSn9AVslsyaOMv3FLT7IBpufaO1bBU+EqswiiT1Va7auW4FpwN+gHGqb+wnJnhoopfXmySeTjgLOzqp5X5kmGdOsSA52X3Y9x9o6R09FiHLZAkdiP4Y2Z58T7Lj1r3Qntr8WGCx0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331437; c=relaxed/simple;
	bh=6BNK88zKM88nbcLvy+EVbZDvhRzmsLaV65CYTHaYxCk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uv5//05tyfC+tNuNz0kgcZH2uOa0U3K57vgi7zsFBaxcBghA0e3thyfNQwrGtvB4+oWMx94afP10eDlbCJ746Z+glicbkviLClIkaeLf8ZqjKXA/jsB+2tEOX8TxRz5wSI6k4tCI1tccHivamO8XaN09CzRpRHimogqS89CN1Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnBwBPn8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnBwBPn8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58EC1F00A3A;
	Wed, 29 Jul 2026 13:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785331435;
	bh=i/WGlrbxrMiDYEOsdojzzSwIFQsd0dQf+Ix4cFLLK0E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nnBwBPn870V36/sDMi5kco4URv5XcdwQpRl+kZ1w7Mo2EG7dl6UYRT1tusVdxWgvk
	 Uveuh3ZKhjpsuo0lY1So1hSbah9OrPHVEjAdnH2d9l/0KJsdtDuLRJbsNEzgXLI1tD
	 vwULSbPT8LI4hZasOh0qwMAyS69D2v5h2H9x5qPjAo/h67tBdPhp2c8RDUDFHvuRWW
	 vM3HpT8uxG2DlE86kTjufvECARCXU2D+d9BzNMQayPsrd03yDkjjsDfEZzgaCTOkT6
	 Wc5AE3DCxe7yTHyq3t1vtZPr6pVHOcw9BKhwUUKSuo//J+1ISo39cYvquYk2EMIgE/
	 nD4Gu2jrgcAQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/12] arm64: dts: imx8qm-mek: fix reserved memory
 node names for remoteproc
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260729-rproc-dts-v2-2-debbe0816202@nxp.com>
References: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
 <20260729-rproc-dts-v2-2-debbe0816202@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 13:23:54 +0000
Message-Id: <20260729132354.D58EC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Renaming the vring memory nodes for cm4-1 to `vdev2vring0` and `vd=
ev3vring0` breaks static vring matching in the remoteproc core, causing a f=
allback to dynamic allocation and breaking IPC.
- [High] The DSP's vdev buffer and vring nodes in `imx8qm-mek.dts` were mis=
sed during the rename, leaving them with the generic `memory` node name, wh=
ich breaks the driver's memory region parsing and IPC.
--

--- Patch [2]: [PATCH v2 02/12] arm64: dts: imx8qm-mek: fix reserved memory=
 node names for remoteproc ---
commit b33c57fd7f12629e7e4a66a20b899d545ad3c226
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx8qm-mek: fix reserved memory node names for remoteproc
   =20
The imx_rproc driver uses node names to identify reserved memory regions.
It checks for "vdev0buffer" to skip mapping, "rsc-table" to locate the
resource table, and "vdev" prefix to filter vdev regions.

> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/bo=
ot/dts/freescale/imx8qm-mek.dts
> index 9e49ac377162b..8b67fb5d670da 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> @@ -44,57 +44,57 @@ reserved-memory {
>  		#size-cells =3D <2>;
>  		ranges;

[ ... ]

> -		vdev2vring0: memory@90100000 {
> +		vdev2vring0: vdev2vring0@90100000 {

[Severity: High]
This isn't a bug introduced by this patch, but will this renaming actually
work for the cm4-1 remoteproc instance?

Since imx8qm-cm4-1 is an independent rproc instance, its first virtio device
index is 0. Looking at the remoteproc core, rproc_alloc_vring() searches for
vring carveouts using the format string "vdev%dvring%d".

Because of this, won't the core search for "vdev0vring0" and "vdev0vring1"
instead of "vdev2vring0"? If so, the mismatch would cause rproc_alloc_vring=
()
to fail finding the carveout and fall back to dynamic allocation, potential=
ly
breaking IPC.

>  			reg =3D <0 0x90100000 0 0x8000>;
>  			no-map;
>  		};

[ ... ]

[Severity: High]
This is a pre-existing issue, but were the DSP vdev buffer and vring nodes
missed during this rename?

Looking at dsp_vdev0buffer in the same file (which currently remains as
memory@94300000), the imx_dsp_rproc driver will fail to skip the node
because it evaluates strstarts(res.name, "vdev0buffer").

Since the node name remains "memory", won't remoteproc_virtio fall back to
dynamic allocation from system memory and break IPC for the DSP?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-rproc-dts-=
v2-0-debbe0816202@nxp.com?part=3D2
