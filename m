Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DAB2222A3
	for <imx@lists.linux.dev>; Thu, 15 May 2025 12:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747311648; cv=none; b=biD/5AJpHWGMBUyQrVCZ0VZ4A57Ykh5ELlR64dA8Pb65od7p41hoGPZIl0JzygNJy4rPU7dUEKkM5RXyD0sA37j+ul/YHdpeRjvFMwPCkb8m9ZeuaGTf7YVrgA6ANzL4/xu0inxdscLi3KP5lUX0t1by3Kx1UGzYbwEs2cvvt8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747311648; c=relaxed/simple;
	bh=ySi+0M+CVuWfwFeLu3PPC0j4nsW75CVo4AF4TCbTxnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B3jbhubRp9YdTEGfC0X4iZ5HWiTujlFWN5zODEXOjYCGrnaUF1dTxIPnqQZoH+1ddBavrGLmEO+/PDT1Zth3U6ZXxZ/vEuupW2Jc6NwJHlVLNQI0Tn/7otMM1qG7VELmxYxK8HNYWyMQWkthT+jbLznZiEfzDtLS+ahS8A2ODFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p9eO/HUN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p9eO/HUN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so9142275e9.3
        for <imx@lists.linux.dev>; Thu, 15 May 2025 05:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747311645; x=1747916445; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UYYmwpP0MAwsA931NniE7DuDU5H48aT0XrSHju++1ic=;
        b=p9eO/HUNu4gZ38Zro1yvQD6lhr9EdkuV3VnsM1TvepYbkY620kq40x+TzdtK6Dnx5j
         Cb4y458kKpPrPPnAYChsXL5p5ESd3oRhDQpsQ84HiV3N3mHD+gtTknzwp7aRv2eWT+WF
         BZXybJqWXVSnBJQcCGWTaMjGUTd8vFQBu/Ei/XIN5LF/9wPFk1uLPDTPPGkd+TRnIWz0
         6QU48Bv2yNdWG/TvoI1VXnUHYutpbvyHvNIwBEmpT/N531az3KuV0sAbcgc4yCsQooES
         anTicEmsCaKmxSPC8N5bdagVfYQlL/SXucOhdsvllvXGK1yL5KW9pHqBlnPSMe2a/XJ5
         w3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747311645; x=1747916445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYYmwpP0MAwsA931NniE7DuDU5H48aT0XrSHju++1ic=;
        b=EHAma1rPiQqWxgJDGdNwxmvTwR+OMDGocC7P1bw5PYXOdO01c3I/rnpA2Ix9swNiPA
         I4/MvOiUP3cJ5e4LUAFTe2NvST291R8amjXvfP431yERSfRY+c33sGY49qoD7GIXxm6g
         8mPujU354Mbw6BqhPGMbym8oSzFvLEcOIYbAmDJM4Oy1n5Mg6ayRshsNXwpF7Ffxo8L8
         4yPbbfRiV/fH9p1zU0n+OOwhojCOMPnQ2V7JnSzhT7eIu4SXbOr2QmHd3o1ss26AUok2
         Ltj6bJknMbwgZ4Mpqz+nJpiPIpoc7bi2G7WwUfXaHp71+PIOB/eNll3bNDiGpafEr1Ri
         XQxg==
X-Forwarded-Encrypted: i=1; AJvYcCWjgrt8yfKMd+TTEoWJWYcCyvJmEptmk0fZ886nGI8N5Ig6sKUBUyhyGPYnpYinnSc6+Jk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+jGZOJt9ZCbL4IYtDrDaj4SDW9jtTDhpGIvodyX+dQQZbee/S
	xD5rd839fCE2ezVcSF1P0X8R88yifApGnGKz6SUNIrw7tdNBY7srEdBtsSIEXr8=
X-Gm-Gg: ASbGncsABW2rGr/f/krwG0Unla6fKfsa/l3e3gl7xMp3KPsbmBdqeb58ojR5VH8ss92
	UPxqzi5YxRTXbrG0UjdKD8qnTc5Bgckil61xpmUwADRFhb23MBPm09KQ25nxCtPPrDbgmkXBfv8
	6UXfMPG9Xw4yfhdTckvZR2JnaphxKjblIf2KtW2Nh00SjTWCd+iu89me6vZn2xFgU/c7NPlxPWL
	MjXOhF0NqOkfaSHopCFvvawUe6DBsn98uUQvA6IFaOIB1JyZlHEkY2eJfX9DJcDYYQchuOzyn3z
	2cTYIkIxZ1qT02tHenodjuZ0R3tiO71+fhno7MqZFS5c3S87YaYzOwsh9wA19kV0wVXgCsHbxlU
	fzv1pp6yU
X-Google-Smtp-Source: AGHT+IFf5pIVLw9OgzawdBaBFW6KZvXprzzPf2JHeKzZZEBmezUo1iUF8T/ujeptaHHKPw8LeA0tyA==
X-Received: by 2002:a05:600c:3e88:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-442f20e33b0mr74335285e9.9.1747311644763;
        Thu, 15 May 2025 05:20:44 -0700 (PDT)
Received: from [10.61.2.175] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde01sm22985463f8f.15.2025.05.15.05.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 05:20:44 -0700 (PDT)
Message-ID: <586c877d-0d0a-48bf-9c55-97bd24e86638@linaro.org>
Date: Thu, 15 May 2025 13:20:42 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] spi: spi-fsl-dspi: Enable modified transfer
 protocol
To: Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org,
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Andra-Teodora Ilie
 <andra.ilie@nxp.com>, Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-10-32bfcd2fea11@linaro.org>
 <aB6pa9m0emX2vMH8@finisterre.sirena.org.uk>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aB6pa9m0emX2vMH8@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/05/2025 02:18, Mark Brown wrote:
> On Fri, May 09, 2025 at 12:05:57PM +0100, James Clark wrote:
>> From: Andra-Teodora Ilie <andra.ilie@nxp.com>
>>
>> Set MTFE bit in MCR register for frequencies higher than 25MHz.
> 
> Is this a bug fix?

Not this one as it's only supported for s32g which isn't enabled until 
later. The commit message is lacking though so I will elaborate.

For the other bug fixes it looks like they are, so I'll put them at the 
beginning and add fixes tags.

Thanks
James
