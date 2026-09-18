Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC59D44237B
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 20:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789762522; cv=none; b=PMCVZQgGh+kw3cVgGF3ozUFBNuoTdXENjIoO0f4J8Tf2vCOVsocro5WXi+/47apOAq/LJL0+YRqsD4XgvgqvszS71tjoX8f4cKiD7/U0TZwD+o0koYmqdoo8v1I3ht25DlAue8CjjbMuUWvtPrajGtH2Ds0X31EcZexhmx+sNfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789762522; c=relaxed/simple;
	bh=IihQtvlu3mM7DoVd4/V7ME+mCuTIcJBZbRiO8v34YNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBVMkQ700TvCZs+Hd8mPS8dE8ZCb/2eHnQ2cJ1/fBTcHvdNi5NJp1XGA+DhB2rUuJuf6Vqoia8EBrx5UM7FczOjDIEkMYUYzYsVoI2FE4lC3CJlVe+70fJcP8v1frscJKr28ZGR/ciEOBIf+4c3mga1gyocvsTiBUMI45rCHfhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fD+GOeD7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bjsRXnv8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fD+GOeD7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bjsRXnv8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IKEqKP1660671
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 20:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4fphhkzCia/0/dPRwk/cb2MyHyGqohOAAxhBw9rbGd8=; b=fD+GOeD71lokuXXG
	oJyTKl62II+bfiT3x5V68weBwsLkg9k0od+HRHDm4+GZPneZ0rSVR3w2QUOH7/pw
	UNWejuimY6L0ZLLOeESBh50eAYjFNfHe3zXTwhOZP1teCpiEJouwTj8EGHL+Qdrh
	RMVz/5TxpvNsuqI8wUqK/nhIHybVDHbECqwV6i5UopMmYUHa+WXWSsTJKITIBDoy
	J43SqZyKNI4Ha47J3UAMB2X5473TXYAcCHjWOvProVmHTJZ4IbW4pi9G7Hk7AzN/
	c3svFtW3XkzaM/ld+k00yhCe2xKa+ZG3Iddv2wTj+6RaugeS9ztWVNOzGN/e52eD
	O/3zpg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2392ujx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 20:15:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0b66ecd9so151753485a.2
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 13:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789762518; x=1790367318; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4fphhkzCia/0/dPRwk/cb2MyHyGqohOAAxhBw9rbGd8=;
        b=bjsRXnv8TwWrfgeV792+uxWB/MC5y5cOtFgCv6vv32utQ8LVDig45/2XvAjPGelAC8
         aJYPcVEh8RtfF4yC5UPllrqNXH4T77+8zXWJwTjuc3mjpcjsxLVhwN0zXQ2rNTwZTRyk
         HZqGY3fUo0RIARZvRi2r2Z8R7juZG7I8J6fFP1PauEIIU1NFj48xDq/Y8xb3V7aln1HT
         I+YPwK4tNx/buyk+Sp4Ow62ZbULjw4ESz+34rYgkS9SdByThyH+MQNiyZOvvH3J0usdK
         7t4bwdQ2LsCFGRxJrB9ePLmvKx74zVJpf6HUvllm58gNvpOsNdqATtLC+LwgMz3SDTR5
         UeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789762518; x=1790367318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fphhkzCia/0/dPRwk/cb2MyHyGqohOAAxhBw9rbGd8=;
        b=gdeZs7uVPyNHEp98XOS9NE6r9pSmo2B3U11WXZpG6Uf23i0USjj0ivsNEKXs3A9VFF
         9DXZB9AYX/hb1BhIXGj3XkQXcOa1bYqa3xm5NB1f7xNj1o+WGGkCFb9yVQO1NsbdxRdM
         FO+zIoy21ust4SBJculYpzht8qhaPFrPrPirFZl45Bzjade5abhl/1nMzm70WGFF0fFX
         sS9HqhhkVuQawN1E4o2b6vRMhJDd5yXHtXcHzMez3gkw7gAUwjw4YrvLLNKXQuq1NTR3
         atCfNzDtrMOAky9mC+ZaZmBL0+bXbCGyu2ATVHjqlWHYp0AWL6xZl04xqMG9x80Rh/un
         5p0A==
X-Forwarded-Encrypted: i=1; AKwUvBxLm9qEpszSJLwr85YDAfYfGqo+aAZBiKo2TjE8WAOgoyu1CTZymuG/PKbOo/EH7Ic5aE0=@lists.linux.dev
X-Gm-Message-State: AFuF++ljInr8XWCocxpqEKydXCpYWD53algp1F6w5Wx1f9kKXh6IZ5X0
	h7mNlnxOQ9u2E2qT4oFZ+Y/uBXVIrN3KQglrysZbJ7YRpJj+tU7sC1Q9u3CPKdvqbB6HJnbk5BH
	pL/cXx5aNLpZujBMK35iG/T8oXYAU+GqWucmq81dIm5sGKaN6mdMgcVc=
X-Gm-Gg: AYBFou0pKWkqVyyA3gW/uBREzxUROlRxlLihscjQZPD4uIc2etUkP+NlWsAGy1s71mh
	VNYKUpohyuIwsoP9L3U0e+w6W954IICagO36ZxViqREn2Nfhy/+gVnCpAVi4F9ddMPYYIU4v18s
	4NkMKdBScO1qNtE08n9LhvgRdoEqAFJFR8TMFXCcPzT2WHTnIjC2XSjCipOEGUfN5rkoq/yoklw
	avFUKBnKHOnvK2XQm167A9n0QMQUntI6OqtmEp07OSwRUiNYQD3YSrpcGu3xbMd894NggD3bZsZ
	yDs6pTD7Kg1uYZyrXYB6GgpnIdjTRupZu8XrlUcNALNl6gxny1o/1ld1LNwKDehzNzL4NOuLukh
	S+22L6OvgztWRI7dWHTaUxi8BoB07cxPhzze9SndNLqNnHmxgGFfZ7JayY7im
X-Received: by 2002:a05:620a:8909:b0:93b:c537:fdb8 with SMTP id af79cd13be357-93bdc6d5b54mr581374385a.6.1789762518459;
        Fri, 18 Sep 2026 13:15:18 -0700 (PDT)
X-Received: by 2002:a05:620a:8909:b0:93b:c537:fdb8 with SMTP id af79cd13be357-93bdc6d5b54mr581369285a.6.1789762517999;
        Fri, 18 Sep 2026 13:15:17 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:bb0:6e51:d247:d411? ([2a05:6e02:1041:c10:bb0:6e51:d247:d411])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460978sm1103863f8f.11.2026.09.18.13.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 13:15:17 -0700 (PDT)
Message-ID: <4189b4c4-3544-4602-b1c5-f298e033c17c@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 22:15:16 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com>
 <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
 <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDI5MiBTYWx0ZWRfX0Kgq9cTtv59k
 URSTxo9T7ryTdh34ItavgghN9UySc1WuRxDCn8CMLVVwxg2RwsQAesOTR9aioucqV18Cjdyj1oF
 A8vFg3zlsQJwQVP+kfU5q0MlCaOezgo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI5MiBTYWx0ZWRfXzLmOfWybsScJ
 e3K8GBborZ3cn94XxrYnyY0PGnlxO+4bbBQrS1ocgqFO3xi64TJ5B8nmY9W9PXX/rFyqy74beTm
 i4KWeTa7fpyWKaRsqRKRdscFN8GEbD1wO15WXnpbBCy2MeoD2k4H+7vi5l9aI4lyzBeTSjY9WY7
 /BhKHwZckaNGXBfqF95QMl3D6NWqSTaUD3TeA8ZWWuOyN0BIgICDQ+L//zUwDDj/LP3g5VNUK0z
 9jD5WCsxTZm/zPKf3L4a8ex2OTgNv7wvctiRO5qeh9ef+BmZgVrZR9AubJKRhGGFgozgFGs41qL
 8cfuFMhPeIahwoifjwDOCpzn2LJyU7HzQii9aTVrv8dQvAoBa3YuqRbrTqITuKLUAndv4DQ/XcT
 R/zMDY5zXN5WSIia/D9A32GLkKcYgqqFkzo4svmw3LfyBXz4uf+Qez6beljFdL+5I0dLnx/D/j0
 yNQsTXxUal+eKoKVppQ==
X-Proofpoint-ORIG-GUID: lxF7_9KtFvbX_rYqtR2G4Wgx0H3YyEk1
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad9bd7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=pMJ2f0pklUtnlmghVxoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: lxF7_9KtFvbX_rYqtR2G4Wgx0H3YyEk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_06,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180292

On 9/18/26 15:38, Sudeep Holla wrote:

[ ... ]

> Not related to above topic, but just wanted to check with Daniel if this
> solves module auto-loading for you. Was there someone else who was testing
> this series and was having issue with earlier versions or its you only
> Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
> something vaguely and couldn't trace back all the versions easily.

The scmi-cpufreq driver loads automatically now.

Tested-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com> # Lenovo 
T14s Hamoa

