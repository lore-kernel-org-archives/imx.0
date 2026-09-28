Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9D146F48F
	for <imx@lists.linux.dev>; Mon, 28 Sep 2026 08:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582940; cv=none; b=cbfS8iFgTtOzXRwqVr8jmsjGbnAA3U5EnmSOLzC2lv/FpYBccsOpp7vcCM3Vo8QSONKXlalG+bTENZAeJnxNjIB3cvJtLnaIF9b9v+vHvaMvuWHtbNv0EkEs1LfgJUjGRII2gW8kxTbdHw+nFDkht3nttqwuVFMJqwpf7X7WM78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582940; c=relaxed/simple;
	bh=KW+CIQTivfaP13k7qjV89wVsiakN0oVzsaUBC1ksteQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QoL4pH9rQPpBOYRtdFksZKCk1H9cEOksV8f3MoMptyU8f1aj0NbaAcPTCHaZ+RqyxA4bnzOB12cxlayzi7uavljtNm7FPxZDrRwzuwMKiYMSO+H0R7eNM25FoDTVWsHdxZtVhr5BJDLN6JT0zU+Tpaj4SgXDblV6N96JfDHLVZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SKDSW8Y5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMamUQt+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SKDSW8Y5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMamUQt+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xPUv137015
	for <imx@lists.linux.dev>; Mon, 28 Sep 2026 08:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oM81pKyayfK2X8YKDVXwTbFLMrukiJVnnCmewayJBqA=; b=SKDSW8Y5QhLznaQ1
	yzxkud/7TYJOhk6dx/p3qyA8tC7kxFki3tE+Nd56wjxF+b9iJASw0vjxii6TezBT
	ZMdgxRrVQ2HKFKydfWaRhBoF1GZenEMTC9ZAlW7V7JbrI6fP8P5Zye3NyIqA3FnL
	bZR5CJzL4DXRwrnLCl+DzAJSwTuaS9FLvO/Sz22RXBSSG5drpv8iuVkBtm4eQsJG
	dpY7YaSJfuQDnR8mcWdZIemD2SZhPnkbHriD1NzKmc8auOlu68yM325Jq+Uh3j4G
	/z3D6lwBxyFHr4YBKSDVwA3Y/J+s3jJDWavHdfwb3amjUN9uEsX5VHOL68NyDm0u
	n08ytQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq15eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 28 Sep 2026 08:08:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5ab5c136so283447585a.3
        for <imx@lists.linux.dev>; Mon, 28 Sep 2026 01:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790582936; x=1791187736; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oM81pKyayfK2X8YKDVXwTbFLMrukiJVnnCmewayJBqA=;
        b=RMamUQt+ZMsa3+UoSHU9H0/lV12voWDjy2hJSQirTroVNzfoLJbcH/rE8CDc78mlvy
         wmLNRmSJ7+s33ycUOSDFcE0Y1UTeVHe8vwPkIvI/6MrC0rhs6q3hIuDrfwYVYFWLij7x
         fd06c1iNFFoy2dPm8oDuMH3rZu+aURgHalFZ0t4OkpDgsl3XLgTqwTp2rJolGPd7qMMr
         7+E8ltKWk1lFC5O65vKBFnq1aedevVtHyJO0k3nhJAkTMQzV8hMjWj2eewSXigzMertq
         uvqGiAyj/AuQgXuZvM4xP/kf3gnjCHDP2k4t5xOtAgsdGuncRVFLzGpFRzvnBcquVf5j
         6QEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582936; x=1791187736;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oM81pKyayfK2X8YKDVXwTbFLMrukiJVnnCmewayJBqA=;
        b=jBW58sDVrZ2Gq+LqUvBkLu4psBfzkts6sBiA6MpwnkAFpE2BTizw0wipWE0g+XnqE9
         Ta4Jmf2hgdpgcyYWGwFCM0eJqx/NW3KQijGtkvw6/S7DBAuuEi1edCwYZGtxda8N8/5m
         0tHcTbQVZS8Sa/cm/QzTpXZcSQ28mAnCjUPba5ybbBMb9A4Jlg8FVmgWFkUPyVDawV/y
         ii6atv4v+Og8RA26W+cJPszhLSvXLXE9HTnUp/zqKYnnp7PRsXZlU93A8ptc0NrKhqEz
         T9KJEMB+Y4SvEVlZ35CvEYz6SLrtXIH/77F0gjcWERIlVwy5sFOQXZQ7uTjCYpGZQtSA
         C7Qw==
X-Forwarded-Encrypted: i=1; AKwUvBwHip6+gvcvfUfSJeOMSp8JHX7vjtHV9XyWOIoFmt9FSjh/zomGPCqrnvZB6Vc6cv5Fs1Y=@lists.linux.dev
X-Gm-Message-State: AFuF++l3v33FE2k5p2n5uwUGfvyDcRQuKtGk+r1lqQKjIIBYMsF8J07s
	ju/TekgD1oEbx6kV0/VpoYdntSginbATKnMkeiIZa9dDejnhakG0uHHYfOfTfhvw5votmtyoV7B
	3e82o2bbcvtZKMWS+qztV25mEIvm/Ar6KgGyLksYOkXdn8vK2irrK7B8=
X-Gm-Gg: AYBFou2U//sIim6Mhhf5Op60O9CproMIkX0+TaWQnaff0OraQW1GMroTrcOnkgXXAIE
	jLl8QMc7R64NRZG/KwQ+YOuRkQwmZhQgdt15ox11tzi2ZIouDXyCJMbGsf863DAVbEaMunAwrsy
	30eWbf82qhnx6Np4TbUK20nYNE+/RGPkMMGJ4y1kkhbLHGUgqHoFXuIrJzH8uTtaZFA7HaifUjW
	DLH0aIULRlwgiSsViFVcxZuuKAAdWmsI3cRJrlr6CEHNPZNdtPp1ntfVET0vZKQKadW9CXT3ZnH
	7TdDc7KWjkpZAgycAjIHOfjMpge8+2qnDTGv72HWwoHTwoEsPGjXCeAA5nJUffYsoyLnOa+UBKY
	sg7y2G5w0qVclQsx/Vrk4KlFoP8S/
X-Received: by 2002:a05:620a:4150:b0:939:a003:7127 with SMTP id af79cd13be357-93c43d15a2dmr1823460385a.52.1790582936340;
        Mon, 28 Sep 2026 01:08:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:939:a003:7127 with SMTP id af79cd13be357-93c43d15a2dmr1823452285a.52.1790582935772;
        Mon, 28 Sep 2026 01:08:55 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm26045947f8f.12.2026.09.28.01.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:08:53 -0700 (PDT)
Message-ID: <ccb949ea-5fa9-47e5-be75-af8155328dc8@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 10:08:43 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 1/2] dt-bindings: display: Use consistent
 indentation in the example
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai
 <wens@kernel.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jernej Skrabec
 <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Francesco Dolcini
 <francesco@dolcini.it>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Marcus Folkesson <marcus.folkesson@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
 <179057359762.92994.13773102514654073802.b4-ty@b4>
 <8499ed1a-df9e-4e5a-b609-3da8499a47b5@oss.qualcomm.com>
 <20260928065837.GA22609@killaraus.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260928065837.GA22609@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: c3SHeV7JHHxJVfbHlisKjLfednzOQm1o
X-Proofpoint-GUID: c3SHeV7JHHxJVfbHlisKjLfednzOQm1o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfXwOO+FuaRn1su
 V0QzXYcoPC1wrw6qunNBR9BVAAbkbfxaQdF6CraIRYMYtI7lTv9rfiHPOnOp5pJu2vBj1XpvmA4
 Iv8TLrVMbn5+NtJOfLYK0dC85NoBJgY=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba2099 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=3sPRIKSABCI_lCAVw8wA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfX3z4xp+mBTHZW
 eGzsfX2rwK1KSyIDpHaGc761aPYcwX1K0oDH05z4ORmFtxSfjoPCJ6onQEZa8jFGJSfbB9zo41i
 KYQi6waV4J2T4eKbKk12C9HgvpXI3MUaatOo7iOUkXD+E1o5nsUGf4ew4O3Udkz0pj3bYtDXKsj
 7vwYA4TM84ZY9ncJ7x/X4fdQ5KpdKfdOZkFhdYDxmrTXifJGgLr4VZRP88ZGCaNuQC9KSDciYqf
 MYtiEHTeCrWkDpJIsc5AiOLJYihUgOrmrujlsBX20fNXR2Vi4gsaHFUsem4p6EfagMThiaeRN6Y
 a+tWnBNPdkrz9JdBdIhzk9yaK7FNJLmVQ4cJmDGvN7ORdUllJgErJnYnh2rPPcbU0rhMIUrFR1G
 BDl/w4H3JsKAtY4HNjIPZo075+qvc2b9ZFOHukLm5JxbMNQ2aaNDrHKKvNH6TqbRjEHsTXsjnDl
 OB4Zu9f3opcsLskKBxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280032

On 28/09/2026 08:58, Laurent Pinchart wrote:
> On Mon, Sep 28, 2026 at 08:03:18AM +0200, Krzysztof Kozlowski wrote:
>> On 28/09/2026 07:33, Luca Ceresoli wrote:
>>> On Sun, 13 Sep 2026 14:33:32 +0200, Krzysztof Kozlowski wrote:
>>>> Correct indentation in the examples to consistent 2- or 4-spaces
>>>> indentation to fix dt-check-style warnings ("example 0
>>>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
>>>> re-indenting entire example just for that is too much churn.
>>>
>>> Applied, thanks!
>>>
>>> [1/2] dt-bindings: display: Use consistent indentation in the example
>>>       commit: 370c5d9004f8b754351981d59fc26851bf943e93
>>
>> Thanks, but I expected no one will pick it up, so I asked Rob to take
>> it, thus it is already queued.
> 
> Please explain your merge plans in the cover letter next time.

The merge plan was this going through drm-misc. It got reviews, no one
applied, even Dmitry for msm only reviewed the msm-bits (second patch),
so I asked Rob to take it. This was not planned, but result of usual
drm-misc inactivity for bindings (many bindings were not taken in the
past or with noticeable delay/pings).

Best regards,
Krzysztof
