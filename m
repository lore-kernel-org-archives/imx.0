Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185595;
	b=dJ4bNnWPMheY7HbxYIRWC2VX0C3/57Pnt1rEP5k2X9A9K0CV5XJGYTR1q5wUNBhHNDBn
	 vhcVYovu+z8i2CJKlmEk3/Itst0XQtfxUCfSZBj6CrL3w2g5Mj45iTZnsEVXUKbM50H9N
	 Q0cyxXBDDxgN87D6gaqj32UTzRAVNncVvGRv6RP47VPJtaL24RA4cAUbyqNhrer4+D0po
	 iWE7U6QNneuo+R77bglJQqRX+/Wev9EDbAuEDWJGV5RJ0Qo/6sshQaHYKNSAloDurzSCc
	 Lp0PoR6xL9w0J1BNcMrG7Qbg0iihAIQnSFpkuRDws0o9i0Kn3iTAD9yva9H0G1JxjRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185595;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HERWT3R7sQc4IpReBoiiAir63QoWdA7u/aZTx6j4nHA=;
	b=M5cnzh9cJKGibF31UVbWUuC0MlnH/aSk7qEMzuL20DQZX3PWekTuhcLmWosQdZEeBIke
	 bB6ihouX4JaD7b8PYcbtjKgRaObBMjBACRk90KjyowNEPqiIv2kTy7K6eIykWPQo7hfQ5
	 LW4SQ63vo3pJGjfTLYCtCiqSQ0n7dz4WrBKxJ1NAxxF8C2rF8h9v9YdfdoFzjc1Fplrqi
	 CpY+xgjeeMnwyprs0vYy1X2q0xDHkgBqy/zb7IanuZ99RB+nxD1QFJ3ybboWtYyN85Gzd
	 ZyzsW8gOceT5A4n11TXBVemKOPQxT4LI4EMjctwJb5VV2en9kBpBae2PAc5JjKaU7sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l8n0JTrx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE9F606A320;
	Fri, 20 Nov 2026 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l8n0JTrx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897B91F00A3D;
	Fri, 20 Nov 2026 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795185594;
	bh=HERWT3R7sQc4IpReBoiiAir63QoWdA7u/aZTx6j4nHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l8n0JTrxgkutQ1NYeg/2mAqD9dggsgrVoyS5hBasWwKQD/+oBJypDhg0nAExQ9/gn
	 KruMn40VWj9RlFq1PHzQsPf5XtY/7co3wuQTPwtpmXbWFP24UgoNKQDNj1Ll8cjyMm
	 MNgqeqsH+W85QHKMOWHyi4mMQm4dEuCL6uxrqSWDDOn5Hq3qjc0nzxyDeqJlh6obqm
	 1sdU6vuwgfYFiKrz/OGy6o0Za5RCtrfrprdomNxMEu85OpVl9mXyuPcQvuC1mFbKV4
	 Ftic3aqDMqemZdRhOnaSMG7UVy10s0BdF+HBuquh0TKYvIrvwNtJHM1ZRg8jz4iOpd
	 3ykGvdQB7nvyg==
Date: Fri, 20 Nov 2026 15:39:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yannic Moog <y.moog@phytec.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Benjamin Hahn <b.hahn@phytec.de>, 
	Christian Hemp <C.Hemp@phytec.de>, Jan Remmet <j.remmet@phytec.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	upstream@lists.phytec.de
Subject: Re: [PATCH 5/5] dt-bindings: fsl: remove phyCORE-i.MX 8M Plus FPSC
Message-ID: <20261120-intelligent-victorious-jackrabbit-4caf35@quoll>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
 <20261116-imx8mp-phyflex-v1-5-4adcf8b4d373@phytec.de>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116-imx8mp-phyflex-v1-5-4adcf8b4d373@phytec.de>

On Mon, Nov 16, 2026 at 11:54:44AM +0100, Yannic Moog wrote:
> binding has no consumer anymore. It describes prototype product only due
> to renaming of the product. Remove it.
> 
> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 2d21a1949d949..ae823a7670b02 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1227,11 +1227,6 @@ properties:
>  
>        - description: PHYTEC i.MX8MP FPSC based boards
>          oneOf:
> -          - items:
> -            - enum:
> -                - phytec,imx8mp-libra-rdk-fpsc  # i.MX 8M Plus Libra RDK

You just changed this line in earlier patch.


Best regards,
Krzysztof

