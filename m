Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72BB2E282B;
	Thu, 17 Sep 2026 18:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669607; cv=none; b=BPEtipbXaqmaoej0fq+22xGpu/SY/hcY56JiQWzPsOmeNVWrybQsPm7cL7MreXRPUrBCk4G3LMoFkJMLKday59X0a6W4BYY969I+Vuh49TZo/XCZ9Vut59cBcpS3NoBqMDLU+0NV6Fpz1ec12XQLoI3YeECK3DCLupOcHN/jO6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669607; c=relaxed/simple;
	bh=aHBI7nF+t+aC+DF+3+CGv8rvB6sZjdDf8f3c9wIX63U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jsj0ZaPPDko8nWPH8HfewnYphx1i7wAdNQSlHf7tcXevzr3MKt4bdzN8k0aB/OruNBrHb+ggY/hZBghTVqSQCfppP8xXq8devbjPjq4IgA7NvULmyqYmszezbAOmORXAtxxpvANthPQJ/RVRJKBX57f/I2EfKBemanXB9kp88vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCSW4BD0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCSW4BD0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA17F1F000FF;
	Thu, 17 Sep 2026 18:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789669606;
	bh=+lcRSSuw7U0XGR79cvbwA89+BDIaLiF04KTMF8oiqMo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DCSW4BD0yR+3Hj6vSfsFonlFJb25XkPZYUb/Da+yLg+fR70Z07np/zuiDHnc+DyOZ
	 clUe1hToKGXlPmqikay4HYNUsR2tV1W7D5PckZqQ/C1NvQQogZP1me7aBs1MYQXf+h
	 dNstE/UZDsAwHb+aTAFEIkCNle8Xjq92XuHK1EcMB5HTKvrIDRklTMwpB7snux2tvT
	 gHoxwpIyb3Nv5kGbfUmLXVP7+eZqGOHvgxsLhbGlNccYhnwayAkYMPhafjKntg3YUQ
	 e64hNcFpQlB6VHAhC0NWosFMuC4bvDI/Shik62nYqdHJS4zmAJFGfAy63986exJRh/
	 VC2MHCL0AhQdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: freescale: imx95-15x15-frdm: remove
 some rmem regions
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260917-memory-region-name-v4-3-260755920ebf@nxp.com>
References: <20260917-memory-region-name-v4-0-260755920ebf@nxp.com>
 <20260917-memory-region-name-v4-3-260755920ebf@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 18:26:45 +0000
Message-Id: <20260917182645.EA17F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: unused vdev1vring reserved memory regions left behind
--

commit 12514a7b6ba32d79be71a2b0cfb351fc1fe91f46
Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

arm64: dts: freescale: imx95-15x15-frdm: remove some rmem regions

This commit removes several unused remoteproc reserved memory regions from
the device tree. They will instead be added in a DT overlay.

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

[Severity: Low]
Were vdev1vring0 and vdev1vring1 intentionally left behind? The patch remov=
es
vdev0vring0, vdev0vring1, vdevbuffer, and rsc_table, stating these remotepr=
oc
regions will be added via overlay. Leaving vdev1vring0 and vdev1vring1 behi=
nd
unnecessarily reserves 64KB of physical memory that Linux cannot use.

> =20
> -		vdevbuffer: memory@88020000 {
> -			compatible =3D "shared-dma-pool";
> -			reg =3D <0 0x88020000 0 0x100000>;
> -			no-map;
> -		};
> -
> -		rsc_table: memory@88220000 {
> -			reg =3D <0 0x88220000 0 0x1000>;
> -			no-map;
> -		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-memory-reg=
ion-name-v4-0-260755920ebf@nxp.com?part=3D3
