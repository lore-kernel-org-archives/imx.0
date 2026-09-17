Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C395D4D489D
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659013; cv=none; b=Rkwn/EMbwCpHRbe5gPw/jhM1TBPhaQ7zmZb0IIpjM5VJMe+6UComzcE7C42tCchLDWY4z8+rLggitnxR8MJkfS6n5SJiVDGC+ZzB+OsPDz7MT62zomXk7289cPrhiX1GOGzBEOzz1Q4aB0YbvO8/TUpfrMMbWwfvRAlVld1yDpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659013; c=relaxed/simple;
	bh=EWDDxvLh/ajUORqgSDl2rZ8ViAb2Wg2kGEU9j2QUOOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGiLS23Ql0obETN5+YyeNnMeB9CTE+OXzIcjtrO2iXkmhzCiR2eEPDPA1UA3hw1L4A6Ht0gORT9a11cxu5+f3j4vFCg7mCOyNXCbT9cgwLf9cY/EGddDw91NL+7vgpWAMkckpyDa8dhOMcMzMdwB6k0/ncCRiewcZQGru0W3IwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDsyaP0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/Ne6R+P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDsyaP0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/Ne6R+P"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj4iN2777338
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ri1E8u+BKFp8OWjyXvh+uMJ4
	co8edga6jii1ZtQDCCU=; b=PDsyaP0eFQq0gY9bRGD1dBPRKI+Mti6Fa6Mjx9P4
	/khZUBYJ0eBzHeRoEwoD2BIAv1R1UYKV0L0YH6aTLI9OE8jA57mYaHLv3jelQ66Q
	2vN1baVoBfaUxZfXQRxJ/MWfg9+zKIqYi32F18ewUXW3XhPsDW8hgyuXpm/npdUE
	eh0kwUF0zhAS1AO10UaJngpkjcqIA6sQmOMEqu1EZHf5tTw+UyGNX1M69T6FYH3D
	uwGIaJSJ0XTUBI2Zmu0T4rdQOuc6mYtXsJoD+KwwihlcaBfW0YWoUGIcpm7N5LLS
	pvypELLWoJjYJxxdP5Alw0GmTnYKP+QNFEMG4ZsO5NFlPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m38qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:30:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a05d645acso219933685a.2
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 08:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789659007; x=1790263807; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ri1E8u+BKFp8OWjyXvh+uMJ4co8edga6jii1ZtQDCCU=;
        b=W/Ne6R+Pxy4aqJs+CdYd6xiG0VVEfNwRwsriM8aGdQGI76q2PojuztwBxQUM6+6T6a
         wBaviBbElAqerWOfIm/bAt6arNAkEQz+d+lFd/P4Unxr/H97kAC8RHfct/eW9EFO/xm+
         VFLTkd54Fg5ulNmMBMTUlZaV0vyNh5nCmI6wtFAgNPSPzH0uDNRd7qSwZpqghpELmnOF
         8hWMjvvN48e+XcZ6u12FVQVZ1a5/RKcaItlOkEiXb+szMUvfkg8VaEGRjHfqBwxN4tbf
         SkuD0bNh3u+DbT7RSaYPGF2M64r3LbRRFKtuiMY8WfLbpxYtp/IRJEXt+bv/cELISCAM
         VIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659007; x=1790263807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ri1E8u+BKFp8OWjyXvh+uMJ4co8edga6jii1ZtQDCCU=;
        b=y8ha9VLcSz/raRPR1XcncbAmD/M+CQBdopVY0u0PNV4El/tLNI7anr4WK9Vv2wFldH
         +7w1jgRrZfzQLC1MDq0ayUBO4k3qeW8MRpMh5NACIqKlR6eG4hZT6+3yvXR1e4gqVRXM
         VU9pWhBuSIuSA6/8fZCwVEbKxidFRF2/0WzRUyq0N+ASnpElA5P+gDegH/2xLLPORYO0
         8UghupOOW9XvOEUhRhxH2gnCWfUTFcHgdMV7DW+cByXbedC+bBQcpc5OVS4zkoxW11ZB
         7vxCfbXdZQutVAnSZaF6m/w+sBVTj8bwXFnQCGpUxETv0QOuwPI2ljK8IbH6eO5sUmEI
         gYAA==
X-Forwarded-Encrypted: i=1; AKwUvBwjosfIhAfW6Qp9kAK9EWYuzXMnfODKCkG3enYlfZxqSTZnrZm8tC4J2/nAlkhR2lCT/s8=@lists.linux.dev
X-Gm-Message-State: AFuF++kMsBVwsnseJw3qHYb4i3kQs2hSGOzOzNOsEkaXIeDi/QXFEuAG
	dJUh7GpbhZ2TxeNSqHk4VeP12XKl1Qp0F42/7++s1hxhMvHdbh/YliIZNQP2ornN9NES8bi/9zm
	PwwoIXHMWjtdhrAUV9m/6WItA6ub7gk8Zsf38p8pXeolzZozi2adeLok=
X-Gm-Gg: AYBFou1WxLqiRumQK0Ketiz+NE8bWgRAZSXt+edONi7Jdi2Zvw5Gze6pJJTyEflRURe
	YUwgMYI3vc1MKD6beuiuXgwsJAPHIADY6aZbkmpSF/kJnjd7O6rEuo0DBIFA8pRLQA5jQDpauJg
	WqvcDYakUPII51i9P0gp/IWNOpN6P53fH6vtWZZiAQjZCPfth8HwKGvf+R0P6GEzmVphoIzdPAU
	OYoIF61Wb2mxdHnyZm+nQLjwOYF9AiQ0UIdcAGSdORN/wSa8G6hlh4TmR6mTQV4AEdW/LyQyyHO
	qPFl+bZSp4Jbpu/A0IsWC8zTRRYlIbxzW/O2uB7sqJ3D0Ofg9xdUCa25wUoFEzTVLMzzmjgp4bE
	lwdTnnva6hPdZbw==
X-Received: by 2002:a05:620a:172c:b0:939:6de6:9517 with SMTP id af79cd13be357-93bb794e07dmr1288320185a.46.1789659006331;
        Thu, 17 Sep 2026 08:30:06 -0700 (PDT)
X-Received: by 2002:a05:620a:172c:b0:939:6de6:9517 with SMTP id af79cd13be357-93bb794e07dmr1288311585a.46.1789659005708;
        Thu, 17 Sep 2026 08:30:05 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd247809sm141129705e9.11.2026.09.17.08.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:30:04 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:30:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: shikra-iqs-evk-imx577-camera:
 Add DT overlay for Shikra
Message-ID: <ok2efl2jwkpm4etywz2w256gozewohaznorhhb6b3zed5ktr6f@vvqtflnebftn>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-5-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-5-9b9596221cfa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aac077f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: EiBYfYzVUqrmDmxvPHbFjiHRZ3AqBL6b
X-Proofpoint-ORIG-GUID: EiBYfYzVUqrmDmxvPHbFjiHRZ3AqBL6b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfX+VhplAo4d4q9
 W7dYcG6jaAyXsIa0/NvFaoasBruajtHJahnaoy+9Mr8jqA/6EpILWVxqLm00B2kkCPHkKg/Iy6b
 iNdVtGU8L6X7ILH4II9DkRLSW3TX9idmnUeBsvfKHMy2ihoINDISP3CfK+dyG8S23fgp5yx9UCD
 syAQD5JRDI5DKjQU6BBwnWMrYt+YuVD7BDdsWFSn75fhTC0iTwUOp8SqqNiuysDUtsdSyoWk9WD
 o0qyl74zHlCzZBsr1ZeEsuVYpJHbZUoTmXGHjU1c5tgPIzJwuyUXai41vwszcanBcEl6f6EbRaG
 iapBDHUkA2QjdVTX+AETUQT0F5Uu/cSne68k87YvbDh0Qzrr+8zlrD9Bi6QpZ82xLGMpVboKdDh
 dNmCP3ATg/7X0VmHS5+FIAmTOmEYjYrIPsS/yryU5BFW88fQgUQZqzscj1i+GqqQTheeGSqlmDx
 q/d/PV6WhG8tCqOrK/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfX3W462uNPYZN4
 DQvRs/eaMbyJIp9ClM183hEAoHYxm0s/Cy8JMgRfSQMO5KVEqNo7duxlshg5hV6+VVxi2RSXCP0
 LJFmWhHGa0NanXQu37vKSgsOzOiS5z8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170220

On 26-09-17 17:11:04, Nihal Kumar Gupta wrote:
> Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
> different CSIPHY and sensor supply rails compared to the retail boards
> (CQM and CQS) which use PM4125.
> 
> Add a dedicated overlay for optional IMX577 integration via CSIPHY1.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
