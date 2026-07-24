Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB202D7DC6;
	Fri, 24 Jul 2026 16:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911298; cv=none; b=MtzS1qZntOct43nCHdVUseLd2LyAElTiUx+7WRGcSP3aROyOb2aPCcJJ6a/oGkTN9LfxaHFyFEvTNbIKWQBbb+/zEnxDPDURVM9AWo77AW66I7VNPFmihMAY8TOrmc5+4NqFKxMSMiMk246djA+6zbyIjXE9I4Sbrh9pnERxhOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911298; c=relaxed/simple;
	bh=ty4j+1/oOGE25knCqpf7bj3e2UU9fugp8MDLwKbH1vk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CfKe4BAv2BqQIwtC01rmEhgXwXGs6tQclrjUSRT/xlU7NcmwWt5DI0ssEPl9a5ChsZ63g9hNVhv+eFiZjRIHMkWelI+p69zl8D8K+QusjDv64gQUe039Gg2YvX7nmLHcCAzYerOLqTIU2WbZbRr1HV5WPGzmogtWJ0k2v2v0408=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nh/c5A2/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nh/c5A2/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7527D1F000E9;
	Fri, 24 Jul 2026 16:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784911292;
	bh=6APhXfNITMyAOspWnFvMchwyWMxJZinVfcVV0utcYJ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nh/c5A2/GWa8c5vPVYafe260vMPGGbl1P9g0nWEtMtFZ1feOY7P/aA6OFSwYHB42c
	 UZ37BkZ55BmX1NMqYVCq7WhLTtuh6rzk90lrGPdnyD/PZKRCzKd5S//Sy45tEtlZdG
	 Mfb1Py/2ifvS0kn3DoRYzggPX3oKBblzMQel4jTCMOQdtU1eR7kRX1BO0WA/OSr5IY
	 hCUgFtNR7W/p4UILF2OVN4HtqPcPzU5p+gFiX/LTNyq0DfnuS7A1Lz8IjKlwFZx1aB
	 e2LTtp7pXiMRGKzJOAEJQbQaCHWlXpjlqwdWYeB+gHjSkhyHDFKM7b5kTip50ymbF7
	 fEr+9TONV7nag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: freescale: imx8mm-verdin: Add
 Cortex-M4F remoteproc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ernest Van Hoecke" <ernestvanhoecke@gmail.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260724-v1-verdin-imx8mm-dtbos-v2-6-9d7988bd76f6@toradex.com>
References: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
 <20260724-v1-verdin-imx8mm-dtbos-v2-6-9d7988bd76f6@toradex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 16:41:32 +0000
Message-Id: <20260724164132.7527D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unconditional enablement of the Cortex-M4 co-processor and its m=
emory reservations in a base SoM device tree file.
--

--- Patch [6]: [PATCH v2 6/7] arm64: dts: freescale: imx8mm-verdin: Add Cor=
tex-M4F remoteproc ---
commit 5627e466b821e2ae1d5d44438ab0c467605d30f9
Author: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F remoteproc

This patch describes the Cortex-M4F remote processor available on the
Verdin iMX8M Mini SoM.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm6=
4/boot/dts/freescale/imx8mm-verdin.dtsi
> index 5fc177f589cb2..ac450fc6cbfb3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> @@ -52,6 +52,18 @@ hdmi_connector: hdmi-connector {
>  		status =3D "disabled";
>  	};
> =20
> +	imx8mm-cm4 {
> +		compatible =3D "fsl,imx8mm-cm4";
> +		clocks =3D <&clk IMX8MM_CLK_M4_DIV>;

[Severity: Medium]
Should this node default to disabled?

Because it is added unconditionally to the base SoM dtsi, it defaults
to "okay". This causes the imx_rproc driver to bind and call
devm_clk_get_enabled() during probe, which keeps the IMX8MM_CLK_M4_DIV
clock permanently running even if the M4 firmware is never booted.

> +		mbox-names =3D "tx", "rx", "rxdb";
> +		mboxes =3D <&mu 0 1
> +			  &mu 1 1
> +			  &mu 3 1>;
> +		memory-region =3D <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
> +				<&rsc_table>;
> +		syscon =3D <&src>;
> +	};
> +

[ ... ]

> @@ -164,6 +176,27 @@ reserved-memory {
> =20
>  		/* Use the kernel configuration settings instead */
>  		/delete-node/ linux,cma;
> +
> +		vdev0vring0: vdev0vring0@55000000 {
> +			reg =3D <0 0x55000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: vdev0vring1@55008000 {
> +			reg =3D <0 0x55008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		rsc_table: rsc-table@550ff000 {
> +			reg =3D <0 0x550ff000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		vdev0buffer: vdev0buffer@55400000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0 0x55400000 0 0x100000>;
> +			no-map;
> +		};

[Severity: Medium]
Are we sure we want to unconditionally reserve these memory regions for
all boards using this base SoM?

Because of the no-map properties, this removes roughly 1.1MB of RAM
from the kernel's linear mapping permanently across all Verdin i.MX8MM
boards, even when the M4 coprocessor is not used.

>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-v1-verdin-=
imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com?part=3D6
