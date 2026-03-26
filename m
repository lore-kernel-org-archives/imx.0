Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D287F401A28;
	Thu, 26 Mar 2026 15:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774537700; cv=none; b=Tws/3xTx0FSqjmZWyb33pLHTXPe2FUqQ+jIgL4Hj7fduBeDRJFClTRBGCB/5HzR2KUhiXBuwtvzIersksCqIIssx6zOCoZFLbkJ35PRxymO7mw4OYm8XUrlTTcmUyLNYAGUEdR72vEj3g40k0K4W9T9GdrxucSV4ZT3ulscK6Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774537700; c=relaxed/simple;
	bh=PF1vXUNujyy8JJdoP/6gOdRlSdQKGwwoSN6M5CLRMg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TREH4iv7pDSrez7sMvXcAguUQeu5C1GV+5QqqazKnQOGJkZsBBBtqUs1rfKKHFZ3Mf1mDAFka1jCEEl1SCBb6qaCVKGk78goxNvpQsK3tc7oSEAi/OiKy8A4OTyKYTDJuMQ8lSMHHLCGHnNPP7uhrx5AhOcFof65H10Q9k/MQgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=vVe2fRZM; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="vVe2fRZM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=g3QV0jsfQP7a4wQAQxnfo7uKsL0aVR/nISEKAyiHSWA=; b=vVe2fRZMGFaglz06obL1vTyeOq
	z7YYeRQ0T9P/6tjSMUS/5MvhVfZKLlW/yFhXfTf/BWuvoY3jefkzOOSh5nNIb3wWDBUerjiz0LfC/
	Uu+PxtrpfeksXmQc37RTH8hLHKOy0aQQgO41KZs7mI0q65jK7XtPDMpNCMN777Q0Hahg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w5mJi-00DUx1-DM; Thu, 26 Mar 2026 16:08:14 +0100
Date: Thu, 26 Mar 2026 16:08:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joy Zou <joy.zou@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] arm64: dts: imx93-9x9-qsb: remove unused property
 clock-frequency from mdio node
Message-ID: <b57996d1-8722-46f6-ac0e-a73cdca1c401@lunn.ch>
References: <20260326-b4-imx91-qsb-dts-v2-0-b991b81639e6@nxp.com>
 <20260326-b4-imx91-qsb-dts-v2-4-b991b81639e6@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-b4-imx91-qsb-dts-v2-4-b991b81639e6@nxp.com>

On Thu, Mar 26, 2026 at 03:51:40PM +0800, Joy Zou wrote:
> The clock-frequency property is not implemented. Remove it to clean up the
> device tree.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Thanks for these patches.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
