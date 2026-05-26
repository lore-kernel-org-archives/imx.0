Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A48405C28
	for <imx@lists.linux.dev>; Tue, 26 May 2026 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815587; cv=none; b=JQthVSQBUZVJAJLfwA5/1O7gWUVYaPzKJZ8obVZCxCOFDEpsKCz0P70U1RY7q3Ml4MR0aRgZEK7DaVMUazipCCPhwyxYoIkRmO/jqk/1ZF6ziQJMHpGhp0GvyNyNB34Yd/d6arrtjKDmUJDETtN0fU4F5TdWQ39tgvf/nZK6FTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815587; c=relaxed/simple;
	bh=dcopeyyySnOd9fL3v2swYiTB5ACAPgg1PSgm14bzBCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tWNMtQ8Vrr5PEw+36LIduVA8O0ihteFH8KvM0BAZ/GwXNgK86uf778Bw75SWbiIi6vcUEkPIxOQ+7vmLoahollG5ak0loHu5LeByTSXTCa3H/meuDRMLLAAf1Us17STNzUEOk6l5MAXIdae5YTidufETZ99vn3msh/BzMVyah4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPII2p9y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FI+42A1k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPII2p9y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FI+42A1k"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH112d3289824
	for <imx@lists.linux.dev>; Tue, 26 May 2026 17:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6gMLM31lPewnCBaPI066p1pgy4In0RFum6QqFLaJ934=; b=JPII2p9yDr0AgFhE
	gBA7YeCXlr5AHJCIhlRaxmhzdJnXkug+hm7a7F9h/Tf+lgA8VF/w3obLVxis9HGY
	0P4pbPDPFA/Tx8G6yojWiFBpoKeGvduw/2WyjQw1/NMjq9dQGReyssObJwHfpcyE
	a1CxhObFWf9SYjmpKamTyOaKdCSzz5a5XjHDz4Oiz7ftccM+SuKrVWOHRMpPJMNt
	iIkO9Mi9KVhGOlMPjsWnL0R9ByMb9m6zSJ7gRM3Wrt/RfIBReADm4HnKQdrnwq5B
	lMmxAc8hPgh0PXlJtN2I0OsrpQuQ0W0knSD5VbJ6Huw357w0GaGAUpLMd2KKUauO
	N6yvRA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edf1j864h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 26 May 2026 17:13:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f85179263so12514788b3a.3
        for <imx@lists.linux.dev>; Tue, 26 May 2026 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815584; x=1780420384; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gMLM31lPewnCBaPI066p1pgy4In0RFum6QqFLaJ934=;
        b=FI+42A1k/BqqzYphvdluw5HqYCJPTqJvriQgHAegwXEg8/lHQdP7Yn4UMZe9qHm683
         jfbXZj+NW8h08WjBpYxlgNSriYDoMGoW6vbf/Lv84LkhbtvwpCx0M6JmoUTv09UwgSh+
         C16zDzmtxiKtt6OOEpx5CvsNg+LXQvu17wEB1Sq2w0dHftGZEOosbTcE65GgiyudAs0u
         A+IFlv63p/PsDI+O99X5A+rWS05ZgfBAuAQE22/v3UYml+UDoqQnVD1Rh/Xm6XXvmoui
         /72lTlR4pXlzNZ/PBf9YatcgtCw/wexhe1k+TRWBvTDypuS9Yv/ZnCoO8rzcP5G7mB+u
         XKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815584; x=1780420384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6gMLM31lPewnCBaPI066p1pgy4In0RFum6QqFLaJ934=;
        b=oqZphYsPHUPQj6PGEfMToSh5claekQX0Pj/sGE+VKegXuZtZQggEboYTQy2Doei+RD
         9ovC2HaO39gQh0uTh5sYvrvFMdzABBRwSE4LSgtBWADQ6gwDka/8LUW8cbLmvjZV7xCi
         sKEpimL8tI7XKoZZRS4Jnn77ZQaYkKtt7pItHNcXmb+WFvx40I1xIP1HMBUXXZgGG721
         M+hAYrOhl+9s/TqCCmnQkrN8qTD9cZFNBmDox2ezwTBN2zFEStwIedim6W7vy5hRCxS7
         0WjHzr3XWxbvti5UQTfJVpqLF4vjBmTsWL3yY3ivfb4PWBUkJPli6O+bqF/m6fpM9vFE
         tWWA==
X-Forwarded-Encrypted: i=1; AFNElJ/GhCF9WTyVcNPq3ncnhY7Cy3FPpYR0bnbWT0BxSx/5WpsUZRjkMCjXrSAo2qM/QnxMqls=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3TQBHmLFv8bAoMEwTV0jxr9apan+PPlNRNKT7+e7dzKwIzJLG
	KXQw/AIrK8j4SBrI/32hvvjfZbbFIjncNmc2yCLmE3LgRJyhUQgZLYhrFmvb/In4O70Ym7r34cj
	VlYU7LctSbE9YKwa7GfvDdi2KbYpMYLunnc8iAkEqHZFJCUlCiMbYa2Y=
X-Gm-Gg: Acq92OH9TOBDHp9iIpDWrXj//AWN2ZzdhaNqBKy7LT25xofZY/wcMo4EPC5Fk/JTPe7
	un2pe7p6iBSx3Ih+91TyFugsBwKxB/nCGk86yaLD79Ar6uppPVCPoczNzE1mQrdWl3MZukqYNZL
	I+yKfoHGTetQ8Qy37spIjLCZM226X/mQkK0MgRKWAwvGOOi2nVYLxxt4JiESME1S3UYugMjKy1R
	GbUYm1R2mt+YFZ1Yw3Zcnq2SaGomhVilgqqpHIqUUV/z/xdYqilrDWTwjV5P9BVYWiIFnBHxQTO
	uSXLzkcD8wUOyrugt2/FEAJWResX+o6F8Q0pLHkhHUedyBhh0prAJkdJt+fhWAIjsbDNxtU3HVv
	iq9LzX0NU+u4Bc2EWtlwIco+Uw0WBO6R4kTteYYanRhAMrpqWsJkU
X-Received: by 2002:a05:6a00:3010:b0:82f:355a:857e with SMTP id d2e1a72fcca58-8415f68c23bmr19307742b3a.47.1779815583684;
        Tue, 26 May 2026 10:13:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:3010:b0:82f:355a:857e with SMTP id d2e1a72fcca58-8415f68c23bmr19307714b3a.47.1779815583182;
        Tue, 26 May 2026 10:13:03 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:02 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:45 +0530
Subject: [PATCH 1/8] dt-bindings: media: qcom: Add Shikra CAMSS compatible
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-1-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=ZNjnX37b c=1 sm=1 tr=0 ts=6a15d4a0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=TW5Qit177qQvJ9gbTQAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX8Ss+FeN/BW66
 CbOocMwQJpJLOYJoGBDp/h36+Zc4wQSInILRilGy3Lj78KD38rxxNboi0Fl6wq2IWIGOiKng6PK
 M3ACgT0hUO2/8qEvbZqs5SqOGF9ZiSqXHjyoSF/a65zRByx+yjbJXrPo8iNcxeu0q177lD9Y7kA
 rfqFMvYWktk/pxICagB3ckc/BOM/mRMHR7yBhnI6nvzIJdk2gwMeJ6VMpBpt2H5VwGci+lvBuBV
 AcOMQLM3kuXIZDo1rS0tNshoY/w/7bCV+xEb2eg2iz1YYprAwX3tp5XZQEcwE/VTQzuOYAeMSnF
 SmhktZ/7w6zsN3+KP0o8kboemkvEExRO9jvHylQHO5v3pxrgWqR3HqiuC7str4Qmp0mt7dlvXNZ
 /MwaHO9Cy5GT48GjsyJgNXvHDLu0ataJNkjtNuTd2CAe8IaEvI05eTDY3s11N4LUKVWIaEZvdSw
 6Ea0MKGngfL/At//0KA==
X-Proofpoint-ORIG-GUID: 43wkUpltvoXAkGxt8p6hG89_fhWa181g
X-Proofpoint-GUID: 43wkUpltvoXAkGxt8p6hG89_fhWa181g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260149

Shikra uses the same CAMSS IP as QCM2290. Extend the existing
qcom,qcm2290-camss binding to add the qcom,shikra-camss compatible
string.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..7b1469d6a1601413a1a32dc452d7d1fc85aa9eb8 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -8,13 +8,16 @@ title: Qualcomm QCM2290 Camera Subsystem (CAMSS)
 
 maintainers:
   - Loic Poulain <loic.poulain@oss.qualcomm.com>
+  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
 
 description:
   The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
+    enum:
+      - qcom,qcm2290-camss
+      - qcom,shikra-camss
 
   reg:
     maxItems: 9
@@ -76,6 +79,7 @@ properties:
       - const: sf_mnoc
 
   iommus:
+    minItems: 1
     maxItems: 4
 
   power-domains:

-- 
2.34.1

