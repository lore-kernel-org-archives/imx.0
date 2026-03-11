Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6589F20E702
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 15:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773244205; cv=none; b=QkxY4M3hYd6EasmozhqycclVOIzrkKZlwp3BJNSiYW3lhIjBu0coE3dy3DCheWhfi0mH5E5ONmLOkwSc3j/Ad4cYMDffDTGgEoarZQlsgt7mJ8/uFxwf5xyEP5ISp2eMnldx2eNIvkBy5rbrfiz9DdUCogBX2JLfOLMGTAHcSZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773244205; c=relaxed/simple;
	bh=C2nYk8Q+Ab3eCX4sLeShqQsezv5EmApIAthgh7Ov5No=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fkez6H1ngBX1FL9YaMitAPFKphHs0Bt594E0UzJxr8plUkkMHDW9xPLLWYGY+E+w5ew3D+mrev8sI2hFnG5TMUg1M3eiGjpugd+WHeAbEEsKXn5JP2J7+cjPccvFuEYPRVGQ77vsMbNwScmyiBicC/F7ugeaUiwdz/ybv+O9I+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JL1maBP/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SVL2Uuhn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JL1maBP/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SVL2Uuhn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BF6QIV614004
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 15:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AEkwQaRLxJA9vvcYTFRA9xeDnZL3eiAJd5x
	IuCJlDT8=; b=JL1maBP/kOYChBzp2/3bUeqymrJt8WKTQIENKIr4PcgOVMys1uy
	LqLnS9mrCWEQazEsoQ4uGykKb6m+mH0E7SL82WzGTgINZvsbFd4TfVR6Q2R6EZOo
	GZaF9ztciDkkWMO5+Iklnafr9bdXMn21ZQ6jyqnYTmfx7s5mTSm2bh3LopTJAcAt
	yHVIOcyJlqwMO0a+C4x6t/6X8XPIOrR2vO+gNkQdzFuXRb9n7xX8SLhyFFXAxzIq
	je6biAa5N4FQT3u6+lVHPeyAFDf3It+g7sVV5g1s+RMDBnf8BiHPY69OLNoMKap2
	KqaGR44Lm0hMJ/xzeTi/xoMvr+SvadjULaw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu0jf2nw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 15:50:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd722c1a69so2656097085a.0
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 08:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773244203; x=1773849003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEkwQaRLxJA9vvcYTFRA9xeDnZL3eiAJd5xIuCJlDT8=;
        b=SVL2UuhnJDo1Nublz7UjVqQzrQZDv/FQkmB/zLbqD/PGkr/IuqyhScbI2XWZPA8Gdy
         0Tt844Ax4WNMGrEiN4Y/Fj855C9S3zjgYouCQsqSbnrgo5PSh2O6hsczgI5aVvI9mdH4
         +r+H+uNoOM41ZgL9C0af/VDzUtmjBgaGZ5xYHgKuT05MUli26qbk+esRyNyj8nNRMfon
         DeJ0IWo6UuGlL4A4tD/PT4hlGhLJHTrPVzQWKmbEPysB+tSI2o3vbdUG6K8ORbNTm60c
         iQQD+rKxx6Lm79qMmGeULJCtTTsKr1kOLQJ9qgqeD2vcvRab94VgFgRTYJzkamSFTs9a
         LX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773244203; x=1773849003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEkwQaRLxJA9vvcYTFRA9xeDnZL3eiAJd5xIuCJlDT8=;
        b=Wb14JiekFlTGRd230OfvBpHHbrTQIxQrdWd4terMIgSIomA2uh1wOrR4Hne3Fqrt2v
         fKH3TBBRMxV8874HgcyBMSEY8nNZOSkMn/5mtwW+Wh1dcM2cDRt9jAg2F234SfD084fc
         ys9uyEGW1cJcM55BstTxnMEFM+dU8g4f2qyaJpTsrVn26UYYigs5gXffdGpFsG+m/GJg
         q/q7qCRrPkbKbgf1dUxZa2u49mrQFtXyV0XuGSKaMFNYWVDl6/RvDpQPD9+R+tDAcvMG
         hRUbTVn2Aso2tAIFdbO0rDi7uLh88tXz0NQMtaYE5TcqsapvAXWSXEe6+BsKZZHfdFCj
         EB3g==
X-Forwarded-Encrypted: i=1; AJvYcCU9hVdSbFyMqZnNoht5TTIZQiGIKUy4Bj/qzHXOagZGvTfhGfaNzlQLlta/KW8S7qzOw8I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdM2fg7HhhaZqaLbJ9ASAAXo2Mhxm5tihBKYJdfCNKNVt8Q3Z8
	cS1Tvtrw0bS2b9639WaznIi+ExAIKydLHzz7EvE4DtHgvCaCJ8mv5BAXbvxggMtXTzMhv+6Px6B
	997k468C4/5GP8pVrWK3bFi54RcsmDrPGmUbv1BaFQFyjyobkTebSsns=
X-Gm-Gg: ATEYQzwlKQlkptNBn7xuuQQXdSUwNKpMEAFCEJSpcBRAlVXU7iTG8Rhrnm9D88nOKQq
	Ix/HhdEkCiATst2kZT8VyxdwjBXCgbYm/99PaJJwHnV03lFezuEKO6dGzucCmuEQ0dtle8NoipK
	nk3ioQH62HewVyL3JwF2P/re10wts+ZkJ+sqDsynrUjRjbLcZUtOGGANKdK+sklz+/SGPD0QgT3
	J6kYBlCNFkFF5IWilZpssxlY1IUSCzcoR1/iB88yokX6Q9+NRI1RLvzO0+rkcVgQ6j/ihXSgK4p
	pKoIXVnu/O+8MgptXq4viond2ZxNxd1sRaVd8T/7639lRUXGne8uZSCj+r0OKOF+m9+MYGMQdHG
	Ket4fkCtfkIxG3ZwUcY6ndalSm6QDueOL/Fha
X-Received: by 2002:a05:620a:4710:b0:8c7:8b8:e0ac with SMTP id af79cd13be357-8cda19e4a09mr392806785a.12.1773244202729;
        Wed, 11 Mar 2026 08:50:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4710:b0:8c7:8b8:e0ac with SMTP id af79cd13be357-8cda19e4a09mr392801885a.12.1773244202236;
        Wed, 11 Mar 2026 08:50:02 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0c678asm25127285e9.13.2026.03.11.08.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 08:50:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: PCI: fsl,imx6q-pcie: Switch to undeprecated reset-gpios
Date: Wed, 11 Mar 2026 16:49:56 +0100
Message-ID: <20260311154955.145120-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1322; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=C2nYk8Q+Ab3eCX4sLeShqQsezv5EmApIAthgh7Ov5No=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsY8j37sEQYNwmd65+VttyEmNwS7bCq2VKR61M
 oCYcZDBMZyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGPIwAKCRDBN2bmhouD
 19nVD/9IUrpN+dEj0fwoVFqS6y2ML9jcKKsWw7J+T0N5997e5aKAf9bXviyJxONAOuJbPW1aub5
 O/QZ07/jMTD/qSoZSkZxw2tupWWTX8hQX4qxvm3+ipKVtB3f+BvrszabFBb9fdkCv0br8BubzJL
 4VD0KU5PXunS0t/vDwGQAABz/SZ4reuF+BnDJ/EhPuHngRJCvkLgqMzP8sQDb7TYHO6JP5Fu5Wj
 eCupammRMm8l4UmHsq6pF92t8kHLDAgetZTe0m6tX1ACwKAzjLxlsii26eZ43tXTfqM+/Devqih
 MjU/JSqVSLF24hVXBmowLTeNDCoefiFNQ+mSBl4U6IRgI1z8neaymNXPCfE1F1xYN3s3/K4C6dd
 w7vydDDoygzl7lzHUVic5qAINPYCmDnrU/kgO7d4eEcN0EmvDuxay5FHZdHVJiONxfDOrtmUXzG
 jZx+r313tKkUX0lgtrSyHja+yfDG94KxKtCYqJZMQ9mBhLbbtVhza1yRZxCv6Ws8NzHOV7XjjJ/
 mjWRvef5IPAroB3vpYid5UXQs6id/J+9xisIBvi9W4xr3zCk2KHMmUtHoVdinoZxP6Mg45S/mMn
 dOZe8FSLTfdQqgQE7wCfCozJs9l7uWerJzCF+m6xJcoDv4wqCrXe9Zwoo71EJQzPm8SSS3MLR81 E4gyne22u+GnGlg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3PZstHMImy1zl50GWB1P0fe2onfyYR1I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNCBTYWx0ZWRfX16oiLW7LVZIY
 D7njeirbu9EyW6rCFzUlc7GlfoGqo/a62IAeYeM1maXwfSRuLOLzh9PZgurUmdNmcqPgbowoLuQ
 yl9PJPDveQMsV/STKNO9brWsefvWYJs8mRfO16PfQtRQdLcLnGHOQ7gBLEx4eE2O6oDml9BQzMd
 3V4de42UfL/z+Sb0iHP0yP601PLOM5UoRpYXThdkCsgaug9Yk++hh4qTDxSbDhAxKnlnacjP0fS
 2ChSk8F/KoJrmEWaY/hvSm6oiCwyyBmLrVdzd7aJd5YczCJ6ONUENYOR7z/Dj8yEyYfcd/VBnVt
 /XBi2Pna3k+ZMiS2gyuWtGszX3Dttm36Hg+lAh1eCjfGXAOWSub4t5J5LnSO3nWiqvpORKu/6Bw
 czj6bNAbXPLSic1+6oOD4f5FT9/pXw4bOMfCqeKQyQkZghif1/JRpwTk9K1RTSjDZxtwmKSLuP2
 4G3Squ6KaxEbBr5EVlA==
X-Authority-Analysis: v=2.4 cv=FMMWBuos c=1 sm=1 tr=0 ts=69b18f2b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=9ZXkLDzuA0wS_hkKTN0A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 3PZstHMImy1zl50GWB1P0fe2onfyYR1I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110134

GPIOs with "gpio" suffix were long time ago deprecated, thus
"reset-gpios" should be used.  Linux kernel supports both, referenced
schema snps,dw-pcie-common.yaml lists both as well and this schema uses
unevaluatedProperties:false, thus change has no impact except code
readability and removing deprecated patterns.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
index 12a01f7a5744..b9ba938c6239 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
@@ -58,11 +58,6 @@ properties:
       - const: msi
       - const: dma
 
-  reset-gpio:
-    description: Should specify the GPIO for controlling the PCI bus device
-      reset signal. It's not polarity aware and defaults to active-low reset
-      sequence (L=reset state, H=operation state) (optional required).
-
   reset-gpio-active-high:
     description: If present then the reset sequence using the GPIO
       specified in the "reset-gpio" property is reversed (H=reset state,
-- 
2.51.0

