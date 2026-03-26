Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D485336C5BD
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 16:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774543998; cv=none; b=Mr/zuINnQaXUNfkzUSYZCd/ckuBJvkygk0FEdjzMrk6okmR2ue1lNes7AW8Gybh8Pp8kithIvxmG8BCBb4Xsd1ge0qq2JSuwdG/J4NQv+hwyHBy/lbrssQQNprWc9NucOL+HYx7b+HrTNBTga5BFFOKAaSXIOfKyLjHtYHiPSOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774543998; c=relaxed/simple;
	bh=a678yhp3JDTo7rDUkiJiYhzXeFmpJaBVhgpe2Xcw6B0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Knmgdt0y9efQIPI8BjQ6tCJ080otj44YGsMbblaONB9ZQZNyV9I5E1JM85EbYCvTDyVoECRzWITjxjeS3Ic8xDaHIZo8VyX/9tjTVIZo7N3Jm6hD3tfx6mSnwQNYL0nxV2H/RcQHeXSshDgL9Hm7D+RAO39pIZPftPcS6CN40yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFnsfTfs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cWc6SB5I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFnsfTfs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cWc6SB5I"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9dqx1088023
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 16:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fg9vq1NSbflBQy9gaZali+s+bMitFkQSj4SmPdzwvoc=; b=PFnsfTfs6oJ5S1at
	mIrYfJRqq+Skz3Httf6QVckjDdKrcQ8E6KVGx1Wn/Ea6ebujOjTzswIZAtcu5tdN
	zcsIZftZ0cUN1zv4QSM8o9fgqsylETavI24SNdrcYVrxihmcgkD8HeWuq1Snm07n
	K6LIRxu4COIzJy9fAsU7vk2dg2rVfvA1iOshfn5T2+/lU51JQoPeQm26XxB8GggG
	5jaAzHGlmtYaypbYEl3dJxmuhuoybAZsyCjVj/1N7PZOycky66I8bVOcAaeW9lyW
	FsjstywPg4lUJPCYGProEuxjxzeUciMFftCbQhWgIkDBnjUTQCKrKPCJ6L4BLbx/
	XTdstw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4rcn3gfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 16:53:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b059511554so35638505ad.0
        for <imx@lists.linux.dev>; Thu, 26 Mar 2026 09:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774543995; x=1775148795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fg9vq1NSbflBQy9gaZali+s+bMitFkQSj4SmPdzwvoc=;
        b=cWc6SB5I8V1XLgyDky6QTbwiQ2EjEp+Ocg0EqwLWR/vCdTqHMALTx//V9w9W9ybsdB
         ICpEUMJBbVDNvqmnnPLiEB6DKQf/tdOIAs3fm30UVJeAzrHCnThcKiig8Nu1TeqU9nCN
         Em1JOZ+b2KzUuFZeC4s3an5AkCqWN+jM9j/9N/kCXHmrj+QXHZsM6zfpmwXWd3h8GpwH
         nZsXfqYghTu9OW19U6uXfqVkhW7ssJfKKiecQbvllljmxy+vQFQYya7IT0YOZZDgWDjU
         tymV2MbzJ/IlzjV2AXP4zADkmQRXbf54kHgJwVc894AFJk1drt6Si9yLgAcGI3t3R8Ai
         Eyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774543995; x=1775148795;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fg9vq1NSbflBQy9gaZali+s+bMitFkQSj4SmPdzwvoc=;
        b=aJI6dkQqA+7WYRe2oVg8de/Uw0jgrZELuOPmVjL1/aDr+zcgfllQIB61Z3jSYRxVIM
         BePmwcfsyvVVUR/20r3oAAiGcUEk84ZhtRXf8y1IqTo/pyoDDugNvEogc4N2YMr0k4Us
         RDB2Cp+tAjozA3PdbPyHQQl8jBTJzE9Ap7+FR0aNhH0OWciPz9heMku1YLALyUaZbS6p
         ZFAh+geCHfuPILV/g5yq3mjKgz00kR4RSNuC9ibM8H9b9rcuaBxHf09uQGTaoBlirk+T
         SoBf3L5T8l+aZpit1MD0OwENtZPjuv0vHr+dXfv5XCVllXI0IAJp2XMMth2lGudXiLkE
         49SA==
X-Forwarded-Encrypted: i=1; AJvYcCWFY1zg6Lxesco6fuH3qcQFA2Er3JuqOAPrU9MMOKLfR/MuYfQMJOT6qb0okOD3BSiGYrI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXv2VMYAxeCFU0gfN+b83ioYbyiZqwo/r8J7g5VDHLm1cZ9PNk
	a8wwT3tpM5gHoE4TvLPCmf6OFqm5NW8wtD90sHEvb2qp7AAoZevhRwIW6bcIr80iJVtJXVTs14y
	Oxdzk7bLkzWX+zeu9TTJdCWZOZ5uIKvmFIDrSkdY7hAzFc2tmEKfgkDk=
X-Gm-Gg: ATEYQzy4TAkxm27WqJZmCx6vRCPl8ZpXaVH4mVAXWM9KPbBda6MElZcmhBqhRVmsDuR
	zNNnXHZQKjfOu7hF0ugMDyMEFy8/bpeDckFwbWb9xifJ82LWxM4VcTNKx3U+MKIiRlZgzw8hsU8
	34iV6Hmg8yrIu3gHZGPvZlNOxqD+YBlOgoYD2TZrGZpAo3HnsfwykcJVbTX1GATyHAJfjaM9DRe
	uWuIs0Kyad5YG6DQH0K3e/az96cWRmm6ckY+7mvwxB9xPoi54+5jEV/10JQzDJQaQmF9oTYaGHm
	JQovDsBSJvU8KyVUFhYd6DC2LXuASpQ0lQAulxPokkYA+CFk0w22H8wLEcC2hCDNmbrBjYKiF/M
	UAA4dDwpN5TDZBE/yhxh4LvY=
X-Received: by 2002:a17:903:3884:b0:2b0:a980:367c with SMTP id d9443c01a7336-2b0b0987e22mr93048415ad.2.1774543994732;
        Thu, 26 Mar 2026 09:53:14 -0700 (PDT)
X-Received: by 2002:a17:903:3884:b0:2b0:a980:367c with SMTP id d9443c01a7336-2b0b0987e22mr93047995ad.2.1774543994189;
        Thu, 26 Mar 2026 09:53:14 -0700 (PDT)
Received: from [192.168.1.102] ([117.213.101.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7bbe57sm47090225ad.34.2026.03.26.09.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 09:53:13 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
        kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
In-Reply-To: <20260228080925.1558395-1-hongxing.zhu@nxp.com>
References: <20260228080925.1558395-1-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v1] PCI: imx6: Skip waiting for L2/L3 Ready on i.MX6SX
Message-Id: <177454398920.452566.5271838432728945617.b4-ty@b4>
Date: Thu, 26 Mar 2026 22:23:09 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=Vdr6/Vp9 c=1 sm=1 tr=0 ts=69c5647b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=pjPfvbXasfe8cMZvnaMi6g==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=rcZeYksTzYAZqbyAQKQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: RJ6clKLCqdvlLmGhIzkhmmxq83_ySWWh
X-Proofpoint-GUID: RJ6clKLCqdvlLmGhIzkhmmxq83_ySWWh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEyMCBTYWx0ZWRfX74wFnzEng8/7
 ynQQzZDiDps/4eYrg+ZqLZmKh5C8b+MD/x/plq9ylLg7+SvCaJAUw1YoTTD5/ofkDMdxHCsLOJ3
 oViIAJCAHyAEyhX0Oh/WCuGZAOWFXl06Tu7XjH9ObGSf9gIM0ZQ0xl2cVGtNIKSuA9BI5VBtqUq
 voWvKlOkWmbH9FQOER99iRv/HUCKrj2sJRc4jtgN0BgJsAWwBMqIsXdhaRW3q302aPjQWEVcmxs
 QZxgAo0ROS2LC0Zkjbi32j3PhmdipASLWk+3d7EQCLtWD+BF+57i6NfeEPhKHy2UMnBDhNCEN7r
 eBkGotVPWMyqirkPD9xeubFVHzFZEh/y4r9BjfLerRg+69ZTYVd9g9YYxe/BhTT2K4i0/l7tVYd
 TFG4kiFLMT92kQ+yIFtjt/P91mqtoL7tshogHhy4IiYSQt+N98uGWi62wxSXLGfRtH3zNuPg7HR
 EpePDiT4z+Mt2e9FGFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260120


On Sat, 28 Feb 2026 16:09:25 +0800, Richard Zhu wrote:
> On i.MX6SX, the LTSSM registers become inaccessible after the
> PME_Turn_Off message is sent to the link. This prevents verification
> of whether the link has successfully entered the L2/L3 Ready state.
> 
> Add a new flag 'IMX_PCIE_FLAG_SKIP_L23_READY' to skip the L2/L3 Ready
> state check specifically for i.MX6SX PCIe controllers.
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Skip waiting for L2/L3 Ready on i.MX6SX
      commit: 5f73cf1db829c21b7fd44a8d2587cd395b1b2d76

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

