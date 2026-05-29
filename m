Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8010388E5B
	for <imx@lists.linux.dev>; Fri, 29 May 2026 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780075869; cv=none; b=XScg4zahKgEvx7yWIzOEedXNN1+hO+H+92DVdZ88LRBIRUeYpIbOjySrVtnql72GKXL5lQg7yYE44QNe9CyZeOGnIJGcpxCZeG/JCLbIcIqHFr9JBk1KYpiX9jGuoLm6s+asrWTAKbMQOTUi5vay1Ev2+FOkjIEV9+BpEYto1ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780075869; c=relaxed/simple;
	bh=6XtuzAYEfFRw+HYYz42AkI11W9apPm76m7J6y3guol0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgbc8ebw6gBoOZkHadwAsPN12WZNpjH88yFeEWioUeqtGzkw76wo7Anu0JF8s6iEAbtTfcPuZAnKRNhmev8DT2njzGyD0+J2dRNddfR/7gTL1HwazNIkWBctqR5nYNItKC6KhHn6nGN3IwHgnZiHKzR2qwpV9ASde30KRvRMVrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4esPTDH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jmpItXlM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4esPTDH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jmpItXlM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TH8cG7173629
	for <imx@lists.linux.dev>; Fri, 29 May 2026 17:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fJDR0H8V82XJxR0Z1RuppBFcrPl2HmqD7fethUF331U=; b=X4esPTDHlq+Rsv8C
	XbAcFT9hcaGFg+2OcBQjIPdDp0LQGn9CtGtOcrfjUnQuB0OsJ4FLm5a7uqYd2R/A
	vviQZtUGLD1Zww5tRizwiuO+5O9eny4ME6bhlPQoEsnHbs2mGGhv9yOd3K/MkUyt
	no1dFEHBlc21336KaM8+mWwh3RoF7mhff+nlFlO18jFuFoHAmAMvogt9wso9ZZ7V
	J3rdS3i2lzRxvNslmAh26ZCFT+Pa150ebYXyp79xHtxLIgzZzKz01woDGCwutUIu
	DJTF0TgnuC5gcTBNHbSy0NE+L4zZAlMM2vOAcW6aXypzOx+S9KnYiKqunG1anTNy
	5J33Vg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m4rhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 29 May 2026 17:31:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc7f9b2213so105589845ad.0
        for <imx@lists.linux.dev>; Fri, 29 May 2026 10:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780075866; x=1780680666; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fJDR0H8V82XJxR0Z1RuppBFcrPl2HmqD7fethUF331U=;
        b=jmpItXlMfMZvIBTciUfUyVqNi6D1MURoPDLmxIrnHo98rQ9Vty7Hg0j3qcfd/kTFeh
         1GSF+5UjdxF9QGGIEkG4mKKq0f2f8c+l7ssKruGUQkOA4PFNpnAbKjPk3vzFRg3eSNCO
         sZ6PvTsfSeOGV0+suyZPFUzVqvflLulvEH4gx27MEhMGdn8Vh9jso4R1uJENIzIlLzMl
         vVKyVp5/TErTEABmYUKeb35ZhhfQNBOGXJSUsbsm5rAQEyolqyaoeRDusH9OmvjKAsnt
         b2AzUESRYbjnE0LqLkNKPLpfhzGWCKGN5ySuGqOmks62Vrjn19lw7HQhTWS97uCJWLAU
         qOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780075866; x=1780680666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJDR0H8V82XJxR0Z1RuppBFcrPl2HmqD7fethUF331U=;
        b=UZWB8nBAv96d9Oa2geBBC/7BHgEtZ6jezpJSlrCXupjr9HXjwyt5KCQHT3iNLWt3Kb
         p2eorl9b9sTBkhEpTrqBde3X3Y3573lNtEtDdJQVqtdH6yyh7tBBNsiApuQi50s5ESko
         7EAbj6tnakpQAfiHe8K5enQFdf7rLXGPCijp/FMgN920EYnk+82guISe5GVkjUk1oE0i
         ef/VSEufTaPX2LfTkTsSTdZklH9lGdxnxAGM4vhnlmsEeCEcc3K35wjBtZrmaF8AbOAW
         mt08JMrrBF9auU7wE6QV01VeMZiKVf32jYqIKu9Hs3PA5e3y4ndBCMYgUmy6UkJ0b1Db
         xIXg==
X-Forwarded-Encrypted: i=1; AFNElJ/MCqplF8I6ufdAhluBGkSa+0qLJRht0pVOaRFQKPjUJTOKbeDupdwX0F7C6Jy0w8vOILw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNvcX22IJN+2Xg6kIulNFHo+6qG1WWYPvLGpnTUDq/uJ46mfoG
	C88QSxCV0SUsivF1JGe1rGqXJa7w4yC/NbFRAJmewRotOlWb8GjOzIrTZ2qGQ6wAf6o891HmWwx
	YtdCmzVWh45FEuerUvPFju/yW/8AeVpnAHSd8pOEVQFDgWmyw4GBPYO0=
X-Gm-Gg: Acq92OHMv9zJxWhsddkbORElPrMfXlFa29n0DSkL9mKfGbMSC1d/qxWCAclQp34y/OZ
	p2ckwKEmHhxlW9otEeZV1wSViVsfT5k0ujrNd5vU3O6PzHsNPMfSeTW4JJEDu3sruKSgzGql+O1
	tIWFul3zPYLi6hLbHQ6okRxaEbcz4XdjZkSw3jLbwmjSOjh4Rk5t5PCXixfT5rYwVmaHT///RK8
	cgfHS0MS3kNAC3BE/kBbld0YbRf8kf6JdG9jMLJa2N7j0l1d8cIYb8F09tv3V0vCKrD7QBAjHyt
	F37w7I4EbsfwDh4jZ7XZHxLVmMH2/X+2mpJDNUavcae2JJXq0MoRWKoKbO8jphDJXc4hq4euU1q
	aNWsl3LT45BQGeONSKzC7FFLVSfqLJre/nJRt89lFbB3kBxL+B72b5B8RfE5MmxI=
X-Received: by 2002:a17:902:d50f:b0:2bf:2015:5ba4 with SMTP id d9443c01a7336-2bf3682a24bmr9445275ad.24.1780075865565;
        Fri, 29 May 2026 10:31:05 -0700 (PDT)
X-Received: by 2002:a17:902:d50f:b0:2bf:2015:5ba4 with SMTP id d9443c01a7336-2bf3682a24bmr9444745ad.24.1780075865095;
        Fri, 29 May 2026 10:31:05 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.224.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e71cbsm25476575ad.15.2026.05.29.10.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 10:31:04 -0700 (PDT)
Message-ID: <bc2aecf3-fedd-4b15-8e69-33ca928831d6@oss.qualcomm.com>
Date: Fri, 29 May 2026 23:00:53 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: shikra-cqm-evk-imx577-camera: Add
 DT overlay
To: bod@kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-7-645d2c8c75a7@qti.qualcomm.com>
 <178000731452.4557.8537369407478321842.b4-reply@b4>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <178000731452.4557.8537369407478321842.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE3NSBTYWx0ZWRfXzv9T0Vs9G/NP
 1ISiycM/j0c5UR1jr2dVLuJE6GFLAXE44yZOJfBBTTlb1P8W+rNo3KaDwirQ6sn9ncgnqK6l/Sa
 2JFFZCe55KMxA/nXWv7/f024w2rQgGar7S0izVQRQamcQPKxvetxj+kPn5NhPQ0KsTpKkKR2ns8
 wbb8ITUXVEieeMGooLifv4iYI0l0b0Uo0m+0wkJLlkyl1RCpW1KoLfx8QOKEZ9O9j8CUfk3vfGr
 QUO3VDEfjuf2W8OOMsmupKzYdBK8qXn9zybLfpW8aWclMEkXEXKokEjGcxX5otDuI4b3n73pkms
 KhnurUegkw7Qt+sOQw8VGjY3s+Zqhe7aBhJ26/RuFUflTL0JtKtKEARFpuQbw+7XpwANis9AChf
 4KllPJnjMEbOQh4udaDglM5gHPUZa3CkcrkrkmhaYI+v/4RuNIlcLIPybeU7xw5Zqdh8FauvbAE
 QDF+xKYf8vap2BIaOBA==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a19cd5a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=tDSAgCU/rryVExTQDfsVjg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=iShi-8OPmrKBgnXoZJYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: NvZZ6fOI_HjONLvz4jTO-K6-3TNVKcwn
X-Proofpoint-ORIG-GUID: NvZZ6fOI_HjONLvz4jTO-K6-3TNVKcwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290175



On 29-05-2026 03:58, bod@kernel.org wrote:
> If the overlay is not specific to board then the overlay should have some
> kind of base name shikra-evk-imx577-camera.dtb
> 
> This seems like a minor nit-pick and, it is 🙂
Thanks for the review!

The overlay is named after CQM because it's shared between CQM and CQS
both use PM4125 PMIC with identical camera supply rails. The only
difference between them is the integrated modem on CQM, which does not
affect camera hardware at all.

IQS uses PM8150 with different supply rails, so it needs its own overlay
and can't share with CQM/CQS. A generic shikra-evk-imx577-camera name 
would be misleading since IQS is not compatible with this overlay. 

Happy to rename to shikra-cqm-cqs-evk-imx577-camera if that makes the
shared scope clearer - open to suggestions.

------
Regards,
Nihal
