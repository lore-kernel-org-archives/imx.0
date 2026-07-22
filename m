Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835543ACA5D;
	Wed, 22 Jul 2026 11:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718682; cv=none; b=O7XljMuBVrdxtnjF5Y8NLk+i59dc30iu41+pgiIeeflqY4pKD+yt6W2JnCloWVSzr4Eg+Tm6HyN32Jzz1+qTOeyLCsiazVoLsA12dCzFl80GrRdfpnwDgLHU9YhwX51nWhaqqUoUn5atmTqavkGbyDico0UFBNT9Kh7DsifPSGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718682; c=relaxed/simple;
	bh=P89HSlZ1ehh6FK6tz3OeP73u8sJMdVoydfy5NBebVUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JPPT/g4CpN9UWyQLe3Pg6T+6QweND9b6y64gsO6lGGXSQeZfkzgYQr3VjceMixuhw9SDifhWh9Ic2KVDfStZoLxOCaXfEJvCb5UNibjaGmYxyc1V7Q6+qrV16Pp9Up2/C1tShRpflLKeJsiRrbwBBmLpHjEs6h0miq/4QSludfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=I7Eu4Mj0; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="I7Eu4Mj0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=dTfIheDloNnyvS/07ptSkTa3ttkId0J9LRZYffRoniY=; b=I7Eu4Mj00fcEEwtilBdFXLATzc
	HGvVi1aRIu9gF405VHJS/J/977VV08+LQp5HWAsIYeuRgz+ogez6HTGpe0WLt1hXG2ozrgTy2Rr+o
	YjpZhiwznBJIBljz0BCeZ9WWSxfr9Ke7tHQs+hefezEYNaJKbckgq/ywtDbrDhbA+Q4cFkub6zqmM
	R6wfN2VvwFGflfeKTlFOXg6hM8WCvfQHGWhYMvMhvU2xIHuy22IZ12kS1jIGPN+XHJkQfJWID3AM3
	QIymGSmu91N2clLXbSGNXo/cQfzFJxswCqZPWhBp6C/TZM9aRI6gUK9T7y6i6Ddp2Rc9mLv4u4BOE
	MEr65I4w==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wmUr1-000JLh-2p;
	Wed, 22 Jul 2026 13:11:11 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wmUr0-000K96-3A;
	Wed, 22 Jul 2026 13:11:11 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8qm-ss-dma: add LPUART4
Date: Wed, 22 Jul 2026 13:11:10 +0200
Message-ID: <3426538.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260722104200.17729-1-stefano.r@variscite.com>
References: <20260722104200.17729-1-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28068/Wed Jul 22 08:24:50 2026)

Hi Stefano,

Am Mittwoch, 22. Juli 2026, 12:42:00 CEST schrieb Stefano Radaelli:
> From: Stefano Radaelli <stefano.r@variscite.com>
>=20
> Add the missing LPUART4 node to the i.MX8QM DMA subsystem description.
>=20
> The peripheral is present in the SoC and its LPCG clock controller is
> already described, but the UART device node is currently missing.
> Describe its registers, interrupt, clocks, power domain and eDMA
> channels based on the NXP downstream device tree.
>=20
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

Commit d879cc948e6f7 ("arm64: dts: imx8qm-ss-dma: add lpuart4 node") landed
in next-20260721, which is essentially the same patch.

Best regards,
Alexander

> ---
>  arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi b/arch/arm6=
4/boot/dts/freescale/imx8qm-ss-dma.dtsi
> index 974e193f8dcb..25c5e4423163 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> @@ -8,6 +8,22 @@
>  /delete-node/ &adma_pwm_lpcg;
> =20
>  &dma_subsys {
> +	lpuart4: serial@5a0a0000 {
> +		compatible =3D "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> +		reg =3D <0x5a0a0000 0x1000>;
> +		interrupts =3D <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-parent =3D <&gic>;
> +		clocks =3D <&uart4_lpcg 1>, <&uart4_lpcg 0>;
> +		clock-names =3D "ipg", "baud";
> +		assigned-clocks =3D <&clk IMX_SC_R_UART_4 IMX_SC_PM_CLK_PER>;
> +		assigned-clock-rates =3D <80000000>;
> +		power-domains =3D <&pd IMX_SC_R_UART_4>;
> +		dma-names =3D "rx","tx";
> +		dmas =3D <&edma2 20 0 1>,
> +		       <&edma2 21 0 0>;
> +		status =3D "disabled";
> +	};
> +
>  	uart4_lpcg: clock-controller@5a4a0000 {
>  		compatible =3D "fsl,imx8qxp-lpcg";
>  		reg =3D <0x5a4a0000 0x10000>;
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


