Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5F23822AB
	for <imx@lists.linux.dev>; Mon, 18 May 2026 17:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127020; cv=none; b=Fz+w1cq6+JBitwuigwshotuInZ//MhpMCEe0AdMLm13OGihTkxztw4eJ6RGjiwa8LpZ15VUzJLDVUoaE/cBbg5Z6yGJYqiJS7QFzyqjBggbfRNz1Ywxq3RAMe3l/HpLgOi6Bo7IburOMa3XDFrtgVDKXLVTuU9ozoS63KJv8dMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127020; c=relaxed/simple;
	bh=hveTFc5TuR1bKQ6wXVEDZpt4zR1cJ5gHeLtBc3YT0EU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dks3ybqKraSG1yYk11h2sapoRVWr+Kiay0H1/jp8BskkDhThiS3e7JU7MyNq5/W1WDS9FIKhmVVTYXmuFHI0dluMM5oZLITgW/9H56eBuPlLMkYGlqR6+d/Z8EqymJ4V7Ojy4FIbw/hX0pMDbjGh7b55W/ad8lVxDQtJ8iiKFnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pz/vDsbV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFBRyfAX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pz/vDsbV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFBRyfAX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IGXjV62685332
	for <imx@lists.linux.dev>; Mon, 18 May 2026 17:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MIxIK0Wuilz+yl4PP/k27Iy80ZOIVvKw4mIo1azk82c=; b=pz/vDsbVtXDpaDLA
	RXb0yTPq+pa4kGzKlQgwRXaYiAwcvn1BL+ftJhNufpHGwfK4yh3SnxPA9dIpCmVr
	sknNhlY70m295zXJCEciJNfiZs4/DxxLciyh35IHH+ytoGbFfwAaLy5BwgCUbb+0
	kdZ8jagWJIx9rYTtbBBegG5gHkfs5PLGyt/wuP7kXluURzFbTn+beeLeB8jQ0ZAI
	hpeiDXtFcRoQquLguHhijUX4iTgG72Kf0L6h3+GxcSAchtwHMNNNbNjJjGLVTPxy
	NGbgoWHM7mdwrJo9MYyRG1Fnc5dW8J+6S/RjlCpI1XAygnQl/cqro8IiW0L+VWrw
	A6HXJA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7vrbu22a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 18 May 2026 17:56:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d5d1c2289so83864801cf.2
        for <imx@lists.linux.dev>; Mon, 18 May 2026 10:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779127017; x=1779731817; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MIxIK0Wuilz+yl4PP/k27Iy80ZOIVvKw4mIo1azk82c=;
        b=dFBRyfAXOIJutHjEbymD4RHwnQPponIiH7hHWFzoFM4NMjI347N0ZrvG1cMjCg0HDq
         njHC4hWi2jztjFP9on7o2HjjZOvZjt1xYFcJo4X3dSOqOqKyMkm32Xd4sXjyZoSE77LT
         SP1w49eB7YClkkLf9Z4zh90AVTc2DXYUVMkO9vj0fxBG4b8BR2rHN/9einxfeW2DS/jf
         b9l4fjldnKjohVzZ+V7R2y5MfxgTpb31USsUn9t/uvoLvJlpb8ehKgdCHn/kTc/p9Zc0
         azImJi8uLN1OEpKuOYC87ibtB7eF2cFToaLWgGYW6P+r5LfxpC+7ULpVyuUJr34RnblI
         Axwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779127017; x=1779731817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIxIK0Wuilz+yl4PP/k27Iy80ZOIVvKw4mIo1azk82c=;
        b=WnqqsdMsrRZYxfSk1d6Gg6o2tDvhXL1KhEbfVNxXD7BjS+XHheLbh/g6kcqdsHmjHY
         HA8rSR4z8JKq2bgKNtRKLBxfs8PjnRzPxtX5WcGChs/YRpffYr+d/ZS4vGDQ5vGkPHK1
         JB1dNJgUQKcaQibZSTHJ82KNCVZNSHWopfD6rYwxCVmwfJVOr3niRRVyFm8piJWuni4J
         bl+geJk1VKN0BauhstcUq3wILmj0jBZWZUlCSXbfD9YCXDz+ErlH/2LMmJgU1WqoBkf7
         a36TBJ9cw+7q2mwds0rclbRP+SJlySlJRcSy2XfXBCfBCdvCinHeBx+2Mmpv2l8Qroz6
         C4/w==
X-Forwarded-Encrypted: i=1; AFNElJ+22oeh2AvAMN4SHCQVyMgvsXIOue1URwdRRsDjoW32P7hm538wy/lEdD4fEdH8GCDFtU0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+nwdrBJsDCj1giB90UywS1gcteDuDJujwm16QQzEnpRUFQ1o/
	qsXn426/dSAzWjL4jOyCYAo2D42vkRBlM6RAWgnKOW+HIgo/HrlXhAix9v+BDPjHiupU0iDcNO6
	Q5/MPOyJTbeC4Zd411W06Tze2lFfKpBQOjTUD1UQ039DxkL+E2/KnC0U=
X-Gm-Gg: Acq92OFEUdXIZrNBERHjYT6KlJanSS89yMxGYDV7xFGcnJsH1wLfLd4iLIWBmWTLIHD
	NKDfZzuxTBiKJNFDtiJpiRP+tkXcgauq4Zz52mo+fiWSgvVwsfVsJXJi0nM24eTca7G1JtCrPUx
	+8ZnX1XEtxOw3Pe4xOLy8lOuTAZLo/6cCbadBU/AG0AQwIroF7498LE47A3s57rGfNWcQzV/5Rr
	QTmsl78CkVqv9YSpq2HQ1O/fsGVKH0y4A5gxRQEuHopcHHfXpljjtubLw6kVxNgyQOJ1FAsffiA
	e3vaXmE16nM110DNHNoiGcV+49qL3d0IELf/VJy2tvZkO0F3BlhUYJJXVa9bMu8WVEzXPukdPCT
	dJgh6A7uJI76h9qT0HjjNQDJyzVtVXDZcrdrv3ksYgA0K9xlwSKWmQWzj6kneFZ4TWcOAbRJ9FI
	z7s5chTNrR
X-Received: by 2002:ac8:7f53:0:b0:50f:ae44:515b with SMTP id d75a77b69052e-5165a0df71dmr223765231cf.37.1779127017478;
        Mon, 18 May 2026 10:56:57 -0700 (PDT)
X-Received: by 2002:ac8:7f53:0:b0:50f:ae44:515b with SMTP id d75a77b69052e-5165a0df71dmr223764831cf.37.1779127017114;
        Mon, 18 May 2026 10:56:57 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:e390:12f5:ed3c:ffd9? ([2a05:6e02:1041:c10:e390:12f5:ed3c:ffd9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab527asm299815105e9.11.2026.05.18.10.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 10:56:56 -0700 (PDT)
Message-ID: <1155ed3f-12d2-4a98-bbae-b3dc61846e75@oss.qualcomm.com>
Date: Mon, 18 May 2026 19:56:55 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: imx: do not split quoted string across lines
To: Mayur Kumar <kmayur809@gmail.com>, rafael@kernel.org,
        daniel.lezcano@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
        rui.zhang@intel.com, lukasz.luba@arm.com, festevam@gmail.com
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
References: <20260511174255.215207-1-kmayur809@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260511174255.215207-1-kmayur809@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vpkEGffSEQLpkCjs4cCapMegvttSpEtI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE3NyBTYWx0ZWRfX4ep1bf9aOysQ
 +W5wXDrRFA05XqljXAzSY1bvyWXX8xwyOo9EwekoEznpVlLvmPlB0y3tZYWSekhuCKREk9NcgDy
 EkAkZIN++ybSLt177tk74Ism7g3GOkNWEz8MKjS5DUE6h9ebWh+cTQJcnhYZPjIcT5gSeLh0Jzi
 GGXn6Lz8ZwJWWqyLMQoMB7HUYW5yOMNJ/QtExVBTzE1keV/eP3TTrnQK93NRjJJHliFSp+MYoY8
 nvrVQ5Ky26wydexKTL4X6CoMHSNzUkfY6hQVhAt/cr3DQDAVb7g39iR3roKFXS+XKoCWP5+XrcN
 ptO8ezykelktsAKfUj/mmmOSFGUmbXd+mNTJUoswBOK88L+lMwKV5f2l3PMEwWWL/szRnoRY+Es
 Z5o+CHWh5AWjrsDr9Ag5Lm8yw97FkVA3OKBFglGB80RVETs2fPrLpE8nRgFlA+ZD9vpBGtfp0g+
 niiQFd2Y/7dUd3hDOjw==
X-Authority-Analysis: v=2.4 cv=KZ3idwYD c=1 sm=1 tr=0 ts=6a0b52ea cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=fjfue5pgiGPxETPXDXYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: vpkEGffSEQLpkCjs4cCapMegvttSpEtI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180177

On 5/11/26 19:42, Mayur Kumar wrote:
> The checkpatch tool warns against splitting quoted strings across
> multiple lines. Join the dev_info message into a single line to
> improve the ability to grep for the message in the source.
> 
> Signed-off-by: Mayur Kumar <kmayur809@gmail.com>
> ---

Applied, thanks

