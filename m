Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A8740911F
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 08:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017999; cv=none; b=G29mOidTp3kyuJ807jo2v+7IPCHT4Zqvr5bVzWGbsInZrnme77sorFbXn4/1RPvdgPffDunV7CJIMkaddkxJrYnyx2E7xAThPrXXLlZZVoZ7qsSQ33fESvtHfOH2T4ZnKy2KaU+ehHn9VqX1tn5p1ph4/X+gmt3Toh/JzOKPzKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017999; c=relaxed/simple;
	bh=XZFK8kG3Z4mNizDB3oPb0dFGtlkWNuMYxvU1hMPGfEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vD6pYBfWTU4QmsYYfH5m59sx0NHGOYbvZiY/ESo5hUwv2hyELsnyzLLbEKLwB19bu27hDVXENiLfdRlWLPo6GWmhO+MGvMTLoSokrI04H8U8Xs2pRsr+cc8wpA2A4PzJ+ByWj3RQi1JGtokT8jsQifiSiIiTMnXDrQSNM6fSR8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=QPbZAiLr; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="QPbZAiLr"
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id D9FF422866;
	Tue, 14 Jul 2026 10:33:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784017981;
	bh=5RPD9zCkYpEFXFkstqhyOb8iX6+4+Xh8cL6FAPBm4VQ=; h=From:To:Subject;
	b=QPbZAiLrylAhQopbd8b7Jphl2QaqIgE4F0fN+KYxFFHhiNv7ervkryY5qnNcBz2LF
	 MzaqSTAwgsny0heS2ml7O0Nia7/gZ+VUynx10OB6mqSutjWY+jfOkqjOf8z8+65rbC
	 njUh+RVCyLD+mEZ3Lxp7HQqLP6TcfNFQ/Mj41l0MR83/O+PXjBuqX1BUGQHcDUSF8w
	 1mlZhl+hz2d717Yn6XSOe08kDY2+asxLNeLLMEcLElKcXNqUNJfhdXKN07ON8AY2ed
	 VWGauA123gBGJls9iVigBBjLTBTUM6Iw1VyVXqyDCVZX9+TDY8QFzWc0BVRy9A6W8p
	 F/M/PNtPdtCjQ==
Date: Tue, 14 Jul 2026 10:32:59 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Frieder Schrempf <frieder@fris.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/10] arm64: dts: imx93-kontron: Enable ELE firmware
 driver
Message-ID: <20260714083259.GB22086@francesco-nb>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-10-b8266d93514b@kontron.de>
 <20260714065947.GA22086@francesco-nb>
 <e515a6c5-b32c-47b7-968b-0f6a66e4f24a@kontron.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e515a6c5-b32c-47b7-968b-0f6a66e4f24a@kontron.de>

On Tue, Jul 14, 2026 at 10:09:11AM +0200, Frieder Schrempf wrote:
> Hi Francesco,
> 
> On 14.07.26 08:59, Francesco Dolcini wrote:
> > Hello Frieder,
> > 
> > On Mon, Jul 13, 2026 at 04:53:46PM +0200, Frieder Schrempf wrote:
> >> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>
> >> Add the ELE firmware API node and pass its handle to the OCOTP
> >> driver. This allows us to gain read/write access to the OTP fuses.
> > 
> > This seems something we should have in the soc dtsi (imx93/imx91), it
> > does not seems board specific.
> 
> My original intention was to move as much as possible into the SoC dtsi.
> The problem is that the memory node is somewhat board specific due to
> the DDR. And I can't move the firmware node into the SoC dtsi and assign
> the memory node in the board dts as the checks for all boards not
> specifying a memory node would fail then.

The ELEFW is required to boot, is not an optional component for this
SoC, so I would try to find a way to have this duplicated in all the
board files.

What is the reason to have this memory address different on various
boards? Can we have a default in the soc dtsi, and allow the board to
override the address if needed?

Or can't you add the address in all the boards, and keep everything else
in the soc dtsi?

Francesco

