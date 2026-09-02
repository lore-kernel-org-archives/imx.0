Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5CC38F254;
	Wed,  2 Sep 2026 19:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376893; cv=none; b=WsrlMQY27L3zJd7OIKQrVzcV0ed99GvNEvNOpxJgVslyfix8Xi7wTcH0IzejdqmDFp39rv/gxpJ3GchcYQFz9r5znHvYLNowYoZIuPWG/4YaOOpQJY/MM34CAVpRGh5ffmcIDyPsIyJuRhPiMxwhsc8ZCDuI3f/WPcOqP0khwkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376893; c=relaxed/simple;
	bh=6PuFZ0yK4pQj7FJ6aETp9iCUC1j6TlKg75JP4Faog78=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rv3htFD7zHhith1xSHxQLWZs0EtP61diK5/FoBGM3HGVI286U6JqsWOcoKh1yQZ7c9VDmq66k8zxnMK8gOcjnBEmjt+gksZSkWIZLyzQtPWH/FiLgUh5z/EGyatjSpmKrXQx59dBe86hfks6Fn+Z5EhswETIqs7DZJWLaG2yp0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=naIT/TVY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="naIT/TVY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F461F000E9;
	Wed,  2 Sep 2026 19:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788376891;
	bh=KlR+9Z4zkDLgxHNLMwkZVNJAmwU+/YZ4fKIa/lKykpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=naIT/TVYRCMSTh0ZagENljSi2glMIOXos6l4zIG/quyYKjeyYrCCrBGynQOdB4Wca
	 8qJ1uulbkt+oBQp/B1zMGxv4bpIM5VBM6NsTZ0M045WLyLrIA/QpuFuMV6rJKOSehV
	 z8f50pROPeXyCfDEERBr8NUvqGBrdFKr1D2Yg4RiRXcnQcm0HvhGsZpLlPQ41ybiO8
	 7LIUQSp0sI6MYBzuvESzsqTOi0D0rBzNchKM+kgUqEvIkCls2pV71tHF36OABTulI7
	 WQvpeQQlAd2EhQDYOx9MsnEeerDn//v8A2pqOjBp7r6JhhmzZ2YZ9Uo/RZIhRhApZm
	 8UdVrcOpqbu/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] ARM: dts: imx53: drop fallback compatible
 "dlg,da9052"
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260902191324.2084035-1-Frank.Li@oss.nxp.com>
References: <20260902191324.2084035-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 19:21:30 +0000
Message-Id: <20260902192131.07F461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix for DA9052/DA9053 PMIC compatible string fallback m=
ismatch
--

commit 421ff6545162f4ccc6bbeb14037dca411d6337a7
Author: Frank Li <Frank.Li@nxp.com>

ARM: dts: imx53: drop fallback compatible "dlg,da9052"

This commit drops the fallback compatible "dlg,da9052" from the
"dlg,da9053-aa" PMIC nodes in i.MX53 device trees. This prevents incorrect
voltage and current limits from being applied and fixes dtbs_check warnings.

Link: https://lore.kernel.org/imx/20260902-varied-unsent-b99f9f007685@spud/

> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb.dts b/arch/arm/boot/dts/=
nxp/imx/imx53-qsb.dts
> index 6831836bd726c..e7e15d2b82c44 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx53-qsb.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb.dts
> @@ -13,7 +13,7 @@ / {
> =20
>  &i2c1 {
>  	pmic: dialog@48 {
> -		compatible =3D "dlg,da9053-aa", "dlg,da9052";
> +		compatible =3D "dlg,da9053-aa";
>  		reg =3D <0x48>;
>  		interrupt-parent =3D <&gpio7>;
>  		interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>; /* low-level active IRQ at GPI=
O7_11 */

[Severity: High]
This is a pre-existing issue, but should this patch also update the PMIC
node in arch/arm/boot/dts/nxp/imx/imx53-smd.dts?

Looking at the smd device tree, it has a similar fallback configuration:

arch/arm/boot/dts/nxp/imx/imx53-smd.dts:pmic: dialog@48 {
    compatible =3D "dlg,da9053", "dlg,da9052";
    ...
}

Because the driver match tables do not contain the generic "dlg,da9053"
string, the core falls back to matching "dlg,da9052". This initializes the
driver with incorrect DA9052 regulator parameters for a DA9053 chip.

Could this expose the smd board to the same hardware risks (incorrect
voltage steps and current limits) described in the commit message? Would it
make sense to remove the fallback here as well to fully resolve the mismatch
across the imx53 boards?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902191324.2084=
035-1-Frank.Li@oss.nxp.com?part=3D1
