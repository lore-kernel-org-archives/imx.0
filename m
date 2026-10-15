Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED22531AFF;
	Thu, 15 Oct 2026 14:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075648; cv=none; b=LLUWG9Ut+k84HhAu8NnFF6RKarmwSjlCAYSLEX6qUzLOcAswAFhOcMtT13fFsEVCoxcT3ok+a2H0nGEdWkrOBJ4si22etVSqxF0FLkEwA6LvvN/BzJnpjM2BZQtGGPoQ8my7vwhiYXgIDV5FGa18653I4obBZfcfhMAtXdE7FP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075648; c=relaxed/simple;
	bh=KzG89v5CWeQH6MocM3otV1sLC0DYM8lkvo0Iu6k29QU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JqbBJVT+NNVrUuXhMHxate1xx1//CKXel0DX9POxrx3ix26fxQt+p4HecsvKLwE/8LgHcAj7O0KriLf2oVorn2/yzk7PtzPqTgv0+dIP2rD1k9sI1RmRUKtcjTX8cYNIPtx7w1cP/A1OaJzrTOMSemnfxe9WhR0uhMTfp/68chs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1kgJZRF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1kgJZRF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576C91F000C4;
	Thu, 15 Oct 2026 14:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792075647;
	bh=eg9B/NxbYIvgWaS4irB89TWyPCoFMmIo1ofL2+jADEM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o1kgJZRFWC2EQSMFRVrugBlmv0MnA60oliUflZJw1lnDKaseQbL546rNu8WC4e6PI
	 M+zvVmRmWIVe/Sax6xEm6+PDKQ1kqnGG+Cp6fAkbjErG/M/Rekwk+ahPx0ABICIXq2
	 U2OG3gsiu0H3vx9ta4yGj+KGMqAvQMc+PudXDIQEbhSH5N0WH9Tv683m+LmvmsIgoO
	 /UtpXQgLAePe7NSz4VSQH3WhBHmMriorncniLwiA2Wm6Yk5EUYcvERGZDwW2oQ34PY
	 fRRj7PgzKCehOWhu2XMk4F4swycFt/CQMxtoCjI8yNf7q8CBPhgOrXomEIHNmZszBg
	 wjxbsuzZVtnmg==
Message-ID: <sashiko-outbox-172990@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: freescale: add DT overlay for
 MX95-15x15-FRDM RPMSG usage
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261015-memory-region-name-v5-3-abc358b39a96@nxp.com>
References: <20261015-memory-region-name-v5-0-abc358b39a96@nxp.com>
 <20261015-memory-region-name-v5-3-abc358b39a96@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 14:47:25 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: overlapping reserved-memory nodes due to mismatched node na=
mes
--

commit 9406ad5f04c442814590c1435b754dffaa93d0ea
Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage

This commit adds an RPMSG device tree overlay for the MX95-15x15-FRDM
board to support remoteproc and audio over rpmsg-usecases alongside the
mx95evkrpmsg system manager configuration.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/=
arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> new file mode 100644
> index 0000000000000..c3deb277edabf
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> @@ -0,0 +1,81 @@
[ ... ]
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +
> +		vdev0vring0: memory@88000000 {
> +			reg =3D <0 0x88000000 0 0x8000>;
> +			no-map;
> +		};

[Severity: Medium]
Does this node name conflict with the base device tree?

The base device tree imx95-15x15-frdm.dts defines this region using a
different name:

vdev0vring0: vdev0vring0@88000000 {
        reg =3D <0 0x88000000 0 0x8000>;
        no-map;
};

Because device tree overlays merge by exact node name and unit-address,
using a generic name like memory@88000000 here will prevent the overlay
from overriding or merging with the existing node. Instead, it will create
duplicate sibling nodes under /reserved-memory with identical physical
addresses.

Could this duplication cause the kernel's early memory reservation code
(__rmem_check_for_overlap) to detect overlaps and trigger 'OF: reserved mem:
OVERLAP detected!' errors during boot, or potentially duplicate DMA pools f=
or
the same memory?

Would it be safer to reuse the exact base node names in the overlay, or omit
the reserved-memory block entirely if the base tree already provides the
necessary nodes?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-memory-reg=
ion-name-v5-0-abc358b39a96@nxp.com?part=3D3
