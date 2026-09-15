Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D46B41F34A
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 16:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488649; cv=none; b=n7JiWXTya19ou4etGZ44SYsFQ7xJJ0ha8q6yLb38V8svZ2REIU0tePmLwGfL1XQGNUxmjMHgu/yYslPsRFy5/Louv+32YZ70oqT0rMdx3JupKDO/pci4BwYiXpF+NA9gdJBqXHC0x/DJaXfbyBEuqsM90rhvXBgN5Z3UuAkdwNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488649; c=relaxed/simple;
	bh=eA254CkMPb+QSDDxpCysxmFLZpZxszLdbOsdYPrMxJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S8N7pRUif/UUwLxTKTJcxocBmrWStTNYz5ypplMvfBhNiuK5eTbeEF480Eby2K88QC/sl5tcSzG0/Xcw5J5rrY9EMn6db/ShGA3wMk/coUn8quEX5Q+DOxRKvcMLlkxgd6KNgUyVZXrI2PSQHQ9koR8zvwpjkpGhNX8ahjfFjME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnBKmLPc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KsUzzhb5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnBKmLPc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KsUzzhb5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAg8Q3959297
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 16:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5TDiG55CoXjTJx/VoxQIpkqirtSnmUSM30sr+5zJ4CM=; b=hnBKmLPc/w5CBx7L
	Hq7kQEDW0G5F7lCOkAJgkT5xBUbGtpZhr4bPIZNsh02QWms7UwsbelepREjSlbPg
	2a1w9HjYLi72sAHL8Hb2A9/VrBvc6fiR+uubFtdB1uzi1PvRak8YgvmuL6O9sJwW
	3LPUJ+NVYQo00kXQpcOasvbhhAu37iErP632hLUROCES/gNNta3gHuEjK1bQ5KJS
	9JBP8g0OhcnIm/aTtPQLvco9neG4H3fIh9vu61JN6Im6WJE2NN+NskYYOt0nNJCV
	CpBCitmwGkUTYYrBlq+UH8g+SuaxYBO90xMzZ3znQrtZ2HrYM4QbQqhBLs7Jyuul
	BFpFiA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2hy5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 16:10:46 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c58ce17b04so5510326e0c.0
        for <imx@lists.linux.dev>; Tue, 15 Sep 2026 09:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789488645; x=1790093445; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5TDiG55CoXjTJx/VoxQIpkqirtSnmUSM30sr+5zJ4CM=;
        b=KsUzzhb5H5ebvmCzYRK9PURmIWsqxMHB05riDPJHN3uTAOf+M0No7xJr7apv+sehx3
         PGqkHA5piDx4uzazxVqBPvELYs9e7q71Z1iSJl477oPabqxPlkZh6RmFFgo+FFE1CIJk
         KVDtZYaH1WLnMSWI7aUOvixKNYWrijcfp3Dvk4QpY25Yo+HY+4MT8vT+4HCk4G5ntPAo
         +XEKv2n9Dxuj53nyVsqT2SUZGpHSCReUo2LLk5tq5kl4jHJcqK7rMRba8G3QNPxR5fFv
         nW2/jBdV0H4RCiDTamwnMWW1y1cZLooo0uJTbkcQk41vAm24Io0a+hllCg4PE2BuhI2X
         5+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488645; x=1790093445;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TDiG55CoXjTJx/VoxQIpkqirtSnmUSM30sr+5zJ4CM=;
        b=jguTsC2OxY7fM3+3gSTDLVYISD06mMeKvEWcjaktPQfIJZJ7l7wZOUqu+z8yrm7xHx
         Q/6SYOHQUZ6jc03CBoHZPyNCE+oqCyJHjjMnC2SXTKYq0xjrsWEpPHIwQsq7MRRUm7yP
         zh+vQVqGTPbKootZnEHw+Y0AFcjD+AudJDXXhveos4Pm9oBOIOGzLcS4WMG438iTsm4p
         cStglUfAYTN1ipe22OD4Xm1XiTymK3gUzJHyl3Ko8TauEPKTnsF4kC0SkMpgYxT5tmy6
         GHaOazTL4P79fRulFmFisqynkdougP2a2G7UBJw1AJ+CnToOwzm9X1puIEvVwvK0IGRW
         sy8g==
X-Forwarded-Encrypted: i=1; AKwUvBzV94W8WIMVcE+ELBrAFOVvM2XRWodQMEs4Z8tL7BnYKnytHLm2ggy9/qnAK2H+1nGTQFg=@lists.linux.dev
X-Gm-Message-State: AFuF++mPvhWnOa0lkmibBSD91pNHkWOq+x29dqGbWTZW+3fMlNqZfFkd
	FNZLpgJm23kLmnRH1aCYBreBonjeaJM/VCo6QHuHdM3V4EOfybBoBWZYyVu5K9QIC2FRW8R53M7
	UmAGcCXNSXg2bAOJcrkXrLLN4U4HWDtTUnMXh8Ag2TMwOIEQr4H9J/6I=
X-Gm-Gg: AYBFou3PHrdXxkXGSv77nb2pK1PRn73qwD6BTWGeUQyph9RGvYYrbYRPem6lp0YSqcC
	K6r1GD3tolalLZMCQuF7gy0Uf5nO3bzKWMBNMLg5t1VIe9qCHXd7D98vrHOYfd66d4l3bgzTgZ3
	41JlnGudYY/ZIhUAIexPXgl7f7svqCesTvpB3Xl014vZ7ocJtQ1QIZmDCBf/Tw/Kx4qbpF56tG/
	f7LkHtm4XpX1Ebge2HN11MuW3U8LvGEESptMITBQdJhnVKTNtv0UEly5MEnGbTKFVnHS/iYY9Jh
	RLMOifdt8Nb6BGS/K07O1fvwC/ioyW8z38grnXJS5AfnZxdGlC1sjTbciOxzUPwmD7eOqd+mDFj
	TAZK0fPQ5AYeE7/Ej7Hy+U8Qvr9jc
X-Received: by 2002:a05:6122:885:b0:5c6:6c75:81c9 with SMTP id 71dfb90a1353d-5c993c753d6mr3251453e0c.7.1789488645560;
        Tue, 15 Sep 2026 09:10:45 -0700 (PDT)
X-Received: by 2002:a05:6122:885:b0:5c6:6c75:81c9 with SMTP id 71dfb90a1353d-5c993c753d6mr3251376e0c.7.1789488645134;
        Tue, 15 Sep 2026 09:10:45 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fad3sm78795f8f.12.2026.09.15.09.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:10:44 -0700 (PDT)
Message-ID: <d366d3b2-a054-4945-8c02-877921a6073a@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:10:42 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx95: Drop unsupported opp-hz-real in OPP
 tables
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260915072308.64047-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aqlbFwMZp_TAExFq@SMW015318>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqlbFwMZp_TAExFq@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pOi3gHSOw96xDN58-ueWsWJUxHmSLdGn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIzNiBTYWx0ZWRfX4XoON+yJ2YGv
 PORrGn+5MwXTpTNwqc/R7sThLpJZgVoEDu5j3AZ8HeoOZX7jR/O4D2yFdHqCUHe3KV11qcKmUSG
 8eLuiSHpY1DJOnGAYvfqvMhf+eYjkC4gN3b/FJmq+b8FQh8haFZ0WEuW8TptLbPDMNViO9ee5Az
 XNP0ZCsDrt32vxvmoGReVrSQeR+GOSg9kV7ihQil/S21tbHgPa7OXmofk2qJ26HXrdzcrijz7AJ
 5ZxF90oPAvW9e8a689/ujlKpTpqikT4TSss9IOp5obIyQXueowXiwkO0DEo0JwNjUPgGdHyYIx3
 Xv4CMkqzdEQw5sZiooB5oG8TSVdolMqbKPpx08m6MV7MuBMGPf7pf14HsaY5LOMLpkAjnYOKl9C
 174PuD0bXAsI2Kt3t/5gQgVaIrymSwDymiY98+g+MRz2p4+9K870Wtqn0j6AB/ivNNbLehgKD52
 dZTjGj7ii4sg9++o61A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIzNiBTYWx0ZWRfXyKkQoX9PRvgT
 3pZk+D5xnIUroEkqCrne48pK30nW5bjKYit1vZybYhQX1FcBiS2oP04KnLIgQjNeTNy92d6NcUC
 Mfx6zEjKynDBG5XUAuNww9fT7RDG8f8=
X-Proofpoint-GUID: pOi3gHSOw96xDN58-ueWsWJUxHmSLdGn
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa96e06 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=IstA8FdGA62tgLsOMVAA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150236

On 15/09/2026 16:49, Frank Li wrote:
> On Tue, Sep 15, 2026 at 09:23:09AM +0200, Krzysztof Kozlowski wrote:
>> There is no "opp-hz-real" property at all defined in the bindings and
>> new DTS is not allowed to bring undocumented properties.  Fix dtbs_check
>> warnings like:
>>
>>   imx95-15x15-evk-pcie0-ep.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
> 
> I run below command, have not found above warning
> 
> make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8 CHECK_DTBS=y freescale/imx95-15x15-evk-pcie0-ep.dtb
>   DTC [C] arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb
>   DTC     arch/arm64/boot/dts/freescale/imx-m2-pcie.dtbo
>   DTC     arch/arm64/boot/dts/freescale/imx-pcie0-ep.dtbo
>   OVL [C] arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb
>   OVL [C] arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb
> 
> Anything wrong?
> 

Older dtschema?

Best regards,
Krzysztof
