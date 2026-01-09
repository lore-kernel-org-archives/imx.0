Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2455A364EA0
	for <imx@lists.linux.dev>; Fri,  9 Jan 2026 16:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977916; cv=none; b=OIFic87t48ZqoT6ANCR1sn3Wg0mIMeWrX7mYzJC9yGYvTilKz7/as/SjnKxzTY11VoD/kXGEun1ltk9HmMpg+KFfCy/YnDtY/FxUV4D8co4OlfXhVomopXe6k8qhU8kRcKM3eMHVeU2BHZNeetRd3PSam28QR47HI0tvwCKVUWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977916; c=relaxed/simple;
	bh=Uyp3c+ZcOw7zIw42zFp5/g9Wh9eWtjdFSWod2VZLRvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YmfcGTN40r2wLLsro5LDs0xZoZmAoWBp8p7b9cCWfsAQKFqfyYtMcHVugCP2UTafg/ZQnPYoHcPa3dLq11dlhXimHWAvwWJb/U2U60znyi7V0mijw7BekQbhWGg6KTJ/YKfMUbZ6ZWvBGYyUTP/sfY0af/YzlbJImmgs+GTFpv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bw2aC5Va; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMsQu70B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bw2aC5Va";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMsQu70B"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099jCpx007844
	for <imx@lists.linux.dev>; Fri, 9 Jan 2026 16:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ow1+Sylf0/GThA8sV9q6qdIH/jdzl1X0FeZ+BXt7EwU=; b=bw2aC5Vaevcd1ryh
	uLRScVJd87DWUmrA40LMCkcsxHs9m3waqPfan7pxpk6GgRcWkXgbZyKBBJewy4mc
	8hoQ1vxxohXNFijNlFrHk8OXGA/0eQAA4iVRKadwITNauTbs33ODpf72fxDuIdrc
	j96M9/kkJepyhfIrGr9+iDj277g3/eIxWIw7Uo5NFCnERiu9t+yC468YC8pXSltO
	BufnFUaYO6zxBsrLzGdz8GIRZhxHThIJ/GbLvxRHx4fUsRA/iL7QbKmAMCGOoBjs
	vlnVpQbNGySWSaUAqIyte7Glum03G3Ppot/BH0+1Nnoft90P7Mr6af8tRz/Wy4IW
	nkU2aw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjyaqh76p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 09 Jan 2026 16:58:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b22d590227so550138685a.1
        for <imx@lists.linux.dev>; Fri, 09 Jan 2026 08:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977911; x=1768582711; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ow1+Sylf0/GThA8sV9q6qdIH/jdzl1X0FeZ+BXt7EwU=;
        b=GMsQu70BPZeNhFHh/qaZZB++v3m6vRpKArP1+jcC9FZ4Bh8Nq++oyfDx5npEjDoAkz
         0ZmqOuZqKQn8X+D2B7FCeXJ1/WcHWKdMzhdoL+kLdO4M5P3U9lcRiTgvFsafsJ3FS9Ok
         HvoGJ93H9Jsw3rU+BBEcAlgIAdKyb1J9RVEPv3PU7QR8SdkVMg78cJV1lL3gTNE/z21Z
         eGfSKfnrhGWBSthxJBz9Dvi9cIlrVyk4t7XcJK0njuS6I0I0SUEZ+MM6f1JCyQjGpInU
         1boV/LSj6yq/Zxjogv2E9yliaoFvgMCeDjdJOtoahtNZJwKrTYKIgDZu5//uHxE8b/LK
         Au1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977911; x=1768582711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ow1+Sylf0/GThA8sV9q6qdIH/jdzl1X0FeZ+BXt7EwU=;
        b=hHgMZ3GeHYUp/qBvhydR/iZ4+W10cZqLntn1cE6psdqG/sIANL9TutXy4LX9EwivNa
         /UXRTRkU3Exl6TWdyZIzaQSlWEnW+1ivn0uYVQKTEH1UO5EuH49l0UKLBSFh1C8tlYQv
         bjnn8UCHZpkZaio1uf0bp9ZReJqsBpEGeNSGve6cnX684br0ZZyjATGV2Sp91gT+wWu+
         8PR1lv9Ca5+P44Od7t+Wc4Pcg2EJC+fJbHq2WCqPocrfaiz0radDNeSdi53jH5ZcnGRh
         hHUd7og+c7WpG1k/ayDcPSeopzS6tcgk0kOc6xnCR8mCepAAlCr1rxrXA2Hco8jMfF9T
         YUGA==
X-Forwarded-Encrypted: i=1; AJvYcCXyiCMBowD3I07TAYjIXBWCtiwWG3gOHzmoP2zV2KNhe6aQEZW2mcP4fx1/oeY5wPCAC7k=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFD4QlCfAC4yeay2GTrtct5dtat/ywnG+Hi3n7ZK+RFEOeBza7
	X5fWBEJvJ5KwuoGMIru7uIj3wNNN/2cT2S7KvdaM5BEVJCutsAF/rbFAcKokvmLUsOSuoyI2TGj
	dFar/DX7BdAXBEu54aYIFi+lmKnZ/6EPjcvInduxrKzlH/SlRVBbE36c=
X-Gm-Gg: AY/fxX48eZ6Oej8Q3fFvrO/tXZGmwWMdTe5aEe2At4dsb/nMtwFuYkIlAPItVu9CPvD
	SFBtZzNRwCtFJzYYOqRwobGk9wyzVPntNGflVJB9/+ZOX5iz7C9BZCa1kfWA7n9Nw9Pn7k02wDo
	l9fSOUka5FPt4IM0K3VoZA7SeFZPavk/OPM9RM6nMRQ2X1uRuTlIJTRDbfJwhhPYG6c2VxuHfEF
	G1te2rJeOMWYcHaSOPq/95V2MPZ4+opSXyhJztQuN1aDA/wUWqndjxWHBLnV+YnrloBvCoJco6e
	K6U9c1ApmXipOVBezaxJ29UQzLUGCICWB0XeUzSsjV6boQMTPo3cZcpIppaaND+vfxF8uNqbRxN
	qiewn1U67IzglmIwoJpPyRcVujnilkKmlCw==
X-Received: by 2002:a05:620a:31a4:b0:8b2:9a8a:118b with SMTP id af79cd13be357-8c3893ee38emr1424669385a.73.1767977911272;
        Fri, 09 Jan 2026 08:58:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEagzIp+psjVuVk3GVMCLnSaVXjxxAaX3Szhc6w4avTMmKqAquuUCbyZR4B9aXL0lO+SjkmzA==
X-Received: by 2002:a05:620a:31a4:b0:8b2:9a8a:118b with SMTP id af79cd13be357-8c3893ee38emr1424664785a.73.1767977910752;
        Fri, 09 Jan 2026 08:58:30 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:53 +0100
Subject: [PATCH v3 09/12] clk: imx: imx31: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-9-c22fa2c0749a@oss.qualcomm.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Frank Li <Frank.Li@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Uyp3c+ZcOw7zIw42zFp5/g9Wh9eWtjdFSWod2VZLRvk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOYPsGxvbeXsQGj23rJ/C/cCYfiZObAB9ixz
 y53oRvcWfCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzmAAKCRDBN2bmhouD
 11quD/932ltOa1s5tv7DudKIHF/1ebbW/6MsuD85b7MWtuPg8Ls//bcv8pKK2ldqRl0TTVl8PkE
 ymOrPYPnkMOZ0U9NghNrj6KVF4exeUKx90kH9QNCtz+HIZj1nJxO0FP4sAeusOxe6LC0XrIZIgV
 t3AG7s68MxFbVkr5P5MZWLUEqHSyz9ZPyXHNFZ94LoQ7nkL0OsIZ/eFD2njaVT1fP3AysNNBx2X
 nCgqMQaEuqrrH0p1fZir1tlD31Jcd7sExD5GCAdljD6E0uZpm8xNDlJlWECzk2Dw5Ap3COM+KYn
 e3zK6tgBgEPPZ79RFbRXCQWkuIDeyGMDek+78gSufysu1DMds4kQXEFiPurkbSasHj8KuVA2KW9
 +nolYW3e2wYzPGG5gPHWoiE4CUFSKxy0t36hEQhgMQLZezOD3Cld6uvoW35Vd3m3ycLRErbjfs7
 0vTrDkBhUznPnLA3rEEGgGNBoT2i2rJ4Bsh+ilpoIs4vuaPh3wm24arsSyvlOSA93Gg5fvpEVQM
 zbhxmpeJHsu/YUcSjCtdx3PmTZodhUNm03jj+1Cm733yQFBZLh90bbahZL9OSE0bE96DdNCG7UV
 Uc6hfMZyGk02iLvd/M2xdswLxMksBmEDF0VsW9mDk1UbCL+lLFy8lbJGfwOECeeEF+4EZKw0VJG
 3miz2lZ0KOeMIoA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX/NVtS8OYr/jB
 IEEw4pC+Yj/2a3r+IZRMjyL5yL0DNssglnc2cqfF2bbFwGpLWzlZnBlVS0LSMOi4VoPc5iiMesM
 19hsDZ87y3EPraIeoifTYsRy+fdD7/tFZi+RrUZB9OSpTzbn/+taoBPt4SarmujH3SOAlYuv2FO
 sJ0yL9i2WPUJBwPJAooEQdFiVup6q2oP9NAlCzyFso2FQIl0wEeJi/q6TPhekXP9LbxhQWgCm+v
 GBaeSFTJek1hAJpXQ6Y7nu8j4DDsnhgkymWEXRrbwFgBvnOtnjZQcE1TLtJIaekXQE8dOpG3xb4
 AGp4YEAt1UEFw5vL38xhlnCuZG8g4f1OEoLeuun56k8M6bRuxcZ0b+yRGRpnvHMtTeW3V867Wwf
 UIqLqJeYisg+QaSSxHmB96qEIOrXOMSGteoB6td4Ekhs9R/nqIUD1QEiWJeoZZ5d1Nq2FQE+AWB
 RH+V3tDj5VJq39nS/3A==
X-Proofpoint-GUID: DigiAM4UPI_kdcXIsQUB9bVyzeYEaGKD
X-Authority-Analysis: v=2.4 cv=IKUPywvG c=1 sm=1 tr=0 ts=696133b8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=i0EeH86SAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RsIb78jGsj8zXbp4E7EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: DigiAM4UPI_kdcXIsQUB9bVyzeYEaGKD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090128

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Acked-by: Abel Vesa <abelvesa@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on first patch.
---
 drivers/clk/imx/clk-imx31.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx31.c b/drivers/clk/imx/clk-imx31.c
index 4c8d9ff0b2ad..962eccac63ce 100644
--- a/drivers/clk/imx/clk-imx31.c
+++ b/drivers/clk/imx/clk-imx31.c
@@ -123,18 +123,15 @@ static void __init _mx31_clocks_init(void __iomem *base, unsigned long fref)
 
 static void __init mx31_clocks_init_dt(struct device_node *np)
 {
-	struct device_node *osc_np;
 	u32 fref = 26000000; /* default */
 	void __iomem *ccm;
 
-	for_each_compatible_node(osc_np, NULL, "fixed-clock") {
+	for_each_compatible_node_scoped(osc_np, NULL, "fixed-clock") {
 		if (!of_device_is_compatible(osc_np, "fsl,imx-osc26m"))
 			continue;
 
-		if (!of_property_read_u32(osc_np, "clock-frequency", &fref)) {
-			of_node_put(osc_np);
+		if (!of_property_read_u32(osc_np, "clock-frequency", &fref))
 			break;
-		}
 	}
 
 	ccm = of_iomap(np, 0);

-- 
2.51.0

