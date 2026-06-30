Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B07337DEA2
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 07:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804022; cv=none; b=ENqt5ybRPXwVz2Wx5Mu5Hc7oD2eP371IPb+xMNwQIt9l6qLnObzfpZH7kR4XK44bvisKrZLiWmVCoG/9Kqdg2i7hnZF7hmns3bsbERXAhpWX/uuXzNGQG8y4DDdwEdyPaTecUIQ9UM33IJDd9vzWkEjVLH5GzLF0SNnrQlg+buY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804022; c=relaxed/simple;
	bh=m5hOpeZuulIzIeMFgswZviFdTs801wBKp4kwoyE7T+A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J4NlG2wweIsOKawWw+T+FM6/zOxKhKdtgSTXe3msmK7dqTxFKOMe6NioKd1nH9WRzlrdaqCvfKV6RyeMxiVgW+bduNpiQ0uDdJ/qKsip15aGZIHZQVAujRq0vf9WcCuuHPPPbYyBFsBdphzfDl3IoJxAoA/Qq3bFHFB6/l6NgYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCt1s9gk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2y1348L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCt1s9gk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2y1348L"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CHba1090533
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 07:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3K81payB/ssmTCzPC25RG2gl9qwdhhPB6zdKyYaPSMA=; b=WCt1s9gkySEZXdgB
	eQGrmZt2QpwpKzU6sgYaT7BGLzNL8hq9Nc/Cp83L2EENGpH/uhzY8NT7X8C6wOR2
	ZJor6BJQOymIMEQvbMPRcTJgDWxIUbqp3ZOXCKRRM4oZwPkjBVV+FbS9lJKTumxA
	0NVdk45Y9m1kFjxe9ihgb8U+SbPGfkx+x3ir32FXLm6WjNKsHhvSDYTscLCqcRW+
	c1cQfyVEl1MeXHBnIVgZFNWvEHxwOVFKjqAItnyR+8T15gw948+xFGbfjSmy2Q5s
	3ZM35zy61EewvOG6ZpllYxLZU5S2TOpqgUd3DNkdVjicsIICoYYVsgUTA/b4bnLM
	kY3tAw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5rx7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 07:20:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c62861b3bso13171342eec.0
        for <imx@lists.linux.dev>; Tue, 30 Jun 2026 00:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782804019; x=1783408819; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3K81payB/ssmTCzPC25RG2gl9qwdhhPB6zdKyYaPSMA=;
        b=O2y1348LpOfy1nOh5LVTs4C4vqcDo5z9WdXtqsVAHCf7veZ9p0gKW49jjI9jMlBlHM
         sJMR/TQc8wh6xxQI7KLTFZGPPEZhnHl0LyKWEg8iAQFPrt1EURwjM4nByQWFtu+mgbCu
         cFa/CWgJMZ4lr//6NGDkx+viS5Qiyn8x21OWuGo+jVM8iJpoyVqNYeuStHEu+GPHU3lo
         3kGv5d0KsXsIX7iLeF7L8ViL8Yk0u4F0IBtFqjEsXx9oBUHyGI02ZxxCpAvVdJhKLOGc
         iHNczo8+ERIQisRDGjtuOk72XOKOQegJJdgSIhsuk4znIM4gv8OS4eArB1Jo2xJZNzD3
         t8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782804019; x=1783408819;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3K81payB/ssmTCzPC25RG2gl9qwdhhPB6zdKyYaPSMA=;
        b=nOvu4/ImsPf0fQ5JROISFQd+6U4mx39lPpvNpA0EgX0WgLohjT+8uT/MBGBLhWwVPp
         Xf7OT2Z98pwpK5U02+a1N6WKLcQD70Z9rjqNcE+MERGohT/i8Et7/oeuNd5wQxa7nMfh
         1P3yplS5bbpI0ZnXN5ysFRWpXD2KuuevSATggp85Z6Hmd6A8YVurut7np3FniyK4OyzL
         C/Xxf8xtLT82p1e2AOgxzTUwxA3GcrtWhKiBHPQv5s+Z3/vrP3w14pkLxTasEfcKykim
         HecnCm1jXLjP5RYzJqssXbSvA2QjCojQT4Rj10bachJE0R8lmXLHUus9dJCeBY3oyS3a
         btbw==
X-Gm-Message-State: AOJu0YzKQB8PW2nY+EimdfSBoQMyNOJQF0Mt01INMCOfoJMeeyfITbaN
	v1AeuWkmldTeiSj5ACw9J5/tW0U3pRr6Wt+zfH2bPjJ7UZ6THshteorb8I5Vmpt9dLgLDIsI5BG
	XTfuVvwJJz0ihjZqMFXXB/VVow+9wt+PlA4OKyaxF6LtkmBYXqdGgiLk=
X-Gm-Gg: AfdE7cn35faRb0J2Xhhuwfg4o+YOvnvE4VQ+y27T53flXix0+pvTPywgwJL7jW5Wnv9
	qkuzedYDmAZY1cSbkr7cL5qENhFyN4v5kvPDFPr7R0msj0+KBIw10ZBoxT8txnMSIGA2/KAiknI
	cN5gtfk7tKJ5JBFTAMtdVdkQR+FeXxnFdTwNsuBuzxjLnLr6vwLpDqAKHszxijW6A/V/JauOeAK
	lc1JwccXPsDde6DxROGe9PZl9tMZYqaZ7+goKDgsHVVHC+8XsG7fWvn3Vkj97DawKNosX0yg2m6
	eDrsefcwyq6FmGnqGwDir62DJFBpgZ8KVMP5cUM1J1QYmxibNoBADEFGM3RH54hfX5zbOQ2LzAC
	fQArPB76mPQAX8vTEkWwcLlT29hVO
X-Received: by 2002:a05:7301:4888:b0:30b:c502:23df with SMTP id 5a478bee46e88-30ee1211bfemr2036157eec.13.1782804019209;
        Tue, 30 Jun 2026 00:20:19 -0700 (PDT)
X-Received: by 2002:a05:7301:4888:b0:30b:c502:23df with SMTP id 5a478bee46e88-30ee1211bfemr2036126eec.13.1782804018618;
        Tue, 30 Jun 2026 00:20:18 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.56.202.7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2fbe011sm4857374eec.9.2026.06.30.00.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:20:18 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: hongxing.zhu@nxp.com, l.stach@pengutronix.de, Frank.Li@nxp.com,
        bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
        robh@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, will@kernel.org,
        "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: imx@lists.linux.dev, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        sherry.sun@nxp.com
In-Reply-To: <20260525065443.2338629-1-sherry.sun@oss.nxp.com>
References: <20260525065443.2338629-1-sherry.sun@oss.nxp.com>
Subject: Re: [PATCH V2 0/2] PCI: imx6: Improve PERST# fallback logic
Message-Id: <178280401285.286395.10401291228239552702.b4-ty@b4>
Date: Tue, 30 Jun 2026 09:20:12 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a436e34 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=d0NiXODO0fVjScRmrPHHeg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=8AirrxEcAAAA:8 a=tFJ3_42GrAp6gSAKR0AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=scEy_gLbYbu1JhEsrz4S:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: gl4bQk9oJSpQiITWO3jWAj3Gif7n-0S6
X-Proofpoint-ORIG-GUID: gl4bQk9oJSpQiITWO3jWAj3Gif7n-0S6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MiBTYWx0ZWRfXzbTMVuqX8klw
 f8BxUn7e0IsYzTQgxwu8uMpjqEOVQPCYJ+OMNMMXpCwWMywAcxiUH2mW2w08tFXdtX3CYPp14c9
 DROyZ+GhYYaHFd+sr7EG7E0RgMmeLij7VJsBs68PxzNdVH2NnEdNOA+EZIdQTKtDjm6doXwHqip
 ehdvO1uv1/xfCxInIVgsBIsuTqute5kSMgeSQkOG4stLXOXFoBjiJDgksML2XHtcnzwcE4Gb80K
 DhJmVKaKt1MB3kKJZwakGtrwU9e4uyM2ZB4svuyA7HTT1r3xxxvd3ZQwfXBo0NtAlLpjYG5TLE/
 kHInDMaQySh+aarSr77fBRnIGNnu6q3rYh6o/4kS1l0oXS468/FvmoNjFXO9pxV9kU8fBXFjW0f
 ejSKhnRlk5SrU0PjNKwHKcdM+sRH0IUYc/wuJwV5siGVQniyI+p7gu/slhpM7qllpucHEpZ44qc
 k3cCAKJBotBQB4Qm0vQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MiBTYWx0ZWRfXzckH7esye4TM
 U/YxivdAcoz/98dFqP37F42rt6cb05bP0wfgwHDcTa7KPBmvEUInDAWLzaTIQuDFuK+FHF4KcFR
 SPjNoXw418v0qEEYHJ9nrq9+D83Lt4k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300062


On Mon, 25 May 2026 14:54:41 +0800, Sherry Sun (OSS) wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
> 
> The pci_host_common_parse_port() shouldn't decide whether to fall back
> to the legacy RC-level binding by checking for "reset-gpios/reset-gpio"
> properties on the RC node and returning -ENODEV. That's a policy
> decision belongs to the caller, not this common helper.
> 
> [...]

Applied, thanks!

[1/2] PCI: host-generic: Simplify return value handling in pci_host_common_parse_port(s)
      commit: 4b523544008aa70cda4b34c0589bbe47172c2637
[2/2] PCI: imx6: Add imx_pcie_perst_found() to inspect the parsed result
      (no commit info)

Best regards,
-- 
மணிவண்ணன் சதாசிவம்


