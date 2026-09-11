Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939C337E2E7
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140228; cv=none; b=mBqQk1sB6I032Hn8UtZGq4Rq+hA5jA853Ud76yT7wQ8ryuNk670m6qdsPiUp/xCmqdBxMJotrdnX1Az7zOwhX8D327Y9o4/k4RmKnXjLvW3eIhw8VazpUOZeZPa4nwl51RL3gNtb3UwkP3GsCcfy0Mp3hHpBjLIRJJw8bHHqlEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140228; c=relaxed/simple;
	bh=cHC+UHnFTXah7PYvHY5YC/sMeyCMkaCll5i3gjNsico=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p3Jtu3QRp8pxd712WRbiJbWXo+J1bCxj1h/5AR5WauadNi156BzrSaBO3Z0q69XgN4PNXuJbtYazESZ3bHYQmnejyS5r2wKQCLXi0eNsHH8eelTPWqqyVGe5FHJKu9+0y6o/+2buZT1Kt2f0+y2o7913V46AiXF1ZOGgeIWtYBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Suq9KY7z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EYBapLLi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Suq9KY7z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EYBapLLi"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BFA7iV658319
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 15:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Urk/tOiIEwK
	LzYvti+etTD7iBNYdIx2xH64rRVioykU=; b=Suq9KY7zVg/VebW6W63FMbrTuJj
	7ap8NNkC4Lsuzv9kMMfAD/4qrM2tl8jxAe/P7CfqHEXFezJMEx93GLLUd4mYXgOP
	MYvLaM3AVLYi3qEn6EHYbpSAoKaKHoydQu5x1EQjM+5m8+FlnmjhShHvXbOb8CeP
	BCMP0JBc4ms6YpO4HoYFpZst5TSnmCXVv0LiCae61u4gTCfHoJo9FzmBcIU1hx6u
	F2hKMEQhv/553GpVDCLEvyMYAhZ6UUsHiQlc1fGGD3vZQQTzfgbaGXGGc/TkaTcO
	QLyW+Io1/xtaBj6k6Vf8sm7/jRYPc4YoowZijbeEXxnHdYIyBdGud2O3D3Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm22r1pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 15:23:45 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78580a6b2fbso307395137.3
        for <imx@lists.linux.dev>; Fri, 11 Sep 2026 08:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140224; x=1789745024; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Urk/tOiIEwKLzYvti+etTD7iBNYdIx2xH64rRVioykU=;
        b=EYBapLLiZtWIkuyUO9fAb7jhrpSOIILxqj0eau91ZLWTks6VCxgMvtNnFMUpkO2c+3
         U3qZ2iajp4xGTBwqm+Bg+3DKG+JuHDHV/LlmdIOKvK4ejE19O0LZbiKBnUyt3qoZPIex
         KtLzn5UDXgMRqpTVRjfKvC1+bOXgd13M/8opYip3AGlsxmU0hqpEWvY/ca9eKnt94HE2
         wVfdkimY/mtw5bMM+jU+y2ay3oLSze2Z89BcMUY8lOYnhO8edNNMeP0onKYXdBZHvBVT
         7rT/bOpyONygrxAbXEUEziLB3yJN+9hj47mjfDYlVjdq3kigg7lS2TyvYyrL6uYAHpDN
         ygBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140224; x=1789745024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Urk/tOiIEwKLzYvti+etTD7iBNYdIx2xH64rRVioykU=;
        b=rYYGcCXw1v1k4u3sQR9iQKIz8n/3V2YQfJ+gRrVXhXi/snmaa46aIAUbsqP8dwQCj/
         L/jLZ7vae9oQlsjujnxak5ZHhfjbi/biifrVZ2ypT1djwFPauaC7IdtqFOfL7gDMyFU0
         VXeuK2k+MtChFgT+zRi/zeW73T/1bk+3OycMdhaFMwXACxCxZsLTEYrFbRVnn/gpiOR3
         GkyJvNTUsh7C8XiedXye1KDHzAMc0GakarP5hJT7A8wh1eh5TPhgSREHAU6Uogui3AVJ
         HZBDPiNnmyeua3MOv+n2A36+AiW910qRDMNr/rgqzCZDhi18PzwcRaiLgsinwF+bfzC1
         qF1w==
X-Forwarded-Encrypted: i=1; AKwUvBxxQV6emjDCZPCbKUZ6oUAwPHPK6ujz2sQsNn5IC6aJYG0X0VIVYSIDX13v2+MHbmMxonY=@lists.linux.dev
X-Gm-Message-State: AFuF++nfhxtBusJ+4w372OuZohbzVFho0JkeYeEzDMqg90eYl/j53Ajl
	F84yY7f9u/opDf96Sr+PV5R/v8bG5zPytwuTjuJam2GZNCSGYKmFTcpaSFPyaswYh8QtQ0yWeCq
	DhCLCPhltVESosjD3ZGve3BwLyCRqrzC7GB6snb9UclwJFExd3oHmRPc=
X-Gm-Gg: AYBFou2drHSkIMr3hHCiXGYp5dzh/AOeeiHF7ySDQ/xhwLRwiiOECVWFQ5dC6X2LiPY
	ZU52L3ThvhdTzxuO1HhEInUgnDZZ9RAXJ/AX0RKe6t7uF4xOd5yUXbxS20zJq/XEblw5w184lEJ
	RIsn313Vw4cS+8L4W2+lvE36TRAiWsjNkK9bFpY17Z7jT6W9sL8n5mt177MKubfhOsQMd1Hz8bE
	6y50b/SPnaboQC6VKvl0SjfCcZyojBhbaXWNR0YA/dtvmZIzYrKpdD6MxSM9/jYd9nG+oRBFMmz
	0bl8JvURNQoh8rhI+ShGsf9s0bnylVdYndbsGrEjLuscnFWN9Qvk5AZGZitCcuNBCk9b2ht9gnT
	azxUxoxg5T0PHHVU5h7qQLp7zjifcuXcz4vcczeF4WUFJpSPZKdb5qwuoodMWkqISv/lsQ5ePWl
	Ff/5Huz0ulOFLIbSGr/qxaCDMyU51tJJLXI/Dp
X-Received: by 2002:a05:6102:a191:20b0:786:724a:4e94 with SMTP id ada2fe7eead31-792aa571236mr4941234137.11.1789140224570;
        Fri, 11 Sep 2026 08:23:44 -0700 (PDT)
X-Received: by 2002:a05:6102:a191:20b0:786:724a:4e94 with SMTP id ada2fe7eead31-792aa571236mr4941110137.11.1789140224027;
        Fri, 11 Sep 2026 08:23:44 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:40 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/4] firmware: arm_scmi: Fix scmi_protocol_device_unrequest() race
Date: Fri, 11 Sep 2026 17:23:28 +0200
Message-ID: <20260911152329.5822-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX8hf8HXlWFzzK
 YW3zAdFkOJh4T0UPL3nR8AZyT3NumZzDJ+n6qlM121w9VrvJnzEAsQSXqihwErc8Tdj6PWQ300q
 d+KPQwt+kSAao4A9pkxbDtRozie43Z4r6Tqu2wBHD7Y6EPbYQ9wCEiSwbGHpiu67aJUEZNsnyJF
 tFtSonHOEberHJPbfkwdZ7a8A1RTgxwBQ8RaAlmUqccFi/eR19AzkXdKO/FMgW4ximSIOFqkug7
 lcgWCxEitcvyAXi+0/H7goMQglb/V7mZi39rN3GAsDo2icAkyMZfr65rbi3IlMwr7rFY9oDNbyf
 RvkAvzjX10A1zavIfZ3Op80CuFB56FVxUSSh3+TTgQPFbU0PpLbaPwPJL1SIXRBydupDD9GIwUR
 la+5lbjMoh2reIbkeqQ+CwMcGffbyo2iBkS/vLJRIiY6jllFoWk2MNfDWGw1rWLBDZQyzfaBAMd
 nQb2Wd7vHAcj9u8DiCw==
X-Authority-Analysis: v=2.4 cv=LPDz05W9 c=1 sm=1 tr=0 ts=6aa41d01 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=EzzhlMzFHTv8R9URApkA:9
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 8IjQSr4YfircaneUmHVEoFpxExAPF2PJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX3y2p2P0mAd00
 sYJLaRSis4ds92e3kXMBjY2vLjJzpSbQOgpI13MaD/b8P2GFZ9fidOAXAPpJRci7F+/xICd6gNV
 ulmd63PtTcy8UTDngtWyzNhQ5o5Sy1k=
X-Proofpoint-GUID: 8IjQSr4YfircaneUmHVEoFpxExAPF2PJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110214

scmi_protocol_device_unrequest() unlocks scmi_requested_devices_mtx during
the notifier call. During this window phead might have been deleted by
another racing scmi_protocol_device_unrequest().

Re-acquire phead before cleaning it up to avoid this potential double
free problem.

Fixes: d3cd7c525fd2 ("firmware: arm_scmi: Refactor protocol device creation")
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v6:
- New patch in v6 of this series (Suggested by local Shashiko run on v5)
---
 drivers/firmware/arm_scmi/bus.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 6f667e4ffeed..651d4ba06574 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -173,7 +173,13 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 			}
 		}
 
-		if (list_empty(phead)) {
+		/*
+		 * Since scmi_requested_devices_mtx is unlocked during
+		 * the notifier call phead might have been deleted by another
+		 * racing scmi_protocol_device_unrequest(), re-acquire it here.
+		 */
+		phead = idr_find(&scmi_requested_devices, id_table->protocol_id);
+		if (phead && list_empty(phead)) {
 			idr_remove(&scmi_requested_devices,
 				   id_table->protocol_id);
 			kfree(phead);
-- 
2.55.0

