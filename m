Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91788378D7D
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 05:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772602843; cv=none; b=fGcu6paZ/lBbcnH7OP01qCrNZ6CrcVEe1NPxxmGgQppLnAD9hlzXiVWQ71riamn3BHm+pC/Nrq7JeOb2wCWe3PscFKiVgtL7opAJH1ibv65shFgVTxwikmWY9aIU4Ty9987QQNMh2FiZ+UBQ2Ed0Nc9OhLT5PhV1b2cJWWfBuAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772602843; c=relaxed/simple;
	bh=/wsP7VBi/nO22buvW8wFAOqcZ5B6DnXuDBkr4/p1p7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZJxyHFIrnyxtq+207rRvtXDDQd8mZkbwE6ku8gIzhFyrFL9kJWCeIiPnRcSAMAFFkGI3DLaSP2qQZ0++SnHfdxqD0WLStQ86xEVUpe8AL/6Uw2PRiNXuSLFKySGiqqF/9JR/dx/xGPjOc49UJ085TtS6+m3SrVcQxbvN24reMpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4KQL2D4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqtK26xH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4KQL2D4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CqtK26xH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SZ0D945266
	for <imx@lists.linux.dev>; Wed, 4 Mar 2026 05:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pTkHd1KeyqUTkLs5AEaZqwf+U6dXKKpz4XNqTDwVhgA=; b=n4KQL2D4nW+vb9Xx
	LzjtRBihWkWIc7PDGPrANMUCWp4eaeoZn2XalpftiEevWIPtAr8BlyYk8zKXBG/Q
	fSzNPHRRMzKEM0or46IUjXUMhOhaUWIylIbkBPC81gl6vHIhDkgKy47mn+oE2XrG
	VMAfilXk1iRAqyOGdAHPPO5pHgaVCBTW0b+qgYJD9vZzH3NVuN2NwrpZYTpX/lWJ
	gB/r9gw2FhKSuiE1A6u1woG728q6QCaQQ8Ty1h2hpIc4ZsKMMON3oskmNnnfKowX
	u9VgfLz5HLjc73KQsqSzPBKD3+t8TMi3UXgn0lrzsYmfG6f08EMrfCr/pVvUnjc9
	xcWUEQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxfbqn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 04 Mar 2026 05:40:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2be21146933so2586557eec.1
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 21:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772602840; x=1773207640; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pTkHd1KeyqUTkLs5AEaZqwf+U6dXKKpz4XNqTDwVhgA=;
        b=CqtK26xHqiROaBwhZ36aNvddn+j12B77LiWg/iOBIWVRDgvmJ46KZInKPewpec0sni
         7od2jC1TbGYGChIkgogFsa/fbV4Wpma2ko4lZZ45ON7fHBo5l176ufLrcR9OV+MTZK+w
         RDwPolYlqKZfN9rsE/eVRCZLjvjhy9oEYm2t69L4+tgTf6t0MqKWgdapnRP3EUB1dh7V
         N6KVyBeuryU3jAedrg0jjDWfnmufi1Ys4i8YbQd+4qE/ai5ZkIhODs4H2WTIH1l2QDyF
         Z+1zxXL7z04AAJNXnJOGrKbZpUMkA3NgwfJKbQllmZ3L3waAk3JXlEF42Az7zA7S+iHM
         EEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772602840; x=1773207640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTkHd1KeyqUTkLs5AEaZqwf+U6dXKKpz4XNqTDwVhgA=;
        b=JjyzTCpcH2Od8Spi43eBFKG56MjD8/j9fCpDWROVLmeEDzzWiSP/1rbjmYfp/HPmQv
         VSUq7dPX9eVSGBidXQEZY0eSZJX+JZgCo2NJ9ZRjY14dGDQzrGhJQJ9nCI5PK9jxydyv
         CijYmgi39jRxBBojOe3b/BHGxubN7S/y2CT2LjxSpqfZmqLmGqbXqNzkWl9kWzLXCjn6
         Olmosr57DLXJXgrMZOqS/lWsRCzqhBV49yPTllPh51tMkvxpxygpL2eD4V6En30vYCAR
         BxzI6VZrPxjmn6B2JP0yYcSIUWz/0S7p3GCoo+9IJJyA9USqbeU11rDKekZh8ixWXReZ
         Kczg==
X-Forwarded-Encrypted: i=1; AJvYcCUzFuhgcH5bWhBp/J58PSX7E2eHCG052Bfdp6mF5PGNLC9HnFQjN0nPg2V64VXeVX6ioOk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5s/yCKCkCswx0fHXf5vPKtBk1WZuvU5wWfZqKW0SE5F8ZOc3+
	ZR2UvOJGQEY/BMwNUzmWkVKoTOw3kxrnuo1Vnem76ZLh9nuk1lLDpRoVeeLh06ubPpDb4bjEVui
	JyBpu3lgIK/QkdWLkz5P2mcX0cAmECE7ktl2gLCHgUNLLpPOW+Ltm4qw=
X-Gm-Gg: ATEYQzzy7GRfMTcbrh3UErU4HjwZo1TnGfO6gPy2CLvXSfoSnC5QEaZUo4C064l9QTm
	92Rv+mhmme86ZgS7oWWWc4fApHs4/eRoPMBSZx26CRVLDUIvpjrMLyNwXqF2yYnASJV9JjJwkl0
	dZkAv+4Nd//A5mIbqfvOx6gHr8XO3Rt1mdqBG8xakg3yTNYHVz1eIGcP5w8Ipp81ygSb62c5iGi
	Jey1AHH1jCOFo37ao/aHWs3hvDwujadCwnuhQv0w5uetaY32XDiRKm2e/elNY6vAA3tihRe/KhF
	JOPAwSK1iChHIWjOOM56Y4MTUSFpOWsdwlmfq4JBL0HJcCZEUa5AOhxSkNG7NhruaE0Fz/9/mB4
	xYZiToxaE1ew8RSAvL7WGGSUoCSoSgbb+AvltnTtOwweR6U+RN2XDZhE=
X-Received: by 2002:a05:7301:1009:b0:2b7:38cf:c2fd with SMTP id 5a478bee46e88-2be311b9a6dmr294709eec.26.1772602840464;
        Tue, 03 Mar 2026 21:40:40 -0800 (PST)
X-Received: by 2002:a05:7301:1009:b0:2b7:38cf:c2fd with SMTP id 5a478bee46e88-2be311b9a6dmr294695eec.26.1772602839913;
        Tue, 03 Mar 2026 21:40:39 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1e02f95sm14383897eec.13.2026.03.03.21.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 21:40:39 -0800 (PST)
Message-ID: <2387f306-d7df-41a6-a526-d5bc56ae1c06@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 21:40:37 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] clocksource: Add module support for timer drivers
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>, daniel.lezcano@linaro.org,
        tglx@kernel.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
        walter.chang@mediatek.com, jstultz@google.com, amergnat@baylibre.com,
        aisheng.dong@nxp.com, jindong.yue@nxp.com, xuegang.liu@nxp.com
References: <20260304025720.2583655-1-zhipeng.wang_1@nxp.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260304025720.2583655-1-zhipeng.wang_1@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA0NSBTYWx0ZWRfX3O1U8gWKlaYZ
 jO5GmWdv1I4ZcmTZwSQzhxF/qHkzHWd3N+FXXaV6gMyXQbgEMFRn3FS+wcJaZP8+Z2w7SOT8GUq
 CaxJT6HOrHZFQ+NeqFIiwkU+7SCjPsVmXCyM4s1J0Y0Q8Ska7tgJGBVYkwRV0JHZ0XQzvbHgBds
 HK2/88UFp8Ycw41YxJU3Yibh+JZkyywqytcnVP2p6h7zgLBZCxpuqAMFR3XvksYXddwF0DhF732
 3FP9dh40FVLlq6c/GR4xnnLEKUpam6JptfojTSZq3QTiWFL+0N5/W79gEWwcY5HW7Vu7ZRMFSrE
 D/QFEpKkTgNXHET97JyTxvD8w9JrvtlLtWj8GTMHTQ5wtWa9FYLP2Qu4ooTYKnq8D5OmFTArQaO
 kJ5j0MLmGeJQpmZZSeeI/YTz/65wcIOZfmzUbi4IYQASvp4ysYzvF8ZHwcvmuX+gSQEb+JJ+nTP
 NzbaA4GlFL7RXF5Jszw==
X-Proofpoint-ORIG-GUID: l3N8NNvAqRyZOdAnS8NgC0KIPsr8G6UJ
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a7c5d9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=mpaa-ttXAAAA:8 a=tqqUqQLlst2uEWk403AA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: l3N8NNvAqRyZOdAnS8NgC0KIPsr8G6UJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1011 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040045

On 3/3/2026 6:57 PM, Zhipeng Wang wrote:
> This patch series enables clocksource timer drivers to be built as
> loadable kernel modules, which is particularly useful for GKI
> (Generic Kernel Image) configurations.
> 
> This series is based on the previous MediaTek timer modularization work:
> Link: https://lore.kernel.org/all/20230517022557.24388-1-walter.chang@mediatek.com/

You are not explaining clearly on the why part? Does MTK doesn't have
ARM compliant timers and due to which you have specific timer driver?

It is not clear. 


> 
> The series includes:
> 1. Export necessary functions from clocksource/mmio
> 2. Remove __init markings from timer-of to support modules
> 3. Convert MediaTek timer driver to support module build
> 4. Convert i.MX TPM timer driver to support module build
> 
> Testing performed:
> - Built and tested on i.MX8ULP platform
> - Built and tested on MediaTek platform
> - Verified both built-in and module configurations
> - Confirmed timer functionality in both configurations
> 
> Changes in v3:
> - Reworded summary line for timer-mediatek driver as suggested.
> - Improved commit message formatting (line wrapping).
> - No functional changes to the code.
> 
> Changes in v2:
> - Added Signed-off-by from submitter (Zhipeng Wang) to all patches
>   as requested by reviewers
> 
> Changes in v1:
> - Fixed 'unsigned' to 'unsigned int' in clocksource_mmio_init()
> - Changed MODULE_LICENSE from "GPL v2" to "GPL" for mediatek driver
> - Added i.MX TPM timer driver module support
> 
> Chun-Hung Wu (3):
>   clocksource/drivers/mmio: Export clocksource_mmio_init()
>   clocksource/drivers/timer-of: Remove __init markings
>   clocksource/drivers/timer-mediatek: Convert timer-mediatek to a
>     loadable module
> 
> Jindong Yue (1):
>   clocksource/drivers/imx-tpm: Support building imx-tpm driver as module
> 
>  drivers/clocksource/Kconfig          |  4 ++--
>  drivers/clocksource/mmio.c           |  8 ++++---
>  drivers/clocksource/timer-imx-tpm.c  | 36 +++++++++++++++++++++++++---
>  drivers/clocksource/timer-mediatek.c | 33 +++++++++++++++++++++++++
>  drivers/clocksource/timer-of.c       | 23 +++++++++---------
>  drivers/clocksource/timer-of.h       |  6 ++---
>  6 files changed, 88 insertions(+), 22 deletions(-)
> 

