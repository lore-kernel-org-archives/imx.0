Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD8036E491
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 15:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773244208; cv=none; b=hHL9Yd9fA8M7vWF0La3DgT9ZqUzoYshtqk8RHz7DBHhjXpvLb0HrQbN4C8LAfAzLG+3R/wE/HeQ4uPNYVtjbG8anXNjeAIZ5eMqOpwFpjz6UbVdWaAz/QSYCTQZKrrZxDLsNt1ZG/TiQ4vhbkO7iZ4UZGDssH7nfYU+qesRUdMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773244208; c=relaxed/simple;
	bh=RnYZxOGsa+mCQhaXimkmXMcqyAGJ/zUTqL1MBZy9xZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQWXOybUyvtpiMRypAlpmpa32+yKvKBQWf62HIjg9e7gSL39Vsh7uXzl8YBj3Bb2LjLa+KcxBhKtO40jSJP57UnuKA6te61+tICYXBN+UhlbHf3E6CGLnHt2rtiBAqRVF8s3/sPlEVinV3gSgzKuwjpUzcNlDNrmCiYz2njDrnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hEAPOrAP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KJxUplL1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hEAPOrAP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KJxUplL1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BA34Ak2038137
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 15:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n0zBKnpre/A
	VifMQIjMP6sp+9Bc+YCFuHJyoCZtCgTs=; b=hEAPOrAPW1i03yZZKc1uLUc5Mc8
	jCitr5K900sVwctNz6ouq2oXEqXcY3ofCBsLe122knmkJ+t1kIseBcT3c9EPsNC/
	4y256W+vBzru1GxmnvWWTAGsSFu1bdkaxezYWOEauwCn+G1rLjyEzCY3YJtJd6xK
	xHgKqbjnvCPMjXr6IEuLzucOmhUeuxW3Y+TNQjZU24KK9hXYFgRkvIqpGcR4MZRj
	AJ2WAU5qAuiAq2fkXyuf1zlehFczbgbdWl2mpHSYPsAb4PlK5kdafziOlg7MHuyQ
	I+lI9njMwSgyc3PsP9KWDwverFX7Ud/N5oz8qDrm/5OG3xgC77onyeWmNSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu6a5h8s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 15:50:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd81be6f05so2179291385a.2
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 08:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773244205; x=1773849005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0zBKnpre/AVifMQIjMP6sp+9Bc+YCFuHJyoCZtCgTs=;
        b=KJxUplL1+A1I5sIuS2jT1K8d1K9eqdatIUi0rqqwAvIfD4KeJbZJz/9pDfC8ys35Az
         VJd95WnGOn+5oXIK87r5uXBh9U8Gq0Tc383Hpvo70wnW8H2yYWDgE2mHfy67KhCzw5Cn
         8nWuGLFqSkZNyiVLc9uUjgsy+wq341PlEv9/tXWHqvl9amiFk6YuYnjziJWQl5hnld1m
         oah9X9AgOE4tF+DKb/NowNslXWYG4zoTwL6714Oq8bkOtPtezRAQHEfnIeDOIcMZHLc/
         Ov2hsGoc+YLUftFlrgv+2WivTb89VPnmS+fYOnKjKQSxF/OT/58eSqAWcCrZj7iK0gBo
         jAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773244205; x=1773849005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n0zBKnpre/AVifMQIjMP6sp+9Bc+YCFuHJyoCZtCgTs=;
        b=Li9u7diWB1G/MOUAwnumecW27hXACRhLKIQ0R+fzDwmeWRs4oZafZVxkZI9dlzpTh9
         9RTw/tKmyA7goQxZRac6j4Aa76ae6k7hRpReNUfzxgJ57ef1IaXO/QS7THWZQR1Tcz1j
         XFD+ossbKKn7Cn27NBX9iWygDSG4zQardRSf7wOIYozV0KHxPsumvvV5xVd1/m0KZRR7
         qJzM4v0jRA0V6L+/7gDLRRo64QUxerCkpteBZIRn24XRoRMNn+Juy651JSfrvUaQ34Q2
         HMrviKnX67YspRc5Jy3+tIY3iuQP3PP6rYjN31mJVXGRvifZoBnQ7aoUGg6azm4P6jNu
         wQrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+1aGWQoz40lVHNoTvo5ruqQUInlCHB+0boAsTrvi0WABXO971IFrlCugiwU4/Ubg5Z0I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQdu9L3rI//oC8vbXYMLXqsVHhrML/uEgiRWW3GaBJWJp3mI2o
	HsGmHU6Z98GHiS1tbThCZWVUHzjBX4ac4gOVywgIS0WQ+dAsHH/bUsWKzLdfa6TWmQG9VGIjODq
	l/vVvjbQrG74WNTRPpEMMCYtJqMmAxxLDKeIgSGP50ORAThIp5UUm0Tw=
X-Gm-Gg: ATEYQzyKtYeOaRXutYj752sZeIKDGwOYkt72ppJexmNHR4HEF5Tv+wQhf2Q6IIXOnuQ
	gK4CKbSZtmG5qNVzO7pEpGRRlmmeWHCEJZd1//Tn8KHiJW+2QvmOk+GSExk0qTD12fY8saWXy8V
	UgEx2zdja1Yx4cu7EJJEC1pD273v/fen5BpCPaN7sDhRnFQzM8gFOuixQ0r37YoGusGxvQdbU+i
	F1c7HOyYgmYyByTzpffi+chQFWur+97MERo27sVWaTCeUyi07BwUwDdvIfj3dcIZjNkCnmFLv+4
	0AszgRWTblT75DlB4SNqQzZzwl1oaZk1OmW4WYUshZwvTrbgIH+V9XVZW7vKC1/loyfdOWkferX
	lv9W+WB74vCvYUB8oIFcJhe+p4Z/JT70Euk3h
X-Received: by 2002:a05:620a:45a9:b0:8cd:7ba1:cb with SMTP id af79cd13be357-8cda1adcf02mr363894685a.72.1773244205134;
        Wed, 11 Mar 2026 08:50:05 -0700 (PDT)
X-Received: by 2002:a05:620a:45a9:b0:8cd:7ba1:cb with SMTP id af79cd13be357-8cda1adcf02mr363887885a.72.1773244204626;
        Wed, 11 Mar 2026 08:50:04 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0c678asm25127285e9.13.2026.03.11.08.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 08:50:03 -0700 (PDT)
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
Subject: [PATCH 2/2] dt-bindings: PCI: snps,dw-pcie: Drop deprecated reset-gpio
Date: Wed, 11 Mar 2026 16:49:57 +0100
Message-ID: <20260311154955.145120-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260311154955.145120-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260311154955.145120-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=RnYZxOGsa+mCQhaXimkmXMcqyAGJ/zUTqL1MBZy9xZU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsY8kxlRmURdHdtI8/0HVlJa7uUHbEQraOatEn
 +8Kw/6+6XeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGPJAAKCRDBN2bmhouD
 1wgND/9pfGkjEbEGF6IrwzNP4yJ24xfxyBFJUjvptxx/Sy6yznYf5jGO2gGp2gKf6eqFuP/4MOu
 Pt4hYMKECVRn8Xd66fqUavLMHj3DO2ws09f23c7BQ/zYs6hS1XU3Iv+dMsUZkFI3mrEwzf4jNAP
 dVaMhL6WiYPW7WfyfdVVGUep+phznFD51bSL81AmGlePRnwQnEuKwG1cJNHQMzoeCFzUGf7MYAh
 weRp6YL/+8mU9lenv4I1BZSn3QoTxnOS1pZqT+9bXFtKEytBTHQNioC8paw/50soFcd96P38vOI
 5KLims1oV6kPqPJyS1qcjzXxLUl5WNoeLgmRccv5LLKMN0nymWYRGz4JoZ2GomridKt6Uz019Aw
 lYuZZwAPPU6ZYrmtwKPXsz7RbWIqI3f2xXJ22YAV6rmKwYizQL2I199UtiTB8ApSboh6+s+iDuc
 O0/cN5NHgI3x+99M+NpaYunGdL6un/erDicM454JieZT6+qE2j3UkLWEJ2o8f28b2cxVy4OqZgP
 aoM4ORtYHorWhHo5GSGveVQtisdIT+ozV3Cq8k2WiQvW+mpXz05o2gArmjQG7vD/9oupKhnwqSR
 ahYcxMJ6JCHcQBT+Pl/0JeRK5cgjoZI8Wza/4/7ww3+erA78/AL891X8rCM9QYUOXrN7RUXl4oP pRypIFiHNZzQ/VA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3Ua1u6KgQKnQ7QGCFac5npQlB7vMHIm1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNCBTYWx0ZWRfXz3Zx+TcvIa6+
 0B4WvSYEHXfDQtBCzlgbAVkCQWGlYnIy3O9GNNgwkkytbN0RYsc5CDbVkb22OeFnOHz/iAZ1UMB
 Ic8dq+gPOlxYfUu4rcZ7s980EA2jhkdmwFzDnwJ1omv7hgXCrCMqCmzkmZtrCxwtdTBgddwT0Fv
 DH6g2Fsei8jlrsNYHV8/gdMHhQrHc2MNagwQsDnb9eAbX0KpKHTfKyiy4LjJPEfyuk0OvwU+EBH
 sZUcfx1qMWFUt8soZ/pc/PEPUMsDFKrWANmHpOjTLWCpYRGgj1oud5lmLKCARhny/pF1xBWhQZJ
 vXtoErQ7OfEzZVGPwrvkpGV/NvWMpfxrfUVtqyOF5mwNxIOBBgCY1sMNDI0y9aKIbDrABkz4G7W
 /xrj+pRbjLOIMHPfaNRlIiVmaHQGVfrM9IiMLDO34xhEBNP0guvM0T6Xh1dJ7P/br72MXWhAivY
 g+ZkX2qEf0gFz1UyLCg==
X-Proofpoint-ORIG-GUID: 3Ua1u6KgQKnQ7QGCFac5npQlB7vMHIm1
X-Authority-Analysis: v=2.4 cv=TtLrRTXh c=1 sm=1 tr=0 ts=69b18f2d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=BpcZMUz7IwU92FFy25sA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110134

GPIOs with "gpio" suffix were long time ago deprecated in favor of
"gpios" and this particular property was documented explicitly as
deprecated since commit 42694f9f6407 ("dt-bindings: PCI: add
snps,dw-pcie.yaml") in 2021.

Linux kernel supports both variants for a long time, thus listing the
deprecated one is redundant and instead legacy DTS should be updated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I will fix DTS separately, so after applying this patch there will be
bunch of dtbs_check warnings. That's expected and fine.
---
 .../devicetree/bindings/pci/snps,dw-pcie-common.yaml       | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
index 2c4dc04f9984..deba46d7a924 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
@@ -209,13 +209,6 @@ properties:
             - pattern: '^p2u-[0-7]$'
             - pattern: '^cp[01]-pcie[0-2]-x[124](-lane[0-3])?-phy$'  # marvell,armada8k-pcie
 
-  reset-gpio:
-    deprecated: true
-    description:
-      Reference to the GPIO-controlled PERST# signal. It is used to reset all
-      the peripheral devices available on the PCIe bus.
-    maxItems: 1
-
   reset-gpios:
     description:
       Reference to the GPIO-controlled PERST# signal. It is used to reset all
-- 
2.51.0

