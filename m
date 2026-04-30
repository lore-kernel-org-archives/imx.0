Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B31E402436
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557476; cv=none; b=OuCRmaSRH9zEF8w0hfMP65jx6Tb+xXEmyfD/tLjTwC9q8qG/S75xHCCDp+VMnOoCzM9sSvsG4ffTbnJ+BS1my40eLTQd4L5JWA3x4CHyYwH7Zxd6pPHTLxn06AgN+yrvKbYgRyNJheSMmTggThDGXn47mEKwL+0CreqxXN2BxMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557476; c=relaxed/simple;
	bh=fTxKIYzBNQgc7bk15MwsEQOCtxVJZwEdP/bFVuwu9pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iaVydSEur+LAvf5/v8NDfo1XMZsFbsjAkOQnum6cp6pNDmAz4ozNDJT+MdeCIIXrdTn33YQyZuGoNB3SeDUZyv6QDKgw2Cs4FSi+xsKJHrobsXM4XmI6PO8XWnQ8Dfe2ap0gqyAs9/ZLlkFTfALY4zS2Dhu9KM8gkZOU+YzXiV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dw5EZk+1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ABLF1Y39; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dw5EZk+1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ABLF1Y39"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UDNeIn2480915
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 13:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbjBLGgOuvb2T4iZgs9YUKYK8plm4UtJT8eN4GeuaGU=; b=dw5EZk+1sIDgkvL5
	d6+34W+ajkbgrOIGcUOR2hFBaNE5BRoflHK/PZRwv54wkB/KovgGNd/8Qw16LyQM
	KsSQG7DYgF2mSm21lArz4LSzAQIjuzc9Cfk6gva1/U+ncn5hdY80RQNflqkM0V/x
	oPaX3AMDpEAexC2BTxwlEfnMfzTN893M+FCf6HLw1haxU92VplnXQBABiUwKYmDH
	0zY+apOrc0DAh1BwJTWYSSaRYHpIzYpmH9UEu2De2ahnRaTNmunByvkCaMNwNvRK
	BLmX2A2UP6Tju8Cqyry37nMVpTq48Nms38ApD7bUj7c1/25PdEOwqBuGv1HJWji6
	rGY6SA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv7x6g5r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 13:57:53 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95a76c24859so53874241.0
        for <imx@lists.linux.dev>; Thu, 30 Apr 2026 06:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777557473; x=1778162273; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IbjBLGgOuvb2T4iZgs9YUKYK8plm4UtJT8eN4GeuaGU=;
        b=ABLF1Y397XXcu7k/aVAHv/QnbOxgkVDjDe/jbYq8AZqO7q3G/KdlEpxCfMXmFpoE8u
         v1SQbqOzgR4B9rR7Vlfk3XCqO25inP8NLrN97PJRCT9iXD0wm/n1V9tkZYJ22gyOisRL
         ZNOM0LyIA8+hZUOLBEw0iEZ+M0MC9idh9n/XC91Li9nJnWHIkyA9u0JKoOFrPTTqDTQc
         /qXXGj1rYJhRITwBHGrHI4uCDtdv3yVykwWG9jt5fPYFzxMG0tvZSEyAhv936mMRup7b
         f4AC53ljifCgsTGhZSMzlTThECsewTxO9uRxxZxo/PtG4DkeHWmeoBj1azGus1WRTAcT
         PE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777557473; x=1778162273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbjBLGgOuvb2T4iZgs9YUKYK8plm4UtJT8eN4GeuaGU=;
        b=gMi0/tGw0EjQQs7qsAxOiIO2S/VVayQdNsAjOrVT8yHkVPVTJqDr14zwH9LjgudXck
         XBlY9RdMbt4o4ygb4v5Zrt+R3+JKQbVGbdGOb8MfZhdNvdfVkHqN3xmOhiRqp8N0n1JW
         N1LuKaQuKlsownv2IU3Ec1iekLYFK0pf/69q1KpiLCxVA2RgllYYwRINk/4nn0nlt/JM
         HaEPeDjv4fteExP01otahhrS7B1q/EJNhHHZXvywP6qqvo24cjqF+XoU4J0XYaE9xw1P
         iv6Fb5VW8qSYEd8n+ibBILKSPL5G2UDpwm2lwbpSgxKa3ZjGPqCVKs8F5DDj69AQ+Rum
         eWpQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZJWSF2RBU7M+3u1zFdeZT7563njTKhxBLqHhWHKw6nAY6lBIYebu3PwCbcd3scND9cvM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0eCf6d+nC1BOqNGXgCxXlEElW5K4IBpsMQ8aFQEL6L2BeeKAy
	dy/hbTPLBaHH1V8oaIizgIchcwDtCBy6tVOoInXgC5giE+05OapTxnr8WIF85m7DS7wjY9K67V8
	QA5UdAQilu8tzCUroWjdaw4I4eBol/EpJNjx6JKhEYR05oIJDlCb+Osc=
X-Gm-Gg: AeBDietmhWJV6KOT9aPbvwDTM3KHMjPS1BdAr2i3XIVfLH09T0vx+dgL29CZkvfSExs
	WvEoJm8SGGF+hIWXYXnyCYDTLkxyLtwJw7UJfL7iXZTSKG1tqj4scPoUQ60WNuWUkXF7V5npjI7
	u3RMs9zmSauNaqI2qOJ90NRx3sNO5L6MRa66xU4zFQNLjP3u8mU5xVorzlmE8oYWQYZfoa0W9Z/
	7D6P9VuLKByTxdWEJMQzfPPGi73Rf7vcClojU/MApAFCHTWvHDhh/znGHe2JrZgHMFE5BqKqGFq
	Jt+0QMlo+YRavGLrI0Ieads0yrMYVEiPTHoDY0hj7W34bRDWXg4uBLG+mu6jvdy7ka76+6uy5zz
	ZYkBkWWxhF51RgR1wWjjMCniPkW6l2Gm4jcSEKUHAg8R6emE91xhWQj1BTE7yFR3i41j3OotGpY
	fzZTHbrrazwPvCOQ==
X-Received: by 2002:a05:6102:214b:b0:610:31dc:2302 with SMTP id ada2fe7eead31-62ad2e4040fmr440917137.1.1777557472802;
        Thu, 30 Apr 2026 06:57:52 -0700 (PDT)
X-Received: by 2002:a05:6102:214b:b0:610:31dc:2302 with SMTP id ada2fe7eead31-62ad2e4040fmr440894137.1.1777557472265;
        Thu, 30 Apr 2026 06:57:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb98543bf48sm240296666b.41.2026.04.30.06.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 06:57:51 -0700 (PDT)
Message-ID: <05b25bc1-7590-49ab-abd7-7cf587845bbf@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 15:57:48 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: qcom: agatti: Add dai@3
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, broonie@kernel.org
Cc: linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
        m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com,
        loic.poulain@oss.qualcomm.com, Riccardo Mereu <r.mereu@arduino.cc>
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-2-r.mereu.kernel@arduino.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430132140.30369-2-r.mereu.kernel@arduino.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 08w32-Jc8OpqwmGJuUyLNkKqCD9PlkLB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE0MyBTYWx0ZWRfX5Lto8sZSGDAL
 1r9unqtrePzkuvUVULqPH5Vy6dOUh84NeJjZfqRgr4C3agI39wGhWHMzuMTwU7Iyodv9mhn0cew
 85VIKaBMU0YBVo4MNmC0vfd52fBB+6S+zJq8VQFjQADxEupO1QqYHJtE3G/sEIGyudDbKWHhEnd
 7W05jqN05pzJQOZ9OdtaFMFjc7FCJlrhJvfMQGkla6VLn9I35e62Jq1X798kfYirg9NIz0W1e/f
 SUY0OBSV7n1eGtFbEHNai2gtp3Yk5Meo/jeSvEbmHd4MJh6ICeqgadfSjm2bI5c+/g6LSn0cuEZ
 womS20nedyE8HMPeyMFvZhwb2Fb91UkolfSV0fodcLL9JXyn6urjTvvbn5h2Loew+/r6j21FX3c
 EIeGWF6hdvbmFhGR73gevIIQBKUsjBXERDJw/ZydiVWjcMXrmRfE5bXs4pfjI49/tLk02F80npB
 2mPmFtdQZO0jw02eXfw==
X-Authority-Analysis: v=2.4 cv=XoTK/1F9 c=1 sm=1 tr=0 ts=69f35fe1 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Fu72_7R4e9LhwPiyXh8A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: 08w32-Jc8OpqwmGJuUyLNkKqCD9PlkLB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300143

On 4/30/26 3:21 PM, Riccardo Mereu wrote:
> From: Riccardo Mereu <r.mereu@arduino.cc>
> 
> This will be used for audio over USB-C in Arduino UNO Q board.
> 
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
