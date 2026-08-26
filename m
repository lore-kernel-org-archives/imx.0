Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4862331EC2;
	Wed, 26 Aug 2026 06:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727207; cv=none; b=BU3Y7j5uGLIWJIuUG/XH4t4ID+jS/ydvzb1dd4PWVFQiV0VQkTCh08BRhOFdgDsiCeMQMW313TgQ9ANezG8wBGWDu5NT/BDzO7KJXFnmvmZ5I4GPIr/3UNlZxinc0UwaZ0ea9Gk6gjnniKv9QUdbKlLtua7qSIWGRBa5Xo/zcuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727207; c=relaxed/simple;
	bh=s/9JmweWiv7GDXJe4rLCIzj1MuD/gPA2d6O00LKCGdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQ9xygvPK88CdUhERG6xlYJTrazNqtB4jIGsyIwM9bHC6qoPGSzpyJDhM/i3VntXKg2btisv8RvgHhKDB2z/Eg/Ulb4muYet8X+8CuLjaO9jFSl5WRTrVwxQCTbDca6vVmiRddxMxGOkvGVR78cMl2Z3vnM17vTamOq+CJVRRes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSAyqPIp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSAyqPIp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6DE1F000E9;
	Wed, 26 Aug 2026 06:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787727206;
	bh=jWX41gMrpdeZpbNdGAMYnzObdEVxYUoGN7RNSO9SpgA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dSAyqPIpI/JDU/zOlXIN/Wc86U9O+Rd4czaPAoW4UT55ucbtCeU+fLY8SH6VWw+97
	 rs4ap2PSqvEum70QXqmOocNDGsJEHhRhJQH8131+0qvL2/YdE4Gx/3LXOv1wYCRg/y
	 wk/MObZ7TyztaHUedCaPRvRwJFcSueCGFO8GrpU2blWgbAi8Rz+Wj+GrOWyNMT8TVP
	 AMdcjVI75wFQ01m0p2H9zfjUd9g5omEjYmnx9+Q/45njIBOoC4/0l/3nst3jvS5K3q
	 dmb9fXWbR0ovxhg9FNAM8RN+KeoNAegHm1/zSvs5wd1DvdR/lDPKVqPco32m7tlTrW
	 eGfB4Dn9gJXvA==
Message-ID: <1a29c89e-d238-46bd-a786-787a3b6c77de@kernel.org>
Date: Wed, 26 Aug 2026 08:53:13 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/18] arm64: dts: ti: k3-j721e-sk: Add overlay for
 fusion application daughter board
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, nm@ti.com,
 vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, andersson@kernel.org, geert@linux-m68k.org,
 dmitry.baryshkov@oss.qualcomm.com, arnd@arndb.de, ebiggers@kernel.org,
 luca.weiss@fairphone.com, michal.simek@amd.com, sven@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, r-donadkar@ti.com,
 devarsht@ti.com, u-kumar1@ti.com
References: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
 <20260713113423.2310443-10-y-abhilashchandra@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260713113423.2310443-10-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/07/2026 13:34, Yemike Abhilash Chandra wrote:
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	clk_fusion_25M_fixed: fixed-clock-25M {

Please use name for all fixed clocks which matches current format
recommendation: 'clock-<freq>' (see also the pattern in the binding for
any other options).

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml


> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <25000000>;
> +	};
> +};
> +
> +
> +&cam0_i2c {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	deser@3d {
> +		compatible = "ti,ds90ub960-q1";
> +		reg = <0x3d>;
> +		clocks = <&clk_fusion_25M_fixed>;
> +		clock-names = "refclk";
> +		i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
> +
> +		deserializer_0_ports: ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				status = "disabled";
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				status = "disabled";
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				status = "disabled";
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +				status = "disabled";
> +			};
> +
> +			/* CSI-2 TX*/
> +			port@4 {
> +				reg = <4>;
> +				ds90ub960_0_csi_out: endpoint {
> +					clock-lanes = <0>;
> +					data-lanes = <1 2 3 4>;
> +					link-frequencies = /bits/ 64 <800000000>;
> +					remote-endpoint = <&csi2_phy0>;
> +				};
> +			};
> +
> +			port@5 {
> +				reg = <5>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		deserializer_0_links: links {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +
> +	deser@36 {
> +		compatible = "ti,ds90ub960-q1";
> +		reg       = <0x36>;

Whitespace mistake.

> +		clocks = <&clk_fusion_25M_fixed>;
> +		clock-names = "refclk";
> +		i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
> +
> +		deserializer_1_ports: ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				status = "disabled";
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				status = "disabled";
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				status = "disabled";
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +				status = "disabled";
> +			};
> +
> +			/* CSI-2 TX*/
> +			port@4 {
> +				reg = <4>;
> +				ds90ub960_1_csi_out: endpoint {
> +					clock-lanes = <0>;
> +					data-lanes = <1 2 3 4>;
> +					link-frequencies = /bits/ 64 <800000000>;
> +					remote-endpoint = <&csi2_phy1>;
> +				};
> +			};
> +
> +			port@5 {
> +				reg = <5>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		deserializer_1_links: links {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +};
> +
> +&cdns_csi2rx0 {
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		csi0_port0: port@0 {
> +			reg = <0>;
> +			status = "okay";

Are you overriding or adding new nodes? If adding new nodes, then why
status? If overriding, then why duplicating properties and entire node path?


Best regards,
Krzysztof
