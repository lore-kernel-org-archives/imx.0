Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE2B37A4B7
	for <imx@lists.linux.dev>; Fri, 29 May 2026 17:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780074887; cv=none; b=l6plx0IQ8x4P6DOhfoO0nY1mqbSlE/njhyWxN0k94YasVTwXB9MB4GcifNUuVxljqO/XdCBr5VwXE1SKhNLmxxwHFiTFr5Vi4VvEGxrTmJWTl+tx1bw7Fbrn2E9oh5oI5LcKFcW9nPmKjHhimV5jOOL4gILRtZ+v1ozwVY2omp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780074887; c=relaxed/simple;
	bh=LUSbYKf76os8+Vz1iMCld3ZOXFGhpgSvvxaDbU0zMnY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=a8O4LJKjnGbRxmSIFHXUu9yiaTvkRk9ZPVet0fgDNKHLeDGQ/F0RmXTmU+ZTtA6nsuLsm9v7TTRILmtqT2iaVfBouibQhSMigd0mjjBsRxQvk0G/1KAeot8qIWt9plWImMoQG9BBDrOS+ONzcZg5OHAprtTbFas08375W/lzr2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AxVbb1jm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U40vMGrg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AxVbb1jm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U40vMGrg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TH8cUs446439
	for <imx@lists.linux.dev>; Fri, 29 May 2026 17:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lJmWWWcIH+ma7IFx18m2vogfRXpnULCsTEE4DquBRew=; b=AxVbb1jmWn6aHqAD
	3m3DsXClFjd7myjwZOnFRTWa4dNFI+MtDEYGk3juTtH/ltD88vc4NnXJWWjpJF6o
	k37lYBJ+Uqh6frAhHx994cLmGJe7MZb0S8j8FM4Fho1eLwEIE7LAtDSoCDk6V5Sn
	/3JoIRcRouFWvm+Adc+2QgEU3TTUVt45Htxs1deRlYLVsmWJDSlB+yBE1d8EMTis
	hsRw2ENtbsQ/aEOcsThOIBlCz3YTIsd60NKhmQLW/LrtqeRsqxxyDHI6DZyiuuFh
	bnFDOA/pZl0u9j+1POMi9IFPkSUJtXFIb2ALMoTSXIR7XePNV9S0FLNs5JGQ9cmf
	XJnjtw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef8rchxvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 29 May 2026 17:14:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf0b7425bbso35122525ad.0
        for <imx@lists.linux.dev>; Fri, 29 May 2026 10:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780074885; x=1780679685; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lJmWWWcIH+ma7IFx18m2vogfRXpnULCsTEE4DquBRew=;
        b=U40vMGrgiLpLHJnCRlP9/imkanxbYolBYLjfsgxtAU3i5/+BgQpapAkcym1UWJiaTc
         53/CI79tFzB6xcwY3IIUTdB3YsStFob+4jBppQ3z2Iw9CIqm1BgZ8+fcgTlomJgWv1se
         qW+DMwgqJe1MAPea/sPp99Qco5qSZxTNGrGEtq8lWc9l/buulE5yczLq+bnT77ZHs/au
         Uq52VJCSDsr0d3+cgzkyLmYtIX3oTI0JbJDK4uelRLhHp+lGz5tdC70V42FsfOB4wfYc
         z63R9dXEfeJCY9eVYKpYOkbBSzAcY30Jew8AUO8rw5F69rAxJROOXWKlqOAagQPKwPNy
         hUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780074885; x=1780679685;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJmWWWcIH+ma7IFx18m2vogfRXpnULCsTEE4DquBRew=;
        b=Ovg6M++U11zfOt1xkFVIcjx5VsBTUsfENILIPEpMKAIm+3vs0xHUL+eGtaYElApAba
         ZiBOowrjtbI62xSVizSne8gLzo+dI75K9zWSIb1qQwFr6YaW2ZRCmxXZRAOD9uMlzict
         xxJtuDtshsxC8+8iWOCn6g3uFGwaxangWNY2dMejlo7+0tNxKsDji6KVf6Hw8YCyBr4t
         KZDOS19T1LLnnbGMatNDzHT0M/RgFbRmII5Z2Me1eg9EDs7n40kLTx8m90ze6JQBb6Jx
         UCvkrLzTAYPJwOGYWucIB0A+PJ1rQTGad4RUT4d3/ceU4pP4+RSTXj5LCkgdHmE/oAWz
         y5XA==
X-Forwarded-Encrypted: i=1; AFNElJ8WUIg3wjRyOVGRI+4tVQV0ycKsIOodQC3mMOQzABoMbHp7G1TBFYJBAAO0L5MS2iWE5CU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNk5jk1D9Ukp354HNdxV049MNHT+Php0y9/Hp9P0u0DNvUYWcu
	EaSueTVLtlwooYVHCcxmdeXL2hAsFQZyGtnycjSHHWIRXmcuCHC8C8pYK8+gCT3z6N7/dgrV71a
	O72u4PLBuBkMet+xV82QVgfIPYBmXqvaDG62aN96fcVDzQR60ItTqfo8=
X-Gm-Gg: Acq92OFMadA7dwS6jyn6dB0tYsiUwCj4dsyPl2SUmyWuPKcN6Ch7jUemQHaw3PYDvwR
	QY6Fh3Y6ritSEsafS0BH00MH69QfpMZh5e81aaDLMj7vM7HVtmoD3m6d4QNEys3BBUeySkyEMaz
	NXbVhTXFCX/y9Puu+oEIK6SbLTJwBpebIjYC765T42edc+OBB6GFH1emjBiwBDkF9i1dr7yISpG
	HdWumb9I8a61YUuzzIXqit0+0aRRP7KNA5VTRAo0y59p111rOblGj1D9K1t0B5dyXHOQlccgyWH
	CalCninf8EAfQXM141tJuC3r7WuUkPlBXOxptzsT0FnqMNrSMLiD1vi4JsFw6vgyoThuCV7vNxI
	vbq92C+fO0RuVRtxE8/rqBb0ARWjXBm8SG/37Ci5yz6T8lksH6YRsrYiRS3/0fq0=
X-Received: by 2002:a17:903:2450:b0:2bc:a577:70c2 with SMTP id d9443c01a7336-2bf368383aamr8593435ad.31.1780074885592;
        Fri, 29 May 2026 10:14:45 -0700 (PDT)
X-Received: by 2002:a17:903:2450:b0:2bc:a577:70c2 with SMTP id d9443c01a7336-2bf368383aamr8592825ad.31.1780074885113;
        Fri, 29 May 2026 10:14:45 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.224.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a00a53sm35627145ad.27.2026.05.29.10.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 10:14:44 -0700 (PDT)
Message-ID: <051b9597-873c-44ca-b7a5-29efa795406f@oss.qualcomm.com>
Date: Fri, 29 May 2026 22:44:35 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 8/8] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
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
 <20260526-shikra-camss-review-v1-8-645d2c8c75a7@qti.qualcomm.com>
 <178000744162.4557.14613962845288279527.b4-reply@b4>
Content-Language: en-US
In-Reply-To: <178000744162.4557.14613962845288279527.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tETMGgyO3NYt-dIOpvSigJdBzouDqYbJ
X-Proofpoint-ORIG-GUID: tETMGgyO3NYt-dIOpvSigJdBzouDqYbJ
X-Authority-Analysis: v=2.4 cv=DuNmPm/+ c=1 sm=1 tr=0 ts=6a19c986 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=tDSAgCU/rryVExTQDfsVjg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=nnX9c2Y5NtHo51HYM2EA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE3MSBTYWx0ZWRfX6XxpemCffYSz
 oID+q9UTTRxnstEu4zUI4h0h2nLhPZDN9Haw+WRATgzN8EZyZDtI7u99TetFttVvBZkB8+Fv6wx
 UHrPP+MJ6LjAFQh3BvMCRHEHdzE/9cKRUw24XeOwPAa7AJVKlMwzhV3SlgVLEba2R84svxGJ/4T
 xalmTVXnYH1yoA1v8UHXgZGwyXZ1bS1Cq7hKoAxGJHz99nimvSgZB9oVDh9wBubVO77GSw7on+V
 FfLUtHDJ4Hv9284DXA0aaBnTZGwt4kQX1TZty0E/EEFFZaWIEL0lFUox1rJ5lUZbSFG1K9jfSJb
 L6tQfmlHP6FGZvwA4c4axxYugJsqbCATBDg3qJ6n3SM0Zr8mcFKv24DhC1mnZamIZ1gouhQfIzC
 RP8SkhITZ6IXBeWyhnNz9G7dqQ/JORAPnWUtwYu6t/Sf1XJhV3OvoaTDHn4dOeL2BKOWtHhKMIb
 GhVfIubtp4zIca9LwzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290171



On 29-05-2026 04:00, bod@kernel.org wrote:
>> +		dovdd-supply = <&pm8150_l15>;
> I don't have your schematic BUT where are the rest of the regulators.
> 
> If they are absent or powered by the daughter board, a comment in the patch
> would be warranted.
> 
> Same comment for previous patch.

/*
 * avdd and dvdd are supplied by on-board regulators on the IMX577
 * module from the connector's 3.3 V rail; they are not SoC-controlled.
 * dovdd is the only supply sourced from the SoC PMIC.
 */

Sure, I'll add this comment in v2.
