Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02312853F7
	for <imx@lists.linux.dev>; Sun,  8 Mar 2026 19:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772999472; cv=none; b=pqOdNUy0SZYLS26bu0FWWl14PpF24HeiwMLKArf36cGMxeNF6fbgsUlgEioVnj8TznW6FDw3yJDs5dsxJh2y4XfflFyxIMm30pX3r0SYpBuHSjb66CHMklcrcgrp8RCZQqU+LljnEkIcxKkm5M4M1FGLdLzB6ZfVY3TjedyUYv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772999472; c=relaxed/simple;
	bh=9ZrpusGOEhqmeSXt0AU5Ea51H8WS4+2wSHXztAX8jy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WN+VnPKash/weYpH1Xu+K0+o29+FxZSOyClevTIvPgf7N8FivFHj81BtJoGUnrg7aY5SQIJ2bY7atabcVjMBAnrCILl0X0PHHuSgIiJ8ITbZ1ISDhKsp8MYK3IAxoNv/Y0gA5VWHIaKgtD+3j0/WyBdotnqAdWpU/giiiOOVbHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gGzXN73S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/JUzryv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gGzXN73S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/JUzryv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6283dkUl783028
	for <imx@lists.linux.dev>; Sun, 8 Mar 2026 19:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79xZZRDxRUZmFN/ScsbUTEulHr8w+sHYp39DIi5RtUo=; b=gGzXN73SQvs9FalS
	5KHr0PqdqzUzJ8UyLuRhVKQ18n0bt6Kqq03IGZqJaTSdIQAMYWXtfYcd1q5l1yLa
	BdQ7GeASgfJkEWOdXh9/tgldplLFayMonH5DaTwIMJEkFbYd7xpLps2eicjjx46g
	UD5PAobnm+Nj/6d9YDeMi19ehQd5ASxuOQmCaz+xEpT6GGMRW5DeYJ0NA+EPJ5Tw
	mQ9QhRYcYIxA9hQrf4M8Fkz7asTANQPfXt0aCqiSE1w8aYnJ21oyTD7cvJIiiU/f
	LpGDQrneMLU/8xmTVQ0VBi+2O7+Q96Zgf0m9JM4FRtFX93haPO/HYOq4Bg1mvbfD
	vQ3qCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc83b17x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 08 Mar 2026 19:51:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81506677so421692185a.1
        for <imx@lists.linux.dev>; Sun, 08 Mar 2026 12:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772999470; x=1773604270; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79xZZRDxRUZmFN/ScsbUTEulHr8w+sHYp39DIi5RtUo=;
        b=Z/JUzryv9tgAwas/jOk78jUCAK/nUhu4RxAsyXxdHfCGb+K499clhaThcpffJcngD/
         Ib6FeNnu4C2AovUrW9AZWxBcOXJBTzKd1r4WrFTebQPRlkaS8eYEgAY7ZZLbXW/XbAPh
         GG627uFo7LtDWv1+eHsAI2zK1G5AvmhS4WvUDanrerdesIEcl61dXZp0lyuJu6OF39rD
         HTX3RrlMoSVRPwz5CPxg4uv8WKpIloG8o3JXHPMknk71H+GAMXSuFODmq3oAYu+IhhEG
         9ZOUYgWPNV4ZFYblz4/EwiFCWF+073uwNp6QoqWbw2Lkp8ghKWeYQKey2AkrVuRiIHbC
         JkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772999470; x=1773604270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79xZZRDxRUZmFN/ScsbUTEulHr8w+sHYp39DIi5RtUo=;
        b=ab9NsXPpPSwqx4yRjbQrnbc/8HD2u2S9W1lOxyHi5VfiCGnHIvMtsAUqLkmF5+AlWX
         8xeYc8oDDUmzgwxoadVgRzU51bcBoVMcf8nRCuBI+Gfyohs7ODhROR4X4EEcfjpj/eOz
         WUNN5yVO2/0M8nOhr5o8fwjBNdZVAoKHQcKDtzOX7KUzVXNTAE5D7HIfA2PnNo5QjOPW
         YH6upoHtPWdz92tsnf2SLOvfZka5geiG27J0OwExNqTjoj3uWNNX+66/14cBaaIYs2my
         BBN2GhvvieyU+KXblUE7OZxcGd7DW7n/inWl5oHjgpYpQDTvpHHs5XQ/3e2qb+pMxFdW
         Yheg==
X-Forwarded-Encrypted: i=1; AJvYcCWGIbhnw0JAxdyU+6mcGGvXlEs+yrgOzpAyXH4i81bBcX08WEd8fV5dpI+B6gBk4nempjo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIe7Tx/dW+I1WDPH1HBv4h6JUaqT+vI/ljq1tGVzVMpd5jlrmT
	KzywhADixPUgEuv0+W5rwRNmMUtzHmG7x2HGIRcqesV4A7wShKceZj9bxJSdLWr+8CbdW8a8QmY
	1obQ2YIflFdCksukJyQqn09e4bPW5KNOQrcqv8c97NY/hB5pQH5QAf/I=
X-Gm-Gg: ATEYQzxTCkxqGHc+eG0NQhl2cCwCI6M994dXHZ/WxNmj8pQJKHOAL5YoQUGjdaaV5AH
	JulKk0tDpXDvrkoIAKGoAzfhNNR9GEcoic2iOaR9iDgMgh9SraRcT9ufV8gf0Nqd9+C3TbtpyhU
	6qYPfLBzyN+u51v1fh0Yj/zzJVmADdvjLz65V9LZ2nbqCCR4F7mH1vQh7sN/14iRFMrG8ZYn/1S
	cvLb35v9xGpPmOJqBI8tB5HmzU0N9Vx/y8O2yDzBpXzEnK5KebwiNAIMXzzXwEAPqAlF9laX+EO
	4G29r4EShkFd86sKsFnYuttPCWJhra7Ro8eicW2hZyjumfyrD0MWY3QRdsbpf2KGmeK7BX/dDL+
	utjOk5J+p63yRIw9YLF9mxrvgQRB91s0Env7mnaWL1zylTduGRuoFJAUir4aCNJoanvWL6/ho1N
	/hUWO+2rNT
X-Received: by 2002:a05:620a:4723:b0:8ca:1240:4992 with SMTP id af79cd13be357-8cd6d4f9cbbmr1241001185a.47.1772999470057;
        Sun, 08 Mar 2026 12:51:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4723:b0:8ca:1240:4992 with SMTP id af79cd13be357-8cd6d4f9cbbmr1240998585a.47.1772999469498;
        Sun, 08 Mar 2026 12:51:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48536b5b3absm21039905e9.32.2026.03.08.12.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 12:51:08 -0700 (PDT)
Message-ID: <6255aa0f-529c-41cb-be32-e5d54a839125@oss.qualcomm.com>
Date: Sun, 8 Mar 2026 20:51:06 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek:
 Convert timer-mediatek to a loadable module
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "tglx@kernel.org" <tglx@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
        "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
        "walter.chang@mediatek.com" <walter.chang@mediatek.com>,
        "jstultz@google.com" <jstultz@google.com>,
        "amergnat@baylibre.com" <amergnat@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>, Jindong Yue <jindong.yue@nxp.com>,
        Xuegang Liu <xuegang.liu@nxp.com>,
        Greg Kroah-Hartman <gregkh@google.com>
References: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
 <20260304081207.4030882-4-zhipeng.wang_1@nxp.com>
 <aaiByowtXrTxPsd7@mai.linaro.org>
 <AS8PR04MB84206CF559371D3966653F8EEB7AA@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <AS8PR04MB84206CF559371D3966653F8EEB7AA@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69add32f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=upsBVkoUhz0hqrFZ6ZoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE4MyBTYWx0ZWRfXwcGMR+0f3RTx
 tq9cdIK2jFyx/tIROz0B2FMyrZRPxtiaaGatbHKHM0iTzNIvD45Rr36Wt5LxYKqqkQC1qspCggg
 d/ZudNP4wkKMRjE/9AX8nf2+SjTkkuReeochvAYBco0fI4bCBpJ/rSEueOlIYYXV4ON5bMZBfL8
 Z1SnIwpJElD4JExMffwqTcds9oDBVxqIkMWC4nasxJEfEQKWxF7b47FhE+nGlFTc+b+/ypG/NUy
 4h+trQE+97oa/V3gwX6b0nYENcLx91mZCUXXj/1mAhDch6UIQ2SkvxSUnuakryYsrMZqGQAsFZf
 C2KnimFd5VzDQEuUgC822JICKpKFwrD16/mdbKt5LA2Jx+s1qX4F1KdxvwvY24RBYS50zUFykJT
 yHWOd3m0RcSPxm6M/RiOE/Ed95i3djWS27QtNkLt+5u9okNHG+UFABGg7QSZlGXwkr6WVn6+VtR
 m8K3jcqQHCv/ToiB2cg==
X-Proofpoint-ORIG-GUID: jI3DkjsFN2r3RsOGeG6XXlMarQZv2Dxa
X-Proofpoint-GUID: jI3DkjsFN2r3RsOGeG6XXlMarQZv2Dxa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080183

On 3/6/26 06:46, Zhipeng Wang wrote:
> Hi Daniel,
> 
> Thank you for sharing your RFC patch. I think the approach is very
> interesting and addresses a real problem in the timer subsystem.
> 
> For the MediaTek and IMX timer driver, I see a few considerations:
> 
> 1. Current approach: My current patch uses the existing pattern
>     (similar to renesas-ostm.c) with #ifdef MODULE. It's simple and
>     works, but I agree it's not ideal.
> 2. Your approach: Your TIMER_OF_DECLARE_PDEV approach would be
>     cleaner and allow us to use devm_ functions, which would be a
>     nice improvement.
> 3. MediaTek and IMX timer specifics: The IMX timer doesn't require
>     early initialization on modern platforms (we have arch timers on
>     ARM64), so it would fit well with your TIMER_OF_DECLARE_PLATFORM_DRIVER
>     macro (if you go with the two-macro approach).
> 
> I'm very interested in your approach. May I ask what timeline you're
> considering for your patch series?
> The reason I ask is that we're working towards GKI support and I want
> to make sure I choose the right approach.

Well, if you are willing to collaborate, we can start right now to think 
about it and propose an unified solution






