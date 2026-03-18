Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64B13B8BD0
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848408; cv=none; b=kq00EjiZ2YElaCegYxJElabwNZ7WmWN9zg96WyA6imwqEFEvebmI21MAXYbcPIRlYC7NaBYrIrF9aTPxHef8ozMU4dWCbDpYncsPByK/KaVL1tU8PqjCYT9yxTCpp0POcUOsPIiBfZq7uQQ1DrWyRNV4lGcfE/qCQ8nNPPKVXQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848408; c=relaxed/simple;
	bh=32PGj7WTH0yI8mBEak0MyZ/EdVhgoZ22IhqmBEQgUXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UpftuAQtmAK59Q2DcRLekpx6dfJX8dymjKAUnKeRklHEcHs9H3On52QqV0qM6ip2n8+4B7sb+GUSIDWrcdq3PidxWHXmwXBmjqU5Ip975iA+h0RUeF26AYyGNGGwq5i2TlJozuavl4jZBKZEVixRN6Foe9FnUq4m9hH7KEndtF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TCtOPSpw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfzu8cKH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TCtOPSpw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfzu8cKH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFXH382966324
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 15:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s32DlM/y7Ky0/WZs7Ka9M2dNtudZDdICUprdqBWO+Eg=; b=TCtOPSpww1WoY31h
	G45iPz2zPxMpGUi5FL4l9rzPEQdGK+cYG0/iX95ZAierAfo63V87/fASmgYNgUqJ
	+zyXbUapMrLsr8leI8CTroCd7Pk643F1+ZgaYb9YRkIp2/Q7gH3Qx+EMSnUzYcff
	mX8mVZRkRnT+PWfRpNG+XRLCa0S/qDenWUtiguZsktxwbONNJTu11Hw7aMdVgNcr
	ksGJG5aey/k48lT+IxAGxTBAxEEZN0GvT0+VWOhXtYyYx2GK3ULJPZGPzcORxaKb
	ubAlJCydVfkGyxfbNWh25EdLecklKBy6Zywa47UIi076KDso15u93gYWgsFmP0hh
	hhEm4g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ek6bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 15:40:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50923a9bec8so22402351cf.3
        for <imx@lists.linux.dev>; Wed, 18 Mar 2026 08:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848402; x=1774453202; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s32DlM/y7Ky0/WZs7Ka9M2dNtudZDdICUprdqBWO+Eg=;
        b=dfzu8cKHKpJyvad55RZFdWdRYr3cKlT64ih5x8BB1mRxQo5cqRpmCcU/6eN4WUb6bA
         1Jpx2dBnehkGIrdH3M8D+s3e/TzI/z1PROeBboOGcy+JyFNj2IIgJ3vzmSCkhigM60dO
         juGaJvUscLFWbrx6z9mTjkJree7uDqkdqAPbmuB8n8hxpyx9BEjZXJT3S0dS0PMi16mL
         bXMJ9IbmRrdF5gwfekBwxuHGzqwzfJzxgZCmzgSdLm8JvCeEWguPM0cxilo7t6ZbUJtG
         DswzpKnBYCzuaY6FPSoudUh/Ex67MuKC/rfU7GUcZ/6fLr4iQ84lLXURj2dR9DhvxvCB
         BJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848402; x=1774453202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s32DlM/y7Ky0/WZs7Ka9M2dNtudZDdICUprdqBWO+Eg=;
        b=UDXw8rTy7U4hx5ffw6XHClx8/A+/1/SqyPSIGjoJIqOWIiSE2bTBkXrAIhKFrLu4ob
         Ux/wMy/CGVzkb9WFWjbxzktYFk3Tn1UyZm8Y+Y86I9kbcbWP7arakc9FZPSVgyc/Dib8
         y84pq+vfpgPNCexOjed7qECGX28JW102D2UiEUZp9TTGeOpzlOSfslCunEmDYzE9aYTa
         ftdRnx5DndG4qSfSM0IM4crOlphfq+rFUfSFL2RTvNolPFR/GC162cyObjDjPazEpx6G
         NhmsGlPg1l3sgi920HLwIsjo4AUlLaecKibmlkiQCHo+FJVXFGLwMu20rYIPO8h1ssDW
         qxPw==
X-Forwarded-Encrypted: i=1; AJvYcCX3J5XIALnzsT9KK0SHs/ZQj9ZGRet3xB72ddG6Q+ivNUM6hw85KhyynV23NRf7WkAE/xs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCBoU0YvByfpOW7xJEKO9CmENa4ZX8mlJiqnFzErK30zip37bX
	4D07oRMDG21I08IV3aKJBzSyaxygsm1WFiiErSh14DYmlEE1FaJMTFkqarFmgwDp2nQ/dixrBV8
	X9YwjAUZBTTaUzqLPMnIe8wNr57cJQVanCMAVM5HAguNsjETNHi9IruY=
X-Gm-Gg: ATEYQzxp57oTlKlQDiwPyBqpNXNTUqczrV7exEOp/++cOlDZWZBGARgSq4RqWjSbUIM
	tdx7ptO/d1GCV/CxFsKwZ4z1tMv8P945xyFMX3UjVuwm33IONumAFHS4+yF8Dx6WZw2KffaREXX
	VvleMs3bH6voVSKkBqq+9Bs5u8ormukHqM7T5W5Panltem5OOOR+C+BxB3rUtaKYiINk4Yae2Sj
	IH8GlASuL8WFPta2WZJLqf0J9tC3kBYT6a9ryokOutJY90UaNmBWzTffv+HKC4XHjYEi6JdV42l
	JZhGpgDOUxqvYM4IEt2Uaoi1nm1hjhx2wVcXWHNZfn/7ahi3xgbdWhnDMU+1VJSTAGAMVCV1Z7r
	uu7ZWYf2cFm6I6iYcHYPky6chM5Q=
X-Received: by 2002:ac8:5a43:0:b0:509:27e7:a060 with SMTP id d75a77b69052e-50b148ba4e4mr46678271cf.68.1773848401578;
        Wed, 18 Mar 2026 08:40:01 -0700 (PDT)
X-Received: by 2002:ac8:5a43:0:b0:509:27e7:a060 with SMTP id d75a77b69052e-50b148ba4e4mr46677791cf.68.1773848400901;
        Wed, 18 Mar 2026 08:40:00 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:39:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Anson Huang <anson.huang@nxp.com>,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Bai Ping <ping.bai@nxp.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@puri.sm
Subject: Re: [PATCH] clk: imx8mq: Correct the CSI PHY sels
Date: Wed, 18 Mar 2026 17:39:34 +0200
Message-ID: <177384710707.3709943.7150219544572439117.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260128-imx8mq-csi-clk-v1-1-ac028ed26e8c@puri.sm>
References: <20260128-imx8mq-csi-clk-v1-1-ac028ed26e8c@puri.sm>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69bac752 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mLtdRAArnWS4-yPjVp4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfXwAVIQW4H/ajD
 Xf9E6eb1/sce1OPgSgxz2kG9UNLVj/MuvwK1ap4Z65Tc9H5WqJBwXHRaNYX9p1Vrnh36hvTs1fm
 S2yjiosMdAgKIh6btujx/SnnZslLHRld+IYce8nggxjZacAWXKk3UYHyR6QmGaq920a+Kq6GrU5
 Vb3djbfGZO0TniCtWiINA81LF2CEExQxgdfRQpsEY9xyE+VE1+RM3Hz0jEEalnpEH70hFsgr7Kl
 N8mszzb0JcL9kwBPA/YKMSxGJ2Gz8U9qPSXLsGnXDIadCRyi9IeO4wmubrXt/vuQvxawNg5oha2
 6S3ga1lAxVq+1NPS0Gea9z5Dv1Ql85AlCCiRJaiDbGKIrsqgD1rrQS9i2wZIvNpWVlJV8jqpwCQ
 2r5UEWtF/GehYjktxzDXVnnICyWym5ZzDo2qSCz4Dy9CZYNFetrwhpJ/9RUdjGgg8gZILGJFsqE
 xDZNr8JfCxA8y3JnLVw==
X-Proofpoint-GUID: z5AQGILgT7RnxQ_KFdVrRbvbHYUjBRvv
X-Proofpoint-ORIG-GUID: z5AQGILgT7RnxQ_KFdVrRbvbHYUjBRvv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180132


On Wed, 28 Jan 2026 00:47:21 +0100, Sebastian Krzyszkowiak wrote:
> According to i.MX 8M Quad Reference Manual (Section 5.1.2 Table 5-1)
> MIPI_CSI1_PHY_REF_CLK_ROOT and MIPI_CSI2_PHY_REF_CLK_ROOT have
> SYSTEM_PLL2_DIV3 available as their second source, which corresponds
> to sys2_pll_333m rather than sys2_pll_125m.

Applied, thanks!

[1/1] clk: imx8mq: Correct the CSI PHY sels
      commit: 4219a54681d183a143009104967645cc252f1e30

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
