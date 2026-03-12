Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986F43947A2
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315778; cv=none; b=rTrZcEVZYLik10IL//mPUJU3iK3+FwvlTOquFUqgeOsFkef/5Gd/fhYOyyzBMcaWAjBn14211+1r8y6/UqtMRqETIRiHRu7OBl6ZsX+aOFC6gGICDu49NEHPbRWh+QLFuJqU2osflXymOq5Rcypvg2dKg5vujdoRoMq9fra4pOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315778; c=relaxed/simple;
	bh=vuDtbFLrMiurzB2+xC/ot2IB+T1N8Hc0u2jO0iC2vG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWWxF6Opa2DECz7zHydzM9ETzAjVIbxmH+mbMIRmiz/5qZM3mMfd/L4Uphu/hCTlmq1HljVPnWo6Nu70Q+BZUMwvNcA2s5pt7ffFgSp7SzmJjQrn99UvFjVKE3Z7CoWHW8/23+HS0411bMTjLqdlXcwwF4zo5YxzhNVHCkSW6hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HmaP0o5E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gAZngkY/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HmaP0o5E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gAZngkY/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9tSrn1922472
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 11:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W9ejYWHNwRhjPiGAgnplcOS8lPIHbm/6D31/N+auTSw=; b=HmaP0o5E8kDigSFa
	alJVniCiNF7DjBpO3slqiNJ3tC/PYMDuDwHYrqAZ6m3faf3xBUSqMLfpUEiT0ME7
	uWWAeSVIZ60cNAHJhwuo6Vb8dOptnxFIZD2ZPlI6SJHGh0bEalGe5AilAQjBoaDU
	QZVlr/4PFlZA2kIerIpl0o8Gs05Rqi4LvYe2xoN8EAgrInA5+6ymKHj2jVoDFZlX
	twDN9GpYJxK9TErk0jdzr2qqWM7kBKQCbwArOlfCHOrYnIloY9u/so8cENTOFlPK
	42iYYDiTfRSrfY3aZO54lNm32900MmfmU17DmtlRZIiqhD4bfqXTlQnqegCK9Mod
	59ZCww==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wsxua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 11:42:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae50463ba8so80717595ad.0
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 04:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773315776; x=1773920576; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9ejYWHNwRhjPiGAgnplcOS8lPIHbm/6D31/N+auTSw=;
        b=gAZngkY/AY2SZ1AJi7dmZqwk7nniTCKpqTbkJpi0wX/pcGZxGqY4fHDNJFDQBzUM8d
         H3+qfUzthHmWfQ5oVRIDLew9dF8BMN474EM7J8lN2xmLBrB1kxrre3Hp+rdU6nxWsE7s
         vAQhXMsu+eHbGSuOwYYxTZG6727Gab7mvb1FUGiIeAB5MaqTAWiLlB1P/e1WBs4Ry57N
         d9QuxxtA1Ki0ugs/Fme4pOIa499ffrXbpVXV9W0aHIU+mEXHw29I4ZWXDZjOO6WefL2B
         AtJ44FJMkuAF3currZSg1mZ0UomKT8boCa9tGeEoaGhbJI3vj4rU6kr4NbsDQaje7nGm
         NWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315776; x=1773920576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9ejYWHNwRhjPiGAgnplcOS8lPIHbm/6D31/N+auTSw=;
        b=kc51ex3XufANkBUKGWBxKUvNsgrAQq0GGD0zd6a8LxHkQxhKY47pWkeryYStkQasQd
         uNrPXAKX1OtvxkaqKJgApKZyQ9UeKWIwVaHx4SQJBKzCVdImeQXAzlcMXrPGf1aam15/
         k8i6jgU65yiXnFGNeiR0XIB3PNRJNuhcn9zHErbqS82Vbat3/WPmdRJdFgUTbWaXpsKS
         eHFH6mSqRg8yKslZpGqV1Qh8LRlcMhNi7FvS+AJ3idf7EXEuujQi+4rROoWmL0e1NkUk
         YqVsB+Cr5Y5fueGspZaQbQA8JliP1Gp8S8b8n6yyYMyH4sGFcgpAUB4qg7EhkcStAZSR
         qOaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5RkbxSiI/ayTrMNVpp4J+D2FjCF9XSHFhZNcOTwkBKVei4+mELNw1rkNA6agVkZ0Xmd4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjFYKiCUSav+bADUFhHjN9spUZAz8EECzcnKtKQHp/oYTlEpZT
	nXQ1h19GgNyyJNMWHFHxmht6vw6HxgbnMyRx0YHFVjAnMuHmYPc8SdSIJF1USX0ac3ICrq/miCi
	h4rOxbVlPs/YndLmIT3kXYaSzCXCQx/Ctk8YvIjlADjgRzptBbmkzAGE=
X-Gm-Gg: ATEYQzwFXcLgnM6+C7M3ntS7cLkA8gQEX7in/jX8fhJwW0h8ZbjVaCPfcot8c6b9rLd
	QLc+U0Kr69BHrb3rd25Fo/8Q66XTVap8/qwmYWZuE5NVy+KHSx8v335FSu2foihykCuXgl2Xkcv
	ZYmD/IfH1k7VxqaoSFmovHw1z/+hQpJSkbWOGdPQ8/p+BF0iM05YodnG+3T7D3sj1iXH5Qj6B5V
	z4gqUuteaPu4VPJGHbGDdaqmZVfcMSuWKjq7q9twZF2eoECvvuL4dnlrQpAyjCUwR4vIUTV0LlH
	p+3OXkmEv2tp1vUGk7oVvMsoja19v6bg/bbJJiOoIDV0vsRchhlTykkljWslw3ZR6zoLt6LZ3hI
	mUOuQepwhYbHk7mRkFy9fxCpj7r1DJk8YtkzFL+Wa+UA5DOtYNDKfWH+FeA==
X-Received: by 2002:a17:902:db06:b0:2ae:3fb2:ec9a with SMTP id d9443c01a7336-2aeae7ad446mr64958895ad.16.1773315776352;
        Thu, 12 Mar 2026 04:42:56 -0700 (PDT)
X-Received: by 2002:a17:902:db06:b0:2ae:3fb2:ec9a with SMTP id d9443c01a7336-2aeae7ad446mr64958285ad.16.1773315775895;
        Thu, 12 Mar 2026 04:42:55 -0700 (PDT)
Received: from [192.168.1.10] ([38.254.186.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae25cd67sm56194955ad.38.2026.03.12.04.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 04:42:55 -0700 (PDT)
Message-ID: <04eabe08-f339-4d9c-8b61-184241d192a4@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:12:43 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] of: Respect #{iommu,msi}-cells in maps
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260309210849.GA591344@bhelgaas>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260309210849.GA591344@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GcoaXAXL c=1 sm=1 tr=0 ts=69b2a6c1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=FuYIH7Xx0xzBSkYrynBYgw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=2oAOsZZM3GA0Nya8fkwA:9 a=QEXdDO2ut3YA:10 a=d1F_yjlUjjEA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: shjUSoXjgXi3--DBXoVu8JjRZfBGzRQ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA5MiBTYWx0ZWRfXw5Eju0jtos/w
 7uYAbzSH4U/YWIALQAd+688bged9sZswmyQHTKXxUL80Papv7ZatW5DG+4YtfbynMOoHeZD36MT
 B7C+tI/lXmmrnUz0WBvIIMm1infvl3l2k5MXRfJtIBNOpND9b06Yx/CDiT14yAWS1l90YZRLSXF
 dhaqm7ayBifeKf+maSLZjDWTiXQ03UAkOLPsb3AYF2VlYQBRf5IYV7lOBTsXR+hk9/lCniiijxX
 mzHAVdT5+Z4qHF0MNPoB/MtZYBR3wvGVpz8ZqYggW7aESV/lV8jEo3y8IxhxFACBydglPIeo2q5
 gQJiVnr7RwYfAcrUMFfJ7KlS6T9uUCzJan0r8M+bAULEP3AgJIfX49OT8S1gm9RE6MmgPWrFvLb
 f9DTGUPJDYepwNAcsG/YLnfgdd6pfWJHTBxYPK6NHMVt2QurMqzXCrNDr7I/oHeGTiVmJ84dNNJ
 CET6ACNjtJ9tVHHP2fQ==
X-Proofpoint-ORIG-GUID: shjUSoXjgXi3--DBXoVu8JjRZfBGzRQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120092



On 3/10/2026 2:38 AM, Bjorn Helgaas wrote:
> On Mon, Mar 09, 2026 at 01:03:39AM +0530, Vijayanand Jitta wrote:
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> So far our parsing of {iommu,msi}-map properites has always blindly
> 
> s/properites/properties/

sure , will update.

Thanks,
Vijay
