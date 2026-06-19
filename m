Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF85B3B52F1;
	Fri, 19 Jun 2026 15:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884260; cv=none; b=AFJr//7fU6UZESpuaJQ0hVPpi1wzBse2iHgr715YzD1I3OICA3VbDgAIknIwitLtgbhh3d0I02GgqSd8OsofJnjQ8e4VH7gWt8jFfzyVRp1qOpgogocfW5lZLazwHxhcV4UODiBzk7JnrugbnofeKcKBa42+8TL/73UibWBP0F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884260; c=relaxed/simple;
	bh=TSeu3rE5n8w/czIW09y1C5wFGxSRYEn91h2EK4+x32E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Azz/x9+auVrvRg14c7iw+KjBOmGG6/q70lPr6IMMh3pK5lO2riolEjj/EB7b2lJ9dFfd8Tr+bdSFDGrV3vuJzTA/aLpdPht8v6jKXOjQJ83kEqrsBx7sqFT20Y8Osu+MUZib9Fu305HtIiMecMehub7H4VmxwSokpefZBxxDZbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdrXRznQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdrXRznQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06AA31F000E9;
	Fri, 19 Jun 2026 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781884257;
	bh=ZhkMgvcOtDmOyhLbS8PdntIwJ3/SiixsrVqkgLuiaOU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mdrXRznQvVFCY2axSnVp74H4X6Sv7l8q5+qJMRADf0PZnEMMCZveaMO6GkeOj3ZiO
	 N1ClsEA9KVEaieDF2l2m2DwnTxjpQPQXOf9FG6rjZF+lEmDUNFErTK37JXWOszM2w6
	 Mg55TVuYcjy5k7kc0OvHIS2edzRzWURoYatykHKaviDdBzuwXHqz66Hn4LcH07ncS+
	 MRa20WB1if8W++i2IWc5OSNbHcd1sz/nOMLi/B1KZnkR9+haHt96JSDtT/85oHglie
	 iGjqr1secXfjLTIb4Ha2hKLcAhWwoXbXbmMrP628KF20zCQsTwfvWO2OY1zslmBZqb
	 HVPT/JbAhi66Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/11] ARM: dts: lpc: Remove NOMMU platform support
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260619-dts_cleanup_arm_mcore-v1-7-0101795a2662@nxp.com>
References: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
 <20260619-dts_cleanup_arm_mcore-v1-7-0101795a2662@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 15:50:56 +0000
Message-Id: <20260619155057.06AA31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unintended removal of the MMU-capable LPC32xx platform under the f=
alse premise of removing NOMMU support, along with an inaccurate commit mes=
sage.
--

commit d19b47e78b74813c8413198ab7ec32784181d8d8
Author: Frank Li <Frank.Li@nxp.com>
Subject: ARM: dts: lpc: Remove NOMMU platform support

This commit removes the arch/arm/boot/dts/nxp/lpc directory, stating the
intention is to remove unused NOMMU platform support. It drops the build
targets for LPC platforms to simplify the codebase.

>     ARM: dts: lpc: Remove NOMMU platform support
>    =20
>     Commercial users and hardware vendors migrated to Zephyr or other RTOS
>     solutions years ago, leaving the NOMMU platform support effectively
>     unused and unmaintained.
>    =20
>     Remove the obsolete support to reduce maintenance burden and simplify=
 the
>     i.MX platform code.

[Severity: High]
Does this commit unintentionally remove the MMU-capable LPC32xx platform?
While the LPC18xx and LPC43xx series are Cortex-M NOMMU parts, the LPC32xx
series uses an ARM926EJ-S processor, which features a full MMU and runs a
standard Linux kernel.

This mistake appears to cascade through the rest of the patch series, where
mach-lpc32xx is also deleted under the same 'NOMMU' premise.

Also, this isn't a bug, but there appears to be a copy-paste error in the
commit message where it mentions simplifying the "i.MX platform code" inste=
ad
of LPC.

> diff --git a/arch/arm/boot/dts/nxp/lpc/Makefile b/arch/arm/boot/dts/nxp/l=
pc/Makefile
> deleted file mode 100644
> index 56b9a0ebb9179..0000000000000
> --- a/arch/arm/boot/dts/nxp/lpc/Makefile
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -dtb-$(CONFIG_ARCH_LPC18XX) +=3D \
> -	lpc4337-ciaa.dtb \
> -	lpc4350-hitex-eval.dtb \
> -	lpc4357-ea4357-devkit.dtb \
> -	lpc4357-myd-lpc4357.dtb
> -dtb-$(CONFIG_ARCH_LPC32XX) +=3D \
> -	lpc3250-ea3250.dtb \
> -	lpc3250-phy3250.dtb

[Severity: High]
Does the removal of these targets improperly disable the LPC32XX platform,
which relies on an MMU-capable core?

> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/n=
xp/lpc/lpc32xx.dtsi
> deleted file mode 100644
> index e94df78def18a..0000000000000
> --- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> +++ /dev/null
> @@ -1,540 +0,0 @@
[ ... ]
> -	cpus {
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> -
> -		cpu@0 {
> -			compatible =3D "arm,arm926ej-s";
> -			device_type =3D "cpu";
> -			reg =3D <0x0>;
> -		};
> -	};

[Severity: High]
Since this node defines cpu@0 as an ARM926EJ-S, a core that features a full
MMU, does this contradict the commit's justification for removing this
platform as 'NOMMU'?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619-dts_cleanu=
p_arm_mcore-v1-0-0101795a2662@nxp.com?part=3D7
