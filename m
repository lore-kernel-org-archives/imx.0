Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E71425CC9
	for <imx@lists.linux.dev>; Tue, 28 Apr 2026 13:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384660; cv=none; b=nRpQnqqwdmwG6Drff5EKNH1J8Y4FIpP0G+7hqMTWkrUxQI7gMiGCccoXW+xHjtRr5frHAzX5yXSzLj9gZicuozFSwShm7hztvfBAXY6r/aKeVFPgLqoRDfThP8RO0gMbzjBclkeoIYkzMRTjlBxVPkrKBS1sYtTlKj0y7ynA4Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384660; c=relaxed/simple;
	bh=RO4sCnoLm2r3uThBagn5epHnZC4mBUTIASu5FQL7li8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V2IPrk62yISJ+HQY+U3DNMUKFj+83rm1PPO+0mJgCLwqeQMg9kMWnyRPU9+XlyV4vmX05NFxI6t/bek64ZgjQsherzei8R9GzGrbmXLli0hDw1F8zKCeEEKNk8f9shSjohU1NZVF0JmBeH9aiCOIqwpjKbebhDKoyLvaL6/J1Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jh+JjlOj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kB6EmkTx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jh+JjlOj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kB6EmkTx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SBgk8O1625116
	for <imx@lists.linux.dev>; Tue, 28 Apr 2026 13:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oo0DktF7tOdpQ2W3kv+WO9CWOkbdtYR9cJ7
	Wx+vAO1A=; b=jh+JjlOjnehP7yhCEv1nQxDtBwvhYElbOxyhlrqiiTm+vxQo+Hk
	o1M55Q5y4rUc8C/Fv6t0eNvg71saZDGsAMb+Qy+SEryyxCuLV/8qX0dJaNqu0usJ
	QnqCsXgamh1DIDK01RrpbwAqk9oEbLVJQ5fgQUY2AG294dZiIZ3H4UONxQYoIZEg
	bVmH/VtStes/w4ofjTEZ2PJd1+Pt70v/4UZ0Ch2v1wcGEyXRUKMuwC5cBItVh9Mp
	05ArYyzyQ4TeSHe74F+Q7saszD1mYw1FTED3z4km0SSJ1V6DTwr5m/WY9u5uzGyy
	JHsrBEa+uQQ+Ti1SjWlFTGFjed2n3iutssg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsbas3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 28 Apr 2026 13:57:38 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56fb91588deso7051650e0c.0
        for <imx@lists.linux.dev>; Tue, 28 Apr 2026 06:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777384657; x=1777989457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oo0DktF7tOdpQ2W3kv+WO9CWOkbdtYR9cJ7Wx+vAO1A=;
        b=kB6EmkTxHcHc0IS1pzceZ0ryueYp/X+4Jh/dqWoFVA5gq2I0wbF9dnUkYIiMRtytMg
         emk59IqxrPzxQTgscABwpaIgkpQ6h+ki87e2CFC/1ioBmLKph/DQ52xeBSUjwLvMw54l
         U6dsK+2nGV+WqiVADb3NR0+OF6zwkjl7DYT9Lhg/d2jy77fsCd6nQhWin8ZMpjam+0Uf
         /n5VYmW0UHmyQAPIwQghvLCv4Ka7JAmcsqd1XFhqw+CVSuabEpLfNvWqMMxGgUR9M6qK
         ywYq2Zyd4NGx3ITiXcEO9R1aJJHxsEGaoJQkgEpow2c3yadRhu+pdE2a4pozhG61o6ys
         lwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384657; x=1777989457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oo0DktF7tOdpQ2W3kv+WO9CWOkbdtYR9cJ7Wx+vAO1A=;
        b=sxQXbtn2pNFJmb2OT3ZMMLWkFc0l93RukfrrXCnbdozkCC/UHFXUlzJCgF9o3QE26L
         zL7N73sAaiAbHlBY7xNVT6i/lYdiAFRaDvpgW938VE3yDRFMFBYRFibiDnWTRhPJK5bG
         Qbl/86cltILgYng9bDGLGvY+ZXObxnWMORZZqbAON+i2ZZZxBn6XVHTwfL+6uaiVJoZS
         ztBZnNgk7P9wVbK+ZKLxq9xv4LSzAqubeqBD9mz2jqIif+WlINzUzdCGlMp6eT4Mo1+w
         EPJNQifiN3ANBU3C6yQQMVH2SoEyTurt9+dZWil7rKiyLOAFfgT8YcP+jEySVmh+n5eN
         UyJw==
X-Forwarded-Encrypted: i=1; AFNElJ/Gtpqkal8nLaW9t8e15jskGdtaDeT1RFrrXAnrRs/C7KkLalueG2Wy7yL5mi5lWllvlYA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg1N3omw/w/Y++4D14SpbC/1JFkH84JVDW1lMLZv5S+un7xmsd
	Cr67uNEsSKSKANabFtor11hw+6DeH6e5N29lw+VaeTAo2qwXz28oebE4fy1vhqvedj/1zMAX+yn
	zuBasQO//6zXdEczxoHGuEA58BX/nDKG1cAe19KKzeQ5SICWljjpvM0u8VO6uwqo=
X-Gm-Gg: AeBDievLtOnEJKtsp500W8tbX6RVdqVh3JH3wpybmPQaCrpbsEoO820Ugaxb8ZhQSML
	kfbvprGCF5+j3Dy6wPHq6hWHsglzXTmHmR/z9yR35tL/xskTQcs17I6ExlKSEofAP8bxGojPH96
	iKS3Vz69+F9UOHZw7MpcP5ynP4G3SIIO4CRzz29j20wX0FyTlbXCstdiF6/uB0zVVfeNObA0kVB
	FyhNr4CVZUhP9akRDwMAJFiuPLdA1J3kuxNcK3mbBaO6xf3v91zishPZjlpWQhuvhrafmN+u4kp
	SDez6bsLzl3WfjIrJB+/0KjEQROlq9y3JMfuAsRRi6gxHoSVx5p1zRxoPl2ODv7EcbxBkVmgUGE
	DgaMapO2cccxI1ucwM8F96Jkw31m8T6antb8P05MUGgXCG2E=
X-Received: by 2002:a05:6122:8297:b0:56b:5e7e:d3fb with SMTP id 71dfb90a1353d-573a56a3c38mr1308096e0c.12.1777384657426;
        Tue, 28 Apr 2026 06:57:37 -0700 (PDT)
X-Received: by 2002:a05:6122:8297:b0:56b:5e7e:d3fb with SMTP id 71dfb90a1353d-573a56a3c38mr1308044e0c.12.1777384656712;
        Tue, 28 Apr 2026 06:57:36 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7748f236sm21159425e9.5.2026.04.28.06.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:57:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH RESEND] firmware: imx: sm-misc: Make scmi_imx_misc_ctrl_nb variable static
Date: Tue, 28 Apr 2026 15:57:33 +0200
Message-ID: <20260428135732.102945-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=994; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=RO4sCnoLm2r3uThBagn5epHnZC4mBUTIASu5FQL7li8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8LzMqvBQ2upbfVmMpUzqapzv9PP41e9kyo4JC
 0RKps35DZiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafC8zAAKCRDBN2bmhouD
 1/K6D/oCyJ69pBLJGiS4gHjfXWcSlXII5SMq5zjecWS0fI3uLa1z8XjxxBB8TiFTY7LEzLgzaVo
 FQ1fwYIyrdgGL91qtALZQs6hDr+LM0oftBdH5oO+WBl1VFeNxurq0yYhQsruq0T0YMB4jvaVVgb
 BktGMIrVImvh2cLSGJUeDwJ9Jogv2o+o8p9s7/anc8nYDPkejZLqGgirFWEdedfwDo9xZO3bApn
 76BgW6Hh8eNa8WQ48z6D+vuekiykm4U1eShWEw8h3tVFhmkyicj0NG2OMAuEEqx9pgI56F/Y5uH
 2JlQ+B1ywf69Kfihx+MxKK4ae+UCA208I/LPAtk1K0jFiDAvM61XxxUuRcT3KceECGXfGVHZE6/
 F6kOh84UHOvtfarw500eYoDYrAcHs/xggj+1IJ4vGhf7/F92rS9QcCZYix5sAZkRCW0+pDS6ZnD
 f3iywhUZjtguW/3N+lMa98PqsKViHQ2OZalt2ISwBzlrVtdQn+eW23ccuArd9sFFwq1+0EXwUOl
 t8TS21melrsAWZkT9rsQHmivxfuk5VS8ybZwk2XS5zKf3ag/hM3mdv52xwLudMnTthLx1zQQO7O
 Eda2vBZ9y5Mvrlxv0M4QJ1j2ZCrescPEF5sY9bNLhVtuJ2PhigswieuFqOj06hWaioH3n6FdUYj 7YIJvcFuyJR1org==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xz-vXjP0VY3JiUFh85yxKOjB0dKcdXzf
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f0bcd2 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=lLDweYiKzoSJucHH224A:9 a=hhpmQAJR8DioWGSBphRh:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzMiBTYWx0ZWRfXxC+WGcVe6+O9
 VsxqUIq1j1+5Q36dSsmx5wPtJgYjls6GzUxHhIWHwqcCboKQXHWHuThDaMx1afhKHIcaFBtQtUe
 0fUFh4bioOfC8FpABwHxMMcX1rDbESoWqFbvcsXfIZWX0VC049DSVhKxNRq21plLrfWGaGh/jV5
 x1X3ZGdLi5C3Osnl33aJ6B6NUWfQnEN3qrO1SmY54GT04wsUjYiBg5QXaNVSpdRZ/Knda9x+PYu
 951T6LZfeqbcqhQMj/p/LRB3qKZWdYbKjyp0nEvEriGB5cqxdy31Nh5WEqVsPl0rxgDj2PTfVEs
 h2VMNIL/DUQIbvr1rn9eOoNFsMSAAoD/dTLs9DXh4LNyfkAo+WL6qjSa43z4msFpPKtVS1cEl9o
 M7QdjKHMkhn0B1GYFQfrf8a58xwCHTv8WO/wcHoJ2FBxuwxFvdDuBwuhts8mnUOBkx6N9wHwPd6
 Ji6cX1mspK/0Cni03cw==
X-Proofpoint-ORIG-GUID: xz-vXjP0VY3JiUFh85yxKOjB0dKcdXzf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280132

File-scope 'scmi_imx_misc_ctrl_nb' is not used outside of this unit, so
make it static to silence sparse warning:

  sm-misc.c:19:23: warning: symbol 'scmi_imx_misc_ctrl_nb' was not declared. Should it be static?

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/imx/sm-misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
index 16b5ff833d21..ac9af824c2d4 100644
--- a/drivers/firmware/imx/sm-misc.c
+++ b/drivers/firmware/imx/sm-misc.c
@@ -16,7 +16,7 @@
 
 static const struct scmi_imx_misc_proto_ops *imx_misc_ctrl_ops;
 static struct scmi_protocol_handle *ph;
-struct notifier_block scmi_imx_misc_ctrl_nb;
+static struct notifier_block scmi_imx_misc_ctrl_nb;
 
 static const char * const rst_imx95[] = {
 	"cm33_lockup", "cm33_swreq", "cm7_lockup", "cm7_swreq", "fccu",
-- 
2.51.0

