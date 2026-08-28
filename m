Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7DF26296
	for <imx@lists.linux.dev>; Fri, 28 Aug 2026 02:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787885326; cv=none; b=uCsBOJv6F2SUiuEm8H5/jiWFJeuSosUJit9s9+1NGv/4px1Vzjk6mNJo7qdR/tmNnjhO3TC+4u3lf3NMDajkP+ooEe9qAvw1kJgs/w5R9qO6btG6rhpyJZl50jlBltyVNKkZFAlbzTFgLdkuut5X1P5BHURd3w1XP23o927CNZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787885326; c=relaxed/simple;
	bh=jWqpeJZIlYDu+Q5xCDiOg9008ijAT3x657XQiXkxHk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZkfwXuV3wDGln42f0uSUAlfCq7zWZX+pgmIUHqafh2+2Ds0iqiV13UpepBODD4e00kxunUaHIRkz9JCEE6pETyvUTykril+NIYCAuIHHLsHTB2SAMi9hXrvGv9jvQMSGMKv623LMVEovnV05rTNdFpj2AwHvODPMBH044P6fUjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRCjwxf+; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRCjwxf+"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so553749a91.0
        for <imx@lists.linux.dev>; Thu, 27 Aug 2026 19:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787885325; x=1788490125; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJyX/sTI7ddUntBaZ2k7BLJc1KSOT8B7StpeDL2PyF0=;
        b=mRCjwxf++dgW7vWq1PtjRhU6rv+9SzMWH5131JCxWOnYbMJ4628T7r9YWMg/AcXFXC
         II8YLVO0xKBmG+QwZmMKlk/nvK+yX6mrRtMcpsSNiOzwfGkNN612GbsO2KrWMVvNxUwc
         4qhZz/DOtc/IfXIPYvjG1cGzihf7Gq00HzGSx0PCelzDLo0gIT891KjisPVLExAHLBaa
         RRVRYvU8CdmzVQd299mm771e7KXczIdB6gTDzE+hYoFkcehm5dfbf0wdYfe89rh1dwm7
         RHtoiedw02+fZ2C59Cl2T6dGYlF387ljBziIIppTagZwVmrunKCLRrmk+TNi8HWpcyWy
         JX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787885325; x=1788490125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJyX/sTI7ddUntBaZ2k7BLJc1KSOT8B7StpeDL2PyF0=;
        b=nYuNNbt1Z5BPoEr1QjHgfvo63Rlbxn/FisNWk/I4iS+stxmWsofTf8Z8RFxGLNs9Yp
         Cmm1RmWRR8+bBPU5LN3Rde/E/DsAF6bWUcqbFbbFVufhZYM/RKV/cG3YZ5LnNEp2+yS7
         FFY/ZxQp8ZLwOheAh1ibVTgHPDiq46o4msw4wkI61PnJRP6TIAS3l7lLY2/FP/OPXv4N
         hWNqigpwJPfcIEAfw9f3MQMCzE8vmip/vH1zgp/KQotaXpkfUWIwVRD4RsxufMbymKeu
         hlsaZaMuA5olrY1GTnSooZYebKbq1r8Gy/H4mlcPUKtwT+/v8WRHmCZUM0elvHu+lVdk
         goSw==
X-Forwarded-Encrypted: i=1; AHgh+RoBwQl+LOFD/4ZB/5kX/SUfN38lJVbHgRUogdT/QHw2OpqadYsDFyCDkrvsjaBU9Gew8B8=@lists.linux.dev
X-Gm-Message-State: AFuF++lLqm7gf4irOIAoxa8WJxpSd2OreZl94HWDVK9K88dyJvaTZGxn
	Nr3kpMp8FHohoYWXmjjEKTycRNy+G1TDLp7t1JWSYbWmfZV5ga/mr/J6
X-Gm-Gg: AR+sD13qgyzbmAEuOGMWL9NkXFKD7ZObf5jn9ZbvNzazK01pW7fJqOjIuBY7Ng5FHSc
	nXS9d7idQGK2K4oz9PbwipXN0fJ/W2E6jCIiNWYipWLSzn1CvSxtldhy+GKJpQqKGu1cJWoVpFQ
	skSAxme3fqP5uxWbnMErc+8O3EctC/b1K+WvTke7+fwJeoOq26TyLbILhusYROpGRaguQvaisy9
	I8kGR6vjKdzyUstb4Drmi35Dawhcrgvpdp8J6XcSrWWhmShOHqJwumCzP2vlhJxrVRt/Zr7opO5
	78ISMNvWRqZQDJbqQREA0/03uCNpw0LWL9Qk7eSMEPvuLt6DoXi2Lo2z+W4lvxfhlL0tfbIEpY+
	TRaD0piI3U6xQ8FZq8wFlmhXwMnu0uQejGiEEZLM6okSGIdRzrH0uia7Nxyss4QT6UQentU5g4f
	suVgLFtKNu0wwAKo/0gIRVYhE3EdZ3+DV+riAWaT+JdAgR4ikDKfmqPL/VjQ1l497WVg/dKofGW
	MmtdG0=
X-Received: by 2002:a17:90a:d44b:b0:37f:e5b1:ec4b with SMTP id 98e67ed59e1d1-3969ba8642dmr16032119a91.5.1787885325113;
        Thu, 27 Aug 2026 19:48:45 -0700 (PDT)
Received: from [10.25.165.77] ([128.77.72.133])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm2109869c88.4.2026.08.27.19.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 19:48:44 -0700 (PDT)
Message-ID: <8849ec9d-a7fd-47d7-a8a8-a31849637f6c@gmail.com>
Date: Fri, 28 Aug 2026 10:48:38 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI
 master assignment
To: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Yannic Moog <y.moog@phytec.de>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
References: <20260827065556.2326079-1-primoz.fiser@norik.com>
 <0ee330e3-8c6b-4162-81fe-d769982df5de@gmail.com>
 <bc5c1564-963e-4995-90c1-8d78cd9df26a@norik.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <bc5c1564-963e-4995-90c1-8d78cd9df26a@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> Hi,
> 
> On 8/27/26 10:56, Chancel Liu wrote:
>>> The dailink_master label was incorrectly placed on the codec sub-node,
>>> causing simple-audio-card to configure TLV320AIC3007 as the I2S bitclock
>>> and frame master with SAI2 in consumer mode. This contradicts the SAI2
>>> node configuration (assigned-clock-parents, assigned-clock-rates,
>>> fsl,sai-mclk-direction-output) which requires provider/master mode.
>>
>> Just a small question about the commit message. As far as I understand,
>> these SAI2 node configurations only describe SAI2 providing MCLK to the
>> codec. A topology where the SAI provides MCLK while the codec is the
>> bclk/fs provider is common. So the original configuration seems
>> self-consistent, not contradictory.
>>
> 
> You are right. Such configuration are possible.
> 
> However, on this board's wiring, SAI has to be bus master for BCLK/FSYNC.
> 
> Shall I reword commit message or is this explanation enough?
> 
> BR,
> Primoz
>

I'd prefer rewording, as current message is a bit confusing.

Regards,
Chancel Liu
