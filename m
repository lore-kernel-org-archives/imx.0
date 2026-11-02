Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620148;
	b=ddzYmVeapYorMmeOvnU4Rp10BwZxcus7tVOXdVQzQnWTvqYOyI0FjrKATCJC6iPNaFhU
	 Mem1jyGy4JuRRW8y24knWyyesLjhyqcYvcvrqcmaSg3vDqaC2k3qD2LvtJgC63YMUWmnV
	 7Ou1l0siGMc0qouuW6B+cOTiuHtm7Kpb8boxohuYExj7GqCw0Xwa9I9h8tHg3IOXM9o/l
	 JkFyeYUKjqKvZE45mDal7yT5DpLkljU3HdqF1qyxgxBU070WIqHCrKYy6FJ/cAwOHR+8J
	 WcaKMX38tNLUOrAl7fWeWW7tJkpdpUfPmPEJkza4qhmTfdNZjEg4FKzGuYEaWHEjzKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620148;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MIhl96XrVO6h3egsH716wpa0+bzeQt1syKhoX13a6Ew=;
	b=2OYuWYtCURDTy21EwYZsEUkmWQ5QqCA+A+Sy8cOIrJ2FPL7EVTATbrGBICNiarmRH2rn
	 M4/BCDGQeKhNLMwAsyZ6AH2oFmuJYNxh1sZhBQAM3OzGIz4040RGK29I5xRFf2tAE4C2v
	 qkds9SiSH5VYNrRNBHr9NW0swAFkWeofU2kGxOqDCy1unHiBasW34tfh5bZEJ6ebgt82k
	 vTXzCqgYyongOrBNazbySTHDvjDZzf1f4KjPtpYo6QOwf/7kXVhSqbgTNaEzFPlLsvpwZ
	 X4kXy9F1eBA5joo5jDYZJq7j0K5LmWIHStm1BP+wjYFIGc4YN5K/NPIsEzC1SsuZEnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3ow2HUe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=agW0+V1P;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2813606A331
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 11:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2813606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3ow2HUe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=agW0+V1P
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B2sXK076850
	for <imx@lists.linux.dev>; Mon, 2 Nov 2026 11:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MIhl96XrVO6h3egsH716wpa0+bzeQt1syKhoX13a6Ew=; b=N3ow2HUeRab9Viro
	5nysgmFgkDbs5ypqJJilqqtXkzVhOwlmho7t34QDW11POrylfI8KQ7kW66kEsNSw
	wcxCXBdxjlZsLXe3G+T8oLu1+JdMvShcWkJI+rqeMdcjoPftFEIzrAfCH1fLjP75
	0REt7Kb5VcY5O+bt4Rzkt8gyh6Ss9c5Twhkdb18/RCV2yHnBguxrQVv6UW+qiZJm
	1WkDDoyg4J109pjMIiNVE/XYpR1mB+2155izGnGMBEH+oK3umgFPPExrbXsmj3qU
	CSz8FrRG05nrWA8chnJ+I49xNnIK2LhTleI39hYUEF/9wLkDdRke+DiEi6785RnO
	xKFb3A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6r4uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 02 Nov 2026 11:49:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-945b0154705so200827685a.3
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 03:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620146; x=1794224946; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MIhl96XrVO6h3egsH716wpa0+bzeQt1syKhoX13a6Ew=;
        b=agW0+V1PFJE+V6B0GAgxlKxSnbp+vLRg2p5HEKMyUlnQWFzpTIEi1nHgtQi9VGUqXS
         u79nyJf63kP7sYd94z9D4WaNJEYbOMR1HG4IAB+9SZ16YFKI8cJaC+SDAH5zUTIiFGUw
         eEieNaNovGh2d9U0pJxRiRVWFuKqytpEvL1M1mrY08CJW4VhT7FH+TJQ3nSnRnDjG/0N
         PiOLt8MFl1abkRz7Y96aFUNnkG3Ll7eAyGHfhCvRBJQoHBQA61mWdJDwqqLqDvfYvzkq
         2KGIe71Y/YulM88WlZ858L2u0EALdgxQZftKLsj4cuCUFAkeVUhloajDzgxH/HYSOzAU
         BVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620146; x=1794224946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MIhl96XrVO6h3egsH716wpa0+bzeQt1syKhoX13a6Ew=;
        b=UUTC0iyfzDVqS1f6Oa+9wwsa5pqjdpp/wJqvggPv1QrJTIHT6EqhlJIafOOvmWLKgZ
         jF13SwRBj+PeTuk+MQHZp/f99htMT+hgNpBHY1iC4KXwPsfaPjRmUkNEkeTTjEN7oP2L
         uAltf/2pOun5JVi3D6ESluLMHpW2Vj6j+x6dFw6FxB+pEAN4iAPXXnUDpXVqvEcVJK//
         rdVaA5dVA5BQ0v2YG6ijsDp+7cNV+bcKxU5cBVIed031UwWnNMpWMMRmXhwqSD7Xs+rT
         nNLnUk3++Tb4Z8RW390A41fTU7oH0Oo7v44SdwZ2BBMG1LpzLzBLIFayXH0p/sXPSzp8
         WCTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxB539JLykXDLKmsQpXavSq2rYllYL7Ox9Vy8dIGuWJHCsnoXqMwAP5iPfZbCWhiYfpydQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYKQXP2pRxvSmAzLPdqf3Kkd788A/8Jj6fba+5MijTQEwiG5Ou+H
	4dUKZgg+1f9jyEJCESeBH5GOwzV7dKA1F+OZ7BUDbXsEhDzdd4TiGlRLdB3CoOFIJyijHyLZQkj
	1GbVQGQDd1bCxd8UyT2MNinD4EK0WfQd+bHFn0XfudHC9zzrmnj3RmSw=
X-Gm-Gg: AYBFou2wRygwUuXVcyJSK96WkullSFWnPY0s8hUA/B+fVQcgsSx9y5Roy4fralJxhE2
	h8iqaKEgfz+adyZQHtA1acIrebCITOefa2TVZvcSoyUwSFG6HqTxtSrqGIx3WqpCF4XnvmJ9fO2
	6kxBtJVKQF9QCk4OYZyaJXV7ZdWYmpU3ycJPxVBAW7NV8cAcN6AhM+6RPpnm0th9HSQJanufN2b
	3wOokXxtiHXDuLEi1YU8H+rJilQn7BYTGZuoSIJf3L7apZ0Q8O3sZfiaNqAChPmRfdonNjloWkR
	0QbwNmsuPp6O4cOjuDvs5nBWQUj+TVkH6aJIP0Yi4o7oY3Nhk1SQiLoGKR/yjg7NF7diGLhcGcw
	HwGjFS4v6LagV08PNANiZ+D/rouFW6xnwujknSATHD+tbmgdFKM1ns/1sqw==
X-Received: by 2002:a05:620a:2794:b0:93f:61a6:b7a with SMTP id af79cd13be357-944217b8e35mr1507868285a.62.1793620145753;
        Mon, 02 Nov 2026 03:49:05 -0800 (PST)
X-Received: by 2002:a05:620a:2794:b0:93f:61a6:b7a with SMTP id af79cd13be357-944217b8e35mr1507864885a.62.1793620145048;
        Mon, 02 Nov 2026 03:49:05 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm19766031f8f.20.2026.11.02.03.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:49:04 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:48:50 +0200
Subject: [PATCH 2/3] clk: imx: imx8qxp-lpcg: Fix stack overflow with too
 many clock indices
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
Message-Id: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-2-1c3fc3fe727c@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dhlDpkiSrZhRzO/cBPcN3/Bco39G80HHAf8kGP7ODtU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6HipW6PTYPSJAlrKvb7+9EmcAI3l5HEoGI7/I
 2F4ZkNz09eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh4qQAKCRAbX0TJAJUV
 VkNrD/9rDjIkvAY9Zjhn8SYl9PRi56nuL9RalFeecAW+CPPz37wCegFcwBum1JuVTWOtlGmnHoT
 5LGTqDf/fcJEQhLpb0c6MwAxvbQ3VqpeBRGzfkfN3NYAquxuDXmpaNqRYCOQDJn5U/KAINI46Bi
 v+zKjnd+i1IgUPIa3URFlvM0O+AQfoPKwPJjI5k9HMJ4Abu7WphOR0JAOCPp1IpcvdhfVG0JeG+
 zyaWy6yUPaqOgQERPFEkBRzpadAyOllZ5Jz2k5HzfkDMCKLnD8CMK9KEymw1n7jFPYMl47Yfznb
 zL9aLn1gEif5ciH6hJ8H/oS07giqUhGnJ6z1V87got0QndfFdjm3XP/nYI2RX/GS99nbP1Bin3h
 OoFQY8sPu3syIbMjei9MKmDRFpY+kctJ4rQlXoh5IiEGbhhs07X9PzfOTxpe/a+DKi1++yxQCo/
 KoR+QXmPc4kG77mJKvsf25NsMzjKKGjisECaJk07bswkgNGZF4pR10HQd2qczgYbeI2Uf5uBVgl
 HFE+I1wywFJuSZ/pGHo71+kCx7ar8VgLejjGssWuTLWPkFel3DrDeBIi97VAy7mglug8gVdLAw/
 H6q6heBVtbSP4Avb4mrOc7uBGB4J3P/1ejQfyYSRKjXLtaZY8gIRIf8iBIEyQrAGlpJsFVa68H+
 9r2f/OcNO43eJRA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX5KKQvgx84QPM
 uw/3yoBKO8dBZE9AodsXbZeJzg8aSNzZrHMoYkdsMcbsLlQ4V7QIuEhRQDclOvUhAvE5VILZTml
 qfIbVuJLTpRcjdVxSOoJ30Hp3QW3esVUV++DHatIOjM0MXK01mg5ZVhV143czmMXpPlY9D5HrjP
 BjEDdLf0sW2IAnX+VgacgMfRXcv/xLesv8c+bxPi47MI2PNXT75rQf9K7oSRBldzX8wv9vg34ZY
 Rl64fJ6TB3SOczGXb0Dtm7P5KPev6MyvUNhOxZkh6JCZMSGyeiHARcbpCztFn8dduZP8s9r0tgG
 Myl+ygE1a04hcAAV7QadKGS25nyQt4e92a9BEY/F3X3rato1AyU8BNaSJXQgxTJS2mkgKK1heNL
 GVwb5THRLFDY82nmv/R/9sVJ+4qsZj4OBHtiTDkODBNsS8DsQoUfUmUboh5iOQ5qWz8jrO3xslk
 QoUmf3An2gQ+9H+1WNA==
X-Proofpoint-GUID: kuLz0L1Vu5c7MQRCIKT6ogMPM8W-Hgve
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX75MGK34kwg0+
 jb/Gk6+bPy8qnhmIwn3NZ39nfzDaczDWdy5SgD4OgAeQCoHhmy5xuZX2rzNnJsag4MzbX5p9jte
 gNTecO9UOSrvNyNF+LGgqoQ3xnG9AZE=
X-Proofpoint-ORIG-GUID: kuLz0L1Vu5c7MQRCIKT6ogMPM8W-Hgve
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae878b2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ci3yrrcZy3FTaSNcm8YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046

imx_lpcg_parse_clks_from_dt() reads the clock-indices, the parent names
and the clock-output-names into on-stack arrays of IMX_LPCG_MAX_CLKS
entries, but sizes the reads by the number of clock-indices entries,
which it never checks. A clock-indices property with more than
IMX_LPCG_MAX_CLKS entries thus makes all three reads write past the end
of their arrays.

An LPCG has at most IMX_LPCG_MAX_CLKS clock outputs, so reject a larger
count.

Fixes: d5f1e6a2bb61 ("clk: imx: imx8qxp-lpcg: add parsing clocks from device tree")
Cc: stable@vger.kernel.org
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index e57e7bc074a9..ae8cb5408246 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -200,6 +200,11 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
+	if (count > IMX_LPCG_MAX_CLKS) {
+		dev_err(&pdev->dev, "too many clocks: %d\n", count);
+		return -EINVAL;
+	}
+
 	/*
 	 * A trick here is that we set the num of clks to the MAX instead
 	 * of the count from clock-indices because one LPCG supports up to

-- 
2.54.0

