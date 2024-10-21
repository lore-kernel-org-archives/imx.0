Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAEC1F1314
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 13:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729518504; cv=none; b=KuR4LIiJhSSfg4mXzsff137iLYd97LBxai1sZY0lMb/AevBRBnvkTie4iQznjRNCnLtetYslvPHhEROp3IdE1jgsJDSjoQvJmcP7OxnorlQwUsckhkpHO/dO3vPG7xRxct66luDv2brxTVb8UdepTSmpJANT+EhcqrMuB7L9WJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729518504; c=relaxed/simple;
	bh=Zv+uXFl0RQcRbDUrQN5TBTqjzzSX7jumC0m+kpAaEZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sxIfp8eKs02COVkcaYYtENKouBiofXXeunq5mfFLimkKQZreNt9MWbtBxv7jfanQC6KzrlT0ULT7evxTt0OorLy1t+rhDWAsl345/LHiNmZfEQ/L8zWbtmGFGUI/xgznnzZFIFF0MWFL7mhfg9gN8ShIWM+OAjQFkIWpiVx391g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=q0M+l5LX; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=IktmwYTY reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="q0M+l5LX";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="IktmwYTY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1729518499; x=1761054499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KEFV90NtjKhk5WP7S+oF07G1Q6k1s2xpduU//Ae0D2s=;
  b=q0M+l5LX0z4uSY1eoIeZJ+MLg5rh3oCvRELQoGnUkUhAriuUdflIW3o0
   ydlqYOLPZLhbZGRMXRLGDpLMUWEwqqNRE5DctzJlouIdgt9lT9BmR1SCC
   tWwANhTG8cNuZqp5NmXBywv2DjCwrMBEIyUzRiHC0OTTQcJod0GYFK6TQ
   FgxMCPRA2b+H7QADZGJAH6NP8X7c9UbcDqAToQ4dSFTdhdEwEGs6mM+c4
   /3xBBXMRQiitiszbr0JG9u0iUkisW6WZJJR3haXVyYRLqLnWtypyi2b2b
   ZRMyLn6On5JYZl7TVPRNRQGzX+SteWtfIdFFe+TduqQchnw+AmFYa/401
   g==;
X-CSE-ConnectionGUID: HFLFfOkzTreLiUJYWJ10yQ==
X-CSE-MsgGUID: jkaZF85fTAGn0EnQ8v2ucQ==
X-IronPort-AV: E=Sophos;i="6.11,221,1725314400"; 
   d="scan'208";a="39576079"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 21 Oct 2024 15:48:17 +0200
X-CheckPoint: {67165BA1-F-69FF9A8E-EE9CEDAF}
X-MAIL-CPID: 5835941C4BD768457DA0DE859DEFCF6C_0
X-Control-Analysis: str=0001.0A682F18.67165BA1.005B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB15D16B491;
	Mon, 21 Oct 2024 15:48:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1729518492;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KEFV90NtjKhk5WP7S+oF07G1Q6k1s2xpduU//Ae0D2s=;
	b=IktmwYTY1/ITpIkYod18GzpOJd2buw1RXiqxY5+mJQlX2WDPqs2RFxrNIHkvUc42DpYe7z
	O4u0t1at+eER5RHHvhf7NEVdLtxeE8T0Hm9F54XBQHRKOn4N9s/KHkfDldT/ftsah7Vrqo
	+j/K2fTrQGTjUr9zXs3fnTdmBAIOoFTUlSCD3AYj+vCKkbUsvfZOcOrcHy8YRSusrhKu7U
	bpY+kZ0XxF0lOuwqc7jTaWVDib/2FX3e4ilDVVWdnwR4FcdsgVOxOXIp4bXWRnJIIJdiuW
	wysouKNGijPive6QIccT6Ux/kIppJd3KMY3qOkHzG0ZQL6bGuqEwfLYJwE/SCg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: Re: [PATCH v3 1/7] arm64: dts: imx95: set max-rx-timeout-ms
Date: Mon, 21 Oct 2024 15:48:11 +0200
Message-ID: <2755523.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241012-imx95-dts-new-v3-1-edfab0054c71@nxp.com>
References: <20241012-imx95-dts-new-v3-0-edfab0054c71@nxp.com> <20241012-imx95-dts-new-v3-1-edfab0054c71@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Samstag, 12. Oktober 2024, 13:19:08 CEST schrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
>=20
> With 'max-rx-timeout-ms' property added in 'Documentation/devicetree/
> indings/firmware/arm,scmi.yaml', set the value for i.MX95.
>=20
> NXP i.MX95 SCMI Firmware designation does not allow timeout, it will not
> recover if the Agents use timeout design. So set a large value (5000ms)
> here.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index 03661e76550f4d5b8e5e706ad51d6f7620cb1dc3..9c802c2344fcfb2802e5d52c7=
62b0178a2a88ba8 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -293,6 +293,7 @@ scmi {
>  			shmem =3D <&scmi_buf0>, <&scmi_buf1>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> +			max-rx-timeout-ms =3D <5000>;

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Best regards,
Alexander
>  			scmi_devpd: protocol@11 {
>  				reg =3D <0x11>;
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


