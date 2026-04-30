Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584CB42B74A
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 14:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777558218; cv=none; b=lQrL59KD8PB9nr+dg1K2lsZ7qD68ALp/CqEebw1vkqNs93pblvYj3nivC0gggoBfIuBZHD8HFdJ0OJ8/F+9av7i05VR3IB+yuDmaXxkDa6t5dkTDFnn8TnLbqb2te/K2SnQLU7g/a7lU1QzHpuVmpEM0OlE0c3oeCgSC8RrwnMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777558218; c=relaxed/simple;
	bh=9fADcY9rUK71HAnuEZuDmRCIQA3SpQyvl/keIDGR1Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNq2Cb64Qr8QcZHdWrJqCGRQzTxgH8H15R7lqUeZB4GQetejz84uNV70nyBblf+i5xEPofvZzjsouGSUTLQZIINJ5vvqJVs1EbYYIcVpiHrmCbe7zcgC7yFncTHIxIPW507wXqZq/cFF5QAJYTEhevD0xgpE1iHGhw1yPD5zsNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKjp3bN1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ih8lHbcC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKjp3bN1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ih8lHbcC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UBv5tB3885212
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 14:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1GKT2qy4wjJi9yQ7DHur1ft3/ZgwzF6cznSCLmmK8hc=; b=WKjp3bN1Ofy4LHPr
	0dW0TZhuIzOJefjYVwItcKhzITqWCfkdyxowo1/hi4cHAczACxuvivvGjuzIJoXF
	uU3zyLJhDzVSQlunp/WOkSt6MuCpN583I4ageT6HdoYx2K7rIYF2kdLAYdD5QLdO
	iqRT3GaKChHTVr+jGvegmRd9LlQidDE5wjDRCQ7Iku6vp/NSiJlX3WClysL6wpJL
	TIILm+WdROf/HsSdn7c88OhpF87kkKuATMqVklDjwRfBsNUuMQnAFHrSG8GhbvPh
	+ru/Qp3VpI9u4Qr6JFShAZrL29p7EsmfMsv+LgboppAkGZpeTD6OgJvca5Qzi1eF
	2CXveA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dutmakje5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 14:10:15 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6238fcf1f9eso69286137.0
        for <imx@lists.linux.dev>; Thu, 30 Apr 2026 07:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777558214; x=1778163014; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1GKT2qy4wjJi9yQ7DHur1ft3/ZgwzF6cznSCLmmK8hc=;
        b=Ih8lHbcCF6TqpG2S5zJUIRs1+J4ifI3IiO1T85QnThB2ItAnFYrA3VIIgHV9dSAODA
         vyxhtA4FUlo9yxZg9D1h9FyZrKlQxrQVCrUVQrSnAcPT+9X1cs3zJIC5QFMMtMgdUQz9
         LDA5dZbfAXGIX6du8+Biifj67YUthoB8cQT+gOaxk06sBdDm8owu15VIzDg1ZnKkrQsy
         MHzwBn3fVYrzl3uHOnd3UBev6/HykuooCXWf4W6r/bLoKScKD1uhn5Fi+MKc/gVllehT
         DQa03rIhE+IiJ1xsHc9MPxYG52aC0xLpQuiNjkUEllreEcMIc5/VPkwhyDBUKT0dnt5u
         3WaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777558214; x=1778163014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GKT2qy4wjJi9yQ7DHur1ft3/ZgwzF6cznSCLmmK8hc=;
        b=AwBEVf8ZgyekztECJT8RezcEwv58w/Xvy9SbcgaqZWoe99ezXMwiKuFGsbLaCG2kVe
         sWfFnj6SRfxWspAQKjqG6JGfTDSHDKifgNQXb+VwkQrPWicbgeF5wImJ63drl6RjLq3S
         XgmwqUnCVBGW9T8GewdVcDCOP90fcImmiTI7NXqMlU2lKF5Kgp/MO5HpPPZ4zpk5rfda
         5PGyPJLsbHNlJG6XhgX3iwrue3fcXsSqyuQsKAx5rYKDOrmdXTXvJobbea/Z5StihLqG
         4CgQDTbI6mRP2+cCuEeGH5dBGuQG6rw2r6J7e2xed/k8ZxvFDSDiDdx/Hd4IG3KcpHaq
         yeLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/upcOMIqU8cjEOsA5iG0hVoIA/x/W/RQReDrfZADiYK1LOwiWgXy+Z/eWuwiYvA1RqWIg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5RCXEgvQqb+pQEMzVCPJ4VtY8qu90kENFFpnx+sBnVn0ZOFk0
	6m7dKc18Z5oC8SOfnUtcZfKLRV+CG/vP8QY/VCfgXPxw75BGZ5ABdoZ00qAPM11tQgVD4zkMRpA
	EnDno+tEm7JKdtKHbt1OE8RECjfG5iluPIXvcD+CyFIg3HSQmQiTUEqQ=
X-Gm-Gg: AeBDieveqislcYWHgjOWI1jVCrJyuKLNdM+AE0MUXV+921kFwnPw3SdZ2OtMSjP2QDE
	6AHldZ0z74FruYvOYnWoY4QHS/ZAlAtJKxI9wXnB3Y1E8gktsk/uHksYLe/Q1VO9MHt4JRARHP3
	r89Q9jp/k2FIVhWxyQfmaHRosbpQddf0xZrTK8aIjS+g1oHP3KdjSwP1/6X3zEZjgo4B80aubf+
	DHTxg913eZ3h3SQ/SLunxaKwVVE9TJnBnzgW5SquNDcpQUlx58EP56gIRF4AOjVVxODeHGy8e04
	Zkh0GbzzlNZ3csoYAGmnIeXdvHbP880TYjYHYocpBoq4SeVIHPj0lTszXgatZC8zDCWvZNvgBiZ
	oxqlM1Pt0LB5I49ABFuuZB6X7Y9EFDV7OtmduUTx2GNpV1pwNqxFYcdcOtsOT7ucRtO+shVcjEg
	7tVXmCAu/r7UekRg==
X-Received: by 2002:a05:6102:c0a:b0:611:5301:7f35 with SMTP id ada2fe7eead31-62ad263438fmr606886137.1.1777558214053;
        Thu, 30 Apr 2026 07:10:14 -0700 (PDT)
X-Received: by 2002:a05:6102:c0a:b0:611:5301:7f35 with SMTP id ada2fe7eead31-62ad263438fmr606855137.1.1777558213535;
        Thu, 30 Apr 2026 07:10:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b22154e8dsm1878514a12.17.2026.04.30.07.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 07:10:11 -0700 (PDT)
Message-ID: <db701e8b-a405-4105-9b5e-b2add3827d83@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 16:10:08 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: qcom: imola: Move analogix video/audio output
 to dtso
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
 <20260430132140.30369-3-r.mereu.kernel@arduino.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430132140.30369-3-r.mereu.kernel@arduino.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sDl4fm2yAj4uPbhjaq21MAoKBvrUSE6l
X-Proofpoint-GUID: sDl4fm2yAj4uPbhjaq21MAoKBvrUSE6l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE0NSBTYWx0ZWRfX0Yp7iGxSkAOy
 EDndIhr0bBw5YHE+hLwBW33ZXy+TEZQEP48kW6+HsshKhlfSU4YnTGjejfA9Mr/GJ5xYsrqVulN
 nw3LofXOtcYXiwYuEFQfNHIp5TiZN3Q6xhHEL7y6kLnipgNvKMfcenLxo4DDIhiWtjxRcmyKRBe
 JLqvbXysIF0sWsxhQTyd9212MvZyWysdzoYLYZAvBTYQJKF1goeVhTvpAoZ/WSxW/yKGoxOyN6T
 2K8YCWmuZ/kQi7XByYKwM3p+jH7158/ZiwWv4JPOiIQKd3I8IH9Y7Tej1YBKcIcC0yNaT6LSeCO
 k6tdI0JpZoAORklKaMiUUgiIae1NLKQ0vxazbzh9ybhXnTDQS2jSUN5DUnBXzBl1iWn5wI+NJgn
 +S7ei/1M22TBE1hEk+aZrjuLFyu1p3wA1l6LSiU56TDdPCI1s0jO4BTQes7osPi7C1n9KWCNpBm
 BiWKqgFI7TxST8YoXjQ==
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69f362c7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=fTA6t2aXeJjKA9saunEA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300145

On 4/30/26 3:21 PM, Riccardo Mereu wrote:
> From: Riccardo Mereu <r.mereu@arduino.cc>
> 
> This is done in order to support different video output over DSI.
> Since audio part is linked to Analogix USB-C controller it is moved to
> the same DTSO.
> 
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---

[...]

> +	sound: sound {
> +		compatible = "qcom,qrb2210-sndcard";
> +		model = "Arduino-Imola-HPH-LOUT";
> +		audio-routing =	"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",
> +				"AMIC2", "MIC BIAS2";

The commit message doesn't mention wiring this up, please split adding
new features

[...]

> +		mm3-dai-link {
> +			link-name = "MultiMedia3";
> +
> +			cpu {
> +				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;

some of these have a double-space, please fix them up

[...]

> +		hph-playback-dai-link {
> +			link-name = "HPH Playback";
> +			cpu {

Let's keep a \n between the last property and the following subnode, file-wide

> +				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			platform {

'co'dec < 'cp'u < 'p'latform, please

Konrad
