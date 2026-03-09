Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC64A37AA8D
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 09:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049143; cv=none; b=LthatmTPE8HXgNA5uMCryKgRCMJGqoLwuh+2EDXEXh4dQhVbnc/PR6QBopMKbRCqFekuI6cVq/DwxlNtKi2FM5qoMvOQrQSVVJ2gwjsiDvAHc0BY2rd6GbHY3XJTPnHufGtR6n/tMMndGAZ71bAWXawf+775f0JGBpQfbIUqqfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049143; c=relaxed/simple;
	bh=J7IRZqlI1GJ3DDEZW1oH8DoTFo9QoupuairdAcQ0uGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orypJHx3qRqUsPqtYIvwaxcV7J8IN8IoR2v5FT6SXednwK+TTuhZ3K/psymWGpzu6h8yvxzZ2DRdHf/YynDgSxcrKjIcTgsAw+tMFnTK+VfFVceI4pzca12vJeX1DLer/x2IBloUmYtxv2xUsVeazGf+lcRSSsZs+55pDVAUC3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CTXHV8yA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/T3CdnB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTXHV8yA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/T3CdnB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297tcaU2921786
	for <imx@lists.linux.dev>; Mon, 9 Mar 2026 09:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FvNOJbFeM+aL7yxqK4J3Mnt9hg3UFgTdAbcvPH6KeV4=; b=CTXHV8yAFPcVejau
	NMbfyIFzsaNBaoSE6z3AWcaSUMk6/fggz8Uk7py9Sr5CeS2CILNRNEJxSLCxUU/l
	pVgaf68xLqNnfngNNCCAqLYXWctc23QlJphVwwxWN/JNZIzkNVdU2g3Iu6bBTNvH
	lrTyYpl3w3fsVHL2SWi2+KTppgmc88Th7+AIEihCECDOAOulTyyEHIpRoKh6uWJ/
	c1H5ufDY3nrSjEX6JL//3k/J/X7/jxa7Ekvlc0C+xvpGTRX1lT2d0lB5J4BUhYOp
	97Wh+ELyBrXWxZElYAOentEhysPmViV3RkldTGzJD5ed/LuRCkPFb/zolZbrBFcB
	GSWuAw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qew5h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 09 Mar 2026 09:39:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77e5e187so1081149685a.1
        for <imx@lists.linux.dev>; Mon, 09 Mar 2026 02:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773049141; x=1773653941; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FvNOJbFeM+aL7yxqK4J3Mnt9hg3UFgTdAbcvPH6KeV4=;
        b=J/T3CdnBawG3JQZOEHxKbzGsyFjm3XZfcqxd4P8LIiU/2Run2mbyuFB0CAli5XthpL
         BDHfkWGuij9f+C8ZpD2adxT0RIPg4KKwRH2Z1nUShrxg4IYZxd/bH7lLqwAOPQ/ihBBs
         fJ3Ycu5buX6RkvhLi/W56ZBVA820diRYn6qUKEaed2CaV6CXUYX4qonAOHdMo3Nmdk8a
         ViEmFYnqDrpRtvaIj2sv5wzbqsXyy5s3ptCuwvjVYT8dlFEYpbviCwM0y5UVeHZ658Kl
         tBZbIANvTPDAdnWOR7ZUA6qXML/pe/vUKumisA23th0ovjJ42j3qygl/j1IpCci1kklD
         Z15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049141; x=1773653941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvNOJbFeM+aL7yxqK4J3Mnt9hg3UFgTdAbcvPH6KeV4=;
        b=wX9EjxT7ZPPLv2+Kq7LJK01vn2whXosbBJg/6SmH4+lK4P0c+0BX0Uqsr/YlKJkAm0
         O+eQAKcCyu42o0MDwCpYBg/JoMzVMf6sKiruubM+ZvGWRN3hswmjJZxIggGVVXVYb0S/
         038ByrMp5Ofb0t07ZEklu/IgQo0WDCXorPRd+52OEmBuKu/31vrxabBao4Cug2rcoiNP
         itINcpkYDUxKpleRxhU0bFdiWJ8rHS089cJu48KGXcZOuRa8FiUBf4l9XL8/iXJX1lxK
         KnmD7heokVjUm0g26iEBnUbnLAs1sdpEaREMwpjhMgkEmXWHpsgUx8khmN3036lsC2y8
         DLyw==
X-Forwarded-Encrypted: i=1; AJvYcCWFYnL7HWhhKbzX6xKRcjb5zNq1davjK7FY2aJ7+7oxUCNvCqJPvORuJ1BTKlp7kDk/RCY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxio3VzEJ+wUeTdRKZI/H6ed1UdeaOa1B/p3dFcn6DW4KJZS2GG
	S936rLDIHtdLH8fkICluTBFhgLwi4PR7bKBYq29wGcEgepaxodZ4IBQvMjIb1NFpgS3sNknvHJR
	EQgi/Tve4k14wnuN1oYvrgFV62EWWRWCZHlspPxYsTPiUD0jMr86eWVc=
X-Gm-Gg: ATEYQzy0Az+Yk0Ed+jozLGsIXwm69CBqyo/yEBHFQbcT/f0rwYuxM7TMhtriA71/dPb
	yKLcDuBhWpZ9fNZqIeuD7RfHC01XwazHNWBWKrWdjPUG/eRkpfD9FcMIvAx5lLmRi1ud5U9smtt
	2QYxVYIPvNNxQO7Od8tuu52luzcpJ5JYoxvWS+LpcEzEfMyw7U3bPr/cVJWzK5ModqjC/Rl+ipZ
	xmUVe2Qk9RvvveqSpIZn+nhFgrgyH7mg5R5TZwcHzShpOnjDZnN9y/D+XF74FzNJpWlpxWtHPa5
	k6xzpZrffiimQinxdiZ/ZtE2zpUXhzguO/6ItsSYddCJtE5nqniCovEaRKwqEFQPCvKuCK2GBXq
	miGK7zlQZPAujaKqEfBAh9XDVjP+wkmDE6yVOtfrGN1Lotc9N3H9rJO+mSlona9/1m+/1MkHoiP
	1oqqSu8p6V
X-Received: by 2002:a05:620a:25c7:b0:8b3:14dc:4821 with SMTP id af79cd13be357-8cd6d3403b5mr1301713785a.3.1773049141140;
        Mon, 09 Mar 2026 02:39:01 -0700 (PDT)
X-Received: by 2002:a05:620a:25c7:b0:8b3:14dc:4821 with SMTP id af79cd13be357-8cd6d3403b5mr1301710885a.3.1773049140631;
        Mon, 09 Mar 2026 02:39:00 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48534fa65a6sm77570025e9.2.2026.03.09.02.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 02:38:59 -0700 (PDT)
Message-ID: <019942a0-e9f2-45f1-8e04-26ecc9822705@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 10:38:59 +0100
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
 <6255aa0f-529c-41cb-be32-e5d54a839125@oss.qualcomm.com>
 <AS8PR04MB84209F4103D8D4FD495F5B26EB79A@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <AS8PR04MB84209F4103D8D4FD495F5B26EB79A@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ca-lR8F-QJl7-d_7TUJJ111QTbK4g_Hw
X-Proofpoint-GUID: ca-lR8F-QJl7-d_7TUJJ111QTbK4g_Hw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA4OSBTYWx0ZWRfX/b/2BY4a097v
 oAuYWxrMVbbzKm8fT2ul2GYPMEqOQC4tCYDIJyXr6U5Lwgn3ZmS8/E1YRwFWAsjGdslA1CgcqRg
 gCaPirSgiiJgmWyLnHylrqQmJzoHvIJ31bax9P2F6bAsoHXcXocOTr95j+V0xdfX7K/gGrO9l18
 +5QwXlMqKubSMobfsWY/eSTXgygTnekV4wcICzgZQtkh69ME14pwLDlNvvG2EBqzgU6bsbc0EA/
 N9QlfYr3a35h7/s/mU92w4QWlnFpZ4Dw6F9f/mNrV8Vt4mL7d/hCj2nMxQET0bIzPntandkpDMG
 OwqPddQMoGyloOeCc/KQ8ytzQKW0NGzBYn+WAsoYzTRxVQMKMbA5CUIjpK1NwYKsxys+5SUxL04
 QvpDuTC2fDscCm+N77RT1+SqiLw734G6f377hCwkWoVZnnWOtQeUptbXHaCKg8dQ3GYFQtcZQsX
 gf26V6IDgAcLt/H3dLw==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69ae9536 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=l2TV3C2-n_0iOSrWiQ0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090089


Hi Zhipeng,

On 3/9/26 06:31, Zhipeng Wang wrote:
> Hello Daniel,
> 
> I'd be very happy to collaborate on this!

Great, let me see if I can cook a patch in the next days

> My availability: I can dedicate time to work on this over the next few weeks. I'm happy to help with:
>     - Testing the new macros with IMX timer drivers
>     - Converting existing drivers as examples
>     - Reviewing and testing patches
>     - Documentation

That's awesome, thanks

> My understanding is that, based on your RFC, we should use two macros — TIMER_OF_DECLARE_PDEV and TIMER_OF_DECLARE_PLATFORM_DRIVER.

Yes, but also sort out the existing TIMER_OF_DECLARE macro vs MODULE in 
order to prevent #ifdef MODULE in the drivers

A side note, as Trilok commented:

  - you should not do top post. Keep inline comments with the previous 
emails so we can have the context.

  - trim the emails when possible. IOW remove text not related with the 
discussion

  - use text mode with the mailer, not html or whatever

  - for more information refer to Documentation/process/email-clients.rst

Thanks for your help

   -- Daniel



