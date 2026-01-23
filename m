Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69435364EB2
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 02:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769135449; cv=none; b=u/7UCOrKuY7k+/MM2IEk7aAEAnsMG44pYaJqoJejp9jJ748hvrZMAxxuj9OvyEPp9/MpC/kjnVZYQycJRv55m9W9Td6lRIqCroSJ0UUHuJLruq+qDiXxq7tDMcw2lfC3FYhpUjfbJQwDgeoSTjJ2wfZUhz1yNkWbFJXEE+qXQX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769135449; c=relaxed/simple;
	bh=TB1IK3oxKC4Pvn5NMkqqLOWwLoygWYshus/E1Z/h6SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Azg4cnbQnz1GMEcdVASMjpmaJqQQHndBBsOEqF1SSL4Ol17tpI+df4tl/Km5cUNB+ahbajQaC3iJhbblkETKEe0WuofZwR6sEbTbf8tPmTn4T5QZzd6jvQUtMkKDVeaTwiWzGzGIPl/bSckmhP2Tas0C8l1Oj5ZbnJleHpLRvkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NoFjCCue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D10HuEs4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NoFjCCue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D10HuEs4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MK7vxd1118577
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 02:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6aeWGzMxBIh6hKBnzi2b6uZexZzjIgGrfHofmca0u00=; b=NoFjCCueJEZgaVON
	oTYHY1xKusFZTAAGOfDvHh1T89z90P/vVKRwm2GTje2RPIicO6FGSUsoIMCnlfx5
	2RcDG+k7xgfdpNu0S5ePAd5svYiLbkI86pytAD2+HRqMzJ3LGhOKexJ0rhJlVx26
	+EtJMyIvPBjizO1lA9tUvy6rstRp3YhKMPSc4IA94nYfPOAv/h/wayDMUUtO74hl
	d7mRiYJrRskOFtB1LsItq1Qt5qB+UQcQFjg/jknO6j5MTvq0hJBEj0iykgWJIQV+
	htRWlDjT/vqQG0q9TjA8RS6vNB3qy9mDqypOOVH5cv/p0t9QtBtpXm1E+qan6+n+
	uKT6qw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bur1c9jt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 02:30:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-502f0627494so32104261cf.0
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 18:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769135414; x=1769740214; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6aeWGzMxBIh6hKBnzi2b6uZexZzjIgGrfHofmca0u00=;
        b=D10HuEs4ApQ7pSx2HkN0Mk+3STrh3wqM11h789dHjt/N04xEeH9GYP6KbFbRM1wKCW
         IcuzlsrT3ZwgFKbn4tq4Wv8zYx254VIRwgw9BbA9hNkRMr5PdHRzL+TlzyTJqpjP3OXZ
         fMMJSvxOM9g+Kbgo86MLW1hqg7xk8DERscwYGlrkT6GqxDDdH/LS18qZGgRUGsREN6Fm
         CxbHcdO9Oc5KheVUZ/xLuvA4OIpc8lRqeaweMakbTqLuNZiE5xaVaE69xMFLKB+I/MfK
         8im78imt662z6v05ldCo3dLGdjrZhrFPoTdBZceEuoTQkjsaZoFONyfWKNotDssKPgZ8
         b8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769135414; x=1769740214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aeWGzMxBIh6hKBnzi2b6uZexZzjIgGrfHofmca0u00=;
        b=CHETUfX5DWvFWLwBIxUDT0UOd4pRM2rmLPwAD3eCeqEd5OsV2XjLjCbCetO/QyYfJt
         4LbVu+vI6LuGDkmyqmvqA0fUynOus75gYZwVrCpQUWw8cFjmz/NEjk1V5nJUn2jj8NOl
         Ktfy/M/sGFM5YFPJDz85DCSA48jUA3XCvQImhTklrRBVaPfYqxVnCx0e45Pcgb4Rg9Vy
         zGa/imTULQrTPFHHHl+qh1r/4b2aUGy5bqT1aTHy0vS8hUCdHfO9TzVWxIc/3y0Iv26p
         WoagK8dVvoyW+D4v2vZX2oI+3kT3FN3jcyFe53weoGmI4CjvSgpOW6cOV4h+zxhzpAOr
         /PUg==
X-Forwarded-Encrypted: i=1; AJvYcCUmYAkpwX9gog2LBjVO++4irOPCva9e/ySRi2SNrhSq2Xt5t7UF5MeXYMJ4edgJNnAFbq0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2XeplHIJSZajBE/9h7iK1amWsgt5qp9KIYp8KXZQL9chzGPd7
	PllQm2dBnK3larwNk+CDTO2ndbLMkq+PZLZRXx7CzVE+waJyuNzuftgiVC3z78K1G+tQ311FB/t
	I/UaNfmNWWWk2xWKCp3WIhMHlha4HSD8e73BUUv4Pv9LNPs4ozKhDrBk=
X-Gm-Gg: AZuq6aJ75Pf+omGYQfmWsHw4FD3GyacPkLrdLXpsPSTF6JmQUQd4muC/amZ4czkM1lk
	IXXpu7kSEO1UVDCfHhy7Gy9sTrU6mIHl8WbRdJFKYsoDEIJTfuTsUJRhzoaMYNKhacB/8emujx4
	blTMHEgGgGGnSXNyzFdWj6w/5ARmFIHf7hbJu+iwhB4rc3Vr8E3HGbJ839Sd9523knxF/vgCl0r
	YhtqEnQE2mT6VT726X5heEz9R+vTXAIbRT8QoZljAgbbfFQ4mZLFwM73xCzmcihMXUAOIFEmVaX
	ueY0BXw6YqRTLyMxztcEIjWWOZmOVOTdx424mu05V5kxjAC/h+kOQdRBaoOXMLpDsCn42xc5Nq6
	4CokqZeLhSTYBufC/DXRD584noJFk8voUyL3D1MlU1g8CMxgtuTu57q4ilCNZHb2JdrNDiUOY+Q
	==
X-Received: by 2002:a05:622a:10f:b0:501:4236:5474 with SMTP id d75a77b69052e-502f77653ebmr23040771cf.28.1769135413671;
        Thu, 22 Jan 2026 18:30:13 -0800 (PST)
X-Received: by 2002:a05:622a:10f:b0:501:4236:5474 with SMTP id d75a77b69052e-502f77653ebmr23040251cf.28.1769135413099;
        Thu, 22 Jan 2026 18:30:13 -0800 (PST)
Received: from [10.111.171.243] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502f7ed650bsm7054291cf.11.2026.01.22.18.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 18:30:12 -0800 (PST)
Message-ID: <e0e6f248-3d82-4b0c-9ee2-4a655b7bbbfd@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 10:30:02 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
 <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
 <825c3e7c-469a-4d69-b298-18f2edf72ea4@oss.qualcomm.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <825c3e7c-469a-4d69-b298-18f2edf72ea4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FswIPmrq c=1 sm=1 tr=0 ts=6972dd3f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=yKNFHEXJphivSBQIcCoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DbOaRqdDaNpHyXTU3QfzsaFjS-D8xt8T
X-Proofpoint-GUID: DbOaRqdDaNpHyXTU3QfzsaFjS-D8xt8T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDAxNSBTYWx0ZWRfX3blu+mvpIOiq
 ur3LiD0eA5aji5TmSyr0UO4Bb9Vi3Cmoz500nDxJ9BtuoAbSRHn7YekiHQcRdy5AIvCsS2RTxeG
 WqLSOgjzH9gHK9QytnY6EKA+xSo97wDHTADZO2udhTzq79J3drdGPPsa9W40R58nsl4JYpkEgJF
 UKmnRRnA4pjgcZrPnAptTFvFTmTQwCboojMzFToAN6EJRvpB7Rq5RHph1np8pc+gINV5MKkfbJo
 zuLYO5U2HdyLQ/uhRTPxnF2Yyoa96/uyUlmXKTeja2i3Jmpjm2wpdwW+CwhIlAuzhOVtcUdgoBR
 97qPkQuO6g044uCM3TK6/jEuJbZWXaJyyGhsMB7EjCZnkvr0hTPmF5on+3ogxjaYhxUFMVC3WsK
 rwyonyRjMbRyVESEcFHbWFW8NorlGwwIiiSbO6R3rO+xVMYfhyaar57iSXHM/LYuuAbBDsqioZo
 cfsHjjxjuGaRMDHB3NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230015

Hi Konrad,

On 1/22/2026 9:44 PM, Konrad Dybcio wrote:
> On 1/22/26 11:48 AM, Wenmeng Liu wrote:
>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>
>> The Talos EVK board does not include a camera sensor
>> by default, this DTSO has enabled the Arducam 12.3MP
>> IMX577 Mini Camera Module on the CSI-1 interface.
>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +&cci_i2c1 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	camera@1a {
>> +		compatible = "sony,imx577";
>> +		reg = <0x1a>;
>> +
>> +		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
> 
> Let's define the pin settings for the reset pin too, otherwise lgtm

The reset pin on the Talos EVK board is different from the default. Do 
you recommend that I define the reset pin's pinctrl in the Talos EVK 
board's DTS?

Thanks,
Wenmeng


