Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E4F39B49D
	for <imx@lists.linux.dev>; Tue, 17 Mar 2026 08:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773735647; cv=none; b=Wej9buVm6FWLBJvCCvfy5fztru6aHE4zVLTaMOSgpKiLjkMgqUe+A3r2r9bi1hVfxTpgPX5ZetrLeD6it0JJxNb1EopOnIzSsjaa79mXStVXATPZMYAU13ftwMOHOT/j7js4LWWc+rdPwXMCRgtV0DStJJyb95XyUblDl7Neg+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773735647; c=relaxed/simple;
	bh=pvmFIdrJY329RE6bMLG/vNraS0gxmOyJoGyrnKHCVUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uK+yUfNjI7RHVW3DEzYkrYlSnYSnT0zyhXOznxGOjZXs3gxk/lXzuFRstR+Mo+dKsOO+6kcPg4jFWe7RZffaSMVlnvilNWByiOxePmffePpMQUUqPaURC5J54FAG1mLqnClkjn0ezfxHPT4wvvafBjub837tgI4fG92bMgcjEFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYMSh4gY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DrHrBZQm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYMSh4gY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DrHrBZQm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7etwm1534044
	for <imx@lists.linux.dev>; Tue, 17 Mar 2026 08:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q22MAYUqk7atynCYU/o1hplS
	y4gS1yYkMhcE6k+4m24=; b=WYMSh4gY4nzyJNDkWIGNwmCpNCzKOhmbup1WihmJ
	OxtLfiO20vvyw5ylrgIPN7hwSM851kBvdOida0PFAgIYziQbncZznCr2762dNlhU
	j/dYsEUBxnhcOKvfxifoHL9FLQ2zH77rwqyRObntJb+eeV8pZJ6ci9ySTQE4bmJ7
	RBWplc1lIIMT5qYVQtmwM8iVdOoHsydeFVEecWiOm36n/JWlZckgvQGKQRXki90Y
	LJsiq9Fylq+/xxTMYJFKyrUXZKEDjzeLLLiFA2gMGgpGsqgIDet7ShDnjo3d4FUe
	2KAckR9Noig2yrP61AhMk4c9uarQbrLaKkaJLSioKiN7hw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm5k34mv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 17 Mar 2026 08:20:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd827a356aso307954585a.3
        for <imx@lists.linux.dev>; Tue, 17 Mar 2026 01:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773735644; x=1774340444; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q22MAYUqk7atynCYU/o1hplSy4gS1yYkMhcE6k+4m24=;
        b=DrHrBZQms4gDsGRG3CF/rARJpVBM0v5Zm9rq2xzn0pd+Hlv+Ux5tii0vBSTIO547I3
         Tull8m9wMOH/JdVd6zAqIXmMBOmF1kiZ+T10/eR2BbX/EboSLwAj44jQQD+TniL2eCGX
         nriqvpdEBYOW2Q3JKUXf0r4JaaaGTCsiONK0AYaMp1gNHOql83/9mfd6ahvL7HcoZvAY
         QmHtmzL/VxvDxcKAMNiHVMWZUDbTKraDcAumLfZWsR66P1rdvUn5OGNt9co0/jf/H6h/
         w5PTpCkW+2nJPjzp6LGaxjRTwobV4HseVPRqz7C5915bgXE8Yvri65mLj5cYrkZ+YD5G
         GA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773735644; x=1774340444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q22MAYUqk7atynCYU/o1hplSy4gS1yYkMhcE6k+4m24=;
        b=HPisRe9J3V1T/+CyyEkBOXvmzlQ8PirmcDSbebNOkyhTr0T62/k6o1xhQyt0UQZwua
         ik4oH+g2r6ihC2R34k50uAsnkfoxrrD57D6Bxc9PDkL0C06WJvoJuet92mZ5PEXnoyjY
         pW41PPFygq8Wiv1YPb5naSaqgWrtFyNMXW4zIALtHNI46QpY5n+d4b2HfzOAUwcfaa1U
         eDqKcKPwcpbpIK3pest2VotxAFgmXY/JBvFHUfaWp07n+ZSWdV3xbWq3FqA0gxiWAhgo
         I/hORRWwJApAAchmwv633yr19G6knttch9BoTuYFzKlpBoyYOcoylWShylmHZcn539zs
         XL6A==
X-Forwarded-Encrypted: i=1; AJvYcCUUg1N8re35asYr1xvtEkEv4oKjPOgAQC6SGpW0A+qaLPKDmUDTJcrlSMTtjHuTmJcHRGI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3X8AN0/4ydfyPTh14srJ1xFC91vN4qdb3lYBMWBPR2F8bkOWb
	Kk4KYbXz12qlhUqdU0s8NdHDvO+RefSMijLCjnCBZboqCFcDzR4FKz+WsD1MeWO/a+iDiUwt7bk
	OBgwYDqKhmW5gMhRLO2IHaxoGNps2A62n2Llu0fOKY7QQOUqMKNjzMm4=
X-Gm-Gg: ATEYQzyetG0kfV1Q3x+y7ntzpDofxJzEtncALNE2VfvecRItd3dB89cRU10QvcBLqfN
	iDMecCOB69qu4j/6dNCxbTOCUph9FoF/uy8VmfAhmf1shjaqg47Tr8ogh+wzQUAhqzQl3/yGrMb
	msPKVEHIF/XXOy6onoteDv4zLBjTuowYoBoAlC5jUIEMAIpnQa8eyHJZGYMoVZzpH2jowWD3Ale
	tCjR4nWD3gL3nAvqvNfL75LQJGV06FsR29pvKbiHOummibJuj5ebZzUIHD5cpY0/yMngcfQlsQe
	hQebWf+RRQ0YjBHK8xniXrgnWX+Z09t0fuVplKv4gJF5cfA0hPd9fe7QVKuuOQyi5qIfW2lc5IL
	0O0vH8+7vuTd/7q15M+dj+du6I511vDfrwA==
X-Received: by 2002:a05:620a:19a1:b0:8cd:80f1:f460 with SMTP id af79cd13be357-8cdb5b20e52mr2244389485a.45.1773735644073;
        Tue, 17 Mar 2026 01:20:44 -0700 (PDT)
X-Received: by 2002:a05:620a:19a1:b0:8cd:80f1:f460 with SMTP id af79cd13be357-8cdb5b20e52mr2244387385a.45.1773735643531;
        Tue, 17 Mar 2026 01:20:43 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eae3037sm51077145e9.11.2026.03.17.01.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 01:20:42 -0700 (PDT)
Date: Tue, 17 Mar 2026 10:20:40 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/6] clk: imx: fracn-gppll: Add 333.333333 MHz support
Message-ID: <sd6iwi57nfv7whvlzlnl74wgel4ka6zs7mc2imafhtgpeail3r@dotylxqzpr62>
References: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
 <20260313070740.585043-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313070740.585043-2-alexander.stein@ew.tq-group.com>
X-Authority-Analysis: v=2.4 cv=fJ00HJae c=1 sm=1 tr=0 ts=69b90edc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=8f9FM25-AAAA:8 a=EUspDBNiAAAA:8 a=LywSNKSTaWSAk7vVM4cA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA3MiBTYWx0ZWRfX0inwelMRYPeq
 d7I5yDrwlWsFahDuRAYBrcZlVRUWGFlcgRjJxJWEKPGwMSZ3ld5+zQ6iMkE1KIskw02hCRL2Ab4
 B3rySRouqyMmNjQENnvmycrFKwt2qG6yLJy4WDreR8jtKQ3re53CZty37R20hsdzYgXGcrUQCV+
 R+mQaKbsq/25Y3ku5RVp/YE0yVM1/AC71YSrS+bKMOXAjhBJYxccK41Ah9jn5EaDLBxsv+QPmu9
 VnOaTBKgnN+JeJ4V+3gK3jkWvHoye7mrT8gFufv0CQJTCdKhDmR/m2vhzGz+DrjTP4de9Dfuueh
 3NYW5OVQHofLTN/wBYpCR+NOk+qVOSZDJwuGqr1Afxb6o4o1vcIe0Qn6OmJe6XuRatIgCW7c5lh
 86XUy0QnRsxw7pIvai6uFft964TKbGcwU3tPEg+1FIuFbG7RAVCeEbw5FzP5sLiWJvhFqT2u4m2
 TyeuubEqrZEeqL8nG1A==
X-Proofpoint-GUID: 1BQvlhQoW5lPOMiYD3CPcSmjhW4K1uij
X-Proofpoint-ORIG-GUID: 1BQvlhQoW5lPOMiYD3CPcSmjhW4K1uij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170072

On 26-03-13 08:07:31, Alexander Stein wrote:
> Some parallel panels have a pixelclk of 33.30 MHz. Add support for
> 333.333333 MHz so a by 10 divider can be used to derive the exact pixelclk.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
