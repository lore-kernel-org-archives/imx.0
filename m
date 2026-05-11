Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8016C1A9F90;
	Mon, 11 May 2026 22:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778537719; cv=none; b=q1JhNj+JBQpv2smhot92McgcMlUppy8ORIfUWxWHy8ouBYytpemXB3X+cAWaC7rxkz1V48KZSlztmMmftyamQ9dyn5Ba9mRBXr9b7lUi3Pg2yQJ5BzejuxMqw8pKWBFLrl9lyR/LUf37R39aHhHs/RQdm2FjA/Qx1MD8U5USbos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778537719; c=relaxed/simple;
	bh=Q8w/gOkAYVfjp81UWcW/dNmRxEyS60yysoGbGftMQqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dk9uXCHs986noFhheU8jjwRGUxJdqHHcP7hvm72cZGpI9qnNnjHs37CLSTyKmX4GTfr8TxFFvWHlla6xFYIkRz8hKqwyRb9Pkc4F7lSOsK9n6Rm8BafaqimvK2L+tFC9bieuJTHQwTF8FL2dntnvlER29r7Iv5CpWEVR+vNh9Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=3iDx1+ce; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="3iDx1+ce"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3/K23XI4d03lV4vnZkh8tawAwrfuf0tk1XEGUfCzDW8=; b=3iDx1+cetgyRHHX1j3M5Xl67V2
	D7+f0e+EGFFrRC28M3lwLXGYlsYI5g1ImOsiUkx/mbw9mfAAn8RnnupBcrZO4lwrjtD9HvtxRzrKM
	XzaEtzA6bwXl/YVQlfaziean51GiGjwIUB1GVmfUMQMnHULBbjnMOExVWI9BkD442DCg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wMYu4-002Rhj-KG; Tue, 12 May 2026 00:15:08 +0200
Date: Tue, 12 May 2026 00:15:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM: dts: imx6qdl-sabrelite: add mdio phy address 0
Message-ID: <f04fadf2-8d73-435b-b713-9d07e48e80ae@lunn.ch>
References: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
 <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com>

On Mon, May 11, 2026 at 05:04:56PM -0400, Frank Li wrote:
> According to IEEE 802.3 Clause 22.2.4.5.5 PHYAD (PHY Address), A PHY that
> is connected to the station management entity via the mechanical interface
> defined in 22.6 shall always respond to transactions addressed to PHY
> Address zero <00000>.

Did you read 22.6? I've not seen a mechanical interface as defined in
22.6 for at least 20 years, maybe 30 years.

That cause does not apply in this context.

> -		ethphy: ethernet-phy {
> +		ethphy: ethernet-phy@0 {
>  			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;

This could very well break this board. Without a reg value, the core
will find the first PHY on the bus, at whatever address it is at. If
you hard code 0, the PHY must be at 0, otherwise it will not be found.

	Andrew
