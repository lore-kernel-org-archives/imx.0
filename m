Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAD753A3B2
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178143; cv=none; b=G6xIdDNkUo5+o3XAJrvnF+7wNVT3leyk6Sft5WKMEubsv/oG8jnS4gwRZKsXrbTmRF33lhS/WkHv0usRXfCcEUpwLT/FzXGseb1mfhjNRP7eZE0cWhq7wRHRfs+RkdOXPzuPG2Iaqm7kv2ki6yCg7w0HUJIZbS5Noa4nlvoKD6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178143; c=relaxed/simple;
	bh=m4SroQDjW8TNwKldqJ7a93glAT68I1794bo+GHS0J6c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=uyuJpdRHzk/aiitWW/gtd0/xtW/QytuqXF90wP4DAW9wqc509pZAUMUucwoLuMMuJ4Kc7zFVZDPWFQf+SL4YLxsrLZKdgLbIUQan3kRGLNOBzeJDcyeHz4b8REVe4HMa6Cfwko30YB3zOncYlSUm3y8XdYCkfBSKWlsq1O6MnnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHOVjEwh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gSQGq/5p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHOVjEwh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gSQGq/5p"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKfQ0322165
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 15:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lAmI+4l4jOMpvFGgOUL3UKDgOJQ+P1Ua774K7isTWf8=; b=jHOVjEwh4O5Fd5TV
	s1O4AgA/k83pSLHZXHr4MCtkqPzjalzaR8gQnJeLLql8C+fZtkxV5fSBROrqZowY
	cn+WqQCfLkPs+qAkMBFHpsXVb4suhO0wkNo5plb4HeT3ekACo8kX5EkTKwTcRaD7
	i27vMDQbe9PEwDgFw2ya9MQLbOzGboRY7T53860rPRLuEMLzPHzLguhtRTO7zp5N
	/fQIW77qNgZ1zdmnlCoqOfSckoEUM7WVxtkKUyTejkRA9dHpV9udyaVR7bBs3Vb1
	XVCpdlCsR41bs8ksQZKG1mmZtcgwtI+Ev7GECaO1PCmZB47sPGE1z0db2gDkcZcc
	5H1h8A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsgng9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 15:42:20 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-982a39e0c4dso273199241.3
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 08:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790178140; x=1790782940; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lAmI+4l4jOMpvFGgOUL3UKDgOJQ+P1Ua774K7isTWf8=;
        b=gSQGq/5pSfAeycTZu4HKqEPysJjNwoP4CknQszSGA9ddWX8AmSi0tCZikeTPymlK6T
         nk3bHa+JwC/8mzxFr1HbNEQOC6LZ0aAYNIrrgrlpP/cSE7ohP/vfjyseU8e71yHRuTrw
         LruiEhn2FkiJ0EnazRHk16lYX/N84qhu/ypMYnBW3JLYf29WJudcWEf3iMVV+xnQp4oF
         q5dJKiOa2oqDAeKtez/6jqlzq7XliSodou5eiC50ksrWE3ULduxJLpDUC86iyIAGRNnr
         xtNbT14ePmxPsDNRUS9VKy3wty8/zip0j/luSGhhNxu4f5h3kjQHeSyVv8CCSVOvTHe9
         WFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178140; x=1790782940;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lAmI+4l4jOMpvFGgOUL3UKDgOJQ+P1Ua774K7isTWf8=;
        b=0K7qUIzaSa+tjuisGJrdpGsfVkqzPhEXOCDJjoVTnm56Yqe9zBgz44xGZ9AZdienNh
         9emtNHxWx0yf+ALYvexzRt91EieLuZbRIJdiuJM0xrweCYmO4LL5xitBgYAmX894jSim
         tC4VD7syA/JXdd/w7VecyWlmC/MbAhX0gfNVlKcpYUaSXjNq0gKoQe1fGvSohQwPOiMB
         pqk0NTUFyQD1p8LLt+cqK6X2LnBA3D0bIiwBUDnKC91OB2wGj7vatKSXN3TYtD0lSnna
         KJGETIEJl4jU7xKLCubc7yWlalc9KvD8EwIqnYhveVp/xOuPxSbQAyQiCnIbIvILMSWA
         DAtA==
X-Forwarded-Encrypted: i=1; AKwUvBza4AK9euuTjEGDEfPQukn4GGdn0MbTrpwJWo1TPLWT5nGbeHoxSvJVxb6tqRB9QAnMiY4=@lists.linux.dev
X-Gm-Message-State: AFuF++mHSGEKhrwtQ+BidU836ueeNf4bxYHOokn0EBI7mpWQ3aoVV2hi
	8dBXHI3Hqs5gs6Nf85xaj4235+PTmFvjDmfjmbgh7ylDv9H0mvLEENW3JztxzrmZ4PQrbTb5Vrx
	7vMDwC++ihxun0/kR+cea+asJ6YoGgCo4McpwGuRA5XkdnIQr4om40qQ=
X-Gm-Gg: AYBFou33bB+97sgaWzrAG91LogedGQj80wBy5YNbsMBMnaLiEPBYhn9oX7Dn/JD5bTR
	B/pxi7hm1PRqCYjrO9jrfUzzLH6hHCLhqychFX6pSyYOU8c7wTSjQDEXU7JlL0gETiDHmAqxbAm
	BdCBLsrrmS36Or/o0RkcsfSmrDrA/xgL9mlA99P9B+Ki+16CFzCc5dFn11iNBOwMlwZfLhePa6w
	iY4CYJ/CQH9ffvl0wMdZImqt+ABJ6Rs4Rknzzs6Gu7zvba8ZJmijp3nRxFCBqx2PNRwr/OqE/Iz
	4iz5yvM/Ez8SDU3sZa4ZXPd9GkEKnhT7ldBFuo+Wb3VZGKlx2LkRH30mg5Ipjgrurq2tI+G+9LK
	kGgN5yBbNsb9ZipL50p83JFr1zEifvNRb+1aJ3setEwc+Na/cfbZL+g11yaFohnDfY+ULSQRW3i
	1LwCpLr35IcFGoTvAePKZomfeD1eBbzdWC8cyMZnZooRee2wor/kuuyCSa7yHCWba1nQ==
X-Received: by 2002:a05:6102:951:b0:7a5:213f:9a1f with SMTP id ada2fe7eead31-7ac1db33a7amr2601060137.18.1790178137722;
        Wed, 23 Sep 2026 08:42:17 -0700 (PDT)
X-Received: by 2002:a05:6102:951:b0:7a5:213f:9a1f with SMTP id ada2fe7eead31-7ac1db33a7amr2601039137.18.1790178137281;
        Wed, 23 Sep 2026 08:42:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c6022sm144907666b.14.2026.09.23.08.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 08:42:16 -0700 (PDT)
Message-ID: <839b884b-9db0-4215-9715-40549d1c6a26@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:42:15 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
 <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
 <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>
 <arPMAXs4jjUeu1DE@monoceros>
 <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MiBTYWx0ZWRfX9V6e/0FN+dC9
 6A4UI/p32ngyLfHSSFRsJbKnmhfN+gH5ni9taybsVLFW16B4ofOGS36gGIecfZ6rEycih6ZYw5z
 OyZKQgxpYOUZMZHTTy2xp/q/x72Rk53PV945LFE09kI5AEwU/l6t9DhlmYJqAnMiuohs4bPrTgg
 I5e56Dw8I7bpDe4Ba4CSS6VDU5iFhyXOkhw1Uj8xE7oJyC0kqrj8KQ+haX9Mft6jdw6FZ1zLkH2
 1t0ka9ZsnpvykZOyeHqNUPI4SrhW6FBfXmi48M8dHj0NQEkrbpdBIPPSm1t68OpdDtRLO32PBZ0
 0ZFZae4aZ9HLuQXAixwnR2NKZ1tK1lTIlxCr76oG7sNVIMzNxV59ymqvQOuhaK2a42zvFxB3eKV
 YM/qlcfyE07kwc8jPocKcJm0hBqzMKUmiTh05KDvLXH3gBXsJm5yy3Yudb7DdTBCB7maOLyS691
 tGrGxljIV1AkmEU5FHg==
X-Proofpoint-GUID: LOhTjJG3YW7eAaFPoao8gSc7uF4rS8hD
X-Proofpoint-ORIG-GUID: LOhTjJG3YW7eAaFPoao8gSc7uF4rS8hD
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab3f35c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=IpJZQVW2AAAA:8
 a=wmcOPm1-qqoyX47EQMsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MiBTYWx0ZWRfX9za7+DDUy6Kn
 4OpWmP6HqUJYpu4Oj7TySj/Nb1e+q/l8O8piuD3p24blO/FsU6Fc5j6lPiaGldTHkjYkjDdqoqF
 e2cl6cbOKyW2aaV6iV9luOYHvy7dCyY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230062

Hi,

On 23-Sep-26 16:25, Sudeep Holla wrote:
> On Wed, Sep 23, 2026 at 02:55:26PM +0200, Uwe Kleine-König wrote:
>> On Wed, Sep 23, 2026 at 01:01:44PM +0100, Sudeep Holla wrote:
>>> If Uwe is fine, yes I can take v7 as is.
>>
>> Fine for me.
>>
>> Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>
> 
> Thanks Uwe!
> 
>> The nice thing is that the device_id structs are not API, so this can
>> also be addressed later if someone comes up with a clever idea how to
>> implement it.
>>
> 
> Agreed.
> 
> Hans,
> 
> There were other changes in bus.c that conflicted with this. I have
> resolved the conflicts and pushed to my for-next/scmi/updates[1]
> 
> If anything is wrong or if you prefer, you can post a rebased version
> that I can pick up.

I've given your for-next/scmi/updates branch a test run and
the scmi-cpufreq module autuloads correctly, so everything is looking
good from my pov.

Regards,

Hans

