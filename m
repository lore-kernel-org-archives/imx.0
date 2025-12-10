Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DCD28B4FD
	for <imx@lists.linux.dev>; Wed, 10 Dec 2025 07:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765350350; cv=none; b=lbVUaBLq7Rjpo39FfGjw1X+mRuludsaQN3VXp/llahGba0UjEUJh44nfSZgcmtjmqjciJ3+T+RJloD3h/0wvIEt3dQqFIspXx/4ixNlrsWABB9SSHVUnMhzRUAp788uQeGfMcSwMijo6BCd3QSncx8tUtyul4/dxmglEdPQmkN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765350350; c=relaxed/simple;
	bh=YZLcoFMXLBcEYHMmjWWhjoSlxo9d9gn6ZRL7IPhVDn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbXYXHlDpsQ0+BG8fQ6VCPdWjWpRK6hScEY9nws+yFa9oMbAEWkP/0jzBkU1WvOCbhIO+nSpvldS5fKTeo7TkDMm3k7NR4ea5aV8tI9371ohOyhrP2WdBSuClJivrRcw4rChnja6pXdQKsMq1Ljf8aJVVdRuEZswoPK3GT1hQvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 92077201642;
	Wed, 10 Dec 2025 08:05:46 +0100 (CET)
Received: from usswic1srsp001v.us-swic1.nxp.com (unknown [10.114.8.222])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 60BCC201631;
	Wed, 10 Dec 2025 08:05:46 +0100 (CET)
Received: from lsvm07u0000156.swis.us-west-2.aws.nxp.com (lsvm07u0000156.swis.us-west-2.aws.nxp.com [10.45.140.59])
	by usswic1srsp001v.us-swic1.nxp.com (Postfix) with ESMTP id 4AE51180030F;
	Tue,  9 Dec 2025 23:05:45 -0800 (PST)
Date: Tue, 9 Dec 2025 23:05:44 -0800
From: Lei Xu <lei.xu@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
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
Message-ID: <aTkbyAHjrwzTsfO8@lsvm07u0000156.swis.us-west-2.aws.nxp.com>
References: <20251207-127-v1-0-5a2eeb69f150@nxp.com>
 <20251207-127-v1-2-5a2eeb69f150@nxp.com>
 <20251208065707.GA15128@francesco-nb>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208065707.GA15128@francesco-nb>
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Dec 08, 2025 at 07:57:07AM +0100, Francesco Dolcini wrote:
> Hello Lei,
> 
> On Sun, Dec 07, 2025 at 05:26:06AM -0800, Lei Xu wrote:
> > The i.MX95 15x15 FRDM board is a compact and cost-effective development
> > platform based on the i.MX95 applications processor.
> 
> ...
> 
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> > new file mode 100644
> > index 000000000000..61e815c858b8
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> 
> ...
> 
> > +
> > +/* Default settings in i.mx95.dtsi are for i.MX95 19x19 package.
> > + * Override here for the i.MX95 15x15 package.
> > + */
> > +&netc_bus0 {
> > +	msi-map = <0x0 &its 0x60 0x1>,	//ENETC0 PF
> > +		  <0x10 &its 0x61 0x1>, //ENETC0 VF0
> > +		  <0x20 &its 0x62 0x1>, //ENETC0 VF1
> > +		  <0x40 &its 0x63 0x1>, //ENETC1 PF
> > +		  <0x50 &its 0x65 0x1>, //ENETC1 VF0
> > +		  <0x60 &its 0x66 0x1>, //ENETC1 VF1
> > +		  <0x80 &its 0x64 0x1>, //ENETC2 PF
> > +		  <0xc0 &its 0x67 0x1>; //NETC Timer
> > +	iommu-map = <0x0 &smmu 0x20 0x1>,
> > +		    <0x10 &smmu 0x21 0x1>,
> > +		    <0x20 &smmu 0x22 0x1>,
> > +		    <0x40 &smmu 0x23 0x1>,
> > +		    <0x50 &smmu 0x25 0x1>,
> > +		    <0x60 &smmu 0x26 0x1>,
> > +		    <0x80 &smmu 0x24 0x1>,
> > +		    <0xc0 &smmu 0x27 0x1>;
> > +};
> 
> If the 19x19 and 15x15 i.MX95 requires something different you should
> have a different soc dtsi. Probably creating a new imx95-$something
> dtsi, that includes the existing imx95.dtsi and override this property.
> 
> This solution does not scale, please fix it.
> 
> Francesco
>

Hello, Francesco

The original comment is misleading because this configuration applies to the board rather than the SoC.
Therefore, update the comment as follows:
/*
 * Configure PCIe MSI and IOMMU mappings specific
 * to the i.MX95 15x15 FRDM board.
 */

Does this look acceptable to you? Thank you.

Lei
