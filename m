Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEBE322A1F
	for <imx@lists.linux.dev>; Fri,  2 Jan 2026 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358252; cv=none; b=FWAP0cootWm8CYBoWFYtzhu7RD6Sgi/cf+rRUpPw1jxgx6M/S5Rzav9A+8LCTGk3j8IQRavvEWQvOwFmItDT4CPkP7CM1A9fWJXQXhDMnkdwbEoIx9lWIhD5OgejytUaOIyp1ziR1qI4h/NHnk5gaXekxy9IFiTYYNLP6XrHJHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358252; c=relaxed/simple;
	bh=aGmWnDdCsPxP/9AQk/c0mEIwm2GvlT+MuDcO0Ejg9Tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uuPj8wlwDTySbos30hJ4v9hoJ82AZPb5e7F9HabOA42Pz4p8i5LfD66k0BY/Rx9b2aOonc6mctomh220ei9pOmvWUPmWYbnu0Hu4vFh6dcnnI17K9wB6gyvzKXLD4vc1+NY+bV9BXhAgAdtIqHSn0ckd35TrSsbNWLY0B1qIrlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3rRy6o9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HzWXD8gg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z3rRy6o9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HzWXD8gg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VwV2504469
	for <imx@lists.linux.dev>; Fri, 2 Jan 2026 12:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v+3Kw9OcKjm
	yi1BRmckH+Fe/+mzaD4IcuRMjS7jkrxA=; b=Z3rRy6o99Ek6SnSUPQ3d9ha1NQp
	MSh9lekW6Uu+XYNJ1baj8asA55OgLbj8AE64xcVryPn+z8DbRhtbJBwbA3Yj7EfX
	miPm0rxDm5pJzR89xVNN/ojUTYhG0cFOzj4rxWzl+ntyqWbegnoQG2SWoj4zlaEq
	kmmt8E4DzUJLm8cjNm65doFfGIcNpIOium2oV2/KQCL0s+iNh1IgIHyvBkjy85s/
	YUsgLkWVQrnB4PR78sqc1rZaOx5kuWu3jC83dzrjjtuIzj4zTDBKqR82tVD5k3he
	WoJCwADKO/XeRQwkdXIJjReXI/acrUCZXByXW5lJAPFQKt7DT25l8xyb4Ew==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be8bk8qmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 02 Jan 2026 12:50:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-890586c53e0so558686d6.2
        for <imx@lists.linux.dev>; Fri, 02 Jan 2026 04:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358250; x=1767963050; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+3Kw9OcKjmyi1BRmckH+Fe/+mzaD4IcuRMjS7jkrxA=;
        b=HzWXD8gg6TKLnwewRmbcTPPAy4IGpVRMI/y5RIxNdkoEoiXxRVObSMLSDQLgy0tAHw
         WnK/Gjdbp+avTz6eVJPc6yjHHBZP5aXgXPrcQwR2Hq3t/WUsU9H1c8iUYMsuYd6Igpyq
         QM2Efg8J2YPXN61f32e7gcCJVbrwkskEoeLFRkmG4pbZtr+VsjKDC8Vxibt0Mdb5umBx
         ofFwDlXMohAv7RYELqh7f/fwaQ2MSy79kr1q+PZA1iRuajgN1d65qjLhTzng+M0T/L80
         lmyfidoEoeMU/Xl9w19OAv95bzpF4/pUuzFOhF1JHoZN2PURTGRFCx1qPP2NSeX6TuGE
         Tlvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358250; x=1767963050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v+3Kw9OcKjmyi1BRmckH+Fe/+mzaD4IcuRMjS7jkrxA=;
        b=JYn5HV4L26+uKRPS9fW6aXU/BDAqBuV1DmLuLuK62sptbnRWTBTHbRGKDpTUGXFd6O
         SEtyeU9m2CL8ncWptVYQG6kvhiC1S1UyoQ9dfSwj+E6piTHnSmmmKntnmvOk0qePFn5O
         HjeuTC7tl6+h+XlnCFhYC5HfPmIRt39uD3d+rsaEtLt1+uvl6SSKboEmDScJEMVa0No/
         hzJur+LJxqVhsBNiWaeTevaR3lV4c+CGq379b9PW1kSeIGMNq5W5BzA8cADA9U+8jGF4
         3F4tJi+KS3rER1YRbH+0aat9PIgma/CgERSGGdJLQYopiodM/LxlVnn8ufIGesYtFZsm
         LHog==
X-Forwarded-Encrypted: i=1; AJvYcCUXoITLfVFfUQTTI6SSK+knGEEYHbDzsDaIS5pqKzagU4heCXPXylL/yMfHlhjGVTJQUhE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxrDr/0K2vRYrwYF8lO1Cq0KaicnQcqBENRaz79I3FlL3j8CBjD
	LzO9VsHVefadBP7D/SbOadRKepU/iDrvk2iBw/uWE0acAW7/+lR4hEYhSqXrxgwPvwKf65tuKxX
	AfQ6nkEIaJmFLucx7CLdD5ukrPWMCUIw2p/EWn0zc5l1w4l58flKpgJI=
X-Gm-Gg: AY/fxX7JeEQQqodvmoZEFqElmV1XSmG/iCJuxi6jkyAvKXgw2cbUTudv5d9CvERq2JR
	N7DI+lqKQzstD+oU8kYCVea/vbQMRdz1CpHLiawUFcgBCrQleDbYU4K060BE6pNc+wgMXxcEqEo
	mR8VjoTwcGR5y5XWKd9M05oXunHZpokIj8UAth48lGg3/GWMVKYjsussrbxNX0qnV5RZY715ER7
	Zfy2yQnoYSKFuyRo2jvBtN1gnkXX06s38vmydgX0sGvl1jgmsUtflYZDf1uIzaAESckrFLWDjEH
	opSk+nEVi9PAsht4sdVzXXBdtzZDNk+OEzwA+KNT4VjJ4mFt3tuXWGwnuA0J3/XLXqJ00/DMjb8
	wKEOCXngCm5cFG0w6rPbmruybiw==
X-Received: by 2002:a05:622a:2618:b0:4f1:caed:da6b with SMTP id d75a77b69052e-4f4abd2a295mr600889841cf.35.1767358249717;
        Fri, 02 Jan 2026 04:50:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7zF9JMBhGYnhDGu2/Y0ko9eaoSDqiHsiizO1xN0OYUtERy0LAazChQnttfMnUTtvdemOVkA==
X-Received: by 2002:a05:622a:2618:b0:4f1:caed:da6b with SMTP id d75a77b69052e-4f4abd2a295mr600889611cf.35.1767358249332;
        Fri, 02 Jan 2026 04:50:49 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aef7sm84491369f8f.7.2026.01.02.04.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:50:48 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] ata: ahci-xgene: Fix Wvoid-pointer-to-enum-cast warning
Date: Fri,  2 Jan 2026 13:50:43 +0100
Message-ID: <20260102125040.65256-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102125040.65256-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125040.65256-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=863; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=aGmWnDdCsPxP/9AQk/c0mEIwm2GvlT+MuDcO0Ejg9Tc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV78itUdE9YSsc0MqT+n0aMAWzMrTX9ODAm1SQ
 t71zmsGjr2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe/IgAKCRDBN2bmhouD
 12NOD/9REcyL8OieJxiuRb/ZhNCPYYaSi2Nj36SpP3T0OuvEZp62VrrrKXsCNS1LIZ+oQS/VVOK
 PZsHlHBwr8EDxXGJBdu/rvbqDrjD+8sKcueg3vi9YPEOiaTGJEyZ187CPJ8zsBLGRIc+XtC4v6A
 D4ehi1+0q/avW54bXJbpn3DRpjVe/8CVBD1yPl+tiaY0nCcecPr2+9PnZePH2fbYJN9srUPSX0t
 o8PRzsXGtN9NEQ/S3nLw49p5tD0I5k869pZUPzNqoOQ2bCNT5Na6oIDuDip8gUYbTYd7C49gpFG
 Ejd8hPx151oAGReHnZKpMWjuyAGjusJznztI9bH4tEW9OX+lbjIgL2OIrRSo938ldgDDLtPTB4H
 KzicAZBG27TXC1Uh7C0nw8Xv4w2qH3Ptd+tZ1gZcuSmTS01pDZL5t8tJs32/UvUBfGuLVQ/Ph84
 8jnuWu6mlZ+Kf0uHrRMKfI1CjoLOuHDWvNk0XWE5qJZOs8RmaHFA5RmdctcO0jI9jDsCASc1Sf/
 gm28x4MP58D51Z2WWQbc5wG3wRMz9QUoHQswpx4i18ZFDsn1BiwJCYKq+bzAkr24zcl3OYvKsGE
 CBCE1EYzzb/w7nFsJTP+OMwhIwKhP08fCkf8yCWATzR3O/ZnrNrE5FuPMUb+mapOfLRxmn/KGJO 8egNX5LQ2weKIQQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExNCBTYWx0ZWRfX8xjl59oqeVoJ
 tWnDAyOysw58955te1vBdhU1UVxOWVp8NVv3H0WiFqz+cDMKCCPiwSkSI/z5bKbETWV+IB8LYbc
 G6Kbva2uHjBzMXDuf7Za0ezVSKDpzgelFonBOE/CzxdJG2EqCNTWAh/Elk7NvJCKylCzbPDto6c
 VovvGA6/53KQjCDa+kdyWQ4/6Ch/4MfcmL56g8TZcOobCmkAVXIYr5lUMVaYcGO6dVVViKPA4QN
 rqTyyo+N1LxfsbYQ5Fa5LjYBnqinHDN0PfA5jUaNSCKyC2GdwvmpFMXLNMZnOrtuGp4X7XtZs2N
 a+mBvAmdqtWPMKCk8iaBEOaZWzH14sUVH2dibure6nd6SAbkgEuhOVaF2C7S4A14lueU2j5uO3P
 s1Anxy5fhqwp5QZz56O+dy3feNgkGNIvQImVmCXWTOVmm91hwyacAznOP/Y7F0wvACC6kyKMlhc
 GJmBfsgW3lt7dEaoi1w==
X-Proofpoint-ORIG-GUID: hu7Aiv5H3FZYHTfG8ICicVmvHwvQB4KX
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=6957bf2a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=O-IaotXkb1TqCMFDYkEA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: hu7Aiv5H3FZYHTfG8ICicVmvHwvQB4KX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020114

"version" is an enum, thus cast of pointer on 64-bit compile test with
clang W=1 causes:

  ahci_xgene.c:776:13: error: cast to smaller integer type 'enum xgene_ahci_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

