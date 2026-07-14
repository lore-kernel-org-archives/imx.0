Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79C73F39EE
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 09:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021640; cv=none; b=vGlFDM4icgF8tubitrE6pbivBVvpfZH6kv/Nb1aYL9/ar0OQYSP3eksZmbARGz9I0Olm7m0U99NQU/dzOiIUfNGgJo4EQHGAy6FrrC6KqJ+a3Bi/5mfM3ykEm4M/XzhGhXkoLnCrT4qaahv3/WfPBnzPFEnb8WC8hXpXbsrdtQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021640; c=relaxed/simple;
	bh=Ribt8iJKbGPXKt88x/7hBRsYnkox0i54yQQPtrNaKwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FI+PJB8W+HH7dul30oc3lLcuaAbJkFiUcvI3NY5B+/KAxCCYFmb4LX2unKFd6u9C9XvZRf5NFU4Mo00Ai9Srpta1sqxLm2ZaX3peGthByo03Jwjiyn9/YCKh4J46yg4HYoRQ0JN+rG5BKm2nlMJRrgCmnuLv3TAvUwTD0O0xVkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=F1EJYO++; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="F1EJYO++"
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 113FC1FFA1;
	Tue, 14 Jul 2026 11:33:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784021636;
	bh=NmtdyuoVms6UjY/WUUunlXxAOdDcE/a7uik36L4Lfvg=; h=From:To:Subject;
	b=F1EJYO++cqfmtggaxaq6h1UX2lV8bnrkAdpYucgdF2/SzG5zJ6apS5gSQtr26giYq
	 35WrkZJAem4m2s7oWHOJAglM+TBVpiFFrCySuhH/4HRhW5bk9dhIjDY4BIMWqmfMaY
	 QMT2uVuUoxEbQyJ425qePPYbTCRjzfgtfh0b28C8wZF8l3Xk0iikYPeBfRYt4JwYsA
	 uMJGzImN4ZUD5vbmIYX8g/RW3ftL0Hc1Llh/zZ2uLJ7vAoAA0seAioYs0yF6f13zpa
	 k7Pj/VZSI3XQafyMtvEhwEmMSolbA8OgPrIRlXMj6PNCC90mNMndfk7Iz1ofo5OFaL
	 EaMYop5AcdMWQ==
Date: Tue, 14 Jul 2026 11:33:54 +0200
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
Message-ID: <20260714093354.GC22086@francesco-nb>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-10-b8266d93514b@kontron.de>
 <20260714065947.GA22086@francesco-nb>
 <e515a6c5-b32c-47b7-968b-0f6a66e4f24a@kontron.de>
 <20260714083259.GB22086@francesco-nb>
 <4b7b7823-00c5-4801-8ba4-19e5670f339d@kontron.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b7b7823-00c5-4801-8ba4-19e5670f339d@kontron.de>

On Tue, Jul 14, 2026 at 10:43:56AM +0200, Frieder Schrempf wrote:
> On 14.07.26 10:32, Francesco Dolcini wrote:
> > On Tue, Jul 14, 2026 at 10:09:11AM +0200, Frieder Schrempf wrote:
> >> Hi Francesco,
> >>
> >> On 14.07.26 08:59, Francesco Dolcini wrote:
> >>> Hello Frieder,
> >>>
> >>> On Mon, Jul 13, 2026 at 04:53:46PM +0200, Frieder Schrempf wrote:
> >>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>>>
> >>>> Add the ELE firmware API node and pass its handle to the OCOTP
> >>>> driver. This allows us to gain read/write access to the OTP fuses.
> >>>
> >>> This seems something we should have in the soc dtsi (imx93/imx91), it
> >>> does not seems board specific.
> >>
> >> My original intention was to move as much as possible into the SoC dtsi.
> >> The problem is that the memory node is somewhat board specific due to
> >> the DDR. And I can't move the firmware node into the SoC dtsi and assign
> >> the memory node in the board dts as the checks for all boards not
> >> specifying a memory node would fail then.
> > 
> > What is the reason to have this memory address different on various
> > boards? Can we have a default in the soc dtsi, and allow the board to
> > override the address if needed?
> 
> There is no real point in having different addresses on different
> boards. But the node describes memory that is physically on the board
> and not on the SoC. And I think that is why DT maintainers want to have
> it in the board DT. It's the same with the memory nodes for the
> remoteproc drivers to communicate with the Cortex M-Cores in the i.MX.
> But maybe I'm wrong and if there is a possibility to move this to the
> SoC DT I will definitely take it.
> 
> > 
> > Or can't you add the address in all the boards, and keep everything else
> > in the soc dtsi?
> This could be a possible way, yes. In that case maybe we could even
> create a generic dtsi to contain such defaults for all boards.

I would go for this solution, we could have something like
`k3-am62-ti-ipc-firmware.dtsi`, include it from all the boards, have a
sane default memory address, and have an easy way to override the memory
address from the board dts, if needed.

Francesco


