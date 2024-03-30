Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16A431A66;
	Sat, 30 Mar 2024 16:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711817225; cv=none; b=Qdnqp/nWUWbexw16k8LyRVUYKXQHj5n4E4H/grubaQY3DGMw4i3vKahkw/aImMXzKY49uJQ7AcRnmIDfPmjjcEnO07ofGTYGh+FbJ0AUu3TOWy4mU1DnuAKSqPFkhztvMLYlXk+X2V//arKDZOnMqrCspKAvX7ZP9UzPK/+BSDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711817225; c=relaxed/simple;
	bh=Pkeb/Erxa2vSSl0nsdLrrs6P5Bsw14LxmyGp4Jl8Qek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCtSC79ZopjkPo3a3OUH8EkPeKl0s71XwFnnRQXPHpsAYMaPCZa5PoPE4yK8hfJH7qFmDE3Lcne2Tk+eLGQ8VOHgldp/yKVgrhwkfSbPXeqq2bNZUcz/X7yURkH8JfScarH2jyWc0xlfChCSSUmkuOnty5PYH1s0jLFP90Qsr0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=nFgrOBwn; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="nFgrOBwn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=dlGZMbSldrsWvsAy4OojGHQomfKvZx5SgHbUdtsv37Q=; b=nFgrOBwnC70GyWeeoDMeEN3AJ3
	peTF4jPtOE/dZDd2q9HV0sM0LuD9dTWRcwqO0fzXdYAWEGVzKTFEOl/7OreSMW541sDL/M+pOaFGs
	E1qa1lg8RdXmlexi6+OaYeRD0gw0us/THHMDIm7Mg/Z6yIsc7B9eyQaNmF9s7s7O6h2w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rqbr9-00BjNQ-FN; Sat, 30 Mar 2024 17:46:59 +0100
Date: Sat, 30 Mar 2024 17:46:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Gilles Talis <gilles.talis@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
	shawnguo@kernel.org, festevam@gmail.com, alex@voxelbotics.com
Subject: Re: [PATCH v2 3/3] arm64: dts: freescale: Add device tree for
 Emcraft Systems NavQ+ Kit
Message-ID: <3faf95f3-0f85-40da-92e9-0b6c7892225d@lunn.ch>
References: <20240330133410.41408-1-gilles.talis@gmail.com>
 <20240330133410.41408-4-gilles.talis@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240330133410.41408-4-gilles.talis@gmail.com>

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
> +		};
> +	};
> +};

Thanks for removing the regulator.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
