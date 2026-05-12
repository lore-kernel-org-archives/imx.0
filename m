Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825933FF88D
	for <imx@lists.linux.dev>; Tue, 12 May 2026 07:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778572351; cv=none; b=cICuRiCjhmTzxcLQglOt6c250E5I4RRIv4JT5+/3Znz/tIK640oWAqjTbaTmbHHDLkZJ+WDe2oXMODpHa63vUl9Qk50kDKmwHumG6KWidDL56XKQtXkreZQfgEHG/zG4rzZlnPV4jEhSBp0QBHzh9DbVfBIBxQgMxqTIYnb1mE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778572351; c=relaxed/simple;
	bh=/HfvGp2DsesUS/hXOFdWeZ/1YblwL2ujRKKPFhaORCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8BtWkufuaf5xyZ/KhbjkY6FdhSunkEAK8f4K61fs+Iv1mkJ6uPs1hm9SgfSRD42VxU5VUG022vLssEVsCn3ujRgTuydME0VjcPFfBIjlSJoCU6hINf1TxgQVvxBkyS2i+yeZDTGB9jAdoaX/rSnh4HIRcLIW7KLCboKiG1rWGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=k4BKNHCC; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="k4BKNHCC"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 3D3831FA0A;
	Tue, 12 May 2026 09:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1778572348;
	bh=J4lTy/dApuMcsfjzQY1Js5ALZSDDFfpNZfq5R1P+Z9E=; h=From:To:Subject;
	b=k4BKNHCCUBnSwJqLOi09Ddx8mg7oBEONZde487DzKz0vc9v/Y1LI9Aj/EsKvxpOmY
	 6d1L1508UM3+0Aq2/0fn197Uf57zKY05qqywumjNxOf5voeJAqHU+toU/xEUGTWs2W
	 riQnUJK4xdc4t7pYMyaWLx3vmOE/Ni4BULcS+m215mWmfPk3rlxCz6O1IlMbWgpSsR
	 +FzNjySF9OulrHmx3WnYZnmbgW3E99oohojtwpSweIn6NfmftOkaI1snTu5U4Esdan
	 tU98SdOtbDR/MZwV5Z7sKDBwZ2kzbtE+ymBhP7V3l8lSoL/8SdS8g3o7iVfQQ7EcEU
	 OgXRWB4UV5wWA==
Date: Tue, 12 May 2026 09:52:27 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM: dts: imx6qdl-sabrelite: add mdio phy address 0
Message-ID: <20260512075227.GC5820@francesco-nb>
References: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
 <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com>
 <f04fadf2-8d73-435b-b713-9d07e48e80ae@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f04fadf2-8d73-435b-b713-9d07e48e80ae@lunn.ch>

On Tue, May 12, 2026 at 12:15:08AM +0200, Andrew Lunn wrote:
> On Mon, May 11, 2026 at 05:04:56PM -0400, Frank Li wrote:
> > According to IEEE 802.3 Clause 22.2.4.5.5 PHYAD (PHY Address), A PHY that
> > is connected to the station management entity via the mechanical interface
> > defined in 22.6 shall always respond to transactions addressed to PHY
> > Address zero <00000>.
> 
> Did you read 22.6? I've not seen a mechanical interface as defined in
> 22.6 for at least 20 years, maybe 30 years.
> 
> That cause does not apply in this context.
> 
> > -		ethphy: ethernet-phy {
> > +		ethphy: ethernet-phy@0 {
> >  			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <0>;
> 
> This could very well break this board. Without a reg value, the core
> will find the first PHY on the bus, at whatever address it is at. If
> you hard code 0, the PHY must be at 0, otherwise it will not be found.

Whoops, I replied without reading your answer first.

Yes, I agree, this change will break the board functionality.

