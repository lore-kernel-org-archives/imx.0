Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BBF156CF
	for <imx@lists.linux.dev>; Thu, 31 Oct 2024 14:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730385591; cv=none; b=Yfg6kII85O/zqIHd4sE9OIZ02EcvDU+OKLOER2afGMsCgvfZ77tXK2bDc2tP7GiLrMkg4/EoF8ZT2Yu8UIk35r5aV3BcFv546oRBMcaqbefIuIGMNlReqNSWnK5fQ5XBlcPCvOd5UG76tKHhFd+jW08zlP4w6twTGNvGxdou2ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730385591; c=relaxed/simple;
	bh=wPyDz5ZOCbGsu9cjNU3R/aJsJzADof3DW/0MCSkhKOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKl8Su1FjazzVyIK+TLiqLR050oArtqzRAtg7rlM+zDXHY+AKR7qBHWzBbs3GzmIpXb1KvZgfATMXHqwakD4UlDr8pilaZcliCzgOZYF7mIR9Wt4xzGfvp4BDhcAERXHUHubcz4bkkSiJ2mm4sHRTqpRl81033Q4wdQGNX9S7jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 28DF8201059;
	Thu, 31 Oct 2024 15:29:30 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 10B5320102E;
	Thu, 31 Oct 2024 15:29:30 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 719D52033F;
	Thu, 31 Oct 2024 15:29:29 +0100 (CET)
Date: Thu, 31 Oct 2024 15:29:30 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v4 13/16] dt-bindings: net: Add DT bindings for DWMAC on
 NXP S32G/R SoCs
Message-ID: <ZyOUSgMo0chsGnCa@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-13-03618f10e3e2@oss.nxp.com>
 <erg5zzxgy45ucqv2nq3fkcv4sr7cxqzxz6ejdikafwfpgkkmse@7eigsyq245lu>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <erg5zzxgy45ucqv2nq3fkcv4sr7cxqzxz6ejdikafwfpgkkmse@7eigsyq245lu>
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Oct 29, 2024 at 08:12:37AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Oct 28, 2024 at 09:24:55PM +0100, Jan Petrous (OSS) wrote:
> > Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> > and S32R45 automotive series SoCs.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 98 ++++++++++++++++++++++
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |  3 +
> >  2 files changed, 101 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> > new file mode 100644
> > index 000000000000..b11ba3bc4c52
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> > @@ -0,0 +1,98 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright 2021-2024 NXP
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/nxp,s32-dwmac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP S32G2xx/S32G3xx/S32R45 GMAC ethernet controller
> > +
> > +maintainers:
> > +  - Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > +
> > +description:
> > +  This device is a Synopsys DWC IP, integrated on NXP S32G/R SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nxp,s32g2-dwmac
> > +      - nxp,s32g3-dwmac
> > +      - nxp,s32r-dwmac
> 
> Your driver says these are fully compatible, why this is not expressed
> here?
> 

They are compatible on current stage of driver implementation, the
RGMII interface has no any difference. But later there shall be
added SGMII and this provides some level of difference, at least
from max-speed POV.

The S32R allows higher speed (2G5) on SGMII, but S32G2/S32G3 has
1G as maximum.

> > +
> > +  reg:
> > +    items:
> > +      - description: Main GMAC registers
> > +      - description: GMAC PHY mode control register
> >
> 
> ...
> 
> > +        mdio {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +          compatible = "snps,dwmac-mdio";
> > +
> > +          phy0: ethernet-phy@0 {
> > +              reg = <0>;
> 
> Messed indentation. Keep it consistent.
> 

Thanks. I will fix it in v5.

> Best regards,
> Krzysztof
> 
