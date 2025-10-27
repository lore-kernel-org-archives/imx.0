Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD0015C158;
	Mon, 27 Oct 2025 02:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761533016; cv=none; b=Ta3aQqteQDe0x4CKDe7J8ufPj/xBbt+8MLyjNLH3CtryOuVP1NYJvsj5jEyqQBok+GRTCdVrjkPXNlnYUrCuexmlc6PmuHgw9qD3c+WSmoZBeFDdlhHIEDJRTCCzDD4BLSpyeM1Fott2YZziJxHqagnVjZ8sjGX7qKe57sXrEYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761533016; c=relaxed/simple;
	bh=b+aYPgvRmXODFJIhICTnQFUoIWUc1ZAapULBJII+XmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOSIN66Jqrg17dKGvUgbJbWE3U0uRJwfb2r4nSs0t4Zwv9eb2c4IK325dSFYWlz0yHTrZsckkrNHURuBZ2dHm82qVEpE2Un1lssQ+IsPkyQ1VzcSxdjGG9rEJdMh8MOzsY4ELWhTRHV2UJAj41g997+hQh0Sbw8Aoe7KwPZtzFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=cDOw4UPM; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="cDOw4UPM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=sb4JBmEsWtoEGyeTiszyx0RPQRE+/A3Z5NBMEzjYIRU=; b=cDOw4UPMJDU9CVyMTPEcvSFHTT
	zFcIz8uAGS3o+hLjVeEmqRMTl7hd0qQFs5MDi30fCsw3MN5swD9hqpjR7MU9QU4xTmWyhTY5DJqng
	e1EwaDoZyGZ4KcVmTo1HOtFZJLDYl/df68cmzaKqVFpk2nk/iTZKFBW7hCnjy5QoO0Us=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vDDCl-00C9Qj-OI; Mon, 27 Oct 2025 03:43:31 +0100
Date: Mon, 27 Oct 2025 03:43:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Fix ethernet PHY
 address
Message-ID: <3ca009bc-1683-4fff-a3e9-11997173a866@lunn.ch>
References: <20251026121730.13197-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026121730.13197-1-laurent.pinchart@ideasonboard.com>

On Sun, Oct 26, 2025 at 02:17:29PM +0200, Laurent Pinchart wrote:
> The RTL8211E ethernet PHY on the Debix Model A board it located at
> address 1. Replace the broadcast address with the correct unicast
> address.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Make sense.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
