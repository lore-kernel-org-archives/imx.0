Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345630;
	b=23zKJeoGbBBsWqGEcuxwGJnF2ffU8x/b/iOMoRTq/aB6R0/aQbT/XUvIXsPrkNPLZ0fZ
	 f/1txgh/oBXd4aH6PIirH9u+sGdIEuHaVeF0jKd7S0tWsLXFj29JTHY8cT/+HaDkB6Dlz
	 hhiOgSXEt2AhV7YvNlTL6FrzCV961x8Fjg5d2sK0WG7xjVqSq/ga7APtA6KCI2SnJkT1o
	 UQW7T6yFSzfqBd/Kr0s/ln5AR2e9mNPoMJ28pRoPfemAYsss7tWoVuEJD6qvSsVPfpEu/
	 M383tIXKGtYhXmR363k3uueZOOvW3ODyMOITQUpMOFFbfs1OvJu3dCXvokSsztVlWJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7XJIAhiidxeglvGcwqGX9Zevy6cLKtQ1yDQdXG6Swds=;
	b=cuiI6EVWWc6/Y0eJTEcK5a6L2JRwp4faDmSIX9emMSXcj3zp6y0TbRhXsb9dvbkBfNuT
	 nhR9ZbQx15alQmUnRiVF26nffkjweJGj79z1o7rVd82GjxA8BEQ4i84EpmEnqm2SRe2Zz
	 GLXblQPmOFhTwHuHdcqvG+qLjX5j7GU6v6hRjqoTJG2LhXSLjRFFRwYNL2c1x1+0JBZqT
	 WGyhhwrumYleRXKfK8+vAJwbEt5h156SQeJ6XodJ4RJnXNM0VzgtRnqKM9Daxu+QracfN
	 NPMNnUHkgP+u8uCtpeCc/OTzQXVixFX7l+B5KvYhgIegHYNOqae/RBkhav/cne0v4wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gY/6Mmo1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MCHzqzjm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E2D606A323
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 07:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8E2D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gY/6Mmo1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MCHzqzjm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F0il1266534
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 07:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7XJIAhiidxeglvGcwqGX9Zevy6cLKtQ1yDQdXG6Swds=; b=gY/6Mmo15swaovij
	7QMQ3lMnOhPfkyE3bAzID94ZAShm6ILrwGaluc1tf9/fKPL5e+jOHUDCioCQKEUl
	3rkgFh6uFVnz57nnnlpAObCIGHcHLAayL2VCxJRL0GL/5Y1Ob9seGONFIvjVUWnJ
	eSkrfdjkHHaVKmCiixMu/NrrPm3uy5ryWZ4iAyAHtOr8VMefaRS0e+c7Bv3ULRic
	Kat5L5TBjgA72YHB89NgDOVLUpBylOFiwJlVBl4XMZlAK/3Xye4+MwfzBztMtHtL
	VsDHDYm1pwpPEiaOIc6s3JZOlm+w1KYtKq+PDQUGaTa/dYg2jnSBqAxXO/mtH4uo
	JP+s7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p1uek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 07:33:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f2fafeaso46155385a.2
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 00:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793345628; x=1793950428; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XJIAhiidxeglvGcwqGX9Zevy6cLKtQ1yDQdXG6Swds=;
        b=MCHzqzjm7nIuDhHIg8mb7+tx0abvPUgW4wjZ7+Lcl0RUVzZ1IftQNDwkciBGWEeb0L
         tkfTZWzXNiLLa+oi/PumbjWTah3XZXc4MCctf5soq+GDPWeol+Ov9p/B1PDztumAODzh
         ALxIlwu/hvL7Ok86yHqt2MpgtT/vmdy2HRZGpTEB+c8KYeYdXqn7FVsB8DOnEtLQNb+s
         /YCCbq/5BIq4fGkPf2TxhFBFLC78F/ZASD8Eoc6uCuu5y43J2dqmqawVjKW3eGKAuCKh
         GBUJGR4c8In9GWOisc1Q2ufYGDEYr/K1ZRgybuEAoNhiHgnCEKuwk9MoDysxAuV4teq1
         FZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345628; x=1793950428;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XJIAhiidxeglvGcwqGX9Zevy6cLKtQ1yDQdXG6Swds=;
        b=Yg+GR5o0isgSw2RbD6wwc0uFsQrX3dqT4UrKBTPdLW0ahm7HCS/HSz/xdNLPrHxO7S
         4tZfyLgI3z1jm5fUiZRtlZR4veS2qigXFJdGsqwztqHN+CB63iDC05cbSBE646QKrL1U
         yL5/NWYqTu42nErUnLSKiLmkjP1JbDA6ZuHMk3gSi/GmuHrMKGlOg3tqqE4Ow75SA4Mk
         2rzg6dONTyB/e4QVGOHlrKHhC2TuiEvRqEGQ3AMJSN9ehS1gP9p0KYzw1ZhgkBxtXLvX
         YnZnsYTKHaFufd6ZGTA4NBwtuMaVQ/0N39Elq7r2DaJMRbrm12hzbZbnEVtp50C6m82Y
         lVzg==
X-Forwarded-Encrypted: i=1; AKwUvBzO0RZA4KyOVm/igL10EXbSVZeAKfMLRUV7EN3PfaddhCog/U5aEmtgPWzECsqiz8KCtYw=@lists.linux.dev
X-Gm-Message-State: AFq9FYLrCPO65vxWZ8aXwcDBq335ce+JCRQzPPGiz3xN+SPLrbz+UfrW
	TaXVIKGii2OURcTm91DODtS3o2yIAj/HDnc5ujOoTwIUwUKmlS/cg3fm2Tzdh3Q3nBtC2ajWPZA
	y7c5DOQW+ic9EZ/VgooQ5qafm+eO7BH3W/2GbhwCMlv+gfnmGGzmnDmY=
X-Gm-Gg: AYBFou3eS/9oYhaU6o1kSbq2mJJbCD3CFyua7FxbC0a7/RmH5SL3/2Wc9tSnxGZwzAg
	ce30mmvPM1f/JEF56pIavoKxqCbfDE8l7/coJJuV9vDhQz33AqtzxdCwF+01roF+Zw26NLDbgb+
	6z9ofAJqun2kVaDo2wnds9ktolYwURE7AwBUXM2ooIdJ37nlJV0n5VAm+P0kaMqsW1VxWxggofu
	5Xqvb1V6SFHtZHev+0uJzrzR8Ej7z20cqBjSF8n//oph2RD+GRVDRKQ9MvvGCQQTUVU71UcgxfJ
	zfRXoGeGF6BR5aYPYgAuWOIi3QbvXV/CuSi6lbs8Pimh4yMk0k8JZ3wBlPZ/g+mfJIpbJCkkkh9
	s7wwwVOs03tORgoLwgBIUZtQWab46PIG0sPJ3kt66lzpAMUC9oC7Q10vcmvY2VStM8OaDVngCXX
	Q=
X-Received: by 2002:a05:620a:17a4:b0:92e:bc28:5479 with SMTP id af79cd13be357-944214d169fmr270107585a.2.1793345627977;
        Fri, 30 Oct 2026 00:33:47 -0700 (PDT)
X-Received: by 2002:a05:620a:17a4:b0:92e:bc28:5479 with SMTP id af79cd13be357-944214d169fmr270104985a.2.1793345627393;
        Fri, 30 Oct 2026 00:33:47 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71baa1b3sm1652381f8f.56.2026.10.30.00.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 00:33:46 -0700 (PDT)
Message-ID: <89a22b1a-2c72-4415-b3b5-81acdd5dc171@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 08:33:45 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
To: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev, imx@lists.linux.dev
Cc: Frank.Li@kernel.org, lee@kernel.org
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
 <sashiko-outbox-190635@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-190635@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyOSBTYWx0ZWRfX5qm6GU3RhVQR
 5zELhDpHYs57K6InlIYcQ013ftczz36XqTlypOIWZhf0/nDfOWJC11u8vpAO/mvZI0iuRWFrosO
 ph5dDbut3vzUM8AswmCXIuixeGz6jT80J5EeK6lqCgNHb85+TzHjNvY7Z2xiKjtWbS7xeQA1Wro
 EY6dM+lTykXviUgqQey+ef408fN3s1D/Cqxh0jgsValnIyv444uJIxy9eZ3hLXjHIgPTLf1s/6d
 MCvHYARgMWTJaitRnENdEYi+ter6bzbavkZg4S00pDryR2mKTEmIN6YiLB5uLROw2pM9IneGs/j
 0OklVZcSRAQsazG+ukhFsX5xFgY2hTZHeCPO7MR4g3L0tmekJosivur2gjwWBuLUrEJPG14KEGo
 N+TZabgtCBVNUvpag7wNgzKJKDMIEB2GQBfCf2cS3YmotQFyVGEBLK7suJdHUEUkjPjqbAOoKxp
 5M3b8Lggc1yM1I6zZAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyOSBTYWx0ZWRfX37G4dWvxX6A4
 YwQVmeZ+b3F+jlun+j8IpZ+g+fZjbB+NkvrjJzslqL+c2oR1tRxRBvXoR+eaYc0S0sLsruW+IAk
 MuoxJnXwLUn4i8HIP50ioscdY5B3uwo=
X-Proofpoint-ORIG-GUID: Cex6hRJqg24ocOOCykJDy9OPv3L8X4P3
X-Proofpoint-GUID: Cex6hRJqg24ocOOCykJDy9OPv3L8X4P3
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae4485c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fELvzImDkAvHXwbp4t0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300029

On 30/10/2026 08:17, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] mfd: wm97xx-core: rodata write and const discard in wm97xx_ac97_probe()
> --
> 
> commit d1e87419971e113856988eb45a5e61c55d61ecd6
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> mfd: Constify mfd_cell arrays
> 
> This commit marks several struct mfd_cell arrays across drivers/mfd/ as
> const so they can reside in read-only memory when passed to
> mfd_add_devices().
> 
>> diff --git a/drivers/mfd/wm97xx-core.c b/drivers/mfd/wm97xx-core.c
>> index 1566a9b04b6a0..c0ddcd5219b57 100644
>> --- a/drivers/mfd/wm97xx-core.c
>> +++ b/drivers/mfd/wm97xx-core.c
>> @@ -104,7 +104,7 @@ static const struct regmap_config wm9705_regmap_config = {
>>  	.writeable_reg = wm97xx_writeable_reg,
>>  };
>>  
>> -static struct mfd_cell wm9705_cells[] = {
>> +static const struct mfd_cell wm9705_cells[] = {
>>  	{ .name = "wm9705-codec", },
>>  	{ .name = "wm97xx-ts", },

That was not supposed to be committed, stale worktree. I will send v2.

Best regards,
Krzysztof
