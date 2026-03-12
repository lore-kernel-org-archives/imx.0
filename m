Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB65C3ED5AB
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 16:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773331876; cv=none; b=GRFhviGEdWmphBzk9E/dovAglLvNrC2JbAQoNPwLEQLrqJA9C7qbsMErKWDNbUNr68mvW1+MQdFFdBYwtrpVpHOetpB+WoaFSH6+EoI6SSdKi2d4eij2hruF07o8dQogmKtWhAGGq0NT9useEtE4+rJtXXlNlftG+kU5/QbWXlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773331876; c=relaxed/simple;
	bh=hxOCN03c4G4Ad3M6hKEuU9VW0nNMDkd4Z+1WR+rPonI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4txE5vQjFGovjT23x9bXUgB/otNAKKSWTZkrKlREqMNCasv2MKyrY3EsD0l86PO/eHRQvz0TqVapnBley8Uq4whsyeNJ7CCv8Z6jifEP+3HDsPu8J0zYNXoNlwYxUL4c0t/8SfH65xvvr43GkxWB4UfVhv3ULXaoZDC4MGuRlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iDm4qypL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+HUR5fy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iDm4qypL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+HUR5fy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAe0jh263527
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 16:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0NHWp5xF69C75x6ziVqnsVRRqywp5v1+QQvwN1XR7rA=; b=iDm4qypLOQw7cJYs
	SpHrMbB8gioCx2ByO0hL33Qevf04vxj9H4DZLJQE1Yr2uiRUyxMHvy1rNewi5N1D
	Tj2XFl/cA0S41MrwAxfE+D3AHmC/0gNEQ/vpcORsTciwdSWBqbEKhb9KT1Lga7Bo
	SQejEdcp2H0e3vVUwbDBY5rTfEzrOpNkF+jwiYCP3onhEwVA4SlDj1w4/w8JgelS
	cCx6nelb6CnleckJFmjvrnM2v2vXf8Q3lbzrdzVE0tpMaBJ6u4rsn/9CW1bwMwYl
	QZLLJOHWJLd2KWfzoZTF6bJ57+X8m0LL9A8ixyKZR52O8F+E1r49wgC3peXTdpxd
	qaCZ2Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4yjqg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 16:11:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ffa0b00da1so1770231137.3
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 09:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773331873; x=1773936673; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0NHWp5xF69C75x6ziVqnsVRRqywp5v1+QQvwN1XR7rA=;
        b=W+HUR5fylN0AWT+r0hIbosY2IgwWTjF2BdyR5+z5irE2Kt+4Go7XoTrC3EbV1VF0Yl
         4OjK1fR0CxSDG+Ky5Ls7cQy7B/aVqeuXXkm/b5GTzd9u6OHoa9mbUQUSAAscy/onONcE
         B0m7UyONwpIhc1mpQ77X00Toq/bxe7GV9KbcbIeEG57GRehaz4vlxL7t5XnuWFl9c+Ef
         dGvYURHx5eqHvoRA3FdLn1x7CDD1WnJot3FwKEnQ07IjS19iAARZXsTwC2p4ZXk2piOH
         95+4Ywj84alHP46kfcA1Rsqdf1N1iPS0ar/3sUpgdToDX6sl+BEp9KXFm4lhqwM25AVY
         DbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331873; x=1773936673;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NHWp5xF69C75x6ziVqnsVRRqywp5v1+QQvwN1XR7rA=;
        b=wjFi+lRowAhDwBmNAn2HX/MbVfyEZN+C93kYgcOqFqemJ8FmUlUm4nuDCrumkf3lWw
         trFzyc0WKpEcARoPLC9dBf8De0jlWZq8sn70AuaVavlgO1hqZkgAhW9SeL5NLyOtWp59
         QI3NeziKrCRSycvATOQAEq00D+2PHLCioUgEWaVy9EnLwSYrMgcBYWjF/Uu18Z8V2lV1
         mNMVtlvbA1KZekoiWWRXMq3bFg27eMLSPDi/Z5a9slUzLOe2Eox+Rn/s/ns1bW1OSoZk
         Vir+jYH7YDV96Wr43Ph6fjLWYBKoRctPw1Uwau1b1zq2S420ZCE+UQaQqClGbneZvZZy
         YfCg==
X-Forwarded-Encrypted: i=1; AJvYcCVkW+s8V6fvXt7iUJgk0bLzaf357j1eCUaZ8LCoXTI4luvzZJErsYPd9V/165SbbOz6HjM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcYicCxyQNhhMfdXhivxGd5orFAXWxwG2Y1vQ94sf5On75YhZc
	97Dg2Kv8vTmqaWPxdFbXYCiMGtB1RUD0b1qVvALj8CkHBSPfuaqCLASwBdk3+nxy8IqpThMrWTf
	FWe+6x4eGx10GDeo0wDPXjyhZwbuVWwGmj7NCwEdKdPCpsbuOYYFABpk=
X-Gm-Gg: ATEYQzyoYddWBtVnQLyyn6g0fHRpBay06TxecScg+mSCUharAGY332S91ZJp8oETgyf
	5WjEYbuJmE9Ix6t30O/ccNK9JTlrrwiHOVmb39gt6vNS9WcrVuXwww+QInczZQ7AR9nHAT+4Co1
	dax4TC3zaoDmkghVY9MfMTFlspiVDfno0jyNTOlXp/EvzNmmla8z58QtoP1VaLbxVZjj/DtpyxV
	1rO7ILmqHNWlZ5SylMY/dCsr10CBk5uafPIAxzAQ6DXdIofF/5tTUQ2u4op570GjSMQCyMM2ydx
	F9CLnTosJy8odBUhRgJF5O0vFHkZU1VUvpWzY5uS5gc4fJjC61Ad21anJN814jmtvGVK1I0gmQ6
	O5sfzb5DlH5ont7sp96GTU0eAIUYvUBeUziAOnJ7o3B0HkcWn
X-Received: by 2002:a05:6102:b14:b0:5f5:4eac:cd2e with SMTP id ada2fe7eead31-601def6651fmr2806655137.32.1773331873260;
        Thu, 12 Mar 2026 09:11:13 -0700 (PDT)
X-Received: by 2002:a05:6102:b14:b0:5f5:4eac:cd2e with SMTP id ada2fe7eead31-601def6651fmr2806641137.32.1773331872851;
        Thu, 12 Mar 2026 09:11:12 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e9179sm138494235e9.3.2026.03.12.09.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 09:11:11 -0700 (PDT)
Message-ID: <50362f86-aabb-46e0-b272-e171101220e4@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:11:06 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] arm64: dts: imx8: Use undeprecated reset-gpios
To: Max Merchel <max.merchel@ew.tq-group.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@dh-electronics.com, linux@ew.tq-group.com
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
 <20260311-dts-snps-reset-gpios-v1-7-ea1cc09fba84@oss.qualcomm.com>
 <82977bbb-6363-42bd-9739-20f57eb00c61@ew.tq-group.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <82977bbb-6363-42bd-9739-20f57eb00c61@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzMCBTYWx0ZWRfXxeTblc4BPwh8
 e6+/bLFcGvcoRhzLEeee1i02hXZuKwilmf5EdDH6R0+zyGr9K6uNQA6CKrRD1guHdXMf3TyIL/y
 D7ApgNWXNsimNCUzlvU2VU3qreCJpaKv6KLX25PXe6cccR5zKrA5WGWPoSSIgK7WOaePi9dxUdy
 6ucxzwuzXVWvjkM1MyHp0+1bvdcjKjyjcJk3aavwbBHj71h7eGVcyePUGlQeYXOsBvz4swleAmS
 49IE9X9duqD7Fal0GRpBXBFNQ9fhcw/rX0E7pQxE5x/P6LeDkE/5yNmaEYioBnkzI+/ow2zRBW6
 puBSHRWOG+AQTTCu8wsTEweVTbYErzq3W3MUFRYKGYjlGOn7K6X6cQTtL0Hwd4WlXhtLdSXjl80
 LhJJ6F5wNQF8i6XWspaz/0/JqEaeZmiXJJKgSS5v4kM5/3Vd7JbOqWpTo0lbGIVbr8f6IVKSoyl
 TmksK/N1w7jY+LyCcjw==
X-Proofpoint-ORIG-GUID: lXKGgJ7XLgCM2yqoKhprUBwmX9yVeQQu
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b2e5a1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=0_edduNWIJKPHNMTgfoA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: lXKGgJ7XLgCM2yqoKhprUBwmX9yVeQQu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120130

On 12/03/2026 15:49, Max Merchel wrote:
> 
> On 3/11/26 17:08, Krzysztof Kozlowski wrote:
>> Freescale i.MX6 PCIe host controller bindings through referenced
> 
> I think you mean i.MX8

Bindings are called i.MX6, so I just copied the name here.


Best regards,
Krzysztof
