Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE66B433BCE;
	Sat, 12 Sep 2026 11:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789213551; cv=none; b=USzKj23EdveLDnkrf+NKuzXz5Jc9zAnHg1Sd/gHrEMKz9eOniEs6Zw9a7ELtruaeUzRVHyEbRA3uDT7wtFJKwUxZN1ysO336EAM2tZKbkcYZW98aE3yqwWHuepZG6L/ATrkUwQfaUGbfpO7bHSMibTEUPUMFnjeJMLUeocRHAtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789213551; c=relaxed/simple;
	bh=c6WD7C7S3TjLd7cJZ8j92HWoRNHqdou9U5vyc1YmdS8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WIi2eBc8i5nyoRgPqc149rsH/ekMt3UpWPVj1f3uAwhboXrvrUVcTVkr8fM1ozzWpF1KvYXyPHZ4Say7/swBsKPbhL8QcdbQp5jIjzj+5mUKnfKVcLwpMgBK+qvmiwIFzxYyhnFD/bZO8HFgt6XpVNtZRnTojFLAjCAnCub/KA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0yBJTvB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0yBJTvB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26ABB1F00893;
	Sat, 12 Sep 2026 11:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789213550;
	bh=MUbFgpCjYeQ18ZaBE7tS1mrsj896z8O7Qqi4LVtGOP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g0yBJTvB5lJhI2zEzI2cvnpgUMzNJI1qF6EXw43rCWcV0KuNuFgjk0DMwAZs73IL+
	 WdaWTlou0CNbtnVJ9nbPNmndATxmRPp3wsotlW7z+vHwjnQ+vWZPijK5bSvmxs4RvT
	 /6YYfLFRPzdy107vkKrL8zFUh9Jz5BGmbpZ2KN++aDviJaVYs1qGRkx/Amw3P9wiiD
	 ui5PMfK9idiZTlq1yevAe5EL7hMGVIe8yI79w5VApgJEx4vTrMltsHxqWtxjMvvI7J
	 jsPqtbdUtbWBIDGqIyxr7AuU3HzPzJx21GUQ/1qfWuFrEqD5+cCfzNVxm6ftv+Mrnk
	 hhBF2mKOnb8Zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v50 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260912-imx-se-if-v50-6-80834ef510d3@nxp.com>
References: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
 <20260912-imx-se-if-v50-6-80834ef510d3@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 11:45:49 +0000
Message-Id: <20260912114550.26ABB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Mismatch between the commit message and the actual SRAM node lab=
eled in the device tree.
--

commit 6e41c69d46e1780283726744191a5e95f15d0970
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

This commit adds the EdgeLock Enclave (ELE) secure-enclave node to the
i.MX8ULP SoC dtsi. It includes a label for the SRAM node referenced by
the enclave and keeps the enclave node disabled by default.

> Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
> dtsi, together with a label for sram@2201f000 that the node references.

[Severity: Medium]
Is the SRAM address in the commit message accurate? The commit message stat=
es
that a label is being added for sram@2201f000, but the actual code change
applies the sram0 label to the node at sram@22010000 instead.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
[ ... ]
> @@ -154,7 +154,7 @@ sosc: clock-sosc {
>  		#clock-cells =3D <0>;
>  	};
> =20
> -	sram@22010000 {
> +	sram0: sram@22010000 {
>  		compatible =3D "mmio-sram";
>  		reg =3D <0x0 0x22010000 0x0 0x10000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-imx-se-if-=
v50-0-80834ef510d3@nxp.com?part=3D6
