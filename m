Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E3B39DBC3
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 11:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315733; cv=none; b=KHGhMwk5eP2wcOwqlSPvpFCTt4cOt2fxQod1lzzjn1RbwP8YaE+iqlSC/IyVN73EjEUv7JgYAygmzii/glnMMj1e2PO1m4M+OPhzYohr19JwkOnusprIE2hwHff5xRIk6t4SAUVhqiaiupg1ekhD9eO0jQzuOCLGoheWl4Vnt0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315733; c=relaxed/simple;
	bh=K+Lls85tI06zAStnQt2JpIDd94kGRPBAjQ4m5phRPV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TmPHh51IRzwrg/ZKMKCuJWFMjfireNpHEX7poE/3X+sC1qgz3QAsEUvqQFmeHCGx9jVqXd8+Rzt1WMULAmvvCzHV6OQitk4HWRGReDpdKObPE3SB1sRSAolL6dv0NQ+3notWBiUH5iYilbHaseWfNEjxHmoiGe5dF5NyiCyApfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5phZrdj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZ9YF4aU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5phZrdj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AZ9YF4aU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C99nfl263416
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 11:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LE+t+QqJAI+/mgc7W1OIUYrBRVzqbLNj9RJHGrZKK9Q=; b=P5phZrdji2XNB1A7
	dTTi/RsItP2yc1RU394FYJtIegEYWxTNyrkQb0nAwMYAKmSD8GZ0IhcKP0iEn39T
	gPpRZjfwGbi1uO32Yfl3TFFBlGMioBr9HyrKxTKT8kBqhEkU2yEOd8CFcf6t9eyv
	CqE9kdZD7mCqzR8uNPVT4RBKJOpmu73ReHRA/EkhWeGpxE2vkNMzto6iDdQJgujY
	LOGl+LoKIbBfmjlUgTd3w3s3q1mw3x1d3hdxAvi6MWs7VO5s+YYappVus92gUf+M
	U2peZk8AIN/AUUgB+VjEDiVd6wpnW54pw9QdSIRCsBJQQnWWpQcwYQoQm+ZwhEgs
	wMOK5g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4yhwvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 11:42:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae467f128fso9913535ad.1
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 04:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773315730; x=1773920530; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LE+t+QqJAI+/mgc7W1OIUYrBRVzqbLNj9RJHGrZKK9Q=;
        b=AZ9YF4aUtT1ZN+o4CsyCqZecYztgy5XYPhy8TZJHX6OLTn/tAQm9pPdRpMwGsQpSHk
         9SNnCEC1mqzVmMrKgmBm0hFCl+j1ffDtl8zqaacuY3ZmOJmwEnQpSFPPUotfBfEBq8AV
         hAtUVHXq0a6eQinbiEgS/kJOyk6pnDa/mSe6+yRrGvqNgEG+bfAeG2xY+thb64VYUx83
         ekaLm2q9B736Fa4Ri+5caZvpLdzuXbQShFHbu69Hkd0OM4TLKj6J0YuNsuHzPFg3Cz9c
         GY2n/TJseH0OtDmuC/dWfIbWr1BJEgPhxRfqicH5dzQs2/nMAL0TzBogyBdmyv+bhEZG
         B3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315730; x=1773920530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LE+t+QqJAI+/mgc7W1OIUYrBRVzqbLNj9RJHGrZKK9Q=;
        b=JpqfbPMrKgzm7/c46S9mA0nmtk/xW4Llh3pUt20OoKjsworElMUnjDIl+isPe+d71n
         KUrXB/CKZIjpghFRK8KEK6HHMhRAAFGnWvsooQdqjlLoWp6SB/LC5uU05ZUg0M5N8+QT
         UprSGmlqMMm/mxh35xu0DyxoPQ79tcp8f+ifZaCx7golzRu0fYt8P9Vfe8SPMhHpiWzu
         woE3XSOAQ3CuBwd/rth6IxPNggwCvWAbpVn279Xpy+LwRVxbK2lp/IrcrjT8b0/LguHK
         MW/fEWceSXep/Q3kLLZGkAS4VpEwTxZ1D7aa8giVCVCNxpNP3AJVTII2tb6du715piJT
         inpg==
X-Forwarded-Encrypted: i=1; AJvYcCU4osLKILZO44m2RVecWTXJN4A5Ss8aCfgVOrPBGgAnFJw3TAqsTmeIEMK13FHGLATyviU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTiu47mV1eHjZTuZHXlIu8ogfm7I1LGjQHtz8wWog/dcY5r/I/
	ePYZGf7teB7B+01EK3gvUayoaDHbKQDHhGjPHQMP7B+96Mo8atbeg8b1a/Rv0e32RYY2NCp1W3M
	/eGMTUgMKiP4Qrm5aO1BpFlpuZiyj4IBAJgcQIAOOZ6+sCUyeIs7LGwI=
X-Gm-Gg: ATEYQzw9G/DN04b01MaFZPP0v5vE3t2yWR18COTwHeJtWRHgStRwkt1J95U19NM2bbS
	lMeaa9FHEj6d58CQrnqS8sIeCaj0+A1A4N2H+zutTP6alAbGnLJClK5noH+Dwk73WElF+xOKA7B
	3sqxLTpTBbgAyZleVIPm1d77XGk0hNxvENX9xlFk+7wpnpiRf8acc+/iLd2ZTtoZLOAyU5nSduG
	srvQyjlijwLiRgjm9zleTFWsIPH8PHTfqJxIgKyn0/6LAJ+3pVLnQMS/Ap5NnaOSvNbLQZi180L
	G8XSphNrmyR09M3NAPegTiRkoW6v1xIwqXgzcoPiv7RkGgZtBiXNcls0+AgbUh+nQjCTgZRHmKw
	TuBqF1Ky2EeAcNYDqfgqqRuz2iKQ47sJvNV8KuZ9YK3R/VbeqHRqG0wCi4A==
X-Received: by 2002:a17:902:d4ce:b0:2ae:47af:3b29 with SMTP id d9443c01a7336-2aeae92124bmr54674315ad.57.1773315730447;
        Thu, 12 Mar 2026 04:42:10 -0700 (PDT)
X-Received: by 2002:a17:902:d4ce:b0:2ae:47af:3b29 with SMTP id d9443c01a7336-2aeae92124bmr54673835ad.57.1773315729939;
        Thu, 12 Mar 2026 04:42:09 -0700 (PDT)
Received: from [192.168.1.10] ([38.254.186.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae22217dsm53886225ad.4.2026.03.12.04.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 04:42:09 -0700 (PDT)
Message-ID: <ce25b963-0e8e-4411-a406-7b466eadb1f9@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:11:56 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] of: parsing of multi #{iommu,msi}-cells in maps
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
References: <20260309210506.GA589665@bhelgaas>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260309210506.GA589665@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA5MiBTYWx0ZWRfX3sir+JPMZDM2
 qSHUE4CctNXHtyLAKihbIPQT55v7MiPU9OkQX6iRPyIV5caemt3k/AwRREiqTbdS1Kiw8lt49Q1
 lz0TFVD84tibjzZ4VcNQPaDO2UdFkjsTJB4Dy0obMPFBb/yt0MDXrFrSAfNkUHiqmTphZJ6XeWo
 byk0sbdfKbkusJT3pSgjxhO19wLMX4FLaB9cYR+M2jYRRiV4LVOjpiaoMWOH1UZDIz6yG34Uddr
 qcGcpkR8GarJxRD1BdA+ZpZmRzrUW64siJn4jJ2z6SKsQtkCz9+wo4VVLHSR0EeoPLAlXXpVt/0
 uNeeAki9JZgo6Cq3aujhXepbCEjlEqvzErLAvyo1tpijGDeaFXokXyD2OSEcleq7LSBsP+kKfW1
 Jdd065q6fvEOWFMXMCVNEYls4arEde6OmV14nwFsj0pf5avsndK8iY7I6ixMY1PJt+AlKKccGEH
 pftUr2bVM/uUHsnK1Vg==
X-Proofpoint-ORIG-GUID: t9aQoaLoswC_v-ScHn7E76ugrk9GuWrJ
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b2a693 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=FuYIH7Xx0xzBSkYrynBYgw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Iq-Xo7JqGUrbNy38CdcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: t9aQoaLoswC_v-ScHn7E76ugrk9GuWrJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120092



On 3/10/2026 2:35 AM, Bjorn Helgaas wrote:
> On Mon, Mar 09, 2026 at 01:03:36AM +0530, Vijayanand Jitta wrote:
>> ...
> 
>> Charan Teja Kalla (1):
>>       of: factor arguments passed to of_map_id() into a struct
> 
> Please make this subject line match the capitalization of those below,
> i.e., "of: Factor arguments ..."
> 

Sure, I'll update it.

Thanks,
Vijay

>> Robin Murphy (2):
>>       of: Add convenience wrappers for of_map_id()
>>       of: Respect #{iommu,msi}-cells in maps

