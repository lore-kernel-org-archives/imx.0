Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009918;
	b=fe+RFiUt5ilXuYqJ0vae8bTkdLf78AMIe96jxLLC9vdinvIcY7S9yKS3x4wFY271olvm
	 bKu0YzgR8mrxRJB0kosUB43ZsMef+Zpr7B5uTsHKtMURFMDYuGwmJxtEJjPGqr8sHHMuf
	 u4EZWHrxvsl6iNRF8ED4W88TiXr4Nyn4U1gWo3fvkoa1GywZLO4J9Yp3Y4rB2x0HhHvct
	 FIr5cwOdGgUY2iJPlN3qs8ivHl/tpgBcByoOtOtkolXu3Gfi9RmYja2smRHH/hq/KC/Rn
	 8DT6/HIkAaBuuj5BTMpgsFNKBTzQUWdySdeqQ8tzWWXdoi3aVbjGDDJ4bRUNR3ztYPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009918;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=VHLJsIJFyqtvRqXnKEHB3qZMFu94gIc6D+p1OgPM6lg=;
	b=B3SMA7EcwzFrnA2gjdiMOGZ1q6aJeolu3cNklztdKz2V7bmZ6iDNOJUTeh9+57XYaK/F
	 uKRU6AhTwwx0XxMU/mZG56J7mKVa99X386W0QeCEApP8Lq6q/bGXWer1I8Ixvwh3Rt9jA
	 0Lv5owK994dypVGvwgkzqZt867KfdMUUxQ9CXGYMUxdY95+TJiKkR+JiYLBRrsZsRk7pD
	 bxSpZKrjbXdojcde5WZPTOpXBkXYq6Y+Bi3jOre3PeF97vwjgwy9U1qOZstF4QP5l/Hrk
	 lLMbDv5yqzsknhgu27GViDovFMpTHxpMj1fnw2EIjdIw4J2TC1jHBl6xYYqaD67glGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=UJwMBM3b;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2CC606A333;
	Wed, 18 Nov 2026 13:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A2CC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=UJwMBM3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VHLJsIJFyqtvRqXnKEHB3qZMFu94gIc6D+p1OgPM6lg=; b=UJwMBM3bNYcqNwC4wFX0wj7AXI
	qKVW+I8+d0IxCWWoCwDJ5G8j2vCIcoHJDYlAHxPvGCkpScvC5mZ32Lswu1TmhL8FTvWCvzgoSNrJe
	iVJXIPZAcXmilKSIbPAsnNrpRVUvS1W3P1tlPQcYSGeGvwEHBeFaJNcKdesb3Es0hluU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTg4j-00HQiI-Km; Wed, 18 Nov 2026 14:51:49 +0100
Date: Wed, 18 Nov 2026 14:51:49 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Frieder Schrempf <frieder@fris.de>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, imx@lists.linux.dev,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH net-next 2/4] net: enetc: netc_blk_ctrl: add i.MX952
 support
Message-ID: <abd5b300-2dd6-45b9-9ef1-c7c123b6dfa3@lunn.ch>
References: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
 <20261118-imx952-enetc-v1-2-25721440602e@kontron.de>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-imx952-enetc-v1-2-25721440602e@kontron.de>

> +static int imx952_netcmix_init(struct platform_device *pdev)
> +{
> +	struct netc_blk_ctrl *priv = platform_get_drvdata(pdev);
> +	struct device_node *np = pdev->dev.of_node;
> +	phy_interface_t interface;
> +	int bus_devfn, mii_proto;
> +	u32 val;
> +	int err;
> +
> +	/* Default setting */
> +	val = MII_PROT(0, MII_PROT_RGMII) | MII_PROT(1, MII_PROT_RGMII);
> +
> +	/* Update the link MII protocol through parsing phy-mode */
> +	for_each_child_of_node_scoped(np, child) {
> +		for_each_child_of_node_scoped(child, gchild) {
> +			if (!of_device_is_compatible(gchild, "pci1131,e101"))
> +				continue;
> +
> +			bus_devfn = netc_of_pci_get_bus_devfn(gchild);
> +			if (bus_devfn < 0)
> +				return bus_devfn;
> +
> +			err = of_get_phy_mode(gchild, &interface);
> +			if (err)
> +				continue;
> +
> +			mii_proto = netc_get_link_mii_protocol(interface);
> +			if (mii_proto < 0)
> +				return mii_proto;
> +
> +			switch (bus_devfn) {
> +			case IMX952_ENETC0_BUS_DEVFN:
> +				val = u32_replace_bits(val, mii_proto,
> +						       CFG_LINK_MII_PORT_0);
> +				break;
> +			case IMX952_ENETC1_BUS_DEVFN:
> +				val = u32_replace_bits(val, mii_proto,
> +						       CFG_LINK_MII_PORT_1);
> +				break;
> +			default:
> +				return -EINVAL;
> +			}
> +		}
> +	}
> +
> +	netc_reg_write(priv->netcmix, IMX95_CFG_LINK_MII_PROT, val);
> +
> +	return 0;
> +}
> +

This looks very similar to imx95_netcmix_init(), and
imx94_link_config() is similar to the core of this loop.

Can some core refactoring be done to reduce duplication?

Andrew
