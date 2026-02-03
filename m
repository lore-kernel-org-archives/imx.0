Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394762C3248
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 10:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770113824; cv=none; b=RzMlke5Oc+wDlsdVEUPBnzXXGyzeqYNbRU0ry4wmbSAFnMvkcdiuRUzt2oNAhE7iN2XLXBYvwIyWdPbgqanf21xNP1t1H+TNcmxHY50DoiIVsFzvNRAGeB8TBj7h0X1FwfA5FO7wuI0jecGoL7q/fiHBaWjnNVdLxOaaD7S1sFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770113824; c=relaxed/simple;
	bh=OV6h1EbKbY8CqIrF6dRNWqYegK9uWHJ/xg8S0f3xyEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YODp7LIGdH5VQgbxXhMDW+lwB1LPGV6oR2oTKlIrFArm3oyLxjxORQbFZgv+DeHp0y2qUN0zeivEG719tQ6vk9AnY2I0U5Rhs1xPolgkcHLcQzyH3cTAnM33/OkiDgGI9juqv9dedlzdR6Srg3GS9ByYIWZheNto9iENHKHPrUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+8RO71W; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+8RO71W"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4359228b7c6so3808851f8f.2
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 02:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770113822; x=1770718622; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fscSYj6Edq1KO+eKiUWNHrblwvs+zwoKFQhpyWKzmWc=;
        b=N+8RO71W8w14KCKHuZGrBXBkGwXBiVmG5TZkptOgmZmtEPC1NiBqr14KIR9jLQ1VXn
         tJ+Xl5lKiMnawCo6yYl9LvlpvnpuOHd8Zy2wYBkpV7e7DSiwKOczM3G8SPaXPLRQKcpr
         NzM5bvWUct4ZXrHhjMkvdD+gXvtPmuu0YZeByiP+P68IqiYpSsI0renNBivtYOFd3DsA
         0XKQzIIIfakUugyInxmI4nED7yJIMqLv194FRVlg8F+mMwoVVRwuu1QZlrx+Qj+D+zKO
         RkbX0WCQQ4057UazCOJCBC6yf0NJk3YPcRG1An66OpM/oiC/qAio79slk+6BeVcvPsoG
         nGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113822; x=1770718622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fscSYj6Edq1KO+eKiUWNHrblwvs+zwoKFQhpyWKzmWc=;
        b=jTBzAT8H7lQee3LaHwC8BjDUJvbbEGVLe3nKpAvO7VSwmpcxmhbFygwXo0Sq7cImCU
         4QQ1VK8cvfRWqO6/g2ra4ZLOwgHKtraCrrRve4JpIva2Wr6i1MtAZ9lxB0HkdT4n/Xuv
         FULdmfetu2VkdT5fwwlJeGXb5dEv9czkhmbJk0Srihw9xvcCY7bqYJ77PeMeRw6gTh7w
         AajI3B3lekDuJi42cqvtg7Baoc35TIhbwWxUMecbDr4p6joU8DQjKEWUtZaK97aKaNc0
         K3wOdzZx9Wu2XPr935eW5LDpzxjcB612lVhLt9ma6GhK9Z29GAYRWN2SciwRUGxf0zul
         KAlA==
X-Forwarded-Encrypted: i=1; AJvYcCU6a2b15eMFY2zDp4CeVlXwyoHRU1HkC30eXxfEVGzP0pWr5d2KsjJMyZlQHjbqoDxLBtQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTVViiib1XPHbkhExG5FCl3B4xuA4WtqpONGqI3G/B8d3Z50ja
	7jcdMWajzKrOWnDR4ifTfbctZ5q2ex1n+5nVDxsHbiHs+Fc8CR/jWHDT
X-Gm-Gg: AZuq6aKttw8BZ5pRFP1sIwhIfMH26IrnxHPwrf3SW2TonjVSAPH9a81Ya6diYq4AfPV
	B0sqVhjDVz/VoJasRTjO7P5iS3AHjjbvGmDRl9zGl1fX6lAoIHlJC7FwD7kZMkSQ1gc0T3aTKaR
	XKBxK4AnkcEqYRwim8vbSc32aGrBfbIR8gOQs4R6MXDdjLiZ6QSwiwMfLIGeWZmjzcc9nCk4Kmh
	ohlvseU6yy6PWNqSY4F740aH/t1YyBf/1vDGLi8SL95awY+rcd00GgORUBmbbndNlgzIqWsmz79
	QZHoLkM1jNxruqBq7BQwy+/LEpGZhK2ROHzzDf7IpYPwBbfYOEEc22C70aMjM+1FMyw4qimgYCT
	SGdrs3v4PdvJS8bJy/wsWJyXQNuLelI64xqgwKt1E5PtFVkR9ijpqtwkZe9mnOGu1IF7tvnnu5p
	Y271mrt5FpzjqaByTAHiK13xLYOny/qgDYwwwfkZe1osw=
X-Received: by 2002:a05:6000:2c01:b0:42f:8816:a509 with SMTP id ffacd0b85a97d-435f3ad2726mr23780172f8f.62.1770113821338;
        Tue, 03 Feb 2026 02:17:01 -0800 (PST)
Received: from [10.25.220.39] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e135422csm53010801f8f.40.2026.02.03.02.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:17:00 -0800 (PST)
Message-ID: <d9c72c09-0b10-4b5a-a49a-ec93764bdbab@gmail.com>
Date: Tue, 3 Feb 2026 02:16:57 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: imx95: Reserve eDMA channels 0-1 for
 V2X
To: Peng Fan <peng.fan@oss.nxp.com>, Joy Zou <joy.zou@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
References: <20260130-b4-imx95-v2x-v3-0-95af05bece95@nxp.com>
 <20260130-b4-imx95-v2x-v3-1-95af05bece95@nxp.com>
 <aYAYeQaGK2RUFQs6@shlinux89>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aYAYeQaGK2RUFQs6@shlinux89>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2/1/2026 7:22 PM, Peng Fan wrote:
> Hi Joy,
>
> Sorry to jump in at V3.
>
> On Fri, Jan 30, 2026 at 05:36:27PM +0800, Joy Zou wrote:
>> Reserve eDMA channels 0 and 1 on the AXI eDMA controller for exclusive
>> use by V2X (Vehicle-to-Everything) fast hash operations.
>>
>> Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> Tested-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> Signed-off-by: Joy Zou <joy.zou@nxp.com>
>> ---
>> arch/arm64/boot/dts/freescale/imx95.dtsi | 2 ++
>> 1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> index 55e2da094c889fc7c1096d0e36f31ae118d2a982..9ac82da2ff440e08ae8378d7ff830a568d50a354 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> @@ -631,6 +631,8 @@ edma2: dma-controller@42000000 {
>> 				reg = <0x42000000 0x210000>;
>> 				#dma-cells = <3>;
>> 				dma-channels = <64>;
>> +				/* channels 0 and 1 reserved for V2X fast hash */
>> +				dma-channel-mask = <0x3>;
> This is wrong. Per dt-binding,
> dma-channel-mask means Bitmask of available DMA channels in ascending order,
> The usage in this patch does not match the dt-binding.


Ah, good catch. It would seem like our EDMA driver reverses the meaning of the "dma-channel-mask"

bits (i.e. bit x set means channel x reserved instead of channel x available).


Now, I wonder how we should be proceeding with this. According to the DT binding, our devicetree

configurations are wrong. Since there seem to be only 8 upstream instances in which this property is

being used I guess it wouldn't be so difficult to correct the driver's behavior and then correct the

devicetrees?

