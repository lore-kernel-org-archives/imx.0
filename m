Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6791B2D5922
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 09:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690929; cv=none; b=LVeEQHMWV2acauVCrE2KwTk7jd9M8prvHj/WElzS/lLxjcyHkIcaBSr3gQam3dy8/jjEInubHXMFclkrYwfNGhoF0RqPZX4gfn52L7CFjLZsUeSaUUTlEft2Hw6yGKoJRv4vncqgjVDsI1oMjTCqjufB7mmajuS5f7EwiuwA0zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690929; c=relaxed/simple;
	bh=yRljZXW19bL9W7HE6hwL7lUsKYJt+g5uw13tOylCf70=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n/mQfUOeXr1qwJUyiUtoE898rPP4xJIkK8Quo2qTivEK0sr9b44CF4aYhSWrWNRCmncIeV84L9+0uRYG/i+Yb+cgm95MJnN8wMAgj1pJkVQF2LbmEylStQbPGAm+o2VYq6kBQ3JNue5K5+SOyhymjxQrN0oNgYoaIlaS9IDlWCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U1bI6WlT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ehhSW6hW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1bI6WlT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ehhSW6hW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063wG4R2684059
	for <imx@lists.linux.dev>; Tue, 6 Jan 2026 09:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kSJ/eEbuN5yGHUMen9nJkB
	t0F9uVUPS6BNRUD76mvkI=; b=U1bI6WlTVDkpZM8Qhi/PtbYOEir+Rliawjr70l
	3tCpWrNpmA7Fqyn2fatvQsPJnKU3NTLpSOBFexHe7usoAbJs7zcjvxyNhkGjk4vQ
	T7LwPzSdfhTKaFPtZGyEzNbOBqX6zri7+JowmrKoNseH7B+336enRv8QjwbDEBKz
	k+LWUBRcrHU1mDfPLQxYePM6VkvhBT09T/ae30F1OEjayKc/YSWjN0tvHAUW48EB
	Jf9zlO4uelR3/hOxqd1Wm4/90DrRvmymrN7Xy+JpKX2JOX+T+HOb+H/NxJBvRwx7
	QzBb/y8lnroKKEvDqCjP1bFHxPUFKq2VvAP+LmgI5p1f/e5g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgty5gv06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 06 Jan 2026 09:15:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb3388703dso329944985a.1
        for <imx@lists.linux.dev>; Tue, 06 Jan 2026 01:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690926; x=1768295726; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kSJ/eEbuN5yGHUMen9nJkBt0F9uVUPS6BNRUD76mvkI=;
        b=ehhSW6hWVeoZcf0BZvyJhsLvHH5LO3pRUKZccefjQsPm/n+iSKvj6MSOxslOf3USjX
         uPO4pZWWKFLxHwcQ04VmsqkempEDWIvtuaBhU/GsWoGVX6nkW6Zm6zHRxMPpBalBV8Nb
         jCoNJaddNF3CKIgpNrR6x4dsgou8f7UtvJ+MBjbsBtznqMU7dxIXvE5x/5NNxr8t6iA/
         FjCPjImrmfrel7iXncYDDAIGS21U7Nyw3aKA1DNjRWd2J3lwSM7Vk7uraAPfH4idRKrZ
         nMqUyZNTEk9jDlWQdYjz47MC+lWn77WNbBDxwCrct2DMpN4wvRhNg9/n6lvWPwx5CXJn
         GzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690926; x=1768295726;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSJ/eEbuN5yGHUMen9nJkBt0F9uVUPS6BNRUD76mvkI=;
        b=Pi6gYpiplBzOpQleesNROS307MfuDSVkoPmbl2MxKzJK7uZRr1LD0IvLJ4feRXvBN2
         AdhA3+awUMxdHnXAoEw+o97/0x9tD6ZrDib5pIFOn9rIScnMsMb1ifAWF2E0amzBcoH8
         icIUmqbWAyunb4H42OY5xuqFTpDo6pCo1OBmqzcz9K8l1eVt4auLAruhsv6VkFom9VWy
         XN++HeMw1sJnicIxvJASIl2DW6g08JS9ix5K9lUBtjfPS8mAdxmITxZkH4KmDIaKnItN
         PEn+Phm4qIYNlc6q3ouG7QJTjzZltjz3A0KhN4yYcL2A6SaxWHW1MlxDP5eR/cp/N3UF
         OXTw==
X-Forwarded-Encrypted: i=1; AJvYcCVoLDmt+cO/t3wz/yoinIHYArlG9pl8fFcS/ipZG3vJrDe9PsfaGLUpEOzZShSfm8Qj0+I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEyYkGDYXdr/+qXGFU3EHxi8GbXOcqTAsLaEa3rk8bEyzPoO2t
	p46rm/nn9SAtRG10elHsgK6qd1mQImY4VCaBL4mXOneeUOLFd9TqljYww2wbl6+/2Q4ViRx3sPT
	RknMYOcYOoZm3EclPwyu+scWTLaiE3n2wGJTdpD/dGI7mt8llZSX/Ors=
X-Gm-Gg: AY/fxX7zgK2JtHev73YZKS4lz1v9/expZ7bXcxz4sJnK/3nCFo2e+fXCdkvWJHoYo6J
	iRf4I1WMa72zIQA64VQH0Lo52F2xGGKghTuuAWlWhYysOJDZtN3OtA7E9dMjxtQ5jHQzXNEc9/u
	0IjADFjS3TsQzHpomg8RGhqmkfX1MJGllsLONzNap1k+1Qsptc7Js6BhKBN4GCcCMLjzCrskyqF
	mO2oPuOfrxESSr1XCm4CKUAV3coN+ZsElD/FvVckvZBRpjWPRuiqIkrIzheE81kbIRurMPUDjJj
	/IDpVxNmtqYA1CN2/34HrQzz9JOrpMeT3VUzP1kMSFWblVQbtJRXka4UyMvYAQqBEP+M0YcgMv6
	IBOhOjhHrvQhXEnOagYBXpcMWGerycxCOMw==
X-Received: by 2002:a05:622a:5a94:b0:4ed:5ed:2527 with SMTP id d75a77b69052e-4ffa76d83edmr31813741cf.3.1767690925606;
        Tue, 06 Jan 2026 01:15:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQYNJNT9XBZBlcoB2R09/O9ycRMo0pJbxtqm9oFSewi0KPlk1loubxpFadTbsB+xmiZjYXsw==
X-Received: by 2002:a05:622a:5a94:b0:4ed:5ed:2527 with SMTP id d75a77b69052e-4ffa76d83edmr31813161cf.3.1767690925163;
        Tue, 06 Jan 2026 01:15:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 00/11] of/treewide: Simplify with
 for_each_compatible_node_scoped()
Date: Tue, 06 Jan 2026 10:15:10 +0100
Message-Id: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ7SXGkC/42NTQ6CMBCFr0K6dkhb/oSV9zAsSjvIJECxg0RDu
 LuVE7h5yffy8r1dMAZCFk2yi4AbMfk5gr4kwg5mfiCQiyy01KVUsgDfQ+8DoLEDWD8tZqVuRGD
 rF3Sgr0WXuc4ZXWQiOpaAPb1P/72NPBCvPnzOu0392n/NmwIJOse6tqqqVJnfPHP6fJkxbqc0h
 miP4/gCVMO77tEAAAA=
X-Change-ID: 20260105-of-for-each-compatible-scoped-285b3dbda253
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2503;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yRljZXW19bL9W7HE6hwL7lUsKYJt+g5uw13tOylCf70=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKgWPkL/X9B0kG2wUAH/3eTCaq2qugcMredJ
 KKTScL1obSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSoAAKCRDBN2bmhouD
 1wgND/47Id9EUUTVq2uKIiVZPyo1yp8da485u5W3t4dAchT72VuXV9Y6vKdcBt/nC96bIHsBsrC
 sXK9AmkmkMXhNIEzVw7moTKJHjbihXpyx33M2PaS0Qba02uKGDR/1Z8DS/FsIX+HkXvS4dKFkMr
 M9U9SDZv4zLSbQYtRLWEwWaiphkQyNYMul+NQPQeQb2hahhJS08BCmUTmB0WHo5R2CaAe4VXSsZ
 4/IBx//VTb+nBHW19EZVjY10fCyoJIEs1bbfrdhj8ALft5yhYGyKh91733GlSrOAxYS4VMigtii
 4vwOBDNFUdhWomkQTAucVgvS/jyEYq1ZyDIEkPk73tw7exz3vxxg6MY/Voo/I30IqKvHHKX1my2
 tqpTA7AOCBxVY/w6GDN2yftDSDraeEI3f+5ch55tXZj1gj9PF6V49cXNOPTvzgJFyI142eq++ls
 J1wsXLhBOwMp6iAx6lqV/UcKyJWR3P87F4YaMAKJrkroGFnG/XMc6CKbTMPn1n5DdQbd6frM5po
 //0gqRnPSCROhzjiahO5n1S5KG/nINY2wRqYw+aEyUluPGejKRFfq4q0O6u3MLUpbdTJwKtm4ob
 am//Nbt/BaDCT3Xd9Iv6CF6Yc6Q/MFargCzfOUderUoTTJ9X63w2tyWVn9S7U58fyP7B5ZNfdLN
 /zK2P0SbCUJMIbA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX4LLXcpp18NPw
 4IW9273kPUZl4NX0eB70YFEoqFS/12bEYczRsuUk7W9wv9k+OmbWqtfp3P0HUmnJC67dYujkibo
 pZaahBYJoS4A9kPxv9LzZR7rfxH/NsI3JY/MSObL6SR4r6RKAir3WB+TABXsnWfeDSSvu+FI16K
 9aghswvgxy/AeXeBPdRopvissKRMaIMu7mPTLR3oESyytszkM0l+iltj/O8lW7WlsPaIjKdqlZA
 dev4RgYGtP87TCKi1k5dw+hCNNkO3wv7TAWej39Ssu2MHI/N+eLb/a1OLk47O1sg2Nt5NRmduoY
 tSA3IRiqecnOEW563PTyIrFN9DnAATUVs59L4ABuV9FnfEMn++sgLMbGZ8MZvb++OAVczzmvvqW
 HS383ZNIrCk47lIF2vx8iwK4PF303tojWDGMQ4BGmOmwjiNiIQba64VbG1/xefojceeAbneuDKb
 omEWyDOpyH/+istIL+Q==
X-Authority-Analysis: v=2.4 cv=Rfidyltv c=1 sm=1 tr=0 ts=695cd2ae cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=d9g9ln5aRjr3gUnP3tUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 3EBGeppMx5a9_Y21pZ6qzuD_mo-bge9G
X-Proofpoint-ORIG-GUID: 3EBGeppMx5a9_Y21pZ6qzuD_mo-bge9G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060077

Dependencies/merging
====================
1. First patch is a prerequisite for entire set, so either everything
   goes via same tree, the further patches wait a cycle or stable tag is
   shared from DT tree.

2. The last media patch depends on my earlier cleanup.

Changes in v2:
- Update also scripts/dtc/dt-extract-compatibles (Rob)
- Collect tags
- Link to v1: https://patch.msgid.link/20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com

Description
===========
Simplify for_each_compatible_node() users with a new helper -
for_each_compatible_node_scoped().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      of: Add for_each_compatible_node_scoped() helper
      ARM: at91: Simplify with scoped for each OF child loop
      ARM: exynos: Simplify with scoped for each OF child loop
      powerpc/fsp2: Simplify with scoped for each OF child loop
      powerpc/wii: Simplify with scoped for each OF child loop
      cdx: Simplify with scoped for each OF child loop
      clk: imx: imx27: Simplify with scoped for each OF child loop
      clk: imx: imx31: Simplify with scoped for each OF child loop
      dmaengine: fsl_raid: Simplify with scoped for each OF child loop
      cpufreq: s5pv210: Simplify with scoped for each OF child loop
      media: samsung: exynos4-is: Simplify with scoped for each OF child loop

 .clang-format                                       |  1 +
 arch/arm/mach-at91/pm.c                             |  7 ++-----
 arch/arm/mach-exynos/exynos.c                       |  8 ++------
 arch/powerpc/platforms/44x/fsp2.c                   |  5 +----
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c       |  4 +---
 drivers/cdx/cdx.c                                   |  4 +---
 drivers/clk/imx/clk-imx27.c                         |  7 ++-----
 drivers/clk/imx/clk-imx31.c                         |  7 ++-----
 drivers/cpufreq/s5pv210-cpufreq.c                   | 10 ++++------
 drivers/dma/fsl_raid.c                              |  4 +---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c |  8 +++-----
 include/linux/of.h                                  |  7 +++++++
 scripts/dtc/dt-extract-compatibles                  |  1 +
 13 files changed, 28 insertions(+), 45 deletions(-)
---
base-commit: 4d27ce1b1abefb22e277e715901cc52acdc5af2c
change-id: 20260105-of-for-each-compatible-scoped-285b3dbda253

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

