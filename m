Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DF63FE678;
	Thu, 26 Mar 2026 15:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774537655; cv=none; b=uut/6zfKCKQZ8PkuBOCYeaKinbFz05vZScUVy8mOUUBGsw+DETVNAH/yZpQDuRe91hhDioj4xlySWvaScpzVpfeRj+hs2yj+IylZudNMaOE2oeTnzHKf2znQz9gGv/NL6JrqqqC3RJwM76my+P/sJx1etJz3E5pmaGwSfMogt7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774537655; c=relaxed/simple;
	bh=V4Y+CUePnyJQjFoWsNNW3katb+RbnnaCy7U53T8BW5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/aDI0TjLyxVPrjL0e6151E3lGT49OmNEe/E1YiRkUwRGWVzTbWd1tKPFAxMKJ88kNgR4lcUXMvCe39uJ2ah6k/XT4fHI74gaSeYEihPSNfga+CaVULSHDzMiboz0WLzby/S+mGv00ayLQzHw7+U0Di5UY+PqcdqFgUA292fbNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=jBwPy/JM; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="jBwPy/JM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DjFhihNQXqVvaS3yrIRsjhwMKylGgdbEHwpl/RezACY=; b=jBwPy/JMyqbXw1QFp6IaqaQEc2
	bWW9fpWpXm545sborXC3of8i8MKsUHrkJOuqHEi6Iwa0Vfu/6ve6+FvgeEm+t7dOpxI/3dpcAy5GW
	okIbuXyklAfD25rlOA6GZKUYhyEDDT5htKEwSgJLSJw9LcyFgaJQQuPj+qVAvqBo8DCQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w5mIz-00DUw2-OE; Thu, 26 Mar 2026 16:07:29 +0100
Date: Thu, 26 Mar 2026 16:07:29 +0100
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
Subject: Re: [PATCH v2 3/5] arm64: dts: imx93-11x11-evk: remove unused
 property clock-frequency from mdio node
Message-ID: <b247f1d3-8e2b-4320-a66d-5e6cb0591369@lunn.ch>
References: <20260326-b4-imx91-qsb-dts-v2-0-b991b81639e6@nxp.com>
 <20260326-b4-imx91-qsb-dts-v2-3-b991b81639e6@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-b4-imx91-qsb-dts-v2-3-b991b81639e6@nxp.com>

On Thu, Mar 26, 2026 at 03:51:39PM +0800, Joy Zou wrote:
> The clock-frequency property is not implemented. Remove it to clean up the
> device tree.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
