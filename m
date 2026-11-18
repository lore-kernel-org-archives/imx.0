Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021790;
	b=OSghYUUWeBKX51aBJWSCZxl/OBEmLu7WUWksWeIYdAnnnIHse3UrLKee1xlN5JJIAAIQ
	 qhNJGoN7GCyppQDFN0JOVgHEQMatdxx5fbMBVEMjuHoDo2OXC7uyMb/xOr0ZXeiCNXpu2
	 dOSpzW6UwtpKHfPsGWVhKTfdDRW1/xg1EaeMKZ1GMg+McmVBu3MmUmFEoKh7beIIv4kaX
	 Q8+qKOZxh35peu9rfcnEjpUE/lsQsMe0cPzIx5fq0dKP/bCSsABLSkY4h/SvyyyM8MONb
	 ZSOtNzF2oRgoi4Kw2jJOfpsHVPW4wvq1p0DfOlKDq94qfDRzosLudRit2srPmADFUJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021790;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=u360sBKbnj3c6qNrYzke9snwOMjKTeY4dUzpbIbZheU=;
	b=O/MO8TOllPbQcHahMS1iSY8PRP2rD/8gQ0zl0YlfYxeNCxOOrkgpIOu+NAW8XcokjgYG
	 KRAXHqW8Vc2rtExO4FgWIs5hOFtR6VEtpJvMoKiYdHCd9/UVsSWs7W8vGWs2gF27aj7Z9
	 ssVInRQyanytWBUKtsrckG7IxJRQ/iTDWReWbZKYzj78XVZsbiszBgxA9oygi2digWzwf
	 M9rYRuA73vpt2OCujFcjFq35BcIvV4KLR85Siaz6UADo9GT0czW+SZsvsPo4KFI79nv+C
	 +7uTufPODCrnpcG7NcFNy0/VXbS0y/4RoRWxXsMWMOESepswUtfwb6EtU17KfgtV0ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WUOa0n8y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39599606A325;
	Wed, 18 Nov 2026 17:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WUOa0n8y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3AAB1F000C4;
	Wed, 18 Nov 2026 17:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795021790;
	bh=u360sBKbnj3c6qNrYzke9snwOMjKTeY4dUzpbIbZheU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WUOa0n8yyHZCmM4RUOSm62ayCqHHibyjU4pQjbuld9obdP5g4OR0fuwTJpHK6Wulp
	 TF/eTUMgHts0qsj/D0LgYffgRCWvfMbHLFEhuCMnHGSH5mTq3FxGGSnaD1R6Ou+z1i
	 Go+qu0L9h1Qis/2QR5DYkDxOCdAnh7i4AU5VbTqvS8SCtQaOFz8CJ3MbSYz7tltS6H
	 mmOXfxk+Jz6/4p+bbmwCYUE9ys5PpZLSC06kgKuotg9BtsQuYx1Nvxev7iy6jEu55Q
	 vMzMho3NF7L2Dea39zNGt5rFJ7Jfzcrm5hD0S5qdVUBjADWL300y5NPNzNXtDOodJz
	 P9+dCl5fsGo9A==
Message-ID: <sashiko-outbox-221580@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: imx93-var: Add Cortex-M33
 configurations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261118165719.46297-1-stefano.r@variscite.com>
References: <20261118165719.46297-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 17:09:49 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: freescale: stale cm33 and mu1 nodes left in
  imx93-var-dart.dtsi
--

commit eb85dd95d900da2ad181972f70b093ede806d6a0
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations

This commit adds Cortex-M33 device tree overlays and combined DTBs for
Variscite DART-MX93 on Sonata and VAR-SOM-MX93 on Symphony, sharing common
remoteproc and mailbox nodes via imx93-var-common-m33.dtsi.

> diff --git a/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi b/ar=
ch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
> new file mode 100644
> index 0000000000000..51b4cfe143d47
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Common Cortex-M33 configuration for Variscite i.MX93 modules
> + *
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> + *
> + */
> +
> +/* Use the reserved memory and resource table address from the carrier D=
TS. */
> +&cm33 {
> +	mbox-names =3D "tx", "rx", "rxdb";
> +	mboxes =3D <&mu1 0 1
> +		  &mu1 1 1
> +		  &mu1 3 1>;
> +	memory-region =3D <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> +			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> +	memory-region-names =3D "vdev0buffer", "vdev0vring0", "vdev0vring1",
> +			      "vdev1vring0", "vdev1vring1", "rsc-table";
> +	status =3D "okay";
> +};
> +
> +&mu1 {
> +	status =3D "okay";
> +};

[Severity: Medium]
Should the existing cm33 and mu1 nodes be removed from imx93-var-dart.dtsi =
now
that M33 support is moved into imx93-var-common-m33.dtsi and the -m33 overl=
ay?

Unlike imx93-var-som.dtsi, imx93-var-dart.dtsi still enables cm33 and mu1:

arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi:
&cm33 {
	mbox-names =3D "tx", "rx", "rxdb";
	mboxes =3D <&mu1 0 1>,
		 <&mu1 1 1>,
		 <&mu1 3 1>;
	memory-region =3D <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
	status =3D "okay";
};
...
&mu1 {
	status =3D "okay";
};

As a result, booting the base imx93-var-dart-sonata.dtb without the -m33
overlay still enables cm33 and mu1 while leaving all M33-reserved periphera=
ls
enabled for Linux.  In addition, because that node lacks memory-region-names
and imx93-var-dart-sonata.dts names the DMA pool node vdevbuffer@87f00000,
imx_rproc_prepare() does not match strstarts(res.name, "vdev0buffer") and m=
aps
the virtio DMA pool as a carveout.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118165719.4629=
7-1-stefano.r@variscite.com?part=3D1
