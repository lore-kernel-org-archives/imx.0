Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1D9330D58
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 15:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439797; cv=none; b=YHdGGjGC/B1SNhDRxqy37gk9BYhWqdEqrRiWFMd2vLfTczaqDaZOzmClu81RFn0r34sBSEMG2wixIhwpOPr4gCDk8H/+MHJqyXINMUiIddjvfmnVq+FbQQLRDTJPimHwDHuKNX8ON3X90y7+5Ht+VylFDeCmiz7X9kD3xO8Naj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439797; c=relaxed/simple;
	bh=El3mE8Nsj6TZMNH4YjgXkSNQcNjZsn2dIrPIMTmdC9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aW0q1s6qynfc+0s0+tdZGCedvay9wFYGyOYOHlIoyKF5DZ4q6qNgaMNTWl3T0aotWOyBh7qY1H5naijywLuGhNESTfGo1NEyBNluhaPfSFJnHVSHWSPFwqRV2JUHnTZ3nPVXdx7kY7AgrGO3XrmzmQWrmgiXwsPciUlcfjh2x+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZ6RKsco; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZ6RKsco"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so52632295e9.2
        for <imx@lists.linux.dev>; Mon, 26 Jan 2026 07:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769439795; x=1770044595; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=El3mE8Nsj6TZMNH4YjgXkSNQcNjZsn2dIrPIMTmdC9I=;
        b=mZ6RKscofibLtOAxNeL8mHfOV7gWURpgg5xDid7i6tDJxlwaOUa8QdEjjOA9sQ2V7j
         R+5kzzyRoqiv12lnTYESKA/BSyJXme7gPuKTTmvpmIM5igvfIdosqgnascGQ5GbmGCVQ
         GpexAMlC63wDkTzGMsAqnl+9H7JibFK57BSFKldRKMFTmqyLvu0XsT3haKmpfY0LZDsB
         plQ40obU3297An5WlTfOUxWrTHyQrm03OEkpyJZbhcj2YTtEX8+wbxn6sMsD1jLp5q1q
         KPn9izBgfZ2s8APs0/M/HGyMnYEABPsEIiVbPgLBu0XwFaBjLgbZJd7WqXHE8/20b+11
         ID+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439795; x=1770044595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=El3mE8Nsj6TZMNH4YjgXkSNQcNjZsn2dIrPIMTmdC9I=;
        b=OKHLq2l6Qks/tsnymkmGtQrnLRQHOoj4Qr47d0kDmOW9idJ5jLyv2D5K7dzE+Rqf0q
         q2+ZBDDdF3ORVx2486kEknHINNFIBM9sr8vYh1RM7cHJbqVhRftBBmWEkt6zvzPUOAkX
         BPBgyb3TflXTashlT+6FSCgeMTXYa3TEfufYBaC2Z7xRlGOCH+pYRIfcjg5on9DY7doo
         WCl0WkUMFiJ+svugiDw1VuEHicZQb2KFnyR684gDihNliyeEOIeYKoIoc7Vtgmp2MjVv
         2AVtSUEnvwGlHtJe3J/0ka1FRJBWGthsrmaqcWSBvtEqLamdRV6I6yzZDpKizHDYwhvp
         gQFA==
X-Forwarded-Encrypted: i=1; AJvYcCV0z/3MaADJuD+6/v+OvxKyYukkcAFEm8OJ5Xo95vVkO8ePCtwQTFJ5JTw4q5rIx/uNprE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5bNj1KyUSfL8OWKycXLLAIlgNljVETlzQAxmBBvXeGcLL7ra/
	RHvS+dMB9P8craQzmwd+oysHgkVVzUd4uQ3R4nNU9FYng7tIkC4c1Xwt
X-Gm-Gg: AZuq6aJwllolg4FqiBZJuFTykkd+kn1SHUMfD4m4j1bSFZw+KhmYW+D1oKaSbyGMf1h
	W4+Pd57Hb5NaF4mGgXxVAPM1f3xqesp0JPYJuq0OXvh/ONFU7C/3Gf2Xq+VKLJFw8ZmCoHwDeeC
	xJSpWp6QCgqJIUgWe9q6Zoo9SZYV28oR3foR6p+l9OpBgPRn0CfGMlqVU/zf/I6LGzfOxeqP7Lt
	bT+jxeicTOhFPOmD0Dr5MCH5e1vk8nTvMw+USMeFI1ao3OrZErUXqWDeC19wqkP/2a1o+rcRFB8
	genPAWUSIROS4Db6V+bIFvXXmgrTfpnFDo7AHhE5XxFULsXZLgU3cibiRK0VamKAADgpztF4DVR
	cZnZbCteykWMaVG1Z/n/ZEz9o11cyFTiiLsoxY7wZ2NDncE9t+9zna0hs4PI+hllNXru2sMsG0h
	PSrscco0Z/K4E3KGA5KmNrAO9V1ycCd3Ch3a3GMmUzOVE=
X-Received: by 2002:a05:600c:1382:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-4805cf66a5dmr73588065e9.17.1769439793920;
        Mon, 26 Jan 2026 07:03:13 -0800 (PST)
Received: from [10.25.211.45] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f745c5sm31743469f8f.32.2026.01.26.07.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 07:03:13 -0800 (PST)
Message-ID: <3e14a3a2-8686-42ce-8ea7-4a2380b2acdd@gmail.com>
Date: Mon, 26 Jan 2026 07:03:15 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,mqs: make gpr optional for
 SM-based SoCs
To: Mark Brown <broonie@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Chancel Liu <chancel.liu@nxp.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
 <20260120150329.1486-2-laurentiumihalcea111@gmail.com>
 <aW+q4lrdYJEciNS/@lizhi-Precision-Tower-5810>
 <3d98306c-0e13-4bd9-9cfd-0a2ddcadef3e@sirena.org.uk>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <3d98306c-0e13-4bd9-9cfd-0a2ddcadef3e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 1/26/2026 6:16 AM, Mark Brown wrote:
> On Tue, Jan 20, 2026 at 11:18:42AM -0500, Frank Li wrote:
>> On Tue, Jan 20, 2026 at 07:03:28AM -0800, Laurentiu Mihalcea wrote:
>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>
>>> For SM-based SoCs (i.e. MX95, MX943), GPR configuration is performed by
>>> the SM coprocessor. Thus, the programming model needs no handle to the
>>> GPR node. Make it optional.
>> "programming model" look like software configuration.
>>
>> Thus, GPR is transparent to software and does not need to be described in the
>> device tree. Make it optional.
> I was expecting a new version of this with Frank's comments rolled in.

Hey Mark,

Sorry for taking ages with this. Got your message while preparing the patches. Just sent V2 a few mins. ago.

Thanks,

Laurentiu

