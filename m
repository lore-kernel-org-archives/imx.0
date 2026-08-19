Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823B93CAA2E
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 11:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787138026; cv=none; b=ZYqwN4MK2pYyswEAA03NNqnVOHCyLUhivBx3kKhc+tjBvXk19s5axLKNGMOmKaF9LdUrDh+kk9128jcLLlEw4voraF6AQuEyOVaI4Uwetkt3wZ2SjLR8Pls+mKcpLDdqNCbl5IdVWQgW1JKGnxEebHF0RG6q2eHDpa/KaeDODfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787138026; c=relaxed/simple;
	bh=909ro/fzf/GQehxNHMqOgCUY8OQL2KUAAFxDDPFuGf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PKPpAvIBqRhOLr9CV7BUmP3z/wvPy7Yc6xuyH3zFslfikqxKZeV3gPy9f0frg8cZJKu2ZZYYKNSQfUPmfBhv67nVDl7zFd6hiFhi90/NtJYeg5KxDhZzVb6c6LAVw4WhgaSg3v1MleXweI3EqBRZbRRLVHt4LonDGoh7CvJDcII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6KbtOGk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKki1yGd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6KbtOGk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKki1yGd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7nKg2947166
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 11:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ig6FvSRli1ZqS5uDLkbhiTZeNooor70ALrndiWqEtrI=; b=R6KbtOGk0MOGWZ1p
	gb4jfVydfHxpojFg0GJhs/q21UKl0i/VEiMcB/DcdwHtPGBYoMh9TelId8APGW1H
	mpPKtwLl/mIxWgYIR8VeZHgVifvtEMkhIxaUenX8yCpWRX6UUErn/p0Z/tbgCq5E
	z7azllfMmg6bu707r3cmjGJjj5A22/uc3byH36q4v6RtVqDR1ovUIJfbXPM65JbJ
	HBzd2gq1Jwt7/1TUCgQaILpad8RK8lhnHnmp/F5Kq0Q5IhCm/cW2VwUWd353s6em
	hslwnuteh06ocWdwq+C8G72MQYUVL5B6khbQ/E2RLw6EtvSj50lRTRT4hhS/+8UB
	pR0x9Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkawsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 11:13:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d57d17d6cso1932141cf.3
        for <imx@lists.linux.dev>; Wed, 19 Aug 2026 04:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787138023; x=1787742823; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ig6FvSRli1ZqS5uDLkbhiTZeNooor70ALrndiWqEtrI=;
        b=MKki1yGdJcboTtGEBZzdb9PgY1CJd7uvaqGLGXHlRkiQeu74oP7hC120YBwauEyH7Q
         /+emSySAfeqbowCFmO0kJLJopecc2TTVcptpPTONxruiUxRWDtVgNiCpk/a+FJVHPLNs
         IhwvSeub+ZxzHO4AEsf0SnT7zzfyQxEw5oobHkgyiy/m3/ZZeqxTL9tDDhgi3SXZUpki
         QmCiutrXt5RBTASNPy5atEgVcFR8CnCVIoez79wmu98l81BSvIqaZwptcjpz3+uI6ce+
         KBsdBxzGaI+cRoA5opIuxK8F0FivxQPfB9DOiaHwEEjIOdmsaFZbq1fgP5EOUjq2HG6K
         x0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138023; x=1787742823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ig6FvSRli1ZqS5uDLkbhiTZeNooor70ALrndiWqEtrI=;
        b=HYUpWYYRgvQqGP+seCBPXMq3XYzWO7/7Sg0SVpqHyfjfFAKDCDSEXvzwJKpajsyNmk
         K0s141ViuTk+P7u7ocxxOlgMNWYnolEiQf0Gfpa4TFe3VGlbrhTHjocdxnWNhnbv78Fi
         JSBH4u56Y9hyCwYJLJz17Tsn0oMnRqO6783aK7DiyF/i5Vip351Ds/ntN5Nk8S//VG4o
         9hHp0sHl/EDz/g6omEqrSeJR5r5IwnLUQ9IQMTsIOpZrKfxkPOVurUldjyE3+16RVsb/
         IyMKoZ/9RLtOzSpFzcuc2lBN8RX1woMm+FAg+xj2xs4NpSxaQO3E2L4XA3U9InNDmjJc
         WUWg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4feFNoFSdcKFw9uX5m1NoU0xYAtZz9cAUJ0mor84To3INHg0lDMr09aThKOjQAnVAW50=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ0hLPy+oCzNAspavzhKvxTS310v2oF2tC3A3Ri2wjxsCDPl+T
	UNBDDgtgiUa+9EbAxNs4MkAgyGbtn7QVdpeYKxM3aoUwS9PUpY7SimlW+Pe5bM3jYOX+VKkLb46
	r9YqniHdQZaYNy+wfoaypA+PT2hg/ohpeBOmmh8vvQIyCT32cwKTdDS8=
X-Gm-Gg: AR+sD12BYSZMjlz9eGJWGtjyxcrxDDdCifZreAEn8oOC/rjjrbSe6Uk4pd2yL/CU/Rb
	vlor8VhVL1oeHQteg/8MXRvlzEdazmlbGXiGf6ciDLj+IjZC9xXJ2uv9w1biy3qyQcJB+gf6DKt
	zdY+lNwzRWNXD9WoMYDvuV1AoQOCWKxzgsgdVzmHyMkLqAv4emspQyoKjSPAWxGnfJBiCilT09S
	bMVpVAp6raRWfB9x2Pww1vRKuIcRcFM9lg9pPYz3dH208Z0xU/N5hv8PTSd03loHvK0qX3P/4HX
	tsjrHythmDTTw9VjYTqt8m9/7w7aAK4GZ78wMfzeP0ozT7XXe37Gufnb+Ljw5vqEHapbKBAUYnu
	SYv4lugorH6ESGkjnxzrFwbvV
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr25088901cf.3.1787138022837;
        Wed, 19 Aug 2026 04:13:42 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr25088541cf.3.1787138022385;
        Wed, 19 Aug 2026 04:13:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c7a6bd9sm57416566b.23.2026.08.19.04.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:13:41 -0700 (PDT)
Message-ID: <061e5547-4109-4965-8e97-fb126dea3a28@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 13:13:37 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] serial: qcom-geni: Propagate errors from optional IRQ
 lookup
To: phucduc.bui@gmail.com, Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Li
 <Frank.Li@nxp.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Yenchia Chen <yenchia.chen@mediatek.com>,
        Daniel Golle <daniel@makrotopia.org>,
        Zhiyong Tao
 <zhiyong.tao@mediatek.com>,
        Sherry Sun <sherry.sun@nxp.com>, Robin Gong <yibin.gong@nxp.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Zong Jiang <quic_zongjian@quicinc.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-mediatek@lists.infradead.org,
        imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260807090945.41690-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260807090945.41690-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a858fe7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=HsG88Ws7tFqbOaRkTuUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4NiBTYWx0ZWRfX/mg1mqpmCaRq
 f2L5BDQDuvJj/GuWMQenSq3n5iaVzhF6cAbASZtKIDRvAcoKD/98Bw64+1FMyVQs0DNR2RL1KQw
 zFc/1ssX/OO0UAak6hOd98pRqJRcHAZDGSq4cuUjhHf5hZ8B5KvSlnjiXBbs/6Ir7l0LlXwvq12
 ZN4SkC6CaFx9W+1svRj6tU8fvpfkoULMZ9tsbYHWZFYNhleNGvDy8m1eOK2EX6sdNUrZ3HdFrbz
 2W5yYbGTxExGLw9Z2vyQWG+xmKRNlLl+NWlhAetMZw+NMcYKBYUAUgID4LDVJV8x7QTSYBA0ofW
 688watFtYF3j1lCUbC15cKbZoU/nIhoioyXCjslUOkOmKNxEbhADGIQqeTrBoTBLy/h0KhHqG1j
 xoT3A6F1PJkQLiU2dUnhLrkdwNEKFSgOrMyEvSos8wb8OjIQ0LWlO6WQTqYqYDWCnu4zmzJ4wBw
 6N4ZMxJVjF2kXZc/pFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4NiBTYWx0ZWRfX6CpO2EVA4hPp
 l4YkAzl778RmJytVH959BFhbjVkor58JeaObKBWauVIlyiVWJgv/YHPVoDHSnALiwq5P3tA06CY
 b33xTxp1PHzs5J0iypoVaSy5fzIgV/I=
X-Proofpoint-GUID: iXbXEjBtCm6kHoWbbPe1eW-zmw5pO6Zj
X-Proofpoint-ORIG-GUID: iXbXEjBtCm6kHoWbbPe1eW-zmw5pO6Zj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190086

On 8/7/26 11:09 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
> probe without the IRQ.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
