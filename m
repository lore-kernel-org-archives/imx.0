Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105716;
	b=o3WsKsthJmM3gZASl2W+7WXx0WJMcNUrnXQs5Dm5oiaHbwYMIblrPyS5kTcq0slJzRKr
	 9zOxkBG+eZGaNjkBKo5TvYQjO7Gn3xWJJqnnq/Muoz+AosE4x51sFkOUywcumMzmYmPB0
	 mFX+7fHMCfNA30ZSCotqfwU/5KBqWL+GlxUYAVMpJ9l5Lw/MNxtV+UqSDWwDsTlKvXMLT
	 59aGJ4ZlvHFr0/wQjTB4HvpmzT4z4yPUgOCM+C48fOFfFgRfnVthlDRRSymKmtpTNrLse
	 GGxrhoA/Hv4t29d/yqmqgB3315P4HFXQDedNAeQ5XYKJiJBdtIA35ia8j8tQZjjrzZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105716;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=Df7/tfGdKfRHftGQ/gC+HL2nvok6xw8ztV6Hfi9otaU=;
	b=dZqv1rnZ5+BnfbfLLHBiSngg1kFjdKLjT+oAeH0Kg+dBHG+CttoNA4YNykXdPHtIvr6L
	 pFBQjR1zhPEudhjznY7fvOmvNjNRuD58KTYaVkOg8gk6WzcBuYn3pG2rhbXpFF76k4RYk
	 zTkMqTRUA4r2SZlxpdveifEk4AhKintfTTHNoNE7RNI4OfQuVv5e8o6nShsd1RFeAv8GL
	 sIL8XNY3UBArQi7A3sulFcRt4nIQP9O7cFch58ArposNkJlOuChvjs15KvSthtpZzv5i+
	 DEWGOb+vUcysMDkOlGi+oS1w0sV5fLY1+lMUYzBZnH1h2l7ONlfbBl9jNov82T9F3eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=LuaWo06y;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FCD606A322
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 12:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78FCD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=LuaWo06y
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 167B81086BE;
	Tue, 27 Oct 2026 13:55:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793105709;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Df7/tfGdKfRHftGQ/gC+HL2nvok6xw8ztV6Hfi9otaU=;
	b=LuaWo06yHgeJcci5b0mvXB7saV6QxpGuSXp1fv7vvtphCljN5G+9EPMdCACYrDNJcI8bWy
	JduBWnM9lvfWoIc81KsOWvnULaFhfVtIr+AdrhshBGFMkQ/o53BboeAO7pQpvaIdBkUA4g
	meTWPoO59hOWpZJ29BYmqAfdR16sxJGvlQRVhNk1DpmsHio4kaZ1u1b331Bd/ntLhjEmgJ
	/JyiD2reabKzP0sXHSaVuHax7Yu0lM6gmT51z0bfhJj6KgeYVMgUYkXKR35odSqGjEfz5n
	eoLMz/tdybhpsa+Ub+OfhEL/2MdIcSdNPKhyug3TQPdlIoojAMJrMpJMG6whGQ==
Message-ID: <4b2a721d-f333-4146-8e47-f5b38b378ff5@nabladev.com>
Date: Tue, 27 Oct 2026 13:31:13 +0100
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
Subject: Re: [PATCH V2 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused
 SPI device
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, kernel@dh-electronics.com, linux-kernel@vger.kernel.org
References: <20261027111201.20936-1-cniedermaier@dh-electronics.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261027111201.20936-1-cniedermaier@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/27/26 12:12 PM, Christoph Niedermaier wrote:
> On the maveo box, the SPI pins are connected to connector X10,
> but no device is connected. The device "dhcom-board" was used
> only to test the hardware, but was not removed afterward. So
> remove this device to accurately represent the current hardware
> configuration here. Also remove the okay status, since there
> are no longer any devices defined in the interface.
> 
> Fixes: 145e2732a5e9 ("ARM: dts: imx6ull-dhcor: Add Marantec maveo box")
> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Reviewed-by: Marek Vasut <marex@nabladev.com>
