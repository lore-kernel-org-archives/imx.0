Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4618317BCA
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 01:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768785685; cv=none; b=VryE9aA0uVI+UIdHiSxqmSty4GL5G7DOqN7mG4/z66msZaNPnC/mnb75Smqu2KSFVl+s+HBi0cWYtyIVGVHl6uJqoeLXt01VKgkVfvv27X3PQS3oZWUFTop0goHInvzXlxoQlk38zAtdnMJhMAFBdeBAwt/O8hma3J6hEnt/b/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768785685; c=relaxed/simple;
	bh=ZRtkrsGMza1QGoibNEOD5RuTMXU+Jew8FRg2falQY1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsdSP6S4izUb3cadMBopnmST9MeQSTqwILEmxtEr8MFQ/ZPIvBIj9LCVAk76dOma+IlfVOYbG63SQiLho784c0UUz9GB6SyEUZz7b1cNenJ2CQTGLMztHEeSHPn+4QiT5/iBuW4I5hO1bmfhfCUswNfXYf9HLcr/fv5wNskEYlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EA269201E9F;
	Mon, 19 Jan 2026 02:21:16 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A3D1620138A;
	Mon, 19 Jan 2026 02:21:16 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 7FD341800096;
	Mon, 19 Jan 2026 09:21:14 +0800 (+08)
Date: Mon, 19 Jan 2026 10:21:13 +0900
From: Yanan Yang <yanan.yang@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com,
	justin.jiang@nxp.com, Lei Xu <lei.xu@nxp.com>,
	Xiaofeng Wei <xiaofeng.wei@nxp.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
Message-ID: <aW2HCTuwNEQkG8UC@lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com>
References: <20260116-imx91s-frdm-v3-0-98671de64925@nxp.com>
 <20260116-imx91s-frdm-v3-2-98671de64925@nxp.com>
 <CAEnQRZDtE+0gDxAnu9vWGhj3rYEv6CmMNjQLWnKu=ud9Yo9XcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZDtE+0gDxAnu9vWGhj3rYEv6CmMNjQLWnKu=ud9Yo9XcQ@mail.gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP

On Fri, Jan 16, 2026 at 11:33:59AM +0200, Daniel Baluta wrote:
> On Fri, Jan 16, 2026 at 5:45 AM Yanan Yang <yanan.yang@nxp.com> wrote:
> >
> > Add DeviceTree support for the NXP FRDM-IMX91S development board based
> > on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
> > and differs in memory, storage, Ethernet, and PMIC configuration:
> >
> > - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> > - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> > - Single GbE port (FRDM-IMX91 has dual GbE)
> > - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
> >
> 
> <snip>
> 
> 
> > +       sound-mqs {
> > +               compatible = "fsl,imx6sx-sdb-mqs", "fsl,imx-audio-mqs";
> 
> There is little sense to have compatible = ""fsl,imx6sx-sdb-mqs". Just
> use
> 
> compatible = "fsl,imx-audio-mqs";
> 
> Move model property after compatible as per already existing code practice.

I will fix it in v4. Thanks
