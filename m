Received: from mx-relay36-hz1.antispameurope.com (mx-relay36-hz1.antispameurope.com [94.100.133.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D46F32E15F
	for <imx@lists.linux.dev>; Tue, 10 Feb 2026 06:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.212
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770705847; cv=pass; b=k65A0NPe2k3qYZQYUTQKQEn/P88fW983N63v3r4EATw+75xg6vvxVResWEqPn96uvBhGdMtLydhFKEtR4ad/pb9Z0dSsXZ0LftjUQU0+S26dKqUB469/XWxZZeMMVjjTCh5fZY0CQeLcnQI1M6XZtzyJ40wM4iyf+GlBnFclbPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770705847; c=relaxed/simple;
	bh=NWfPGNpiqRcWQ8BQoJ8ZIJ8pcwpimpdiDR2t2aXA+wI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pnGBk6CqN9tHOUaHw8riJnrhA81MThX8HV6FpdWmGOs+bUWWF/d+XkquZHrBNT3IrrB40/LUz/SiHuAUhLNqjzLQtOAnCZ7wqgAMsyEXUQK/4hgSabBlE+ZvP19+rdURyR6oh8D4a7p+QQzVgTLxTO1IJ0hpFJPL8A7DnYFPMig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=XbqOQU8g; arc=pass smtp.client-ip=94.100.133.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="XbqOQU8g"
ARC-Authentication-Results: i=1; mx-gate36-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=b56rULzaQmeMuoYAaEU4xGBS2qJkvIqeuKLdirVgvFA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770705796;
 b=IyVwtXVunScNNRHVycAsslWNkADBSgQDt/pwrHpc3D/LkVS2pCWKjA2W48D4i3G/8Rx+FIVB
 XsLVhxAQzmo8tKL+3Baooo9Td1JfzdyARJ5hwxw9Mg1BMQpHmA5QvTJ2mm5wmdDXtslFoaCT/iS
 1V2E5FFQjVUJ9gJtYS/LKMc4nYuQj49mVe1byz4aXxFQ7QPe4LuBqLzVtnaCv8XZOeCMzhnuar7
 zrIO6ItEsdWUHAOANLjzR/7vAPkt0YsVQNxOqHws2ag6ZkaKgD13GmRVGIWkmWzK+daVZ01oklo
 sfpraD9seCgyX4KjCEMMcb1mbVwFoTUJEgqFqCJuoUiVw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770705796;
 b=saYQu+DaR6s1h4uQ0ydeTCgrbQX9kHNK5cNdB2aAJ0YZYoxjy+EPoTqM3Ek9CQRPT+We0R6h
 Cr8BOBID6+kC6hINAN2tWnhRrRD5V+QQfPxA7wfoo/qVJM4454g7V4YJjCWw3zEkgjUjp2VSNY4
 FDk82JnFHyzrqX626Mx92aA82fqOYD/eKP/nYMq6Hki6dTskFWLJFz4k/b0JCxb1nYi/ziqzADC
 SWXYpLvB4CUunWs0snsbUQi6jOydbbEdG09/d4BHVlqJpGwaCdbCc2OGAnPDY5+ZaUYIc+A8C1x
 Xjb748dcV+4KTrGLHFadijCYHI9G42P0MZ7WXR8EYUBzA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay36-hz1.antispameurope.com;
 Tue, 10 Feb 2026 07:43:16 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 907185A3005;
	Tue, 10 Feb 2026 07:43:05 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 Shawn Guo <shawnguo@kernel.org>, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/2] arm64: dts: imx93-tqma9352: improve eMMC pad configuration
Date: Tue, 10 Feb 2026 07:43:05 +0100
Message-ID: <5085410.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aYozeOpdHo21D8v8@lizhi-Precision-Tower-5810>
References:
 <20260209155015.267008-1-alexander.stein@ew.tq-group.com>
 <20260209155015.267008-2-alexander.stein@ew.tq-group.com>
 <aYozeOpdHo21D8v8@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay36-hz1.antispameurope.com with 4f9BpL2LgXz2HYn9
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:99e422220242feeb3b158eff7f537415
X-cloud-security:scantime:2.145
DKIM-Signature: a=rsa-sha256;
 bh=b56rULzaQmeMuoYAaEU4xGBS2qJkvIqeuKLdirVgvFA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770705795; v=1;
 b=XbqOQU8gXG6nkkVYlTgZF04Z2L2ClzJELL1tA8s1NlWq5iC1FCsPWWfS+WLV5dZaoDbpZauT
 CRQcRjez4AfIgMXCP49jioMGmDNdMhwGXOEDDxdPLTpLIO3/7fbrrbUd3dfAzRdWH5E//6wx54D
 KnWebiELuGPERSNI/Y0PW+yHVDzYhaQ6QQBC7NJ96c+G/KaYVNZFs47oKXOFNFUkJTNrfdSybif
 S7AyMdZeJJ1Ki3zmvuvuMnemAKNs/E+fyD2dTYxjAQ4N7YMMSFMTOdzIU2b96lF39A0zigLSFho
 8OzryRKrGpae8OHxAIuHXRZvXwjlhd1uKo2wOPTcfKyiw==

Hi Frank,

Am Montag, 9. Februar 2026, 20:20:24 CET schrieb Frank Li:
> On Mon, Feb 09, 2026 at 04:50:14PM +0100, Alexander Stein wrote:
> > From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> >
> > Use DSE x4 an PullUp for CMD an DAT, DSE x4 and PullDown for CLK.
> > This improves stability and detection at low temperatures under -25=B0C.
>=20
> Nit:
>=20
> Use DSE x4 an PullUp for CMD an DAT, DSE x4 and PullDown for CLK to impro=
ve
> stability and detection at low temperatures under -25=B0C.
>=20
> If you think it is okay, I can update it when apply it.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Thanks, this sounds even better. Feel free to amend it when applying.

Best regards,
Alexander

> >
> > Fixes: 0b5fdfaa8e45 ("arm64: dts: freescale: imx93-tqma9352: set SION f=
or cmd and data pad of USDHC")
> > Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  .../boot/dts/freescale/imx93-tqma9352.dtsi    | 26 +++++++++----------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/a=
rm64/boot/dts/freescale/imx93-tqma9352.dtsi
> > index 3a23e2eb9febe..ce34a296495c4 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
> > @@ -271,21 +271,21 @@ MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x106
> >  	/* enable SION for data and cmd pad due to ERR052021 */
> >  	pinctrl_usdhc1: usdhc1grp {
> >  		fsl,pins =3D <
> > -			/* PD | FSEL 3 | DSE X5 */
> > -			MX93_PAD_SD1_CLK__USDHC1_CLK		0x5be
> > +			/* PD | FSEL 3 | DSE X4 */
> > +			MX93_PAD_SD1_CLK__USDHC1_CLK		0x59e
> >  			/* HYS | FSEL 0 | no drive */
> >  			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x1000
> > -			/* HYS | FSEL 3 | X5 */
> > -			MX93_PAD_SD1_CMD__USDHC1_CMD		0x400011be
> > -			/* HYS | FSEL 3 | X4 */
> > -			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000119e
> > -			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000119e
> > -			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000119e
> > -			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000119e
> > -			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000119e
> > -			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000119e
> > -			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000119e
> > -			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000119e
> > +			/* HYS | PU | FSEL 3 | DSE X4 */
> > +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
> > +			/* HYS | PU | FSEL 3 | DSE X4 */
> > +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000139e
> > +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000139e
> > +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000139e
> > +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000139e
> > +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000139e
> > +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000139e
> > +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000139e
> > +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000139e
> >  		>;
> >  	};
> >
> > --
> > 2.43.0
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


