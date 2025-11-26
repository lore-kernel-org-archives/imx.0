Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08CF347FED
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178675; cv=none; b=PG/W4j9O/EuUERjw1pp9MM6CMIXEqntGx4Jf4U5rTu46HvitIPU/m/RptwkgNpyiAchoLZYejOFiCPPu+d86ph2V9kJnsUDbpj1JFTZgCyCLcXnMJgmc6KRT7cRn71cu71D1wIhoCJazYW9KOq+g0sXtC8Jbug67jgf+rjl6QNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178675; c=relaxed/simple;
	bh=XTzrH2vk8b7vux/v+Ldp32Xsu/KfdVGib1wg3KrBT6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IpnZnLFNYFI3buMvv4UDoJkxWzPfQ4KN/e/3PT8JHwCqEQ1hDI3LFBd7mKLaiDck/zri6DKHKvJPkL9kjQ/NjmiCgQliD8CDApu46tSqsmWQSWbiTrCspEWS3bkQzgLOrSn0QjGNv37WVS3NqZD+KobSVAHdYTXH6nHvOQ6YmiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LalmU56l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMgOwnts; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LalmU56l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMgOwnts"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQGD4Vb2856158
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRiXTEVr/zgoXr+sIyjrp9m7Gn3JDKXdRtstP8uZnqc=; b=LalmU56lmZCoyX+f
	d1E5dso1kl7RT5H/DQfhtgqOeySAs9rHAYH9QRnDOxnBvOLNncC3MdlD9II1CEX7
	FJxoc2FGuR82tDW6zr0n2NWyl9a2rT2GdSZdLxPdy8Sv4MOfV/mfhdOaPGP975T6
	E1ZIuUzxkJ4FRYsGXybso6Y9BQwV8IxpEHimpFiNlyEjRIPIX6LtIU4HWLM3HRZy
	XluF6MmGbVFCfx0p0NnEE89cpp4ep9rvBOW9qI2L6rLygBLHjCI2NWIV/MVmQQ/j
	LotRouEuK1QTascPQ43Xdw6JZRb+n3E4SvA0fQOZz5yC98yAnNnGMlniTMbA9Cru
	fd4P4Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap4vh886c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:37:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b51db8ebd9so72864585a.2
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 09:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178672; x=1764783472; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IRiXTEVr/zgoXr+sIyjrp9m7Gn3JDKXdRtstP8uZnqc=;
        b=kMgOwntsu+QtX37vLN02IyXz7OTLAi8YT7Pn2kcip3cnN8B9GX8Jjdxh8PPusHqmjJ
         3Pwp44G+JF3GpEvX3LEwIxGjmQOVjpKCl2MSzNsRH+Bi0dlvcwvaVnpviofz3QcYNXqs
         lI8L9/F0et1lkykroRJxmXunmtNAUl7yJpHnmDwkrNcfOuKGuUJRrDWjzc4mNj8pB3vD
         hWv4U+zPcZIQFAQd0ygA+SQnEZBr4qdEAoLLEATLruUSY0mfXttJQ3VcvxCM8TPI0kSA
         B7bd3VurX+57UMWIlSvOmtmVMXAr6WUnnDTprq2NPT0hF9RLTOwmdfeRja13l+ecqs3i
         t6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178672; x=1764783472;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRiXTEVr/zgoXr+sIyjrp9m7Gn3JDKXdRtstP8uZnqc=;
        b=MfrJ/hwErSV1nTuojT3vlAgnoIFbvSoIbQ1/TtC21AzJk9SpMcnwiStazrqjnIhu7D
         YlznFpgju6eY7INNOvg2ZJP9nMg4WEicR3Q37ujHWjUZyczexjuoo9Zqu2ohOfaZWFPP
         0aC/brcMucOj0p1U+4aj7AX9Ul+QVPot1Ttdb/0OteTNBdkVE49KdveA+wqHKJm076hu
         M/7Ql6qD/xPqz0Vma+AQdyhntA6yEpWqkxaAuNvt6iN/Lw3lAV9iWeVcmj75jA2wHOET
         0nOognvvLEoEzuDS7aXbIrUGj43y4CkMe+GDBahQudqjNonQIkRnqFIEXI+f1iEb8bSH
         ndtg==
X-Forwarded-Encrypted: i=1; AJvYcCUNud0nLxiVjPnbw+mCCesVFivazijhxm61q7/qqyfIwDCr7NSHsqi8286/xn526Cs4gls=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNwFFq8RMclm31Sa7Bu1eSS1thf5LwiRxiyANcOqMQaK8e7laX
	yN8gnBcXRTUBUzGkEpyP+EljVU8hHStRf4DAWKUYbaG0v91iMAFKd8J3SCZ3zmf5Dq7eg+SXsyn
	/0luYaX0xvdg6RNKC7p/fSOd8hctGD7Uq+MjJGJAHTyARaRvZ/B589SI=
X-Gm-Gg: ASbGncu3jlfC8vFfJ/X3bE8BNLCBAumnEBwGlfHRHN+fIGyXv1VGgsVja7ZXHX790uD
	vvMvbZCFz4IvkYumaaIURLTv57eU7Iq7zZKReE6CEciwrE4iycR7dEQ47J8yVyB6laf0pFevNkg
	fVfV3A4O6AE0AB6DmU8JmAQwVFPwKbik8dsNFXIlF4mpiHKnLrsDwJQ5HZ+WkqewEuCR1EEScve
	lRn/AN9TZFgFTfXO4rQAgu1tetPmGLPA9/PHCA4CPHSa2WlpMzsg9s05kmFQn2Xlklia/OulIKE
	aksXaBDueRX+uze1r9YBn0rK7RFB2T9z08UKsk5rXG5npLb7gQ3vcUvFbpLZeDk2UDTZDGY3BEX
	ejRpHdi/7d3W3YNGbL965oMns5wagoZYXKGHGBA==
X-Received: by 2002:a05:620a:2945:b0:8b2:61d6:e25e with SMTP id af79cd13be357-8b33d5f591emr2579252885a.90.1764178671811;
        Wed, 26 Nov 2025 09:37:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFslc16jWoYmayl/AsoPewbcJxUtciw3UWC/Jm+aYlwNKGO1iQQBZE6p117t40Z9JzALpNl7w==
X-Received: by 2002:a05:620a:2945:b0:8b2:61d6:e25e with SMTP id af79cd13be357-8b33d5f591emr2579249185a.90.1764178671401;
        Wed, 26 Nov 2025 09:37:51 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76a4360a3bsm1033877066b.23.2025.11.26.09.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 09:37:50 -0800 (PST)
Message-ID: <29ca0d4d-69b2-4b61-bf81-40ce87789428@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:37:49 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] regulator: Use container_of_const() when all types
 are const
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Samuel Kayode <samkay014@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev
References: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
 <20251126-container-of-const-regulator-v1-1-eeec378144d4@oss.qualcomm.com>
 <d01a19d7-598b-492d-83d4-587a36087971@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <d01a19d7-598b-492d-83d4-587a36087971@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX+XkwG7lVOYVk
 BEO8qAGQoS8KAt+VprFMslijqIw2jueY1qwf1/yfLq6rB0HYhB93p7pEQkkBlFB0z2Ix24gjGmz
 lmE8ohiYfwXfvHNek5VKooO/n+l5O8lESEYe+m6sN+r4QSXnyk+WXBBT/V50QEChvnKO2pyssHw
 7yL+NZB+vHMYVwW6QWiZrjTOXbpA1MzPFtQQOLwpdc/dn+QL9lffQfIBE/uWlRC/LwXmWwGD0ik
 udaMuNvzkDKwgCzT9AVW2S9Dl7hrzm4Zj2KrZFtFgDZanwaAMZmbNG3xF7rH7i8kiR/iqHdMZMJ
 9T9gQqM1ByiPbiFkAowLPjvwdMIOsZFpG8jbYNxtwX1MS+DHdw52Lnav/9HykGa+JP0roGqqhDI
 PqPnAaUU99S11H+sik9u4U5q7ReNqw==
X-Proofpoint-ORIG-GUID: KXKu-bPeYwQo_NsvPfgqKza6oElfn-PY
X-Proofpoint-GUID: KXKu-bPeYwQo_NsvPfgqKza6oElfn-PY
X-Authority-Analysis: v=2.4 cv=Lt6fC3dc c=1 sm=1 tr=0 ts=69273af0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=_Kw7KroSLUPirhZNgqAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260144

On 26/11/2025 18:33, Mark Brown wrote:
> On Wed, Nov 26, 2025 at 05:58:44PM +0100, Krzysztof Kozlowski wrote:
>> Use container_of_const(), which is preferred over container_of(), when
>> the argument 'ptr' and returned pointer are already const, for better
>> code safety and readability.
> 
> This doesn't apply against current code, please check and resend.

Apologies, I will rebase and send v2 today.

The files having trouble are I think in this pull:
https://lore.kernel.org/all/20251021172543.GL475031@google.com/

I will skip them for now.

Best regards,
Krzysztof
