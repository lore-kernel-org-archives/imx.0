Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D772530F552
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819254; cv=none; b=WJdtqEOkmvki3B9zWCEz9zv0M5E72/W/LTu8DTTBNtdXm1vLAUXX8sBMf4rK0mpcrwgC2PIINOzf9L1oJfKeewZa8vsRg/MzpaY6aMYp942R8vZjeOBNimBUk4X/1JIZESLzcaFYgLgQcsK2y4kUfhoLhP+iIQG+h10OEp9Ikzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819254; c=relaxed/simple;
	bh=N8VSQLtaVd4SNUXyj3qVXPL+a8sCEU/CZusptF8ZaPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jZfs+7C7p33d615jlpyvv6nHkxXVSTqvpir3QXW9dBFWobRCFqKdMelCslBUvno/DZUjAQpDWhyfw32RB22R8cLPeSdGawuOKtM01FjGYVujHT60MZZWF5jB4K++z6Jk1UvRbD4h3jED7takROaFF9hQqGk2yyAfis3HgZfbG84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OBEHAtrA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIbiKYXt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OBEHAtrA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIbiKYXt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91CuH1150053
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wnn973uC9+XdGiAchuDDhiZMFdYIiAWMeeEw03lA6J0=; b=OBEHAtrAlu8HDwbs
	RkoTd5c3ZdYVwQQf28rXKoUCGjoutZoyT5rSP5WNXNaIxk115uqtEcji2V9fT7D4
	rBbcQ121Fkpg44TcweaCVCJzPC6t1e/MFAe31hRY8tWAhM8qj/bpY6KRaVw+x2za
	GgJnbqbGSqfJOcOv5WWzSFVonvqlSBqu/nFUb3T/H68rhbsmYdhVlH2hiWhw4hzC
	h09m2f5LmaXuKfjIgCh6xicgSlxg6MbzJ9ZRpgXiX4KpJqBOvuigtUJpqKwm92kG
	UEeWM2N6oNGeQ7nX1dcmowJqXxAQF27TbAwZBdSdqSANxpuxhN8IYqhmcHV2m1fQ
	MiCLvA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br04e545n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:40:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50146d98660so121220921cf.2
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 02:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819243; x=1769424043; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wnn973uC9+XdGiAchuDDhiZMFdYIiAWMeeEw03lA6J0=;
        b=NIbiKYXtYaANqfdKzunK0E+ePBnwNTwGCYXCqgJS+CFwS0dFFjcVi2u/2wnaKvzOAn
         rvXKTCsdVs+s5YhuM2ylX3+66uyLJJjh8b58Cr3aaBS3OfNZa7yI6N5WmBAxxd88TNxA
         XkbPf+6oIDC1pzY8fKgPjQueQzzidStsAL8np11PTKlqsYjoqhaxx9YbS09CX0Lv01aP
         asxCXG53MN/PPA364GoC0V3dSuZWKWw2AzPRVbi/EgBCAEn84KFbFsucd96n2BGNNqO5
         2CMjojcm5ehNhbM/f/TD4nzuUK5tAxkmdC3XAW+tvG2e9Fu4pzJJYc/6S8+kQAQX2FZj
         R4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819243; x=1769424043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wnn973uC9+XdGiAchuDDhiZMFdYIiAWMeeEw03lA6J0=;
        b=fpg4JfgTVAEmIAw2AuszuPSnvN8WDppmqvJI4kBMri06OcY9RngDiwQ4E2qE3L+TvM
         IB6lLVrdvRKgJbKLhY2GEUoHWp214+VjXlen7VP0GSN0JMt8A6hGqYjw2ODe/FIH6jS+
         B5UieOM7UmBbGrjqiJpGMMdVtjxLY0CJfI/XdlRMA0bJAilqoZC7EbM/YDAtZ/gaFxLx
         QogrmZfiRFw4z2lcdxbsl83/dlAkuJEtdAFc180ARR+hmamX72pwtyZfsLO8SKJ0gRS6
         hQtdzyMqDls2d8mBqi6rzASd0x1VpzJbhF5DFUqbytgL+xiIQAq78AcseZshnnY5iZYj
         N+0A==
X-Forwarded-Encrypted: i=1; AJvYcCUoUlUB99QAO/g6JgQsYv1hBG7XvUbZW/+G3hU0zxqB2PLJRw9Z2uVeuyIddn5dzhNUihI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXogcAYKc2Kh/bVEHLxzTZw2q/YA1K4STmQ0UAnyrD69ozabhc
	ukYGyja2UOWjyMAUd2TSvK/BXeZK5LFUjEqKIOUut+9GQiv8sR1zwnoX+zuW+sYti7u7sif8N6r
	OjSKU0XXR/3+qkGO9STtevVztK+3U3qqMXFry+zSiNUF2nZlJycPwM8RS4t8dA0k=
X-Gm-Gg: AY/fxX7xhv58wmulNyWUhQje45hvj7isCdbFv75MGAbBVF1ClrqJjrc6RAioclPovcX
	Fvd1rl8uHoYcjWrw8GxPjNEFPgNzFe6IIWu4dZZKnSqT0SS7ooehw4HJbG5k0VSWoccSepKDxV+
	jAkuSE4QKB7JNzx4fD2lrJayOLjHfHU4urIuTojeRgkc0rDKoeoS6PcQ0ToziwBB0XS//w/LIi3
	kBWPEEbCAlSn4bIwlqVB1s4Wg00iei9A99Jbw/OQef4ZGBbCBlBeTCwkzDruZQe0StlfG4101ub
	sLWFjPqbcZau5XQKbTlvaYCw1lRZuHmt0GH2LTXuytOKCASdstnE7nrll+twlprDLR9yPg/84MO
	+4nc5xQjJAPczilt5fCRSLeZdtVHeU2Zi9r/Eq/7k
X-Received: by 2002:a05:620a:294b:b0:8b9:fa6f:7e8d with SMTP id af79cd13be357-8c6a6959020mr1427582185a.84.1768819242820;
        Mon, 19 Jan 2026 02:40:42 -0800 (PST)
X-Received: by 2002:a05:620a:294b:b0:8b9:fa6f:7e8d with SMTP id af79cd13be357-8c6a6959020mr1427579785a.84.1768819242411;
        Mon, 19 Jan 2026 02:40:42 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:18 +0100
Subject: [PATCH 7/8] soc: renesas: don't access of_root directly
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-7-32a0fa9a78b4@oss.qualcomm.com>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=N8VSQLtaVd4SNUXyj3qVXPL+a8sCEU/CZusptF8ZaPw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgobvncIAUeq9gHK6FXvIHO2lk7wpWwVIIRh/
 iA36+9fERmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KGwAKCRAFnS7L/zaE
 w1hQD/9acgWHH3rnfakx6eDD26dTI6G9En6q2VSGmlbnwsl9tJ4nMDO2VLCusT5nxXCXG2YZ0+e
 2t7D68GFRWmhge+8Yo4En2R4ksA3WOpsvKOp8tGMji/3KiTjejFLsyF8yQaK21jsa2opCwRuwpy
 OrGdc+tFSsiIs2dFImSIcB3jwA2vGfOxY5RPVMDYtZJKmo3AU+FDDAQEEytNfoRhJ6gKDbMmWLy
 QMx2FZ4YK5TYSINwoxtiVMJScQQ5iqIYPWOo5QHZquIEdmXfClYw4BX7pB8uHTnpAT16yN3GPNY
 ryBK2rrRF9eTdtkmf+M4tRv4OoOL5EmJavIowcGDyHqHwE5FlCADIpYUSeaSwTnuxfW6X1LZr0+
 kDhGDEn5H+UaCrjAqMdrFE1RZ6scfc7WAwBw6LEbaA9Hg8EAkBqrvmJD6304Y78t4bYiF4WLTHM
 33vbth+dCB4S9vw/vX+/qelRibAzmjKOoAzJe4wuTUlmJ/Hq5opVf3rk/gtneFlw/l4bj2QkGax
 u0vlJhYKqneqCMl6QCd90ysN/QI4xNDatW5h3YoMEj+TU/eMdp2a1RJ4cTzEKUSvIkQtXNLFR6S
 gUtj6o/etpKnVJYXyD0IGul+1SDf9TfejO5yWonCratG4+iSt5OrlbTWx0DJ9IlvpgdzWNRuP5+
 tS0OA2oyaV47JIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=J5OnLQnS c=1 sm=1 tr=0 ts=696e0a2b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hcp4X6t0sg7LPBOUZMsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfXwAU8QZWPsKMS
 77i/4KXhT7uwvD4Mq27qvEdrUwFR0GwVnUA/2nkaW1GgzQhebBEmzcj9NW6RWqSs72mA8lOsk/2
 dKRRACBmIgmrGCNYQxu1Vpb2T+k0fag/9a4fbmMu7/lWxnglawdnhZKPCZ7SAfY1AcgJhRFvmEf
 rj5xNp1mJ7SGtnLMN5nizZh9h+8WlLbME3FVtRm9XrcsLDcNjGUVHGFmItPZxoJgmU+hCSXLvKz
 ZVWIZsvLWuEVaDU1Fjt0YT3WKOYvl8fBBnnHlYWoYaTRu3XA5F2b7WVwIl8ltiBT6qqCdl7JwyE
 AwrIqB8e79Yu8++6LTNWX6cS2p1s6IceIZ4M0vgW79nNxOV7PJDsM0R6qu2sZpRrUGlTmQYb91f
 1N1m5AXFfcfZPvLqF+AYHzmH9koEQj4x9peZF8dYiMPUBy4w2S/ycJ+U96ZVuGcGqcuv+ZpnHKE
 g3SnxipmNMP5pIgi82g==
X-Proofpoint-GUID: 7Pffhl2gwa9OXapjKcqaLjGEKiidUF9c
X-Proofpoint-ORIG-GUID: 7Pffhl2gwa9OXapjKcqaLjGEKiidUF9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190088

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/renesas/renesas-soc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index ee4f17bb4db45db7b96c782b770e5bb4eb139e09..7c54b39b9cdc6b070a7cb6c1c03cc1356bbf0309 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
 	const char *soc_id;
 	int ret;
 
-	match = of_match_node(renesas_socs, of_root);
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
+	if (!root)
+		return -ENOENT;
+
+	match = of_match_node(renesas_socs, root);
 	if (!match)
 		return -ENODEV;
 

-- 
2.47.3

