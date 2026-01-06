Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F069F318124
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 09:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690952; cv=none; b=EaZUne8tiSITW1tvT0ULIckfvWiiYcKBocC6zWAhrNF4WgNP/lNilo9WWQF3b8TyW7Xn6RE1BYDJ6JktjRiSVGtJlYX/3JscVSM4NGLSr01A2iuigauRHn43xj4cCC9UgF8COD3oj6B4NzWrvy/dw4gL8F8VUQ+NP4gdP9cotDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690952; c=relaxed/simple;
	bh=GS8OvkusvmgcdB0Bw7k1Y4Yk9s8voPKG1OqeEcLUEtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J9LLnAzWT0a5DbYE19sGziNWhqeTtR1MEzNQ1F6Vd2ztw8vsKw/ucnJulkwmP8VmrJ7996mJI8YFJc49q5qQCt8cgRuc7tFbkYg6G7xCSGd0dcu/ROYlgTu8QrSTT5m2oPyzCbWcwCDi2JA2B5vjJVaqP/MXqcGHP22D+VYjYcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2y2OUhF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A7leACkc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2y2OUhF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A7leACkc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60648xrx2253758
	for <imx@lists.linux.dev>; Tue, 6 Jan 2026 09:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=; b=K2y2OUhFOKBTeAtq
	0u3zoFdkyq4eSfwn01b61VxjwIpsk8g7AtXa3/k74ZPY6EZPoSZsi4cKkD2i3QOT
	vDh1SZqJ4Zx3seDvUjM91DML6YuJjIugh3lC0Bl01rL32fUPu1QWlXVOULAGSzJ5
	wI735DOof3sDJ9L9n05wfTrhAdsr1E42NWlVeRE0h0CHNegkr722qKG/ej9/TydZ
	5oevEigT2LrTmQSq35sMNSUpi1IqH+li99Lu29RrjfsDs5bTMHwG0RmBQJokrY+q
	7FgIQI7FVfEULJD9NMGXqhL/2gBnMN1FnxITSuIm6OLnRrQQFi0zV/Nb+0qKnpEI
	Ym/P/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgu420us2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 06 Jan 2026 09:15:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b22d590227so102491785a.1
        for <imx@lists.linux.dev>; Tue, 06 Jan 2026 01:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690948; x=1768295748; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=;
        b=A7leACkcSMCkrXlDP4orafDjeA31oueKWk6uEl9yXg9GKyRTJ9LIvi2kkg0ZuFLEF1
         wY44sYGzZxfngJvGinC2h88DiCvNQdAY+zUDFEiLS6gpHN8IZIu3grLVj2L3upx79KVZ
         0J3QPG25sHwGVZZGM4cMp49pVzNa81K9JbaQOUsqlvhc1cpXgdfF7J9k7IzUKqOquyRF
         AIoxggCbJwxkTI+h+ugTdr+XeM0Q8Gf6QI/JHuJSJYjfbYlPM7+UdEZuda++D8J4+POY
         czdFqQp16EIAFvLeVNnXDXAfEx+h6pcXNqsFgQb6VftPy4zr0K+e7plD6OVEs02B9Qx8
         j7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690948; x=1768295748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=;
        b=TgPEBmLK77w4IcV6VOq0wuCMZrYa8rYCXTMRnBql/7j2e7vLPczs1zBE0lr/pnSt5o
         hW0jRfA9a7KLIHonzaugJLUuGjh5dwGHkODQNeRZu3ubr12an7OfKHt//ecuxaTQ/jtz
         Noox2uUZ9w7TAnCoTtrpcq7/c80hCSaAf+7HN1WJqJD+BAbGr2PQkUeEHtsC5O78jNo6
         dUGrBlJ1J9UjmTSjF5aH1PIE/NnsvoZu2rl8WS0HfjnU9k+PkPju3OphpIa5greOwHpt
         aUQWU/CVxjlb9NUJTjoeOGaOdL2bOlYCnpdWhwmgCFxMHGiH8c8ByDaZ02cG9Wg3mLIa
         HhWA==
X-Forwarded-Encrypted: i=1; AJvYcCW4+bYPnbAcdINJB0ovvFaXn3/j7J+HpOE04dvD84G0zP773KlJ54kMp0gadydhT8y5ZTQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk9s9UXOZfZab6NalZs0/Pzzw3jhTTlxHomKdiV+2pf1RIq6m6
	39+OnoUPCXK3vT4nFf+EpAlr8WS0C04cfXMc2gt9RVROQIoNm4XR0sxuTGgWk+6aGvbgKwM7Bsr
	ttxx7Htd1oj3BeScG7tVeO6XawZVc5vbqP5pd2gWV9/R5bGG/Djc4AZY=
X-Gm-Gg: AY/fxX6AEXPeLVT/+N7Mi8n6Cxtkb+wZuM+vKzjXseHaJaDXCSRef0yaZjQ9/lbdSdH
	KVhgmXP9RcKhIiI3BJsKXCT3KPytZLLccfaQ9zkaZ0BkYLxun1yUgCghQCkV9MQQhLWavHTkoJ8
	mhUvwpuLTJYLe0QbaysuztwGYJ0ZhCKyp3MGcrnOVvsyAM77X4LW43MOl6/SQwaFQ5uvEORYbda
	di8ivTfv/cwA0OzU5sMkWt01Cxts/GCa8lVoKdJR+cXT+WTpoaOF0kFzyhU2fvEQ/VEYJbkJbhV
	UbmTWuDaXpXt1id1lyMo5icIagUr5M0MYzVP8gh7ODZShr/b90aN1gK2kNcOjnHe4kGcKTOwh4X
	pZ18b0S83kAy5mDb8HwTudX1f6ZAe36s20Q==
X-Received: by 2002:a05:622a:34f:b0:4ed:b83f:78a3 with SMTP id d75a77b69052e-4ffa77aa653mr26990771cf.47.1767690948188;
        Tue, 06 Jan 2026 01:15:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHlsqdZImWyZR63WwFSMPpAOaqhhQOEY6qsvs8J2TYEGoLxgoyQ+tQ2SIrX93DUzAU0HOBJw==
X-Received: by 2002:a05:622a:34f:b0:4ed:b83f:78a3 with SMTP id d75a77b69052e-4ffa77aa653mr26990431cf.47.1767690947749;
        Tue, 06 Jan 2026 01:15:47 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:19 +0100
Subject: [PATCH v2 09/11] dmaengine: fsl_raid: Simplify with scoped for
 each OF child loop
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-9-05eb948d91f2@oss.qualcomm.com>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GS8OvkusvmgcdB0Bw7k1Y4Yk9s8voPKG1OqeEcLUEtQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKoTrzxQuj34DrlmfL4gkQkEqmVwpmfV966k
 v59U9aryviJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSqAAKCRDBN2bmhouD
 1xq5D/wLkQTsn/q86zmdnRKEfkOqoz59r5ZsIs4UkOT6p3gUQrAkGQMknuX75jZWDumDlMMzr4m
 wm31zU7SZgxaiwsfheFrSVHIGnXEldOci2nKTq3QVc713Rj8YZXHTqSQmTgeS7pDi5ZcDDDxrEJ
 +/brmshxXLsTtWWuSapoo40bEXBBUxscI8K3embILPzkizJQtfBb1t2m+bONrtO00as6BuPRVhQ
 IShnvdBTOwbCDRpo0WZ3twrbajEdLMOq+QIZlaEZuyMI4Qu7bU6s+SMXevITYOOlfgO2vZWSQ4Z
 S4STHxsPHVZunvspOch+78go59+OZtMYWhMrl4XYpUGeHRuP2qou5RsrZ8OnYEDw+uUL2FoHljs
 dT8P2D0dXjqMiT6Omgq3mZJudvmLAn6UqUODK/GvT/+iphjlu4qToc7iBShU/pwQ9z0NAS6H8sa
 D1AhlzYysND44RVmdQtX4txfFqs0/c4tR7ucfYjneGkWIgcxDrq8WBHZO5jwL6j/WirnUX/+jxG
 KcU81Km4LTP+iTvv9zqqCOXweuoC0Pv3RpavjT8c+5tY1U71Z00azyzpP+ibdlrx2bzIqD2xiW9
 0kIO857qBHsEIIbcdpU+pgch9fb2zFg6dT0l5ZLAdQHGvChNJsgtzfWml3v7QtVFu2RdKCrnn/o
 lRzC6hj6dWUEK5g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=dYuNHHXe c=1 sm=1 tr=0 ts=695cd2c4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Y4m7J9CmZLqqru8kQ4rIMS-WzbRuExtd
X-Proofpoint-ORIG-GUID: Y4m7J9CmZLqqru8kQ4rIMS-WzbRuExtd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX1faajC2TswbP
 JU7mt9xCgligzsjKMvJOSWZvReOUFhi4a5aDV5AoH63mSGXtg5PPL7qNATELE78hd2CO1cTV7oU
 aPMeRmiwP/ouhyvWSwwM/V4rLzb8E9fuuctF1S1GTn3Y6EnAc6Dv1K+xKDABMyVf13L0SrMFUyQ
 c72hl1vA5UGHhOU16aFBNY+HVC2lxxR35PSdBRE7SuYsKPE1AvO9rlAHwlQiot9OFjK3zDNS5Kp
 jBVO1IBi0gISSoj8vZHpEZ3M66D1YLuNzHlYZ0dciGka0tAgqdJhwIpHCAZNXmOJ0YAS97ZAONO
 Iiblt0+fPtvcqWwQhO+4sNx5SL2KIhQSLM6G/sDkJCNRL5EIXet8BLV/nscyjJfHBmeyZb2IPNa
 SRIu4YJwMxCUC0crisHsHhzBh/a+PbDDrP57DHMZs/kepKr2u2/mdB/4wZ1UWASmmGXFruZc0+k
 jRWE9enVgGabC1MVmtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 drivers/dma/fsl_raid.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 6aa97e258a55..6e6d7e0e475e 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -746,7 +746,6 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 static int fsl_re_probe(struct platform_device *ofdev)
 {
 	struct fsl_re_drv_private *re_priv;
-	struct device_node *np;
 	struct device_node *child;
 	u32 off;
 	u8 ridx = 0;
@@ -823,11 +822,10 @@ static int fsl_re_probe(struct platform_device *ofdev)
 	dev_set_drvdata(dev, re_priv);
 
 	/* Parse Device tree to find out the total number of JQs present */
-	for_each_compatible_node(np, NULL, "fsl,raideng-v1.0-job-queue") {
+	for_each_compatible_node_scoped(np, NULL, "fsl,raideng-v1.0-job-queue") {
 		rc = of_property_read_u32(np, "reg", &off);
 		if (rc) {
 			dev_err(dev, "Reg property not found in JQ node\n");
-			of_node_put(np);
 			return -ENODEV;
 		}
 		/* Find out the Job Rings present under each JQ */

-- 
2.51.0

