Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620149;
	b=FfEs5knCa/mLWFto7i3XHqWv3cpSkkZmvbCZeubpWYtnlnkAg03wvLPMIcGWnE7eKNnk
	 p1Ur05l7CKQmtehQLkv7TRfysuDVznPdvRgoQvZjCh7t2jkvwYC94x/FWSK7tQng+nBPA
	 gvKsWQ7fZnN+hIFwt9jwNIsVEEkFi+gSFS+gtOqRiqak8F2SeItj0ACFuj7YljSvqEq7A
	 FXTOASP0GCDt6qleks1XoyRBK6HomDW+/ibOQjCoM4Wb1vRNqNauyYjptRuxu3fmVLCwN
	 H7jHcaQ0iZOznOgqy+cRyG9xf8jlrM1SktISMfc3acmjjM891IQBXHnG/gi7hHHut0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620149;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8EHMNmwkCKuUSV7NYbcIdifNC4vHEjyRqQu8cw0rKno=;
	b=WdnzueJel40gyKHCL/X8WmdWR+kKFIm0QcBOArnXvmLJaL2Cu7FZlhvkc/22Z1A/fptJ
	 aiD8GSaSFoFoFOXwkWJn3Ov3Nn6Fpy7/L+QRNFbhVtfjX8UVZUHeNjmw0WbmnDJkDg5is
	 Fm5lwFWW8vEOXntx48gpSEhSIHA7HEJG4G2qb73n69CGsKxS5MCXyC4PD76zqzCkejRoQ
	 GQG7tNG+2lJwCu1dw+7Jyq24W8zglhd/1hJtfAd4dbWwNRc2K4S2y+LbQ/qgHOj/VXoCW
	 JZaQh7dFWVaMiIlnh2cEIYrZX8Sdd405AMyeoXYVvGs+LdrMzHufNkExQsb6AAuj6kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M+LxwsAK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fD29GVV5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C9D60A2605
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 11:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C9D60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M+LxwsAK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fD29GVV5
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AGIC2880725
	for <imx@lists.linux.dev>; Mon, 2 Nov 2026 11:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8EHMNmwkCKuUSV7NYbcIdifNC4vHEjyRqQu8cw0rKno=; b=M+LxwsAKftmbCDgt
	MMYasS/rNqZr4DJEH/TR6oFS86p0asQzK3QUECCQyn5da8o1q0bNg7uvsWTSlBsd
	7jxX0VAjNSveNXJEPxbYM2v8CSxptrmLGwY+doGxR8Sa2A01N8xNyaTNtjGwO9AM
	kFGM12CRGAAbLZRYPgYMrKV2sRKvPj4FnUoizGBKjR5t6eMIEdj6OiGrgIMeBXJd
	1hB0umMpcd4j6yYt1sz0Jz5C8kUwnpvAMY6OBRRsUjJ8fFAZjIKyjKIvy7nq8xcP
	jNPMz0SJwZo0R127gYQrm1+pmMOQGwXMRPX7O8XSAMBEaIUXvN2Z8RR0xE4WkJA5
	cHlXdA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgnc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 02 Nov 2026 11:49:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e49a1d3b1so713290985a.2
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 03:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620147; x=1794224947; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8EHMNmwkCKuUSV7NYbcIdifNC4vHEjyRqQu8cw0rKno=;
        b=fD29GVV5We3xTPiQ9Gx74Ea0jqJntB7TDC86YgDjgSyCkbMyF3ufHX+I3FvODKxLkV
         K4qhx/RqkjXlkdHX8HUuPFI6BJB+w/wfJPfVbiQWYLWHDlVUPtNHAIDuKLd7XhtKfyMU
         jpm56SXtRnIYU5puR66rCkMeQjJ4JcfxF3Anc2GEBtKi4QyxR9ByQYcmQl0LlKinpoSR
         nh13gCUWF5Ycuwm9sPGG2Ar0xfIr9kjNQu4MFL1nUKe/sW8J5FtsslUR8lbDMLBu3vy5
         Dg14z3TWu1YSecECRgumgIcKGPoL1QEXfjVXcfE6VR7WUZ2S88XBn0XFjNBR+bU1UVLu
         tTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620147; x=1794224947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8EHMNmwkCKuUSV7NYbcIdifNC4vHEjyRqQu8cw0rKno=;
        b=ga8rTOFUTDzzw7Cik7KrBUJxWjoCxwzzYcziXTO2vI9EBImc5PHZuftvlO/7HBZTls
         C2mXNIDlX1ZkE3WVr/qUmmWxBW8npO8LMwX7S14mLmQd/y/FFTXK/Sdd7hUj7eSfQ00r
         3cv4NBqMUNwwcxcW76wugjCyV/5tktBfOgS2SDvzqxbgInupz3Dcux7GYkwDm8r7FeIN
         UqDI040y24095vuBJRA1I1aLsrB5gnUF2DJi7ys77tu42mZz+8uKdMSkgNahAyoiyTXW
         jstRWXyCoR8ckhaov3HNSv8A4wLW6fFLhRkn2FppTOZwixaemYk1YNBdIi4uktC5QBQz
         nK7A==
X-Forwarded-Encrypted: i=1; AKwUvByP1Xk3uR0kvEx20VeqSvTZjb5Os/V1S43to5CMAOVfxjSxmpkjZE0Vd3TgwVSBNkC4zBw=@lists.linux.dev
X-Gm-Message-State: AFq9FYI6IMMSIyXwghGaAHgtYgeOCiemzxs4XKF36iBAmyKIYS73usYK
	1OlIep1dFhYjYHtJxONYKm8d99gkUkLX6LLjb16RYk+fY3Rmm4ANtExK8tCvu2W+2Nez5MUntJ6
	nxJxowajG4xJcXu30YGgsF3aEwP9en/dbpPuXfRhTMQ7Wr4pBUh6Dux4=
X-Gm-Gg: AYBFou32/FK8yfDCaOFuaNylYSxkOKpK1Vk4FW4wyUsu9enqQGdimtT2oUQ9fARa+dF
	xiPfE1DfvH5qeKQy6iUywCOeLMeeLcOwO1oGeS2kvvT6uzv0S7KmJZJp6s9M81gnQQxSSLjfCqd
	cBedgxGt6CX75Osrhpltl0tUOL9i1CpuVUCwN50MfobH2ouN85wptrY7n/N63mQnvkOIkci0itX
	Yd1HHs0gDzVwSJ/AxKyCKs4og66Rz+IiMXK0+zXf5FvVJuipoeo1ktCfRDSNZSsbUMAQsWZr+eq
	dXGxVvk1K8pTOogclH9Pqonf/GzIaM7GLUTzh2zcoIMR4t3ezzL0YIJFbLcDmK2IH7JzCIntROT
	Iew60p8QHllaErOUUxtg7yntEqddyAxgMs1kTFg97/ZA2unA8IUmuV2AvyQ==
X-Received: by 2002:a05:620a:4385:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-944217c1057mr1505387785a.62.1793620147403;
        Mon, 02 Nov 2026 03:49:07 -0800 (PST)
X-Received: by 2002:a05:620a:4385:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-944217c1057mr1505383685a.62.1793620146775;
        Mon, 02 Nov 2026 03:49:06 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm19766031f8f.20.2026.11.02.03.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:49:06 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:48:51 +0200
Subject: [PATCH 3/3] clk: imx: imx8qxp-lpcg: Return an error if the parent
 names cannot be read
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
Message-Id: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-3-1c3fc3fe727c@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=2uPBsKkTO9u8MCGSda/38zqhRD7AFxl26y3ujADk3+8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6HiqqN4XJosCAMvkcauXt+bMtOzQ17SPXFOX0
 6cQ/pXmdCGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh4qgAKCRAbX0TJAJUV
 VsHLEACmDvcbVJdkVpIlT+OZGgqy2hYn09SA3vioW2L1kBakvGxPfl9NjLAnwChWcC9Bv33IIkh
 95VCogjvOrGTj1FdqY+5TAD7LGjqWC9Igznipko3jsFBzF2kijDRe48YiabcbKptsuYY9ZNmwQz
 aWTHHhNVwUqBRiTw50TAS+4Ub5QoLOC+oYQjFJTMILKnxn5rxBPFAO7nOjWtmBa1IYDTbR4r/Gl
 iXNeHn7xMSDIEZriXFQ4xh2XqG/pIveaOHcVJFJotHelNEk9H5G02wmxSb9ITz9YeFipBJ5DzJG
 fc+KTkU/iDdiNu9evpAbFbi1mJo1KVFs4CiXUAzUNAfqQkTbJsqqZfctHL7QIKVnQGZu4uibWL9
 FyE9PqsYgsyUsdNUDMswrfxqMGD0AlF/GfGcjL2cduQ/gfFaa9Pdx3mqnK9Dbbwp6+MFyf8Udyt
 ATJ8jEphUlHJ8s469efSVk2I8mdjNs6+M18BoWAwyrhYULSvDUJnSmi+Fd3kt0gIeGTVc9s680R
 XDmgpw4k0EBvp8ofJ2xXnb+CfiEilzUBY5r6F/O2hSmiUnjVDFBS4GhEcQR+6hoY+IARJdw/2iF
 SoHZH1Ssld8sjQi7vY+0HskfhWLt/O+loZbPpOdQYlpjXjDpMzzX/NjAG6jQ1wke/2EknoASr8s
 UpdTSlJt4iskH8A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae878b4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=hWtwQ3EaNFkubv4X:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2Br6plB5rF9h3W9bKjcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: fxG9g5D1nauO68ozb14QPkbUuDaBQwm3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX8fVSs4kTnSN3
 jjizbWQfyzXJfoFjskbe/YzoeeEqjOz8pK2+/0QwV0HHEW5xLOqLw68lXX4cp5LnESX0vzI3ma7
 3E49EB95nZ4OMcmO9KDfYjp8C1TWMEM=
X-Proofpoint-ORIG-GUID: fxG9g5D1nauO68ozb14QPkbUuDaBQwm3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX86PmmcLe/fPR
 I/VYPH40C8GInPzzG4F9qwXToOtC4r/4zfR4mG2miyq+WV8EBK1Xvp8QFV8BFbUX+a3w9TL4ovz
 7zAYw4qFN9wCbMdmxxEMWYdUipaFKEkwaXDYMB5E0PsSEYMGIq1JRELFFYDzU97qto73xhRRMJU
 9e/SC3vp7W3UgZvMecOuXIQj++TnuQ00uC3xrSZnbkfqX8qpc/Ioz9ZT5oruh0UhCgwtGWoh834
 wDDDi/lk6FCsxRFKfVzmjud1Ha7kzFfN7Aqf4/Akfwnl1Il4mQvtUWP58RU8yFOdsGFRW9mhjST
 9D4EHz+6YG39RM9v6xdRYoXxC1ifIiDfLHxNs7bwZHkVjhCXgS6gFaA+qIx8JrlLvy0jwQnnYfm
 dswF7CenxjgXrarKAoWQwp0WSKD1RmpfcfEehMZelGaR5a8VlNz2ioBrJ/yJ/J4RPsv95fDonxB
 ra1mVGh01dWHff2O9JA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020046

When of_clk_parent_fill() does not fill in a parent name for every
clock, imx_lpcg_parse_clks_from_dt() returns the number of clocks
instead of an error code. The probe then falls back to the legacy
binding as it does on any error, but a positive value is not what the
function is meant to return on failure.

Return -EINVAL instead, like the other parsing errors do.

Fixes: d5f1e6a2bb61 ("clk: imx: imx8qxp-lpcg: add parsing clocks from device tree")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index ae8cb5408246..4070e06f9c7d 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -231,7 +231,7 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 	ret = of_clk_parent_fill(np, parent_names, count);
 	if (ret != count) {
 		dev_err(&pdev->dev, "failed to get clock parent names\n");
-		return count;
+		return -EINVAL;
 	}
 
 	ret = of_property_read_string_array(np, "clock-output-names",

-- 
2.54.0

