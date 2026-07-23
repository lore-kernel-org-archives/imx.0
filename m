Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FCA471CE4;
	Thu, 23 Jul 2026 13:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784812281; cv=none; b=SWUUBV6wCzmOCRdmCicmygTaVDH+M9ShwVCAfC30rUnvWGMEfqm6cZ/SrDQSsq7d+cW1kj34SBXqKGVrWawLSSLHUdjlaNF4YPr+8MjmZzSBWb8jSPDOwSvMx1hBR5mkvR4bp0rS/rXi6CNkQgCyrF6Ziu24hRg2WMJKLZDDaiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784812281; c=relaxed/simple;
	bh=pDbo8fOjPxwizYNOxZUbGSp/vTjOpY/k7kW1QdvppIc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ADmArnYQpYRh/KWO+4K29z7yh4CI7FzCqHdd9aJZ9YzJBM659T8C7LB57qQ5iF5LGgIlVpmX1DZyptIouhPE/gjJ9Ne4MUn4GR8GbmN0vpXD8KJj3sZxUyV0gwAZWg9yx8c7JuXvtp345W4WvZXH8p37j1T4g4sbHSCXAkHsTh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MiUoREiI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MiUoREiI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6541F000E9;
	Thu, 23 Jul 2026 13:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784812277;
	bh=CU6uC0uCylrVWdt5ZDiR+4rnORv2G+MhGBS9t6vZDus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MiUoREiIRXjozvPRAFTieMsl3KWn9sCLL8lSNgy6hw5SgD5khZtXR+r4lN1NCpWP5
	 M9m+v0o0dn9JwrlWrO9kA82M36JzHuAD6+r5USt1awpW8z75uAW1Btb4CJhS8aXqHY
	 3lrR/a6WpkZJAXaU9viQMz/I1HDVypVNnOsE+OEz4IvX4743mFKzZiltIS673cO/04
	 92/PmAbwV6Wr8zz71+uN9lCKKIv9sImtDhJK6SoPyEXcmMs6V3ILe1xn9zphI6ndb4
	 9BYSb32eAZUx09Eyvzmf/PKu96Cbd2UFKLyuhp0+TA+j/Lp2L8PktXp+5biqdC08Vb
	 y4js+eUSEknFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: imx943-evk: Add CM7 and CM33S nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723-imx-rproc-dts-v2-3-a5f5cf2eb55a@nxp.com>
References: <20260723-imx-rproc-dts-v2-0-a5f5cf2eb55a@nxp.com>
 <20260723-imx-rproc-dts-v2-3-a5f5cf2eb55a@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 13:11:16 +0000
Message-Id: <20260723131117.1A6541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing reserved memory regions for remote processor firmware
--

--- Patch [3]: [PATCH v2 3/4] arm64: dts: imx943-evk: Add CM7 and CM33S nod=
es ---
commit 348fa25c5d73cddade66c1646cc1a5d82686eae7
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx943-evk: Add CM7 and CM33S nodes

This commit adds remoteproc nodes for the Cortex-M7 (CM7-0, CM7-1) and
Cortex-M33S cores on the i.MX943 EVK. It configures the mailbox units and
various reserved memory regions for inter-processor communication.

> Add remoteproc nodes for the two Cortex-M7 cores (CM7-0, CM7-1) and
> the Cortex-M33S core, along with their respective reserved memory
> regions for firmware, virtio device vrings, resource tables and
> shared DMA pools.

[Severity: Medium]
The commit message states that reserved memory regions for firmware are add=
ed,
but they appear to be entirely missing from the device tree changes.

If the remote processors are intended to execute their firmware from system=
 DDR
RAM, the omission means Linux will not carve out this memory. If preloaded =
by a
bootloader, Linux might map and clobber the live firmware.

Are these firmware reservations accidentally omitted, or does the firmware =
run
exclusively from TCM memory for this specific EVK?

> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx943-evk.dts
> index 674410e541cba..da7bfbd52e312 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -133,6 +133,36 @@ reg_audio_pwr: regulator-wm8962-pwr {
>  		enable-active-high;
>  	};
> =20
> +	remoteproc-cm70 {
> +		compatible =3D "fsl,imx94-cm70";
> +		mbox-names =3D "tx", "rx", "rxdb";
> +		mboxes =3D <&mu11 0 1
> +			  &mu11 1 1
> +			  &mu11 3 1>;
> +		memory-region =3D <&cm70_vdevbuffer>, <&cm70_vdev0vring0>, <&cm70_vdev=
0vring1>,
> +				<&cm70_vdev1vring0>, <&cm70_vdev1vring1>, <&cm70_rsc_table>;

[Severity: Medium]
Does this memory-region list need a reference to the firmware reserved memo=
ry
(e.g., cm70_reserved), or is it intentionally omitted here?

[ ... ]

> @@ -145,6 +175,99 @@ linux,cma {
>  			size =3D <0 0x10000000>;
>  			linux,cma-default;
>  		};
> +
> +		cm33s_vdev0vring0: vdev0vring0@20800000 {
> +			reg =3D <0 0x20800000 0 0x8000>;
> +			no-map;
> +		};

[Severity: Medium]
The added reserved-memory nodes fail to define firmware memory regions for =
the
CM7-0, CM7-1, and CM33S cores, which contradicts the commit message.

If the firmware is loaded into system DDR by the remoteproc driver,
imx_rproc_da_to_va will fail to find the carveout and the load will fail.
Will these firmware regions need to be added?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-imx-rproc-=
dts-v2-0-a5f5cf2eb55a@nxp.com?part=3D3
