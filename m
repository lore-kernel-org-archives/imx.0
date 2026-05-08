Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F31136167F
	for <imx@lists.linux.dev>; Fri,  8 May 2026 11:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239176; cv=none; b=EQ8wImU1+Zn+lZOohAJkoDStiokr9rriOZylj/UOii00c9zBw7YudCtq1BfHYr15mh4kKWJMnel03e+jLrqCk4kRinDXZNbGcEIV0w6HshnlWnCLIXcO3Q7236VEvt5cKaI2wZNDMb1mELLK+0gZoqkEXN4eCVoWVlOZzoXJ4eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239176; c=relaxed/simple;
	bh=XIXa8EjOgez3qsla3pU5FqSnug5qtehX8v23sK1H1LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NYhW3vOKyHenA/9uAm7iPDHC16xyzrHJeRZ4ipN5iPu06Iqm345rXU2ZcuycZRz3tyKD6gYUlnAjIuRllVpM4QRd10Yrw/GiUYcO4lLyXODEzuhWY30cXstrS3SEeLHbZjuynMzruQfnlNQVcvpMn9I4lv1xt7Tma9pqRBI7fSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LH9PwYO9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bn2GZzoo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LH9PwYO9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bn2GZzoo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6489Vx3u2771502
	for <imx@lists.linux.dev>; Fri, 8 May 2026 11:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xe4gq/TPDXHM1b12bLr1gd6wDh+pc+1Zrgp9yNQWEIQ=; b=LH9PwYO9vUoLEIWx
	r1y3sQG7C8wXlQW/DAN9DYySbt2kNsRK3Cwh3D0ioknOOpo8aH+JZZE9erreLTot
	0WbrqaWh0FLZtBxMMeIecKZNpZE9hcgSx2s7f0jqVHgASs9T6MsTOsyskXTkAZ05
	QtEJ0Eki2Bw2OHA/qg/8xtxNExYu4V1vAxXhdJeQ8rrvHC46vxmt8t3URw1VOW7W
	dIwtEJPgir69s65jLcryrtFjkyPJbRfJlP4mAcQMCoLlj+Aeb/O4gcJrarYeGd4y
	iw//+uh4lxoJbJqMKqiIDI2+UcNVKjoCmKODxSEZy3uLYRjIyu27b0DyNQ5ypPeI
	fdch4g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5kedm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 08 May 2026 11:19:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f71af9dddso221711e0c.1
        for <imx@lists.linux.dev>; Fri, 08 May 2026 04:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778239173; x=1778843973; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xe4gq/TPDXHM1b12bLr1gd6wDh+pc+1Zrgp9yNQWEIQ=;
        b=bn2GZzooA2ow5JPgxT0FTci5SGdB8MYsHkaxuG708wQOhTsBcJq1pc4KLoDvlJQTj2
         g3LUYc4pMVs6O9NvgPI7LBjgHfzBN32C1QcuWvqxTMbRuVKO6TGAMSEN2seTUq0piXqT
         JWKafeSTLyIFqKmH92nm4q1i5uM+6EBcU/Fe69+hfZ1zNVoRzwRgos/JX/3scmM3uY8U
         II3O4Zs/TaO6xxPhO6efNqbSe37cXt9w5nVxkpELHu+89mF1DC8OUJKaJbtvp1aQWHAR
         7tCIGvJ3excMtOhJX8m8ugfsau3c7zrAloL5g0UhZ0zAikSjuE5NF3j5Cz1ClqetcOqm
         NZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778239173; x=1778843973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xe4gq/TPDXHM1b12bLr1gd6wDh+pc+1Zrgp9yNQWEIQ=;
        b=lrMe3npzrARagIYBV6jHHI4JgsD645XzpUkNyW2AbgUaeKAlDc6aJ6t+0Vmv8Kxonr
         yBN38w3zitmICiJvKr+J0vTq2vPyGfDiLvZOK9hKsUVAp7bBL0iv0XOioqUDlJnhOvAr
         E5IbhKqBGnPSNXGR/DteRN9LCfc6DjY5bx+uAL0fu3qaXzVW5WvkRoSWar0DFdC66Za2
         RNJ3WOkeuZUQuXR7SBj1Z1lyBfGIyvMTfy1b9YYPlp4vWKRQui11+AVyqmJSYbFX76Ab
         7SLsSnvbpjuK6jLEAv23OCaiIk/rHUzDyAP7t/QjCJhcp/dMYmp3bnszt66MDSKSkomr
         RQbA==
X-Forwarded-Encrypted: i=1; AFNElJ+BjByCDATlSMT1/ZhyEg+UZzOAO4aGXRmNtNr9yfhYX7/rxyqs2NluT/aga4SiyrpW4+o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9RHkpjYrgqr4DFQcaiQqmZFuM6Cp3Jm/XUAK8iLSGvy8AmeE5
	X+rTqyHqb7aXj/8MYu+aDZN/9ZS6ba/ITC5mBLbzF51DZiYH4lBx9z1FQnA6eSO0lrpTdK+MdN6
	YG1yZWi/0RR46ClCmv97YUGcDJ53WmGbl+cR32KHMaQb5ub6QbhDH1fg=
X-Gm-Gg: Acq92OFmhDF7/cZDJp8yt/GLFuJH/vT1WTxWDm5QmBOsoR4jKSBOzycO5KxTh8FK9KN
	GpsHK281+wxg1ZwXNCJUh+N+t/fHjeDRTOB8gdZ+Cfe3flQUrFl+cIzptM3tkcuMqF1BHOrIiA4
	jW/oKHUz+8PkHQrZoiFtMxjjd5h8Nyev60yuoDLBs0kLNGNtezRjKIzkZRUW/CKPhHCPhrq2kQY
	eQ4qH0oiS5Qyzd3SnEPrM1vZdvzO/HwZzz1RcB3iaFegq3C28LsSPiGn4g1mo6XAU9oGHXiyya/
	Xoct/mMJBK5udHe6SRBnVBa8QvZsAM25clc876EyrUIauI8QCYMIlLh7Dl0dAOXc/UZ+oluW7XF
	A/vzGuwORt0hASd80G/M3e4OlMmipPC1fDgahgpaOCPcpY63Hxm5+rAozV2EfDQtsvgFQ2CjwD0
	lDFr3Ov11zuIGEdA==
X-Received: by 2002:a05:6102:2ad0:b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-630f8e77f88mr2676922137.1.1778239173573;
        Fri, 08 May 2026 04:19:33 -0700 (PDT)
X-Received: by 2002:a05:6102:2ad0:b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-630f8e77f88mr2676908137.1.1778239173166;
        Fri, 08 May 2026 04:19:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac398b017sm65898666b.38.2026.05.08.04.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 04:19:32 -0700 (PDT)
Message-ID: <a6d6e638-6e61-4e39-9e06-bbac7703c6ac@oss.qualcomm.com>
Date: Fri, 8 May 2026 13:19:28 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: qcom: imola: Move analogix video/audio output
 to dtso
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Riccardo Mereu <r.mereu.kernel@arduino.cc>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
        linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
        m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com,
        Riccardo Mereu <r.mereu@arduino.cc>
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-3-r.mereu.kernel@arduino.cc>
 <CAFEp6-31LQX+uHJ2PFES76RGqmZKS43dO3UoziVZ-KWQGCy6aQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-31LQX+uHJ2PFES76RGqmZKS43dO3UoziVZ-KWQGCy6aQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdc6c6 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=T26Fge9w-xJM3eegr2EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: Ae1tV92Ff3ZjBMfm-HCdrm-nx0nFnonp
X-Proofpoint-ORIG-GUID: Ae1tV92Ff3ZjBMfm-HCdrm-nx0nFnonp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExNyBTYWx0ZWRfX4ct9NOwfX+OE
 3MWal25kUkhsg5DahuCS/H50vVSLG3r8ycjVoMuuX8AuXN7OSt3yfdu6V8KUhAEeSVWRxCY8tzl
 ItFZcfOnIqerLt2EDSJZ6G7aOtCFGftOFkpk1Z1rMTUDIr+1FggkgTfXTL9FWGZRH95w1679OD3
 XazVrv+YANbwT0hBR82CmxR8mtzN2iUJO5DKZlwvuHWMSnz5B2Ejgku2+N70QeO5HwGGTcCLYK6
 DQHcabRpfIPt9xDs6MYw8Y+i4obTM8YYh2LcBnToPnDhqaw+ucmIki4ECfClOEc2SN/P0Uy7igA
 J6DS/RcI8F7H0BEdeo9mdpFGeZeVSTupmUzKPkFM3/8T4tfvj/mUq9X1fTPlRdkBWfDauLdTIWk
 W2Yuab8WVcerdGOzjieeoWF0y9Wjtp2PHwAWzOvqaNh3VFYFBppkqjFUUQcJD4JRp+Ms3/3NTiz
 SDeJBnhZkb9IlAzAAMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080117

On 5/5/26 5:44 PM, Loic Poulain wrote:
> On Thu, Apr 30, 2026 at 3:21 PM Riccardo Mereu
> <r.mereu.kernel@arduino.cc> wrote:
>>
>> From: Riccardo Mereu <r.mereu@arduino.cc>
>>
>> This is done in order to support different video output over DSI.
>> Since audio part is linked to Analogix USB-C controller it is moved to
>> the same DTSO.
> 
> I'm a bit skeptical about having a separate DT overlay for this. Is
> that really the right approach? The Analogix block is part of the main
> board,

Oh I skipped over this!

So, does the media board require that a switch is flipped or something
like that, to route the lanes away from the analogix chip?

Konrad
