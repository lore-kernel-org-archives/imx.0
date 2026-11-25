Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653281;
	b=V+IYcZpQrNUNqYnJihX0Q8PflmrNXsdtvMgRD+bi4oRb1c+yLzI49EUroFvpjZJl7FAN
	 ljVTHfp2HVB/p4G4cmoEHYOAZvFvyB3oEpjFoq5ov5PrTlDNdepG1g72qlxPCusgX/99P
	 wyuoJ1+6XvaTKFGwXI+4ks5WTL+zljPpr6ne+1weVYkKAxkwMOfwZEIysXcr6aPrivjh/
	 AUGVZFOL+AiLGVJKFTcGILjuUdU+xUFcf/fpEst7dUtEKJy0CgEIOEcCj68OGoBHi9Rm4
	 WF21QWLJvxYLYEeo8C0lN+ztZBFDPq5RNc4qoy75K2x3KVwUvKGxkIjRwBLkUltGH6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653281;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=5Nw1PUI/8+Dw+uE9Ar24vLwu5Jkm9NnRZmkT/cfK/VY=;
	b=H9qZkSXCybFbueRBj/i1vgh7Wup18N/3Irm3Ty7IGO0rPLRk2+eVvlanWIEHqB1fV7bw
	 im5a0vX6Cu4hbMzTF+QIE9UlAPP0ZeEcWG3hk2+kcZtBZA2iF/APcNuvPCJoAzpNk9AD+
	 QbD+ULvzF3Vd4s0ltvoJsFvT0+TGK4jT/52F/5gnCr2yHt02HMhmuXar5rMUyk/2TswPT
	 c8Yn68kMv3GQaueHaDMgGR8gKnHoRLNYTxPN9u0fzTi80lth+8FDEb028Z9sPlVG36d0J
	 PPm/5eZ+9fk8EYaRO2xItPsC5xHhsgZ8IzDabiU1jBuaQvycekXQD28DaKgJehWYHCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=bQhzdxgG;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A222E606A321
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 00:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A222E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=bQhzdxgG
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 230B9108AA8;
	Thu, 26 Nov 2026 01:34:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795653271;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5Nw1PUI/8+Dw+uE9Ar24vLwu5Jkm9NnRZmkT/cfK/VY=;
	b=bQhzdxgGhksJwhez1cJ6RJfzVetdIlhj0vPwN9rwGVYBtPNyApvgg/373hbFxzfNxLfqUE
	giGcpt/g6Riz6NkXX7MlUou5cdiCVwf1iU4EdubtCMUAMaXIInspO7A/7phxpBwMMXnrni
	rZkV9tfz8DAZHHEWauVaU9rBP+Tv++S3UYDLeTolvZ+3idCuqEbKUefSgQYP8XNh+ee+cl
	9tGnoIPIgM5ej/IOTSes+0VBnwrWmuyeId3huadFlb3YCiE4o8SHFW1auHf72LHKc0jLnO
	wcACDZZYitleGOluF4Jki8+2NRNJjKnkwTglkvLdMZ3J3PcuVQeAzrm3DCSRag==
Message-ID: <a57373f2-dfb2-4344-8e2c-6621a623d170@nabladev.com>
Date: Wed, 25 Nov 2026 14:56:36 +0100
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
Subject: Re: [PATCH V2] ARM: dts: imx6ull-dhcom: Change eMMC pin configuration
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@dh-electronics.com, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20261125125621.6734-1-cniedermaier@dh-electronics.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261125125621.6734-1-cniedermaier@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/25/26 1:56 PM, Christoph Niedermaier wrote:
> From: Pascal Zimmermann <pzimmermann@dh-electronics.com>
> 
> Tests have shown that, with the current pin configuration of the
> eMMC (usdhc2 interface) read errors can occur with a certain
> type of eMMC chips.

Which chips are those ?
