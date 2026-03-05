Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E2237C921
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704936; cv=none; b=HP7u82eGgf+JBAooEqbQCh+U+x6stW8JCW9L4u3WITdonhtANW9e+se4dppiTkCYnHt/nT7ErUaxIQY/17VphzTKBdQID0Odw4WeJoQOIbYaUWHWZLnMwkFVilHvs/N9DSM/zhVoANd6FMl3JeKAMS0QHr+ZTiPWxg9S7xlNa5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704936; c=relaxed/simple;
	bh=sdqAqjrVvRH62b9KukgizTgaTiOnXZlSQR1sQ+H8r9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lcv3IeqEd1qSCFQEdDaZ6sv42ukcoPCzxUAsaP21OXDyjQ/6J+2JRhk7WQBkeQmDvW03czA9k08PfSLCraD28+MYazf0F9jsQQNPx832JZoJrCD/zKdp6Wr3jHaOAf1m8rIUck/kE5IM+rutYc+1DKBBtjFotHLiPKIpvD8LPx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kN+AXckW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bYvD/3Uf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kN+AXckW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bYvD/3Uf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6259Dok4021001
	for <imx@lists.linux.dev>; Thu, 5 Mar 2026 10:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=; b=kN+AXckWrGaNHZZm
	jf4xSJd0s78PHX0x5FJWfoVPPXDSDLvHXVtpa+lgGAbrzrK2xS6zVQ8NakKmGYAE
	0Zrfiog2BU1++B7ORhtLrcHsBEwM7UYh4w7hsovbto/u0NFLFW5u93VR1M1Ryyhu
	+WtN6Bd5Dh+MC6fZk97UHDvrhnrAfFmWFS5e43T0BhqqTmPzgVXdfQk+FWZ0Ddjo
	W2LjCX8ckVom4jsE8Gpt/s0IKTv1RVKN1j90DT8bmHL3VDLetzptu6FCsjg4J3JD
	Qcv0QjKMIM88rHxsDoFHi1hX48xX3mdtVErfjjS+AzLxCnX4Iq2Yco8qfWXdlH8r
	+RrkVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptj896-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 05 Mar 2026 10:02:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cb31bcdso580009485a.1
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 02:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704932; x=1773309732; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=;
        b=bYvD/3UfmTjl2BE0wSYWsghbVtrFHdKN3969YwH4whvKJKM1hf94V94C5Twq+JSeFp
         8nejXmwddIKvN61f6siW9MDW+4nFpbE2E0T5cBxlJBL8ML05r+l/3ebdGP/YNXvAwZvq
         E7EypaCXuOUtNx7h9AGTaz91veOQTIfsgy3DqK1CDjDmY4FQWUMKR1RnvmbTUD82sPLQ
         ZH5R6QWC90EYVYkMyKWNp4WnlAlLIEN9t6AYSU5LrF30Er7nfYvO36OJVWbBxeGCqmzG
         RSmPSZv2YOfcalkS3Tzw2Yp4y3HmfUQ2MiaGVr9QYwoWPwB5vNUCf+WbfmY7BzhGtTci
         TUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704932; x=1773309732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=;
        b=ow1eThzNV++oLtaZoV2Ksf4kS7Ogbb/XixuFy1dYutvGS/zgbUCUE4jJImqMstJvaS
         FK+TTbmwouZSXlceEGNIQkaVWaT2TlJjbEqHrmRwpWCWaV3EqN9fIn+gu7fStfWFsuZV
         WPluBcU0IRDF75g6xU+VqWogZdi5g+dDJR9Vm6tEAdOd27Y3QY4m8ATvu9fqw3HddpzW
         J/4Pv1ooLTrpcF9xYQ7NrtmtGq8mQvYAKpI6ueiiwBZBMd1QW0L7mjXQH4vRCXDmMueO
         Ap7NiAxG/FHsYQNWlbNUs9FktX9r0BbmgZCC2e0TfVLUibxFN91PL9i2J74VaGq1ZJAV
         zdDA==
X-Forwarded-Encrypted: i=1; AJvYcCWE45vWrM0KVrG3TURoUF0AOYK4VscqKYgFEFHvjHYZGUtUiWww0TJ0RGzLPMaK/f4q/ao=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw942LO/+C382VPxNVckFgewWUsgLGuzDltEOkmhkgL5dJ929Xp
	AT24BkRCPPYnoBdwCcGG2Vp7n3Ix/nj9p+tzFGTa7DcjK7asFdDFK8blFwts6vRskhs/pRzt+KD
	zqhb1Lg6suyiHyTkNZjjMghT50lDsZgdcbCwqMvZnVMb9/1/MlFs5MQQ=
X-Gm-Gg: ATEYQzyHXfT46B2zFSjzGZAutQ9pfOV29GmXg3qHwGa5LY+pYI+g325kCy9OA289r0E
	XJi9yg/NtAy6pViaEXcyDtwQ1toREU2CBrzO11Cf+02xHAsmU3mpseTco6eY3E55m1/PnOnKHga
	XzXU9iceZEA5cxkqcLVSNnBQAYdMkDcJL+uSs1VSgZYX/9iG0uWnaLyF0ehSTq0W9x10fRD75jT
	cltQ0s6WCD9Yk/0OjXOLg2H5bCEXw0tuq0FMvt3jC8uNJlMjqLzlRf9ItfCvNLFJ6YWzSP/NiBe
	wdxZw2wG7y/aj4ebRZDM0+1JW3pOoeOBzoaYMNLgNe1XtGcu3iDdp+/glSDAB/qGEyL96Khw1kG
	6wQWt8OZitn6WJ4GCexJLaoMn4Kyl87vgbgc4UgwBWkO+fNi2MWgsWjTbTsCCtjXJQiAqmJXYkf
	jviS0=
X-Received: by 2002:a05:620a:4014:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cd5afbef4dmr443241585a.8.1772704931660;
        Thu, 05 Mar 2026 02:02:11 -0800 (PST)
X-Received: by 2002:a05:620a:4014:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cd5afbef4dmr443235485a.8.1772704931010;
        Thu, 05 Mar 2026 02:02:11 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aee3ab4sm870864166b.61.2026.03.05.02.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:02:10 -0800 (PST)
Message-ID: <fd00e0bf-7b73-49fd-a2d7-1d4a88bed5e7@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:02:08 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Drop CPU masks from GICv3 PPI
 interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thierry Reding <treding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
 <226c5d1005a6e295e0581b2c89e5510dbb7aa9d1.1772643434.git.geert+renesas@glider.be>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <226c5d1005a6e295e0581b2c89e5510dbb7aa9d1.1772643434.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MCBTYWx0ZWRfXzOd7Oa2wHvRj
 IRa7Ve91KybUqt+hiMlXPGLZl9bsT5+zrqpFapzG7pXS7t7+4adLGAjgjRhNViug6UjrdBsAN7c
 y3fqLMMzNhn8wMqrspfaXcwFNLz8kNEtHf59Wthd+z4FtuAyMJv2Xm2gX90/aWD9KiLg7hvg2OK
 0o9gncisDe5DakZza8WAAYBTD2/CT3nQnOuScvE9uJX3utDDIofKxWGxX7d5KpCPvt3lxmZV7IA
 vALdWWYFthPL96JUzQ12WkRzNKAAlb8rv/zohDGf7AFI1fog2B6+Mmzv7w2T8U086rQGlYynMBE
 UO83mJ2P+jK38A7U4wDcINr7W82oGuJGR3fZ0W2+ciaWWViR0O4YmwiaHuAnUhH9rXbmu1FfjiR
 U/oGtY1noqHLNvGcWGAOyn9GIP2nm86BDtUcPmNcF9puDMXuEpy7Bhvx13lu55VfOAOEYpqxIb9
 0hcZ3k7+paQGiT2rlyQ==
X-Proofpoint-ORIG-GUID: nl0ks0KQ8M6U_ket8vTpyHMg0K3aNPqN
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a954a4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QiSWx1vRvZ7C5zKyDnUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: nl0ks0KQ8M6U_ket8vTpyHMg0K3aNPqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050080

On 3/4/26 6:11 PM, Geert Uytterhoeven wrote:
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
