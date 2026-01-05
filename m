Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1B53370FA
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 14:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767623398; cv=none; b=Wpz4eBz0iPHQ3gODWKH+coK1K7ST7acTtqb93924ze2vgu7iqK7AZSdWiw8osYbuiW+pI/89tL/1j/Hloc5bj2xj0wGqV7kJ+K09M2eJ/BvGlQ1HE5J1b+Emv9mD0kRqs6tBjxJoYrgdcguDTxbu8QtbtcFHhrWbmlVbfsC5UMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767623398; c=relaxed/simple;
	bh=BWYdpph40V6+ahw3fGxd5TEaRDtyIoFvWrDnre9gYGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SIeTR2D2TnrYZLfofjOQONNglIHveXqNHJH1ielOteg4VWyBQEs/EIOfatEfSXFIyCKVlrU/KoCv9+qL81ZcxHOs+jvQQO/UpMRuBr/KrAjR5VxsC7VYqLjabMFyrJBJRhr14hSumPkrGoUc9zwKR+QAH60I7/Tet7cJbLSqfIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKrGuv+M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hloa9vLo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKrGuv+M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hloa9vLo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059eS8J3542060
	for <imx@lists.linux.dev>; Mon, 5 Jan 2026 14:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+iNK/CviJGp
	soYfpGa3P7BzXOJu5rWNivgQO0pzVOhI=; b=GKrGuv+MDRzWfoH6u2MOaWA+jUS
	QMJW14mjgycgebMrgtwzzoIz1KFBvmTRklF6sUa4KahKDwl3Q4YwULmRTNGLgT8V
	C7zBejimhM++9gZO+sZQYp4ILpQ93ODbv+zI5iOwGwZfK+PPimmXNYA7Vn2LLfGQ
	uG93w5yRfvjPEQ6+p4nEe1OgI8pMBGISOm3HO+s3BVYYhGSI37a94vKxOpZcSGja
	B/tQnUYg0vPlxcriq0N3ZccNDltxupt+vOOpXW3PsgXaFMNUVs2s5HFGU7l9j2/E
	Tg4FAvhQCwJmAa8jOeVqwTnE8yPSXFUGjbk2xTLesjIK811F41xPHEi2BiQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57shsa5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 05 Jan 2026 14:29:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edad69b4e8so48817771cf.1
        for <imx@lists.linux.dev>; Mon, 05 Jan 2026 06:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767623395; x=1768228195; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iNK/CviJGpsoYfpGa3P7BzXOJu5rWNivgQO0pzVOhI=;
        b=Hloa9vLoVbN2McXWoikhXnEvNpXC8iDFn0ZksvNFe3/hv48AlWVCiFQP/1GRfrP/JV
         jsJ9RdxeSlNquO1Bh9+Ekb/CGpYY7OvnlUbG3gyU/zngT5Fn3JldmPA0r1F8l2CO7I+a
         kBHrk5HvePUrV7vPACB1abtTV3Wf2ngjACdznd1ycQd0xxLqScAfDeFtszS8SK5CfYnX
         5EbNerNpNkvVje635gFEYFe0cRTHVDQoXP2L8bW9CPG+hISrdlsPHJ4EKsw3wYkRa9qi
         GCAHcZPdXHNSsX0+SAQDCQf2iAM7fZ+ccq6Y1mRbWLm7q9xY2t/i4rpC2PSK/0OwS9lc
         QxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767623395; x=1768228195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+iNK/CviJGpsoYfpGa3P7BzXOJu5rWNivgQO0pzVOhI=;
        b=ogbh0xI/XgcHlnfbClAak8I6UaT0hKtvw1GBwvLfQBB+Asu8UT+mIfXbtAQ7tkOi1R
         TIUN/MiUtKFPpOap8gwqaRgJDou/3An+w+wwkVzLMlhxlmwU97ru7ILiWCuXoOWatjTN
         /qrNqjnmMdkOFyMKOgTOzEnB3hppadkkgCyzh40dQGYQqWrm22z0TuN55pWY0uCkvGoj
         yrGRmYu38zhOLak8BWlskRxwMgbQotak7+/CD84BvxMetTExbXkuOAxbujoTY/gD9Ept
         XAhtMHDyvXkIqxALYOL9czkn4wHtRVIuLX+2FupdqO/3Y/DoNvPZau64W5gWl4IVl69J
         fJfw==
X-Forwarded-Encrypted: i=1; AJvYcCW3pBMQf6MJ3gNmm8YqM4nIYKsB86js5A4SoZa9T6Ma2ro/k1nzTUVrFWECJ6a3sFIaX8w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx28dt8mKDCmC4h3iK1yGt/jOqsEF+mlTMA8M2oZ2tmtA9Olz5c
	vDYaWgVtE+GGrRUZ+ECqi5FIW46CA7FegzmoBMn+ITv1lE2xqd8ahXLEcnZLr92CaUEo3DbIkvE
	9IgcETpmsw9posdbnUVMXHRaeGG7yQ8djJwqnKOb0FJV/xVdg4lO3PcU=
X-Gm-Gg: AY/fxX5l5GnOLjKsKjGBUV26GPpXkNpo/ni7YsMtk745kVzBdkCY3ujreda3CwGPUzO
	lLQZeXMVj6QOPe2fRtUYa5luxcRA3hcWyHGRG7Q8DlXXQb4WZlNhY/wZorn1a7yGzBP/waRPt2j
	c1LjFuy6GjXchTsC3OnaxkwjjOfNbbdyrLgn5OairdbUD6edNRX/DyrGOaZkpql5bckZm9BKVph
	iRJYEkKGPqVWuioXBkqtWc0YogGqQz8pT7FVqjzFuZc6jJM9Otx1s5C7VSiEWpp6lXCaYW8X/MN
	FfXLxLE8sbjJOTETWZBrucZ1Rcj09MgsDaKNxNPnF0k33ymjyBZbdnxEehkAcylszdtDchGmqHu
	8DAMLplR5Qi2G2bMuW7N2QN1dhQ==
X-Received: by 2002:a05:622a:1114:b0:4e8:916f:9716 with SMTP id d75a77b69052e-4ff473d0731mr134520951cf.36.1767623394624;
        Mon, 05 Jan 2026 06:29:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE06SnXQd0QyMUw3KAomX8sIlRFZrYWQP05g/qKtByRhTo4HPd8NEFQcvSlC7YlkgOoEKitQA==
X-Received: by 2002:a05:622a:1114:b0:4e8:916f:9716 with SMTP id d75a77b69052e-4ff473d0731mr134520491cf.36.1767623394170;
        Mon, 05 Jan 2026 06:29:54 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842673b560sm2074066b.33.2026.01.05.06.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:29:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 3/3] ata: ahci-xgene: Fix Wvoid-pointer-to-enum-cast warning
Date: Mon,  5 Jan 2026 15:29:47 +0100
Message-ID: <20260105142944.372959-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105142944.372959-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260105142944.372959-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=897; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=BWYdpph40V6+ahw3fGxd5TEaRDtyIoFvWrDnre9gYGI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW8raBLsX3Vc5LQN/Lm/KA2HXWJ3ElsyFcYpKw
 oci58LT6wKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVvK2gAKCRDBN2bmhouD
 18W/D/9BzNbkGi3fl7+u/MRsmiQ4kbuD38XsWOnVNS+RGOdpux08sN4iFjzr3Qvr756CrBgHF3h
 stnwcqEDDpEEK/gmVbPiOVxnL2akfXubjpbd5m2yuaHW/1pUULHCLLL7/n4nDmihY6i7G4m8PLa
 R61etURmds9vifnE3hkCKsZfc1ZxmeEvP0XuKTTV+YSKcNuMAAABCQS2IqcphURKrif+wDd5olw
 Ofe542fLtcTf7aT3p4ntPfwzfHDrE9dAjkEO/Ymz9gmwD8/EbjqX+nChs1LkxT7Z4E+PBOjdvdA
 ZBQM2DhKPVsp4xW2bFpNEx9hsCZe1JPSQCkhZ7kCyiBKsrwIa9qV3gDDYaHP8vvfivW+0cxCZp/
 udr0JU1stNjyXAgysiXaXUcnHDFrCs+aRWmQRGku5UANHi5OSqe2yxMxKCEU4x/p2cQpSuePdNk
 RzLiw9L8xvbledztQcqx8Z48tTFoBbem3qjyplQdQ+Gvv5UQjZxeDbPBf4M7+BuSgZIaiSQGFd+
 BaPLMa//bPBu1TjLNWSnFf52tywgSbijSfC7oM1Xw/aV2kHhzLmzBnRaA15rbAFvF5XlNoO1uMY
 +SRaNcbfYi3Nc7+ReyYxQJW4/fiLDSsnsuXul2FeRPkQYje5Pveh7YYWUAp13qoPmXmcoGqAjGq Sr/2aiwJPTacv+A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695bcae3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=O-IaotXkb1TqCMFDYkEA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyNiBTYWx0ZWRfX+vRFNBZAHx/A
 lMrbCTuS7TkjeEvwWVYbChoIZ450cfHGv+nyPN8lTNYE9K6kZM8CLQnlTaOos0DKORCxb5FdDRk
 yxLGEnGLNHliHI10iHiaDyiBcXBB9ZXSToOqy9P8SUIMDuAKojWwl9JKRrnoFPIWlOGRpQCp+Jg
 ckJ+4hY40f7YUYYqGnwv94u4ddSn4g7SMF4+2jC0QZgYFbsvRXmTYBGQ+/8XbFB2Cz1j9Y7HWLq
 WVzv0W5pyvzqGhQfEHMNUsfH9kYT2NMslOYOrJol/+6gUMCFGQs+y0wdWUUkOgrnaeKHKM0DMFB
 7ajb/rTW4ksiHlQCEQOLg88xtEATrxcmkEW/ZAXqCf8Nvf+wIrWorzyOrUGhbsEEoUbiyMC1MkJ
 tdkZOd8T7ol4YhDunCiyQAgUOdFYyKpn53COgPq51ANVRoxtwss3LR08jqAdq21iO4KIfznTeo3
 vk5lP4Bxds/twXL3eYA==
X-Proofpoint-ORIG-GUID: nVtB-nxV9Dlu28el8vnvRrHOOhJgeW_e
X-Proofpoint-GUID: nVtB-nxV9Dlu28el8vnvRrHOOhJgeW_e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050126

"version" is an enum, thus cast of pointer on 64-bit compile test with
clang W=1 causes:

  ahci_xgene.c:776:13: error: cast to smaller integer type 'enum xgene_ahci_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. None
---
 drivers/ata/ahci_xgene.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/ahci_xgene.c b/drivers/ata/ahci_xgene.c
index 6b8844646fcd..98c99b5a8242 100644
--- a/drivers/ata/ahci_xgene.c
+++ b/drivers/ata/ahci_xgene.c
@@ -773,7 +773,7 @@ static int xgene_ahci_probe(struct platform_device *pdev)
 	}
 
 	if (dev->of_node) {
-		version = (enum xgene_ahci_version)of_device_get_match_data(dev);
+		version = (unsigned long)of_device_get_match_data(dev);
 	}
 #ifdef CONFIG_ACPI
 	else {
-- 
2.51.0

