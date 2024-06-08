Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83371C287
	for <imx@lists.linux.dev>; Sat,  8 Jun 2024 17:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717868633; cv=none; b=CnFNgpdc3ykTN/mi+s/eI5I7HDr2p32AdgKQ/mdkzFEVE3pzKfqjMTIeTtFpAmVKuDNJq5MZYH7wn5DCGgXTlXzxDlUekFum8FAmgtS13N3MAJ4+nt3n7MoRLn/RCsiWLWrb7mVgrZbsvTz47x38B0y1+5ATpzDBQ+C3tARO2Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717868633; c=relaxed/simple;
	bh=kLrCDhLXWnQi/6oBKEMwSX/fJZJaRc1yeJy8v9thCfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhkoKbF5tSrMkWfVp7k6bNh6cRp/YjkJ2Dlt2tjMVx9/6GZGluhIpZ7c2Wj4JF7yhIr5HPqu0KjWim8QSBP0HIWLNxZZySRBjql5XPf3gXl77RSKRBbOWjZ9CgdomHD++rnnCbfWlQ0EB4wTzLjTi7Mz97GGU1uetzrAdES90pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o+mtMy5B; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o+mtMy5B"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7098C3D5;
	Sat,  8 Jun 2024 19:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717868619;
	bh=kLrCDhLXWnQi/6oBKEMwSX/fJZJaRc1yeJy8v9thCfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o+mtMy5BX82AFz4IFfICIsn6mrYQASrhQeSJUOiCHAw1l5ccBak3aslxLmpK67pzD
	 1K84co2y9X2B2VXUlKi05nK9OLDhBs5hxb+I4a8Z6AswjttXp70UC4kvP+LPCUgH5t
	 r4lscGrhRlQtlKo7Wg423dn/3kSgwbJ8Zgj7FB54=
Date: Sat, 8 Jun 2024 20:43:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Li Yang <leoyang.li@nxp.com>,
	Marco Contenti <marco.c@variscite.com>,
	Nate Drude <nate.d@variscite.com>,
	FrancescoFerraro <francesco.f@variscite.com>,
	Harshesh Valera <harshesh.v@variscite.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: freescale: Add panel overlay for
 Variscite DART
Message-ID: <20240608174331.GG18479@pendragon.ideasonboard.com>
References: <20231025165058.31697-1-laurent.pinchart@ideasonboard.com>
 <20231025165058.31697-5-laurent.pinchart@ideasonboard.com>
 <20231127031631.GY87953@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231127031631.GY87953@dragon>

Hi Shawn,

On Mon, Nov 27, 2023 at 11:16:31AM +0800, Shawn Guo wrote:
> On Wed, Oct 25, 2023 at 07:50:58PM +0300, Laurent Pinchart wrote:
> > Add a DT overlay for the Variscite i.MX8MP DT8MCustomBoard that models
> > the GKTW70SDAE4SE LVDS panel found in the evaluation kit.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> It doesn't apply to imx/dt64 branch, and I managed to manually apply it.

I'll submit a v3 based on that branch.

> However, here is what I'm getting from 'make ARCH=arm64 dtbs'.
> 
> ../arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:54.3-16: Warning (reg_format): /fragment@1/__overlay__/touch@38:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> ../arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:52.11-68.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/touch@38: Relying on default #address-cells value
> ../arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:52.11-68.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/touch@38: Relying on default #size-cells value
> arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (graph_port): /fragment@3: graph port node name should be 'port'
> ../arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:85.15-87.3: Warning (graph_endpoint): /fragment@3/__overlay__: graph endpoint node name should be 'endpoint'
> ../arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:85.15-87.3: Warning (graph_endpoint): /fragment@3/__overlay__: graph connection to node '/fragment@0/__overlay__/panel/port/endpoint' is not bidirectional

Is that unexpected ? My understanding is that the DT compiler doesn't
have enough information when compiling an overlay to validate the device
tree, as it looks at the overlay only, without considering the base DT
on which the overlay will apply.

-- 
Regards,

Laurent Pinchart
