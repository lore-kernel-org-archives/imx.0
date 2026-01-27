Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356C334D4FE
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 12:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516546; cv=none; b=cuidkmqy10C4m4tFD5oZzabxl1Oj2Dy2I0Smvk3koGVazMVXxI0nmR3YX7yGsSdhI+03bXaoyBVi0SxeOQ9GTGBcV7Nag9GrSDiZtf+X8wUbD9D8cejeTA6JBNvuvS1RQ7JpNtbqEfnjA3NbQOtQrd/YI7qdfICd1YMn/1W0xHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516546; c=relaxed/simple;
	bh=+ilUKbu2ArLEGVUyAuSkij7jhAzxKx/xV6YfmxWnTAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=trzbQovDWvyPGXy5hBZS3QVGtnUiigA77q5VyETIIMp6E6fj/+XcsXtKV29ipMZkOIK+JgEJgTOu8ONEQyUsLQB9p7+CV4bmokVnh14f9kf1vrEyfYKSj6EHQPCZI7bHwSIReGpturAUdkkeIJMZxSM8VjrAAu9L+hZSjDtioG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4i2Q6hV; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4i2Q6hV"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-432d2670932so5141328f8f.2
        for <imx@lists.linux.dev>; Tue, 27 Jan 2026 04:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769516543; x=1770121343; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0MBhjNvO9uP33cA1otmnLsn1T/YWSSVCvR/7qKxO/MI=;
        b=D4i2Q6hVKAqtV0lsuc5gBpESFlR5gp8Q4ObMOhiqFB7uL5482QDeg7Mcduix0CtA4Z
         OwY5/ed3AYJqzg/VDTWTRflPZqxRUO7b8cfTbdldY6YEn3Urdg1VlNaWFXZ1kR77f1Ky
         757s3ABTL0uRSsMbUpwk2lasDCELuxRuujkvXSf7iS0Kl38vFVVp5WuhQhXZPgjb+oC+
         bc/U6My5B7bKZj8Zc/1/b86yqCTcJyhxNimA7W7YZacHuc0yVwgLqNUg5GsRtPvJB+Q9
         MpuHdd5EsVBI6wBaN98tRfi/lfHND/n0XRJ9wR/DaEXJYsw4WkJH7OZwoOORknl6Ce3z
         i26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769516543; x=1770121343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MBhjNvO9uP33cA1otmnLsn1T/YWSSVCvR/7qKxO/MI=;
        b=rXcKhfOX9OtC9N4TtmjPuujOjuUPwA1EvJcL/tkoBb2fg4b0gEN8IeKcCitZd1Ubbo
         LgjT6MpE/VR/do70uZdsP2vjUe6LUjT5Sq0MI6PWQSJzU6I6UamHbYutfPoS/2VsKHo/
         2p8DJ0rWq4rT1JcBMu7y94PZzsEvrV/6KYABEYgg7pOKLE8k5NVITFEK7xGYO5uRQA1/
         b+n7c1H369qS2uSC1wQsIxDXJ9CMK14g4E28yDcSM+yiwiktPsBT6RoLRYo6/Bub1Ggl
         W74EIANYPLiCRn0rzXgS0o8/FA+t9H7ryJ/S5Vzhbco7c4fEMyk9/yd4lOw+0jxnxSUN
         6joQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCNeLWw/xTV1hG5ZIwwpVfZRZFRy+S+UmsIgSNhQzhuVt6mamIhiuRuOufkzGpOsBwQdQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYZEUeJ0XomnsagQMUPL0kHPTbJ5+Cv4RuDnQeLf6at7Dbp9vg
	sA3/wHNjFWAetILvcEWcHyvslEMRTpmBgTvMalERJ4fcCcF+AbBDRFlc
X-Gm-Gg: AZuq6aJBOI3mzOHtQIJWvwlous0wgNtzswnWpDrE6zVPB3YL5msEhN7wXboQKwxiXQE
	jW0ySDxVgf9l9dni0HqBlr1bLJKmBZ/Nzj1gxQ9tRiAHOAc1EK1OOzJtv3fWJHeiuL2h0X5D+sH
	o5Ae+y97PBIf0UMBX+Kc8Q+pV8eOH20mN8VuUzbYJn+SqWoYfn/No0ooFTlHejRqtYG/+3X5Ccu
	5pfeYI5Cz/ALsp6A4a9iQcFJWU05VqKqhcBuAK5pMWWz6g0RPJ8eNP2m4MbE4noGULPvzF427yN
	1xIw2ZKeGLE5jHRhtNprGBAgHLIY6nsfYjFpOhHxgqx1SYNUbb6HIO73jRw+nB18XhAGb2VxDU2
	QWXXOaiax/gsvs0lO+1z7/RN5W/c6n705lpfLuHuPtP0/n6BebJMfzNqA4AZRqe9seWa6MGcd2Q
	NyxmWDGYh+ql16XFhaigOLXa35XW1296jY4+hXAaaDwec=
X-Received: by 2002:a05:6000:178a:b0:432:84ef:7160 with SMTP id ffacd0b85a97d-435dd022574mr2376326f8f.12.1769516542309;
        Tue, 27 Jan 2026 04:22:22 -0800 (PST)
Received: from [10.25.216.67] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e71503sm41885074f8f.25.2026.01.27.04.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:22:21 -0800 (PST)
Message-ID: <c4f4a6cf-8511-44ac-8648-d8c4093e24d0@gmail.com>
Date: Tue, 27 Jan 2026 04:22:19 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: imx95-15x15-frdm: support AONMIX MQS
To: Frank Li <Frank.li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Chancel Liu <chancel.liu@nxp.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
 <20260126145537.2301-3-laurentiumihalcea111@gmail.com>
 <aXeY44T+5rvCqBs8@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aXeY44T+5rvCqBs8@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 1/26/2026 8:40 AM, Frank Li wrote:
> On Mon, Jan 26, 2026 at 06:55:37AM -0800, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add support for AONMIX MQS (i.e. MQS1).
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
>>  arch/arm64/boot/dts/freescale/imx95.dtsi      |  5 ++
> Chip's dtsi and board dts should be two patches.
>
> Frank


What's the rationale for this? Is this "rule" documented anywhere?

IMO, the DTSI-related changes are small enough that it doesn't justify

the split into different patches. The split would've made more sense

if we were touching more than 1 board.

