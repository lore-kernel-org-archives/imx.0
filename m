Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB10369217
	for <imx@lists.linux.dev>; Sun, 12 Apr 2026 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775986541; cv=none; b=iz6KFY/xlsI+VxWe8FSwgPGensN1gmzSksAkRb40TYcJ7lGk7H9bSWogP3ih57v5lhAn/rzIGVI5x4Apg5MtUsOkBtqEHrF8YPpN7hc3U+2jeJ66/PtaQcZtSSQYVZoe0sr4jGyH+odnlulJXel56xfxBg2rmwkrhl5cWwzjVCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775986541; c=relaxed/simple;
	bh=5KcLbBnpUP526jc6HeKCPLsUm6VqSn6+Giqky6YBi2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNeZzL09gAH7c5Upsx4HfIIru0JT16C2TLKNgKkzKhW7XvUM81yVhbN6Z1R91pkKla8HXntLrbI8ep2ReZIZg0tywBBbwZWVzHRbhbFuBb61gaj8emAWwesRm7AGr5NOYYAB4jl7ByM4um6c1uT9khZRCxwrT8ZFOlIgJfWOMm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gHaRacsI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=av1QRKCy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gHaRacsI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="av1QRKCy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63C4tWiL3624284
	for <imx@lists.linux.dev>; Sun, 12 Apr 2026 09:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ntDR8NBqpIqaw9Ou8YQiyz9oJYsTv5hhvLULdDquyzs=; b=gHaRacsIHQ3rhQBO
	10CmLBKSZaS9YhpTdxeU5anrIQfP2dDbLH2GcpvxkZX9hu6rZyO71XFHtuu0NrxT
	kvHXNgKtvAugWtIrMedoZDS1dPzMkbsH2l2r8XZImLI/vcLYVGZ1FKcpFNbfo/p4
	nXqatTDvmi0e0EvDrGTYFECibheFChe7KLcrBd6ONdpa48ulBHy9K8NSJRHCzXSx
	dKQYNDeYpP3qPSuVQk251hlI0jGasdWGzqyHPkhsxkpwhctQCeNcsdNu7fs93apF
	lW0oHuW/ALgEg9JXQ/3I52LKAGCi0uvWQWq9Z/OpBQItx0Da38ph37eGtXRzQpuI
	FxbPiQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2ba3rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 12 Apr 2026 09:35:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d6bf346adso68717841cf.1
        for <imx@lists.linux.dev>; Sun, 12 Apr 2026 02:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775986537; x=1776591337; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ntDR8NBqpIqaw9Ou8YQiyz9oJYsTv5hhvLULdDquyzs=;
        b=av1QRKCyTTAzU5698ydcwGuqjtcthFsdZxg1TnOidlTqR/p3C0Jijg+hNVpujXIJDx
         p7QfynC3lJ2Ol+VPFEy457yd5TbaiJlgNrMeEZ380AFLS2zOtwiu9RRH/EnYg8dVy++H
         YokM+eNrm5uYKWEQAWyanerIy3Hf/rXmQHVNaVjRh3jrcDxZBB4CD2NF2RTjGHX0jeyt
         StGH4JA4z/DiaiE8yv9h3uYbup7BDe+IddW2c3ZtbweoPZOhMaLYsinMhqnUo6lCDlYD
         njkQPBRG4Z/1vFBLZblcNWCKOWZ/99z4jxt49vVNnySw5JBx4nEvtip1j3ZTcIP/AiA/
         odEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775986537; x=1776591337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntDR8NBqpIqaw9Ou8YQiyz9oJYsTv5hhvLULdDquyzs=;
        b=m8I3v1LPiFFgKYyCMr5RnVQH6r9bQOgtCVr0Za4i4mVdPNaAttqkmCJ5tGGc0n9BGY
         EpZgvnaM/jWFBoF3K2ENAx/vY5Yu0bi4IW1NDz9vlXEPQpTw+Ql0dFWPY2T1+4KO1loe
         DXu23r1p6Ku4wEG9UZDK22BzZEx7UkD/qDOtNpRUfwsyhfGCYYtrXySdwV8Ib7aOx9Li
         /Kf5frEVUTLGBB193Lj/FckxUTEBnrnNVKTelGHKdw95psbvqzf/siDFWUk9Fl7ELLxT
         ZtdzRcOkiwJaf6tC9jTAjXPhhi7k/yERpV7xTs8NfjPDkuZH2XEPPCUmRNQ7XEpFRf1u
         c4ag==
X-Forwarded-Encrypted: i=1; AJvYcCXs7FQjHHIvGe0fkYrKRPJN2fKcrqmckEUoncde8/aLXa5A4+9JgRQxLy1u7aqHU2tlISc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgXmiK/r5SWgBhBsuq36sfnvLhauDtluDz31Lf1XWGXNm+p+Ut
	u55X5DaYJFehYGAChHEyqYIbHFLQcG+4f/Sf/Ags26g2colCc84xZKEokFKgXeRKY0op6tWGKak
	I7r95KNVHzexv3LMKhYwdKmJdd+++KYfHoF1/1nvlQNO7oLJivqcvXkY=
X-Gm-Gg: AeBDiesaWwnyruXqDGM4+JL98HW+joBjok9sIYYfxxtinWceEAyhmwsOojztcYQojfN
	xBPKmsg9rzYS08Gyo99GKA4NUnqxInIPWURQNRZMvjHjK/Tqc35wR/CbXwBjVxEz/iAuY8fRCco
	i9f0ggbiII1LvlCgRHCrBori2heJwoq4UrbDyvrvVghWTSoXUOaHHiNS92t2VHK1/Bi2L8WKBaR
	INyZtS9vCNn2l3CB+O0rL8nA+H4G5ie2Uqhc3QzhyOEqak2frbfHvf9Q6wWHtJSPoRIys0s3ffb
	NZAUFbyOxOaFPPMhJTYOEQ37OfTMiFzPOKPcXigLYz21CnwGJ4Fe/54j4K2Vcj8rojgYt3L9Rlq
	+0di0zMB9Ue68WUvYlkrxAOE/f+tohUn3aF7zEZmWClj8uewU6GwY8tJtt3E5Zh7LPvhMDoGlGI
	hAKlUqliwI
X-Received: by 2002:a05:622a:8a04:b0:50d:855a:8909 with SMTP id d75a77b69052e-50dd5b7cca7mr107851011cf.32.1775986537193;
        Sun, 12 Apr 2026 02:35:37 -0700 (PDT)
X-Received: by 2002:a05:622a:8a04:b0:50d:855a:8909 with SMTP id d75a77b69052e-50dd5b7cca7mr107850761cf.32.1775986536700;
        Sun, 12 Apr 2026 02:35:36 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ccc9:82ca:cc1b:b64c? ([2a05:6e02:1041:c10:ccc9:82ca:cc1b:b64c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5df2062sm69408705e9.12.2026.04.12.02.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 02:35:36 -0700 (PDT)
Message-ID: <e13badf0-def6-4fa0-8009-f9fecf6a5c88@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 11:35:35 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] thermal/drivers/imx: Fix thermal zone leak on probe
 error path
To: Frank Li <Frank.li@nxp.com>, Felix Gu <ustc.gu@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Oleksij Rempel
 <o.rempel@pengutronix.de>, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260412-imx-v1-0-cc3b45d63811@gmail.com>
 <20260412-imx-v1-1-cc3b45d63811@gmail.com>
 <adruT5fgNSZ_VOLr@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <adruT5fgNSZ_VOLr@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDA5MSBTYWx0ZWRfX6n7qutYIziUM
 O2N8TbvXw+UWWKaqs4wGArd3PdpRv5dbuCG2hVYchoSSXSKtH//r0NVkQkYlIO+ReGy+Sx8XBwk
 wkshdEQFC3iQmBAWId1u41TMX0/N4P9rB8oLlrywi1Iai2XA1v250u9N0TtWRtwITZsdaMxnKJg
 2+Z+8hOW5k0r8b2ePWQ4cKmzfSIRww7Z3Ewzh4RqXzU66PBwyZOv8mRYA3pNqrBmvG97CnSlB1n
 rl3hNqpaV/tM/pZz8Qay+J5lck47JjnryqtbDFjRztOZV4Yil8pkEMYGr6y/J/isoS8rVMg7JPg
 1SfZ1uX7bMR7EcHGc5w2Ixuquc6rleFuUHU/9bq2psjmhWREJpBQ3FzEPqwiMQ8eKh3Wp5sTSac
 i+SDbAwbfsQYi0cigm6fP1R/WkzWezd4xdj8e+CDXnr9Tlei8KlrPgcNicwtV8+zY7gkdj9TLW+
 ef6zSJWLmNeUrKk+E/Q==
X-Proofpoint-GUID: adT2m5M_S2d_HM1OGNzzIC91GWUiQOhq
X-Proofpoint-ORIG-GUID: adT2m5M_S2d_HM1OGNzzIC91GWUiQOhq
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69db676a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EhLqWX2mNhMJiQ7EdO4A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604120091

On 4/12/26 02:58, Frank Li wrote:
> On Sun, Apr 12, 2026 at 03:03:03AM +0800, Felix Gu wrote:
>> If pm_runtime_resume_and_get() fails after the thermal zone has been
>> registered, the probe error path cleans up runtime PM but skips
>> thermal_zone_device_unregister(), leaking the thermal zone device.
>>
>> Move thermal_zone_device_unregister() into disable_runtime_pm so all
> 
> Use devm_thermal_of_zone_register() to fix this problem

+1
