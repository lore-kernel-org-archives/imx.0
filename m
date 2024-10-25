Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D6A1D8DF8
	for <imx@lists.linux.dev>; Fri, 25 Oct 2024 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729851292; cv=none; b=Kza8o5oiOCpDM/rICeLf5LQciYuJ9P9xpoVCfoeHTbuhFXH6RRalM18/efQU22v/Kjh3vQzpisC/nW8ciOKXXeLZHzpWqvlhQOTA1WypKNwgBMdHSPNkpUBJ78AyGD8dhaIBZpxiJTiAcuEc2dyP1IvK86CXk95JyLFIn2SKtdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729851292; c=relaxed/simple;
	bh=bnLMRIPG1uT1fyzLMtDgvyO+WWZCLslcDL7ZrN928b0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yy7Hfk2D9OBfiLr0kMSzMdLF167pi3zuds5Nfjiu0wlgd8GkaeY/Abh9dlpzQTjh0JKJkWsLQkF+btWaBUAYEHsX/Hb1fPaOKg7vwRKSQKalOtVGJJ+Z5sBhrcTR7/pf1oCevb3rjFAm4Jc0dXxbLlurZk7Wc+78oUgppx1QMaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=d/v+ddq8; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=msPGqsJP reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="d/v+ddq8";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="msPGqsJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1729851289; x=1761387289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7v6o4+naE0x6CItW5mEz8zlqR9bkW3D/RUmioNzQIUo=;
  b=d/v+ddq8zYb8mg6HuxU6IlPD40h4RY6PJ1YAQvj5+5epvmsnpPxxBMAB
   d15mywXM8UQ3bAjeRh/Nn6N1d7UyzpDkeZ4q2lf18ShaEB+9IGjRnkBpg
   UkNAfa0C9SKT4xMkAbZQBPCd/B20blvCo15URnoIWm8JtokD/6xCo4z+Y
   iSjpYtj1acwB7cLM0a0mf7Dkxlvb29aHLJfxEL9fkMfo1N0ck2xZV3Ec+
   T2/pqx1mLEvAWAWSs4PNmW8QH56rVjZPKJis79Nt7sUrVT9CmZqsPlRi8
   mrujgwcHcJvcsPM+yVP45IwYTOkekyYDf/F2k+wComr9EzqNozfZvoZPj
   w==;
X-CSE-ConnectionGUID: uabkpS4oTLKXMfXpxgMRow==
X-CSE-MsgGUID: ycQgDt52TAeJqqBfpZqJvw==
X-IronPort-AV: E=Sophos;i="6.11,231,1725314400"; 
   d="scan'208";a="39672755"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Oct 2024 12:14:46 +0200
X-CheckPoint: {671B6F96-9-21611FC3-DAD22B0C}
X-MAIL-CPID: 036AAD7BA8D7328E22C5439D9AECCE7F_4
X-Control-Analysis: str=0001.0A682F27.671B6F96.0096,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7ABE816809A;
	Fri, 25 Oct 2024 12:14:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1729851282;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7v6o4+naE0x6CItW5mEz8zlqR9bkW3D/RUmioNzQIUo=;
	b=msPGqsJPFEIgsFTBz+I8O12F2odlwZDIOd6TNNY85T1ielLBw+aVMYg6rbN6+eTcxqcTcJ
	zNhdq57uUbwYWFhTcJgpkly4eQXkHk2ciiuxATlU/sTUSb62lIOJIgAVz8wGQWJSWCQEPT
	xnI2eLf1wpdjkH6QEjIp9psQitEhEQfFsROBxSO0Ezq7ADHk3sHRwLOPoLyZ7oa/AEc/Hh
	RL3YMY9D3C7VtJNIDPwLAgG5wV+9P96Fe7Z4wBTIO7Jxy+Tx042UlwZHzW1mXjCEUAJ6/V
	9pbrtvzMFkPhvrhPxB0q9XsQnRtUQqFFdFGEpwyabs4SCzQfvzIfaNDQgk1c0w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, Fabio Estevam <festevam@denx.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: soc: imx: fsl, imx-anatop: Add additional regulators
Date: Fri, 25 Oct 2024 12:14:40 +0200
Message-ID: <3594795.iIbC2pHGDl@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241025004159.1571782-2-festevam@gmail.com>
References: <20241025004159.1571782-1-festevam@gmail.com> <20241025004159.1571782-2-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Fabio,

thanks for the patch.

Am Freitag, 25. Oktober 2024, 02:41:59 CEST schrieb Fabio Estevam:
> From: Fabio Estevam <festevam@denx.de>
>=20
> i.MX7 has the following anatop regulators: vdd1p0d and vdd1p2.
>=20
> i.MX6SX has the following anatop regulators: vddpcie.
>=20
> Add them to the allowed patternProperties.
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yam=
l b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
> index ae708a658d52..f40c157908aa 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
> @@ -44,7 +44,7 @@ properties:
>      $ref: /schemas/thermal/imx-thermal.yaml
> =20
>  patternProperties:
> -  "regulator-((1p1)|(2p5)|(3p0)|(vddcore)|(vddpu)|(vddsoc))$":
> +  "regulator-((1p1)|(2p5)|(3p0)|(vdd1p0d)|(vdd1p2)|(vddcore)|(vddpcie)|(=
vddpu)|(vddsoc))$":
>      type: object
>      unevaluatedProperties: false
>      $ref: /schemas/regulator/anatop-regulator.yaml
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


