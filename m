Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6273BBA1A
	for <imx@lists.linux.dev>; Mon, 11 May 2026 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778493495; cv=none; b=ZtdNOQa0T7M8grPawuatpArlhgUjew4OrsQN2uEAdXbjCDZdhi9HHvmjIfrp+GpKR8U3H+sQRNn2NsO7/Ku7VlFE0ouLzt/dc2d9KUj/Ja2NQTtllkQTugv6Ue5WZI1TCXdSxDrEQGdxAzm7DyeYX9nKoMGWYfr9J7Z3uyaRMOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778493495; c=relaxed/simple;
	bh=7GutQd0hEer4bg66j6HNdj3RnmvU5iow0kHbDL9cf/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UdedwrgjiIkTZRJkpqI8dXiy/SuoTdbql8YbXLGp0h1C7UuDvbS9eEaUJag1GRYkmwx5xqgEgmPCqaoTkfw6VQyCytOVTAQbzU3esJyXMK8uiaShLntoZ+NkALlFm3yx18xznzG3aB51aDN/riiRsM4WR4skZ9rbV1U/B1sYYjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AG85DNzf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3Oo12ad; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AG85DNzf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3Oo12ad"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B77Ztg519296
	for <imx@lists.linux.dev>; Mon, 11 May 2026 09:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zEpuyen7+kC5KI0RT3TvREn2myR/hx/t021Xi5ogWok=; b=AG85DNzf1OvYu/Xz
	qNT4MZs43mnEuVdTgVcpk84JGph9P/5IrY8IW3ivBpxlNgpVtxLBNvB+uBipq+sI
	iLSiYx1HYr4PN9wqNANjVyfCkiecE4u3QAkOKeCam9Zaas4LBRsH/0O0kxcPwBnn
	Oo55na+6o5ChNaqTgnbF7nQ1B1nkeJE2CVUgWYHFuCiZk9brgHZ5F9njR9MfKkhO
	R4ECNEE0Nt3QvLtSOqcGejyE5+/ORAn12kwgdVL+oPAJWgMR2cM0mR+bpUjKv5w+
	jS+DdzgYutH7ZdwSSnKkOnHwNsluD2avj4Dgcr6BoaFX3DWZG2yPo+sfORxc2qd1
	4WXJlg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1wpedg1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 11 May 2026 09:58:13 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5755f6c9bf5so322471e0c.3
        for <imx@lists.linux.dev>; Mon, 11 May 2026 02:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778493492; x=1779098292; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zEpuyen7+kC5KI0RT3TvREn2myR/hx/t021Xi5ogWok=;
        b=g3Oo12adh4NGsmk/2q5OhS4sL8Ztfvj0lwx7mZWNQlo+spKLQEXaN99wS3Ng6+qEgM
         rR04pr9ro9+8KFwKhAikh+t9IbGE94uodDAV9xXDD3xWB00SQeBh8AcfbXZVJSYr3m5V
         eC13H7NKKyuhDP7f7reFiMRxRT3ntQW+odKtHUO9WLgqJB8ZfNWfMjrmVx6LAWN1O3QM
         KKJ0YZp0tU6CgQlM2SVMvMn0y1/LnHDD0uBU9Si3fl1jtzq3P0yIy9h8s9K5FGe/ax/c
         7rmYvrYO9Qq3VPi1ZDKwAtLXNSYGhyffUzpBbilJt48BGtKb1MNl1ewveJk9OVGpXbAS
         Hk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778493492; x=1779098292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEpuyen7+kC5KI0RT3TvREn2myR/hx/t021Xi5ogWok=;
        b=pa9NX6h3jHgGsjfEC/1W4G7f1hYkWmdUE+55JFOgTNegjrRhwVEFH50/3cLsjkEjxI
         EF51JucLcXEBF7gAovzjjytzyshJg/aR4UWGMS+QPLA6hTb3wY8SKtmyS82X+V1uVOme
         OjKtBixv7VXXwkn74Jq+m+OquvfySc5t2t9TBpCh+pyVlmqOayKBhosRrl74G+jm4AnQ
         hmOY2Az1ZWkE+ppXdwXiz39nqtGK0XRn9yS0k8F/8dt1TSyDMO9l2tWLxMDulPaugHvA
         GFlZOWIsUh2g2AqOc6bDwHm6I8jFgw0YMM5AZfnh0xYqwk17i848BjibfCr88n2GSIIG
         +xog==
X-Forwarded-Encrypted: i=1; AFNElJ9QXXrBlOc+REr/VOM2gRq7mFtVjh0fybC3UvJvhwgBlX5qx55bqWZfQeW2Dr5avKMnqc0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw/nFYTZoFJYHud6YL0BVxvTe/Swbsbfblv5PdOrBqI+OpF3st
	5NsajOqXiccMfhJcg87x/fYFkgxaVtTE83GWDzb7ekIxCgOQf1DsEP7xOSmaH3l5R9JQlJcvuvx
	tLJtWp2q3qOE7rt71ztA3gZlp57lZs28DZi8r0oA9zLPqqJKPepFcYjQ=
X-Gm-Gg: Acq92OFDHGpqN8BYxKg4tnFurvAcjIaKTQa01SGxGtnn+0pkh4oWHYGiuZJHOLmGBIL
	AlGRi2GPteR40XSP2FGzPjd/C6XxR0Hd/ONi4jGGm68vRxfBLTBTPkaGsMsgoEiVzL9cMLd1yyR
	u0DJUJtShCYpNF+dagXnCrj6TGT9F/vT2qwMsd7PV2aplSe9oJcD5q1ZSivNMs2NUCcW+Xmp1Po
	SQ63xqSEACwaBTgSRJJGODEadgKbYnyN/zHZwD8riFXoxJUav3voPJZgnl8PuzGtC1P9QhN1CnP
	qSw5oYp1dqKo9wlLaXRTefdsqlPphU/BAL+ftT6Ep4m+owxgNMUPwhaOQ+qmKJFghAh8Yqypckc
	Di7NeIcf5k8b4zelnUaRGzICIBzswYCvfw7IXWKo8XSb5DBgAbDC6jN65QPi1AnwsywxaiPk+lx
	/cyyA=
X-Received: by 2002:a05:6122:510d:10b0:575:a13e:b33f with SMTP id 71dfb90a1353d-575a13eb799mr762071e0c.1.1778493492235;
        Mon, 11 May 2026 02:58:12 -0700 (PDT)
X-Received: by 2002:a05:6122:510d:10b0:575:a13e:b33f with SMTP id 71dfb90a1353d-575a13eb799mr762057e0c.1.1778493491857;
        Mon, 11 May 2026 02:58:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac11b7084sm468593866b.28.2026.05.11.02.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:58:11 -0700 (PDT)
Message-ID: <774aab58-0825-4acf-99db-dd88df0366a2@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:58:07 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: hamoa: Add camera MCLK pinctrl
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-5-3ebdca3e4ae2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-5-3ebdca3e4ae2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DRCjQUTyamHYQdtuOyxZsVldg4zoUpgj
X-Proofpoint-ORIG-GUID: DRCjQUTyamHYQdtuOyxZsVldg4zoUpgj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwOSBTYWx0ZWRfX5CiJAxwHJTi6
 J/ucAZXDm2+Adbk3j5X2cF6dkox3esrycoTLqURLtLWSiAMIci8Ng7af5mIjir1le2P82XZqZp7
 T3tZRE4Vk278eQMLF8vvX/bijVwt9jriw2F8Ljs8XXMxwDwcqaGP2VU+F3eOVnB/AcvvdrSy49O
 ttun1iAceKHzJv5VxSODdrHK63z/mi0L3h/KbB2BgNL4aS3II7Uc+GNEiHmi+N7B/WwalA1gK66
 Rk/ynWgOiRxGTL6QhRu7hSdjGntd9g71lvz9p3O2f2vweUGk89HqmnwGB6m4QARD+yZo46MRMSg
 wACpf/+ICCSZqMo6zWyFc1FHF22bjNVbPJ/5KGmlmaJuNAuxJj5Hm0ZnB6WCGk8D0w4d8JrqCCv
 FGfOGlt0hg2cYqJj5dwMo7CF55hdqiTzJjr96hnTz2yBxp8OVl06w/TmRQAzf1duBc3NvbcWTCz
 kK4C7BPhw6aZuSvWLHQ==
X-Authority-Analysis: v=2.4 cv=EeD4hvmC c=1 sm=1 tr=0 ts=6a01a835 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZkPnaNv3TD41VdVxMYYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110109

On 5/8/26 1:40 PM, Wenmeng Liu wrote:
> Define pinctrl definitions to enable camera master clocks on hamoa.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
