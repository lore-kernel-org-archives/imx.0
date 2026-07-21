Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8763749E3;
	Tue, 21 Jul 2026 10:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784631430; cv=none; b=iOGX8OVMZKDuvbxL8z19BZdED7RvkmOPIgFJIpHauv6MWVmOEURlNXg4925Tp1r8KFBUe149k3/VgGl98da5DuOVYd5DM64/thO3fuWbFqVsnfsn08U56JU3uGHuoNegaW2MTun3BlonkcDtJYJ2A2Yyr9bC6msD4hA5qWKsrrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784631430; c=relaxed/simple;
	bh=ngYcpy+pG+FNWskbQboh/gKrvlecxbaWroiCjEptyRo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aPsvSMNEBXF+pNCAF7WB3ZixQiDdHiJ3SQ62XXTikWf7gU8C4KEznF5D4jWArqYm3Fw4Z4IIyVfw5WpmJKfGKfVceZc84YH7ZzBMSZLBqvkYmKS+9o2OoQiCnyJa31p0ocU88khZ0KjcJ0kgJfKYi86H69wrVN+5GSy4K/3dWiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g2m+Lvrd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g2m+Lvrd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FFE1F000E9;
	Tue, 21 Jul 2026 10:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784631429;
	bh=2v/41pbYfyw00HbKgnncr2RjI8IHNYdrOAE5zTLxDoQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g2m+LvrdoRRfsFGmTn6fEozIfJD7oGn9oP5Re6IEvv/8BFKf7wwrKDTIkUZ8AWUrO
	 D+bAK2fs0C3jhJh9gTYYQH/5jU2jWA7ZINBBuS+1ylULDuQqRo+k9VVKgMZbgoLnUq
	 e3ugXq9NYvqjOq0wKIoEUZjr8RjT/vJFpHWjP9AHWIvhs+TktKC07blduWDhz2YfpE
	 oy6RwXmPncA8MzzaNmIeYGlRvqyUORN6gxPYHwePlycev5/sp9ZozqAeVp8uZn4jSo
	 96iUgce4+zINx1jZGNo/W6hfNQXc6g70e5J5nQTZtK8rVLR222BN+brN4Xk+ZLwNko
	 yxM+UqqvCpLig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v29 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260721-imx-se-if-v29-6-04a362f4fcca@nxp.com>
References: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
 <20260721-imx-se-if-v29-6-04a362f4fcca@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:57:07 +0000
Message-Id: <20260721105707.C9FFE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `secure-enclave` node is missing the required `memory-region` =
property, violating the DT binding and causing the `se_ctrl` driver to fail=
 probe unconditionally with `-ENODEV`.
--

--- Patch [6]: [PATCH v29 6/7] arm64: dts: imx8ulp: add secure enclave node=
 ---
commit 2de8edbeb186b1bf74b55f8e1113a94023d98cce
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
arm64: dts: imx8ulp: add secure enclave node

This commit adds support for the NXP EdgeLock Enclave firmware (se-fw)
on imx8ulp-evk by defining the secure-enclave node in the device tree.

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
Does this node need a memory-region property?

Looking at the driver side in drivers/firmware/imx/se_ctrl.c, when the
hardware matches and sets reserved_dma_ranges =3D true, se_if_probe() execu=
tes
this logic:

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

Since the memory-region property is missing from the device tree node here,
will of_reserved_mem_device_init() fail to parse the phandle and return
-ENODEV, causing the probe to unconditionally fail?

>  	};
> =20
>  	cm33: remoteproc-cm33 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-imx-se-if-=
v29-0-04a362f4fcca@nxp.com?part=3D6
