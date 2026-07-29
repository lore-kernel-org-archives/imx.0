Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B31D4457AA;
	Wed, 29 Jul 2026 13:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331794; cv=none; b=Di/Rp1NRFPoOIN8bhlWfwoUvrfnR3csgcmajpQWqVNIq3d8RA47ysizBhI4nTeiPJU7cBtUnaPWr0z1xrN5U3eED1GixUIGe9k32x6wb9FRXV1b4Bm0gDJ/1B/LpM5gqPAVbvu5/WYcOf8+W+TTlA2HlTEvVmbwe5o0V9oaEFOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331794; c=relaxed/simple;
	bh=zOyQw0QoAkQZD33DpiXPv0OhyNsqmBdJSyyzz03BUwU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NwLJR7DRyj7FuL+P4mgAOgirwlzQLGTLMYTJ+QpRWl0R6lRNXoapVrt3Mxuo3NQI4oPje/23sl2yCcdNfZ0i+NVnCZASevQ+WGnO7Y0U3xuwnPT6+Ooo5Z3dQyb1KR99N8rDwec7NMh5b8tzSa+NvAQDa2+IuBilFo4HMh0cEM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZruAQyo8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZruAQyo8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823EB1F000E9;
	Wed, 29 Jul 2026 13:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785331789;
	bh=tpVC0tu1yz28ANb2d0MWObBJaCCt4/LPDBgmgL9q6Do=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZruAQyo8VsGnRsdp4CLk5KuwTdplGI5vjWNnZcJ7bOlREG9ph+UA99PP278TxWIDg
	 xQr0neFQHDocOcmelgaFvvq3hqWfsARtMOeIUOUuQ3+NWG0vvWFlZQ6cr4CBrDOI2x
	 a6nStn4VemKWlsNvEvRLqhSEfrFddcfGc31nYdnWbJ5FFOSpgS7Ft+5HGvAvQ6EpSk
	 ot8wCo+vHAukvN+/kiq3H9jo4nkiKnJH4Lwib/wQ4t/jFIsR+j/gWRkK93PzIK13jt
	 /PEWFmVHAF7QtM/K4QyNDouBSyUqGHI694iZqkvp15Rl6nA8UQXKtAgJLuhJZObrbf
	 EilgOtRq7hhEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/12] arm64: dts: imx8dxl-evk: fix reserved memory
 node names for remoteproc
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729-rproc-dts-v2-1-debbe0816202@nxp.com>
References: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
 <20260729-rproc-dts-v2-1-debbe0816202@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 13:29:49 +0000
Message-Id: <20260729132949.823EB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The newly introduced reserved-memory node names violate Devicetr=
ee naming conventions and schema.

Pre-existing issues:
- [High] Incomplete fix leaving remoteproc broken on sibling i.MX device tr=
ees.
--

--- Patch [1]: [PATCH v2 01/12] arm64: dts: imx8dxl-evk: fix reserved memor=
y node names for remoteproc ---
commit e2a2dbe393a11711fef30985552292a1360dcdae
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx8dxl-evk: fix reserved memory node names for remoteproc

The imx_rproc driver uses node names to identify reserved memory regions.
It checks for "vdev0buffer" to skip mapping, "rsc-table" to locate the
resource table, and "vdev" prefix to filter vdev regions.

Rename the reserved memory nodes to use the expected names so the driver
can correctly identify and handle each region.

Fixes: ee39dbd9a6cb ("arm64: dts: imx8dxl-evk: add imx8dxl_cm4, lsio mu5, r=
elated memory region")
Signed-off-by: Peng Fan <peng.fan@nxp.com>

> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/b=
oot/dts/freescale/imx8dxl-evk.dts
> index 0ede0c7ed422c..71eff3efa6d32 100644
> --- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts

[Severity: High]
This isn't a bug introduced by this patch, but does this leave remoteproc
broken on sibling i.MX device trees?

When the imx_rproc driver calls of_reserved_mem_region_to_resource(), it
expects res.name to start with vdev or rsc-table. Unconditionally on boot,
other i.MX boards still use generic memory@... node names. For example, in
arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi under reserved-memory:

vdev0vring0: memory0@90000000 {

And similarly in arch/arm64/boot/dts/freescale/imx8qm-mek.dts:

vdev0vring0: memory@90000000 {

Could these sibling device trees be updated as well so virtio rings and
buffers are mapped correctly instead of as regular memory carveouts?

[ ... ]

> @@ -65,32 +65,32 @@ linux,cma {
>  			linux,cma-default;
>  		};
> =20
> -		vdev0vring0: memory0@90000000 {
> +		vdev0vring0: vdev0vring0@90000000 {

[Severity: Medium]
Do these new reserved-memory node names violate Devicetree naming conventio=
ns
and schema validation?

Building the device tree with schema validation enabled triggers dtbs_check
warnings because nodes like vdev0vring0@90000000 violate the strict
reserved-memory regex: ^([a-z0-9-]+-)?(memory|sram|ram)(@[0-9a-f]+)?$

The underlying driver code in drivers/remoteproc/imx_rproc.c enforces this
via hardcoded string matching:

imx_rproc_addr_init() {
    ...
    if (strstarts(res.name, "vdev"))
        continue;
    ...
}

Could the node names append -memory (e.g., vdev0vring0-memory@90000000) to
satisfy both the schema's optional prefix and the driver's strstarts()
checks?=20

Alternatively, could the driver be updated to use memory-region-names via
of_reserved_mem_region_to_resource_byname() while keeping the generic
memory node names?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-rproc-dts-=
v2-0-debbe0816202@nxp.com?part=3D1
