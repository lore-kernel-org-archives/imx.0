Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59A972628;
	Sun, 23 Nov 2025 15:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763912583; cv=none; b=NgmUckhqC+FWI1SQdezjUF5fdAwmD+d+rvt5C/hWEhsIRt4KLCDG0GcnmpkBdXSHSTzCVQ8cmZ7fyeM1SIay2qgkmXKtIxO0gRya2uVq3vi3eDpvCfkZLj3yf2SS8aheEYthlMsn+RIZ2GJoOBHxrQ5qrKFkRxqjNntQH9stME8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763912583; c=relaxed/simple;
	bh=vbhxB7cg2uUKxrQrdNQ3i2almoqwzr5Ld37Bf8GYzV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=etMXeiQ43164psKOOCUxDljhUngZ4rM1Jd9bcl6gcVnyOuwdEXFd8W27S3kbQuIYGgYxYXAuGVUdfgw6xnNsm39s5ByjGqJRT253QN5+mTKw1WHmUNL5y0zpQ9nIc4XuWTR+oOd2+PC/xQVg1EvzcOdvx6U2LFgHafbPxREpUkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CdROzRen; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CdROzRen"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E86C113D0;
	Sun, 23 Nov 2025 15:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763912582;
	bh=vbhxB7cg2uUKxrQrdNQ3i2almoqwzr5Ld37Bf8GYzV4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CdROzRenayW+ulWw1CW9/sQ9uhngb4gHXfPuB8w5nvotLthw5DhtMoX/rObde2Bz8
	 Pflw07peo31vzusQsD8YUJ0QVL+W6TYTJuBhnuufj3eSyuH5zxarKi7rmtlXGu+WhG
	 z4k6kzCF1ZAm/BhwEWNn8NfcnWPaO9wLgO1nV+2nj9vrumX8AZSn6eBwcLvAXE7Dir
	 DZxW5nGltGUaGEt0R5GCQaSw1KwfLdGqb7KC++s+F3IchZ71A036OGBLIJ/9U66cwg
	 38pdrgcVYpFa4EuNDT179M5Zr3Neq4OoHziLFSxxR5NXGXU/P6TSXRKE/0RhkK725w
	 saAHBoYkXwuFw==
Message-ID: <261ad42a-0d1f-43cb-b075-01f10f24487b@kernel.org>
Date: Mon, 24 Nov 2025 00:42:58 +0900
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: extcon: ptn5150: Allow "connector"
 node to present
To: Xu Yang <xu.yang_2@nxp.com>, krzk@kernel.org, myungjoo.ham@samsung.com,
 cw00.choi@samsung.com, robh@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com,
 linux-kernel@vger.kernel.org
References: <20250926025309.24267-1-xu.yang_2@nxp.com>
 <ssjqjllvmp7iiykgjbvzbxv657aj4pm3uvforv3rz5phxbhqkp@qjowhqbpnw7l>
From: Chanwoo Choi <chanwoo@kernel.org>
Content-Language: en-US
In-Reply-To: <ssjqjllvmp7iiykgjbvzbxv657aj4pm3uvforv3rz5phxbhqkp@qjowhqbpnw7l>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,
25. 9. 26. 12:02에 Xu Yang 이(가) 쓴 글:
> Hi Chanwoo,
> 
> The prevoius dependant patch was already in linux-next.
> You can pick up these patches without concerns.
> 

Applied these patches. Thanks.

> Thanks,
> Xu Yang
> 
> On Fri, Sep 26, 2025 at 10:53:07AM +0800, Xu Yang wrote:
>> PTN5150 is usually used with a Type-C connector, so allow a "connector"
>> node to be defined under it.
>>
>> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>>
>> ---
>> Changes in v5:
>>  - add Acked-by tag
>> Changes in v4:
>>  - no changes
>> Changes in v3:
>>  - add Acked-by tag
>> Changes in v2:
>>  - improve commit message
>> ---
>>  Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml b/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
>> index 072b3c0c5fd0..79f88b5f4e5c 100644
>> --- a/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
>> +++ b/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
>> @@ -42,6 +42,9 @@ properties:
>>      description:
>>        A port node to link the usb controller for the dual role switch.
>>  
>> +  connector:
>> +    $ref: /schemas/connector/usb-connector.yaml#
>> +
>>  required:
>>    - compatible
>>    - interrupts
>> -- 
>> 2.34.1
>>
> 

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi

