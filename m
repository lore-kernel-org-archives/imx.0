Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E678433B94A
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 12:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616094; cv=none; b=MXXgnMqZ2AZti/VEdBPYIQhM4RwVT+SsYn1GbLORklebpuwZ4lMmej7aDeaevK8cUCRAtNAKzcz456M+RuX5KG9DF3vHpvYOFrb1VZaX5TYdEWpi93V14YqlELadN7LtZDwOixomvijQjCpz3SaV/894JBT0TBGGGL36PnjVfMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616094; c=relaxed/simple;
	bh=oOdjw5Byp9hHCPO/ockAN81t86SXy2F/vEnb3wQ8Fiw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tRU+qazJmNpw7dxwsbWnaTKwr7O2BG1bQMbt8vSSkkqn9oLh+Uy12ZSl4TbJ2ZNI0ni6ambe35DDKeErv5BBSyAMyi3DfP5YKPL9Wkali4YoICxMGs3r/6Inr3GSRbmGsyYLxBIJv6N3iNzXU1rJ7bPn/Gn3WP8nzVJ31fxJLas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QPZyalOn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BX7Pw5av; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QPZyalOn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BX7Pw5av"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058KLg93927694
	for <imx@lists.linux.dev>; Mon, 5 Jan 2026 12:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FhnBgqCd894h4xDDyalypD
	S1B5tbKhHsA76XEw2zZxU=; b=QPZyalOnblB4vaPsgrD/LCt8SvD882UV71zW0z
	XdlhiHYZwBkV7qbOm/nIGDNyp1udmWPc/kfJhuFovga4cXZILGzTRMCrnd9sGi9G
	cqpDsVGpjjO6wUbZIegEEwTOGky17bZME8R++zkstSucabaNjDewwvMyAcy5pSbl
	vP8wXu4nQMBeTHu0GeVH9XN8MO07EqDd4LIN3BbaAnE57IAJE/AtaYt4W8e209IB
	OI53NTZVNBTkoU8Yh6A/xWlqDS+Uu6GUT0AfohJ3Cnyv6jz/4hwF37US6bUh6l9y
	qPFVFC2m5lpT/lmtabxI21tm+4/wuCPim44/h0NY6/1++Ifg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bfyx0hx5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 05 Jan 2026 12:28:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a13be531b2so317921415ad.2
        for <imx@lists.linux.dev>; Mon, 05 Jan 2026 04:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767616089; x=1768220889; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FhnBgqCd894h4xDDyalypDS1B5tbKhHsA76XEw2zZxU=;
        b=BX7Pw5avNByYF4vAiQgkLkg4l+S8y9YpiHo0VFFvi+MWJjqRLCN+scMO4KK3fC4WA1
         kWF1y5cDzOwpGrDeLi+jM9Qt9zdGkvFzZTIwgRKk4CRWrid1emoZ9m31j9p7BHIk2iNX
         RGKDX9HsrRxMWi4JSwMvA4orItFURCY3c7PA6ixyFQJ2nWFR0X2HtYunzvSaI9c4WdD6
         B8S2SsE9xDp7a00TTJ3GAwLokE+AKdZz1Fu2oNs1u+ufBeHV3kTB9u9y1CEmjTGSko5p
         c0FTAcigiyfvTRiYrhxtdDGVupkO5clOJt8P/gYbnQlbLtDDdRLpP4ICxy9iM3aPKPkn
         34Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616089; x=1768220889;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhnBgqCd894h4xDDyalypDS1B5tbKhHsA76XEw2zZxU=;
        b=aUXaJu6n/woGa2BF4y6QIeQpOII2lCjl2sfyyioGlg4FQJgaBV7mGwaxv+HvvHCg7V
         WNx6EUTtFNJ+Tiwd2IICwJfwvOZJ+yv392YQPHNBd0JQDSmeFqsvyRw+7giOJFzMQPty
         vhMEdZHl0uBiV+Dnw/w3SySYg/4dpzwQwf1tcTejU0EvAHcNJ5p37KbXPk3AwFFsxCej
         BbYKR7QhAXeZG7lkx4gTDpg0BdEcZwazZH3w9X6Jt7+89qkGZVxe66bZsDlYfuzG4kAV
         hvM1MLkKDIYXjaSMonMUjklPbvDVfdr8LikMyb30jdyGUq82x99oVCFar8US5/XMEk8D
         WzZA==
X-Forwarded-Encrypted: i=1; AJvYcCWX2Ud14mcLEGGdL3CipPRP7cQg8YvjHHw6Ez7IxVyBM7PkwckQnW4sOZIJNH8i58xnWMw=@lists.linux.dev
X-Gm-Message-State: AOJu0YynB2iF/YwbgebrYjorAgEztpPaoHzR61Mp4D1U9+QqrU0WJSk0
	E6WwWiUJCxPSul8TYE//KK3uXEBXz0llR4G3+KganHgzF1HcN7zsX3sC9t9lkYN8v+yesUglLRU
	k0fnVWN1U7raAyq46WEvl6iwsgCg7sbE2R9jtvN9+x4gclCsNjT7uNuI=
X-Gm-Gg: AY/fxX6G6hYd3GZ8aEJfR9SZn7ytcPJ7Fx6S/vDo0jX+zklJL8wr1oHPquqGr9J+Rvi
	dw/P06Fo6TBaBmE7AUTcdr+qvzX3eMOG6XIM0G5T287qam6365ixl9iPY1g1Q5iXStbbwVzMksg
	mhA0bQdKlDg0wOjvaMVAVf3FHiBe/AOoc9YoT3ZA3O15tWwA5FHHZsqEdl6eLG0BXLr+IlEwC9i
	ObGOSs1MHMrG6HYoeqPr5WXPD0JX19a3bV9kYhV5pDkAJM7BVnet3CY93AnswfESXDfv2AezwZV
	fVwDPMBJy6OhZsi8Ehcs/QYoRL0FbkzR99njk12851wRYVsabdc8YcX8L7M77TtTEjuq6guA4C9
	EYqRr8hswYd4l3Bpalj5l0Z6faJ//IGlZVeU=
X-Received: by 2002:a17:902:e5ca:b0:29e:bf7b:7f36 with SMTP id d9443c01a7336-2a2f2a41a08mr391760985ad.58.1767616089411;
        Mon, 05 Jan 2026 04:28:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IET+z4gvln2AUwlbFjFw+MzhBkeuBLY3bqxJej2pC+/8tWtSlxole94SJbnplA8xuBW7zdQcg==
X-Received: by 2002:a17:902:e5ca:b0:29e:bf7b:7f36 with SMTP id d9443c01a7336-2a2f2a41a08mr391760755ad.58.1767616088758;
        Mon, 05 Jan 2026 04:28:08 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82a10sm448109275ad.26.2026.01.05.04.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:28:08 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH 0/2] PCI: dwc: Add multi-port controller support
Date: Mon, 05 Jan 2026 17:57:53 +0530
Message-Id: <20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEmuW2kC/3WOy24DIQxFfyViXSJsMBm66n9UXQDjSZCaTArpq
 FU0/15IF53msbF0LZ9zfRaFc+IinldnkXlKJY2HGuBpJeLOH7YsU1+zQIUECpTsT/Loc6Wk6wK
 pyNANEUS9P2Ye0tfF9fpW8y6V05i/L+oJ2vbXAmAWlgmkkp1G6nUcYBP4ZSxl/fHp3+O436/ra
 O4K2tqO12Ak6513JpAZbsH2xYR/zfhfgE1gbPSBSTOEBwK9FOilQFeB7gk1RUIi++j1Brpr0BA
 RO2vYdfFO8zzPPxbKniedAQAA
X-Change-ID: 20251010-dt-parser-98b50ce18fc1
To: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Greentime Hu <greentime.hu@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Chuanhua Lei <lchuanhua@maxlinear.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Pratyush Anand <pratyush.anand@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767616078; l=1933;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=oOdjw5Byp9hHCPO/ockAN81t86SXy2F/vEnb3wQ8Fiw=;
 b=WU8lb1IRlgnKDoA9DoKTUmSQTgI6f7zeHzmNW0Tkt7aRJYhehUZTwlR+K5OXYgJ0gdfAFYhjX
 qSneDuM7UF2AaUjsAqusdejjuvDVr2QpTc2oXVQufADAoi3I1PrM2Fo
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=CZYFJbrl c=1 sm=1 tr=0 ts=695bae5a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=k2kXPNx1VYhKFT5-HLMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwOSBTYWx0ZWRfX+o49JxhFyS9p
 vdoEOil0rvr9GC9mV0PeV3pqeIGCj6xMqoVhPGoTFfOzuDkORUtELsBDOpZQRXbxyt1id2jMLSK
 xXtvqgWoGSRic5JsGrFLzksbn+MQCVRpLbajjjbTv0ngE9r8fp3Hc4eb1p7O9TYGnX9eVmawd0R
 BlE798YLgVRV7oEJROXJLUW1Fxalf17pg9QAUV85ptfm46IG4poQM+z69feFvV/SeWsiw0OZz2N
 CgIzO2FjAnNy9BKD12YFMhB4da+9qzrXS+wRqf/sv0VHbRpfWxPV+7acb6cAMihnIrsaNnMGirq
 /0Lvu28/pYJ1lUccJUmPYu4Pt9DSOBu9uxT+SsVmndq0gBqr4/rFG5WYyq3khEL2AbK7tC4wvcb
 hoWeM5KfJfyTpKQFvEsZWu6sOZxzS0y5s3eZTEWg8XaHQGKyqwmDN24ZhH7Xqfd9beZ4V3pUz7r
 x/ABT6AhywB0t//YxsA==
X-Proofpoint-GUID: _u5jqfA3K8SUsooN7PGQHuSoJDnH2Lda
X-Proofpoint-ORIG-GUID: _u5jqfA3K8SUsooN7PGQHuSoJDnH2Lda
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050109

This series adds support for multi-port PCIe controllers in the DesignWare
driver. Currently, the driver only supports a single Root Port with
controller-level properties, which doesn't work for multi-port controllers
where each port may have different configurations.

This series introduces a per-port structure and parsing API that allows 
each Root Port to be configured independently via pcie@N child nodes in
device tree, while maintaining backward compatibility with existing 
single-port bindings.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Sumit Kumar (2):
      PCI: API changes for multi-port controller support
      PCI: dwc: Add multi-port controller support

 drivers/pci/controller/dwc/pci-exynos.c           |   4 +-
 drivers/pci/controller/dwc/pci-imx6.c             |  15 +-
 drivers/pci/controller/dwc/pci-meson.c            |   1 -
 drivers/pci/controller/dwc/pcie-designware-host.c | 168 ++++++++++++++++++----
 drivers/pci/controller/dwc/pcie-designware.c      |  32 ++---
 drivers/pci/controller/dwc/pcie-designware.h      |  17 ++-
 drivers/pci/controller/dwc/pcie-fu740.c           |   6 +-
 drivers/pci/controller/dwc/pcie-intel-gw.c        |  13 +-
 drivers/pci/controller/dwc/pcie-qcom-common.c     |   5 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c         |   4 +-
 drivers/pci/controller/dwc/pcie-qcom.c            |   4 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  13 +-
 drivers/pci/controller/dwc/pcie-spear13xx.c       |   5 +-
 drivers/pci/controller/dwc/pcie-tegra194.c        |   4 +-
 drivers/pci/of.c                                  |   6 +-
 drivers/pci/pci.h                                 |   2 +
 16 files changed, 226 insertions(+), 73 deletions(-)
---
base-commit: 097a6c336d0080725c626fda118ecfec448acd0f
change-id: 20251010-dt-parser-98b50ce18fc1

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>

