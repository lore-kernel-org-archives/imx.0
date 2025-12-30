Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158491D9A5F;
	Tue, 30 Dec 2025 15:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767108942; cv=none; b=JEPXQKk+b9xB6WmfvyptCjRUyWNunThPODPY2x8HIMEkN9kshi7O4K+4VwaMlKkYhISbCBtpTzs9cSps/tkYLFx2x9KWdwA9LV8EPY5T4Ilk7JK0BR73N7SU8mWehF+MqilNKniFrw6C64VLToXs95dVOT1dWJDzSo63BCNpnE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767108942; c=relaxed/simple;
	bh=MuSzVtgUOGpaVN7HM9sl6lw/4bhujFasIJUp7R3MYDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7hmAHa2bsaJ8jlSWCU+MEdAFyDhmHR599c88JAMXEQvxMKBLSei7rTC65spfS76bWx6grt5mObYGOcwLEMISH3AVLqjMbBIKW32NdEIihszKMU0uvKH5tKTYU2VzjxQK6d3iN1xJRRmMwlBo/DMjw0OhRoixjW+RGAYvDaIYg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=5Pl0fCbu; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="5Pl0fCbu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nabQCJqKlBQXC+lm+okeZoBzrh5jPLLfEQ7mZ6JPtvo=; b=5Pl0fCbuJqu7Et0weELcwVXtpV
	1ARiSNGuY/8OKPPgkRUAwRclA+bSHkBnCeI1qEpc67aptY3qZjqdLut3Zo20Pf+DkX1rMtMpcVQkf
	rlAbNb72W/fMhsTLjqxnQfZcc77vzkqDjYCRnhGfG5yN+pct4Gt7xRI/ur+uxRenATDw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vabkt-000sjC-11; Tue, 30 Dec 2025 16:35:27 +0100
Date: Tue, 30 Dec 2025 16:35:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, Fedor Ross <fedor.ross@ifm.com>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1
 and v2
Message-ID: <51825dee-c2c9-4d94-b741-ffdc2fbfa773@lunn.ch>
References: <20251229193706.73564-1-marex@nabladev.com>
 <20251229193706.73564-4-marex@nabladev.com>
 <e3d305ce-cdfa-4a11-bd54-9648b12a013f@lunn.ch>
 <dc29e774-07fb-4d0e-a88a-27d4ec49d060@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc29e774-07fb-4d0e-a88a-27d4ec49d060@nabladev.com>

On Tue, Dec 30, 2025 at 02:34:14PM +0100, Marek Vasut wrote:
> On 12/30/25 11:46 AM, Andrew Lunn wrote:
> > > +&fec1 {
> > > +	fsl,magic-packet;
> > 
> > Upps, i probably cut out too much context. This FEC is connected to the Ethernet switch.
> > 
> > WoL for a port connected to a switch? Have you tested this? Normally
> > you would have WoL on each port of the switch, and not on the conduit
> > interface.
> > 
> > > +&fec1 {
> > > +	fsl,magic-packet;
> > 
> > Have you tested WoL?
> > 
> > > +&fec1 {
> > > +	fsl,magic-packet;
> > 
> > WoL again?
> I don't think WOL is used on this device at all. Would you suggest removing
> the fsl,magic-packet properties ?

Yes.

	Andrew
