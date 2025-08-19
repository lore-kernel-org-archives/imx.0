Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D20F26B2AE
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 08:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755591790; cv=none; b=hYb9TBCWjQuulJmpuWcJWvGvrYMDr6J+9T5+7eweIpAogcTIE5uAG/AQjHZQLkBTkTE6bk3Iy7rVFAu3vvChUUR7AN079h1GaMtGGV0H/Pq3s5wf+HKPdR2kohDIcQqxilut8eCFBxyMRdLPYkiBqvw1r41tjqTUGNLtzSPiQVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755591790; c=relaxed/simple;
	bh=3GltQsZsTJB2ktXRLHZv7Us6GHmE2woUtqvFijXVQHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVrm46aGAwGzkprf2cOjmfeKvjFPKTiu6e5XZ1khrC85NYCU6wwD2rm54VizyUpOD4Sbpf/4IiLyrInSFYNWaI+cNC5bDL0G0CNAZIZU0B+3E0VlP4Mcfq1V0QJOqKXD9NKoj8WMbXEzb+t7zHRiNWlM/PSo1Qcd4dkVGre0l94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dPadAXhS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dPadAXhS"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b0c8867so41511505e9.3
        for <imx@lists.linux.dev>; Tue, 19 Aug 2025 01:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755591787; x=1756196587; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gk3UUuT0kF+OIQoIGwD56lsNrHwvbK9Pa+dkiVqzMsY=;
        b=dPadAXhS4tcamtvkgkZn7Vh9SmGHAXw7aoN+U/DbQYYMCh853We+Apgp7mAURIN/gh
         ONI2TT6d8nsgsf8/S4OWMQomLEhHlqIyDaAHv/fzrE6bDnhFnPuMstS29hqAqEMiH/Sv
         W/OinkpOK2tQskOIxuXK1aUhcFzDMwdLtdU3SqCp/jAQKR7RiXUrdkq9xHHUCdB0BswN
         dmX+JUoeunN/3df0rkxwpOXfGz1/Omnve/UVvQnQafWVSYu4qDIIw6ewRTk6UX1M6UEe
         8nwXQ1VgrLPbN9Ff7gjpln3Ghz6b+YOWyx7f5R3eR+HQMnGsWAPx5EshjkKOqdfU2nAM
         3Z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755591787; x=1756196587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gk3UUuT0kF+OIQoIGwD56lsNrHwvbK9Pa+dkiVqzMsY=;
        b=AsIN02C4ULjPwIlMp+A3TK9Obs8pAYWdEOqJ8MVW3b9oWyh8NBFBJcRndM3t0ZEbvH
         RjSj43hWwhey6U3eBdU8yJzvEBRmFHERa7nc+T6e6U69fg28xnwhctp/USJ52EKhWZig
         pU/k3XjlYG2K1sdEm4rHqCf4CjbeUZUcGcXm29uMeaL5tmJFXvB2D+8sIK/A+MS7ICWc
         G+zvSH9sf7pfbaXCKTC3MFt11d+ucfIXlKH/zF4ycUX9uIjsgaMNFJzHEcuz8mZpHvlL
         PJMozOVNeQHJIg0KOp8ELsEihdU+LCehtKkGJSE845IYe847zk1MNuw+1S2fvj4mdeoI
         Gw9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRJv6ovlWxj3RiTl+Gw+TGeaEbbXxW1cEZHKmBD8YT0hn5fN1XkX+WW/jXxRloO1ZOPGA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOjrvK0MzrvuxBx7JALAT+PCzSV9RiU7AeMJcsRtdBxNL+5Yom
	ZkUNPQ5wpouuYNjlze6w5XunUtudH3ssNdEUAusbotp+7KanmcTs9OSXZOeBztGaQrM=
X-Gm-Gg: ASbGncuWvV7VQ6rjyXQkRLEz4V7FmolOnp2EX5N66ra9f3qRgn2e8/+nwspQBWM+r2W
	QR2xDzqbGma/rs6uMCliRWhoiS7CLrTHdRgb1ZkXhNoWVYXk1wE6t1SbqfXUS2Q1fdcCDwweS7X
	ZjiJidJfyytiGVV3BKX4O5H0cLoflk2dpYNBhe3bYg6TkHa+OdhY7I+tE/BTR6EpYnCx+hYGHYp
	0S4Pc6YRudOV//4dyFKl5cibbZQbw5x4MwwNDBEPQnbzOTPP8VFTe90PBNLvOy7ZOizjm/lwRNg
	2XJP8SPZ3T36cosnqu8twTw2GjfCL6sVO5KPYeMoXW/jMdMcsbseCAfaIaK5QEm4zHAo/OAWLJU
	AlKayqTm2FUFIqUPGePp8eV2TukSuI/fiENqnpQ==
X-Google-Smtp-Source: AGHT+IFDBrqa6UO2Yq2aEToJiMTjs1+Jp6h8jHSwfsl8qYZjSrSubOzy3gKS/Bv9eTIZLkdGhNbxVA==
X-Received: by 2002:a05:600c:4446:b0:459:e048:af42 with SMTP id 5b1f17b1804b1-45b43e0d613mr12404945e9.24.1755591787335;
        Tue, 19 Aug 2025 01:23:07 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b42a8debbsm30166165e9.17.2025.08.19.01.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 01:23:06 -0700 (PDT)
Message-ID: <5f3fa6be-3727-4536-b769-c0a3d1646c3d@linaro.org>
Date: Tue, 19 Aug 2025 09:23:05 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] spi: spi-fsl-lpspi: Add compatible for S32G
To: Mark Brown <broonie@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Fugang Duan <B38611@freescale.com>, Gao Pan <pandy.gao@nxp.com>,
 Fugang Duan <fugang.duan@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Larisa Grigore <larisa.grigore@oss.nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Ciprianmarian Costea <ciprianmarian.costea@nxp.com>, s32@nxp.com,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
 <20250814-james-nxp-lpspi-v1-10-9586d7815d14@linaro.org>
 <aJ4qNVIp788gc2ZU@lizhi-Precision-Tower-5810>
 <1f3b68d4-e0cc-4952-a695-322ed9756b95@linaro.org>
 <35f6a3be-d924-403d-b60b-d4c78d833a60@sirena.org.uk>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <35f6a3be-d924-403d-b60b-d4c78d833a60@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 18/08/2025 4:18 pm, Mark Brown wrote:
> On Mon, Aug 18, 2025 at 03:31:08PM +0100, James Clark wrote:
>> On 14/08/2025 7:25 pm, Frank Li wrote:
> 
>>> binding doc should first patch. Create new patch serial for add S32G
>>> support only.
> 
>> I'm not sure putting the binding doc commit first would be right? That would
>> imply it was a valid binding before it really was because the code change
>> hasn't been made yet. Practically both are required so it doesn't really
>> matter which way around they are.
> 
> It's the general practice everyone has adopted (though in this case the
> bugfix bits might want to go before the bindings, possibly it's also a
> bit unusual to do that).  An unused binding is more acceptable than an
> undocumented one.

Fair enough. I can flip them in the next version.

