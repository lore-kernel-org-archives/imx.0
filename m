Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9AC3033E3
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 12:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441274; cv=none; b=kw6wh0niShx8U95PN5T+aLl4o4qIzsHGRnTGSjzEjN8aViwGYEkE1kqBKJOzqPCTsXXA4D2C0bMdrYECdWLaaok0NizFkdLyOQcCJwzXn58c8987JpxEpMyUL7+SxiFwIgnSdpDJVC9t9zsIA+6Md9MCwjDuZkoDZkmI0eBeCLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441274; c=relaxed/simple;
	bh=2XSKZRnXacS18o8cTGKTm/tgWX68V2PKffs9WfB92Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9dfLdhJHsqekrq4Eo5mOC7LTSJsRG4iHJCr77JzF7vV5OdeobjDDjztl4GEGITnzlS7nvyk0iUvCEVPdK77jCd2RMbmPtB6j0B6N2MNuYPN33ByP7S8xSWK+ct/xQ5Ad+DJDqa9hKJEkmAKkz/4U2HaWmKNr5KgX7DyabfQy4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=JAU0gmmP; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="JAU0gmmP"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 148B01FC3D;
	Wed, 25 Mar 2026 13:21:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774441271;
	bh=PLOm9XjuNpTv3crP433snW9Y0q8ywlGOwYlifFWD9Ic=; h=From:To:Subject;
	b=JAU0gmmPMd1iVqtE16jH7H7pDG2riyi1NUZlA/MxZ12t+WjaNP1dMxqSShWUHGkIV
	 Xzf+zvn83Qp/1T5tk370e1X7QyfyIxFKXqc5wHCzJKZS/an56mZ6vUO9pQiI9s0i4i
	 IqSgEJtDtP4EdCKn/hISN0aIShN70LRhl/utqg4QYUgpWYMs4evzd17/evnV7jE+Ag
	 1vX++PbpqmN6QkeW3OeZkZ/vshzTpLcoY/mdVkaWTFVzyhxpGlm39d1un80Qj8BOyb
	 VKKXfOH5gpbFe09WcN9hdsUR31159AxcBI1rCIJ7sXBF/h00n8xPSDlBsCW+Y0SvAz
	 aD2lAmBjVYleQ==
Date: Wed, 25 Mar 2026 13:21:04 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@nxp.com>
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 0/2] Add support for Variscite DART-MX95 and Sonata
 board
Message-ID: <20260325122104.GA19112@francesco-nb>
References: <20260313174707.26902-1-stefano.r@variscite.com>
 <abRdwy_AS046QVRI@lizhi-Precision-Tower-5810>
 <acLqjeqmR4eVDoKw@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acLqjeqmR4eVDoKw@lizhi-Precision-Tower-5810>

On Tue, Mar 24, 2026 at 03:48:29PM -0400, Frank Li wrote:
> On Fri, Mar 13, 2026 at 02:56:03PM -0400, Frank Li wrote:
> > On Fri, Mar 13, 2026 at 06:47:01PM +0100, Stefano Radaelli wrote:
> > > This patch series adds support for the Variscite DART-MX95 system on
> > > module and the Sonata carrier board.
> > >
> > > The series includes:
> > > - Device tree bindings documentation for both SOM and carrier board
> > > - SOM device tree with on-module peripherals
> > > - Sonata carrier board device tree with board-specific features
> > >
> > > The implementation follows the standard SOM + carrier board pattern
> > > where the SOM dtsi contains only peripherals mounted on the module,
> > > while carrier-specific interfaces are enabled in the board dts.
> > >
> > > v7:
> > > - Order nodes in symphony dts
> >
> > Can you run https://github.com/lznuaa/dt-format for new file to easy
> > track and check by script later.
> 
> I applied with below change
> - update copywrite to 2026

How do you know that the correct copyright year is 2026?
The copyright years does not change to today just because it is the year
it was submitted.

I think that you should refrain yourself for doing these kind of changes
to the code when you apply patches.

Thanks
Francesco


