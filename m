Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955BC3FF8B6
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 18:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341037; cv=none; b=Z4y6dzD/uFZ1xTADQHGh548uMAEjEyVifvrAF7AhblcWfGkJ/uSnSGCF8GvAuVtKveApfjUzUmHGFhUoNRt/QvbsnHiEZ8K3V6BEHTXrOopCULKgesZWBZ4rzl+CDVn9PyYejo+11byAZRBKsXQ+Lr65Ju7UIKaF78+tZKG+MFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341037; c=relaxed/simple;
	bh=DdlRRjHSsKghe56p1ojk1muOX+5Hck51Wqoa815D9zQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uMwxWlGCoOKfD/YuWGcOdjDqv2EokF1FF3JAxzbY63vzAba50B82eWLPeS66jLAsWg1YKdKKHMugnpxJ/Qp3vMNUu6PU/Eh+6/ttjaS0NAV+7vY62lnk295SeoK+tBNPwWnuxEz+5gsdquCaceLcDiYCGEo9jJ+NzNhEkFi0hI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbnKF/DK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TdaXaLWs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbnKF/DK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TdaXaLWs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CH1m3f509786
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 18:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Sl5THP5oQDl
	We4OrVbHJJ8rYnqB27vWU2fGTtY+H4so=; b=kbnKF/DK2YY5omo2WQ2ftk7Ila5
	tGwntnyO4j67sWAWAhtNFAwObx3w+bsFcj3B19hkh9f7IroyhBh634JqVpesALfi
	U8TtQUII58JotMx/3TvZVFxMKtz6aEAsmy8qhLAWfG0X9n3yssBUxeXxtV4UQQDX
	WTX/0VN6HWtxuKgGI+CLQkKT/DIGnu4tXc78vWcbTTiHNwMRGZKRzj9OPO8xmJ3H
	FkTJJzLWCRIWccu5wHqJ50MIGRTQ7f2K9rGXit2f7yQyXPITgNykkZERXtf1XOf8
	G2BvDK33NpEBLnAXJfF/O19Xp1sDFqkIQvUfpIW0qRpuvjVqU3cIKNy/5RA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w1wh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 18:43:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a304f24a2so110284996d6.0
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 11:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773341034; x=1773945834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sl5THP5oQDlWe4OrVbHJJ8rYnqB27vWU2fGTtY+H4so=;
        b=TdaXaLWs65oxpj8S781cqyz50EvNVU3cQS5NeztePfEI4gQtEEi5VY/S/7PIaxAlZJ
         sTGMLJYT0b6zg+bN4M0qzfO+GPhN07IREGZ0gCTWn1GymPBhuQn474WAc8lisVybKro/
         wnOgNOZYCkK7JOHEuB5QWKutALiILu51/pNTMjUz0wM21OAsPB6DuGR1nZLg3k8MRSj6
         hFfEOHXcLcs7I34BOA+gHdAm5byizVCEiP8zJCcQzDtxlX36wp2zXYm1qste0zgoE/vI
         z7MKa7jxpclpATr+LpFEVQfdVZEt/DRdwJmR2nMTXcyQKTXQSC3AMWOkbsSfo99RhBmH
         iLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773341034; x=1773945834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sl5THP5oQDlWe4OrVbHJJ8rYnqB27vWU2fGTtY+H4so=;
        b=fMYToGjpzNRmyzGT5xTiRlaptZaaOUI+GYVFVv1VWJe/8Co+rijTpCjIq5n4bMLXyj
         XNa+1nf0CgDNUvG0zsjh+dhgUM9ndKs8/6g0FRaFbsbOgqMplyazSSFG8kdGInIw5a4z
         EgbSZyuEnPXwNQHuOo0ZlmJ1HGqJx/hkzcXofdTAm0+FCy7Fsu2ZxgTgsdzKvu0B/paN
         LaxcGwHS7xeCMuGipXW5wy8Xqc9buv4tYQ7Z2Q+3TRpBAYCDDyPWg/S+hK7Lggk5S61S
         JLKmk0VB0Q/zndukRaXMFon0WOWkSTMx2ubrwkVeTewrVI+K4idoh/vThUGVgRhIRTuQ
         dZyA==
X-Forwarded-Encrypted: i=1; AJvYcCVmZgLHrGLVkhlagitgU4yDKHH1t2SkTl438SFQ2OTuERYTan4wQbXj71OgB+xCGZJJQEk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUCyMtuWHkagYKJDI/fnLgN4OFjxdvYI5Sn7e6S7jBzoEUrtMq
	KTihE+kIeQ6heYJYcGSJzrsJxT6PofnZKczwMQCVUEcAd7jgcOWHxqcP3TdMxOCG+TjWdoTDo+O
	VUaSEGTrpoNFJYEyuO4gzGBKGc2GEdhGVS//cBWEDURbgTeVyLGwg9f4=
X-Gm-Gg: ATEYQzyUDO7PQko2Mk4gb5WnaLhR6MkYFcGM6ajCh579YkkRvo6ZHgLzUK0wnBE7O2w
	faO6/rV9U1lx4X0hpnu3jwhm/EIONDqXxGyAN3sbzcwkQXZFVyISoSg9+sOiRuASr+99V4i2uFR
	NtprYeovg98zh7ef0j9CBMYQMVvspfbZgyyJpQ0Y6GQpXMiygZlk/sXme0x3L15wnfWpu0lLPv8
	jgql785wya4XUPW0R1mSY2k5jh0arItmYrQrLG000/xiC8MAyB/FEsxS32Lh0pDnufKTHxGssQ5
	hHsf6hw6XKhK8RTbpE0EpK6vU3kMfE3mHV7C+IAoMCKaKXPLZkjkLoPfDbw3Ps50fbsVG4kT9aS
	+Avo5To6Ev7QSiG3D02FXG53BICVeYOk/Hkkp
X-Received: by 2002:a05:620a:468d:b0:8cd:97a7:a345 with SMTP id af79cd13be357-8cdb5a502afmr113839685a.6.1773341033906;
        Thu, 12 Mar 2026 11:43:53 -0700 (PDT)
X-Received: by 2002:a05:620a:468d:b0:8cd:97a7:a345 with SMTP id af79cd13be357-8cdb5a502afmr113834785a.6.1773341033452;
        Thu, 12 Mar 2026 11:43:53 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bbb2sm10005040f8f.22.2026.03.12.11.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 11:43:52 -0700 (PDT)
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
Subject: [PATCH v2 2/2] dt-bindings: PCI: snps,dw-pcie: Drop deprecated reset-gpio
Date: Thu, 12 Mar 2026 19:43:46 +0100
Message-ID: <20260312184344.42337-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260312184344.42337-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260312184344.42337-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=DdlRRjHSsKghe56p1ojk1muOX+5Hck51Wqoa815D9zQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpswlh2i4ftdfXM9sNjnFhjkB7pkrSKvqkWkXJL
 W1ow3JuiSiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMJYQAKCRDBN2bmhouD
 191pD/9PtoDiLdlDNOkBmmxPWhb8A4BV2FuXZY1kR0rpBVsnHsnIQ+72yby9Byb9U8e9yZ5g5K9
 IlzwDsGZ1STxkBzJaRchnr3PCHatMnWkFCgXFOEBHOLgx9MYxATivPQhK6C1NX0Vl9mqtHubLv8
 Jt3npQsQ4eRfmKLCvK/960Brafu0Kmr0KYA+pZhLmE9zpapr/qkpd4GTi0Z8x28x+ErV81pBozJ
 Ah5Z+khLFxGt3R4qtc6dalygIwg8UHpKpjdzxwNpApQxJ2bfE4hNSSQMED1KQDUtMXAOaHrAh2P
 +4iov9ifatV3/Xyz0GRN2silJf2Mh4kvljKj2LEdrM05IQWx4CbEzRflrX5CstDGLG5wBrKhBbj
 jM2PQ1mUwqGMl/UivkYWp6/mSpUQl3U5eACEpvsNOQAv0jAP/mD7IdSfCrnnWbdHaS8bYae4zLE
 ohdtSYcjV8QQrmqJgGvLgtmV+eOZt5NefPoaU6RNVajb8b+omYnP5eVPNlbXXudwvc6AcZDiuQv
 05V3vu6XE5/ftiXdtvpjqSPhxKd/jrBFOZhdiw3v81y/r+Ys5z/UziYbpBZYAAzVvHoZdT4Bhv4
 HjdewBVn/u59HflNQsshszxNGuhwcBERIVlkhy+aGbPGVNck0HxiugzsWYb8/lclNTn4/sfm4qZ yHKqzgWns7ReKFg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -pWY7CeHQq8LHjXMxGGdjCf7F_h3L9TK
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3096a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=BpcZMUz7IwU92FFy25sA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1MSBTYWx0ZWRfX5y3cMFqQXnT7
 o8S14XeNxMF/9cFfqKviPnOztTlN1RnFaQu7wq7YlU5S7bIxtHwvcDfCqUUiRkvTX3EhxmNo/he
 aNOySE2fFtoii7ZqX6OnVw0ACeaoXHPnLrC5RSnPr+er7+Bojs8cd+pJjycuGruLN/0nLxxRpxr
 G6HI2S4s1Hn/zWVIE63ZdMedLhPEstd5EjqkL3jihEoCZCheihUEp4Usc6ycuiL5zRbCmC7Wdj5
 287gxtA2jJ1Lwlobq+ynZhWZ+AWrrQ6+0x5EVQj4Dj+6jFaU7e6ZaR37yoOJ9prYr8X8zii7N7f
 dquI1FZiqQqYKGV7GwE27i7dRPV2oDUDYLaN12bddJnOD6djuJh1P1wFlY6u2hTCVpNeIcIx/fT
 PgXtYkorkADZhbxATI68RgM5BA0tw+mlGQE0WqRwIioxj7patJmvOa8jslh9utsIEQ7x4S3S7y9
 dq2I6Fv/3r46IFl/mMA==
X-Proofpoint-ORIG-GUID: -pWY7CeHQq8LHjXMxGGdjCf7F_h3L9TK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120151

GPIOs with "gpio" suffix were long time ago deprecated in favor of
"gpios" and this particular property was documented explicitly as
deprecated since commit 42694f9f6407 ("dt-bindings: PCI: add
snps,dw-pcie.yaml") in 2021.

Linux kernel supports both variants for a long time, thus listing the
deprecated one is redundant and instead legacy DTS should be updated.

Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I will fix DTS separately, so after applying this patch there will be
bunch of dtbs_check warnings. That's expected and fine.

Changes in v2:
1. Ack
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

