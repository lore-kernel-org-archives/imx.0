Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793121494;
	b=iVEDzJzYRa6P6Bacg8fRvmEpPIThajmiaEK6rvMLTDUCTrcQ8dJuPKnZbkvBfW7yMf75
	 8r2UyQrmrU7mhw5j9IXY8s77N5+LyuaQXZf2Nf9WlqLXqWo54HDGpVj+zIATw8yopfnsg
	 6L8WZLrT6vyBIwopDlxyJx14RQBQob9pYuCmhjg21QsHrsbiw+fIJl5/UH8M+LE0GLFpB
	 I004j7CaS9JffiqJDsVVkHhsRvT7/8oj0By6L+fYUZyUmSATDKs5TrGkbGWkPDrDAkee9
	 gmbH9qUJNcJVXdpT24PuV/TRlvaMuq9XjfoSk+oaUMo2OOJPU/vDvhbGRWkOHwDGEAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793121494;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=2AhgxjpsSrdIp3v7Vm9/tI7GXfZBUU0A8emiVMRDe1Y=;
	b=1CjPKOqBhsI2OE+tT60YT9GaZkL5CQ7l0boZfLQ1bsKFwhMMkAX8Z5eZLN2x6RzdMWP0
	 83uNM+kKBFpFcw4fDdSGdSa3VgbItwRdVhLwyhR61mzlcGKeXQ2XoEmkfI/JV8RBBefK2
	 DbeVlv2LnDDIrPEr1WJh1nt4qglPwuSbpKtEPTNwkfBcJyifalZoNun78aLlykc33mNVp
	 DzAsEnS4O7yAoQMw8+DK+pmKIS4jNAa9ulTUP2l70Z/wfEtDvHKxtM3NkkrracJbL6h5M
	 mo0XLSI7FPAvpXUh2H0RHnO9PadFddrQLMRkK0ARTjShDTwof1xvH/E25f0o/SWmg3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=cuBwKMs9;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E04606A31D
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 17:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0E04606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=cuBwKMs9
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04D35108D58;
	Tue, 27 Oct 2026 18:18:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793121487;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2AhgxjpsSrdIp3v7Vm9/tI7GXfZBUU0A8emiVMRDe1Y=;
	b=cuBwKMs9MSlJwuxyuBzukuPRq4nyr+PD2+XAG+5Mrfpivg6CkaDvPJUaTlihGzEBVqPNPg
	vp/Oef/DMqwsmFyYU6aHqdiJZx1f0Nc1FfJiBZjWTCo0aWhl9ukoNcs7O0h/aWzlO4yU4Q
	SZwOhx58k3ejTwG9KwmU3rJ5rDgT3TD3pp3z0dLyVUieJv2gOL5b9BB7Qw5F8H4VK7MJGp
	LRbL52txxSsxbZXYQgORwx4VIeVgWDCy0cTZysihyBMZDL55k115D0G4kAFJagj4K2EMLz
	/llBrGMjsh5UBjbE50L8yvAm2mG7xRAnqp6GQh2dQjCol4QHB6msL4yN2cAP9g==
Message-ID: <d8c3ca76-3d93-4abc-8a78-d23e0f018975@nabladev.com>
Date: Tue, 27 Oct 2026 18:18:02 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: phy: ti,tcan104x-can: Document
 Microchip ATA6563
To: linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Aswath Govindraju <a-govindraju@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260930214729.809649-1-marex@nabladev.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260930214729.809649-1-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/30/26 11:46 PM, Marek Vasut wrote:
> Microchip ATA6563 is High-Speed CAN Transceiver with Standby Mode.
> It is pin-compatible with TI TCAN1042 and has a compatible programming
> model, therefore use ti,tcan1042 as fallback compatible.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Aswath Govindraju <a-govindraju@ti.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-can@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
> V2: No change
> V3: No change
> V4: No change
> V5: Add RB from Krzysztof
> V6: No change
> ---
>   Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> index 0cf5fa21106b6..e97b1bc0a2e45 100644
> --- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> +++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> @@ -18,6 +18,7 @@ properties:
>         - items:
>             - enum:
>                 - microchip,ata6561
> +              - microchip,ata6563
>                 - ti,tcan1051
>             - const: ti,tcan1042
>         - items:

+CC Vinod, is this patch OK with you ?

Thank you.
