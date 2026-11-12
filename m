Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794552253;
	b=umT7H0EhBBXkn13RnxWrTSayAakS7Xk+rYORenrPZPwtORoxywIG3rF+xnSs67Nj9j2p
	 O9Iune4fV/jQRgUn24y6A0zPepMfkIAQCJjY1fH1dvpM06JFQbwTIkT3xUsnBEzlRHTzI
	 n1tExOOoXDTOq292GJzamRCxPL4Svh6VU1Y4QnkDDOQ6tvTj5MnGcOuJm/JxJVD/64df7
	 4erM93difp2qwz8YXPipwncqni1H3u4dFymEBocBD7GxRbIrrPejEC+L4Jwzzzn6Nehdw
	 +jKbNjGiSOmtGXzRTfPtxv2pT8mFJ5GdfNDnqaPbUAMb8U4iuN5B2FFG6qFNC06hMIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794552253;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=IcVw3g/JBjj6GtqZdIE2sYgdy1L6jP6M45BK0w8hcZ4=;
	b=sB78H4I27cDoJLJIr7jtbO0+NCnl1lyiwX6VJcxR6jh6u1vR09ZR4VheYMiwjLrVk03+
	 gMwCcp8+eG9zZqDzH3xaZv83oq1Trb1s9aDVnHXEJPQa3wkzja3qd1xUWmUAiXieELYmT
	 6PoAOWIoes4ns9GwuYmo33R47QQcRtxeqkfQQ1DAaf1/YcJjHp6IiiUs1wKL9suaZeqsi
	 jDvj9O9htGvwnC/tVBizVZ6bDl0Sn8qhFUTxVKSiSkAb5M5Byqzch4HJ8OXKgN4v39tdF
	 NrybJjCQquOkIZMALRkHKoNjpXr/WyInnNP3codqzMmTkE8Fw7ndBXjgGSVTWSvxLjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=WC6QlWbz;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9F5606A323
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 06:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A9F5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=WC6QlWbz
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF34310E5DE;
	Fri, 13 Nov 2026 07:43:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794552240;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=IcVw3g/JBjj6GtqZdIE2sYgdy1L6jP6M45BK0w8hcZ4=;
	b=WC6QlWbzVFDK0TvsKdEBz/ON16SyDumh36HZf7TAzJQ6/KYt/ANF8PKz/46gaRMxDI9Ul9
	uNvgEOfQStPaE4BVsZeDmndmomSEzu3Qp2WUulW1h6cMLdVzgqlw1jATr5L+3Bx/S6Ye11
	oIIAr6MyZ81BZqaI48ryS+aRKaZ0076X46BImlWcwrnvFNxL1UVGPzcMMaRiwt3s6LNECp
	HP3EFlnxc5JLZ4M44aZQAGzuBMsKdOYduFwnU8NNWTpOj80j2G0/Iz4FPzxMTmMCM9cznQ
	oBu1C46pMDMJgL6yOOzAIqIzDEsjSosIodwD8vB46dx5MEVJI5p8uh+1KhJoqg==
Message-ID: <077477f7-3b1e-4ed5-ac53-45ebc01c47d9@nabladev.com>
Date: Thu, 12 Nov 2026 13:35:17 +0100
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
Subject: Re: (subset) [PATCH v6 1/3] dt-bindings: phy: ti,tcan104x-can:
 Document Microchip ATA6563
To: Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Aswath Govindraju <a-govindraju@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260930214729.809649-1-marex@nabladev.com>
 <179447423905.428303.6835437411622016722.b4-ty@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <179447423905.428303.6835437411622016722.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/12/26 10:03 AM, Vinod Koul wrote:
> 
> On Wed, 30 Sep 2026 23:46:38 +0200, Marek Vasut wrote:
>> Microchip ATA6563 is High-Speed CAN Transceiver with Standby Mode.
>> It is pin-compatible with TI TCAN1042 and has a compatible programming
>> model, therefore use ti,tcan1042 as fallback compatible.
>>
>>
> 
> Applied, thanks!
> 
> [1/3] dt-bindings: phy: ti,tcan104x-can: Document Microchip ATA6563
>        commit: b338621a7e68bb9dc91d08e1774262deb0db50f6
Thank you.

Frank, I think you can now proceed with the rest ?
