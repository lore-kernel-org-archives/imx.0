Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B3B283CB5
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 05:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765950745; cv=none; b=KV9sy97lxDIUDfZGirTwbHwy7EJpNDNbKRVCnHqqpQXZcmfsZtMmWD3u9Hb77HTx7OIK64ECpcQZjkqwckoJ+4KDHMwJTwK6QX8/k9Zx/LT5tmUcdhIx0y2WReo8YgLnMc7sABdcJ2JULOIBQ2JXzofO+D4AUjK+pQdUq50Iw0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765950745; c=relaxed/simple;
	bh=TpeEqOiK5wQ/c1ycCBS7/5VQhnVth3fT4BvSXyphtuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsdxw4wGNIRimu5jfvsILT+00K5GRTTWMPTN8eioYK+49ophoeQmDKJghRM9XNxPdwYiGUMxOfVT+p6FuQmv4YTW84dCHpwqKTbVFHd0HAZOl6wMJ94hIzBokjKsn3uZ7gkyZpDJrWlK5yJYfZCu1XDz7Dvqcvhf/MYHxnNrpcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9F12F1A1AB7;
	Wed, 17 Dec 2025 06:52:14 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 689271A0B5C;
	Wed, 17 Dec 2025 06:52:14 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 3AE411800089;
	Wed, 17 Dec 2025 13:52:12 +0800 (+08)
Date: Wed, 17 Dec 2025 14:52:11 +0900
From: Joseph Guo <qijian.guo@nxp.com>
To: Yanan Yang <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, justin.jiang@nxp.com,
	Lei Xu <lei.xu@nxp.com>, Xiaofeng Wei <xiaofeng.wei@nxp.com>,
	qijian.guo@oss.nxp.com
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
Message-ID: <aUJFC4ll033PzX7L@lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com>
References: <20251215-imx91s-frdm-v2-0-87996bdaa59c@nxp.com>
 <20251215-imx91s-frdm-v2-2-87996bdaa59c@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-imx91s-frdm-v2-2-87996bdaa59c@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Dec 15, 2025 at 05:42:52PM +0900, Yanan Yang wrote:
> Add DeviceTree support for the NXP FRDM-IMX91S development board based
> on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
> and differs in memory, storage, Ethernet, and PMIC configuration:
> 
> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> - Single GbE port (FRDM-IMX91 has dual GbE)
> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
> 
> This DT enables:
> - ADC1
> - UART1 and UART5
> - I2C bus and children nodes
> - USB and related nodes
> - uSDHC1 and uSDHC2
> - FlexSPI NAND flash
> - Watchdog3
> - Ethernet (eqos)
> - FlexCAN
> - MQS
> 
> Link: https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91S
> (FRDM-IMX91S board page)
> Link: https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91
> (FRDM-IMX91 board page)
> 
> Co-developed-by: Lei Xu <lei.xu@nxp.com>
> Signed-off-by: Lei Xu <lei.xu@nxp.com>
> Co-developed-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> Signed-off-by: Yanan Yang <yanan.yang@nxp.com>
> 
> ---
> Changes in v2:
> - Correct author name: removed extra period in "Yanan.Yang"
> - Removed aliases pointing to disabled nodes from DTS
> - Add "rtc0 = &pcf2131;" in aliases to make external RTC the primary device
> - Fix DT node name: change
>   "usdhc1_pwrseq: usdhc1_pwrseq" to "usdhc1_pwrseq: usdhc1-pwrseq"
> - Renamed LED node from 'status' to 'led-0' to comply with gpio-leds binding
> - Replace regulator-based transceiver (reg_can_stby) with CAN PHY (nxp,tja1051)
> - Replaced 'xceiver-supply' property with 'phys' in flexcan1 node
> - Adjusted alignment in fsl,pins property: used spaces between pin names and values for proper DTS style.
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  .../boot/dts/freescale/imx91-11x11-frdm-s.dts      | 677 +++++++++++++++++++++
>  2 files changed, 678 insertions(+)
>

Hi Yanan,

According to u-boot requirement. We should ensure the minimum difference to the U-boot dts and kernel DTS.
So I suggesst to add bootph- properties to the nodes should be initialized at u-boot stage.

Regards,
Joseph
