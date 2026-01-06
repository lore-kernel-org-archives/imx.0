Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837702737EB
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690933; cv=none; b=YYC2FK30DKIGd0V941p3vPiXlA+AMfXFgv6f6QFt3UrM9FM6kraYLVxtfw9N7/8JdrBsQ0b8dCwAIdAFkCrhnbxQ+P9knE6uThQQbbCztV5NxqZiDL46ZtSoU80u/Zp9CY8qeQAzckEOhe7bno/RrndsVV8FQj73A2jqhqlRJ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690933; c=relaxed/simple;
	bh=9sqpJR/1PYKlbU1KPBe/Ap+/bFXa4ydA6Vbe18Jb0Ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JrqA1mfUhEZvHu3IxEm+CZdczRBhD+UhmSuUu2Y7jL2/9PDluIh6UX8GqcFQiyFxEaDmAIar2jkGC2yJIIqEqr4j9FZVGCC9CY0usJ5eT6xny0m+A1SL/OA6d8oV2/lMJbIpmfIyhJt3Os7Va8NQZ14Ia0yhgUL1L/hk4rsd+nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HCVtwo8N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0kZ9Kfa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCVtwo8N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0kZ9Kfa"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QJXc3271611
	for <imx@lists.linux.dev>; Tue, 6 Jan 2026 09:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sz/H37mRcKEZM1Gqhc8mjnRIaCTY2KeQ9I4K+I9kP8o=; b=HCVtwo8N1KifHXa5
	OwySVnXsxhSHc9dSIkb/ofOdb5bk4S8XoTTbaBAnKBoNwcf32CPKIUNJBN2qGi0u
	XCSDgbc8tU1Qh3JmXAEy1X9LEPDHng52T7a2jFy7jWc7Kgh35P4r+iQwjj7wjbP/
	96qkGj0OgfwcVg6vzPKi1KJBlkCxkTPVY9Ny41h5sCRHETS9Ny6Nqp5PrhNPNxR/
	UbjxrjPwLze3brDPkj0Qwn7Wn8BFkAC7weUFrH4+VHQHQ63VfI6soomLWcfFPRDz
	/lipZAHcIv7dfnps95+s/kPKpQhmdMk3TXEppxyNVb3AtqZh0I8nLVBP1mnt0w6u
	P9eE8g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv02qe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 06 Jan 2026 09:15:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4a92bf359so20690421cf.2
        for <imx@lists.linux.dev>; Tue, 06 Jan 2026 01:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690928; x=1768295728; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sz/H37mRcKEZM1Gqhc8mjnRIaCTY2KeQ9I4K+I9kP8o=;
        b=c0kZ9KfaChxI0KaYDzwfehdQ2wqqA+gFs1NHW0O6KdZAqcQA7u9CWhf9mtVHn68uaZ
         tV9bkgUCwXtismTmWSFzTN0oyDJmCvbU1ddqUBUFYM8hUkibrSEG2q5bNMhn+VAdHgfM
         yTFpBgxeJR0jfN3zwRn3vdIeUDdhdtcAXFAr963po21bPJSCibLrjLRQNJSFKu0ny3kF
         X413SF138zIqSJJ3j4EcwWzhywNd6rcFYJJ5HlK0irszSkcENyG2WqN124SJoXSpAIPt
         Nn5TDYgQLlEI1UYkKheU/T/gQN7ydDnLZ6fhedKmA+kFJOZci/xVTJEhvrWn7ALQonAW
         bm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690928; x=1768295728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sz/H37mRcKEZM1Gqhc8mjnRIaCTY2KeQ9I4K+I9kP8o=;
        b=Sr+bO2MrB8iwRLVhZHkBpmnrsw7vxNnVV53WwhEb+xvLEa5MA3etaC6FEqzr6J0i+h
         0N6TGR8BnNBCh7RAKg5hpLkOqMuASLXUy2S8iEzboQlw35cYDgn8WBtRXRg/q+zx2+U9
         8U5pnOGKlcb6RgwxoncrkOOCm5m37ptfkiovRZN1nSjGgoQjxnvCIcEn6tLc9kaLnulU
         59oC2nbjrm8/1Swhg9sK9rAfc8d3ZkyGRr1fdxt979kxVknK5mMkS84fTXJEkh9Kxewy
         Y3WUEjRiO790A2PhxbLe60GvuRMjhksi+bSjdII60+ijSY+c3efLxUbUQtXN/GNpnfTC
         sUIw==
X-Forwarded-Encrypted: i=1; AJvYcCU9tRiemHpPTIlvEYnV118CPOpRgc1nvd2llSplibI97VWvvJ50W4cpkTqhgniMzJ2xK8U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/h6vAFxxZAJS8d8In6YkHn9vHXxyxe5KWMNN7qoLEy0Dh8vw5
	3nL+TEHa1Z6zIPfvMKjU+flr/sOeSQiAbYbIr5o2Od6YXRlVAVN4s54gRYXxh3HrRurtIn08Phe
	HyiFfiXobYmX+onGch7LIgsWuV/NYEzQgkJrGs7K9NMeAXBzxbXAjMTk=
X-Gm-Gg: AY/fxX6o9k+W2ViXXAVpO25ZRJt/oS0WINCm5zEQ/Z10u7Q1QHwaCW3pwGEf8g2WU+Y
	BPgpI/EMElHTv1rOaVvVzPDy+7A58OfuXrBGIrMh8g0FJVoMY1KAFyTUi1YaJdAV+HN1P5j35ua
	OVDyv42SqEKQt1ufofTP6uI3K86+Ni5ffWQ5ocMnCw2LFBOrQD3iI5RUJjiya8RbwOzvS16CiAn
	n+Acy4wEzYebHOe2EZIHvQHkroWW5duG3ciKQIH64HuXyhxbb9SVzmuKlsyLb0MjyDnL3nXvEIT
	EQ9iFwiCQTGapx8lOmCCuK6+h4a6j446fxnNlgYAblj6FqyFQX/0nZ7IJDyQ9VbYLIKz/LCKrEm
	wvAE1RHFf/3g9Ar8Wy313wPuSOUoazQtlgA==
X-Received: by 2002:a05:622a:230b:b0:4ee:2508:3934 with SMTP id d75a77b69052e-4ffa77f608bmr25087901cf.67.1767690928300;
        Tue, 06 Jan 2026 01:15:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFk0HCaFjf2DM3cIi5iNwtwmjyXb0B25YmBVLhnJpxIPS8z3cDYv8bJhscbR5U8qCmjWrXfcw==
X-Received: by 2002:a05:622a:230b:b0:4ee:2508:3934 with SMTP id d75a77b69052e-4ffa77f608bmr25087281cf.67.1767690927866;
        Tue, 06 Jan 2026 01:15:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:11 +0100
Subject: [PATCH v2 01/11] of: Add for_each_compatible_node_scoped() helper
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-1-05eb948d91f2@oss.qualcomm.com>
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
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2449;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9sqpJR/1PYKlbU1KPBe/Ap+/bFXa4ydA6Vbe18Jb0Ns=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGlc0qGhLlz6ZfK39HYRttlvAahKJuYaVofdC011WB4DswxSW
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpXNKhAAoJEME3ZuaGi4PXluYQAIby
 pfeW86Sd8tcvltXVqInweG9xpLLOpmCo8S4FAwxxsF/RgBLOfakmi8GOOTbB25Sv1Hd3Giw04C8
 aZaH0WlBQxfZ3tV4Vv43iZkahc4XGsAIk2NydXukBkYCzB4uj8P0uHnNPlaTPIoZ0BLlg8tTbDE
 Nwrbd0+X56fSgUVZuC3KKQagev0lQsGb986vI97tsPdysbRfzN2IhPXrGZHkzsAev/Pg+4MmtGq
 wlQ5kTyL1eypzR6PMeFZcPb9kVOwfYVdQpkjIioUeo4E8uq775cJa1XiJSdC7FBvqg0Gp5NegkW
 n3kkNLmqPYOU7upF0/aHM4ucku1nOLWVFPKCDmHK1F7GE8N4QKzS6qHCg3KC42LZLjP7xMA+6n4
 U4dLHCsul86wfKmLjTZG3MD+mXFg7efUUufDhexewui4js/WZgdiLQlwhcDQJ2ds4x6Ey0rZK6I
 vjytAmOhmwEGJNzzBvlF3ZQmqfCBdJPdEtRYU0MTaFvUxw3i07gXWZweU5Y+CPdNKLoOlsAgi45
 sKoG+f0XDuNX0Q4W66+jqTO7sJ92ijIChypoSgUfpfwPE1X3qP+C6MZCRqPAUzJ1UV98ZLX1G3y
 qi9pmRK1TY8kp8cpW8Op8c7Ybo822HfkmTzQww/JhHEdJ1+D2wj1k7+1o5cGTzaW8mR8CKsiyI8
 HSf8v
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695cd2b1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=onCjdZOYdOMVgCgPd3IA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 73UzeqlWGdywtODhYk1ijwGKseH0-Qsg
X-Proofpoint-ORIG-GUID: 73UzeqlWGdywtODhYk1ijwGKseH0-Qsg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfXy8qT6ixilc87
 xZ+iyj5AtFPKKaXr5xs12jR+JLVfyKNU3sQsOgHMshrJiZyKmkQ9DHbX43cVyj04MNpjRKU9qmZ
 ypnUxUwyYHrtheFyNYl2Esop/GDILeP3YWt5Bdb7b1D+5HZG7WhQM3k7d3Rz4Q2kNDpEKcwjdIq
 qg8poRRiW/aY9hzUpnMAc19QBBHOeIdaSjNOj/Qg3JlpnzoFyDninso1BK2k4dxagZdX4K/EpS0
 73AslHjTydML9cGT5GKoxS6xTtWCjS8udekDPycMIi0uTMZJTs+hkCMhlkR/5sy4hZ6E6USegYO
 bS0xiyx2R3D9V4JZ5Rkab/FUvNoYp3JQjQXmBYzaP1AIVfpaDVgyaGBBI9eW+0O7UDrupNj3wZk
 91A84oMqD6cU62b0wrd5T6g6sdWwrMBicFISnDzK8HTrPmQi9KRnz1O2JVs/hm3T7gWSmfQGfel
 tky2idFZGN/obh0lcBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077

Just like looping through children and available children, add a scoped
helper for for_each_compatible_node() so error paths can drop
of_node_put() leading to simpler code.

Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Prerequisite for all further patches.
---
 .clang-format                      | 1 +
 include/linux/of.h                 | 7 +++++++
 scripts/dtc/dt-extract-compatibles | 1 +
 3 files changed, 9 insertions(+)

diff --git a/.clang-format b/.clang-format
index c7060124a47a..1cc151e2adcc 100644
--- a/.clang-format
+++ b/.clang-format
@@ -259,6 +259,7 @@ ForEachMacros:
   - 'for_each_collection'
   - 'for_each_comp_order'
   - 'for_each_compatible_node'
+  - 'for_each_compatible_node_scoped'
   - 'for_each_component_dais'
   - 'for_each_component_dais_safe'
   - 'for_each_conduit'
diff --git a/include/linux/of.h b/include/linux/of.h
index 9bbdcf25a2b4..be6ec4916adf 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1485,6 +1485,13 @@ static inline int of_property_read_s32(const struct device_node *np,
 #define for_each_compatible_node(dn, type, compatible) \
 	for (dn = of_find_compatible_node(NULL, type, compatible); dn; \
 	     dn = of_find_compatible_node(dn, type, compatible))
+
+#define for_each_compatible_node_scoped(dn, type, compatible) \
+	for (struct device_node *dn __free(device_node) =		\
+	     of_find_compatible_node(NULL, type, compatible);		\
+	     dn;							\
+	     dn = of_find_compatible_node(dn, type, compatible))
+
 #define for_each_matching_node(dn, matches) \
 	for (dn = of_find_matching_node(NULL, matches); dn; \
 	     dn = of_find_matching_node(dn, matches))
diff --git a/scripts/dtc/dt-extract-compatibles b/scripts/dtc/dt-extract-compatibles
index 6570efabaa64..87999d707390 100755
--- a/scripts/dtc/dt-extract-compatibles
+++ b/scripts/dtc/dt-extract-compatibles
@@ -72,6 +72,7 @@ def parse_compatibles(file, compat_ignore_list):
 		compat_list += parse_of_functions(data, "_is_compatible")
 		compat_list += parse_of_functions(data, "of_find_compatible_node")
 		compat_list += parse_of_functions(data, "for_each_compatible_node")
+		compat_list += parse_of_functions(data, "for_each_compatible_node_scoped")
 		compat_list += parse_of_functions(data, "of_get_compatible_child")
 
 	return compat_list

-- 
2.51.0

