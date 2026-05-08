Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C09E238150
	for <imx@lists.linux.dev>; Fri,  8 May 2026 16:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778256692; cv=none; b=WeZmuRnAX9NZPRQ3SlebTHoWg6PQ1ta3tKYLNFgq6TPSpURTzXsMp6BYSWO87kkUQN8XMFwVZIJVFGwbJ9v8wSisFd8VtFQMSuJoc0r1RqXSS2JULRaK6Rad2aqk8e886Gv1JHMkPx4I71iDQRQ5vk+3oOsda53nh1vf8Yfqowc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778256692; c=relaxed/simple;
	bh=FOdj0BJSQzjLt8dMK93bvIy8frno7WnRoRcGrfXQyMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=paLeW8r3u6RL37cZNwCk5SYIuTAM9cdHy66fRXIp7FuuV7He+auOtiI96Ez/H30F4VA0E39deZQ8cmuoo2FheIc7ZRG+XBdBTTW3DLoGR+85L8bAw7Kxb5ocIegGQvCaPjXHKqLXtHJAefmufZ4P7VLJ4p6frSZJeVpVpTL8Ffc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=gq0X83b4; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="gq0X83b4"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56DA31134D3;
	Fri,  8 May 2026 18:11:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1778256688;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=7JqZt72XhG/KVFrIYIEjhPAAXnkJGN044O5l0gt/AWw=;
	b=gq0X83b4+4vBDpzWg8OO/K6cemloiZ1gTbue8rmAr0JHBskORf0VUxDVgYzZWJsKXkExmJ
	RLgjK68ZEoEbuuCsW/zliAlpjzI0674KQTqh5aCz+g0pQPlA1F6GdxEvhkVprMnJRmnA8W
	gxCzTT3ISV2n/oLom5FFPFqEs5EO2+fRI/brHE8UMpYYjzurFYXtxA3ScFRY+Rd7ITwImx
	CLYY0NZ0ANTHwCbvYWhlSxKLCHUf4DcMGfn9hd1erUI1b8LWszq0WUNwHV40ZOl8BaxG6Q
	9pBaF8wO9LCwPabdQBHtHluo7vVEUh20rQXR/rz1d3jkpkMOFQQCWYWNoEMtmQ==
Message-ID: <65e27834-03b8-41a6-a418-126959bb64da@nabladev.com>
Date: Fri, 8 May 2026 18:11:23 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus
 DHCOM SoM and boards
To: linux-arm-kernel@lists.infradead.org
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org
References: <20260326044411.222907-1-marex@nabladev.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260326044411.222907-1-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/26/26 5:43 AM, Marek Vasut wrote:
> Add DT overlays to support DH i.MX8M Plus DHCOM SoM variants and carrier
> board expansion modules. The following DT overlays are implemented:
> - SoM:
>    - DH 660-x00 SoM with 1xRMII PHY
>    - DH 660-x00 SoM with 2xRMII PHY
> - PDK2:
>    - DH 505-200 Display board in edge connector X12 via direct LVDS
>    - DH 531-100 SPI/I2C board in header X21
>    - DH 531-200 SPI/I2C board in header X22
>    - DH 560-200 Display board in edge connector X12
> - PDK3:
>    - DH 505-200 Display board in edge connector X36 via direct LVDS
>    - DH 531-100 SPI/I2C board in header X40
>    - DH 531-200 SPI/I2C board in header X41
>    - DH 560-300 Display board in edge connector X36
>    - EA muRata 2AE M.2 A/E-Key card in connector X20
>    - NXP SPF-29853-C1 MINISASTOCSI with OV5640 sensor in connector X31
>    - NXP SPF-29853-C1 MINISASTOCSI with OV5640 sensor in connector X29
> - PicoITX:
>    - DH 626-100 Display board in edge connector X2
Hello Frank,

how can we proceed with this patch ?

I hope all the feedback has been addressed ?
