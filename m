Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77706383C86
	for <imx@lists.linux.dev>; Tue,  4 Aug 2026 11:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844590; cv=none; b=mZrnpnKSolt+48Dn5Yg5L+//94k213nQAcFBbDpZGzqfJo8Fce+mCjh6yRdJtyMXeIZTV3MsNnDxMvieSHRBMXqHbjXnLy2x1X2fDqd1ccx9vjRIIOMg5BHcB1r6bFWFqFW366dHM2ZF+1loRZo/ciRIMqoIPZwyyqB3+QdDpSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844590; c=relaxed/simple;
	bh=UZqgy6FnK08Ljzgbzaz579ys/+t7E1UCslpN1WeflrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lY8wTb6A/kFLnIoyN48bq62RuyYfKQNwO7gVNKBtWasc8v+UNxlKjvdzQQLwNV3Putao01r6tEzdfcxWiIGIsCHdW4w8M/zpcscgETTx3uRNqS32jZEW9MrC6vu/K/Ax4nT3LDColpA4K5Qbw72hzTS2vA+3DqOUJsPFI346Kx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N9aqdsoq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPz3FPsW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9aqdsoq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPz3FPsW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748vSRv325499
	for <imx@lists.linux.dev>; Tue, 4 Aug 2026 11:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2kSmfxx9pQLedYg1bZqHleZ3GBB6h05xkqB
	m+3G0DbE=; b=N9aqdsoqyQAYgN4FgtRTKtquperJv9u8ixJmhUHatLdJHY146A0
	VQpXxxGrthmt3NNFSnPsuP+unIjfEMfSkzoEPY//XDG4omJ3MYdTKXAjs2iIq376
	yJVEN+z1IxA42IXYk4Y6QhmJo1XNlsdpq7qLLKenW9XAfFl/4SHTD7duJe7QyqrX
	bvyqGz6DVOdmQ7gZcY+XztszprSYmsPBOzwKq6ZuwhS54062St2eHpPW8un+fbMY
	TCjRls/2For3e29fI2EqX1S1AbadqzzyzWBycOsC0jl6zoZuI19QRvLtW90GaOzB
	MS1mddo3mD9DB1eA7hCAnIiH3IXz4lJ1I4Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fud1dgnh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 04 Aug 2026 11:56:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so40484131cf.3
        for <imx@lists.linux.dev>; Tue, 04 Aug 2026 04:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785844586; x=1786449386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kSmfxx9pQLedYg1bZqHleZ3GBB6h05xkqBm+3G0DbE=;
        b=TPz3FPsW4T6UY9UWEKECvldFJ+3TJdqDaW7dl5AMtYwTZZXZGiIFpp176ZYSiOy4N4
         rQvHNg3hrmDUoOz5bgdTMYcIdBz32tVJogpflYN+YzNncuJRy4herGP1uUxwb1/Jnm44
         Q3S2/512ZOl29WZmSdd2AkajJCPkKUkuBx/aHexiOaGSlF1Me97LrXW2V+ARfRv57bIY
         wQfZAtEHm9G+f7F5BHk6ljiWhUaNzsBMiGyMqRxUr0ZWXJr0RgC5WlvwUV76+BFcb/TZ
         4s9y46nRJw6pRV7cGIZZfz7XkZ29MFt9AHITw6dvZgvjCP9ymUHzmFk5/PUC5HT/bW4k
         ntGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785844586; x=1786449386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kSmfxx9pQLedYg1bZqHleZ3GBB6h05xkqBm+3G0DbE=;
        b=WyL3hRjz99OEBqDYBoqrVbTVMYe5AW2Yj30p+t/EvXsSP7RlMIKOJ7Fdszb8QLWfws
         zmcw2dGKiZl7yBpMkyAFi6+4Q6BC5LUWnIobh/gEOdb+smHM3Pqah1UhR36J+JkdYhbd
         1LJQEE2PTdyzvM5JwqHa3ShMoG5TeT7FiBfqTPIpcIFfp3qFdc68I1Zcx/EYzL7C1tIV
         4/V6YNpPturQofkpHbKFHzL6oQ5lKq+oEMgXhkI8jbVNMa5vXpG3BMxdQokJUsCJ4l74
         RmFlVaVhjxf9dZ7UsnP30X9cn9fIuhwjkEnFEiH3PKJS3OqORpB49GiauG8TdzrSpXY2
         /3Ow==
X-Gm-Message-State: AOJu0YzF1tyHu1sElFF7G8e+Rs9fwwS4BdWmpu7t4543WGtEjDxsuJsI
	SY9yBmRAdMOOePdf05fXB4YvAoB5XRgRu5K18rDzvmgbLY0O8aoxzDxjFetwRMdg0D2yzoxOUNw
	2xSRKbVVxmIEMD0WLEiy6v2M19xOHpXu0KlMeCpAhDgFra74+rM6XZ5TEtm30LHORJg==
X-Gm-Gg: AR+sD11a8hZskHHM0/PHIUQledbA+RbuPljgSi4M0cmKMHF+9P8HqFsb6DIrxazVRTK
	2RdJJAn8Ecs/5Cpb+tK/SqlFNFleDtdSzhpmDUAjm4+lgfOdsjgt18wNf99sNEULq3qW0rTuo+/
	idAtTTvqJErAWhwHrP9ko0CF5Vf32idhbmZAxMErTtzIkKXTDJ1hxXeV7a2hMD7+JwfUdFWRbi/
	jR7iK0pr14Ew7TxsjL89pGmrzivSzriyrg2fSchYApG3gdcSFUt0oXEqb0x8W9zGVGxnjnWiVFz
	uw+bwu5nNpeS9dqDFJ2p52XAyR3vJ1z0q7mnb0K2I1BSMhLGminf0FYYd+IJYf9UcOxl84BRscE
	dWQ4JErTL+hoF0OTsqPM5djVWqA==
X-Received: by 2002:a05:622a:22a2:b0:519:e020:6087 with SMTP id d75a77b69052e-52b5679fb54mr263429361cf.11.1785844585669;
        Tue, 04 Aug 2026 04:56:25 -0700 (PDT)
X-Received: by 2002:a05:622a:22a2:b0:519:e020:6087 with SMTP id d75a77b69052e-52b5679fb54mr263428661cf.11.1785844585096;
        Tue, 04 Aug 2026 04:56:25 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458bb4esm41800790f8f.30.2026.08.04.04.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:56:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v7.3
Date: Tue,  4 Aug 2026 14:56:10 +0300
Message-ID: <20260804115610.126049-1-abel.vesa@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DLJtlMvkvuhArYosYgD96RvYTRj7IHkM
X-Authority-Analysis: v=2.4 cv=SJRykuvH c=1 sm=1 tr=0 ts=6a71d36b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=00X7bdE-9ZPR_xdJ_qUA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: DLJtlMvkvuhArYosYgD96RvYTRj7IHkM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5NSBTYWx0ZWRfXylvSKnlfSORS
 izdpMYa4Wl/anYenqwX5wtbw0Paor8ChOWg9yzqcYiJ3l/T745WoCkadchqTw1ydCLEJKIK4YT+
 fWIuoF3Qrs1+kaZ9ZmqwHSihMMRTW1k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5NSBTYWx0ZWRfX1cPckSEeF+kP
 rdR05DTLlSre8ckowyyMq4/gcLUd8eZUHsVjBqTzjCjaYPp9kWiMYiRD8jUV+jSyh4lnU4x4ZTv
 hC8ibeBGT3WQZOVtX6QWrygOLJmlHziatSDE/qJQoBDma1RNpqqTT3R8UJ0mjXNXqgfnYSfUe0+
 IdAje60Pt2FOxegP0rjNEvXQtcFxy4599YZGOQac85aFURaHc6Sds/xPLhHhzXqUWwevhamoc++
 2P+qOFq2Es9/4bcLDtYK/I/ApH9Kg9Ln/PKKNzvvuJaWmuMj7GIQ+LVXXMAs9qVr8JMRfE6N0T9
 9A3EKyuLkvpd1v5+wfkgioNrbnyRBxrORX26COhoPALCurP3ss2oF43KG7XaD+/KY1fHVtNHL1t
 MbVF3J9b6TBwlwee773kQiMehcPvWeUnRD4r5AJpmC4KkGN9ym9Gjfwux679CUOnRB7FZSEEu8y
 Pr3sk0izLo4thG0ih9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040095

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-7.3

for you to fetch changes up to 39ec460b56b26319d1f31b459e8be7ea34ae9c67:

  clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on i.MX95 (2026-07-30 17:12:57 +0300)

----------------------------------------------------------------
i.MX clock changes for 7.3

- Add audio PLL debugfs support for K-divider control.
- Add missing MODULE_DEVICE_TABLE() declarations for i.MX8QXP clock drivers.
- Add PCIe FUNC_OUTPUT_EN clock gate support on i.MX95.
- Configure the i.MX95 PCIe transmitter current reference to fix REFCLK
  rise-fall timing.

----------------------------------------------------------------
Jacky Bai (1):
      clk: imx: Add audio PLL debugfs for K-divider control

Pengpeng Hou (2):
      clk: imx: imx8qxp-lpcg: add missing MODULE_DEVICE_TABLE()
      clk: imx: imx8qxp: add missing MODULE_DEVICE_TABLE()

Richard Zhu (2):
      clk: imx95-blk-ctl: Add func_out_en clock for i.MX9x PCIe
      clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on i.MX95

 drivers/clk/imx/clk-imx8mm.c        |   6 ++
 drivers/clk/imx/clk-imx8qxp-lpcg.c  |   1 +
 drivers/clk/imx/clk-imx8qxp.c       |   1 +
 drivers/clk/imx/clk-imx95-blk-ctl.c |  21 +++++-
 drivers/clk/imx/clk-pll14xx.c       | 123 +++++++++++++++++++++++++++++++++++-
 drivers/clk/imx/clk.h               |   1 +
 6 files changed, 148 insertions(+), 5 deletions(-)
