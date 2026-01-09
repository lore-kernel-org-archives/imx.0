Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE5C3659E1
	for <imx@lists.linux.dev>; Fri,  9 Jan 2026 16:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977904; cv=none; b=Jbe7uJqXyXsHiIZoKEqDyUa2bXHima5zC8flzW9S7MaLOPOnxxt3VUujYmQOhbF4bmTWG/iB3FETXyOddI/xMiPX61Mb/ugh/Eo23loKtIq8s/ajt/8TRTlqkmBdJ1/gHnMyx9n/3XeAuASSnuX2fDti7xDXlTBzPpfoOkhY/xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977904; c=relaxed/simple;
	bh=fbIWwHrmfYrR3vDomTykam7HF7n4jDAXWt4nFKTvi/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aE10iz/4sD5XbyvJXbiqEJJF/2gh+WIsVtW5mZ2mVyHnrW/n6uYG45Yhlt+eImJCg06adIMHNYfk1YpNqWJR4l/yuRdZqqGb2mGyhUFjjbyxOce9UwD8yBa6eSBU3VmH8uPH699gK7AIEFbLSYb68FsVTXmRvbTGAvOlqsdv/4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GtbD/J6z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U5Io4u3a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GtbD/J6z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U5Io4u3a"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609B2pQq1062707
	for <imx@lists.linux.dev>; Fri, 9 Jan 2026 16:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXdWjT260fGUyPDLJnEoIPiY7XHrVeOdDpdi6E4I+ZQ=; b=GtbD/J6zPFKPLpSc
	W6GI+BDhloVRzAm82fy3V2eaXJcl6K8GEi5lZwiV6lsl0gYQu9rlK0PtydFVXzVC
	JFr1WZxyod07PnIh3O6pxGp4VEpAEvEzodGhCQvhRVGxMpezhJCsBwGKXpoaEaDt
	rhrUXarXSEWmGjvEm8A0DcCt5iNs+Ko7y+/YJUdQHOK0H5/zdaTRzViLLQ4bpgs7
	labG+r+na/Wxk8V68ht6ZHyU75O6YSYVDHIzv9wtcZ7Ii9mNGRgSVJPUbEgQlR2y
	Wi27kgWIssIZO7rfFlQS4JaaCBM04mYu3lzUgpnEZu2ttVLcUKL3clBvKDBa5e4r
	4/nRDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bk0f690ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 09 Jan 2026 16:58:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b8738fb141so886327685a.0
        for <imx@lists.linux.dev>; Fri, 09 Jan 2026 08:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977900; x=1768582700; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXdWjT260fGUyPDLJnEoIPiY7XHrVeOdDpdi6E4I+ZQ=;
        b=U5Io4u3azF3DzwbytV77xsgc33ZC3uP8I+N0GO/VvEOQPPEnehffZQPtph8KIjLhNN
         LE3+nbjk/argG0AbbKWL7R7grNd4Hhfugz5kP+Vbf7Gvy20ytnuVQk/H/5vXaeGxFENS
         sB8Y5B4g4dGe16lO+aeX61aof08TdSHl2vO56kz6zScyKLtFbgozE4jn9Qw1evfhlkkJ
         Jvs/mO3QgN8LiC2mnh6Axf3zNBh4dcxVolGAOrv3RSsc0+lf3rw9UWlZA6NgKI/u2s26
         KPXyhWvbJHKrEfoFOugJdEsp3D0Gu/MbBh23GWHHEdkfWdFERAz/LLX6+2YON8Vu5daU
         TBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977900; x=1768582700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GXdWjT260fGUyPDLJnEoIPiY7XHrVeOdDpdi6E4I+ZQ=;
        b=KrnoIicdHsKDD4Ynt+jtcjjxZfPyBZGj3MXtd6knUHhI01rw8ad5UKZ7WsoWrZwW2A
         pdQCxVZ2VkT99qRg7R+PFMePm4EoqEYbNPE1/GP/lX6ts8g4AJjW0YS2AoLfddhE3yuO
         A0JKAim8SSN7deRKNmZB+xNiHwleSZXvEQlxT9Qo7VnC9GdIlOZQb89MB+FJ9/GWOdjt
         1WMCL3lbh6Ipfr70+g+mE6hJVywn4/aSbiXn8ENn49Cq29QAV1FjhUfeO+IcyU3rFS2/
         /ZhQCQJo9Qb1BpTC7IVpfACFF9tPd1GNJ00TLBWtq09AkYtgEYemZTaAVyPgSZIVNxbL
         Fx3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOX3wA3yWYTVOiFr1QzWXeWVthvm5Lh6CxSWZiqjCf38+AuYhmsV9YiVuOXQ0rGmXwhZM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwveAXy7lNOBVv4s/5vdqEyYQRhQTRKEGSi2U4pAAaC4vj2kTv+
	FQPlNEJ44YNpJKLaa5pqxgqbWMaN8v4e8ApKi2JP9e1aKNwLQ6qYi71oPn3ymFhS8IVq73iepQ5
	90xxKo4BMBLwHREDjh4Z3x3byU7RHitGS7g4iTtvrO1FGtJbmjtxPybw=
X-Gm-Gg: AY/fxX6J1HuRxAFnwAM9pucmj6swJOyZCbt1MLn8xq1tiKGbEiQAU8zCammxYK/WUfS
	pacBmjY+FR/D27J9MxvphtJsi4Y4ys7VBcrNduOoXwfw9p9gRO5pj+L+k6ZDm167RMJKsX5sm6K
	MWGNExgcZlAGvyPqbsT1KL6/ab+Jujycic02oWyX3Hb+yoqzi6DF3EbU9GJ3APRXb0DpWqeSoVp
	CgZJeR5yDKF/Qaxv0665v+baIUwmA6suMEbpxiSvjugokoMys9Eo3cLc8eCXbkyuDOdssKsYB2o
	52lVURcQgVmTH7Ki4Do+WKLI4VVCO6YVDHBtNg5pl2MePdecSFhINulVfh+8twZQ2OQj5QNgbVH
	IVOnZLLR76OhPCd9eXBu2EdHEz5+/C6NaPw==
X-Received: by 2002:a05:620a:1a06:b0:8ac:70cd:8727 with SMTP id af79cd13be357-8c37f4d721emr1783520285a.11.1767977900090;
        Fri, 09 Jan 2026 08:58:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfx/aTgL387I1S/9aU0ocVMFyV/LqLV/0AqK+x6nzaCXP2E2+pwPoObAcqJpS1Me1ayHGncw==
X-Received: by 2002:a05:620a:1a06:b0:8ac:70cd:8727 with SMTP id af79cd13be357-8c37f4d721emr1783516485a.11.1767977899620;
        Fri, 09 Jan 2026 08:58:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:49 +0100
Subject: [PATCH v3 05/12] powerpc/wii: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-5-c22fa2c0749a@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1298;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fbIWwHrmfYrR3vDomTykam7HF7n4jDAXWt4nFKTvi/A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOU+9yDCXvKsPVTAtxi177gAE8GsYE80CyIe
 miqCT3L3HqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzlAAKCRDBN2bmhouD
 19wnD/93/HCr8QM4hN7A5FkBlG3ipdhLWJ6+pCbCEODwThDqGymMF5BLDYZ07GFdUN6deKJEzRu
 7dx8cnLlatfCl44Ij2C77df+eM9l9d6pqaWp3LaxMI6ewmFPWYs1DrZBtFZEOWcxc2LxOprbIIs
 3hwaOIU/KhSEf0Oek6tSRXxgaD8Ca2K6h5gnE/wWaGG3ZNcBxYOk/GKxpVPCX1y02nsUKWPZ2zN
 KZpY3GE+jGraCMI2EpxrMd5aXfjRpVWJ13+I1RY+dJ9sqWrxMEKJ9q+FzF+9at7yuU2+fMGaww8
 PgPTMbl40W5CETrBgU0jac0FsduQh1AKvJK8Q/a8sIZdzmP2uXM6twdzJovFuF8cuGF+tge+l4g
 ANnBZUy118+HJsSJeJeHoLiIvfxgASWQAkiFfYa5b/v3n5MqsGkTn3O08A4ltdiTOk3O1XilzFw
 u8bnzX/+kNzlDYX2pVbjczrGeNbdoL6O/zxXyo8VQWLJIhIUwpl0/eYWzW43xjQozUypB3Lcb+y
 pzgUZR87tm64oxcdd+/5A/8T4EDqwUHmZ5bh6pqto/4vxNp2AyOmwjTcr7waICJv6ugTTFgbxRx
 XYaub+a1YdmaWK+jRmK5Fpf5C0nuCQ+xVhMPUVi3QTlV0NXIMKQr6bazB6cbM7asjyrSPkqk961
 hv8kSrk5jZ7Nbnw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=P803RyAu c=1 sm=1 tr=0 ts=696133ac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=uffMIp6nSmQIayL3VFUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX7c1/5z0gnPjK
 sYkzk0nJU0I2ZWCWFcpIdagJ8L7BFD5hX6LXQAYDcpd4PvZoafYLVVzL0k/pFZFKY2wukvKj+gi
 N0uPwH5TW7OQcCmYiLCLnoV0EwExZuU6qElH9LUhZcj5SVfn2+IzQzXlumkfxQ3aBqg812HiQZh
 20T2dz1U3YFqb82jeXuKFYS6dqzVu72VG0ooTAuyINrB6UbQUw2A+c4DWzRdOwPOFHuAFFC9XRI
 TBD57zReyRAWceztj80RZS5m6XneIPIOgJzOZAJfurfwi3Xip9dHNTtZGp0uL/IOB2RbVeVnV2O
 w9uQ9essogd6+nymVkqLhBUse7N7V0J1/fxeaI1uhNr7RYgVISAgS+q/mjL6nbPtwoQXglw8d5F
 xPDOfHDxFxt0zJ7ZHUsxKa+sW/eBeRn93RwY1NJG5wZ98I4XxQJRvYRVyi3bWi3FBFgFplZmVZ3
 T7amqgqMr+kbvEW1j/w==
X-Proofpoint-GUID: DTMMP4K94qf56wnYGQEihw2XmLL1jFNf
X-Proofpoint-ORIG-GUID: DTMMP4K94qf56wnYGQEihw2XmLL1jFNf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090128

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
index b57e87b0b3ce..1522a8bece29 100644
--- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
@@ -201,11 +201,10 @@ unsigned int hlwd_pic_get_irq(void)
 void __init hlwd_pic_probe(void)
 {
 	struct irq_domain *host;
-	struct device_node *np;
 	const u32 *interrupts;
 	int cascade_virq;
 
-	for_each_compatible_node(np, NULL, "nintendo,hollywood-pic") {
+	for_each_compatible_node_scoped(np, NULL, "nintendo,hollywood-pic") {
 		interrupts = of_get_property(np, "interrupts", NULL);
 		if (interrupts) {
 			host = hlwd_pic_init(np);
@@ -215,7 +214,6 @@ void __init hlwd_pic_probe(void)
 			irq_set_chained_handler(cascade_virq,
 						hlwd_pic_irq_cascade);
 			hlwd_irq_host = host;
-			of_node_put(np);
 			break;
 		}
 	}

-- 
2.51.0

