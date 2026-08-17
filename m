Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6C026FD97
	for <imx@lists.linux.dev>; Mon, 17 Aug 2026 07:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953051; cv=none; b=c3VwKRPh9YpWcxXcELayNvmgDfnXAowfDbz4+vXIJUjgxyptjOJ0DI9ka3u2fM8kpgpsU89xNxQqSa/RtaexDD8qzVK77+cO+n5IooZYSMW4Ha8LIhxiOzNRU4/QFFEOfF6QSouxfm+m+sKGcGI0QbSNWhBqALI2xdlbJQpcnvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953051; c=relaxed/simple;
	bh=Hk++D4JyoolXiQ+tRRkmF1yo/R442jxk2q/MahToilg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LpUmueqFPLtaqBWIYAR11cpGCA8kLl4tFq1RPd4Z4Wp6FqqUQULk8iTuTbNhEx9qEogA2syREUO8gienw/awnn3rHdWlcoiX6T4mmEi0nvdVCG1yTHwy5s1fuv7y+2ttPOqzJVCOMT4AZwKAnsbQYnuMYA6q56l6QxXMGEF0gQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIHDhD7L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vi2CK9YE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIHDhD7L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vi2CK9YE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H6cHcq4118994
	for <imx@lists.linux.dev>; Mon, 17 Aug 2026 07:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QIFWPWWJnUZJjoMpA3IEZYfcS2vjGxguJ9wrbq4Ooeo=; b=BIHDhD7LzioNEiGo
	vipt9gQsa01CJMDdJQleA5PPgIzAxOnvn6U0CDP+mbH4hQCa+y9NfHNjFthGtaLl
	zFX+eskz+E+au5mpxO+aZ6yzenmAuavZMtsfVWfVvQSLMr3FJXE/bY9b9Cchq7WX
	bnp1KqcYUxWcFhkbgnpL41+V3Baq6wE8aj35LcHUEE5gegNeNCbjd+sLfCaTUdFK
	y94zu/vLC8kHHmuOev0nbDWDfkO/d0W3cAf7S5Fodo0bb9EPie1M1vHgplCGOgch
	ETUlrnoNWeyyDMDzY7aoKxANvZtc8QVoc9OTWG8rCixWbmA1ZeheENKl1cQxF0fF
	tkrmsg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghfdyu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 17 Aug 2026 07:50:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso28202485a.1
        for <imx@lists.linux.dev>; Mon, 17 Aug 2026 00:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953049; x=1787557849; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIFWPWWJnUZJjoMpA3IEZYfcS2vjGxguJ9wrbq4Ooeo=;
        b=Vi2CK9YESuXoW/DJs1w49v9n+b0J1u7Vuwmy7gyhG/etRGXBabWraC8mL/3sp5OQz4
         YLhJIQafbh+BOLO12CkbSUsDPccdhokcmMQLx+0YfhEC73fRFGB36hiZbNReFD8NyEFA
         wnh8u4ivABQaSyGykknacBSwTmJqvP0Zo0DwRe1oFmFAP2ZQ4YsFmWbTWbPDBbneXVeV
         wWLA4rqKNX/eERaiHeG8sRlOhJjDh85VpXxMrpwwJqo98S7SZ2jTgk8s0R+NyD6jthYY
         RcZWjvSQYi5BX7ZjyHLIvtxxLydd3Yi9EsNc8oBo/P39ATVDq2LNfnG2b5nV9jbAmSfG
         K6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953049; x=1787557849;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QIFWPWWJnUZJjoMpA3IEZYfcS2vjGxguJ9wrbq4Ooeo=;
        b=poDyFmZ+iH/tBce05k7KdcznE7Chnfuegx2o99vZePBNn38U9heKOkh1UqvqJjDtWA
         34CfWm7QgJWFlcKejJ5xIvJWjD3fnxe8Uf7pcvt8shQ+R4iuBcms7qJGP2YlA4Hd/i9x
         GBCaNDBtMjMfrcTABBhS6kRx9w3Zqv+b4Q5Z2C5RAMxcIkgsrUJ/SUCL49bo/0mOm72u
         RudQVcPSg8/4QmBj/Wmf/SnjwFgHd0BADHNT0wTdnzykB7VWHhCDKTJI/4/RiFIR0pH0
         2rCzYji3g+Br/N3//AtMBjhq8r1zFHOyqQKGyvHVdNVIdSikOfjycxl/mbYt2gmE3Wp6
         DT/g==
X-Forwarded-Encrypted: i=1; AHgh+RrQdcivaCfRMBqdYt1GvK7d5fn8cMhe/YFINAkzq3vaK5RW1kF36Lb/forfd37NCxIs3bQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrWPCtX7638rkkKDBJxc7c2wzT+rXWZIVKqdyiUzhuNcfWSiOB
	1XItWhGWN6XZJfyJNxDzLsP8RxOEzSB1of1yQ/UWM08Iq3IKZYM0Zkv7HpYN3AoRp9bthBNMZrL
	/O9gliA7XAdM3LB9iOu/aG1xFL+HnK/5mMrltUlCKG3hUW0xKIJKEmxc=
X-Gm-Gg: AR+sD10dA7nkwIKsyCSPkoE/BNrVag7LjmADPBUnwJUC+4ieQ+zCwdV9mfCrr9u0Yfw
	g0jybf4QP8gtx+5Ul3BxS82Z8hiyB+aOcJeS/8+UllaXqRixYnvgRxlGd3Bo8mI5PT7zMzUnENv
	Ee9wv2XalJmcvNQ6N9Aj8J18sv6cTrmdAjmksWRL6uX0/hNnCmaN7qCMMq//4zFp0oieSH1IfHj
	vqysjVYXweaUhNfAE2wChfwhePycam374h2SFMa4hf3vGSt2ZFKJvOQHSqUa0eY8VgYj/Kihg+K
	ntp8MDpoNWlXLUa21psZGHllCtL2NO7cK+0lcqzjWXSMzKcbeHmx0lumpv5+dVo0eLsXJpzr4Pn
	a1lIg6Rdv4Hf40zcCtas9LqcT
X-Received: by 2002:a05:620a:460a:b0:931:4c8:d8ca with SMTP id af79cd13be357-936d233ff1bmr1744114685a.1.1786953048757;
        Mon, 17 Aug 2026 00:50:48 -0700 (PDT)
X-Received: by 2002:a05:620a:460a:b0:931:4c8:d8ca with SMTP id af79cd13be357-936d233ff1bmr1744112685a.1.1786953048325;
        Mon, 17 Aug 2026 00:50:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85173dcsm314100a12.3.2026.08.17.00.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 00:50:47 -0700 (PDT)
Message-ID: <7fd19b98-1d3c-44ae-8626-e89461e208ac@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 09:50:45 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] media: iris: Guard the QCOM_UBWC_CONFIG select
 with QCOM_SMEM
To: Daniel Baluta <daniel.baluta@nxp.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, nathan@kernel.org, imx@lists.linux.dev
References: <20260814141724.1006382-1-daniel.baluta@nxp.com>
 <20260814141724.1006382-3-daniel.baluta@nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814141724.1006382-3-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1NyBTYWx0ZWRfXzdpQYurzrcWX
 1qOiPPhMot2m0M3N152j/V/A/gsJvhdYM99L1cTtVO2bNd/BlyYSH8uAGGhXTwLzSZbVTiaXqRa
 iMk0mdWudRDkl/WnN/jJHBcy91y3oHY=
X-Proofpoint-ORIG-GUID: V7oCYCBmBMKWc3UGTgkNg5gnUPZuykrg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1NyBTYWx0ZWRfXxkacS5l26LdZ
 kf4j5CIm2VU2IogvEIDuDlHd9TVg0GSN6WhmrjsKo8mdjuIb2A7ZtY+Hs34CYK/B9qUV87JkN7D
 Az8/qQfcycwDoAuNvdK/UU09E7MIS/clKmiTtMN5D6CGf9eaGGTykIM+2xIRkicqqXTzKpb/1qA
 JGf5nDBBnK5KLAs9gP8c387ZC5sSIT6F4qiJQ/1eLJnDtm/2LULfniYgQjwfnDW8AUBU8zjSmPe
 VtnmW70qbJz8huVB6QEovt+we59bOKdIyWZsoa1q6KNK0cJZE5YVuQH34lJHbAh2aYXky9vMVlM
 ZA//2I+dr/fzz4LRk+1q3RWt6ijtfCbMQxTZteZKiPL4YIBC60BjBBaZ0gOhjaj5cF0hOvnac0q
 564fYuZZpR7aEU8XJBnyQ2/zATc8GGiTnA0FVCuOAoHh+w+fjFdaRYJZp5hEfEKHDkMV+24ULX+
 DXr46DWSbRG7KvAOUmg==
X-Proofpoint-GUID: V7oCYCBmBMKWc3UGTgkNg5gnUPZuykrg
X-Authority-Analysis: v=2.4 cv=I/dVgtgg c=1 sm=1 tr=0 ts=6a82bd59 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=L1AqNCugDRGGcWq5ZiEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170057

On 8/14/26 4:17 PM, Daniel Baluta wrote:
> QCOM_UBWC_CONFIG is about to depend on QCOM_SMEM. Guard the
> VIDEO_QCOM_IRIS select with 'if ARCH_QCOM && QCOM_SMEM', and add
> 'depends on QCOM_SMEM || QCOM_SMEM=n' so a built-in driver is never
> selected against a missing or modular SMEM.
> 
> Fixes: c43207553867 ("media: iris: retrieve UBWC platform configuration")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
