Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B5A30F547
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 17:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774545226; cv=none; b=NiQ3u3QjvqiQc4kig8BnQpUEuI9aX1jLmq1QkYSLPh6XjgXkhn3Je3wI4n1Yc5O4g2HxhTZVSa1fIvRm9k9MObHEI0Ff7XHlcAd25+owQ3wUSkYbgE0J3pXgFXxXfrall2xbOU81bRicIYMvkId4niFnzYkBj/9SQjklH3y6nY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774545226; c=relaxed/simple;
	bh=sxilZYXZitHxtUfBkc3ckXJkLUBUcuamR7gTWm/dfPk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oxELUPhWFlJ/DTNtM/l5927qux4VE9/0NexC5LRyGxNxoFh/z7O2AmXU05PC3Ld/MRwoKOfd6tSx7+eQmLK++fgrIh8RGviaobOC5xZO8rPK9RkHh90Nv2UBNy92XjE5Wd5pFYtafNpbyMesskIy7nf5pjY+348ZKr2+8ceSYto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=io7EaE35; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bapmu1qL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="io7EaE35";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bapmu1qL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9rkj1658753
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 17:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g84aE0YMGYbvHRps1aTbmfM8XvrjQiSe0TEOY9hRXHs=; b=io7EaE35XqZcbdqP
	PotM+4RUaphRC50ljzIhBMMybKI6p1y82Jh2f0hHFrN1yOLB1VDg9zn0rCdMbFEm
	pFVf50bBCrwMPTqWFrIU1nfR9RVc6YZSwLPpScPxsLoz1ZonypEoIxgIzFRvDT7X
	3MyR19X6nNt6MnzzwmeQRsJYV0FTTjkq2qNe7fFsu7Ype/hOrK08A+0C0OaGaU1S
	gEijcyh+qRbUZq7GtAKYexY7QMMx9h4bG/TGPnwnw53aACA+4/FgthOYPxLGCE0H
	froEfd6C5zyDOPiNHz3tgpK1o7h+ENGn5aJG7pjbQApKvg5o2L69DyltE3D9vqR3
	ziDCsQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4w1qas10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 17:13:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0601ff3d9so18462045ad.2
        for <imx@lists.linux.dev>; Thu, 26 Mar 2026 10:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774545223; x=1775150023; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g84aE0YMGYbvHRps1aTbmfM8XvrjQiSe0TEOY9hRXHs=;
        b=Bapmu1qLrixxtEgKECWKz/tOqQbfwZvXzTEUnVKot5N3CbjjHbYRL8nj3AGE5waiBF
         yw0D32R/vDMLkkjjhQBQq+mZuNmoixcAJYBa0xwqJiGY/sI/eEEhyX6ZG+0jc9UAzbUN
         3vJxc+2EHpHPftxONQnRX5AK3IYwnn1cKESLyFTmBS5sG9PwosDjm/Kgq312mJN4xjs0
         InJyqjnQ9ZGP1JlZLVFV5y6+RKl0UCzRzQU3TTiyl/xuKEEklP3L/PNweGXehnJjs6lE
         gmGIh4zDBLwgE0XXVr+1lbnU09EdXtjWOZyyqx5TrxgEDciR35ffeTDN+YqW/Czx/Ci6
         IrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774545223; x=1775150023;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g84aE0YMGYbvHRps1aTbmfM8XvrjQiSe0TEOY9hRXHs=;
        b=m9aOR60+fDjBe5lksLVmi9/AWhhiwzCPj69FlNOEK2mYvV1DQRveVfSKfU1mCIIqxc
         c0FMsc07rEY6w5i9VarZDbB5tHjJGxal4Kygv1bsBmex+VsKnYjnFPyj/7zeYYfD0T67
         ZFINpKZZf0T4MunBlfWdOxjdmbbXOoAoqxE+UELEENIjacASozLcqC2h/KKK4ki8x5ty
         usMz/IcBtHuuVSgALO/mcWyU0V/yRI8i5+sEuLtNtX66wW2SEbvnGhJ+oSkJ9RlQANne
         by1S/cyLasBW4I5rPrhp3Gdg3bhiJYoRR5s/10HHyHD3+6FUfy6tRAaBAYt1GdE9yY4F
         pYOw==
X-Gm-Message-State: AOJu0YzZMS7fN+BAquFgTp0afkuJ/Z0WncIgE9BCL1EcFn67J8SkUVkf
	Dr/QL6nS1KMzqh2ZgpiIs5VZZyjcyVY9JjR5jQ3obZV2QMd+DuU7jx3ltnAkUaDC8LlM2V40tCA
	a3IxJXEsqcj/HEDonlujKxbOJ074bSdG10XJmnn2WxP0geJKpHqe/jg0=
X-Gm-Gg: ATEYQzy1NleNEGUtt9O5Ksjf9EbTMcLxXJJ8Rim25JDz8aJm98ItCk3jHQybRBHG2Hi
	vJQzaojWoF3ix/wX9ZhJNZRIkmvcck0HwnhIjxMh9nh9Qsqm8EzT7xyYRLDtGkWmgAoXGrdtURt
	Kz/GRHyR6i21eIQ1CQBlcMsuSvBtj0rX5/eWfIbP0B6XZ7plrBl4oMBXh/hKV5+Uw7fAqqVnwb5
	peuzja3gmQHiBG3BxdqT6Z9zW1h2au5Cvv6IsggVCJtKu937Ym2WEltM3BHIC+k5mnAwd5gGIsa
	hKX54FXK6fw8eloqOwrgjqdqqHwARTmDgfj8BvqZvNSFeCYehClBnLA12MNCTTEELjrc7k0zzbb
	gY1cH8YmkzqVUwf5iPgLhXG8=
X-Received: by 2002:a17:902:d549:b0:2b0:c3c9:cf15 with SMTP id d9443c01a7336-2b0c3c9d4c2mr27646055ad.15.1774545223295;
        Thu, 26 Mar 2026 10:13:43 -0700 (PDT)
X-Received: by 2002:a17:902:d549:b0:2b0:c3c9:cf15 with SMTP id d9443c01a7336-2b0c3c9d4c2mr27645785ad.15.1774545222738;
        Thu, 26 Mar 2026 10:13:42 -0700 (PDT)
Received: from [192.168.1.102] ([117.213.101.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc881e9csm38301735ad.42.2026.03.26.10.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 10:13:41 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: hongxing.zhu@nxp.com, l.stach@pengutronix.de, Frank.Li@nxp.com,
        bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
        robh@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        Sherry Sun <sherry.sun@nxp.com>
Cc: imx@lists.linux.dev, kernel@pengutronix.de, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260306030456.1032815-1-sherry.sun@nxp.com>
References: <20260306030456.1032815-1-sherry.sun@nxp.com>
Subject: Re: [PATCH] PCI: imx6: Separate PERST# assertion from core reset
 functions
Message-Id: <177454521726.456360.10206150589096386820.b4-ty@b4>
Date: Thu, 26 Mar 2026 22:43:37 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: NJti1LsK5BETQvIWwY5IPodeJhoy519w
X-Authority-Analysis: v=2.4 cv=HvV72kTS c=1 sm=1 tr=0 ts=69c56948 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=pjPfvbXasfe8cMZvnaMi6g==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=mEf8EMz-nW-Ju7kaI7MA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEyMiBTYWx0ZWRfXyKRmRviX/Q3q
 FMeuI8hyG8md5OHO9by2Jp+/kx8YLAQAJ8q2M/mLcc4upXQSUj1GTKxuIxF2bFvlARHBVqkRAkC
 FJcS4an24oxm9pt/BHPJ4019MoAIPqrVve81qaH+gJfHJV4T5Mgr/DdNjP+MUlmRBumo97bpCU/
 I1ZiTa/xxco3nUgt7edwttAZWXugSFWZaIwsmbJjqLH+dzPMjGRQgK8OYzYHXq4W6NG2hmmQMNr
 JRTs8QppYcqMxw060Q84YQCWkQBG0L+Ffp3Zra1jKaHpG5G8VcTCZ9puTw8GBmoXySUao582BDO
 2RT7+YRt1HOLIVPygzcr/Ck3p4yBtyIVFpcmEeedC09hA4Ln8OiKW/qTkbjHWQLMVCjdDUKmgun
 gAuDMtYB60ekCyO0A5k86aoT75idZBkURMgmbucr7UPPkVOWWPWaAiTWxH8QvnWqTg4LPJl5Msu
 NLoOTl/4NtT9RkEpDvg==
X-Proofpoint-GUID: NJti1LsK5BETQvIWwY5IPodeJhoy519w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260122


On Fri, 06 Mar 2026 11:04:56 +0800, Sherry Sun wrote:
> The imx_pcie_assert_core_reset() and imx_pcie_deassert_core_reset()
> functions are primarily intended to reset the RC controller itself, not
> the remote PCIe endpoint devices. However, the PERST# GPIO control was
> previously embedded within these functions, which conflates two distinct
> reset operations.
> 
> Move the PERST# GPIO handling into a dedicated function
> imx_pcie_assert_perst(). This makes the code more maintainable and
> prepares for parsing the reset-gpios property according to the new
> Root Port DT binding in subsequent patches.
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Separate PERST# assertion from core reset functions
      commit: 180ea823bb45eb71dd5ed0dc0b78633accd21096

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

