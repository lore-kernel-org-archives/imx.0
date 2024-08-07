Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BE919DF4B
	for <imx@lists.linux.dev>; Wed,  7 Aug 2024 06:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723011007; cv=none; b=taPwavOTitaYoH7KVNBe+eduhGZ7lJvZusVCmnn8+nVC/uNssrDGjfW7WSr9yGCnLkf3f/yWGMjcmYT9PJA7NRBPvmeQsLDwmP+mAiz6uLidEt/peKVoZNYsxvxw1juVJZ49Lm5jA/6xgXykKeIcuWic1gZmcZ+Ws90fY7V3TM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723011007; c=relaxed/simple;
	bh=xYUq4mJv1M0iJFlQw49Ia19hd83rz3/8znS2az1pk+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=psxCXF1GFSH31/a97CQ1AC8H8j+3K5OMhTetzMR/d8wXTEdTHK5NlTgfMSD6hoBKSJwp18b3Wxk3ber4v1CawY1Oc/wotpdQaXdrw6F8PX2WDnlFqEIIBVGUfmm0jVh0kLx5K5xfThXvpXxrWnV+MkQ8alrkee75d5W/Vux+Lzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=AljFx5ES; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=L5baFq61 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="AljFx5ES";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="L5baFq61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723011004; x=1754547004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ri6YVzAWj9lpW/HRkVGmES5Sunj5DDspxGsXPucqkdk=;
  b=AljFx5ESmIa5BoAoV4V6/7wsIFDhezNO4gKJrXoXvwRxmpoSSkGuefms
   SwXTOrrK23mMiFO4ReHGmESSnDpV1jevbA38dWvVbGpHlB+TefBC4U/bA
   Km9rSQkJ5C+hTjrGdkNm28BBVQO0AV7/lGizTYuILN+D01vS9ziv2O726
   ATua6PN9HhtYCv+1ytpYrRIYfvB+Bt5kGk43Mu96L+VXowKMe2eDzBq/x
   33K1hUtvbiY+QL9gPDZHueUi1n6bTaO5FFlnUPLTEQuN+kYVNOIlfl01G
   fo8T9eLFNAueS+IfALEXB0vvPIUb8cwfcU5oim+QXRFTwZXGN1Bbnp+YE
   Q==;
X-CSE-ConnectionGUID: GJUOMnAjTXGOzXlPkvTTJg==
X-CSE-MsgGUID: j8ctx7BhTm+2MgvhlHS0ig==
X-IronPort-AV: E=Sophos;i="6.09,269,1716242400"; 
   d="scan'208";a="38281790"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Aug 2024 08:09:55 +0200
X-CheckPoint: {66B30FB3-32-CFE9415D-C7159436}
X-MAIL-CPID: A584B594B3F10A6F26740B41B93F4F54_1
X-Control-Analysis: str=0001.0A782F1F.66B30FB4.0021,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5692A16362E;
	Wed,  7 Aug 2024 08:09:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723010991;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ri6YVzAWj9lpW/HRkVGmES5Sunj5DDspxGsXPucqkdk=;
	b=L5baFq617Qqdkkg5X0otVD1ulhjOxU3qcTcCuCMrXrnvCzoytJvsL0qyGyCSYVvHpm74cG
	zzLVisQRyJ4dGMx8o9Dne0hjr02x7itvXVuqLMsmMe0qGoe/U0rptYNkkjdYLSQWXDOvNQ
	oH/W3Y7KIE408X+wqxq5tHSb6jAYQFfDoKRXSnCtfZw2dqU2KqHRvLE5MY83Rl/hJUT/f2
	OvWfhElj8WiOhYdAJMCY+Th1UyxDuVqG5hslH1cJ5mvnx6dGfpl6ufmQrdAyFLpNj1JkHF
	HLWsQFkYK/Pn8CzMhqHvN6PS3ATjP6hSiKXVmgacH16BMKupURA/6c6VK65lwg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 9/9] arm64: dts: imx8mm-phygate: fix typo pinctrcl-0
Date: Wed, 07 Aug 2024 08:09:52 +0200
Message-ID: <2744927.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240805-fsl_dts_warning-v1-9-055653dd5c96@nxp.com>
References: <20240805-fsl_dts_warning-v1-0-055653dd5c96@nxp.com> <20240805-fsl_dts_warning-v1-9-055653dd5c96@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Montag, 5. August 2024, 17:49:51 CEST schrieb Frank Li:
> Fix typo pinctrcl-0 with pinctrl-0.
> Fix below warning:
>=20
> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: gpi=
o@30220000: 'pinctrl-0' is a dependency of 'pinctrl-names'
>         from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-co=
nsumer.yaml#
> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: uar=
t4_rs485_en: $nodename:0: 'uart4_rs485_en' does not match '^(hog-[0-9]+|.+-=
hog(-[0-9]+)?)$
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtso | =
2 +-
>  arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtso | =
2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-r=
s232.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs23=
2.dtso
> index f246b0ba6af29..ce197266262a5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dt=
so
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dt=
so
> @@ -22,7 +22,7 @@
> =20
>  &gpio3 {
>  	pinctrl-names =3D "default";
> -	pinctrcl-0 =3D <&pinctrl_gpio3_hog>;
> +	pinctrl-0 =3D <&pinctrl_gpio3_hog>;
> =20

I think this commit should contain a Fixes tag.

best regards,
Alexander

>  	uart4_rs485_en {
>  		gpio-hog;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-r=
s485.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs48=
5.dtso
> index 67508ca14276f..f2a7811f1b9f2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dt=
so
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dt=
so
> @@ -23,7 +23,7 @@
> =20
>  &gpio3 {
>  	pinctrl-names =3D "default";
> -	pinctrcl-0 =3D <&pinctrl_gpio3_hog>;
> +	pinctrl-0 =3D <&pinctrl_gpio3_hog>;
> =20
>  	uart4_rs485_en {
>  		gpio-hog;
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


