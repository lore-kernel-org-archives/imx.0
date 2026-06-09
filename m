Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A35648A2A1
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 15:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781020008; cv=none; b=Q8b4UaTkgsyoi+UPtg9h9DQMkuZGIB9+bOBfKydM0VsWIurWwSchgndNkmT0LRRP9mWlLpTj+O0+OeSuAXnd6ApCZeVMu4wehoWsNYE6E5vuPLZprsqBY2F+e09hne/q43o+UxZ6kyKJFvzwt2l2fup54K0tvHx8GLVKMD5cbmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781020008; c=relaxed/simple;
	bh=zpF9w6itFSOJgKbyIAIC0rALq3fevBbd5Xb7VaWIxU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=II74A/VpXKaTU9kajiP5ec6otFmYOWYGXI+rB2BPM/VjS5GXh5NXqihm3QzBomXmST7hhOF5Cxo8dHQnJ1OT8RhUZnsPJpZvbM2WHAXc/P22ZoVEwJ0quJQisWplWOkEYIzsxalLeD7b0gYrsa/uzMUcgZgugawTNlX2rQtI3gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WB/qeZzd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqL1uxqg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WB/qeZzd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqL1uxqg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClTK82693928
	for <imx@lists.linux.dev>; Tue, 9 Jun 2026 15:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bw+HTzEU5Iy7MtnFBkzSQ787/7xbF41rkOAgUgVqkcE=; b=WB/qeZzddWSLZJTu
	/kqDbSiNiL8Z2yHm7uiR+9yGFtaSJt4XO1Oq2kxdOH77TwFt4I8fj/in4uXT+LQ9
	VisEKgHgJ7omEEmwGHD64v/f3zq6eDcznHVcE8DEfsZcr15SBF9J/4UrSSn8X93B
	KcSCLBZdKlCArg8oA1IXykcFFzX8vIVoz1v16dxA713hQrCBzUcUra5AGWqmgp0Q
	EhzvjWlYFWyZGgwLin/ZxCrpU0lFSk+7lkj2euau6U7TCiNmTrjQ6aBFgMcp4YaO
	TptR0OrX4j4zsKG+33g3lJnohWXnpUAGErm4XVxJu8y2xb9L05PgjH8/fexZqS5k
	EV0aAA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v1uac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 09 Jun 2026 15:46:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso88170205ad.3
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781020006; x=1781624806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bw+HTzEU5Iy7MtnFBkzSQ787/7xbF41rkOAgUgVqkcE=;
        b=HqL1uxqgUyhdYJgwA2LEFHZwSmV9Z6ml6JpGKjnsNdznEsd1Sp6JTLPzrLxB9MtnQq
         I3NLk70XcCmeHGTXb1XJxhfRgKCoIiSMhRMoGF4haq3+SCXwLONzbof0a+EDvkKVCj2N
         xbkLH4y44RN1NWTlGJUkmsRc5xpZrtcR1ppXmtgwZ88PRIucNDCaQIcUC+EcDxWRjUN+
         +gPoPW3ViNdK9n4oy6pgnqaOIq45upkEO8hR3AolSPDZbXZrpTA1eKB2e3vajcRg7LdY
         +7wsef3Y4sbcfPg2LiL8i/bDGxNhpKEaE19IvUPfvJgPiGjz1q+DGTcMnbIA51VWOLhe
         JQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781020006; x=1781624806;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bw+HTzEU5Iy7MtnFBkzSQ787/7xbF41rkOAgUgVqkcE=;
        b=LI0QhN+7emp7/jOyLGHIK2+FY1z47+CtOyCgKgm1AcFMadE5eBjtyFgnZUtBpdZO/r
         i8aSYUYcSC4clNTzvXrtuljW/Y3k2DKVVFEiFednUJJLghqeaKJiyQfVvXuTwmZmLFFv
         0O+stKjlkx9nMVKmzQHxGY8nchWRH71SwquD7pYjK/nkMbRjzojXY0d6u/eweErZnWi4
         +0ml7DrAGF/MNGzeLGu3oQwXi2Iy9mHsyD1mTHZpIKkUVUMsXq85oh3BiE3TgA2BI9sm
         hSuIWej0iUQ53QmuPiI4w2XSh8GeMoP4BEd9IQzHojeYoNG8ctte3Dlqas84CphZkmVC
         qOMQ==
X-Forwarded-Encrypted: i=1; AFNElJ931rgiA/wZU/VyPuTq9G4sdzVKz0z/NsjwcrhrVku38SReLk03GGFxdbPr5Y1b00ma6ic=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0yVM0KdSCRjPc7fCuau/sh8+v4ba6Q6blrECWMwzMoXfKBw31
	m0xqWCExK+cXXLrH+W7Nkk0duZvFIUU8o4ZN8/u0EerTEMN/kN4iGWKczFBKLdUUJ0C50I9xlSG
	0daih5CO4KSrjIPe8i43Imtx/3xT8m1WM0owi7+/JEq7lvXGwkdhgziA=
X-Gm-Gg: Acq92OEAn3W6E7sRyHKv496RKgoAWF0oKVCduJeGRFSjLKsl4/czI76JcygigWaenuh
	9qZR3i0L44pdCrPZ8ozQX40kAP4MJrgIWuZn/7K+K3zLARqmU/CmI2NbAugWyhQVxKymuI7F3a+
	eeCYQsEk/OJMH0hVycI35Y9lZmCPuRmQFEC/NYce2d2fxs1vlTkk7Xe98qLSmjkMLwskPnxMU89
	aLgXSwjBRraMB53zh0M6IS8qXCarhXjNt/qAPHUDroEBSwxZ8Bnq+d+q8mFbO88t/Nun23JI6R2
	4G7EAuRnrnS3diNNeJ2molVyQkonQMcCsnkyFnPWFpjPbY7WwQVo94d6rRxrwmaDZT+PRTXULm0
	Vun1ccjMyNYuH3WGWkBu+ErQxTcF7LGM=
X-Received: by 2002:a17:902:c409:b0:2c2:15c7:ad77 with SMTP id d9443c01a7336-2c215c7ae15mr207432805ad.37.1781020005575;
        Tue, 09 Jun 2026 08:46:45 -0700 (PDT)
X-Received: by 2002:a17:902:c409:b0:2c2:15c7:ad77 with SMTP id d9443c01a7336-2c215c7ae15mr207432405ad.37.1781020005013;
        Tue, 09 Jun 2026 08:46:45 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.203.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8792bsm223401015ad.23.2026.06.09.08.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:46:44 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
        kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260518072715.3166514-1-hongxing.zhu@nxp.com>
References: <20260518072715.3166514-1-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v2 0/2] PCI: imx6: Fix i.MX95 PCIe PHY initialization
 sequence
Message-Id: <178101999933.10755.15039783004341281715.b4-ty@kernel.org>
Date: Tue, 09 Jun 2026 21:16:39 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a283566 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=eDurORsI8St+1bJHqsJewQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=6xSj6z8mzX6N8v9Jz00A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: JlYh-Oja8X5DTMb970KZpPYKwDCHUK2T
X-Proofpoint-GUID: JlYh-Oja8X5DTMb970KZpPYKwDCHUK2T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0OSBTYWx0ZWRfXyLRz1ZjcNQkN
 C1+oZDssaMcKdIFsqLQxwJJYhNGPpx/GpYma2qrhEEnFPpEgSoLYDHZiCs1zNiDyBZnoSZecyHt
 ezhessvE/5OBhSn/YQ9vjm0vXZowrozYji79/KJ4m1B36MtJuRv11giaHMsgPc/87Uxo6Ykyzw7
 Q30Wnhx6+Vfy97XzhLm9ZewHmCKPkgQ8d+Co2DR4yPhDuYDrfneFecsgSz0ej40vCIhc5e/T4Xl
 ReXG9w6u8N6lavPVMUKZvthIxsCAiKlIPGXIvZdxy06eUA7pv7dhS08E4jSrEx0vMXTx7m0NSYI
 4OCq+AAZjndTw1gwZBubxwCaWWhCSPFoByODe+BY6qakAGsrEVYqAhRI0pxplRZtYEtwDAW7XuV
 isLSt/UvJQKscJ4gBl6PX60xU8v38bxtsWbaLh8qkvbGd5cRqLoKqDGd+hqmGTD0LpiJLnh1LbW
 DG6xahSC+/jZhBvpnvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090149


On Mon, 18 May 2026 15:27:13 +0800, Richard Zhu wrote:
> This series addresses PHY initialization sequence issues for i.MX95 PCIe
> that were identified through careful review of the i.MX95 PCIe PHY Databook.
> 
> The current implementation does not strictly follow the timing requirements
> specified in the PHY documentation for reference clock configuration and
> PHY reset sequencing. These violations can potentially lead to unreliable
> PHY initialization.
> 
> [...]

Applied, thanks!

[1/2] PCI: imx6: Configure REF_USE_PAD before PHY reset for i.MX95
      commit: 0c26b1c34d12d4debfb5363cc0be6cdf68e87ba2
[2/2] PCI: imx6: Assert ref_clk_en after reference clock stabilizes on i.MX95
      commit: 9dda3f83ba677b9cc2613cecd9120123000ae50f

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

