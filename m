Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860CA4A33F2;
	Wed, 29 Jul 2026 14:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785333948; cv=none; b=No28uZ0Nd/sLr73FDLiFXb4Sf156sNzCSlOQsHzkJQJ32bUhM1S/fyaXtKa0NOjhBH5QHZkMDn/S37B1yPWqAWBVtEsZVt+QUhM6fwqPn43j9TAD1KiYJMJXdI8pvNejHCaN8b2RvWDaoHAecYTI8PmX6wdiS/HuYApAx+v83Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785333948; c=relaxed/simple;
	bh=B5FMELXRHEXTUYiede/BKz9/z6BMwNMYS+2PP59cEBk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HzaE7EkeDZc++xWRgIsUa8T+a2u4Jp2EDEXRL85lryCvaIG8xvdgvk7EsG1d87Ir+tB99e3Fmr9hdSElwUcr0deejYwcqu7QLSPhf7oYG0VmNHEdINobElIF+i4MHBLPgy1o0KEaKPJxSssRzA7f2tO6z8oqxQ2oZNcRA5fIago=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLoNHcb1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLoNHcb1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263131F000E9;
	Wed, 29 Jul 2026 14:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785333947;
	bh=jIhNIiEZkLt+dE+wo+L7k7sQuGFLBgh3nnH1ThQbofM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nLoNHcb1WC1PkLhg7gwniBPZOiK66aA+UolNNIQA4vvUmXv9QTqGE3ph6eoy1qPG1
	 MxjXmMM48CS5rJzBRp4NgyRH4Nq/S3dtJgwXJYiEESwhglgx/unRuRiCBLBOIpGalO
	 Zs24viMTrMvlBJ/Vpzc41ngcXshaVjp8jbILo4+98sG7Dqpb84HMpdsfgb6NfxLypb
	 I63GGQTqpMEmer9tkzqR6BW3sZtZPaaVqpo0HHWjcD3txZBA1fghd+1A76QSi1/yps
	 VAf1Gen0aDuKZ6H2b74FcCjs9svYhnyoS8inF4wNwoIupkGeKDysSge4LyOygsGoEN
	 1JlpwJ5gaAx8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/12] arm64: dts: imx8dxl-sr-som: fix reserved
 memory node names for remoteproc
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729-rproc-dts-v2-10-debbe0816202@nxp.com>
References: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
 <20260729-rproc-dts-v2-10-debbe0816202@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 14:05:46 +0000
Message-Id: <20260729140547.263131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch replaces generic Device Tree node names with non-generic,=
 specific names (e.g., `vdev0vring0@90000000`) to satisfy hardcoded string =
matching in the `imx_rproc` driver. This violates the DT specification rule=
 that node names should be generic.
--

--- Patch [10]: [PATCH v2 10/12] arm64: dts: imx8dxl-sr-som: fix reserved m=
emory node names for remoteproc ---
commit 1d32457a00ef15e201f5eccc0be6be161bf05b59
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx8dxl-sr-som: fix reserved memory node names for remoteproc

This patch renames reserved memory nodes in the device tree to use specific
names like vdev0vring0 to satisfy hardcoded string matches in the imx_rproc
driver.

> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi b/arch/arm=
64/boot/dts/freescale/imx8dxl-sr-som.dtsi
> --- a/arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi

[ ... ]

> @@ -103,32 +103,32 @@ linux,cma {
>  			linux,cma-default;
>  		};
> =20
> -		vdev0vring0: memory0@90000000 {
> +		vdev0vring0: vdev0vring0@90000000 {

[Severity: Low]
Does replacing generic node names with driver-specific names violate the
Device Tree specification rule requiring generic node names?

The specification states that node names should be generic (e.g., memory@..=
.)
and reflect the hardware class, not a specific driver or programming model.

Could the imx_rproc driver be updated to use the standard memory-region-nam=
es
property to identify these regions, rather than working around the driver's
expectations by introducing non-generic node names into the DTS?

>  			reg =3D <0 0x90000000 0 0x8000>;
>  			no-map;
>  		};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-rproc-dts-=
v2-0-debbe0816202@nxp.com?part=3D10
