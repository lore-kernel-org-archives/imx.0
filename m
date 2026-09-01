Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4067B47D468
	for <imx@lists.linux.dev>; Tue,  1 Sep 2026 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270612; cv=none; b=UWfG2bt78tML29qhT2Tm2+AsYn2TVtEzAUpYAHn3mCEegqq2wyDFcciUv8QF6c/1sAaUAr53gjpUcKJzpq3T7oXIW9Kck6qsvGDoq2rSljYwDCLE5IxWVj1TYlxeL5JUDyRWLNAlU+vfJU/GWNYf2CzsciF15RBclt8ewMQzGKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270612; c=relaxed/simple;
	bh=OsPt/cT8BwFgc2l35blwbFE8qUUU6lxYABA1mI2KYMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MQ85e+05wEw247YWISZ/HSbO7osHgRC0wCvB9eX0UWJfxkTDyoj9zUGKLiGHA2vB5zEYw8nvxnGHanY7Sb2i5C4V2PByUNT7t83oEqCp5Lto8Dz80g4tGeaj+qvXf1lcMSkldnj2546aMdtk9B3e+jfx34kNwJxMA3scUDy6vjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ogiErb9K; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ogiErb9K"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4843e9c5960so917500f8f.0
        for <imx@lists.linux.dev>; Tue, 01 Sep 2026 06:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788270607; x=1788875407; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rRkUL/OFvGAZqvO4fpwddKnaKIcFlaNkl3QdtF7lN4w=;
        b=ogiErb9KGReE127RltJ5au5kCp1hHcV8zBayGOAKixWT43lZ/9vPv692Dduwo1Nm/Y
         RfZhKNov2TmP2HmweBvoDOblArA6Ez2jmH/LyPN8FFMAj3EM7SkG7JLlemRRZzs+DF5T
         hC0PvBAJeceNBTLto1D6U7nGvcRQOJdYqnvWgtHMf6wWu+bM4BFBl1BO4Y3oKS6eREb1
         Ru/VSaqRAWw2I5xnizKYyyRPS5aKqkniaFwc0qjx3/zCI1QY4Mh9O9/tK9BfgFOkimsR
         mNEBcV5/rAGizhMbKYYAMa4qgsKXPT5DzYcWiTuWihPis7konfw3jgortSY+V99y15aq
         rPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788270607; x=1788875407;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRkUL/OFvGAZqvO4fpwddKnaKIcFlaNkl3QdtF7lN4w=;
        b=bgP2csm2Lzz59eUA1pnxRRGWgk24JTFswK+33GVQ2BP2pqdEJ52ZjpfOLoAP9ipjKL
         SkUHjYSTDHbF2c1nb7Ut4c3aR3+iTPPxkKCbhYfJs/VK8irdM3fSJAScyBt/74jnVH8e
         no/oyEcbduRxKGHwG5At+bbjMayBhVYNfZgOVPf2LHovRxLaTk4EENMHWVFsE7hlPY7g
         F2YjVYCVJu+BLv+B3MObN6ylKESqng1DcXdN1SQJsC74la3IQ3xRyAPcQ3oqMEJpW3PH
         2hW3S9w1ijFY3BpXtLAutCiiu2SKFll9X6CpOZ3dcTuGHUio7q+cdoHLz3Z4IlaDOjUd
         yaUw==
X-Forwarded-Encrypted: i=1; AKwUvBzfHRuQllGwUQy11fjpz6Ou0B9MD+eIwm2rFtcLhSXL0zMdpEw1GFrR1VtmIWjjwwaV0kE=@lists.linux.dev
X-Gm-Message-State: AFuF++kUukQ9dbqNRVQ48NlcIBnRjpLYSaVNQP5itomZXcUS1ofG6MKY
	BNxZAKDFRP05jqgiFF++ZsxlZEXI/GPWm6RFUapsqjMbB1SV8i33x8sp
X-Gm-Gg: AYBFou0P1UwNUu0YV5QY+PhJuqxVeUKYSbJGw8CSzlYiAdfZqvB4VQquyjBnzVMxVJu
	f7Nrp0EFlb/9jpUfkkAiBKHayLFCRj0+nZ/cwgUl9iZmF9zCGcrOHN+xNlkm1AR4Xp+98uF5+Cb
	POiFRq0UFFzZ/GyhlUSlEhNsbqFO1ZY7LoT2x2xfCiXN2hyXdgx8el9EDEUTT029uFjYN9XBe8B
	vldqzhbM/pgKKKSjyx9QgBzzq2esucpcLBCwtQlh9Rx2FmM7+xcR5vZQ/QWkUDDu0EmT3TlW/uq
	G5W8ywukTZHrcw3DhjL2ggu/I2RuDvsrfkvoOb5N596n4YHnEM9xOYSZx4Spl2BFqmeEc1uLMYc
	PBAQRVhgXdo5PzHtFqpo04YbUSTgOH7KM8MbLVs19HsDzf2QpmHfCxJJ72+iZD0Z+ilxiFusk1h
	ftitt+/qhltoL/xYCZtvciqCXi2cbCD2fWmvf2x1dQuZXNFzYc/1w1QmVPcZjbTfa1lVmsBM8TE
	+nPE/AtP3OxkWz6J4+fyspP0GWHFGY=
X-Received: by 2002:a05:6000:4548:b0:484:4789:9bb8 with SMTP id ffacd0b85a97d-48447899d60mr2616212f8f.2.1788270606921;
        Tue, 01 Sep 2026 06:50:06 -0700 (PDT)
Received: from [10.25.209.52] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6dc16sm3988721f8f.20.2026.09.01.06.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:50:06 -0700 (PDT)
Message-ID: <9e6de8ae-aca6-41ac-bcef-f591d9fe8462@gmail.com>
Date: Tue, 1 Sep 2026 06:50:05 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board
 support
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 conor+dt@kernel.org, robh@kernel.org
References: <20260901131918.1189-1-laurentiumihalcea111@gmail.com>
 <20260901131918.1189-3-laurentiumihalcea111@gmail.com>
 <20260901132721.9559B1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260901132721.9559B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/1/2026 6:27 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Missing memory node in device tree
> - [Medium] Missing USB controller and Type-C implementation
> --
> 
> commit 3130a84e68bcdc800ca07e4c01ec3d00e67a37c4
> Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> arm64: dts: freescale: add MR-NAVQ95 basic board support
> 
> This commit adds basic device tree support for the NXP MR-NAVQ95 board
> based on the i.MX95 SoC. It defines initial aliases, chosen nodes,
> regulators, and various pin configurations.
> 
>>    Add basic support for NXP's MR-NAVQ95 board. This board is designed for
>>    robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
>>    following hardware feats (list is not exhaustive):
>>    
>>    * based on i.MX95 19x19 SoC
>>    * 64GB eMMC
>>    * up to 16GB of LPDDR5 memory
>>    * 1 x USB 2.0 TypeC
>>    * 1 x USB 3.0 TypeC
>>    * 1 x RJ45 port with RTL8211 PHY
> 
> [Severity: Medium]
> The commit message claims hardware features of 1 x USB 2.0 TypeC and 1 x USB 3.0
> TypeC, but looking at the device tree file, it completely omits any USB nodes
> or Type-C definitions. Will this leave the USB ports non-functional in Linux,
> and should they be added to match the hardware description?

This is intentional. USB nodes will be added later on.

> 
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/boot/dts/freescale/imx95-navq.dts
>> new file mode 100644
>> index 0000000000000..1366dc2d2bfa4
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
>> @@ -0,0 +1,222 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright 2026 NXP
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "imx95.dtsi"
>> +
>> +/ {
>> +	model = "NXP MR-NAVQ95";
>> +	compatible = "fsl,imx95-navq", "fsl,imx95";
>> +
>> +	aliases {
> 
> [Severity: Medium]
> Should there be a memory node defined here at the root level (e.g.,
> memory@80000000)? Omitting the memory node breaks standard DT conventions for
> root nodes and can cause boot failures if the bootloader expects an existing
> node to update and does not dynamically inject it from scratch.
> 

ACK. To be fixed in V4.

