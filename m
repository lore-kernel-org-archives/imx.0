Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1034341DDFA
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 11:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533966; cv=none; b=rTuX4nsnCywM+pqScdq5L0DJ/v9WBzq07c1v94J+zdIiWG/uJhspUEm8Ht/uRA5Mjwcoowi6dxeQgpY0oDvTPY2Um4SFdfcz2KKCugQfEvgSPaSv/yqDDHP0vbfx4RgnQTuwUkQxadLBiJ5RjDt4hnj3tD9Z2Dp04Lw7ZsMz5ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533966; c=relaxed/simple;
	bh=WoKWEWKlv1+PeyUN1OlqnAXZmrjz3ThOQrXHDS8EOWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kwgV4ZDINvKNYbri8QdpbgRQi1D6Qn+lR6T6zjTd0T5PpN6qUUQcTkDixxu4S7xM/eUIrZQ4DPlYQ9RPuICGB55mljgYjhQFRxPQqMhiBjpKsldOMtMuwjGVVSYDNnHLklYJ7A1AWwEKSPJf2aBXTPX0G4/0rymsfrDcWJKuCm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAsyQ3ik; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAsyQ3ik"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495635a85d2so6068935e9.0
        for <imx@lists.linux.dev>; Wed, 12 Aug 2026 04:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533959; x=1787138759; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ey4E5gbb1zGfpxU9QFub0aU8JCEKCtqwD4Rbc0BSyts=;
        b=eAsyQ3ik7X1E20BmB3cnq27SV8MldAVI4YAX3nvEwTBdS7V8oB69QlWRKVCX6yVuD7
         A/Ky+Lv987Mw3I7AxHIrwSLkIOKLg59CPk2X0EH8d9RbHl4nBDSWGuT/REBSPue4qcCs
         /U3oFe85XSSLuhNjCQWubS76BOpBJh0M/h0arMcYBxOa8xHDfnVLYbbUEsI29XR/LjCs
         EKLX5Mw8D1Dhvfj/RZwaJsOMUuIM/SmkC6viiHi7jUXIQETeJqDvtGCACys/+UermuTC
         VL4fNjU54fHkfa3trRx+FQGwtcZHbcSEGfunK7tK7JNGCK3c9CK3t/YWi7hXX16np7Bh
         U8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533959; x=1787138759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ey4E5gbb1zGfpxU9QFub0aU8JCEKCtqwD4Rbc0BSyts=;
        b=qIbx+N77i5uFzPu9I5Xt2fq7BbvsBB5Sxor8GuB/qYieyQAgtvdOnOwGroJnD2+Kwb
         +k5gc3NtkWMUc8kBEsth8Xl7wwbXfyU3wfM/HAHUpWb4HnA3kM8Ieci9ajqb5q7AHjpl
         LG4reSGcvtUMjYm4bUeldlRVmurhkaKdQ93SH8cxpxMm1q3rO9hQTqlMTJ7vVR9gnBAT
         3X8hpPLVlYNv3l1RP/R1zuU84DGDpJvTw8JQx5YjZizq7xYcdKa5HqI5SAuZTwSlH7uS
         dgxL19bpc0hYMLh31O5QM2NwQAq1SE3AZY7ndKjgnohrA65pnzrUm2idL9HcPa85XtlS
         MRKg==
X-Forwarded-Encrypted: i=1; AHgh+RoOJJz4DPfOvfqm90UBz49j9KO8HYWYLxIc4Vbozw0yQ6yUGc6fYr3zHFaaKNc5koMKkYk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8eedMkctgj48SEQpMYiiORi/jxoUSRlQl0Rgg7S8oWHqpbU1p
	mB2DibO2JG1ju4nHz1NalkdL2aWSNWOKogP75oTIoVQeE83sygkLYkXQ
X-Gm-Gg: AR+sD13h7lg2Xknnn89RUGABlu4PV2CGxevPynpvmdEoRn/k7GXTPXziRrsJHwBcB6a
	wvsKKuxk4DdMDI+sIbg69CSjtGSHqb5OHUtL/vB6KoZ8qakHslslkurOu8GyBJEkjlSzPvp6J4w
	BGyj2aE/BVhH1/1vXjH27xPWyjyagJIyKWSEffC4S8xAIWS2GST7+azKwJPk68/5oyAC1LItsvx
	TMXmMkZhJv1zR4Qyj0iZMwKfrBCmv5NfuNJ1Godwom5hcDOaoXnyLNLxtiJ9dMpIzEdW8sDJAKO
	lwVL/+XAPYbXGmsL1/UGa5nKeZlqeiMgG4yVElXeAh3a1gXlHAB8IHvdcjY0AvjBTWeA/CTWhBm
	Fbirs6C724ing77a/v+cKIpG9cCmc/F4qz7W97vgGdvW2Y41XNFNg93ZwKfyVOvLYF1BoyiKmWr
	y7ODw9DtI71RFhNdf7zTKE5JzTphgI5XEc6UbRSn3lmly0BJ0agTmBDk8SZ21igFs5b5Utn3oMf
	x4Ee4sUg4uX7P/0i5RokQ==
X-Received: by 2002:a05:600c:4f87:b0:499:48be:3189 with SMTP id 5b1f17b1804b1-4997bf81217mr46280755e9.0.1786533958498;
        Wed, 12 Aug 2026 04:25:58 -0700 (PDT)
Received: from [10.25.219.170] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b238a9asm42581695e9.3.2026.08.12.04.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:25:58 -0700 (PDT)
Message-ID: <36260069-cd81-4744-b5fb-8467f7874851@gmail.com>
Date: Wed, 12 Aug 2026 04:25:56 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 "Frank Li (OSS)" <frank.li@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <frank.li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 "Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
 <20260730163412.1145-2-laurentiumihalcea111@gmail.com>
 <amuUbkDM60eFzvJo@lizhi-Precision-Tower-5810>
 <MRWPR04MB123301AA9F074FA2976AC36C288D52@MRWPR04MB12330.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <MRWPR04MB123301AA9F074FA2976AC36C288D52@MRWPR04MB12330.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/3/2026 2:03 AM, Peng Fan (OSS) wrote:
>> Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc:
>> document optional "memory-region-names"
>>
>> On Thu, Jul 30, 2026 at 09:34:09AM -0700, Laurentiu Mihalcea wrote:
>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>
>>> The carveout region names are derived based on the DT node names.
>>> Because of this, the DT node names are ABI, which is not supposed to
>> happen.
>>>
>>> Fix this by documenting an additional, optional property:
>>> "memory-region-names". This way, the software will have a way to
>> build
>>> the carveout region names without relying on the DT node names.
>>
>> "After update all existing DT tree, this will be required.
>>
>>>
>>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>> ---
>>
>> Additional information to help understand why it is important.
>>
>> 1. at thread wrong use vdevbuffer insteand vdev0buffer as node name
>> https://lore.kernel.org/imx/20260705202439.3F5771F000E9@smtp.k
>> ernel.org/
>> 2. similar case happen at
>> https://lore.kernel.org/imx/20260715071741.79CA81F000E9@smtp.k
>> ernel.org/
>>
>> Suppose these problem should be detected by dt binding check instead
>> of sashkio ai.
>>
>>
>>>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/remoteproc/fsl,imx-
>> rproc.yaml
>>> b/Documentation/devicetree/bindings/remoteproc/fsl,imx-
>> rproc.yaml
>>> index c18f71b64889..8e3e6676a95e 100644
>>> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-
>> rproc.yaml
>>> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-
>> rproc.yaml
>>> @@ -62,6 +62,10 @@ properties:
>>>      minItems: 1
>>>      maxItems: 32
>>>
>>> +  memory-region-names:
>>> +    minItems: 1
>>> +    maxItems: 32
>>> +
>>
>> Need restrict names
>>
>>   memory-region-names:
>>     description:
>>       Names for the memory-region phandles. Each entry must be one of
>> the
>>       following recognized names. "vdev0buffer" is the shared buffer for
>>       virtio device 0, handled automatically by the rproc virtio framework.
>>       "vdev<n>ring<n>" (e.g. "vdev0vring0", "vdev0vring1") are the virtio
>>       vring buffers for device N, also managed by the virtio framework.
>>       "rsc-table" is the resource table region used to share the resource
>>       table between Linux and the remote processor when it is pre-
>> loaded in
>>       memory. All other entries are treated as generic carveout regions
>> that
>>       are mapped and made available to the remote processor.
>>     minItems: 1
>>     maxItems: 32
>>     items:
>>       anyOf:
>>         - const: rsc-table
>>         - pattern: "^vdev[0-9]+buffer$"
>>         - pattern: "^vdev[0-9]+vring[0-9]+$"
> 
> There might be other entries such as m4_reserved or m7_reserved

Then how about an additional pattern? Something like:

- pattern: "^remote-reserved[0-9]$"

I believe a board could, in theory, have more of these additional carveouts, depending on
the range of firmware provided by the vendor's BSP (or the community) for that particular board.

Still need to put this in code and test it, though.

Peng Fan, Frank Li, would this work for the NXP platforms?

Franceso, could you please let me know if this'll work for the Toradex platforms?
