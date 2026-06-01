Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBA83769FE
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 06:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296295; cv=none; b=kS2+kTT0b8lAjGdXvo1mVof3e9jHBT6iTBYgoM38zFUwZSgt/EZ/VBYuK1oguqzs2kkKm2Mz2/C1auZSrNX+iEbN+Qk73GFYEeLcl67jIPPd/QKXx+4PaAg8m8vFzBEoD+Hsq+YyO2pH3/5JukIWaPyx5ozLwa84esroD6Cyqfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296295; c=relaxed/simple;
	bh=y0ohOQUQsQjKkW0i8jiRyaPm1625hq/EctBCh4wmkjY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=igzJOM8lJTbqJhncKzb8I5ic9zwapOO/IFGhCBy6tXRmrnG3qbAjWhHTBOO0AUnj2ptn5wQwTykyGBKb19N/S2yHXVp+/k+eXcDOvmilxCtPAiaYRVWgbefuqgY8U/25sz2fcvimxmzSRCzYo5WAJno6ppJaCLdF+KHPt3/hQq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TU+FSvQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOBMsZmz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TU+FSvQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOBMsZmz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6511G5xB431491
	for <imx@lists.linux.dev>; Mon, 1 Jun 2026 06:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YReajiWcbAxJMnTTWrrh4k4vj1KQ9dbj1wfAMi1XLpA=; b=TU+FSvQT2edVb55V
	Nry2/mRwkVZb3mVd0wwM8wR76ihIHoEdAZZZN7x2kdQ+f3VcBMXjPd8oYnfluC0a
	1k75n5F1ZRr7SOwbZHq6JmarRR7aklFuF2kSLc/IheXzjgYP88mGh3cNgu8kpTWh
	5Y2vrsnXYghJOpKYstVqahN++SwR6/8WsESZaELCZKdGL0oqp9+rNdfBnIKGzmDt
	ObopznuiINieCCxjglsyKI56RT3hRYPqapeYDL2QKwuOj/6Y2ChquD2/QKeRWOPz
	FsZKQer/yYRTOULRB5xkWUT2dU22XXio/Y2y4ekSrqqzD0a6PBB3Hxzgjg92weoX
	yiVOjQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8ppr2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 01 Jun 2026 06:44:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8592a62f32so901966a12.0
        for <imx@lists.linux.dev>; Sun, 31 May 2026 23:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780296292; x=1780901092; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YReajiWcbAxJMnTTWrrh4k4vj1KQ9dbj1wfAMi1XLpA=;
        b=MOBMsZmz6U9IuvIDlJML9wcQL9q4RWsrDiePLyGp9ZVZCOzzsD0bmeZdHILQuiqq8Z
         gnHutmPQ+VZsZk509nxR4XARj40GthGNpHP5DJiuY2enEGb7HluWSRfkaWxMQVWdbwKP
         0UrclcYCzwe2AU7TXEpEvVnE5ry3FcDwIplBvfA98mgcxP/H8AGXvwQe3x+rTueSJUt4
         O0rqdgU7wDTHCMYVY6d9JAjsNrpVFWrOkAASaT1r8oCvN7SgDAdNdGukK+anXt9qsdI8
         RDbf8RqPtAs6zmHrzFGnyAtkkiiP6jY3de2fXjZiTz5ggUkra+R+dGhMu2Kq/YwB3l5h
         M2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296292; x=1780901092;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YReajiWcbAxJMnTTWrrh4k4vj1KQ9dbj1wfAMi1XLpA=;
        b=DU7RgQExxS418N9KZ3FZ7XBxFhrYnznYcMM9xAKt6p1iJCITPFvccqIxQpFKanGIC8
         w8YdjSQQVfAwtnJraGAryOyIwdDtSBaGlEXAYwO9cB6eEGxlbav4vqVdb6MxJt7eQ6kC
         NbpH9TSRCUKDhUkFiBiijywaroP4phuHgdCbsDevGE4mCnXNTRdvLG4cvbtaKGbxTp1y
         g9QVB9IyyHDTvLdQU5FjTNR/ItSwrRBw9lXVYbXJfMHFNsQEdDP8fn931ZS7kWuzFMQ/
         8smsGHXgecQy/SiWsMOzEdEo8W+EQTlc7C58g7vkyTbAXpmv55U+3/Pt5NT+75u/NBkV
         7bYg==
X-Forwarded-Encrypted: i=1; AFNElJ+7V6qnObwaaGQ2fs7rngBvwjJtHgwgD8CXAmvT1x297wns2Tv/fCuSFjNnohwG0JVj3G0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJUedAKLQF7KkpGQX8VOJC7OVW7CdzlKkX4tyHk+eSG5e0fuCQ
	+BNuRVa8/m9VjNANW+ybtsHUeyoXen+xY4rnEHP6HJ5sf2/YusZMewu69zRZ2p7r3a/wdmNQddx
	0QStD56aqGpLJFYUiSbSXB1p3JFXyHm3H3hwIv0khsCUGy/b09NAhp/0=
X-Gm-Gg: Acq92OEoZ/38RehVRi/JUBj/wOW3O2N6/1881Z7ycc1I7d8/XfZ5YoA4kcWNA1WuMaz
	i2B4Zmk1ixrF2RWVuPE/hUsF37zkNgidL6jDfCFQJm58NMusArmMjiKjZznH1rrWY8m7YhCIaSp
	bO7ktong9lTv+85+Bz9BB+ES7C3Bd273q9SAbUKXmpf3tIgL9IZGGJYtdMS4IfSeI4zEkQ2TT7s
	cKUcOMiOcfaQltg6nT+5GW/jDXsozqNZiuDWJNE403MpAr2RYJICm7KR04HlraF4+dnkHhWYTk8
	ewQnerX6GOSl4f2XpOnDcZHjip1L+82oMFCjobbntBX6DjdkOan5bEmE3hMelQmvlWO1QxDjoMb
	/AjhZ1coze2oUBgrZkWtOSqUtszylgmNBoZFV3GLVziDk5GPgWXGYoaFfZ8AEmQ==
X-Received: by 2002:a05:6a20:1c8f:b0:39b:8dcb:f37d with SMTP id adf61e73a8af0-3b427eb0f6cmr9977804637.17.1780296292508;
        Sun, 31 May 2026 23:44:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:1c8f:b0:39b:8dcb:f37d with SMTP id adf61e73a8af0-3b427eb0f6cmr9977746637.17.1780296291949;
        Sun, 31 May 2026 23:44:51 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423ea48bccsm4142372b3a.13.2026.05.31.23.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 23:44:51 -0700 (PDT)
Message-ID: <145b763d-49f1-4412-95de-76c22a81a728@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 12:14:43 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 1/8] dt-bindings: media: qcom: Add Shikra CAMSS compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
 <20260526-shikra-camss-review-v1-1-645d2c8c75a7@qti.qualcomm.com>
 <20260530-lorikeet-of-strongest-honeydew-fd9b16@quoll>
Content-Language: en-US
In-Reply-To: <20260530-lorikeet-of-strongest-honeydew-fd9b16@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WriAE8WxMFaNA-CWbhDvGWWMgyl4t3Gp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA2NSBTYWx0ZWRfXzIlkWfBfKloc
 dOKDyN2Qm6up2cyCYWu5NED4xC1BXtSnhEBFuMKVh3V6qNWtemnIGkVG7Ho64BM8D8+5A7xMZT6
 GqeF0Cs6wLBN4OlSryfxEDlf9tydqiSQyY3JHi21D99GBhKBV5C4oidVeY+92j/3i521MRwcvjl
 ffVEgVbmyJna57NTuADnXdoekCBW0wWqiP4xlKMrDYi2rqGF4pxx14MfkhLQG8HXe704VJMCjIF
 BmWUiPHY2ujuQIKzwPXTg0EzwB1FLcDE9wYQCRb1PYF1fgpmGyvG3T3HxTZF5P8WXUWhBu+QbKl
 jwQzv5D+atNnKrEVLfzzjnr50u+im4dE9wP6h4PweQNksfJFOzzkGBvScI7/q+x7N0c4Vdv6vc+
 46TJcR/f3l+BNzZAgZNpzZcDmIl+es4CD0snAsyaDNhJPsKmtuVLaT3gcuwwMSosZ3NbHQvTVJE
 yNY1Slg6ZSfsCnMdhgw==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1d2a65 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6icYdhiYefjo0O0wKhgA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: WriAE8WxMFaNA-CWbhDvGWWMgyl4t3Gp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010065



On 30-05-2026 17:04, Krzysztof Kozlowski wrote:
>>    iommus:
>> +    minItems: 1
> No. Same feedback as before - you need to describe now the items if you
> claim that there is distinction. I already pointed this out to Qualcomm
> at least two or three times.

Thanks for the review. will fix it in v2 by adding per-item
descriptions under iommus.

Regards,
Nihal
