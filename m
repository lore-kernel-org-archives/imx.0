Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911983C1998;
	Wed, 15 Jul 2026 07:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099872; cv=none; b=RejSPEI4KpzIfVfCRjZ2pVb/ZA/cs/F5d9hYTbD6DqWs4Nf8jtGIoG3AhLKLwOnjkCaeAf6FQ5CP9TPmJa+Qwb4Lq1eE8Z+lr0Oryuk3ALtf6yKyAerpivEKBKsWirBign4L0j1vhfKpi+W1ph9wR6WyNfmnw3iIav2tpQaRbMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099872; c=relaxed/simple;
	bh=DHJFX8FvvItY+uhmwPk7Nu6PwNJmlmRDXuSzY28+WGs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YCqgJT1OThZTNyDAoQ1zPhrXoUdnUhnabwRN1e+KjalJvkz+lwUxmns8nPrns4N4Qyo7brCFhZjq6F//WFtH3PHx/IpVXF6wmk8ToIx3hK/l7K/yzlbFBw2KgcRQGgL2IIULV9nAQisNfm+UywxVExrzTWP9Tmmv11+dTcuxMgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JRUmNfbE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JRUmNfbE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79CA81F000E9;
	Wed, 15 Jul 2026 07:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784099861;
	bh=nNZdYLdej0/ViV35Su44zBC1PyOwycP4CDVJGr9awQA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JRUmNfbEVrqNqB94QcDU09yFGahYJAShmagNZyfIf8aPNEChAj40TYL/snTHpeR9/
	 2HzPcry4NKY9YDwX0s8jV24BBroHrtKyobLT+VO19qHYN+/Kq8UU7W7urLi0u35kws
	 VsbmcOWC5x4DFZjC6DjmwqIrSZht5T+7yFYzoGvfGWYvkkYcKIDzQTYpAxWGPbD9Sm
	 FwnCevoihjtIzusz/mNiWQX17G5lbbM+lsnYsmSt/plLsdgaGUTYrs4x8Sdph/iq0M
	 SSI7w+yc+82TBLNXD5agjZDRHG7NssQtoVpm0VGWuAQjmT2pgj/aLjGSVpLfGgRYsy
	 uEd3W0dGUviXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: imx95-19x19-evk: Add CM7 node and
 related memory nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715-imx-rproc-dts-v1-1-d02b583c507b@nxp.com>
References: <20260715-imx-rproc-dts-v1-0-d02b583c507b@nxp.com>
 <20260715-imx-rproc-dts-v1-1-d02b583c507b@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 07:17:41 +0000
Message-Id: <20260715071741.79CA81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The virtio device buffer memory region is named `vdevbuffer` whi=
ch fails the driver's hardcoded check for `vdev0buffer`, leading to it bein=
g erroneously registered as a carveout and double-mapped.
--

--- Patch [1]: [PATCH 1/4] arm64: dts: imx95-19x19-evk: Add CM7 node and re=
lated memory nodes ---
commit b818b56116c9f6f62676b904ae89c90565f8f036
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx95-19x19-evk: Add CM7 node and related memory nodes

This commit adds a remoteproc CM7 node and reserved memory regions to enable
the Cortex-M7 remote processor. The reserved memory includes firmware memor=
y,
vring buffers, a resource table, and a shared DMA pool for inter-processor
communication.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm=
64/boot/dts/freescale/imx95-19x19-evk.dts
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
[ ... ]
> +		rsc_table: rsc-table@88220000 {
> +			reg =3D <0 0x88220000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		vdevbuffer: vdevbuffer@88020000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0 0x88020000 0 0x100000>;
> +			no-map;
> +		};

[Severity: Medium]
Will this node name cause the region to be mapped twice?

During device probe, the driver iterates over the memory-region nodes in
imx_rproc_prepare() and attempts to skip the virtio buffer by checking:

    strstarts(res.name, "vdev0buffer")

Because this node is named vdevbuffer instead of vdev0buffer, it appears the
strstarts() check will fail. Does this cause the 1MB region to be erroneous=
ly
registered as a carveout and unnecessarily double-mapped via ioremap_wc() i=
nto
the vmalloc space?

>  	};
> =20
>  	flexcan1_phy: can-phy0 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-imx-rproc-=
dts-v1-0-d02b583c507b@nxp.com?part=3D1
