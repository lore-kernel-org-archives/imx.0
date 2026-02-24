Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930CF378D95
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 10:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771929835; cv=none; b=aZPb0/MyHefntXeV5ten/veZNKh2hY3on76uh+yqZCfqeNgO6CUfc8TvoJNdqqBgZ3Kw5R8x5UGpmjF5My+HfwzEAVgAu+Ld8MY5E8meZIqu7uMsYo9rZl5YIdOGZ++D8zHP+WXagxY1pqA0fvBBTOvjJiGMAKBf5hTOUZdN9Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771929835; c=relaxed/simple;
	bh=Fe4MjhMn8lZ84KxqMdgpBwRbEDyKHabOEHVEnVI2kpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G12PzYs01M2M4BBucCToCxEeP4IEtHqcwaSUMCTRUWAqzpAYxfnqdTPi4L83atKH6NmlbmxHNWqVVZosWm/2cS8wgWiW4kjaj+iAQC75Ren6lPOIxvI74JFus7s4Nug2hcY5RTWHwzTNxxHwqfwixtWvMYL+1N0xcyYd3zQ3qG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D9v3qx8o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J0ObtNrm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D9v3qx8o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J0ObtNrm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFep11775185
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 10:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZ4E54OvU7h144U3LHJamjkNTkG1gc0xqf9JFK5pbkI=; b=D9v3qx8o/f75VsT/
	LhL4bFzaO03AVDp1hmkLJWmKeXl6N8puQxT2VpFjhcj5v8ELcW0JtAtalWMSUIZP
	3pV5FCZLs5BKt95sc/ebDVXvmj48cxHbfbt0CbrGQOxcYkL88Iy70In2gQAaGCdc
	+cr4iEqs2rCL1kq6FIw4gwDUOd4jW0e3oJWHpk8+8o8w4JZCZDRyHMAXBjYG7AuM
	qlCbmEoe8IMRhYd/fnXTl59jp0anjm8qrEtDaCOBvQSBODiGRRBY7C6+HahIzx+e
	NJ256yntk82Jtw+sBmGnspNvusljYofkYBaIz8Ssd1WaVHxqtwrPIOJROK5usNfR
	UQntIQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj8bmr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 10:43:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70fadd9a3so3229586485a.0
        for <imx@lists.linux.dev>; Tue, 24 Feb 2026 02:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771929832; x=1772534632; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZ4E54OvU7h144U3LHJamjkNTkG1gc0xqf9JFK5pbkI=;
        b=J0ObtNrmz9GhiAdgig/3K+77DDzu6rR+izQVvl4WNmXDmXfECYyny6CP6TKFtph5Lz
         7Pm7PFy7MOFF/rhBru3fE8P3t/AmsoF3tXOKdfil1znOjhRaO6+hVI57wHOB3Ipv6rEk
         da5ltTSZg9m/1+yUrrgGlND1jdUqgHR1SSGY3MOd7FsXdQg0+GjbZQmfrZyV4eXBURz8
         Fe89TUzgtBPceR/CJ2SvQBi//q+RGo0KDEsV7XEcHXx3NQ3oA6xgyBKuhsvlbLgc0XPK
         UxxNVfKCijmvkpksR73p50O6E92jLRy7RS9h2wbd8KXo/Ez/PAXr6mn3BqpuJwtcDGDD
         5Odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929832; x=1772534632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OZ4E54OvU7h144U3LHJamjkNTkG1gc0xqf9JFK5pbkI=;
        b=L56lPliXucQMNxCLvc5BKMizCUorv9cCzJlsOwILHFcWPv3+D5vdniK7AJmVjNkHqp
         cbTWQFQQv6zm30FuDO6OA+3QvrTWcE4HCz4xwFgx9zsnjY7oh2Ggu16X6/9++XFkzuvM
         KZJJS45oglDYz/8/+O7ymWNiQg+dX2NSqDuHEAjJYqoZqWdDtx4MqSvwVcZ0JH2kLR0r
         TX/f5qVPYszlRzWxvtEJfq+QZtuKPLHIgGh009blzw/i0UrTg5tHywnsey6eNjTM5gcg
         EF6OMOkEg3FadJMKPbyWc0MAou1IJDMgFpAHa2lw40XRUqmONX+tiLK2ZgbvD39UP0Nf
         hSHA==
X-Forwarded-Encrypted: i=1; AJvYcCWyrIdyomZ3xhoMlaZvvG3Ims1jHMB5xkh1uSWsP1qNs0+fx2f5MvrFhV5IshrkV6yIll0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4uLpaL0C2MrmPBvNrUYKxfMvtvUiLHlF/e44yDOdoF7bcJ0Xf
	tDvKmp69AtPC+6hdwqPniMfwCgotl3T2wy0uVT1VbEmqd1vnPcXD2wWTb+9c7aGnWKVoDQwLb5H
	Lshg5MII48Wo+QQAabllLGk5sDdZsxy90IMJdhV0yOsM5CiDzVyvb5ec=
X-Gm-Gg: AZuq6aLZfL2uhClu8FlLwUMumFL3O3YjKyK/DMTkRwiy6vusWMRJjwSGZjGDjywmKvH
	YcJJnGslgjnRdoqnBr3DRUq9uUlnmzJc9wSRjNgdWQj6LVzAjfkb6EMMkF1iny1UH4DKPyyTsAl
	LONp1RB2uPioEjlCyx46GkDY27vJ8TtgxTPRN6Waofpxk26z+JrAsfDgcaz4B++d1v9FA5D4fIc
	ocnwGbI/krSpYSRgwaZllDydo9Gg+dQZ1whGc3Gw2V4v5tnJ3nsl77el0yUIK/0hiVkGtbUqhGs
	5hDxuNIsv2tAnEA0tNlb2d6JO3+OaltKA9dfBYtrtfzPb6SjubacIMYLOtakxfgou9BsFauwGvA
	blBjWyyG0fuxHj6pJQJr/hyp02Ona23w2Llgu5FKf4r9YXw==
X-Received: by 2002:a05:620a:1a93:b0:8ca:ffe3:33a3 with SMTP id af79cd13be357-8cb8c94311fmr1569672985a.0.1771929832044;
        Tue, 24 Feb 2026 02:43:52 -0800 (PST)
X-Received: by 2002:a05:620a:1a93:b0:8ca:ffe3:33a3 with SMTP id af79cd13be357-8cb8c94311fmr1569670385a.0.1771929831544;
        Tue, 24 Feb 2026 02:43:51 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d40004sm25685906f8f.21.2026.02.24.02.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:43:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 11:43:41 +0100
Subject: [PATCH 3/4] firmware: arm_scmi: Use container_of_const() on
 scmi_handle
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-handle-not-const-v1-3-90bf93b53e27@oss.qualcomm.com>
References: <20260224-handle-not-const-v1-0-90bf93b53e27@oss.qualcomm.com>
In-Reply-To: <20260224-handle-not-const-v1-0-90bf93b53e27@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2933;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fe4MjhMn8lZ84KxqMdgpBwRbEDyKHabOEHVEnVI2kpg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnYDesakxrpxNl4CWrKKBXT6ZbDgoQ8kFNfECs
 nXEUwiwftSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZ2A3gAKCRDBN2bmhouD
 11AiD/9ru5hTRR38swT4NSjVHe7EPcPuJOJK0VitxSDyeTmSfPuBgQRbAy9FX60bP6ZNbyUcs7J
 7zbaHko1wWuuTXZYzbrSmHb3mNOKD3/dZkpeqCFPZap8bl7aNABQ/4eE79Pv/RiZbsDOP8BZEfZ
 kK6kKzWftbzhLwIcHfKMBbGQVmJRlir5iynhvi9cTCSnvEdF5tD4c/I+RiggOQkijoLjfwxD2og
 MYA6jylgYDTW1Bk9088jvtfJbNX48H9YfQZnkMxcgHVWXrLPIcWmMNNTkgbw8Zu/4mu/dpYxeDc
 rCL2vtq50RM2JjDXpoxqvPtuYJ+fLSocWFAm/P7wA+FHlr08TEZGiDnCZjO007ST6oO7p3gIpT1
 2NqT0MLKjwzKwGgk9WN5IkoAz0k8cWo1pOilBgx8ZgbT5eZGSBg8H3jfrMtBdeCTDL6CxGMJEX7
 JUuVdug8yMxTh4QLkTY/YqWNINWPAAv8r4pMJl6oCFPnH8ZExy2V7fUUYjuK/W1WQCDTpEBblcv
 JwpQ/gtTGjPeatMVQvmmHAw422D6PDLpPRKpTRcNxoIrukFBsHcQirWIYdw5zlCRYiaN2C1frLV
 nH0mdavtUPUZfSYjYI65KS7eXUR50nhSFJqYPvNlQYRcEq5Bi8eQ05JGDjo/qKklmOkzTAG/Ggb
 ZIt4m0sUR/ULbfQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4NyBTYWx0ZWRfX3e0bDdR1nfoU
 INxziG48Brh0K1sj7zOg62K/35zdpF44r4ZD/ufUFr42/WI7WHZbzrXeo0l0zYJbRsC5oYl1sDr
 2LV7uWc+NvH2qYgYDzSuRCMUYcvStPtJx4bx7Q/zL34apOvN9mTMtbO9mTuyMZuI8CC87BcrFD+
 HdVq//iPV5WQaRgzHUd1pYq4LY9chQqq+o+rlqjLc5YO39sb+7zCBTnWbkW1mT+ukrRYobZaBJa
 rWF4hQNvo1raA6cL6oxGuC5COSQ52H4VbfbfgAfFRquiDQ4rvKgQ4GkUu0R6g1g+1i3do0n3t4x
 e2XhjXGUTyzYx3B+FdK3lExuuYpuPR8NzAshGoCft5dnxLeClNNNiDY17YtiV7TroBoprFFpEOa
 4Uyj3Z84Y4/HZb+J2g3MgP/qFJSv70jFql1rArZ6tuORmDR6e3svIdDNXyegfAVWh0tHKSJC8vp
 c0cpgMfMk/6Tul3ZIJA==
X-Proofpoint-GUID: 1qgxz-NRFP2NChoZXQqhI-x9BcnrpJ6E
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699d80e8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vFoygJ3d8N6QX0cQTZYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 1qgxz-NRFP2NChoZXQqhI-x9BcnrpJ6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240087

Functions receiving pointer to const scmi_handle and are not modifying
data in containing struct, can switch to safer container_of_const()
which does not drop the const while casting.  This improves readability
because makes the code more obvious.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/driver.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 951711aa7d33..cc6cdb7017cf 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -174,6 +174,7 @@ struct scmi_info {
 };
 
 #define handle_to_scmi_info(h)	container_of(h, struct scmi_info, handle)
+#define handle_to_scmi_info_const(h)	container_of_const(h, struct scmi_info, handle)
 #define tx_minfo_to_scmi_info(h) container_of(h, struct scmi_info, tx_minfo)
 #define bus_nb_to_scmi_info(nb)	container_of(nb, struct scmi_info, bus_nb)
 #define req_nb_to_scmi_info(nb)	container_of(nb, struct scmi_info, dev_req_nb)
@@ -450,7 +451,7 @@ void scmi_notification_instance_data_set(struct scmi_handle *handle,
 
 void *scmi_notification_instance_data_get(const struct scmi_handle *handle)
 {
-	struct scmi_info *info = handle_to_scmi_info(handle);
+	const struct scmi_info *info = handle_to_scmi_info_const(handle);
 
 	/* Ensure protocols_private_data has been updated */
 	smp_rmb();
@@ -866,7 +867,7 @@ static void scmi_bad_message_trace(struct scmi_chan_info *cinfo, u32 msg_hdr,
 				   enum scmi_bad_msg err)
 {
 	char *tag;
-	struct scmi_info *info = handle_to_scmi_info(cinfo->handle);
+	const struct scmi_info *info = handle_to_scmi_info_const(cinfo->handle);
 
 	switch (MSG_XTRACT_TYPE(msg_hdr)) {
 	case MSG_TYPE_COMMAND:
@@ -1062,7 +1063,7 @@ static inline void scmi_xfer_command_release(struct scmi_info *info,
 	__scmi_xfer_put(&info->tx_minfo, xfer);
 }
 
-static inline void scmi_clear_channel(struct scmi_info *info,
+static inline void scmi_clear_channel(const struct scmi_info *info,
 				      struct scmi_chan_info *cinfo)
 {
 	if (!cinfo->is_p2a) {
@@ -1240,7 +1241,7 @@ static bool scmi_xfer_done_no_timeout(struct scmi_chan_info *cinfo,
 				      struct scmi_xfer *xfer, ktime_t stop,
 				      bool *ooo)
 {
-	struct scmi_info *info = handle_to_scmi_info(cinfo->handle);
+	const struct scmi_info *info = handle_to_scmi_info_const(cinfo->handle);
 
 	/*
 	 * Poll also on xfer->done so that polling can be forcibly terminated
@@ -3459,7 +3460,7 @@ static struct dentry *scmi_debugfs_init(void)
 int scmi_inflight_count(const struct scmi_handle *handle)
 {
 	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_COUNTERS)) {
-		struct scmi_info *info = handle_to_scmi_info(handle);
+		const struct scmi_info *info = handle_to_scmi_info_const(handle);
 
 		if (!info->dbg)
 			return 0;

-- 
2.51.0

