Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9EC246774;
	Thu, 25 Jun 2026 16:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403578; cv=none; b=kGq0T8ribmwXbd0Mq6M66LZSykhIucZ+dcjegvIhJM6jtR7kncTryEfvmdVfNvmrJlTqzajmP/E5he+QZYNg8DkNE7ytzk4QDU4t4rSpB0sGMZzWfKnpIY2RamEfSkhZ+hiULO0Si32n5Umpq6qLQissQVVmtQ51AyI9YzFqVwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403578; c=relaxed/simple;
	bh=vfJ0Smw6aCrsHwzvRPj/hOkPkqH8bfNDfn19ondBEWM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OEsWWgyQBpt2q4tIEV6f+GqZ7URdpzeE3hVWs9vZjntQ6z1AndaJHkmtaSgKPIQZZ1vHcgn4neCqvF51xiOsL+mlfbe3ldn1k3meGdm4ywf6mG1/SAANukta0WJSZI7A5be6iLz9eJ0f/TlC9k3nGS0iKW8S+LKVFUlc/Qv95Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VECyP8C9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VECyP8C9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB2A21F00A3A;
	Thu, 25 Jun 2026 16:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782403575;
	bh=SDiE8Pc7U8u8TbEQH0M1TqaKqdwJPYqeCFkhtq8Ujfs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VECyP8C9sms/6yGaTflm6DwqJFSfrd4xdNWe6jWMCmvmIcMnBCWhjnpmJbBVHpNQ3
	 VXQqloS/ektjKncWzTRtasGEwy9dLJv9Aar5eAfljinzZBJrqc99UzaM1/xgCDTzBJ
	 z5e/k3kLaLXocTZt1fN4PGSDcSTQS3jZOojz+TIhimFODClsO4VGVu6tb8vUeZpmDI
	 ymZ48nPvrhZUSZDGAMCES6VRNhtqNEEKjZUBOpoSMl9jcpypq8eQZeqvz7rLdSk06V
	 fbp3zJj3VA6070hwDKmnZ2QK7vsW16rUlEKgm5Asu0WD0sKU8Twe9qVKCs2noBMA+/
	 IoHGdIobYOTsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 5/5] arm64: dts: imx8ulp: Add rpmsg node under
 imx_rproc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shenwei Wang" <shenwei.wang@oss.nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260625155432.815185-6-shenwei.wang@oss.nxp.com>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-6-shenwei.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 16:06:13 +0000
Message-Id: <20260625160614.BB2A21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added `rpmsg-gpio` nodes are nested too deeply in the =
device tree for the `gpio-rpmsg` driver to discover them, causing an uncond=
itional probe failure.
--

commit 9072997f8f4ba10a42ddca328c65744333555ac3
Author: Shenwei Wang <shenwei.wang@nxp.com>

arm64: dts: imx8ulp: Add rpmsg node under imx_rproc

This patch adds an RPMSG bus node and its GPIO subnodes to the device tree
for the i.MX platform. It aims to enable remote device communication and
GPIO control via RPMSG.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
> index 1de3ad60c6aa7..f1b984eb1203a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> @@ -190,6 +190,31 @@ scmi_sensor: protocol@15 {
>  	cm33: remoteproc-cm33 {
>  		compatible =3D "fsl,imx8ulp-cm33";
>  		status =3D "disabled";
> +
> +		rpmsg {
> +			rpmsg-io {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				rpmsg_gpioa: gpio@0 {

[Severity: Medium]
Does nesting these nodes cause the gpio-rpmsg driver to fail to probe?

Looking at rpmsg_find_child_by_compat_reg() in drivers/gpio/gpio-rpmsg.c,
the driver only searches the direct children of the remoteproc node:

	for_each_available_child_of_node(parent, child) {
		if (!of_device_is_compatible(child, compat))
			continue;

Since for_each_available_child_of_node() is not recursive, the driver
fails to find the nested gpio@0 and gpio@1 nodes under rpmsg/rpmsg-io/.
This causes an -ENODEV return, preventing the driver from probing.

> +					compatible =3D "rpmsg-gpio";
> +					reg =3D <0>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625155432.8151=
85-1-shenwei.wang@oss.nxp.com?part=3D5
