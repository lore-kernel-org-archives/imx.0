Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6444F3D891F;
	Fri, 24 Jul 2026 08:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881876; cv=none; b=GuSYhYJBlA4un+68PYHl0a+fSsXLicwzy4B98saq/EyoZDHTeQq+HCkBN7yXW/tBqqYP6a4qi4PxXb/flh/Adiv/bbhnrBj0rV8BCEtEWB0uAawTFd2s+0p/yI44kL4Ok2I7VjF5tKsxPNxHwo8GpPy0lCVfM5Hhrhy3Zz/OD8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881876; c=relaxed/simple;
	bh=LjFM22oQWzNpmMFrqJ7UnSnXNWzItsmieqqNmlfthJc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bg7DvG3cUDGbEeTKkwPohroJb0sOjOymT0oGWfnF/pyXtDj1ylnSMb72uJWHobFmEQA+UIsmxAMQ42Xdl+KZC+XWsuKeSbmpo6VEvZ4cXIbNI1+pqBQripHk6v0txTeJakLzUTgGlqCTdSY5d02i2lI9t1chGbWEPMTHsySTZ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQlal/UM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQlal/UM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A9B1F000E9;
	Fri, 24 Jul 2026 08:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784881871;
	bh=FuroT+H2TyPsv5C1b+SGgyJsdHvwa0lZx5NuZTvgHFc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dQlal/UMThYe8TzWGZaoFUS4wOCbpQaqkOpN9cmm0VbrRivplnrtYoACOqUHrAHaR
	 xGsEL/QMvCnDYPCN183Qh46G5UlY6L48zsb1hsR3jW1wTCnSMdEuYxy0WBgrIARyb8
	 6JgBgcdr3K2d0wUJO8EmdwfHasZ6ph1YUYgerq32TlKRSKLvMVPWvsB0/gwP72reYQ
	 MbF7mGJZ3TDi/4Rx6Jt9FjpyZ6VPfQMlNdYpt8Sh6U4CBjoSWvU9vsU0FlH41NIzE2
	 BoFbJfkutb5tjfa54O5pQJEMyDUu72xSdsMCa0+4doS16GV/GauY/GdPUWqglT2Y+7
	 RgPOMRco4f8tw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v30 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260724-imx-se-if-v30-6-ce8ba256692c@nxp.com>
References: <20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com>
 <20260724-imx-se-if-v30-6-ce8ba256692c@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 08:31:10 +0000
Message-Id: <20260724083110.C0A9B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing 'memory-region' DT property causes EdgeLock Enclave driver=
 probe failure
--

--- Patch [6]: [PATCH v30 6/7] arm64: dts: imx8ulp: add secure enclave node=
 ---
commit dd89141b9b11f1e2b0130369e668c9487347c666
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

This commit adds support for the NXP secure enclave called EdgeLock Enclave
firmware for imx8ulp-evk. It adds the sram0 label and a new secure-enclave
device tree node.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
> index c6d1bb9edf388..182f1444b6434 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi

[ ... ]

> @@ -185,6 +185,13 @@ scmi_sensor: protocol@15 {
>  				#thermal-sensor-cells =3D <1>;
>  			};
>  		};
> +
> +		hsm0: secure-enclave {
> +			compatible =3D "fsl,imx8ulp-se-ele-hsm";
> +			mbox-names =3D "tx", "rx";
> +			mboxes =3D <&s4muap 0 0>, <&s4muap 1 0>;
> +			sram =3D <&sram0>;
> +		};

[Severity: High]
Will this node cause the EdgeLock Enclave driver probe to fail?

Looking at se_if_probe() in drivers/firmware/imx/se_ctrl.c, the driver requ=
ires
reserved memory initialization when reserved_dma_ranges is set (which is tr=
ue
for the fsl,imx8ulp-se-ele-hsm compatibility string):

drivers/firmware/imx/se_ctrl.c:se_if_probe() {
    ...
	if (if_node->reserved_dma_ranges) {
		ret =3D of_reserved_mem_device_init(dev);
		if (ret)
			return dev_err_probe(dev, ret,
					    "Failed to init reserved memory region.");
	}
    ...
}

Since the memory-region property is missing from this new device tree node,
of_reserved_mem_device_init() will return an error, causing the probe to
unconditionally abort. Should a memory-region property be included here to
prevent the probe failure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-imx-se-if-=
v30-0-ce8ba256692c@nxp.com?part=3D6
