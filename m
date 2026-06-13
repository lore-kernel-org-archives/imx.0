Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62506366563
	for <imx@lists.linux.dev>; Sat, 13 Jun 2026 04:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781323812; cv=none; b=CIOY1DdCqZerYgTV/P6dXs35UdQ4lr3wBzmk2vVWZPeC6bBQUorI7CgER07uWRvTUom9xea/VAMQdI0qFKfFr7Oc5cgiHzroowWRaxZ7EdaLYOa350kjdJ6h08wJ9MjhDDYGmu2/eO6+zSi+t6I7gcyoiewbAQXWR7eosaM//4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781323812; c=relaxed/simple;
	bh=d+CuOuf3ybPVo31Duy+EpOGsQqxm8eNmSXH5RxEr1bY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/nR5iWa/AuO6+MWYwDRY6ezm2Dl23niZH6nUVK5Ny81y9CdtRlVXnutATiihXFp3akvD1M8dkLKi9LCSv1Jim/u2vhSrVgI7h70M4cjrY5t4R/6pWrR+6BbaH7OVfGZrrWoPOoMQUXiKBLwWPTptrwNa5fBM2feH06dc0Ar4QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EjX4XkRZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LiequQAY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EjX4XkRZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LiequQAY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D3bgU24028652
	for <imx@lists.linux.dev>; Sat, 13 Jun 2026 04:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOdBZhTf8TwFyLRvPPm9OlEuuyxWqmYYuZEeSSpKiKE=; b=EjX4XkRZpygOmsXy
	GVaiA5BwdOv/Yb3hrVzwo6/qftVVOstDIcAxtEZgO+E6ImFeQ+bzCsFcfTccR6AV
	kHimL7q90XgU6hSIS5504E9F96Z8mGjWkvrsDI+3BgZdXNC38eNugMbNzH+BSRSw
	e/Xt5yLFD16MFYPFBWIBifvMhxWx6VuMBVe1jvY8SIV3WI33lCE8RwF2ER0/lFhX
	2s4krj6Sno4qlFdEvF+nUNz0wpzBdaY0KrhVSCAT7m5J3YoyYU5sgQkU30lACJWS
	tjLeDzFbaV3WB9e/tV8PvwndhzNmm1ARSDRGQfsBFBPa1kONhe2RwHWAK+UZoqi+
	e90dQA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryffg1sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 13 Jun 2026 04:10:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8422ca754d8so1242643b3a.1
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 21:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781323810; x=1781928610; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOdBZhTf8TwFyLRvPPm9OlEuuyxWqmYYuZEeSSpKiKE=;
        b=LiequQAY5vy+JImgucs/j3oPIZy5aJpm5Av21gxLSvLK8H+w8gNOwegBKsCo8siwqe
         g10DvmUr8vVuAglnGM+KV/UWPKOr7uFBW1OGSA7B27QRFgnYc8unCf5kcCwq6JQIixGg
         6sirbnBQnK85x6C0AepRqu7hKpL70gs5tloP/xRZBzQS40pOz3B7B1hXbmWN9SUMNxuL
         wiHPPazMtXni201Bvorw52TKV0BjQV1v+zemBcWqG39gQUjpt+7WNxpUjV816PkJ42cX
         OfQem7s/RR9uh21fJX3bCw7koKQHlyl1dE2Fb1Rwoy9V9wpk7Evkq4F9wKUAgeuePYJV
         kj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781323810; x=1781928610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOdBZhTf8TwFyLRvPPm9OlEuuyxWqmYYuZEeSSpKiKE=;
        b=YJcWFbK7de2wIdJFpybfLHrNGhC2mZMwrQoJAxJL0RolGUcO3SwPVDVUgOheFqYsfv
         qXSMlP/z03nb7dlqCW224QeQTEIvMe0g242eurj6428U9sxN4B4dbJBl0jsNlLn4xFtt
         QBe9ZhNvrL+gVtmwvv31q2rAoLsm0F/lDnynXO8t/lI0kSmAmEd1GT7bVlXkMPFubGhX
         SzPbchMKYvN9FSqkCNisRxc5bkABeB5G6vVYYc9yIHS/OcHtKKc5+zewA05YxmybZHPX
         MKEvlupUkyJKLPs4h8h5HEe+RJCWwiZltPZ5H8+TU+YTcCEqyOSs4R1YeNiC1Y/UbvTt
         k8ww==
X-Forwarded-Encrypted: i=1; AFNElJ8dsOrQ5KaZA/ns4nUckva5mmLg6LFWw2Se3NE/MRNAOW9AwZ3QU+iycE/Ir86+P793PYg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2cJB5oyh+azsCeYtBKYEIfFBRwgar3EuHaSTMI8NJy3cwAepS
	Jc4efCgBs81Hyzg1dPB+q2gfeRsmXDAyFwsuDX5mNiV1UHcMvziJV1M01eAh1GSh7R7cZx6MmsB
	Qk48ouZJm2pkaOkY14iIxkIgyH7d0keWlf1D/HgBEWM6/VzdOpSIVO78=
X-Gm-Gg: Acq92OGoxkHNVOxyiFtiE5d8nEZ3wBP6UbEWVFuD2xiKRtx+tWPG2CmgcxdXWdpydDN
	cYyjy8opoVZDibZJnLQm4ZYhstSGUb83fsWs+pGCIdfEk0OQLPANbgDd0Kw+wPl5Zjt0l4q7L5X
	jnCZDc3fI2x76d1u2x/zcczO9Mi1qGn/nVYCx36QKqg1qrxvb0pdQkdqMhrVL3m0HGrMezY6cK5
	rzsKc7ykyPx2gL6tc2KuKbzJBSyXC9VOcRHlN791/eSayKFEArMRVmHtabrgyhxX/uMuYx+HtDj
	Ln2P2dO4QpG2YMhh8OL8XCVNOmr8Zt6JUDVSwfvH7daCi+w50N/BGdtJkDO1RlvBk6tNhyl5Tw+
	iTp8hzC1TpFVokh93LnGjvXl4PuPZa7s/caBmlaCKSgPBJt//N+I=
X-Received: by 2002:a05:6a00:1483:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8434ce95f96mr5902250b3a.10.1781323809821;
        Fri, 12 Jun 2026 21:10:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:1483:b0:827:4bca:f1a2 with SMTP id d2e1a72fcca58-8434ce95f96mr5902220b3a.10.1781323809366;
        Fri, 12 Jun 2026 21:10:09 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd100esm4480992b3a.34.2026.06.12.21.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 21:10:09 -0700 (PDT)
Message-ID: <fbb00150-e3bd-45b8-a87a-100ecd235a46@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 09:40:00 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: shikra: Add CAMSS node
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
 <20260608-shikra-camss-review-v2-3-ca1936bf1219@oss.qualcomm.com>
 <3ec2bd75-4d88-492e-a8c2-b21000ef2afc@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <3ec2bd75-4d88-492e-a8c2-b21000ef2afc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HuxG3UTS c=1 sm=1 tr=0 ts=6a2cd822 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=RuEr1PiGI7RNW/QBahnYvg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=HRvYZQSnNB20PN4mEw4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: ZADDhHmelkBrfF2R2MuwLFrGTLpUGKKk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDAzNyBTYWx0ZWRfX+jAwMV7cIAkV
 /cmP8rCyiAajvaU8gbLz4LC4w5Goh/4rm+uGzG9Ymtb7L0YnZxY1Jr6kn7WZaanSZyEiUDmABg8
 edBLTdHwwpjkM8z4W4vFUGkrhTeK4bo=
X-Proofpoint-GUID: ZADDhHmelkBrfF2R2MuwLFrGTLpUGKKk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDAzNyBTYWx0ZWRfX7/zByN6/daet
 0ZQ7uBxlYAtkEsA3WKcnIvxoIt0sjHGuH+daPNzuXnzWD/BZDLadfEjBy0NSfg123fFzQvu5smb
 zHZS3mhA8Smo6FxKt3epWgzRuDwtFDIwguC6LCI7JZDAYYHlYYcCfYS0WmRcPrOBkVOOBNzflOQ
 4p/LqVqAyEP1idM9SrzHwXZ9mIvS20C3yddhm5PXsZV+JU/WSEtLcCpnh5GBfV/BMreNXe8dnDV
 y/ZQQ9VHXYKHBMUafJ9Zkhs15caZPu/opJkRbRAmuttVfl1yz62SOKqFoWcaRHxE1At1FV2BqV4
 tIpVPx9QsMGRMzwO+ME9POcD8OEn9rodLBgzpCqifsfAH9PkbZq2gESPWJDIOmK5GmDMlo3r3Io
 Yc1pN1EEdvb5K+V+A8g3Xb7nPNMJBtXz9EKaveTyorycm9kiweFBU5IIzps6LIaVK5swSjTw8Qb
 CPik6tkQz3HpxwRk30Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606130037



On 12-06-2026 13:26, Vladimir Zapolskiy wrote:
>> +            iommus = <&apps_smmu 0x400 0x0>;
>> +            power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
> 
> Please add an empty line between the properties above.
> 
>> + 
ACK

--
Regards,
Nihal Kumar Gupta
