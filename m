Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FA01F5821
	for <imx@lists.linux.dev>; Sat, 13 Jun 2026 04:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781326021; cv=none; b=HJgA1DwcnzwfiXW6MWEUT2ilKR5NWZ9OtCT30jcrbn/drKbnZy54FWIq18iYqxZbnAMUMh4D+EOh5B2zp3gLnVXSPqmQuVkfpgThTw8gwiwXNB2Pxy+iie80Iy9Z6JcL3lknk7gtziUv1WiqzXtR8X/t2a8FyOLFbCD/oXr2Mko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781326021; c=relaxed/simple;
	bh=Va3NT1tqZbe5IMgKWr3GK0oOwzn3cWko4YKcItDxgYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IlAVXOL/woy+GGDIcbKRGEGuJDS7qUCncQaxUUzMrZXYmdOdxC8QlNT1MswM+V4k/sSeO7N7kqkOG2zzStoXQLaNMHGRbjwNgtRvu4uiZ+boFL7ahV3KysD8wxD0rH1vGOQaUfUsSWTC9eXNpnFCst4PvY8Mwrm6eOE2ro1+f3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbdGHNk0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4y4chPK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbdGHNk0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M4y4chPK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D3cvSb4031120
	for <imx@lists.linux.dev>; Sat, 13 Jun 2026 04:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WltrxbE+VrzBAeQAuOOkNg0JVKgr8R9KzViSn7S/z0g=; b=FbdGHNk0J3dmTF7E
	VbQOfepA/30dcFFN0K2Pz+a7TZTVL22LrVnCHKwb5WTNq6hXW+woyk+osv4XI4+i
	nf/o2NnppS+JkMLl1xOrxMjvVHirBcdYkmMu9YI7Len5y2pRp2v19aHRZlR6Ph5f
	gkyfvYO7LzTNC23um3t0QNvDuDuJIr3qYRSP7HgkkjlMmt+628mNI71JcF3HEpye
	dUEu5ltfJnQVrSU4oC3RAgda7qx20KjVjQ0J6zKbZ2k8puErNnYYn9n3fA+SuHNj
	YT7FLed7i+PdajDeJ4/Q+9lp+rb/mzEqwWx1RxjgG9p5/X9mDhwYgDxt0lL+Ddce
	5mjpRw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryffg46p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 13 Jun 2026 04:46:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2beff6b6e74so21829555ad.1
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 21:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781326019; x=1781930819; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WltrxbE+VrzBAeQAuOOkNg0JVKgr8R9KzViSn7S/z0g=;
        b=M4y4chPKbWWoADG8gxhBvRzel2PrX71VDddU9ifRZB4XO29l79iHkdQA5VeuA6N4JK
         Pg3LNARD/pK95HEK4/FJKQXUeATZ46Qc01WM8DCqTfQtjo6xEN1YeUj6bQWGKwcPMBSv
         Jml7FpRekHUQRUr1c8zbBmC1aGODjSQZHzM2GHmNdRypgOeWpfL6vsxcjru9AoLbo4dI
         pvzpYBePoZ7YMPU7GG+JKmZETX6f6LNFOMyLjXz21FV/VLaa1qd5zMU3UAml3TLjE6Il
         4hZqzQnpkeXRtKpE6FPpV+HrKAhzrogCwINUy/GK4xu6i1bP2uwRT5uH0BW/To1Jm4iZ
         FDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781326019; x=1781930819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WltrxbE+VrzBAeQAuOOkNg0JVKgr8R9KzViSn7S/z0g=;
        b=TRSkCGM3ZSHX6s+awcf9ibFdOlqu6zIPcx2FBOl5r3Plo58yWbwm+QSqjDJ7wJ00pS
         hux2wejnYN1R5miCAnvy5AgQqwUb0H588AhcW7J9gQ6VA8MzWsD2luhVb5IK6JgMhhRS
         v93k19YHyrXbogxtFyWFmcDQrL3BgaF3T00/mhTdcs3tjR9aHFp/oxAevlEJDNHJbyVT
         lF3bSEF8flUOnmhwxf3dmYkKg56hF5c2Sc6iT/PW7JP+ZbgQBcdlitkKHefCamleRqR5
         RkJEUf+emQ+HytYs87YSUL8i5auIpHlf9m0gTmY2J+ZulgeCGP9eSyCHNiAIBwPyANMq
         p7IQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KN6p8sN2Pkx/64icnRQpiZhxBHGpQRtcrpWtgyxUNx++14cJdVgBcenNN8f8a2KqZ3FQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6u1SdQxRfF43tPXO2PUYHXawJIZ/855uIRIezu2XpLx4JwIre
	1RfKKvHhsw1SXYRfdAYFtPGmx/SbTJVvNbE4+IGiGJyxQs0BhvW4LQCITYrt1RxmemR1jIyebXr
	sMFy1Wi7/qGugTqaY7AVLuKKEMOxqGF8u1TOk21hcePthtA2AU+l7Azc=
X-Gm-Gg: Acq92OG127ptKGNJeogwOvj+3XFzLCkHdp3o+xHRlkOige6o01n0in7gXrU82i5DAhV
	VS6R71kKJ1sO4spteKo2vXRStfwpfRVs8dZVbTf5RqAYCNcPlrhYAZmbZ8Gh2YhtC+b1YZM6HsA
	SVNnjF2xTdYxWUhN55z1Ko8X+jE06xcaG66tQqzhLxa6i7d596AjXDLOijHOW0uV5Mpn6uGfvz9
	gBp6P0q0gvbs6PJ65FQJUTh+eu6TJiO88BwhvFDcTUqEfjCyNMgXlDCWSuV6h3BO92dXv19LO/t
	4tDfMm4QOsrWzsbOcbfp6UBA3GN04D5OhKxtCuZ1IiZrWtkGsZV+91l7FsTRaJc3tS8JThzn/QZ
	krPh+WYA4HPw9HQtz02l38JwSgwtCTSSzivPyhnqyJQAIRDyYsEA=
X-Received: by 2002:a17:903:3d0e:b0:2c2:bd0d:3cfa with SMTP id d9443c01a7336-2c4110b38d6mr61050725ad.11.1781326018943;
        Fri, 12 Jun 2026 21:46:58 -0700 (PDT)
X-Received: by 2002:a17:903:3d0e:b0:2c2:bd0d:3cfa with SMTP id d9443c01a7336-2c4110b38d6mr61050515ad.11.1781326018461;
        Fri, 12 Jun 2026 21:46:58 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8becesm37162965ad.56.2026.06.12.21.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 21:46:58 -0700 (PDT)
Message-ID: <83594a83-64ea-4c52-b0b7-fd0070f03f04@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 10:16:49 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
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
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-6-ca1936bf1219@oss.qualcomm.com>
 <b10ecb42-0d4f-4037-b786-cc52bcd1bdd6@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <b10ecb42-0d4f-4037-b786-cc52bcd1bdd6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HuxG3UTS c=1 sm=1 tr=0 ts=6a2ce0c3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=RuEr1PiGI7RNW/QBahnYvg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=iljdq1zszXl5pgKHGr8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: J3K-zyFh6iGUQukCT3LjFJSKel1MAa8L
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA0MyBTYWx0ZWRfX5FJ9MPwdOmPA
 NBa2/ueJLloDfPNd6QiD6lkZ8WukwPhPv0NK+NYMJ/grv22KvPHrrcfzJ2ENLtu4Owb00BQWHJK
 GvzDkV3tKpQiNMnikq7aX54yaP2CUs0=
X-Proofpoint-GUID: J3K-zyFh6iGUQukCT3LjFJSKel1MAa8L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA0MyBTYWx0ZWRfX37e1EpAC7AMF
 dOtGUyYxBctjtBqdlakP6GA7PPaSwSSBC6Fy1EKOmR8MQaXTdw2GEJ6PYPsZlOCqj8TQF2wVB+o
 iULQxWGwEgTvClmQk9WehibuvRI+1902dZ2CmCN8+kmLZBb1CDQ4O6+fa1CtTfuwmoxwSBItJzA
 TRkHehsXUN4gV583+B6jRhoL5XZLo6a92AyDEmTTMcEVzpxUsVkVlRX6nxRJCpXRe7It+ysdcLN
 38Gxwqa/soIdEoWq+MiXjD1mx5FQ1AEqJKzZdvq7aOyWn3o0MWT6+/4UFTak49pcM1z/Q6s5iOk
 Hu52TxkR03wZowH/ydPnJI8bz8IPBgNHtMMRRYYb/Oi7YIqEjbnyo4Ha54cYd8gVwfoi69w3xBq
 eEE6RUeNhXekjEUY36oPZ5xYQ2BNQZcWARYqwvG7pnO0QcIZ3c2gMHJ9Hr+M1FBbZvlaaJaR8/G
 8QWN+e+V+9E4sLjTZkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606130043



On 12-06-2026 13:40, Vladimir Zapolskiy wrote:
>> +            imx577_ep1: endpoint {
>> +                link-frequencies = /bits/ 64 <600000000>;
>> +                data-lanes = <0 1 2 3>;
> 
> The numeration of data-lanes shall be started from 1, this has to be fixed.
> 
Thanks for pointing it.

Will fix in v3. On MIPI D-PHY, lane 0 is the clock lane, so data lanes
must start from 1 as per video-interfaces.yaml binding spec.
>> +                remote-endpoint = <&csiphy1_ep>;
>> +            };
>> +        };
>> +    }; 
>> +&tlmm {
>> +    cam1_reset_default: cam1-reset-default-state {
>> +        pins = "gpio33";
>> +        function = "gpio";
>> +        drive-strength = <2>;
>> +        bias-disable;
>> +    };
>> +};
> 
> Since it's a mezzanine specific pinctl assignment, it shall go to the
> correspondent .dtso file.
> 
> It's a concidence that one .dtso file is good enough for describing the
> mezzanine for two diffferent boards, but let's exploit it by keeping one
> dt overlay file as it is now.

Agreed, will move it to the .dtso in v3.

This also eliminates the identical cam1_reset_default block duplicated across 
CQM and CQS board files.

Will incorporate this for the IQS dtso file.
--
Regards,
Nihal Kumar Gupta
