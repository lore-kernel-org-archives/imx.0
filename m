Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17411E511
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 16:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767715274; cv=none; b=iVxq++cU+lfO3gCo757eOc2aFScEnQjR2mvCPep1OaL6L8x3nKKc4k8PFujwliJZly1dHevfMjNLFw01IIFCbGFNYZY1FnQuSY+Ss8L13X1vR3kRGik132O32kHlsT+5Y2U/LCICNa/tFPlFetzSGooVQojk1JKYHQIffeXA17I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767715274; c=relaxed/simple;
	bh=cYPo78U+NxOTpBpJqxmS+oKYPiwkjDlSI1itNkZVjQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZmnUUfyVjykOpRQtVYSDqgeqbSttUTTnGT0501Ys4mByaAYo/Dn7zWmn/WuegTlOLZfgwvvZZRSy3EODH5jfHeLgevOFO7quL8XOQ0zZeJeDoIs39VqoPzkQ5PYNsSN86p/Nagz3bzSHmVz6+0vtGUN2CS5JnJGdZtYWxDhdA8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Csen4RBy; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Csen4RBy"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0C1C10C80C;
	Tue,  6 Jan 2026 17:00:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767715263;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=8n2ThgVzml6oYKdLHrRRtvqoR+e2zHmtT1V6Ff1r+JE=;
	b=Csen4RBye+r1zP0n/+ASabPaG7/5k++dxDVZi4nwIjuYW7EkZhTs4WT2z8kavawoiAtOHR
	MDpMXtmf+7fQpTRNtKAFl8zTr4NLpf/RvNlsozLUFb5zGD3cL86ZCqiNW5rCTFAhkAQ7Tm
	JeteJsi9xEEghenUPjAPq5JR6Xj4dJ4qQYg2CdbnO2Sosv8uBlaGGvvLTNRGCYKvT96V3m
	vJgyYFA107QEQpFUKy5qg12xROFCJN2k7dqYjrEoikfJizx6OrFq6orsQIhs9ybP+YRX33
	PIePmuApoSOfIJLYeb7bDz9kGxGyfdwo6lr50a3Cge8YVu4zPuqsAmsP0qXPEg==
Message-ID: <d2f5b091-a9c6-428a-9d2c-ada962a4190d@nabladev.com>
Date: Tue, 6 Jan 2026 17:00:58 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and
 v2
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, Fedor Ross <fedor.ross@ifm.com>,
 Christian Eggers <ceggers@arri.de>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Markus Heidelberg <m.heidelberg@cab.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251230213401.219808-1-marex@nabladev.com>
 <20251230213401.219808-4-marex@nabladev.com> <aV0eD4t5uQeAokUF@shlinux89>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <aV0eD4t5uQeAokUF@shlinux89>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 1/6/26 3:37 PM, Peng Fan wrote:

Hello Peng,

> Sorry for jumping in at V4.

Thank you for the review.

> On Tue, Dec 30, 2025 at 10:32:34PM +0100, Marek Vasut wrote:
>> From: Fedor Ross <fedor.ross@ifm.com>
>>
> ...
> 
>> +
>> +&ecspi1 {
>> +	pinctrl-names = "default", "cs";
>> +	pinctrl-0 = <&pinctrl_ecspi1>;
>> +	pinctrl-1 = <&pinctrl_ecspi1_cs>;
> 
> Not get the point of using a separate pinctrl for "cs",
> I not see driver using it, or I may miss someting.

That's a good find, I believe it should be this way, because the 
pinctrl_ecspi1 is common and pinctrl_ecspi1_cs differs between v1 and v2 
boards. I'll include this in V5, I hope that looks better ?

  &ecspi1 {
-	pinctrl-names = "default", "cs";
-	pinctrl-0 = <&pinctrl_ecspi1>;
-	pinctrl-1 = <&pinctrl_ecspi1_cs>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1>, <&pinctrl_ecspi1_cs>;
  	/delete-property/ dmas;
  	/delete-property/ dma-names;
  };

  &ecspi3 {
-	pinctrl-names = "default", "cs";
-	pinctrl-0 = <&pinctrl_ecspi3>;
-	pinctrl-1 = <&pinctrl_ecspi3_cs>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi3>, <&pinctrl_ecspi3_cs>;
  	/delete-property/ dmas;
  	/delete-property/ dma-names;
  };

>> +	/delete-property/ dmas;
>> +	/delete-property/ dma-names;
> 
> Why disable DMA here?
The devices on this SPI bus are slow and do only short register IO, so 
setting up a DMA for that would make the register IO slower, hence PIO only.
