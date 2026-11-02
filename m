Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620146;
	b=jV64bJmRIH1YP3I4aZNOn6ojhDEgPvk5siUl7TEPN7IhBVvnkXmYgo5GtgqN9UKwKP1/
	 3V7HZlDcCgjfIyYSbFEqvN9+Sb3AU8TuKuOY6vKNYpLS5Yycd84T6EBf2yKoVJdv798tz
	 pmpay1kc+ptckINI4fGlI3yfdzm0RtY04IxJ4/F13Efq3D+jptiLtTuITdBW1HCm8w7Mt
	 NyDXixWG6tXiHxW7ZsaNojhI/YsTcJjntfuvmhoIsdaA8jbu9jIEDhrdUQ4MLthnGj+55
	 mfiYu34q9n38dNa9wuTMfWzDZrd9M5Em0WzIx/D3Kq8VXXQJH13TvjvQRSo+wMFBcnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620146;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Oh19af8VgHztOuXDPlz5lWKaaYDLQ4xFxBnWETVNsOQ=;
	b=13dFV7enSbz5Gx3xaIE4GXZufO1LGnWY0a8r8/cXYyLRi2t0oyyVOdJFiFEACZXfrAFq
	 Z7LkHq0EoVy/Np6zCGCtm6CSEviZGejpcsFuMDwLpUV4JeZX31y7A6ATVcM16T6lFcwS9
	 V3WP4sZ0DY3qlHpSUwAr0n6rVdbC/1hjshqq3/m6mUbHUWBT4EABISkqBwIJEY1hP6K5Q
	 DoAfuiBjhYkBKh5IeiylMdcCkexDP/7n25BAKT6JCa61jLFxCUE9Qz/4iJZD0rS7lHBez
	 sEfQAaufMOinjsngrt2Vt4KFi6YKh0auBtOsuvHrQGbN1nuoSZ/NvX1/v1VY83LvxHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UIATvmLO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JEqyuFyg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE02606A334
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 11:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE02606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UIATvmLO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JEqyuFyg
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AGIB2880725
	for <imx@lists.linux.dev>; Mon, 2 Nov 2026 11:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oh19af8VgHztOuXDPlz5lWKaaYDLQ4xFxBnWETVNsOQ=; b=UIATvmLOWQpaXQVN
	oGiCbTvXKK5nFoQAnD/bxxWjxPEGIR7w875WteIQuZvgNtw/JOlZYYncbPsW2Cwb
	lGZHvoRzoK3qpEQ4Mv1OwSlZ1XnVQmWrPR73PIKJj+obSGw8TOGFcVT6JITmth4y
	4CWEy1X4f43m6WzQiJl5SIq9nd6C3Wvol1vpwMMDrj/YR4hv62wC1vegav/DTmn/
	m2LmkEO7EkS/W2LSS0G7n6wlHmoB9kr4f8u1skbtrLHszBfSpKXrTWfsz9dEtDPA
	T7XqraNVmTpc0hmPpoZnOJXztQLNXONYiUBA4Mw0yVm9oz/Uy81MXI/TdFi5cI6h
	BN65Cg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgnc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 02 Nov 2026 11:49:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb71b1443so606128385a.2
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 03:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620144; x=1794224944; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oh19af8VgHztOuXDPlz5lWKaaYDLQ4xFxBnWETVNsOQ=;
        b=JEqyuFygABLdxcILAL/XsCR0ngRKGJc/1oTmLC6+8Ok3cTLkcoN4l0xx1Zx4RsbX/J
         pq8fv7ztZijbr6TYSFtHvI0IVFZP5/s17zjzqF+rdmxbyc7UYDD9tWANe+5aSj/NKk4S
         78OgfRePcVpP+w514nvLFWCDMjL65iGaw6swxob251Q7TK1bcv7Mw8X7cYULxrE4zsjp
         4hI14kGV03CLC8UNVACbtAJ8izXQILgFK4q+esZ8vJvqIoWngf0AvJUkPPTBctAXRKHL
         7vjKHXtLptLOV1y4/VIX7D/rdAbdDQV3kg4udmiqxytqwvECdzH4ooikqh6wb5MLOtKj
         MVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620144; x=1794224944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oh19af8VgHztOuXDPlz5lWKaaYDLQ4xFxBnWETVNsOQ=;
        b=kMmYhXAO8PJp/oyE95P8Y/dl7r7LbEg+n2rqSbyV8nDXZL5iorAX2neGXKbfgQxKVN
         JvQKyO0TiCyrbdr966fasYLyr68tcoL/kS50F0HWSzXl3l1yknnveZWXeMc+rPjtQg2z
         mJbxYEu0pDBZwg5XIZYSW5PlmiDMA/qio4LNPKmgX/0n/PVIIPpKeglGERLy2mVGxzTp
         KGdPsYDscoccAj2mmZwDdj47xk+VVSglT9CFYz+6ufYDjw6aiEev5bmbRMps+2ZJ5WUL
         6r/f+Bsdw27RHeCObkuRf5rdVA+245thwyis+GEf0mz/cYmrqRZVqZ4YIKK+jm1Dk9/S
         i7NQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsI/4G4Bj5f8ChifP0Jl+BV4Ff1eHsSgQS2dZkClS7KvA2LbtPsbGLU5WS8N+BfIOFo3I=@lists.linux.dev
X-Gm-Message-State: AFq9FYLjAEzq/4t/D3LNiMyuF4gPiGhpM8jox0fW+Siv3LUDH+YFrq7R
	MUuzFr5PTlEujHx3zuVrJgMjLm8q8GY8wjIYFPXr/yVDVCu95tlL2fvspGOsEnotfDjlQWBIq5P
	vzWQgXU7Pnyp7OV2NC8HSpHyrfNbeTBB4cTzK5TuXTSb20WWIcpPa7n3sNhhvjsbSLQ==
X-Gm-Gg: AYBFou3P6+DNfHNVf/0TDMERr8FUaQ4QON6G2ZBpgqVzMQnstveZ5GS5HM3Z1St0odi
	mMf/3yXGPWvLivPVoxVeGUqsEps1qHhKaXkZTa7Quv+HTdI3PqTMuDbTA4PQncm5xWSTjwBelTx
	SoYpsDwHCHcglaUvXHZ94mFXQWoa5OuR0FKuasUwvrtsqq0h9Js2bStv7bdKPcTmJZGx0GGc1xO
	ymcgHk6ND/fHMjxtJmfOEgTfv0bxzeaA+VcOOhvV1XOpl/dwu4uipXw3V2WxutbHjIKoq/VUBwj
	Wvm+db6iwTrrEJpe8UE3WbhAq//StqBzd4bgu/7VpepYbDOBnttwcZMMfXODNpyNqOyq6MdgHjJ
	CAAh2WkW/G7el+6W5SoyGLQXbDzpl1dxaSfRTtqjUYQO4otjimz7nE51vBg==
X-Received: by 2002:a05:620a:4448:b0:93c:8544:6adb with SMTP id af79cd13be357-944217452fbmr1624821885a.22.1793620144063;
        Mon, 02 Nov 2026 03:49:04 -0800 (PST)
X-Received: by 2002:a05:620a:4448:b0:93c:8544:6adb with SMTP id af79cd13be357-944217452fbmr1624815485a.22.1793620143115;
        Mon, 02 Nov 2026 03:49:03 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm19766031f8f.20.2026.11.02.03.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:49:02 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:48:49 +0200
Subject: [PATCH 1/3] clk: imx: imx8qxp-lpcg: Reject duplicate clock indices
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-1-1c3fc3fe727c@oss.qualcomm.com>
References: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
In-Reply-To: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, stable@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1829;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RZEyaaRYv13ION5f4rFj0UmX8ETzVTuM6plCBDtwyOc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6HioIWI3xswy035/XchzkLlv/zm+EO8le5/XT
 q7Qq8mSYTWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh4qAAKCRAbX0TJAJUV
 VsgOD/928SW+qLHLOl65n0GZb9QrujQ7Zureyizl9t0OefVjcjP21mykAsMGIeEoSniHqjhS3dh
 9o8386WaJvvhd5U4wyUjSbUPpzcavUDc6slJx1/60PP/YryK/qVjGlcFleMuT6imAr+3sb6Rphw
 3SnbFJGW21xR3VXYtqQZ2BvRYfWLuMdJM2czD/JayDvIdZgAd8oW0oA5+6OL0Q+FLmUSWP/ZNq2
 yiiDwCdGdw5ci7oMkyYGevi4TMJMdnyI6nEFlHH5dV92XqMAdqO7KbiVhEMcbsBnDpOLJqk00KU
 xAkz8nXjgFIxauRSkC1X58XKqbRpl9MUp0BNLVqlL3PVU6yl/ehyQ7ptdPuBMHhWpbpfs1k5thP
 mO+dUTSE72BWuFEr0HW2/4lgDOEcVH+WU6+8g3YtLoqr4jsW88SBIXOxhZcIMdk6RBTsTYD81VL
 MyHijeMbiIZ64URrco3dciJk4VgOdzdgQLAZvvK+y2AHKxCeY/r97P4xdYMOXfvFj/up7SzEdLC
 YhtYHzUZIDSSezYOuK/ona9sODz/Fpj0+sX7TyfX4JbX0vFQ3e6hA2Mw+irtKf3H8g7zcToyhYw
 FR1YL9p3sHJDCAVx1oUFGzn8LceOnKcKpwD0hEKSB2eHAnBC9zAGHD2PqzQjCS+DxsWx21KMGmn
 aw7oXRdJ0mjQR3w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae878b1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eKaI5DNhNXE6fe47w8EA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: Xk55VPHhxFF5mlLHHSkhsQU0MmghVYzA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfXz6/CJTF1VHTY
 0/yScwIzNFNVXcf/fhOU8i7CuG9BmWfcvaEniITr6Os1H4p+o0jznIK118pC46hqJ5m7BxtbKPx
 5p+EyjY6DmNzO/I3VsrSgddqYy0+XzA=
X-Proofpoint-ORIG-GUID: Xk55VPHhxFF5mlLHHSkhsQU0MmghVYzA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX2ftnxeOA4rzu
 BKADGYJm9eD9dhLUuErr3DmWawYoZByYgnVtwZqg4L16dQamuQF+ZZbhff3gqZ7g3EnsvFPYaV6
 006yjjvyAhkn5/AkP0GVoSqPlxou9xQYnjEPHfboki1mcwIZP6cjCYHlXhq2GgR5MihWbMBEJ/I
 pWBvSUHvSbmncKprTl3GqIwmZa9e8eqDGF33FIgt8ht2ypaAvxAWMKmAbPFRL6+Vz9UX25KFmJV
 CcK8+dPRqoeYr8gyXNKNFnfgEBgSXTzO5400w1Mj76qJgkc82r7dLCG360m4c5lXVXHmpjL8fCi
 8Dh7WnBC4LDDa2xnFFM6MOqx3XM2qthcEOfuL84h7d+6GZg8onuo5ogZQaurH7zVbX6mm8fdL1d
 wkhCKCkoC4/X1hNXrVKTgLKQd2Hrkz8pGPgaSONHgo/HZOO9iyY29psSiD2DFZFUoBQdemg//UH
 +T7Ck6Ex5hcQG9KGZ9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020046

imx_lpcg_parse_clks_from_dt() stores each clock it registers in
clk_hws[bit_offset / 4], as every clock output of an LPCG owns a 4-bit
field. Nothing checks that the clock-indices property names each field
only once, though. If two entries fall into the same field, the second
registration overwrites the first one in clk_hws[], leaking it, and if
a later step fails, the error path computes the same index for both
entries and unregisters the second clock twice.

Reject a bit offset whose field already has a clock registered.

Fixes: d5f1e6a2bb61 ("clk: imx: imx8qxp-lpcg: add parsing clocks from device tree")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-07b8d98e-feb9-4c88-afb6-3b5e0b05dc00
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index f0cf6cf91899..e57e7bc074a9 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -251,6 +251,19 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 			goto unreg;
 		}
 
+		/*
+		 * Each clock output owns a 4-bit field, so two bit offsets in
+		 * the same field would describe the same clock. Registering it
+		 * twice would leak the first registration, and the error path
+		 * would then unregister the second one twice.
+		 */
+		if (clk_hws[idx]) {
+			dev_warn(&pdev->dev, "duplicate bit offset of clock %d\n",
+				 i);
+			ret = -EINVAL;
+			goto unreg;
+		}
+
 		clk_hws[idx] = imx_clk_lpcg_scu_dev(&pdev->dev, output_names[i],
 						    parent_names[i], 0, base,
 						    bit_offset[i], false);

-- 
2.54.0

