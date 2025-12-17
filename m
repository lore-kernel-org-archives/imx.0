Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC9E341AC0;
	Wed, 17 Dec 2025 15:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765986760; cv=none; b=CIUue+D8jeK1m2n0/TuS5RMdIVSc1zt2SFQOtuAsXlQe/i0jzsOGTkSm/oBGUeGoQ7oxj/vMRApHRZ9A/hhjcXfZVyYiyDvUreWl/vUQVqvSTMij1Che+w0kVLbr0jMbQkMNrF4yLtBazlR53GJePIsKDb7XyYVB7yLPUPSi4pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765986760; c=relaxed/simple;
	bh=MCpoAlFVmnmwjt5fQla7p1YwOF/2EF7Z/7fCCCVx1I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5dZIFSDyB2GMPwSX7cX2+SG3ukuBzkWPR0j1XwYUY5EQLBadwxexAstYxDHt+4pvY7UpMrrJnefZKWGLoviJ2RpZEF/DxphaKCYp5x7ccbB8fP/p45K/ockX+CZ3cDnEMHwdr/AlCtXh1+0fSS0tJ1vIM3sygsGf6JTS8Nmxk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=2awD7JMM; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="2awD7JMM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GmCdUmun8i7DYrx9ukx8LB+w38euGgi3ZiwrBUVgXVw=; b=2awD7JMMSteFxPOaTotTcRfsto
	DYBDKFRNGn+SzV4GBSLnGthIC6Dx8dvI65BzON0A2SD1anpeTpZZNwyvJSekNbKKGM+tAabiekM1A
	dG/Nw5UNbyy8J0qDks71y0H46L6e7CQDCzO6bqDML+d+M+Sr8KOS1us8W5B0XQI9H3jk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vVtpB-00HEK2-2V; Wed, 17 Dec 2025 16:52:25 +0100
Date: Wed, 17 Dec 2025 16:52:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux@ew.tq-group.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: mba8mx: Fix Ethernet PHY IRQ support
Message-ID: <a450fb06-78b3-45eb-bb21-bdd4eeb39ea6@lunn.ch>
References: <20251216131529.886546-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216131529.886546-1-alexander.stein@ew.tq-group.com>

On Tue, Dec 16, 2025 at 02:15:28PM +0100, Alexander Stein wrote:
> Ethernet PHY interrupt mode is level triggered. Adjust the mode
> accordingly.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
