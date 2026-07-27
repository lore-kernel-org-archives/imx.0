Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64866408022
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163168; cv=none; b=toqHkKS+MxFmu4wsn4aBg56w4IlkXrdkDOd8s2EIAmBHmUsPxeOcNAL0W/d/O1S2XtU6HfWiPEKKdnTatSCdk7t5upSJOEibKFNv2yqA4V6gWtLkReaYlayuLzsFeL5pNKTVXQmmE/3/Q5QTTGkdNepiymc4CtkYmjtTcNMNLSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163168; c=relaxed/simple;
	bh=Zxy16+x799ihBBr6MJe6NLfjS8UfI3VxhcWSkMvxeyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zu6qB9BNCizEJxDZDDRSogZyEbD38Fi5N4bsK6RLNSLyr/lOXM2jrlcLkVk50Q6ql/KZ3tlsgo0vlR7c/ugqR4JG5taDxGAbkv7w92iBUkhYY3DXfFP8WyTok3cy/QSV3H49tBwk9TmnMzLDJxI2E/quCV94zIIbkpsNtE3NZTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cnxgraeP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5tzWpG3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cnxgraeP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5tzWpG3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlaZM3414011
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 14:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aNiNwU2QrjjQdW9slXjUnT/0JOvoYgEc5+oULzxO43Q=; b=cnxgraePk3sg5GSX
	Fy/C6BKFOQKwhwxJC4foprG58vTDKyc9wfn2Y9MCjt27ia7i6Ks1UCMmb9xdZAfS
	TUFMilyElQQ4nI7UygXGsk8EMO/0nQSiooHhKMJww1JnmQC8QIvVr7F8v2YtCFnC
	V3SaMlMnE4FC0VlsPbKsz92eEHnJX9Gv9Vgx8z+AYAL9FZUExb4vOGhQplJMTNKp
	Mdno9Tu63Vd9XvffFKdtqGCW1p3hZWBexODpxKYIY3/rxmekEyfVMh3bxmXGG25Y
	KZCOfEetABf2Wk5aNHCzoFRvtx+kC9Tvup0A1d5yWA8jgFDCOhche4OJuj+YSZoY
	436Omw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v694ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 14:39:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so29482481cf.1
        for <imx@lists.linux.dev>; Mon, 27 Jul 2026 07:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163165; x=1785767965; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNiNwU2QrjjQdW9slXjUnT/0JOvoYgEc5+oULzxO43Q=;
        b=X5tzWpG321K96/LZjGxSULSwG9M2kzpgf+q32QdqUc758w5Gfp6vJDS7IajakhQw7+
         G/AIp5+tYhgPsvNJofGYkNHdxIUlrEmGUOHUOUcAEc6R9Sh36fuuFAerF7RQ+0yGrFgs
         YFLr+7J8duSHqbWHZUFn3NlEsGI3rVWiuAF0kWtlyxfvxFkcli2jLKgT6fqm97H665Hd
         PGvayVQl2hessfC2sx0YPPi0hjxM69So9a8qr+s/WkP8LLSEsvscySBl8gn5tRfhkqJn
         8U9sQY2L5FC6MA37wpgp93/3QVlJAIsiZzF17grVwEjG+jUZr6IaN8LcUCa7ffw0IVap
         IzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163165; x=1785767965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNiNwU2QrjjQdW9slXjUnT/0JOvoYgEc5+oULzxO43Q=;
        b=LuikVgnsemRe9gNs10pK037xtcnUAEXMR7vSdy9dG1zqRM7hCZWDSt6xKvqOvjCdrK
         Tp1M2DQp3i5Di8fTYwgwcom9tJlFMRx/2gQ1PNpFy95wUKP4dNWqZ/7ovYIC0Fl3e8NK
         syz+pW8MjAVt53Zm7NK1hQOIV56kT45mwjXSas1TBloF5v3jQKiYRJHeF58S/z4bQ7an
         LsoTzmLTBGUFFTWVjzPNjtjr9VOjcz4WNqt3266d5l5LnuUtLHGmIGLmW0w703fu0ver
         S1Q8E+dH51JKiLdSP24zF50kglr0q55Lfh7Vt5XtIlGTreIveycYJsjeK1OqQFMHvKfE
         2Q+g==
X-Forwarded-Encrypted: i=1; AHgh+RrS4ZnOnxn+bUd5RZ75YNCZp995bdmud22aGcJPV96x6+o1Rq+qWkmYUo4PFn5Z/tgZFE4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3gtt2TapRFCE+2/To9U3XBZpYG4dw8en0Y0YV/abm3YswVPho
	Jkhq4WBEHpUAVsF6Cv13yE8Y3diONhRVDiP8FsZpCdqmI7O7/jmJ9vQRL8LdGWBXp6vKA/v0io2
	mir21qNOSz8Qpzn65uJQgi4+mQhSLMpSkLqvY++JJql7SNS1mcjmCv/k=
X-Gm-Gg: AR+sD11aXTOI4dEBG0LmJgARg8OTlo8C4AiVtMGP+6eYZtjk+QusWqW5Tj9QH6HymNT
	LdgAJPAmCblA+FXhLRxfuJa57IX7Xk6wUfxffFClBN+7mDLJPUKLz7nRgmnxkeXITi+X7ONIr/i
	zuwN2j0aIWnVjQoVN0xj88iQbY/FSSwXeAMcft9hxI3dDVOikfa7brjivKiW4U+TWVW96ewmXbT
	391/FbmJI1ddYED+8m6Kn6suWGXTp+y3AQPrue7MhM2BGAcg6b5TBX4YZkH7bVPkUJxAURZNPvw
	dKd5sZqCqVNOter/lXaYW/qXB6kiZw6sKmqsIibjpEqhPEmKn86nlrwYJWUeX8Aw8jZLBC03Jme
	avSrSyzxxr8l56SY3nFdW7sB/MVE9hIHHfPUya3WmBQ7rrg==
X-Received: by 2002:ac8:7d86:0:b0:51c:1811:6eaf with SMTP id d75a77b69052e-529a8732f6fmr90542421cf.65.1785163165513;
        Mon, 27 Jul 2026 07:39:25 -0700 (PDT)
X-Received: by 2002:ac8:7d86:0:b0:51c:1811:6eaf with SMTP id d75a77b69052e-529a8732f6fmr90541801cf.65.1785163164950;
        Mon, 27 Jul 2026 07:39:24 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6e9a2sm51480708f8f.35.2026.07.27.07.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:39:24 -0700 (PDT)
Message-ID: <3ce0266a-64b2-404c-a904-25b6991f380f@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:39:16 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/imx: Disable clock on runtime resume
 failure
To: Can Peng <pengcan@kylinos.cn>, rafael@kernel.org,
        daniel.lezcano@kernel.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260722084909.463437-1-pengcan@kylinos.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260722084909.463437-1-pengcan@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfX52ltpPGPi1fA
 Q44/A9uLnK/jsyejXPuFsdFz/XPjzP/2Qq2VXrg6kZRlk0nGnVqvCIXcA4mIgYF1U8bklaQ1VSw
 v3wdwHUJRqi57RYdg+jpukA52HAwRbM=
X-Proofpoint-GUID: PdoG-xTBOaAcLdkgIpxutCKLyaJL3FxJ
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a676d9e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=mjVe68GCGcCyfEWORksA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: PdoG-xTBOaAcLdkgIpxutCKLyaJL3FxJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfXzLWUJzsXW9v1
 lvNICluUp8NTo9VXLkJLkvgvcOcpd991d3/Rz7JZOn8HC7ltSzVv5TyvSRV1kG7qHMKjFnVCpfT
 c0yv5HhLkwcHykQ8C5yBvlmLz6luALOZ+C30su9/DVNihSbcp3XrTQzJPiny0VjDrnt5nByNq9g
 dDX6pvyzKRFIClV4o51pA1KW4dKw12SuYmKAA9C9KYOzMYHHc4aaz7dsN9dJ4DDqozhuOTW/bpX
 iO28yF319OOqhArUcemsV9fAvofmZBRs61tA2Nsebv+o9eoUxVLYmT3n/6p/w+xamHciysj++1W
 5Y9QZ0PdauJbN67gaCei/sXQ0gQgRei+YW24P/aKiDYB8TpNhAkM7JOcZBG9PvyJ179ki3BBItY
 SYeBQ0IoXpJiDd/8TPlqoYLfYBfeXb7NLKJEKrtpKQiWdNUDSK+Rc9ORs6btdxKerDuJI7SFw/V
 AWtyda/oVFP/Uc/cKzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270138

On 7/22/26 10:49, Can Peng wrote:
> imx_thermal_runtime_resume() enables the thermal clock before
> powering up the sensor and enabling measurements.
> 
> If either regmap_write() fails, the function returns with the clock
> still enabled. This leaves the clock enable count unbalanced after a
> failed runtime resume.
> 
> Disable the clock on those failure paths before returning the error.
> 
> Fixes: 4cf2ddf16e17 ("thermal/drivers/imx: Implement runtime PM support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Can Peng <pengcan@kylinos.cn>
> ---

Applied, thanks
