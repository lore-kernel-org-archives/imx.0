Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC7521C9FD
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 02:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770861613; cv=none; b=ZWuI19twznSY7qvNru3gjeksfQsloSirluj/rIrUtWw+dxorkM+3hRc4miS/DSwngyaqdqAC8HZB+Iz9/7jIoyvfsf58K52T8q0gtGg671gQx0ilrUF1jBz4EtYYd4Tq1Y4YQIRK6cduK91H06BrXP8C23E1k0KYcLNVEUnyb9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770861613; c=relaxed/simple;
	bh=9Hfuc/vKvRrkThn7QkY+ItxYwq9nRWDErBATEx9hJG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHIYB56hTBVVxLiYRZY1KHddBt7JOQdQJ6QyMnkfsHLI+3uqcxgr59fj+1ZJUOjB7hnqP9EIxk223pjkTFD86k78SG2NTOVVfm37N8acVVRjnMCaE+7Lka/Y6WXBSotDWhwf2E44xa/spe2f/d3a8bVWFsYIkWR/PYjSscneAeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F04C2202EB3;
	Thu, 12 Feb 2026 03:00:03 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C0C4A202EAF;
	Thu, 12 Feb 2026 03:00:03 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 7BAF0180007B;
	Thu, 12 Feb 2026 10:00:01 +0800 (+08)
Date: Thu, 12 Feb 2026 11:00:00 +0900
From: Yanan Yang <yanan.yang@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Joseph Guo <qijian.guo@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, justin.jiang@nxp.com,
	Lei Xu <lei.xu@nxp.com>, Xiaofeng Wei <xiaofeng.wei@nxp.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
Message-ID: <aY00IISQGY8LmYOe@lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com>
References: <20260210-imx91s-frdm-v5-0-b3e9a67d2285@nxp.com>
 <20260210-imx91s-frdm-v5-2-b3e9a67d2285@nxp.com>
 <aYtT9vOAYTYuTsC6@lizhi-Precision-Tower-5810>
 <9b223407-9218-4382-9968-6541cf485b9d@nxp.com>
 <aYygOtB1d3XYi_EB@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYygOtB1d3XYi_EB@lizhi-Precision-Tower-5810>
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, Feb 11, 2026 at 10:28:58AM -0500, Frank Li wrote:
> On Wed, Feb 11, 2026 at 09:54:52AM +0800, Joseph Guo wrote:
> > On 2/10/2026 11:51 PM, Frank Li wrote:
> > > On Tue, Feb 10, 2026 at 07:47:55PM +0900, Yanan Yang wrote:
> > >> Add DeviceTree support for the NXP FRDM-IMX91S development board based
> > >> on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
> > >> and differs in memory, storage, Ethernet, and PMIC configuration:
> > >>
> > >> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> > >> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> > >> - Single GbE port (FRDM-IMX91 has dual GbE)
> > >> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
> > >
> > > Look like it is very similar with imx91-11x11-frdm boards.
> > >
> > > Can you create common dtsi for both boards
> > >
> > > imx91-11x11-fdrm-common.dtsi
> > >
> > > then imx91-11x11-fdrm-s.dts and imx91-11x11-frdm.dts included
> > > imx91-11x11-fdrm-common.dtsi.
> > >
> > > You can refer below method
> > > https://lore.kernel.org/imx/20260204083551.2867263-1-sherry.sun@nxp.com/
> > >
> > > Frank
> >
> > Hi Frank,
> >
> > I think the two boards are totally different.
> > They have different PMIC, no EMMC for FRDM-IMX91S and totally different pin assignment.
> > So if we create a common dtsi, there will be not much duplicate code can put in.
> 
> Okay. It will be good if diff imx91-11x11-fdrm-s.dts and imx91-11x11-frdm.dts
> to show what's percentage change.
> 
> Frank

Hi Frank,

Although both boards are FRDM platforms, they have significant
difference in hardware configuration of most peripherals, including
FlexCAN, GPIO Keys, memory capacity, Ethernet interface, FlexSPI, IOMUX
configuration, LPI2C and PMIC. Therefore, it is better to maintain
seperate DTS files for them. 

Yanan

> >
> > Regards,
> > Joseph
