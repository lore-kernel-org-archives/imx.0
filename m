Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4499E1DFFB;
	Mon, 14 Sep 2026 03:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789356582; cv=none; b=Et/Ws4/2Ykq3djOUZZVqncwQZTLoyuPz/OvIU0Uc1awde9+ri4l2d4aGaYOi1Ydm6H1XFkjOQBrqTt2eQJMMLKeiKVcVDQSng7n9+FXQOrQJTTVXSc8fbfUFyS4qkOPsefWg56SUE55H3TFcAurM039OwJHFZQM3uW/5l+ZQveA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789356582; c=relaxed/simple;
	bh=OgRYnskRSXcQGXmFXdSfwMqCUHXv6d01XoMry68YySM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gx9fuiGiDkHryNfG5whhSZZrr/oysNk5beVIVd5ouEg7pJfrpgzyzWokCTZhaayLEjhosdY1AhrH7mkbso4dHw/Fi+ptms3tJVz6bJ1MqqA28GRipuNTcHdVfW4hg9gDoiiorGRlt3k17iHM5lzU9y550jrbp3A1XswSQYfaw84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4KTcb2e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4KTcb2e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A54E1F000FF;
	Mon, 14 Sep 2026 03:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789356580;
	bh=XISYk5QwMdZqbWtmBK3jBSsBiP6RCYu78or/sAONXZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H4KTcb2e/4OaRPCBMbWlWOJ3ROJieyRI2Vky2ij+pORE4WPqWwYP8EIqTQ/RxpIVc
	 4ev+MjM38BTcNxoWk96+dC1VswhNavVxIKrOONJDlP5KKPkhJmxZ3bVIzGh17YJ4RT
	 fRP9dPtxpBB02Zgbh/eU5rTz/fj/u5TnCuEHIe25iMaoxMSIFtIwTd4yucnkDUwDH/
	 gJwNma02VrnAWsHb0fGfpPV5skPrIF5WmT9em9iD0TaYvgEgwBx/cfu6OYJUyh10cZ
	 EUcI756HZMDHJIigBDUbF0sDS6nP26vBSxbXBzWjD3TNFiq1t/gx0KiBt3o/hBA6Ls
	 +f6vp3DRepMzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: imx93-evk/qsb: add rtc1 alias for
 external PCF2131 RTC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joy Zou" <joy.zou@oss.nxp.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260914-b4_imx91_93_rtc-v1-2-daed1cba0714@oss.nxp.com>
References: <20260914-b4_imx91_93_rtc-v1-0-daed1cba0714@oss.nxp.com>
 <20260914-b4_imx91_93_rtc-v1-2-daed1cba0714@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 03:29:40 +0000
Message-Id: <20260914032940.7A54E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but several other NX=
P boards with multiple RTCs lack explicit RTC aliases, leading to the exact=
 same unpredictable /dev/rtcN numbering that this patch fixes.
--

commit 3914a89ee5c45116b8135c7ac05a01b772cb8462
Author: Joy Zou <joy.zou@oss.nxp.com>

arm64: dts: imx93-evk/qsb: add rtc1 alias for external PCF2131 RTC

This commit fixes unpredictable /dev/rtcN numbering for imx93 boards by add=
ing
an explicit rtc1 alias.

> Only rtc0 was aliased to bbnsm_rtc, while the external pcf2131 had
> no fixed index. When both drivers are modules, the pcf2131 may register
> first and take rtc0, pushing bbnsm_rtc to rtc1. Since suspend/resume
> wakeup relies on the internal bbnsm RTC at rtc0, this broke wakeup.
>=20
> Add rtc1 alias for the pcf2131 on imx93-11x11-evk and imx93-9x9-qsb,
> so it keeps a fixed index while bbnsm_rtc stays rtc0.

[Severity: High]
This isn't a bug introduced by this patch, but several other NXP boards with
multiple RTCs lack explicit RTC aliases, leading to the exact same
unpredictable /dev/rtcN numbering that this patch fixes.

For example, in arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.d=
ts:

	rtc@53 {
		compatible =3D "nxp,pcf2131";

This board defines multiple RTCs (pcf2129 and pcf2131) without aliases,
leaving them susceptible to the same index race condition.

In arch/arm64/boot/dts/freescale/imx8mp-navqp.dts:

	rtc@53 {
		compatible =3D "nxp,pcf2131";

This board defines an external RTC alongside the SoC's internal snvs_rtc
without any aliases, causing unpredictable index assignment.

In arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts:

	rtc@51 {
				compatible =3D "nxp,pcf2129";

This board defines multiple external RTCs without a complete set of aliases,
leading to unpredictable rtc0/rtc2 index assignment.

A race condition between module probes will swap these indices unpredictabl=
y,
which can break system time initialization (since CONFIG_RTC_HCTOSYS_DEVICE
defaults to rtc0) or suspend/resume wakeup functionality.

Could these other boards also be updated with explicit RTC aliases to preve=
nt
the same issue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-b4_imx91_9=
3_rtc-v1-0-daed1cba0714@oss.nxp.com?part=3D2
