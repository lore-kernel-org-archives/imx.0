Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182A44D98E4;
	Thu, 23 Jul 2026 13:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784812275; cv=none; b=TTzLPip7oIq0EaX5IlXshvIvstWNUN4+b6pr90XytTF4BGUVa/aKwSRyH1Pr64Pq0C3dsDKrH1LgyKdjoHOx3XYA6WMk093dtVo4xCtxK2zi5YfqHX0scLxx1vszaunB29BqaYjU44LO3HOIwiC8fvEFMTrDqCy6gd08ljMqnp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784812275; c=relaxed/simple;
	bh=cWAsXtfKYgswlnD1cuY7yuQ5eZjZDWIxEHDTRB+UxGQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NgLgjvfxwFtM17LDe5fMUaUZL5jjmBjeAPmnxBcyl0KHsTHgsvjFAM7AgcoifwvmcoEjOgNdtlnmwOkoe4PoLMIDTGayD1LBW2ceAImFGqg+0in42qdf3+4Mt+F0LqXx4S9gSv8uWUgjGa66f8W4qxinufJnU1sN8K5KB9U9scc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqu0vxJN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqu0vxJN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180EB1F000E9;
	Thu, 23 Jul 2026 13:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784812271;
	bh=AWaeHxmCkwYXDbWSv2Aj1cnpPLGTNXRd1BbTwbskyYs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cqu0vxJNIva9VQ8u36c9qkhVYqyhDUClMsibnvTHWQbFNPO1IqYvG3d8OepWMEjaQ
	 wvXkOLjbLc7QfzCzLggqVEsKWnrEK5J070LIpuLiQdY7xVXfgMRGtceK/uFimka1ia
	 K0GLAciPSg2DlAA/0miMHhVI8JUfVSqzyLzyVbUAkqJkGhfsJ2AguPVV/srtQQEq98
	 gnhmPQ0rnkzNStjd3WIKVstgwoRJQNhpz7T8Wx+S3Qe9PkBCBknqdniEG6MpKnMY9x
	 8LO4qBXqO1BIg0wQa53R0u7nYg9Nr9mBO1+fXY1CV4uD2q0zWg8MOqVbnVxtOGxGqf
	 ER3bISXCITz2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: imx952-evk: Add CM7 node and related
 memory nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260723-imx-rproc-dts-v2-2-a5f5cf2eb55a@nxp.com>
References: <20260723-imx-rproc-dts-v2-0-a5f5cf2eb55a@nxp.com>
 <20260723-imx-rproc-dts-v2-2-a5f5cf2eb55a@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 13:11:08 +0000
Message-Id: <20260723131111.180EB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The vdev buffer memory region bypasses the name check in `imx_rp=
roc_prepare()`, causing it to be incorrectly mapped as a general carveout.
--

--- Patch [2]: [PATCH v2 2/4] arm64: dts: imx952-evk: Add CM7 node and rela=
ted memory nodes ---
commit 22a3bbe540374b7f9198ab38657f1b8b84d70816
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx952-evk: Add CM7 node and related memory nodes

This commit adds the remoteproc CM7 node and reserved memory regions for the
Cortex-M7 remote processor. The reserved memory includes firmware memory,
vring buffers, and a resource table.

> diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx952-evk.dts
> index 62d1c1c7c5013..fec851544fb11 100644
> --- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
[ ... ]
> @@ -82,6 +82,42 @@ linux_cma: linux,cma {
[ ... ]
> +		vdev1vring1: vdev1vring1@88018000 {
> +			reg =3D <0 0x88018000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdevbuffer: vdevbuffer@88020000 {

[Severity: Medium]
Should this node be named vdev0buffer instead of vdevbuffer?

Because this node is named vdevbuffer, it bypasses the driver's hardcoded
skip check strstarts(res.name, "vdev0buffer") in imx_rproc_prepare().

Will this cause the memory region to be incorrectly mapped as a general
carveout during rproc_start()?

This unnecessarily consumes 1MB of vmalloc space via ioremap_wc and
double-maps the memory since it is simultaneously initialized as a DMA
coherent pool.

> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0 0x88020000 0 0x100000>;
> +			no-map;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-imx-rproc-=
dts-v2-0-a5f5cf2eb55a@nxp.com?part=3D2
