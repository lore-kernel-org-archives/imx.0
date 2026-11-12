Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794552255;
	b=UndDzgbp4pVJDmB5IZJiy0tWhPxuVa0OahxHnGO9mQAarM2C52eYt36YD8Mosj2M+SD4
	 5MKgjgY35jkHN5KdeoxdAjR1MvZ4ryZHHpsuAzgGz+uhpes18b1bOtFcEnbpXAquEfXpK
	 nh9lWGldCxVClY5mCleo5Rei6yd30M6SGAzxafpjNSNjPSRrGX1Ati9rqG8HVDreWA4XQ
	 KGeQ7DbraDgbo5i3SgfYpxaLBRHbxaI8fWyT4/XL5i5+lh6H5PRDOO/vKtJ2vPFB8Q8JR
	 XXT65njKB5SuiuXl55Jnnm6g3B6szA00C1ObWm8oXVH/WSyy5CJyMD7DuAA8zIu9SKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794552255;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=tVqWo4cVCxBufMJRq8N/ZAqWxdIZ0UAwob+ppyXcu3U=;
	b=a46qP+tqiYoxQzFXYTaz1imVRE/KPNwTu127FLXt5MhygEIdSCod7FAOz62DsM3hhYxj
	 PjSnJCehffV0XgH2UbHHMWUw/wDNqANPPDvh0QrdAVqCyDCH217Yiy8wbEekrhNLbOf+F
	 VDZDHnPO/J4X/sNGdoRhgvRTszglQJp4Cva9gOqh4/LLzwpxSOvSx4UmrSoP8fU+BUkvY
	 Ks5wO+vTYMOd9jtGDv+GGFRAiaLtuB/VIVFScSt3sIdQ/pcNzy4c6q509YgMpKwdcaFBO
	 hOjqTncX6augVS0wk4zC4K1nqCFhg7GVz0cvKO1ilvGPh6ogybElcVe0owPrnXZaGhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=BJqKcKPQ;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D66606A8B8
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 06:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37D66606A8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=BJqKcKPQ
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF69C10E6A8;
	Fri, 13 Nov 2026 07:44:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794552249;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tVqWo4cVCxBufMJRq8N/ZAqWxdIZ0UAwob+ppyXcu3U=;
	b=BJqKcKPQIyZTHht8rnp6/wF4liFZJl+SeRXYchiuCNM0JlAXNdmnQ8QQAwxj1Xl/fh+dfA
	UVlBqScY20LOgjyzSZltMux4qMdC6oWcMAb48KMaLFR6jlc4nnt4SSuhLJHo75/qhYCiar
	w24XUFfKEw7tRLbY/dapb6u4EY5yi3j1oGua08eHOAxheFtmAhzzxsCupzsS5jkDebEHup
	a4oALLWDRN+pOvhgRr/4TUUeg2QcasWfbxXt5jz3K6gHOmz3ISlBS5uHQ5Bt+9PSt0krTi
	97pE7tLSUHuRHslkfSHhRVgDWKPoUgCFmMkviVzb/JH1kxCejXx331gy8g5YPw==
Message-ID: <d218212f-191c-47cc-843a-d4587e478fc0@nabladev.com>
Date: Thu, 12 Nov 2026 18:13:53 +0100
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
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Aswath Govindraju <a-govindraju@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260930214729.809649-1-marex@nabladev.com>
 <d8c3ca76-3d93-4abc-8a78-d23e0f018975@nabladev.com>
 <auGdT2kdxwfbB_ol@parshuram>
 <0865fe86-3ea1-4ebd-8ded-642eff159b97@nabladev.com>
 <avXqWxBQBK2lKPMv@parshuram>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <avXqWxBQBK2lKPMv@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/12/26 5:33 PM, Vinod Koul wrote:
> On 10-11-26, 14:59, Marek Vasut wrote:
>> On 10/28/26 7:59 AM, Vinod Koul wrote:
> 
>>>> +CC Vinod, is this patch OK with you ?
>>>
>>> Looks good to me, I will pick this after rc1 (monday)
>> I would like to do a brief reminder here, so this won't get lost, since rc1
>> is now out and I don't see this in dmaengine.git.
> 
> I have picked it up in phy tree...
Thank you !
