Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F0B19F12A
	for <imx@lists.linux.dev>; Mon,  8 Dec 2025 06:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765177044; cv=none; b=gppEZ8lphv+5Sy2S+TFkCZr6YdB4m95WBaD2VEwDDgyLtnZG84OVgyU+Ph3wGKWffrah+J5oEyM/KmyH9NgNbKELe6j81LYaWSUkjFRf1WpSG5X52h2HhcIagH7rMv+fqlAd/KU/Mj9hm0whgrGSxdF4AeNkEfwipXGCHxsk76k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765177044; c=relaxed/simple;
	bh=GhPXslAU7nuFcLZ9A8dfLObHrQelf+e80NaGtfASJkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0YZKBcZvl1maCpVWF/N4poBYtz9031uRt+1U+c6ESOERr+1OzhX1RGAymfc1oUQBxAalRvoY9pzSx9ohA2VHKhoefGUEe/r7kFEfV9cmEvVRQd+NdhChcQTp8BMet1N8EdcAX60ehoNwzyXENwyPXfexlkW3ejkDw4CXGGMe1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=zgJzcTGL; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="zgJzcTGL"
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 84B151F8F8;
	Mon,  8 Dec 2025 07:57:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1765177032;
	bh=WzX89WI9Ff7+y2yfQZHdLK5k0mjF3N3JjQBBoJ3ILK4=; h=From:To:Subject;
	b=zgJzcTGL5tlXkskmwXlB1xUVgYPCvSlP0O/3wsmiwTWz0B1RTyXxJn8qElFiAm994
	 R0RmzoWWgBaRHXM6QYcX1KQ4GquDzhxnIF8wu6kdGJsTomo/prXF2EMMJthDrbSKfg
	 l0fX+e8sYmOPCa78DB9vuwDpi86rxcQvUm5e+se6+MiRIoQRumvJNcgreMZcAAYn01
	 WRRvDTH3KFXE5i4Y/fqoqBpq3KOaPiO8ID6DA+GyGvA8m0adp5ntExywaVgNhroCJT
	 AP5k0xcfhYog2fvVFeQpl2belm9ytzMnICieNL/opEMSoglcCKnJbIRAwhnKet6P0g
	 RPbVosspb9muA==
Date: Mon, 8 Dec 2025 07:57:07 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Lei Xu <lei.xu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, justin.jiang@nxp.com,
	qijian.guo@nxp.com
Subject: Re: [PATCH 2/2] arm64: dts: freescale: imx95: Add support for i.MX95
 15x15 FRDM board
Message-ID: <20251208065707.GA15128@francesco-nb>
References: <20251207-127-v1-0-5a2eeb69f150@nxp.com>
 <20251207-127-v1-2-5a2eeb69f150@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251207-127-v1-2-5a2eeb69f150@nxp.com>

Hello Lei,

On Sun, Dec 07, 2025 at 05:26:06AM -0800, Lei Xu wrote:
> The i.MX95 15x15 FRDM board is a compact and cost-effective development
> platform based on the i.MX95 applications processor.

...

> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> new file mode 100644
> index 000000000000..61e815c858b8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts

...

> +
> +/* Default settings in i.mx95.dtsi are for i.MX95 19x19 package.
> + * Override here for the i.MX95 15x15 package.
> + */
> +&netc_bus0 {
> +	msi-map = <0x0 &its 0x60 0x1>,	//ENETC0 PF
> +		  <0x10 &its 0x61 0x1>, //ENETC0 VF0
> +		  <0x20 &its 0x62 0x1>, //ENETC0 VF1
> +		  <0x40 &its 0x63 0x1>, //ENETC1 PF
> +		  <0x50 &its 0x65 0x1>, //ENETC1 VF0
> +		  <0x60 &its 0x66 0x1>, //ENETC1 VF1
> +		  <0x80 &its 0x64 0x1>, //ENETC2 PF
> +		  <0xc0 &its 0x67 0x1>; //NETC Timer
> +	iommu-map = <0x0 &smmu 0x20 0x1>,
> +		    <0x10 &smmu 0x21 0x1>,
> +		    <0x20 &smmu 0x22 0x1>,
> +		    <0x40 &smmu 0x23 0x1>,
> +		    <0x50 &smmu 0x25 0x1>,
> +		    <0x60 &smmu 0x26 0x1>,
> +		    <0x80 &smmu 0x24 0x1>,
> +		    <0xc0 &smmu 0x27 0x1>;
> +};

If the 19x19 and 15x15 i.MX95 requires something different you should
have a different soc dtsi. Probably creating a new imx95-$something
dtsi, that includes the existing imx95.dtsi and override this property.

This solution does not scale, please fix it.

Francesco

