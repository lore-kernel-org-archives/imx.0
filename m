Received: from mx-relay106-hz1.antispameurope.com (mx-relay106-hz1.antispameurope.com [94.100.133.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12903396E4
	for <imx@lists.linux.dev>; Tue, 11 Nov 2025 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762856047; cv=pass; b=E6GgD6YknPGoTudeVOq4oqi963hYg3oXb+FBvaPyXf7f7IqRkEgeStaDjq8vac5vIVFwe5YKUVnXWUFInk9bnc2CBv4stwLzQktqkhayEW1jypII/qir8T1uGfyqJjcRU5rI1rYl9jztzMIvzPTedJKBsR/baik7+pFYXR3uQA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762856047; c=relaxed/simple;
	bh=qffjGVKHGKbLT2g/i1slYDW6JONYYo+k1+ICy3WTD/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cvnewCzJKvuSVnwjhcgfNXfF7omEDSslwQSSz9PFiCwWPJ3uE4YeOw+uIZpN/mIzTuBfhtkvXlMZ1gfRGnHguj5gdi0XX1dlqrjHXsg2h1LjDHljPnzBdJt8h/3+CYdsGIUYo1r7/Mti/fwJozE8zuqUxYXNTRD84JDbBtxf0b4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=dJH4VTxY; arc=pass smtp.client-ip=94.100.133.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="dJH4VTxY"
ARC-Authentication-Results: i=1; mx-gate106-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=5cd8tiR4oA2bomVQnghj6XdfSPPBJKKlunliO1VnFlM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1762856016;
 b=J5uOrn/2y+ORo332OvrqjXaAzE9FvomM6/ZGsm6fhJTGVskVgCspFsnePvKuFo1/mfhnf91z
 gL8HK+nl1HC+FB1ZHWGHXclBctxF9Fi5Yrs+KZWcGhtIbYTHvtadaLm/8WPV4kK8jfGMqIKIpJx
 fKak98rVr6RDjk6WMjyzvEmxaHtgcQumIbklLGkoA2uWPnJxI8JIKeGfA2KnGxoakMzVSSjRi+g
 DNk2U2sq7lP647rHbDN6aaNI3yFVV6qgav2TSgc094c22/Cp5ETf4C9LOgH9xu/Ez4CWQfsC7Za
 9qMrkppVCzO5wkgp/57BaFLWAtzD9/SH6WkIX85dVJ/bA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1762856016;
 b=n0nIdcEJlkTBkcxkSaGBT51hYehP5aiM6v1Xk57HP38FnEEUnFHLRcfkmGnloNhBbuHeiF9G
 K2xL364LDgghVr6D1uPMDnaTJNeAoOodtj5QxdTOZJH+oP8T85bv/XPbIpnF20Ifk2H6J2l91ta
 AUdzcQ6Ill2Ag/mdmI4a9WMH+0eKQJyUsO1Qw5Tyt05BuuSvJhWatO/KK9dAZHQRQhjO6QD58Jt
 Dq/9dKvKV+6h4OSwxMvcloX+RA2VFG9dsH6vyXs5yaXmqPdP8TWFoYgYYhQ+2rlaVLheF1/qOy4
 zGO3N72BamW0TO9mTH3q3SxdlkGnH207XknsqhF3qslMw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay106-hz1.antispameurope.com;
 Tue, 11 Nov 2025 11:13:36 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 3B9AC220C9E;
	Tue, 11 Nov 2025 11:13:26 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
 Li Jun <jun.li@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 4/9] arm64: dts: imx8mm-evk: add wakeup-source for usb phy
Date: Tue, 11 Nov 2025 11:13:25 +0100
Message-ID: <2809731.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251110-misc_dts-v1-4-7564b9f69a18@nxp.com>
References:
 <20251110-misc_dts-v1-0-7564b9f69a18@nxp.com>
 <20251110-misc_dts-v1-4-7564b9f69a18@nxp.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay106-hz1.antispameurope.com with 108FA11C9E97
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:98cd9670ad177dc9a441365add1c322b
X-cloud-security:scantime:1.834
DKIM-Signature: a=rsa-sha256;
 bh=5cd8tiR4oA2bomVQnghj6XdfSPPBJKKlunliO1VnFlM=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1762856015; v=1;
 b=dJH4VTxY80wkBmZfEW53/+B0nYGF19k9hIuLKTIwYVyxYw+AqNEVdwE7weinHfVumxm4F1sF
 Q37K/x7thEuDus5z2SrdKxBSDPyaG5ZaNIA08oa2uqIvkw7dyDPRt7IuueBpj9xHAEvCD+d8C+1
 cgRmR+RuKWkQLiXiacQrQidIuXvXPtt4FNjNW4nz2Hz/NIqcgU6yAVkigM6P3bxoizX2dZ8XFrD
 YXBi07YauxZadXPc1BLcb17LM+Zoqs9a9pOgJMVvhHjY0OElOziofeg8B3FIPSHj5vGideAm3/w
 MX1mWR9drXy0u91k5p4yKk3RB+YLlxxpSoU0bEvGKSLnw==

Am Montag, 10. November 2025, 21:54:44 CET schrieb Frank Li:
> From: Li Jun <jun.li@nxp.com>
>=20
> USB phy can be wakeup source to support wakeup system from USB.
>=20
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Typo in subject: Just imx8mm. Remove the '-evk'

Best regards,
Alexander

> ---
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mm.dtsi
> index ed8b4843acb4804379ba025e83a63fe962c2937e..dfff164db827e80ef8822ae33=
0fa604d1642f6f9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -274,6 +274,7 @@ usbphynop1: usbphynop1 {
>  		assigned-clock-parents =3D <&clk IMX8MM_SYS_PLL1_100M>;
>  		clock-names =3D "main_clk";
>  		power-domains =3D <&pgc_otg1>;
> +		wakeup-source;
>  	};
> =20
>  	usbphynop2: usbphynop2 {
> @@ -284,6 +285,7 @@ usbphynop2: usbphynop2 {
>  		assigned-clock-parents =3D <&clk IMX8MM_SYS_PLL1_100M>;
>  		clock-names =3D "main_clk";
>  		power-domains =3D <&pgc_otg2>;
> +		wakeup-source;
>  	};
> =20
>  	soc: soc@0 {
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


