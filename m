Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FAD41324F
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 18:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774461976; cv=none; b=On6kte9qe8nyKk0uetZKtB26y0HeUOYCZ661DBe9NayJ/dqIo1jbOoWfxmArSr5iOn0Y1FzPElE15l3ZVzC3XYZk3CbNpwL9NBX/OYXIHFpJ1PCiLCFJIikE9T4+aorRrY5m71JJXf1WjLE93Ux5GORuODlB3REpMHqHJKc2m+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774461976; c=relaxed/simple;
	bh=j62gI3zsL0xUb/XyIelbUH41oWt3ntZ0N7neIeWFo8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6++rY2aQ6ltcQsdJ8vXSqDiyqk9a4LgpHhUHobOT4e5q8GuUuTKWLQrQtMPQVvhkqlLQnWSHk12woWhRwWlzSpzpycgHIJwInZ7sLzBTfLSw8wvm8KNWmlms1u0keCsxTICAuVugIt00VWrDonBGaO2UvJSDeloNgvnICIQxl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=gvaf1Xkm; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="gvaf1Xkm"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0B98F20202;
	Wed, 25 Mar 2026 19:06:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774461968;
	bh=4N4WM+cmPpBaKwZWyDFo1qlxcYPuytvpbUHsAspj/Fw=; h=From:To:Subject;
	b=gvaf1Xkmq4pXHVPZjj6KAFXDHN/fL0TeZTegQTWxY1b+5waPJE2O9hyyMIE0BDy+1
	 OrcP2dfTtNcosLeKdO4I7eCUMq/qYLMut8F2HlBbO3lkdCb8cWxY/EDTStoRYOBxAV
	 ppUtyOkxfDD9RTmN2PzjQtEvW6nwWjMK88v2Wb87MwR7er+TVtNUpc/Yib/uCS8WFt
	 a/ucL2qyzRRciW0bqeVzx3bAyM8RE1GAGxOyEZfZtBZIVtZ6eRbC2PB1JqVtvfJcXy
	 5tv0r5eVg7RGzYnoFJdzGD7sJ0EPmBJWJDAbab6ZFigKjiZN2Iv5tR4rO2eu5BQ9dA
	 474/tmhHHqNrA==
Date: Wed, 25 Mar 2026 19:06:04 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
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
Message-ID: <20260325180604.GA2972@francesco-nb>
References: <20260313174707.26902-1-stefano.r@variscite.com>
 <abRdwy_AS046QVRI@lizhi-Precision-Tower-5810>
 <acLqjeqmR4eVDoKw@lizhi-Precision-Tower-5810>
 <20260325122104.GA19112@francesco-nb>
 <acP2UX6B5js_ozWm@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acP2UX6B5js_ozWm@lizhi-Precision-Tower-5810>

On Wed, Mar 25, 2026 at 10:50:57AM -0400, Frank Li wrote:
> On Wed, Mar 25, 2026 at 01:21:04PM +0100, Francesco Dolcini wrote:
> > On Tue, Mar 24, 2026 at 03:48:29PM -0400, Frank Li wrote:
> > > On Fri, Mar 13, 2026 at 02:56:03PM -0400, Frank Li wrote:
> > > > On Fri, Mar 13, 2026 at 06:47:01PM +0100, Stefano Radaelli wrote:
> > > > > This patch series adds support for the Variscite DART-MX95 system on
> > > > > module and the Sonata carrier board.
> > > > >
> > > > > The series includes:
> > > > > - Device tree bindings documentation for both SOM and carrier board
> > > > > - SOM device tree with on-module peripherals
> > > > > - Sonata carrier board device tree with board-specific features
> > > > >
> > > > > The implementation follows the standard SOM + carrier board pattern
> > > > > where the SOM dtsi contains only peripherals mounted on the module,
> > > > > while carrier-specific interfaces are enabled in the board dts.
> > > > >
> > > > > v7:
> > > > > - Order nodes in symphony dts
> > > >
> > > > Can you run https://github.com/lznuaa/dt-format for new file to easy
> > > > track and check by script later.
> > >
> > > I applied with below change
> > > - update copywrite to 2026
> >
> > How do you know that the correct copyright year is 2026?
> > The copyright years does not change to today just because it is the year
> > it was submitted.
> 
> At least it should include 2026 because it is new files in kernel
> tree.

The copyright year is not changing nor being updated just because you
are adding the file to the linux kernel tree.

Francesco


