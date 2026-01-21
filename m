Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F2B481641
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990125; cv=none; b=RlSwlMdMRSAmkzuyQ8gegPRSxflxGxLsBnPccvStVca69DrG4K09ElDaz1nn2VteiX4NMF3VKC8HNH1KaoHSx6bKVAh6D9oNmirQXfIITQ49GPWKxE14AmT6J1GaM8LKNZxbv13/qrLPY7ZSatGluZbJnJX4/jVVmNg1ENhkqRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990125; c=relaxed/simple;
	bh=xHdnBIT5cVVjKBvOsaBlmEr3UWvl+I+sv5DFQkfJS4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KE3X30dATqlf6uBWq8qT8tdIvG8bUWx1RNTwxhxUTNGK8nxkqZfjEhj/frJUsViNVa1TIaI+Iy8y685pT0ULf/mZ6OQ9NE4m6ieHtYEnMk8EWafan6BbztBa5qSMCETT7atuPpCLLt5A8gcFpVuTROob25DcatNojKpvdLsdvgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bo97j8qo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QD9FIvi3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bo97j8qo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QD9FIvi3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9iWgJ3481474
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 10:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R63zeNS1A4Z+sO68oWo8FrXbiTVs7VdMbMNjJB9iN1E=; b=bo97j8qoV8Eu4WJp
	LZfvBa2BNjPKS+Pi6Q6EzAAQs4uwvkIGPiaoKgyHQS6DRl2i/twapzEl0GULjGmr
	rmJaBFzgO/39uR502NWyiuN2kbuhxwQzdDqxKe1pKD9aNrtTjESXse9rgTuJkjV9
	qJZvEin5jY7rjKEVBi7H3FGe+cqyO3M6Ig5O7h9WpTxs/1BNNDm7Bm5Ss9r27JFB
	8RPUlqHPwCkPnuDJ5b5V4P7HyOPF3kldAvCrB4H6+iC1k3lTEEba93os2152WqPV
	OgiDenfeZznRRfeUFqrNazdn3160OPez5NggiSEG6EO8Y8IUN8quUW1RasM/uTcQ
	il9OWw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btvef054e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 10:08:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-890587d4e87so185042586d6.0
        for <imx@lists.linux.dev>; Wed, 21 Jan 2026 02:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768990122; x=1769594922; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R63zeNS1A4Z+sO68oWo8FrXbiTVs7VdMbMNjJB9iN1E=;
        b=QD9FIvi3NFFETtw4RouPvrq1IsNQ95rSRT/S/iPIlK5MzfFhEaPFOQ8WqnZsHOsh0h
         3PODjfI5IWs3ZHgHpbQY6mrIBa7FsY+rhHHavH8yOIOeLZ38NK85wXNaVWNoUx36GQZP
         TkTiQxFlnqWiJ71H7vnot3ImUE6N8k81E0fFg4qm+HxEjU5fD5a7XgxNYv3WxdelEHyC
         fbkTl7ic5zAt7uhpBZNIWgG2IPR40ykX5Ay3S1CbipU3khHuH3RiivW4Sr3MSmJA4pFj
         0yk+lmYUms402z8Nn0B1TiYLfO6C/UixmYPakJWqef/gjrbXkxsL9iImsCxq4AV2R3+w
         t1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768990122; x=1769594922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R63zeNS1A4Z+sO68oWo8FrXbiTVs7VdMbMNjJB9iN1E=;
        b=PWqIKDVLYIX8hvUJF0rKfFMelOcZCKjgSe+2hHczZFF98Swp0JwvWiyM7lWlVs+iFw
         2hhxAB/nphievaz1JcTb8zVcMpFovXiDvWXkqvH0Y5eXFocaWu2yw6rVbSPkv0XVlKda
         ON1RjrOGGb0VClJn7kFbRaYDZmdfEK13WUaBGVpcBrf/qf9k0bhW3unIpZk595sRbmdr
         P1PPVM/eIBPRgcOhwWZoLHexdKkxrAthQbxF9QanQztmFYrVTYzcIzWDPKx9BM/+Oq6B
         gdQzbM1EdZ+GhavRC1hC92RPXRShY/UxVDj/+xMqv40tzm1p3MssILBfnQyBkvHFQ+W9
         NSzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVVVdIIol2VlRUQtQdPFPb1RjQpsTaczPsXCrjWPdGpkRNXrtu3/pdu296QL7Sf/nTwo4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCD6txwsjFgh4WNX1FiuI8MAo/qBy0DawCWupanerqjkzEhtzw
	G2cFgK1U46ZV4eivTLJa9al0ZXkR2iqiIRHjoKPLsxkaLwoRXwvMXdKiAkpeIXb9ZdvoyGc8Jjf
	phRn5FPrg2CdWq2Z1fLXHhwZLWTADRDcCSH94a6f79mdyWj9zn7/C/7Y=
X-Gm-Gg: AZuq6aJjEFGklNh2rWNoZ3bxEP/KR7VrD3LwWcc5qwMz+LV4UFuBeRJbRHZFmo0/GTn
	sZUAyIXJRE4EoiASvIehWu02C7rHaF6lbZuX2gYqjA5BsO4OHm048WacECZkUybmLXl45T5IybY
	pp+aK+qlsDhI6YNqrrtK7oMskd/7IOs+g3Bsk/2h3/i8jqKp7WpSu8ghvxIJ9sAgvZkzmxXTrKy
	0GY3vME5sEqhx5EYBL7Hej46NvNbR538LN/JNojW5PNKSa9b8bmezDtDq5qibGE9L835vW/jqbj
	TMQPyBzA4cU6ZH2TZkZL9yN0keRjnrqGj365anp7LEJqrzASRbq6f2CSaX1+DxnErWYmKNZGmGL
	hISwu4EPd7ouYxxhbGIBQYpDVAMPSLqwYuB3Soh6z4BtW3tv0NnxqqSq6O+njUBPjIsV9jmYu
X-Received: by 2002:a05:6214:230d:b0:87c:1d9a:d0c8 with SMTP id 6a1803df08f44-8946388844bmr62930246d6.27.1768990121786;
        Wed, 21 Jan 2026 02:08:41 -0800 (PST)
X-Received: by 2002:a05:6214:230d:b0:87c:1d9a:d0c8 with SMTP id 6a1803df08f44-8946388844bmr62929796d6.27.1768990121368;
        Wed, 21 Jan 2026 02:08:41 -0800 (PST)
Received: from [10.111.169.82] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm103910141cf.14.2026.01.21.02.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 02:08:40 -0800 (PST)
Message-ID: <d15ec6f6-7978-4e6c-a752-ffa8a44a9e13@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 18:08:31 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Add CCI and imx577 sensor support for Talos evk
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <aXCiEyyu7mcx0YhK@zenone.zhora.eu>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <aXCiEyyu7mcx0YhK@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hnSNa29vT1EcZGVluPkYwsvHNENZDVuL
X-Proofpoint-ORIG-GUID: hnSNa29vT1EcZGVluPkYwsvHNENZDVuL
X-Authority-Analysis: v=2.4 cv=CYgFJbrl c=1 sm=1 tr=0 ts=6970a5aa cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_YHlsWu5nELmUMumn10A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4NCBTYWx0ZWRfX0CBXXX9IA67A
 HnKNStm5w4mrhfHKcB3JK+F6sO0PkPd3UOvj4ijnvjes/1qNr4xZ3zHkmHs8YcfotBtkXNIoM6f
 1Fcnqg2Ue6ZVyR2IxspFWf7CRe/4LoG9dPF0oNswk71TgcJUhPiOgaSRYfnXvY9scaO7HOHD5Ht
 AbxSZwy8nG+YW5pkhZujlhhiFjGy0EOn+VwLSg3vvtSoLZ3lE4D8V+LisyKzm0IRBMadLvAyf0I
 5TVq7CUPQhw0xcV8iQcQI5t8fMwrlJA9Upo60hbULOQNKJSxUEXDqcdG2z3tVkwRSyh52uniReD
 mR3+zEyFLwdSuTarZSyFehHYkNREgL7vXXts1mNvp0Iqdxt7ErhYOx1I7C49MEhEZTr3l7Heh19
 ChXuWGLmgx9zGcHwuoQXdmdKmC/4bT8Z+zlYwDuW8MAQKQMsD6gcj+4RoDQNjnKz5Qb42tOxYhX
 QnlEWR22GteZuxPYKEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210084

Hi Andi,

On 1/21/2026 5:54 PM, Andi Shyti wrote:
> Hi Wenmeng,
> 
>> Wenmeng Liu (5):
>>        arm64: dts: qcom: talos: Add camss node
>>        dt-bindings: i2c: qcom-cci: Document sm6150 compatible
> 
> I assume you are still going to address Krzysztof's concerns here
> before merging the whole thing, right?

yes,I will push next version to solve this problem.

Thanks.
Wenmeng
