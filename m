Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E181C30100F
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 14:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767106011; cv=none; b=ovTdu4SGPo/UM0Jwuhql4mYhfnhhuI4WSxZ1KTwY0J7mA3k5qPXUUAlXZRCjCXBk3YfFrTXzXwxKxQ/k5QZjk+Dzbzbm91QjgR0rKM0xVE4cZ8QffXBC2IPZcdaK7hEvfKRG2iK/48blCxyCAE/h7PpARQuNI04UhU1ShIG065M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767106011; c=relaxed/simple;
	bh=FOSwBkA6D8wNVzJWuqyTsxlNIrmgXBQDN53+fsjZB5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W8saxBRQzb6mBznfkNIbuJI5tcuvzRfHpohpsOIBr0QOKvYOTTwqzU9wNsrdgb92XiRbCaJ/AQn/oVaE0CnGDtVd/173LrtU08eP7B4mgx/bW+7F5b28dkZmDjkFVajxNuDVibPZqwJYkErBSJgVf2lDGYWm+jDToBfNd1HR3JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=X59Qmf8S; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="X59Qmf8S"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56FD0103014;
	Tue, 30 Dec 2025 15:46:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767106005;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0W5Lbamk+njEHK9A6i62wmfawW6k35N4fB2QmSx3b9s=;
	b=X59Qmf8SsAl0xPTK2kQt1HSX6OZQugbq1DDTsOtn/Gd3gXsUB34V3WwVrGvOt1hgC7iqjD
	lUt7zMY9AFGX9XsOQWn+6FNe0L7cJKoYGWZWvjOIVKXlmzoF3lb8eMfEbtfMfOgB01l0eG
	3nwO1xW9NjDE0yfjX/tGQYIEwCYkSNcr8lfxrbmMcorLsd3WrRAVSH5HSqj8BWD+wODM8F
	Mwt3n9wQAC8ragXjQWsJPCobnQ8rYOO/qQZceq1y/t4kKzELsQUdeQkb35OAYFhnhxiRbK
	Qv2u6GQka+vMgeA/Eu5IirEC9dKAG5Dej2n3NtB0gOi3OjG5DAij5uDQM5ZdIw==
Message-ID: <dc29e774-07fb-4d0e-a88a-27d4ec49d060@nabladev.com>
Date: Tue, 30 Dec 2025 14:34:14 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and
 v2
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org, Fedor Ross <fedor.ross@ifm.com>,
 Christian Eggers <ceggers@arri.de>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Markus Heidelberg <m.heidelberg@cab.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251229193706.73564-1-marex@nabladev.com>
 <20251229193706.73564-4-marex@nabladev.com>
 <e3d305ce-cdfa-4a11-bd54-9648b12a013f@lunn.ch>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <e3d305ce-cdfa-4a11-bd54-9648b12a013f@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 12/30/25 11:46 AM, Andrew Lunn wrote:
>> +&fec1 {
>> +	fsl,magic-packet;
> 
> Upps, i probably cut out too much context. This FEC is connected to the Ethernet switch.
> 
> WoL for a port connected to a switch? Have you tested this? Normally
> you would have WoL on each port of the switch, and not on the conduit
> interface.
> 
>> +&fec1 {
>> +	fsl,magic-packet;
> 
> Have you tested WoL?
> 
>> +&fec1 {
>> +	fsl,magic-packet;
> 
> WoL again?
I don't think WOL is used on this device at all. Would you suggest 
removing the fsl,magic-packet properties ?
