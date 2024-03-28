Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EEB13B5A5;
	Thu, 28 Mar 2024 20:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711658530; cv=none; b=o9unHw79SspaD49KsSPYqQPYIgm6OgP2ysN/J57cvrweJpRrjkJQ1ULNMFOpDJPA8zEDaBHgahikcRKrfVGUUvv2DKC5RGiXyNoz9aP7e1d8N573kNpsKFzo5wXZjoBUpkHgzrllCwnnX5egfZjrjMABRro302fCqo+Bsy53n6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711658530; c=relaxed/simple;
	bh=+HIOS8a83qbeGCOPKAbZZoTpQVUPkpo/hpaOEwep9rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZniAxpz+foNYkCjTtxPj3fJ0yviF/qHLFCSXxVHUJMu1oV9iEKrSqWhAqS8KwGtoeTtcH97yt4BI9+buxz32/BCG/b6EYWJPYNDhHiwPE1S+jB/ePDDd3qYOnEtpXwfcZ2QL0tjSKUZpj/2FQYI1/3I9pCevvvmOX9fW6o3p0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=eX9yxJbt; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="eX9yxJbt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uEm8VM3dhyaO0sA74NgEX/NlJOhtIxbD417AOzJOEt8=; b=eX9yxJbtoa/noO/t+6UnGL3qPL
	5jy/azB/jxuLWJvRgTnNcqAB/s+piqr4fRdaQL5Ym1mmYIm5pRVpcIbj15fQTNVqnjxVgN8B6qhhZ
	cxeDi2bHVrHUAnl+C928Ip/2bdHqCGZuAbKUj2mnvZF3WAZQQfZEBIfvLCQDRZII5fmE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rpwZY-00BZR9-NI; Thu, 28 Mar 2024 21:42:04 +0100
Date: Thu, 28 Mar 2024 21:42:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Gilles Talis <gilles.talis@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
	shawnguo@kernel.org, festevam@gmail.com, alex@voxelbotics.com
Subject: Re: [PATCH 3/3] arm64: dts: freescale: Add device tree for Emcraft
 Systems NavQ+ Kit
Message-ID: <147dfc5e-91e5-4ad4-b818-f6717e62df45@lunn.ch>
References: <20240328202320.187596-1-gilles.talis@gmail.com>
 <20240328202320.187596-4-gilles.talis@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328202320.187596-4-gilles.talis@gmail.com>

> +&eqos {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy0>;
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <1000>;
> +			reset-deassert-us = <10000>;
> +			qca,disable-smarteee;
> +			qca,disable-hibernation-mode;
> +			vddio-supply = <&vddio>;
> +
> +			vddio: vddio-regulator {
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +			};

Please could you explain what this last node is doing.

       Andrew
