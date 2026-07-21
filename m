Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84F3445AC3;
	Tue, 21 Jul 2026 08:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621827; cv=none; b=csJD2ByKwitlt8cAsCjEZOdaLWrTrth3uXD5/XoOEkPgfXX+fk87WhrjDbJka+N2jtS9OFkZvMjXvrsaAjvbsIY204kCEu4fLdcWB6T/opfHN4BTeQJJv/wU9js4+GYt1jmZLp+2gr6ASuJJD3gNGtd/fEPo97Y8WLs4p6JP9yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621827; c=relaxed/simple;
	bh=Mxh5rA6eMZ5HaHlazAu8CfBn2aYMqbfmWNRyDwwJNjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eqR0EPJ9fqB1vNdXnHGzzF9MuWjkzbaYHaImQtjmfZWT/eERL7KeWCcGjIgMC+J9seE7/NiJDeNAaGA3QC0YcTRsRn1d9qHSk5u4yg0WIUfFQDNF4WrRMaVsj3a85cdFZqMqrTo34eaVDvn/GloX/oBb4iDWaineMfgXBfiVrE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KM7Qc+2Y; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KM7Qc+2Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=+N5FscJywt+YqGXuLUzhGm/vFoyaAsakSzYz7zyBkkM=; b=KM7Qc+2Y2fY88mqpbZfgd0x/Fa
	4ANU8+fOSVPxZjDuMSNs9aa98/gE33fw2FPd3YM41lZh/OjooCfxZl3z70Knyv6Vl5LfwSt4cGWgH
	Ebu6Fu+WfG9kociLblneNsXzqxSvnkf/z84A87nq61i7h7OlaLFxcZHpidTV5dkhgQSUNT4f+aXP8
	4LIzmq+jpZ0Y0LztV+0t+yUb8aqgfUzDEdv/qi9SrQ4OPmxqV4fxbyTLtNeIJvrdexVe3r41hpefw
	JDtyWqAC3GQD81Re3RNmsnWpj2fSICN9klBadgPQEJLV5PP+vj6K2vTPaLcOQUkMSkEnwO7KiesWe
	G+7A5UIA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wm5D8-000OWD-1X;
	Tue, 21 Jul 2026 09:48:18 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wm5D7-000OyO-1Y;
	Tue, 21 Jul 2026 09:48:18 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Frank.Li@oss.nxp.com
Subject:
 Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu information
Date: Tue, 21 Jul 2026 09:48:16 +0200
Message-ID: <2844770.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
References:
 <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28067/Tue Jul 21 08:23:56 2026)

Hi Frank,

Am Montag, 20. Juli 2026, 23:10:33 CEST schrieb Frank.Li@oss.nxp.com:
> From: Frank Li <Frank.Li@nxp.com>
>=20
> Add usbotg3 iommu information.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm=
64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> index ccf9f510e0f88..1370a571153a5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> @@ -32,3 +32,7 @@ &usdhc3 {
>  	compatible =3D "fsl,imx8qm-usdhc", "fsl,imx8qxp-usdhc", "fsl,imx7d-usdh=
c";
>  	iommus =3D <&smmu 0x11 0x7f80>;
>  };
> +
> +&usbotg3_cdns3 {
> +	iommus =3D <&smmu 0x4 0x7f80>;

Where in the RM can you get these values?

Thanks and best regards,
Alexander

> +};
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


