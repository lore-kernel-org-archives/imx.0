Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6513E63A4
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 10:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939099; cv=none; b=glMqBPTh4GUObuzZyuvepJ/Gfo8KtWw5eGhjReaJuh5B5J8jm8VXAZTqytg9PPSFr5JnSMNq72EdCxQqNKUG18Q1wmDrmo5e7Yso8Les/7kH+TJSeho2WSs+NYImldvMXYWolPZVqnCWfTzGcA1wEZu58zOnerJ65kjItRiiNFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939099; c=relaxed/simple;
	bh=PerGdR4tvhaCn0d3HEjuWPNzUn6dNoxrjJS2v0J3DjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bdWDN33IrhaL6XTYTXyEWh8IjZT4gUWgenmzXG1FIxxC+tD4sO6TU6hEay3E+gdqH+tnrACkxcYlZW9nB+2tiFUhkvoFxa8yxQm25XDAD/6xWIHHjRgyYMl6wnF1fENM99CMGYT5k6+VJIp7vTfzJOq4hMMPJf2lmPgQchgEm9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BVjhM9DK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QudMIzLW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BVjhM9DK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QudMIzLW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D995aN793579
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 10:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WT+2WPVDbqIhVjrVBVIfNAyslbwNDDNswFDG7ueHOEA=; b=BVjhM9DKatZ0wnO+
	ryZZGokaXoG6hwDnyjlSJt7eHV45Pa9qAEKDWENw1lnLYnOYxfD0c1XtK6mnQxmR
	uKlnM5eggD6ogYqNc60gAgeOkLFyFQZces1UDfec/dFeQzu4Aq4un/ijpyMAN0jF
	OpFNzy4eodwZhAHrq+jXXP6eN7rSUgE3AiPMXfjKaylubYJtJ8AWtQWZHOYSJHsB
	JkOFJseotLZUepv6XwMtPIIn/w+YbucKezLYGn2TUYgjBlLDgq6/dhq3uc+RNktm
	V7e7CG/f8aHQRBXXGuQuB45uzs3UAfvK27gfE4N62ti+VKpr1Wjlaw+XLJd06r8d
	PL2A6g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qra90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 10:38:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e04a53a7aso675383a91.2
        for <imx@lists.linux.dev>; Mon, 13 Jul 2026 03:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783939096; x=1784543896; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WT+2WPVDbqIhVjrVBVIfNAyslbwNDDNswFDG7ueHOEA=;
        b=QudMIzLW7rv5Sy6K9bSpOGsals/zv5JGDe+8Y9ka/Y+BpOy9CBvO/ARAT1AOyqyBnk
         ubhYXwQI35uGTXAab/Gc7qjknYi2uGpkKbRGzwOiiT67/6BpUxfB3IeU96pUkMWGkg5t
         IVDGJbzCDgfC6RMkQ2gCkw/IKhmmRPIfiVjIdDVSuf1vujF5gh3nui0iTwIlo0f7hVmn
         NDR7KAM+vyBoIw2W7Z1PNr0yO6vLhGPnEMqnYq6LeTFDAdhCfM+RETYTSf6QXYhdYmlF
         4Gh8CYb0ItcxQZpior2aOrb4SEb0QcJT/+/ONYfth81ZrxDEOFdxz4P+0RhBLZ9OlsMw
         QIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939096; x=1784543896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WT+2WPVDbqIhVjrVBVIfNAyslbwNDDNswFDG7ueHOEA=;
        b=rsj2DLlE9YkMCELEHV+5LEB7NzdkXxia4J8O9DKoTKBFPhekCX78edzSFQsD39K/9W
         m3JLyyp2U+vyUsdJFFFAwRoaOfV0Xz5XKP0nzKaRhnF0/+QaWNA4fp+fFKilV06DS46N
         diiX0BFTXmww071MZb9TOFL7lFVjmytCSOiQUKix9pAwqiCM1GwSBq9lXz0/ssyxOkSb
         G9yF3KaWNdupkGLQgmZ+3ZyADP0kWuI/7qArHZzpIiq1YNlJP745u5tTqXSENm6CvrV6
         Phzxia8F+4D4To4cVRCKQBAtQnZ5WRhlvmT0KmKqRjGgIZt7YdXvuVZkc4afQnTEh3jG
         Ir9A==
X-Gm-Message-State: AOJu0YzLZA1yrsDsJpo5Uw9u5iLaVorcIUvwoarZ6dUAVXyZ+/X01eud
	vnkqVt56fsM8xC1fy+7YvBYG8oYiIE74eJDuOluIJuLgtkKLkwQRVAJ24xqf4whdP1VqXnaiZGB
	W0Fn9mfBaaqdYqPVC0uLoXFJAA8XNGVuWnHqaYwHZCl4UEq0s6DolwwwNW3dHchM=
X-Gm-Gg: AfdE7cmW5T0zX0HevQvHCVyZGFY/W3tyQFec+kbeBmQigDaFlgGI9JwSkK90+UNz/bl
	ajyKvvRLD1ilfHjAzaWaguISxIvjI9qJpnfsc2zHOoClaLoeCtQwdPbyHsUAGHT4gGQ7DDuGOSH
	ps7FfRvuxW7JcSESp9GUkyGdUqI0x2UFT44FKVb3iFOXcTzl6e3OMM9mf8t4x3+yfJU+fPqnyXW
	ZjaBFqDKPd8jL5FCBIrzb/WXrlc0ljre3U/KOFGn1hHkncIuwdAR3A3J/3QYeogkcSfBkoyEIw0
	jFjtoSAlN9fnqIQKdk8XgtSlR26FfPYXzHJ3By9B/cP6pgUCGl7t0zmO1SpbxibG31gACaL/wdU
	p5isyJxvXQkp4TsKsCpOmGpq0le3fmQv2EqDaAA==
X-Received: by 2002:a17:90b:562f:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-38dc78226bdmr8508851a91.8.1783939096429;
        Mon, 13 Jul 2026 03:38:16 -0700 (PDT)
X-Received: by 2002:a17:90b:562f:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-38dc78226bdmr8508811a91.8.1783939095990;
        Mon, 13 Jul 2026 03:38:15 -0700 (PDT)
Received: from [192.168.1.8] ([103.211.19.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311838c9235sm64789674eec.21.2026.07.13.03.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:38:15 -0700 (PDT)
Message-ID: <15c00c07-a5a9-4413-9ba1-261de775d3f2@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 16:08:10 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
To: sashiko-reviews@lists.linux.dev, Bryan O'Donoghue <bod@kernel.org>
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
        Frank.Li@kernel.org, devicetree@vger.kernel.org
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
 <20260713-shikra-camss-review-v5-1-db53be15dc4f@oss.qualcomm.com>
 <20260713094112.DF9AD1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260713094112.DF9AD1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOSBTYWx0ZWRfX+pzfSmpIyItY
 SEKqGQzqMVawDHO93oLGxwmai9HpyJYK9NDYlNs92LJJxhiqKBSUGKIOqPJEwhWj5BFvQmeoOvS
 T384KLao3OCyV3+xjOPS0pcygsb+jC5eW4nsl2tXoQ+nUMTXmqweqNGIaiEbZ+6FsrDLJdYbNob
 7QLsBm6D5AfibUbD9CHA2P10HjlnB9xYlqH17fWHPd5G9Uw93htzRTqq76LA/DFh/A8giYaHFOV
 1p2Ubu7vfgeJ1eD6cRRFI9ZYyGh5qX8SXN2UEyUlhhQd6cfJxGGXVLNFn90G62RMAQQGAWKZAIt
 phwGU7gerWkFqpl5UB5MV/fUFroGfyU9B7A/pagQwswIvRI17QHrFyaD4BIWO/aO+MGEyxywbvF
 HRkuRzMHlaX0m6XhVDfb2UpOLd4sxRfPes9a1eb2EAV+rNNaeHJwD2n4IRZTxehaBbDsUJL4Okg
 rYehrDOKuTjFPJU4ajg==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54c019 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=PqZB0zJ+pwaroKfoAs2U/A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=hEZd4A0f3F9c55QM8isA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: j7FhgTlN7nMNqrRmUMl_amcmn6SRxMDC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOSBTYWx0ZWRfX1VgP3vG3XnTI
 fFPBl6EzdCGshQ8nUVPXOrbCXSnFZ4CY42DYz290GqKjs7qAelvS0Im4fn+KV+twUHspUiCzuVa
 tVZ+26DOuL7QRgTR0nxFEFFsIy/AsJ4=
X-Proofpoint-ORIG-GUID: j7FhgTlN7nMNqrRmUMl_amcmn6SRxMDC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130109



On 13-07-2026 15:11, sashiko-bot@kernel.org wrote:
> This commit documents the Shikra Camera Subsystem IP, using qcm2290-camss
> as a fallback. It updates the compatible string list and changes the iommus
> property to allow either 1 or 4 items depending on whether the CDM and OPE
> blocks are present.

The oneOf was chosen to preserve backward compatibility with the existing
QCM2290 DTS. Shikra requires only the VFE SID, as discussed in v1. 

The existing QCM2290 DTS with 4 IOMMUs and the new Shikra DTS with 1 IOMMU
both validated correctly against the current schema.

Hi Bryan,

A gentle reminder to pick this patch for the 7.3 merge window.

--
Regards,
Nihal Kumar Gupta
