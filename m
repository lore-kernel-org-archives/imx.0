Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B628635502F;
	Tue, 17 Feb 2026 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771340000; cv=none; b=tDl5AhiXb9+LbCS0eW+ewZ2ggFLeeSCt7U1CG1FaB9ZErQ3TF5uCuVMnrtTDTM/cjO9yUnL0GAAZ/M178IvmFt58hFIr8r2/Hhesd5jGCILf8hoFMS3Tm2zbbHPvJ5X6e/+1mb/0CGTCg9JYrQrw+7zwW5eXYiT69EytsOx7CnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771340000; c=relaxed/simple;
	bh=of7fP2gkYPecNan7Os7HTGIRiGclwxHTsW+Nqw8qLnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1ylQ13CWPIG4aQbmX3G7Fro/hSrcy2ZDE/ED4lV5cPVxp80+/0T8y88ZpnH7BJunTBfmrIjrtmJk3eXp5gFTymNz4U5h2T5waP06fkBl8EA+owrzhiMKJs2LRevYqEsWwZ6+h6QYMtu1LNhtftgDO0KXNRkG+U5G8rT8R8arwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ahjoqDGR; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ahjoqDGR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=noah+ahWLsLbjMlCHgxT7YuEr4pbD0Lx5cvHqvNKHn0=; b=ahjoqDGR3dg6s6pXBpNrSOh2En
	AHtLeFFglpmBgoJ/oeuG49oOkw9EYh90FYlkrJtpiOcUOBd0+u7LXhUbMjRVJeYB5kBXd9Ig3XdKE
	fDSVhX/zBw/SZF+z4qpN5FgVCUAeS5wDProFMTC5iEkK+uAuFeapI7UO/a+FVDauSOA4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vsMRo-007een-4Q; Tue, 17 Feb 2026 15:53:08 +0100
Date: Tue, 17 Feb 2026 15:53:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM: dts: imx: bx50v3: Configure switch PHY max-speed
Message-ID: <6dc304c8-2e65-4090-85b2-4b69a5751823@lunn.ch>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
 <20260217125952.53997-2-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217125952.53997-2-ian.ray@gehealthcare.com>

On Tue, Feb 17, 2026 at 02:59:48PM +0200, Ian Ray wrote:
> Configure maximum speed for the switch PHYs according to the electrical
> connections from PHY to RJ45 connector.

Are you saying only 2 of the 4 pairs are connected to the RJ45
connector? And i assume you are using a 1G capable PHY?

> +					max-speed = <100>; /* only 100Mbit/s lanes are routed */

lanes generally refer to SERDES interfaces. For twisted pairs we use
pairs.

	Andrew
