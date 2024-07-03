Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36BF17625B
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 12:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720010414; cv=none; b=UIuBWrvKMypXR+CoAtDKaBWa3ogiaSXpNMsXWmSV3yAdcd5wWrdc2ko24hbOFHeMuSbroWxlis/HJMJILQGWMrZQ40wqE31a3N1W86r30mJiJ5eEVGQsY4DIb6QVkV6iIOP3QNSJkwRWYa4oCpZZhC+MPlpH58t5LeuPeddbrgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720010414; c=relaxed/simple;
	bh=0GPCPm37EoYmAciWxJ5idfuRxzYihqJzPgJ+5t0DM50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HmUJImJgWEuUIiw7EzVjeCqORgJJtjmXgbpFEQI3u0Iv03r5PFQUdYfQ1NDaol1kX4rT4gZ5/o5OfCEUDmBbdumVQOw8zLArDg1W3Yh/OTFaKHs4A8Rrc9cvXwT6MCEs3Lqq5zdPB/nYRIv+OaVtVRRIGH/uWLET0tWTuPeHhco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=eSlgovHd; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=sxzwkW99 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="eSlgovHd";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="sxzwkW99"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1720010411; x=1751546411;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yaJKJYeAhHoEMcdI48sQdgF44Mpy25vdtublk4w1Jbo=;
  b=eSlgovHdd85r8Fus8oD6cKNjndXCgiXC7hC9JQTzK3DU4Zy5CyLEyWxP
   AxEsssOvVwVkQlpsrp9ZNSUuJAGOcHthxrALFoC7mPn5DZE/V67tttL2N
   qjg00s2PlvNS7JHhHqPEJ1I6F3mqTdy279WMq7wmXjVQjEqYxKUyuhKgW
   ihNgG+vSnCzShOjMK1/bUTR995Ql4o6Zq8nk+KQapNYL3x7sneYMKvInU
   PmcBtDUIIgL96O7W1MFCaIjBGQ0Jm3QD+L1rlm3INbm8rqjKWZ8yvdTDk
   2RCwsP7M9jgROiPisxqoPuj45mqMQUzdFj2O04cFzpLamzOGiz3SwkHYR
   g==;
X-CSE-ConnectionGUID: 9UPZYRXzTHKIODpoET3WIQ==
X-CSE-MsgGUID: LSZd403sSXGpb70f6J9teA==
X-IronPort-AV: E=Sophos;i="6.09,182,1716242400"; 
   d="scan'208";a="37726719"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 03 Jul 2024 14:40:08 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B799B1667B7;
	Wed,  3 Jul 2024 14:40:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1720010404;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yaJKJYeAhHoEMcdI48sQdgF44Mpy25vdtublk4w1Jbo=;
	b=sxzwkW99hIvW+/uPRqmnEiOoucdwG0lYK3v0zkYsi6DurcSxb5CdC4WMSlIlUOurankg7O
	Z4q4ghWTOySW09DxSRfAVKydEUAJQRKHP6XOR0QbDIhzfI9l3b7qQeacYSakBHmAytxqBC
	cP2vaxKIF+/gerYyGvz2dxpOQrsoDmqjP/Q2ujEk9a8ayt6gq4mDpsCPYDESEMUkpHu/Fz
	m7ke55+RQw8qrQESKcr+n0tajXZk7iAl6XCyjrSKYVTu0RcP5Pqv4tIyiq6a093dTfkdr1
	ZFhN9nKtE1Rpe1hKsLGpwkgwl3JF7y4APp/ZOZQfru4gwyS+Iun6ZIOVX7tKYw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, linux@ew.tq-group.com, Pengutronix Kernel Team <kernel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] arm64: dts: freescale: tqma9352: Fix watchdog reset
Date: Wed, 03 Jul 2024 14:40:07 +0200
Message-ID: <2197747.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240703120409.1103787-1-s.hauer@pengutronix.de>
References: <20240703120409.1103787-1-s.hauer@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Sascha,

thanks for the patch.

Am Mittwoch, 3. Juli 2024, 14:04:09 CEST schrieb Sascha Hauer:
> On the tqma9352 the board is reset through an external PMIC, so
> set the fsl,ext-reset-output property to enable triggering the
> output pin on a watchdog trigger.
>=20
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm=
64/boot/dts/freescale/imx93-tqma9352.dtsi
> index 9d2328c185c90..e9d89b4bbba04 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
> @@ -151,6 +151,7 @@ &wdog3 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_wdog>;
>  	status =3D "okay";
> +	fsl,ext-reset-output;

As Fabio mentioned, status is the last property. With that fixed:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

>  };
> =20
>  &iomuxc {
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


