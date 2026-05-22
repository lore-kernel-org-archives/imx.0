Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55729383C80;
	Fri, 22 May 2026 12:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453177; cv=none; b=dpMrcYDqgJb3Mcf2o25XzPvS0tT3tvrhgnag5inDZiNo8Q/g3sY3PpMakS1TPyFUPWgjLLrq/SCSCIFDv/bghvi5jvI8kCKItXl1u8FtALIDYnuC9WSZXgFLRYtnkw0APoKMC3sPu7SjZQX6RpPPPCy1HD7u63uvaftgUcB/j6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453177; c=relaxed/simple;
	bh=mVln9+gziMHZN+XkSyHi7csjyiEFVOXmysIqhlJSsZc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GbxbvDv1doPjI01WdyADasqMS5OoNoimMKXZP4dQend1ExzaWkAiEsOCtjsCwAxiGYtPTseEEW70pJ0Jmp6jwWhNivOKTCkV9SZBYui8+1V9DBB0sYRYbUCbRsRQ+zYLE0eUz3QLcr9MhN6zmaaxNZ5+fv4vfdimvlK4+VCabOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDruXKAQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDruXKAQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FEB81F000E9;
	Fri, 22 May 2026 12:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779453176;
	bh=Hoju2YgXhT7PtnXSCwVHegZ3+uG0YC8XDJ3Ff3Ga49Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BDruXKAQrkK7HuWuDzm0In0UvBjY6LBU/bBX/s6BiJ7LMBnwNoQZBEKRLw8d2Xkh7
	 Fe1nXPzmHUsqyrSqtb4NCIVXn3iH2abnDbbUoP5ZTeuH0Ml5njYCgAMrYMUIr2f2U7
	 1eJRtml/aYPfYzf/6eH/15EikcfZdUIPXGvfJRW8CpgX4E2k0sVRj8CulFhh0t+NpQ
	 3kuNHu4RhiNMUkJDIRLApX948QHHzcfff8qj7xolxFbH3ydQWQC1ob8BhWnXmPTh/H
	 RpHqdCWWj1W1KuZlBfBnMJVSGjXCiOe/gtLDelP6+VL58UJhcmK1m1w2+SOFZSTWjA
	 zGoCo/ON5MNsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: freescale: imx95-15x15-frdm: remove
 common rmem regions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurentiu Mihalcea" <laurentiumihalcea111@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260522111849.783-5-laurentiumihalcea111@gmail.com>
References: <20260522111849.783-5-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 12:32:55 +0000
Message-Id: <20260522123255.6FEB81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete cleanup leaving orphaned remoteproc memory regions (`=
vdev1vring0` and `vdev1vring1`), causing a code and commit message mismatch.
--

commit c3d174a8ecea96cc404dfedae6ae093499f849dd
Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

arm64: dts: freescale: imx95-15x15-frdm: remove common rmem regions

This commit removes reserved memory regions used for remoteproc on the
MX95-15x15-FRDM platform, noting they are unused and can be included in an
RPMSG-specific DTS instead.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/ar=
m64/boot/dts/freescale/imx95-15x15-frdm.dts
> index 0f43e3be70589..f9b0e266754d6 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> @@ -188,16 +188,6 @@ linux_cma: linux,cma {
>  			linux,cma-default;
>  		};
> =20
> -		vdev0vring0: memory@88000000 {
> -			reg =3D <0 0x88000000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev0vring1: memory@88008000 {
> -			reg =3D <0 0x88008000 0 0x8000>;
> -			no-map;
> -		};
> -
>  		vdev1vring0: memory@88010000 {
>  			reg =3D <0 0x88010000 0 0x8000>;
>  			no-map;
> @@ -208,17 +198,6 @@ vdev1vring1: memory@88018000 {
>  			no-map;
>  		};

[Severity: Medium]
The commit message mentions removing the reserved memory regions used for
remoteproc. Should vdev1vring0 and vdev1vring1 also be removed here?

Since they retain the no-map property, do these remaining nodes unnecessari=
ly
carve out memory without being referenced anymore?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522111849.783-=
1-laurentiumihalcea111@gmail.com?part=3D4
