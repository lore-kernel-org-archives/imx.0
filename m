Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF21C3644A4;
	Wed, 15 Jul 2026 17:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784136718; cv=none; b=hBdeBTp77e3H71nwFx0DsIzEtGPD2BwZnq0kAt7f47ovsVuZ/imf90hkb9Kc4TWMFm/ORBKsiefQcpUnzyujN4y73UpxSR3h7DXYJkCfe7uKvx9eyHXZtyjlK8jkTT3PIM4CEcWLXSa9k9vomcrDxOVJzLerxr+nQLGVHXuWdUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784136718; c=relaxed/simple;
	bh=MBHNOtWZsINk1Jhwf8Zw+GaowWlDvVwa1MkFnKLBXlI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=obwXDWlpFYv1malphHyBe7Kg6tfbemeVDEHf6IG4rlkpEoKhdexVIranJQfBffiq7jMMSDuasVoim1xwgZiDdIkMrK3ULaBwT8U0xGwXCsIiHSjPYI1IWRdGxLcI97Iu+LdRoMUOBuXRpYZCn5+864KbUsVn/Dpdbj6Fo9dxmrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZxGNQ0aE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxGNQ0aE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803F71F000E9;
	Wed, 15 Jul 2026 17:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784136713;
	bh=g9redqiHd9mZU6SbYdk1oJWO/1MEiZ7k8WfSXPfV51M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZxGNQ0aEPJKsluqTo16C6z1UK9h+XtOY88Pbv2LsoNyCR2klrwupjxRNow5fqk4+t
	 a5tXef7+AAqu3Y4W2Kv7Lx16EIbn/Dctfym1fUq39dlYx4Ey8NVQT57cyWYNNK0tu3
	 ZFR+0W5sU0hcz6+lZbWVYc0wOIPXyrdK5MhHJ57POvOZgsbXK6Ue1GRFyXO98gGQ4Z
	 WiFolAmY5Iw6i/gQ3txe9wqenOlKaML6p5noKJxE8byWCow5vGNx5IfkXT1sMIESLp
	 EVc8KeCCg6L3g1a5S145n8PZoUwIqP/CuKp6naDbD2SV7qW4YUl/XKflv3jNpPbJ+F
	 GkP+nxmSmr8Pg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v27 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260715-imx-se-if-v27-6-bb7c45952f06@nxp.com>
References: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
 <20260715-imx-se-if-v27-6-bb7c45952f06@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 17:31:53 +0000
Message-Id: <20260715173153.803F71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `memory-region` property causes probe failure and violates=
 DT binding schema
--

--- Patch [6]: [PATCH v27 6/7] arm64: dts: imx8ulp: add secure enclave node=
 ---
commit 1940854b723d6ccdefaa1704833b38d758fc0725
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

This commit adds support for the NXP secure enclave (EdgeLock Enclave
firmware) for imx8ulp-evk by introducing the hsm0 secure-enclave node=20
and a label for sram0.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
> index 1de3ad60c6aa7..a5b591add9a49 100644
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
>  	};

[Severity: High]
Does this node need a memory-region property?

Looking at se_if_probe() in drivers/firmware/imx/se_ctrl.c, the
reserved_dma_ranges flag is set to true for imx8ulp_se_ele_hsm. This
causes the driver to execute the following initialization:

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

Without a memory-region property in the device tree node, will
of_reserved_mem_device_init() fail to parse a phandle, return -ENODEV,
and cause the driver probe to abort unconditionally?

It also appears that a memory-region is expected by the fsl,imx-se.yaml
DT binding schema.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-imx-se-if-=
v27-0-bb7c45952f06@nxp.com?part=3D6
