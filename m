Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1399133FE0A
	for <imx@lists.linux.dev>; Mon, 25 May 2026 05:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779687090; cv=none; b=tLiETeWH4marDCvBx0lWu6IdSDygs3D1m1/0lpxU9+Xo88M++Qp/h+qic88EixO/rQqzZdojBUrFzitmJSd6wC2a6KhN4dBT/BDnKEa4hjgHqPpwyaBQV2Df8+sXOwisJv9/u9nzU33a3yLYQmxy4YXRcyytTvZC/L4ARv/khHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779687090; c=relaxed/simple;
	bh=ng0GzwL+SXuNmFa5pHkWjm1uNpGAuR1QWsTTWpgOp4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OrrzyvVSpo6/kL1WRGgDvkIZsk41w6h7PsVReK8ErZag6IT3ehNNVjXnnNGYlSct7SiwGGYyumpv4fZgZ27IUpRFXNgLlIVXaxS5uKRXOes1sMRev+pQvu9BeV6kikHPltIYQVCOGFbHwrchmJ2V+gn9hJEIYBIopp1wNTARKrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mrnidYhy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QMBeMwqL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrnidYhy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QMBeMwqL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OJFqPV1193765
	for <imx@lists.linux.dev>; Mon, 25 May 2026 05:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nflQI87m0NpjbiVb4vx6MvwkK+5xuXrtzoNAWuqcxo4=; b=mrnidYhyVHk/r4CW
	uWJV4XEZohM6XYWyYSPlnNKiztNL3kEpw8M26kONxWLi6sqLTzOyhCgre35GYzI3
	bpDu0cx8o+X6AMzvnkHjcvFOgF60zzUBk2uIs/ox/IBZH4pAZ07+ntm/vOLhIC2A
	nZ2eUc++wk7BwUynwix/TfV4iEywx8tc4zTdAK6UlmromSUjKDDEGJZJIJb3w8cs
	LokZZhp94443QaZcSsBPmFhTOg9Sm7o7NL2IMLMfnO5T5L1JzDFVclIhs1g0ZaET
	WVB3jdCPhnJya6s4DIq8JHGjN70+aQ5zMRJfbOU1V9WIjx2bf3BkGC9jvFHJBtXE
	irIm1w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb1kmneb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 25 May 2026 05:31:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83f24cd00f8so4724229b3a.0
        for <imx@lists.linux.dev>; Sun, 24 May 2026 22:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779687087; x=1780291887; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nflQI87m0NpjbiVb4vx6MvwkK+5xuXrtzoNAWuqcxo4=;
        b=QMBeMwqLSnQm7a5wvPv+/ojz9quUH8MM1OzlabaCNwAbL3joDsE4FEq8t7C5w70+wA
         PGt1et3/IE9oxFx5tlDLXa9kFDGqld/9wsotzLZ2xGd9+gi0x+YGKvamPVK1+TUmefJb
         v6bJL5FQlHVBFEA9Y/Fck4rbZ8vr3YOc5JbIVdgu2aBy9E7fOpU2k3lKUKN93ftQQOHl
         7Av5JTzh7i+Win5O7OTGdS/pPdthELzpNVjxOFq2W2bhghuJOhBdaBqfwIFl/Lw7SIg6
         0mG1T8xMGO6vaqt7ArRdF+IsMSHkje63he4qZgegtJpzbJgogHU7ZzvzN6cCuw408R++
         KI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779687087; x=1780291887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nflQI87m0NpjbiVb4vx6MvwkK+5xuXrtzoNAWuqcxo4=;
        b=PNCjDEpFjqldo4MTHZHf6nD6GxaOER54BmagD2VfMfOKl+LzQMwilcRTOjzXlM4vg6
         kSVcagaEpZMX5NS5Zqrixr9RudAO2wSDjPGt9N7UDEFkA2uH5/9RZY0lWV/KBhVw/Hz4
         IIIliTYQxJIx1c7cWgBlyoFaijtlaladg842f3PMNO2sGNAvxsrYOj7iJ1E2lMXYwT6p
         RQ31KQI1zEQ1QN/hCmpm3QBKMDg2e2yDmT2tBOkTHdRl1uQTrkvvQ5Gy2WxA8Sd9xsK3
         3KDgkW1Cmoq/0wNo56GJGAzO76GgvgFC6tdeH6ZKAJmC0dtcCclij0UFAe2rjZ/foJ0f
         q/1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+kUFYDCiy2r5bP1uE1gtQteXDXJEAdVm8BgfecOMCAhMbAiPs+IT580A2YmigUctrwjio=@lists.linux.dev
X-Gm-Message-State: AOJu0YwG7Pf6mku+XtfA2vEjdZPnLWi0wZYSb7u5FmsQotgB4eazZHW1
	0nG8z1ipNnQXZutbzxDbeDhm75/HpsNDLomV9Vl8K54zHZJZqKluJmC9aqkiCgXNWP1Oa3/1QuO
	gqVKDNasWV5GtzAdW+fNASL2Pgfo0KDinVIq+uPPDurKwDEBuZLCl2P4=
X-Gm-Gg: Acq92OG+dsp6RvelSsxSMFjDDXnS9FjmAwXHSe3kyLUosxyTR7dwxa8Q71RHD5vCfNj
	moF0JwWufVhe+Qv2JTDRrnjLke2FoD3AjTxfh6Ni006cQ7Um1U2kcBYushWKzSfN1NzvXiXH+if
	t/mN5vDKH3a9sp1I+WsjeKv2Cc56poaJIURzhL3A5sw7d9/JUrGB+5huQGf4LxMJ0Xja7VgqbXi
	Id7kX1WelGmkez4elwFV999f9tv4YD8QD0AIHwiM/31mwN2qwB55EkbDRZhrIRkx8uNyDni9K+6
	caQMdb0VsEGtVg/TdV8ZOOdHeZrLpXTpmasoe+M2561VFuhSshUb4sEORWskaJUK4IsB3fEF4qp
	J87LMmdQSFSg22u91CJvKpZ2hzaYhhWgaq03jKlBnyhcURw4O25skPw==
X-Received: by 2002:a05:6a00:3a17:b0:838:127d:a168 with SMTP id d2e1a72fcca58-8415f17bdefmr12189663b3a.17.1779687087036;
        Sun, 24 May 2026 22:31:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a17:b0:838:127d:a168 with SMTP id d2e1a72fcca58-8415f17bdefmr12189626b3a.17.1779687086548;
        Sun, 24 May 2026 22:31:26 -0700 (PDT)
Received: from [10.92.183.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm8175618b3a.5.2026.05.24.22.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 22:31:26 -0700 (PDT)
Message-ID: <16ae5bf1-6124-4644-9e54-4fe45aa1041c@oss.qualcomm.com>
Date: Mon, 25 May 2026 11:01:20 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: imx-lpi2c: mark I2C adapter when hardware is
 powered down
To: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>, aisheng.dong@nxp.com,
        andi.shyti@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, carlos.song@nxp.com
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260525031450.3183421-1-carlos.song@oss.nxp.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260525031450.3183421-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA1MiBTYWx0ZWRfX7+9yDd1nhJH0
 fHY1tLpEEZsjHj/lMnF4DINhz+YdlpEHpz0clyg6j3bUERa7S3ewRxpR1knc8jOKK09Mg2r+kWn
 tKpwHbxabFmty243+5Tcs9SnrR1islmUZHF/5SOUt3uq43dZtAGri+PCGKbLnYPGR+StZqGI7F+
 B4dFK3FK6dtm6aAvbnS9RtiT1bHn2BcNOMkp0IIjnphkdr7r/Vs5sWJCh5DHtXVhKkNyFgqW09Y
 mSFTkzn9rbv9CNbPaamb4fk+p7MCINbYNyZzIZt1MrZO43no3taqA0MkcS8KKOJlYpA/agkxslt
 rjm6En4B5sZ/kdb7b8tF/owG/tPmdHR2Tpwuc4j8/YTjBfLvwcq2f/1qEngdl0GgWinhoBrX4pX
 3pGusGlsRWEM9T+o4glOKNMPI3KwYjYskPauF7MNGPmsAVioIZD+xPFM322J7O5myA8HDy0q+KE
 MTmyg45Nbm6Pf4ygotA==
X-Proofpoint-ORIG-GUID: G1P19yrUoAWj4DXHS0SzZc_9pCZcBXda
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a13deb0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=elOLNqXY3ezWbv45m3UA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: G1P19yrUoAWj4DXHS0SzZc_9pCZcBXda
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250052



On 5/25/2026 8:44 AM, Carlos Song (OSS) wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> On some i.MX platforms, certain I2C client drivers keep a periodic
> workqueue which continues to trigger I2C transfers.
> 
> During system suspend/resume, there exists a time window between:
>    - suspend_noirq and the system entering suspend
>    - the system starting to resume and resume_noirq
> 
> In this window, the I2C controller resources such as clock and pinctrl
> may already be disabled or not yet restored.
> 
> If a workqueue triggers an I2C transfer in this period, the driver
> attempts to access I2C registers while the hardware resources are
> unavailable, which may lead to system hang.
> 
> Mark the I2C adapter as suspended during noirq suspend and block new
> transfers until resume, ensuring that I2C transfers are only issued
> when hardware resources are available.
> 
> Fixes: 1ee867e465c1 ("i2c: imx-lpi2c: add target mode support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
