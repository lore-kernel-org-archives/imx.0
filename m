Received: from mx-relay93-hz2.antispameurope.com (mx-relay93-hz2.antispameurope.com [94.100.136.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A039C335070
	for <imx@lists.linux.dev>; Fri, 21 Nov 2025 07:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763710088; cv=pass; b=IelhLdV4j9ieED3tZY02EvAHQGbGNtfaNwUncwNmvUa5z04AmRbuRtFQmzefveBW+tHMmHBlcsuk0UiybiLXyQyC3lrM+zxpn53MihQ3UDuIZaMS8BjV6QLOcCMghAUdtggMEMrhcNDX5sfGgEtoR9aZTam7Rq8DIkFiCHNRSJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763710088; c=relaxed/simple;
	bh=3CYrzkvpc6C4K/ggFYCTbZT39JFV+8mm7/9zk72d7ZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gQOXePD0PI05lheHtHwLLCy1X9bETz1aNLYt17KMAkoFYpnyc9j/XQsAffKSf01yjkyWS0iKpq20SSVakHJKc8795Nt/+wfsjEwaLKFEUm2Woe6XsapMs0njMl4vwzx2McEs2uan/aRr1IOorf8l5DaMphZnT0ES2QtoldJDpp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=CMm3vewu; arc=pass smtp.client-ip=94.100.136.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="CMm3vewu"
ARC-Authentication-Results: i=1; mx-gate93-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=k3tJvLsA3nwHU5DlF+mbLwpZA3aTkQK4IJeCwZ9snx8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763710027;
 b=euvMBvBL7x44myOXPAgSTT38GDNkbFK/a/ui/AHqmwf6aIr7lT1gigALlWOxXACypwlNcrLG
 Eb6WpCcMm2y5OgFzfPvEGYeegmy1lIDx6c2Y+I+vTKwSa9w41MxrUytVEOUgsIvHUeuVwJg+rBM
 a3SzLq/N11Dhf8FyejWQCTQM5Yb3wfmAGtHfrdrvct8SXgbwz2EVYa3b0ByMl6OBkaOOOrDm3iM
 oXPba1xKJj/Fg4juEcTN1iwMLU/P6eWYuZ8DIMNBrMhTXIGQeaWW+acecPGWtJz2f+1FeHUw22V
 ioQmJlhahWPcmpmfrNbiF6wdXROvZVhezO9F2+iGCsJqw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763710027;
 b=OjVZzOjczsPBuJAcQPNxDTMBrMHTqV/9KHwM3n1FTkwU8YRklY3vsYYE1gpu72KstTENd/D2
 In0wM8Yx1WRDnCkUkIpVR62OmHVSUaE8ifl8FBPim7H/foKC0qWdQIX9KyydWXueZt0xWm4NPZk
 k43iQUjziNiTRi5HXGKQRkTt4shIE3Bro6YVw7v5lkB7vdyKsQGd5goWUjb7wjOcFE3XfCZsg25
 rsE39scd8dRg3ELAxe4aei3v2gIBnpjEjbt8+vR35PMYs5l6u/rpFSA6Yar3amTuJ2pCYG0KBgj
 ZBbrodzAsDJlUrmJZp8CgozdOghC9oFcBlfNrAcdVMOtA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay93-hz2.antispameurope.com;
 Fri, 21 Nov 2025 08:27:07 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D12E6CC0CB7;
	Fri, 21 Nov 2025 08:26:55 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject:
 Re: [PATCH 1/1] arm64: dts: mba8xx: replace 0 with IMX_LPCG_CLK_0 for lpcg
 indices
Date: Fri, 21 Nov 2025 08:26:54 +0100
Message-ID: <6219606.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251120214318.347483-1-Frank.Li@nxp.com>
References: <20251120214318.347483-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5062970.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-body-digest:85f9472f373959296694e824be05722c
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay93-hz2.antispameurope.com with 4dCRcJ4FP5z4QZkv
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:89040410fe253a30377afa8de9f8e326
X-cloud-security:scantime:2.154
DKIM-Signature: a=rsa-sha256;
 bh=k3tJvLsA3nwHU5DlF+mbLwpZA3aTkQK4IJeCwZ9snx8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763710026; v=1;
 b=CMm3vewuhe7Cx42CZ4c4IIiDN1qMCpqoBGRBL3g01DitDyszSam19O67aL+2EsdNTenTA7ce
 R1OWMhsj0y2IrXn6/ABnnWWO5zEfRthj62/uJNOUhD222tq0LeXs8QUCTrvanOfiJTxp33RkOSj
 57X9OmiM1uWrudOGb9Al7sAEzkNLlxtg2g8+zdRwVxXDSuykwo7bhUKS5KL8vHrbsbHy7Wod1e0
 H8r1ftSskBfmg/28bBVgzQHydgU/Q0qvJD4VfN9u4I2p2+bHCCn1FsICTaXbBiZ8W6OKgMKue0O
 1v3PFKwyADIeMV4uKiqjDTucPiADX3Rpv3XgVaZ/xSxag==

--nextPart5062970.31r3eYUQgx
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev
Date: Fri, 21 Nov 2025 08:26:54 +0100
Message-ID: <6219606.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251120214318.347483-1-Frank.Li@nxp.com>
References: <20251120214318.347483-1-Frank.Li@nxp.com>
MIME-Version: 1.0

Hi Frank,

Am Donnerstag, 20. November 2025, 22:43:18 CET schrieb Frank Li:
> Replace the 0 with IMX_LPCG_CLK_0 for LPCG clock indices. Although the
> numerical value is identical, the LPCG input is defined as
> IMX_LPCG_CLK_<n>, so using the symbolic constant improves clarity and
> consistency with the LPCG clock naming convention.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Thanks!
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm64/boot/dts/freescale/mba8xx.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/mba8xx.dtsi b/arch/arm64/boot/=
dts/freescale/mba8xx.dtsi
> index c4b5663949ade..78f5dfdc5cc8a 100644
> --- a/arch/arm64/boot/dts/freescale/mba8xx.dtsi
> +++ b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
> @@ -225,7 +225,7 @@ &i2c1 {
>  	tlv320aic3x04: audio-codec@18 {
>  		compatible =3D "ti,tlv320aic32x4";
>  		reg =3D <0x18>;
> -		clocks =3D <&mclkout0_lpcg 0>;
> +		clocks =3D <&mclkout0_lpcg IMX_LPCG_CLK_0>;
>  		clock-names =3D "mclk";
>  		iov-supply =3D <&reg_1v8>;
>  		ldoin-supply =3D <&reg_3v3>;
> @@ -336,7 +336,7 @@ &sai1 {
>  	assigned-clocks =3D <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
>  			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
>  			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> -			  <&sai1_lpcg 0>;
> +			  <&sai1_lpcg IMX_LPCG_CLK_0>;
>  	assigned-clock-rates =3D <786432000>, <49152000>, <12288000>, <49152000=
>;
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_sai1>;
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart5062970.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmkgFD4ACgkQaS+g2M0Z
/iUgUggAtEtgpzATuowAJMkBiof/iitCR7c15FBQ+YaxX5BIvfh29ytr6z25ak3Z
UJhAW2KamHXI21LGIDS6C2VFxJGmNhaZcN89VlEnVoy5IBbqvbWp+2wrWHrPfE67
xm7D/JZh0U04dJOqNbVIoe+SyxGfToEV3BAI3diSkHSmivdHyqVDxWyhdCWp+FR6
ktG4DKP/YNXjzqzNLP+LsSrkbUQqbY45jOjkgL26UlzZVXUmPvm8asTvCrPfUfsf
plaF4ynO9tbyjzEo5ubwFn7F2ynIvdHfJdHjSRJBoseWuVNVTfspue+Tu+Fp1JU3
B3qWpQZXo05V4YjY+JLZpW8BC7gY2A==
=vWvp
-----END PGP SIGNATURE-----

--nextPart5062970.31r3eYUQgx--



