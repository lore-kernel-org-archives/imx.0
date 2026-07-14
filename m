Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAA9451071
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 12:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032444; cv=none; b=nTHFKxz2hBRfdAf73nzTyRAxsrk12SeNutdMY2QT5wfp8piniBiryb+LuqNmtY5pu9yBt5UOiT5iFEt5QM0nB6Vw8dmE8qQeQAy9em/ILd3WyWEFhXFgiROpEQueb7QL9T4AhfdxiykU5Al7e9HAcDmuqui7vCExUNkzMi0djYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032444; c=relaxed/simple;
	bh=/BSX6xnz6AyluGspxS2z7y6Sbe4ysmU4pLabumaCCFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArlW7X7hUH8P9JpBHDVkU2ysnd5sX6l2j/ITRYrQpegLkzOQ+MCSpABWVQhFfbXoWlfBcy4InOTI3KMqZjh7Quth+beO9L/0dFN3tAVeFr6ZVAPtu1uvm4DXQuE6AzmHvJFOviILhpU6ax9S4WjNZwFFK0nJj8+DOhFFyiNhpwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=NapJO2Ic; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="NapJO2Ic"
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 71F251F8CF;
	Tue, 14 Jul 2026 14:33:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784032432;
	bh=MWvNBrHeXlEhZS8wQAuNy/d9zeBljXhXaKblZHhr78s=; h=From:To:Subject;
	b=NapJO2IcmyttYRGBjttgER/rPTaXjCmBxw0Ev6BpdUafOmofqt8LTlow3QmmhovoF
	 tmLrl6remRQzU+7mxgh9ZJjabrv9Yqu9151oziAJLmLrjnp3EmNI1YPBNCfpiNI871
	 wZQlQqdkpqBuYG7zWoW4CGJBT5it0kSTzfKg/LsCkGXWxVd7dKVdx433z/hIkNROtf
	 5PYZw25dwI0fTwf+nw2J8MT0WvuEWuYWlH1rM49ERitDLVW2uFeJDy5qUlit4qBX19
	 IZqRL+80Xoee9SytrmFihy4CBbQYxCdSGgd8cl442c3flzsUIWkfMIUfsVgyKpAryc
	 OMMRFCidWJrWw==
Date: Tue, 14 Jul 2026 14:33:50 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco@dolcini.it>,
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
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/10] arm64: dts: imx93-kontron: Enable ELE firmware
 driver
Message-ID: <20260714123350.GD22086@francesco-nb>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <4b7b7823-00c5-4801-8ba4-19e5670f339d@kontron.de>
 <20260714093354.GC22086@francesco-nb>
 <2420855.ElGaqSPkdT@steina-w>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2420855.ElGaqSPkdT@steina-w>

On Tue, Jul 14, 2026 at 02:06:38PM +0200, Alexander Stein wrote:
> Am Dienstag, 14. Juli 2026, 11:33:54 CEST schrieb Francesco Dolcini:
> > On Tue, Jul 14, 2026 at 10:43:56AM +0200, Frieder Schrempf wrote:
> > > On 14.07.26 10:32, Francesco Dolcini wrote:
> > > > On Tue, Jul 14, 2026 at 10:09:11AM +0200, Frieder Schrempf wrote:
> > > >> Hi Francesco,
> > > >>
> > > >> On 14.07.26 08:59, Francesco Dolcini wrote:
> > > >>> Hello Frieder,
> > > >>>
> > > >>> On Mon, Jul 13, 2026 at 04:53:46PM +0200, Frieder Schrempf wrote:
> > > >>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> > > >>>>
> > > >>>> Add the ELE firmware API node and pass its handle to the OCOTP
> > > >>>> driver. This allows us to gain read/write access to the OTP fuses.
> > > >>>
> > > >>> This seems something we should have in the soc dtsi (imx93/imx91), it
> > > >>> does not seems board specific.
> > > >>
> > > >> My original intention was to move as much as possible into the SoC dtsi.
> > > >> The problem is that the memory node is somewhat board specific due to
> > > >> the DDR. And I can't move the firmware node into the SoC dtsi and assign
> > > >> the memory node in the board dts as the checks for all boards not
> > > >> specifying a memory node would fail then.
> > > > 
> > > > What is the reason to have this memory address different on various
> > > > boards? Can we have a default in the soc dtsi, and allow the board to
> > > > override the address if needed?
> > > 
> > > There is no real point in having different addresses on different
> > > boards. But the node describes memory that is physically on the board
> > > and not on the SoC. And I think that is why DT maintainers want to have
> > > it in the board DT. It's the same with the memory nodes for the
> > > remoteproc drivers to communicate with the Cortex M-Cores in the i.MX.
> > > But maybe I'm wrong and if there is a possibility to move this to the
> > > SoC DT I will definitely take it.
> 
> We are talking about reserved memory, so this is highly board-specific.
> So for different hardware variants with different amount of RAM you have to
> go for the minimum anyway.
> 
> > > > 
> > > > Or can't you add the address in all the boards, and keep everything else
> > > > in the soc dtsi?
> > > This could be a possible way, yes. In that case maybe we could even
> > > create a generic dtsi to contain such defaults for all boards.
> > 
> > I would go for this solution, we could have something like
> > `k3-am62-ti-ipc-firmware.dtsi`, include it from all the boards, have a
> > sane default memory address, and have an easy way to override the memory
> > address from the board dts, if needed.
> 
> So what is a sane default? At the end of the minimal possible RAM?
> I'm not really fond of something you have to make sure matches to your
> hardware, but won't raise an error if you forgot.
> 
> How about providing defaults for the SoC part and users have to provide their
> memory on board-level? Similar to the VPU nodes on imx8qm/imx8qxp. There you
> have to specify memory-region in your board.

I am personally ok with both solution.

I think it is easy to have a sane default in this case. You cannot have
less than 256MiB in practice, and this is just about the offset, is not
that you are going to want more memory reserved if the board has more
memory available.

At the same time, having the memory range in the board dts is also ok to
me.

Francesco

