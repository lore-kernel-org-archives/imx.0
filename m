Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BDF39659A
	for <imx@lists.linux.dev>; Tue,  7 Apr 2026 15:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575618; cv=none; b=TLZbJSyHRVs5pEyNceOBz1rMJmqLuv70RTyLGe3Y3WrcMLdOCMmRxlSnc0h7AhrNqRahDEfZWpj6bqvrKtX3J1XNqwWwa2MLRF3a2BRFVv+YlI7uMMSEQbkRBAHMktsuG6flzWorEmj+xfB2r/tM6vW+FL+XscDa5O4e4owudEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575618; c=relaxed/simple;
	bh=yejeZoVKUZHFqV0XnneKPKsQ6iizI4tcdjOQnPqwsiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mmMnTq2WLzGoLUv5y8YAJETbgP9SqvwwKdckXHc+PwBFzkwVICaSgi47uObImlhO1xb63a1hOYNlfmp2v+Vphskw/Hny8v7D/dC/MnyIIXfB3O5pSqRrDYrzhmlmNX5TuQnIT932Fn8euYn6E1OXznIfM+XNkPVGSThgyxOSvBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=dskD0HjT; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="dskD0HjT"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 880FC10E334;
	Tue,  7 Apr 2026 17:26:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775575608;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=dU+Do44yz0TIhjMzxEB+m3FIC55S78YfYxFAve6i/V8=;
	b=dskD0HjT2yjD5SVz9KueEeydV9WOAkhnuwUCHbXkQhY0tivDOX65200j+rnWwwFvO/+0nr
	FpETLL7rrumCu4VM+5Eco73mD0bedt8pgfn4LCi0Ed5HRv1hiSQU3PvCbb/nB9/joHwGSA
	fgxCU/TkTBvOKL82MAYhmC0k9yddbPRFSUTXhFNTN4eQpnufWc4ayeJFPOnvyg9uZXBoHf
	ExQZEiTa59u1GMQNuOfDFD1s75Sr9RcJfNOzZQwRkFQOzR1dCxP+0b7MSYQ8t6GMIBoEfR
	OtuXK35zZgP5sVrlgWtitZcIV5N0svb6ebVCQ9lp77GSDkhqFxJd7hmm4efc1g==
Message-ID: <5c0f6900-bb37-4c9f-8052-5d17e21180ec@nabladev.com>
Date: Tue, 7 Apr 2026 17:26:45 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus
 DHCOM SoM and boards
To: linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
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

I know I was sending quite a few DTOs recently. Is this set still on 
your review list, or was this one missed ?

Thank you for reviewing the DTOs so actively, it really helps a lot !
