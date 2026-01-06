Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF363161A6
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 09:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690949; cv=none; b=klVJo4KXI5HyuzF3e7YlPHjzE1XM/D15h3jkDWDKjWIMrhQj/JzSvbjdZyrQZAQ9EFm1bmpUoFPP6IFr5IUhAaEX4+bXUAP75rGhn4KS1fkYwq1on8r5Oz4De0cc2M6cG2Xi12uRigDdwYyzXZFV+zKJGgTOwtLj1dBjtCPZVFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690949; c=relaxed/simple;
	bh=B2RAEF97ngkNBnHTIi768G91uQ5BuNJ8Fv2Rhei9uNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IdQnVElm5qe4Z28f+anwNdiQE8xBo7pZ9b9/bPc7pjQ2UNzxaoTOVOKbkHDQBYiojNKUKwFwUly+QrPCNnuWIVhNsRqk5dJJeY/qSWlaP50b30ZO4VTjIwrdclFkb/zblN6UE2OvMdzxNNAnjxZOc/3mQSxjT5xUiaa/kRT6ZhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NtyVQoF+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g5GWmEUJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NtyVQoF+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g5GWmEUJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QnoO2923445
	for <imx@lists.linux.dev>; Tue, 6 Jan 2026 09:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBEdjaP4YOYo4EY0dQ9/X0NsQr35wOIRTvy9Iw4NvVY=; b=NtyVQoF+ceBRN0bs
	ZCjO/WD8II10dIXjRhh26LBPwj+8DJQmjrFB4Cj9YMGhRP+c1CjxwUU+syFQgKq0
	/Qh2QqrkQq3SR7xNIJ+Z2fhI7/kQH5zCJDOtyLrfyhXxire21mu62dpmL4ySsXqX
	zJ7qDDRZ/gcH6vGY9Y8hW1fG7rRbY0BmB8xoJbTmxvH5gzzaUzv7KpnLNtvKHPXk
	wtPraP0WL3YMGPLtWpesV93pNYhCbCtuKYSxJXXlXclYl2TeL+EpEC/l0CzEdLge
	pwERZjupNDyWwzqWeU7ulWmbWZc8FqqBq27fznfJj3teew0oQ3Td3Dy093kyozJ1
	vsz1Cg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgscy9441-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 06 Jan 2026 09:15:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d2aa793fso24094091cf.3
        for <imx@lists.linux.dev>; Tue, 06 Jan 2026 01:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690946; x=1768295746; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBEdjaP4YOYo4EY0dQ9/X0NsQr35wOIRTvy9Iw4NvVY=;
        b=g5GWmEUJjBJI/ztqTK/X70A6AxuhvUa8bxKTyOCkEPizzItNKRpZloE5YVks26zR62
         /m81lAXm5lL5Jy+A9zh8JnrgiXMZlprakRS2efjjSKGX1FAOVDqkfxMx5YV81naA+c0v
         Le9HaWJ5MDzEBdoGPLgMm6QPKwtMOusMsTDoDMXP68Fsxgqs7G+9jRUidMwHqbBc4j+L
         xWkDSENUMYcx7tKfTjS6Ld2PfxRis3jKtktFi/KFdFpmgR9+gz5JhEvVmbFTJXhWSL8h
         dw2NsHWg70+m1XDaKjN1C1Bs9ujBh6uUQqv7U47wX0HABxSo/tNwDbIlQspte78EaMPB
         ZSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690946; x=1768295746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kBEdjaP4YOYo4EY0dQ9/X0NsQr35wOIRTvy9Iw4NvVY=;
        b=Ve5KEUUadug9KqRO4k23plLYhhFbM331p56sGCHPw434OiM1EOPsj7qd8jNZQIq2Cg
         njw8FlmBBiiLGB/T8qVvCPqhXa9skKQkUPYDKE2j+J8XzeFJMUnwgz9mUe2mZOII1xUT
         LkHoIeQNoRFM0WhokPXW3fz5rR6PX7RL+MVo48j7Foceb5qJdHyt7IgZW0mhaQ9+6SVU
         8e2XAfZIw8tcBJOS9V1WQM8X0crCcZqdrMQdZ0rUmMX3FJ3Q4/GUlUPTEWxc442AgzRW
         9DByKN9DzDtkqXA7nyUxHJ7yuBQt9Q2jHtUaSvgFyynQmlB5oQ8OLEbtWGcwotG8K/YF
         c8Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWtBoXfdw3OV8LQ2b7i6uy1tThqRNH7IgPiiPvLFiSnp3i5YFm5vRarI3IW3pFefqih0fU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLX1pZBUtfyJZQamuGafL3SSaYga8l/fNwQ1Owf1SGFXD5W4Jb
	oCjQUv8xq7I+ZzZxXGz+TxLXwPI1De7BpvtSoF0n0+PVDbwh5Q3bMEjgxqPoBT8hb2JHF9SptKh
	XDicY27gJb+FSiMlaNNqwURZg0ehGUty9YiE8+cDE/wcaxeYDztTGycA=
X-Gm-Gg: AY/fxX6h44K16AusqFFmAMHVw3Shlj8IZfkGLMogbQjUDhFBQO9+VVO4Q7dhHCHjckE
	DmJybupCFvaP0YUUfej6Egcd3D8x9k9vpu90hXKaV+C8TTnM0NMg4No582gwe9e57oP8iNDcA0Z
	zg++i+p16wI3wepZLMKlx0RmY5VfGkI/BnfLERWKGd5YpkwJXCinTxtvxawOPNK2GXSdO9T9X4M
	spxqrYeIzsG6eAi70vcy4DGSk5QCGmyEPoND2apfDkMLR3Cf/zhOHNVaotU/kQs+hFaaNKGRLEO
	TwfdZ0SGPBhyub08+FZH2kXwGGqG5blDwoboBBVSLT1fKstbafeMJvMJbYhfDIIfaSdizf/jXlJ
	G8Z6YVaSXrWbUBL/5HKuyRmq/NO1sFZ2DLA==
X-Received: by 2002:a05:622a:486:b0:4f1:ab34:a0c9 with SMTP id d75a77b69052e-4ffa782e976mr28103511cf.81.1767690945705;
        Tue, 06 Jan 2026 01:15:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+GiS707Ezd61sp0fMv7YHWgjS4AynuPW8/ntoYHo/pOSzK7gjRauU4L2KRKcyyV5Q/7R9Yw==
X-Received: by 2002:a05:622a:486:b0:4f1:ab34:a0c9 with SMTP id d75a77b69052e-4ffa782e976mr28103051cf.81.1767690945195;
        Tue, 06 Jan 2026 01:15:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:18 +0100
Subject: [PATCH v2 08/11] clk: imx: imx31: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-8-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1215;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=B2RAEF97ngkNBnHTIi768G91uQ5BuNJ8Fv2Rhei9uNc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKn0NuTErJaGzdb4wCVzMIKofdqMitWHqhMq
 EMTzwe2JBOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSpwAKCRDBN2bmhouD
 18PGD/9FFNjyRevfgPdzpoydpdTM0f0f6RbmG4ZFfdELpbX7T973V0+MVSxAbrtEAiCSpiGv2lb
 XekSg8Su9wpX5jTWIXiR6qx+XCdrn3wCNm8xz6ZtzPGSPwd51hEiIOAmHMk9/8WakntDOCqmBFs
 DDff7uGHZGlsFnmRvh3UnL6nyxD2HgRmwPGfEuvjF3XVh62KU0F/rAuzZbDw8ebYL+FgvAg67df
 D8E106iSvRWjyrOhasN8Zi0Q7EJTyGWcc69ScNa3U9R7BsZKACIWooO69WY54aOs/PgxgBcXLSw
 2f7QWw19t9X5tvnxSJthY2zHcBwlupi7Bx+m5NTOBl2LCajdFgES2ramoLhlQwdSJ8i+4gra/K+
 i9hBTemvE35IHyWsXLOCppibb3vyGXzmxYhXTHBgtxelsicK6hUZLNGHUkPbO1tA0UybdgN863+
 x13nxG+wm74AHPncWZULH6rmNykZJ/r9QkkguX9BW5NWZ8KMkIUTBJi7Wo6BpLGUFBtWdsOUn6b
 Kowz3HrP38XO64o6h9ZwV4Wu4qCruCojveanB5yc37G4WiPATUPtoJ5H06RQ7HqkIF1FXlHx8yf
 OcI0QHN+fBdwvlCcXF49fS4W27bN+Q6093BKrwmTx3hp9/EJFT61Ey44RWSslB/UXFKQWZtYjRL
 gpsx9atEIP9pe3w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: qsYwZ9JT0NgvxtbNknW17-yqsdy9F9dx
X-Authority-Analysis: v=2.4 cv=fOw0HJae c=1 sm=1 tr=0 ts=695cd2c2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=75aRx82TGYjwQxWndmAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: qsYwZ9JT0NgvxtbNknW17-yqsdy9F9dx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX8TPp4oraQHRV
 1IHoSOQHN4Sj1si6LB0XO3wIr/LpvfWLyHsxGJE6iKH4zPn03GP/6VtG3aFL1OzkrEW/YZUUisO
 U82uLRXmUu9+kgNfsBqwLOlWE7OJNTkfzDPeQqKJAZO+7WrCEEjMNfDPk5qB5czueDh3cb34jvT
 MM9plnfWoQsjNyu1gA5MQOthZPtZxxwcZLroXmmx+tEskgkkT/QIbmSBno3O+Nf20KrK6QyIUoz
 5L6D6wAT4EAaPnmWH3ePRCiI44oKJ4kS+dy2OcHaTOGBFLWb2iQ7gDChjZP9AMA3ZqHKJhUMMY3
 u72Irjv46PXI9ax/8wXBDfl+1QshBExacYRVz5bABucIWwC710+EcBZVd5qDpdcpky4prdvLQTI
 RxfNLmfuAjx0lHHjQ89etfVgqNZQOy7PTJSv7mF8W1WPcO9DUZE1KMhwxS889+qllop6EuVQWFC
 Ze8Vm488HqBi0B1JFYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
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

