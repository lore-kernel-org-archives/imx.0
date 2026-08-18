Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169AE472533
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 12:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056789; cv=none; b=VX2tKw7fhapL6VY8prxVqzDXUjt7zU1B+063nELvvvHxwls7DV3IkrS+o5TwtYlSc9ehVDOZb3ax4+LPFwxFJ4LKH9I3GTR+5O6WOrtNq9dKW478lD/C1QY9XopNSmDp7LVe4a7Dnh1zjIAponn1Fz21qYiM9Pe0Mmcv+dPDZ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056789; c=relaxed/simple;
	bh=gTPEsPP9hoDdy7fCm2AIUCjf4BTdWuef1OndcSvQcK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ThWPzg9CZ2LD2wnfm5dOXvNRLaSY3EvetXAsHsms8yS3SWbUfVK2aUf+uMFhFcX84frA3TUnzTiEYRkB9gbYYlOZLE8b17M4tzVxVkHAfyvxSpiVABUZXK5FLgEYY5wpY28nBUuje0qyz6fKgVP1GEnTsff//6jMI37mqzvFDp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pKBb45U2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VtehQipa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pKBb45U2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VtehQipa"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABXPe581263
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 12:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Q34BQFriJoqeny7dSzYRpbECgzeFeOr1DQ9vplIGuI=; b=pKBb45U2+vnbALE9
	T9REZMDBdt+HZXDwcf9E7+VxNpU742Dw18fHiDUUwG/3JchFbQ3htS/1AikzeoW5
	dIe/7TPcQUOP0GoZXw2ChP73kt/2ELTfCvLGgf/NBRoNd3kejD1Wyix/hi0j10IW
	P98CwsFJ6EgJYUfT4ouAohgAmQWVCeKXeVwXVx1nXUNGgAStVis0dzBgfdpiKcLe
	LS6nfgtcjqD6PDo1j/H8ZcIVvYtCJZlQvoguDX1HgPmAwtNSuCYI8NUCnIFbuqGV
	CmW0ZcNWGDwQ4zR0WJGBw4Ee2oi2g0oW0/WoAmwn3nBPMMxhm2cf1m/X56PIxFcI
	YhuYYQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fbaa6ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 12:39:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9349ba88188so118182285a.2
        for <imx@lists.linux.dev>; Tue, 18 Aug 2026 05:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056784; x=1787661584; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Q34BQFriJoqeny7dSzYRpbECgzeFeOr1DQ9vplIGuI=;
        b=VtehQipaQCy9ky5AD4o0kRLuqzAkrq0IEr/f/tFcWHyRlM7U6v0f5EcwOXBaThgE8C
         qHe5PSdVcX/chwltReXAnQixAcPrT2BfNEptzEcBDleQI03zEfy2/UmubazHwXe7v8vP
         a2P5guWQIry8BB9NtqLSYJbNBZ+oM9d6v6q8tp6Ta4l+V5zRKK4JAKDyPO1jhvY9a3/K
         QjRWq2ucDYlWThSsQqo5yLm4yc4fsRUCqpZjvr+0xD0FntqfDlWNogIm348E2Wj2F+54
         4SCbxNogsao0EHl4F5AdeckGttWFsxMzd+BOqvbeLlGFuavF8GJYdLFghLwJZjR68nD5
         B42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056784; x=1787661584;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Q34BQFriJoqeny7dSzYRpbECgzeFeOr1DQ9vplIGuI=;
        b=qiQ8AgNZ37eTNv5XvWjzwVcIQSR5shy54cQMZXelZJGcb8oLgFF/FPIV7ksCQOT9aC
         HThHUjGbQz3/T3qVj7brzIPky9VQhZpne3cfVpOV321L/1sqOuX7RfXdVe1EOq4o6w7N
         Kw5Gh2vL//fkU6d3JeClrxqtcMTu9cLKU7Rv/tG8vBbhkgMLlLCuIoKFRiQZX/i8Qlit
         oP/UFnty/zU6eIQC51QbuOf3UVKxT5UFLE9+oq3PSo3i+pBGw9HWSVezv2AwxMB8/ssN
         T0IqDH+eQYOulzGSvBP2dI2/oFj2pV1djO6eEgykDOx1UONG7M0vrfH3sbhzrEbZISJY
         IJ5w==
X-Forwarded-Encrypted: i=1; AHgh+RoSGFYxodYVtkCbX8gZP+GJlGr+7xB7yiUneEJAuOXQZ/gtvBwmOwa8mavU1ZifKL4N7jo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNWvzifzcLfsTdoiomzKkBMbD3jkewwyVigcB3rqvNQ1/q+1kY
	EZYQVA3v4G3UEkU1q4ZV51UiKztGuWaGOFFqDGxy50y9M5KAHWjDMpyepHpiYIfaVthw47B6uep
	kXTDjfvaXoP2oYJGjifEtJfEZGBxbR8yvmf9mZGqRf6O5b2UKPf4AAdI=
X-Gm-Gg: AR+sD13gxX8As7Xewx5otWcM8O90gwfFMW4egw3Hy+jsuls8uYWWI9PTmPDKjcQaKeY
	71RNqNbeAHdC2DeL+HtpnfubBYkcpOcyFiz7xH6i8SUlXyuGPoaXsveyDE3TNzbeBTYqKQunObv
	AJ9NJr72+B6z+WCylFrhg75ZO11HNCch1nc+QTQOnfJ0jl6489VfBxa2wH7LrbK7K6Kvc4v8Ku5
	NAsRDK0DK0LqukwAiX19cVvp6GmPUGh090zjZRkllu2zpTROzDtxHzBSywnQWcdKHoCGecw6e2X
	wAV5j5tqoNSTE+6530wNpy5ZxxMfiF24hJ3zT1iPT2IS0QNO9tU7UtN6yjO462NUSoTY+A+Yos7
	1eX61jC1lIYSrc5f6dD0bjSbG
X-Received: by 2002:a05:620a:1a04:b0:92e:6485:f640 with SMTP id af79cd13be357-936d261aab1mr2353626385a.4.1787056783609;
        Tue, 18 Aug 2026 05:39:43 -0700 (PDT)
X-Received: by 2002:a05:620a:1a04:b0:92e:6485:f640 with SMTP id af79cd13be357-936d261aab1mr2353623485a.4.1787056783103;
        Tue, 18 Aug 2026 05:39:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2187c83829sm123750166b.41.2026.08.18.05.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:39:42 -0700 (PDT)
Message-ID: <950bb08f-201e-45d5-9695-5c55e1e61c16@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:39:40 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V
 output supply
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
 <20260812-rubikpi-next-20260615-v3-1-06e21232d8e4@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-rubikpi-next-20260615-v3-1-06e21232d8e4@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfXxNLpcv/t3vm9
 3P4YZIgknqLsndsIy7WmnpkvTYINLrbnBUPtJpYueC8tVlp6tQ1l2WDxxoWMiY4vEFI0Qv2vPhp
 f3l+MxiI90f5lzdWI0gURXuQAv1IvIo=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a845290 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=Wdb1h0LgAAAA:8 a=EUspDBNiAAAA:8 a=XGAgDj9QmdH_QUsWaD0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-ORIG-GUID: 4FjSIL_hz_ZpGZZOsra05a-7Fxyuj6ew
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfXxcm8E4YnF2Rd
 66AeC4ghq1NPQeaIBxR3xzp7TRh9X0i8AHjEePBrXNVwoAB86JHfZBqJS+9R1strua1xA95AP7W
 gAXK8aDypzR+Wb/HEZTc3pEg0ss3cZbl5n4YF68QK5siP4M+7k75wQnGyPOJ0jnJNOL6v4uXY3d
 RANhClNZrGsSK3x9USlqpLSe9Z0S8wDFQTSTcXkfCz14vpfzHq53rdw5+n1bHHDSJ+fiQn83Nxc
 1VJv8TLsfxl2c58lWWCpZGrnZXFtFymZouDPLZYpHeuliHl2DgObQ2l/jOMv4djAxNHMjWREQOx
 N8NQTSiBm86qJMf4yq4Zu9STClcMcvE70OpZ2TUYQ1nI1y/042SIwtPpOF0VVXUKZ7m/jCjvAy1
 V2SwkU3mD3YlEFO+9cwE4e4bVigoGyo9Oi5hAlcOTcFc0iykV0rjo05q2NgkVAQPFmkQresps2Y
 xvs3Tu/YU1urMwNSuCw==
X-Proofpoint-GUID: 4FjSIL_hz_ZpGZZOsra05a-7Fxyuj6ew
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180093

On 8/12/26 4:22 AM, Hongyang Zhao wrote:
> Describe the GPIO-controlled VCC3V3_OUTPUT rail. This board-level rail
> supplies the two camera connectors and the 40-pin expansion header.
> 
> Keep the rail enabled because expansion-header consumers are not
> represented in the Device Tree.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
