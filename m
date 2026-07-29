Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA0148EBF8;
	Wed, 29 Jul 2026 13:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785332204; cv=none; b=t889ZwQaDAwmmewm0Sr/vX4OZgU0p8jLityCmFyQgzgRlTMbEMSdgX39qOf7NQrGmc94FNOEsqrPs9d0tyR4CHh3ocn5DCTDRnJwZv4+c97rdG0YeNDfEEl5lBIg6PZVXXdXCKt/mjNPNlBYmiEJdHCIhPLqoUFD6WYkxFzYoxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785332204; c=relaxed/simple;
	bh=ZsI+YSMaqi6V/93TXmXtKiqHClTs1y1ouaDylv5+84o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oyssAMq3U647ami4eXfoJRC0WX42RoypnwyJ1xpmvdkPgW6fWqTAtwLiWuu13A4pkU+NleagsWqiRjNPwHTH+Ej4Mq6Cd7q/l0fF5HmnWifJ3O7D/n5lk+1XjJDtsmYUQk4Si/NC1Q5gWjGFHVrXKhbD/ePqmmmMHygO86ME25I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEVJuNNH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEVJuNNH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39A21F00AC4;
	Wed, 29 Jul 2026 13:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785332197;
	bh=V6TjPhGEhP0wnPsUWITybv4VhysSFY95QrW0DdYQqAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aEVJuNNHRSgMVoSVDXReHer5jYF4quCPnUj/nEaCFRAOLZ3YUWDGBAOd5H0l5Xz92
	 TwytWHYKdwUw8s1eDRMlmGSJirx1oXGvzJKe4vaZ30XSqlaOJxlEUAAhQ+Nkr2roey
	 AdOsx/wnJg6bpoULFDGxlzSwVjAkX2aavfpLKmqgAD+vWkQ75rOaBD5Q9dZiKPK/nL
	 wShZCC7GzgW8ye9StzV4n7nT66wgwHuzP4Hn7BSsddTjsfZ9HyrEYm4ZDWsJ37RChG
	 vaKgnJE861Olk1V/3M8TsEVSba0moIBsvLWB1+A/OCNe4Ea1Cf+z/v3AX05lVHZyPl
	 tiKA+MIxu/7rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/12] arm64: dts: imx8ulp-evk: fix reserved memory
 node names for remoteproc
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260729-rproc-dts-v2-6-debbe0816202@nxp.com>
References: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
 <20260729-rproc-dts-v2-6-debbe0816202@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 13:36:36 +0000
Message-Id: <20260729133636.F39A21F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] Incomplete fix: The patch resolves a bug where the vdev buffer i=
s unnecessarily mapped by renaming the device tree node from `vdevbuffer` t=
o `vdev0buffer`. However, this renaming was only applied to a subset of i.M=
X8 device trees, leaving the exact same bug unresolved in numerous other Fr=
eescale device trees (e.g., i.MX93, i.MX8MM).
--

--- Patch [6]: [PATCH v2 06/12] arm64: dts: imx8ulp-evk: fix reserved memor=
y node names for remoteproc ---
commit 1515907215de5459529c9efcc4af91b85ac7ba38
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx8ulp-evk: fix reserved memory node names for remoteproc

This commit renames the vdevbuffer node to vdev0buffer in the imx8ulp-evk
device tree. This prevents the imx_rproc driver from unnecessarily mapping
the vdev buffer region during initialization.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/b=
oot/dts/freescale/imx8ulp-evk.dts
> index 5dea66c1e7aa0..48a3e40053299 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> @@ -67,7 +67,7 @@ vdev1vring1: vdev1vring1@aff18000 {
>  			no-map;
>  		};
> =20
> -		vdevbuffer: vdevbuffer@a8400000 {
> +		vdev0buffer: vdev0buffer@a8400000 {

[Severity: Medium]
This is a pre-existing issue, but this patch only partially fixes the probl=
em.

There are other Freescale device trees that still define the node as
vdevbuffer, which will continue to trigger the unnecessary mapping in
imx_rproc_prepare(). For example:

arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi:
    vdevbuffer: vdevbuffer@a4020000 {

arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso:
    vdevbuffer: vdevbuffer@b8400000 {

The driver uses a hardcoded string check:

drivers/remoteproc/imx_rproc.c:imx_rproc_prepare() {
    ...
    if (strstarts(res.name, "vdev0buffer"))
        continue;
    ...
}

Should the nodes in the other affected device trees also be renamed, or cou=
ld
the driver check be updated to handle both names to prevent this issue acro=
ss
all boards?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-rproc-dts-=
v2-0-debbe0816202@nxp.com?part=3D6
