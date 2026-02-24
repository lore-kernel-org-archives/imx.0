Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700C53793BB
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 10:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771929837; cv=none; b=FjOzaxFaRxkx/8JnLeCkoEOoSvuAAprWCoO3VPBK9hq74sXiTzrh7Y5Iwvcr6b8nljkij1KD7qCJaBO9jdRh/4wURVammI3AzD8yZHAKA60IQEkhA6MHvl4wr0pnBypnWSEE+ML/sdKMrpW3Zms+vIpPjLQV9I+9YlyrOd/QvNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771929837; c=relaxed/simple;
	bh=7h/Lj1fVzQNHqbpgOXMHGQLnYHp9vdXyxXswRQGiGq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m3uMbQmcXpUeMZ+Uc1hb8O60iEBhVqNmG8tEMgXAP/MqD4nK2QDofZwn5NES+P2Opr3nL4ruq71HyhUD7UYi6p+NGtvKrt0d3rDgd9wSrtafR1rduE3jREAOjC8omlngPsdxa+C4ce3059aTaMR0M3vUOYG7gHiQQT8KysV3SNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfQuzWYs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jMwOI534; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfQuzWYs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jMwOI534"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFRCl3570211
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 10:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ne7yOu90dPGQgrUhRBv6heI97JqK1q/WEP2CV9u0asA=; b=TfQuzWYs6V+a7MZr
	M7JONU3S/pDgfd/PtBI3vHsOjR2pnj6TRjYGhinFdHTNnQ1As5UKVFMMq/2aCnnG
	NAsCci4nAQWnqM6uKy1CHPYr/ernPrwYcWBL/Xk/LVqQymzHAuAGdO8zhFyRioTV
	v9rxC1d9vilxIyswyr0jl9S/EIdalqYqCpekjtQ8jCRstzupMTlrbfqmQMVYfTVc
	xtcLj/ybHn4C11BtZrfq40vrCn26AOQsUbnOKTEv4k4M8peo+H97OiNIIbmPh+bE
	4+hgJFEEG2eh7ujyCXfNl4E/1MyT/0LnogYRMQaSEXcRlUfOl+DEyhhYOYXOTgoq
	8Th3sg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8rby2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 10:43:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb42f56c4aso5038845485a.3
        for <imx@lists.linux.dev>; Tue, 24 Feb 2026 02:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771929834; x=1772534634; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ne7yOu90dPGQgrUhRBv6heI97JqK1q/WEP2CV9u0asA=;
        b=jMwOI534LifL2954mIAcS7CAHg9TTDAgDAjlE7itvam1Ph3fsSaQqnTrDLuzeso79P
         B83nTtw36XLTt8R0q7qWY+QjneB8h5aFcEBg92RjEqXAFgoPT8999PtkEIByez0o8ToH
         mpeMq26NxN5EDlbD1/abzAlEQAmhIe3h3Vy2MjzcCjyAfaQxCwrPqiwNUbnY24PgQJvC
         wJxjH0uObTLGnFz8p/bVPZoyG0Iqw32E3H05hrqIo9rlfSi0XFByun0WDbX9MqIUMc6k
         6lI/7Lh7LWvo3/LRmaRCvjFnczFMLxq69VipUF1NL32zQqtakTfFlvpobXrVe+7u3OJ3
         YCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929834; x=1772534634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ne7yOu90dPGQgrUhRBv6heI97JqK1q/WEP2CV9u0asA=;
        b=qXY/l7b1kTice4V49+1LWrBXcfd318zlFlgGuwdaN7vAKtdpsa+eU3iwXc0/uDvPKW
         Kp/gf3XCqAzWWbi3GLg9BJDl47zrOul7VMuXRT4dm6VbguhvS4aYw5bI3hDEFzbf+sAp
         Woel2NusqDJhy6/Jyjc46bgdlxAvvEJKDJDEzN+vcguTV25iTlA2aUd3yK7Mdl0ahG0B
         1+jPb40CrLCHVAbLxB1AjC36MKhmV4UUjizghff4vFrZCGdIqHXRcv4loVdXQRu3H1hE
         bV3uJzvenTk7GRdY4Z9k4aqC20U2c8BlFXtPTUlSVB5EcavSYPPjcFctQChRh7FvwdzU
         yTjA==
X-Forwarded-Encrypted: i=1; AJvYcCUV4OoLYsyz+dSbsEJ2X6T2uFOu3MTI/O9Y/Ukk+PZqahwXJEH0vz6AalKQC4qTxB9F6hs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKX6XgT3Hx0hYDwfcGObgSPSSYYP4hSy+qnra4Xvg5dd0ah60J
	rED/8uz0707r2YS3FP46zziWRD04FSMUa2mK9n8rrBQwrn1hQx737HfhnZ3ZJw24++pKU3926QJ
	oYL91bPQr8WbAOxyZDahFc52fgbbG27xstOhIpYiCSXZGKREx+CPpd74=
X-Gm-Gg: AZuq6aIP74APaQZR6BVBTmQotPPkphuzBAnGesEK49Nill154ze6fjDxaIbYTyWOpo5
	4f97EOVe4d4KopxyIT5Qu06Yw3Mxm7RrXDcQTYlBHn4t/7x7C9LSg+/nVYE1z0BGYm+f22o7YH7
	aC+KyJHucM/KI6pzUzSUCm+0o4gLUNKT+MLR6+wjxOg+hLAPQLN17x9izPW6APbT67oplYokNZU
	pNLKzg5GFL324FgRZA+AQnZ+vlcHqckAm2JQecoa8y+fQzB+MG0/SOIE1BgwccUT9iU6xjw4xMI
	Q2sCSRlYJb3YHApccm7uwp7RRJ6rLCyBzZH0pCtCbYinFSrGudJz0whsdHjE2MomFiXZ2+ZUukC
	9wgZu5xbv52WmFIMVWnbtOL2hBWhhmCYb8E1hWDY4wHrmUA==
X-Received: by 2002:a05:620a:280c:b0:8c6:ff8f:58af with SMTP id af79cd13be357-8cb8ca674bcmr1328011485a.51.1771929833712;
        Tue, 24 Feb 2026 02:43:53 -0800 (PST)
X-Received: by 2002:a05:620a:280c:b0:8c6:ff8f:58af with SMTP id af79cd13be357-8cb8ca674bcmr1328009985a.51.1771929833267;
        Tue, 24 Feb 2026 02:43:53 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d40004sm25685906f8f.21.2026.02.24.02.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:43:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 11:43:42 +0100
Subject: [PATCH 4/4] firmware: arm_scmi: Use container_of_const() on
 scmi_protocol_instance
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-handle-not-const-v1-4-90bf93b53e27@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4567;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7h/Lj1fVzQNHqbpgOXMHGQLnYHp9vdXyxXswRQGiGq0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnYDf4rZiAuG6azRnIxmXqPEv0a1/T70K4tGK4
 QP9Dmw1vw6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZ2A3wAKCRDBN2bmhouD
 1wDdD/43Tz0/D5jgcP/JaZaTJn5X30WjBrCxt9pL9IIr2CExuUF8RvV3UVEFqSDruYaLY5xV+nj
 AE4rp6GAxvDCXBdFG4xpPkgnVW3BpbCf3z/GvNJ0QrxSQlpG8j5/nEYjECCevxyMMafQYWSNTD7
 0UobXEhsOcJDpZJCaslgR+Fz9zAS2M4fYw0MNvt/NKMYEeqfzFz+LOHDm+gD7s+N33ztv6ehEgt
 FfxiM53R83gSRbQm3C4MDYA5kwh8yZC2pMmW6Ggf3qjL4NBrJqx8mjnODFE9PQK6kiSj3NQnfq8
 cPBpVYf6zckkoB3wVbdMpHKT2zWoiYxT7w/3p0MF83zkInjpv/E5PwcJBCRLrhA5GBDY+uoIjha
 j1upzMWegB56pqV2WFHpyXrEGTpKmC56ew0/SjFviE6pf52HCBiZFVihc4inyUt3bGxzRXFhfuB
 QZe2pAMXJ28FUEaFKuc+AgVrxnAsJg9N8OCRojP33zU1dGlRx5tm8Hrfwz9ACSNrLjp2C/uVKCK
 MJafuDcbvHS07QMdPslmOIkDT7MseZvDpXBY4IXZiBxq+5/LX5d98P6sEhPFWvEzkV+wXY6TqM4
 ZUtlBHJOmsCqD2wo2Uk2jjJlTPFWdpdg4LLgbCzjBCxLMUlLcieW35Tn5PI7+emQKJ9h23X2c8G
 izF8oAxXnVfQFjA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: ULniEC_IoOV8sww_U0HXSt3wiUd_71V6
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699d80ea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BpvVLMS52MUaY0b39kYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4NyBTYWx0ZWRfX8j6C/olDNL3K
 U9pdqC2RV+U7yeuAkZok2cs3ehtkdbEycfuvEdVSD0gcSGK8AFoAY0Ps5B/z6rUqWb7hMIveNC6
 N6nS+WG2bhW4GNLXrd0C5WBqgyAJ3KuwdWA9vVDC7OyAD5n4bbe8tnCl8AJyMYUFOJ/EKQnQiqS
 NB6/z4oaAM7G/EJPLhns5NltIAMGha7rdamfCkuRgqlrfoP6sh/f748oWENYPAfnoX8wzgWbBny
 KYsLfHFoiJYp8IR/3cmr+gGFh/oFz1aWvjXG8cBUG/b9r+0iBLkmvHawa1swhXd0bCWbds6x9Av
 17u4clzSzJJ5y4+YETpj7Y4Nn9ss5pbGvPJJwPb8THkQ9dC+53dKhTCbP7k5Lza0NV38i3NZZTW
 nqMD9JpcV4XVgiQpJDY8qIEPxqduURw31EabE5LRjSwAWVXSJ99rGoh3TyzvMfMtXVkWJSs1nLu
 l7xye1GKintyyny9IDQ==
X-Proofpoint-GUID: ULniEC_IoOV8sww_U0HXSt3wiUd_71V6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240087

Functions receiving pointer to const scmi_protocol_instance, and are not
modifying data in containing struct, can switch to safer
container_of_const() which does not drop the const while casting.  This
improves readability because makes the code more obvious.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/arm_scmi/driver.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index cc6cdb7017cf..933b90f42794 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -114,6 +114,7 @@ struct scmi_protocol_instance {
 };
 
 #define ph_to_pi(h)	container_of(h, struct scmi_protocol_instance, ph)
+#define ph_to_pi_const(h)	container_of_const(h, struct scmi_protocol_instance, ph)
 
 /**
  * struct scmi_info - Structure representing a SCMI instance
@@ -1231,7 +1232,7 @@ static void scmi_rx_callback(struct scmi_chan_info *cinfo, u32 msg_hdr,
 static void xfer_put(const struct scmi_protocol_handle *ph,
 		     struct scmi_xfer *xfer)
 {
-	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	const struct scmi_protocol_instance *pi = ph_to_pi_const(ph);
 	struct scmi_info *info = handle_to_scmi_info(pi->handle);
 
 	__scmi_xfer_put(&info->tx_minfo, xfer);
@@ -1394,7 +1395,7 @@ static int do_xfer(const struct scmi_protocol_handle *ph,
 		   struct scmi_xfer *xfer)
 {
 	int ret;
-	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	const struct scmi_protocol_instance *pi = ph_to_pi_const(ph);
 	struct scmi_info *info = handle_to_scmi_info(pi->handle);
 	struct device *dev = info->dev;
 	struct scmi_chan_info *cinfo;
@@ -1473,7 +1474,7 @@ static int do_xfer(const struct scmi_protocol_handle *ph,
 static void reset_rx_to_maxsz(const struct scmi_protocol_handle *ph,
 			      struct scmi_xfer *xfer)
 {
-	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	const struct scmi_protocol_instance *pi = ph_to_pi_const(ph);
 	struct scmi_info *info = handle_to_scmi_info(pi->handle);
 
 	xfer->rx.len = info->desc->max_msg_size;
@@ -1556,7 +1557,7 @@ static int xfer_get_init(const struct scmi_protocol_handle *ph,
 {
 	int ret;
 	struct scmi_xfer *xfer;
-	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	const struct scmi_protocol_instance *pi = ph_to_pi_const(ph);
 	struct scmi_info *info = handle_to_scmi_info(pi->handle);
 	struct scmi_xfers_info *minfo = &info->tx_minfo;
 	struct device *dev = info->dev;
@@ -1650,7 +1651,7 @@ static int scmi_set_protocol_priv(struct scmi_protocol_handle *ph,
  */
 static void *scmi_get_protocol_priv(const struct scmi_protocol_handle *ph)
 {
-	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	const struct scmi_protocol_instance *pi = ph_to_pi_const(ph);
 
 	return pi->priv;
 }
@@ -1720,7 +1721,7 @@ static int scmi_common_extended_name_get(const struct scmi_protocol_handle *ph,
  */
 static int scmi_common_get_max_msg_size(const struct scmi_protocol_handle *ph)
 {
-	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	const struct scmi_protocol_instance *pi = ph_to_pi_const(ph);
 	struct scmi_info *info = handle_to_scmi_info(pi->handle);
 
 	return info->desc->max_msg_size;
@@ -1914,7 +1915,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 	struct scmi_fc_db_info *db = NULL;
 	struct scmi_msg_get_fc_info *info;
 	struct scmi_msg_resp_desc_fc *resp;
-	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	const struct scmi_protocol_instance *pi = ph_to_pi_const(ph);
 
 	/* Check if the MSG_ID supports fastchannel */
 	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
@@ -2067,7 +2068,7 @@ static const struct scmi_proto_helpers_ops helpers_ops = {
 struct scmi_revision_info *
 scmi_revision_area_get(const struct scmi_protocol_handle *ph)
 {
-	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	const struct scmi_protocol_instance *pi = ph_to_pi_const(ph);
 
 	return pi->handle->version;
 }
@@ -2366,7 +2367,7 @@ void scmi_protocol_release(struct scmi_handle *handle, u8 protocol_id)
 void scmi_setup_protocol_implemented(const struct scmi_protocol_handle *ph,
 				     u8 *prot_imp)
 {
-	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	const struct scmi_protocol_instance *pi = ph_to_pi_const(ph);
 	struct scmi_info *info = handle_to_scmi_info(pi->handle);
 
 	info->protocols_imp = prot_imp;

-- 
2.51.0

