Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013036;
	b=b3P3k8/j9h1b+XA8gAwV7wmywyZNA/M9OwQtSbSrL2kZhgE5Y9TUwoCO8UzZi48GWOKy
	 MO4BmmQmrBXCU3WobkPugw+FsGJlJohKPx769KfOxl/flHeb+1O0FfOjcuc26Flv3sWuD
	 nXAaHiMMBPO4OvBt/ZfL6wpyONgCAjE223uQVXYZCpyCdHHIpiN5I8JlhzvsV5DXQ2bqq
	 RgTduV6R6DtuNlHj/L7u0/+/05IyzaXAKL1QAKPiitswb7xg3fM515Se7gyyttVOjmPNj
	 99X0gDuzV5IxlwsFIpJj9tlC254L5le19Qz4/kZst6sDiO8HbEwG5qb70W7gWGmXPCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zJGI2tz0W57vr06M7+SplOiRV5n8FbpcsoZ1wpiNj8c=;
	b=u9EicFqgWdV+PVUNpDY1eFaG3SqgR+2SHK6P/nOe2wGmVsjjk+075WteZPr4n2MYltwA
	 PKLtpAwSBRxQZBEREi0dX6gsOz00mn++sCbX/WoWFptNgbrFBwrcXLD4EZxPz3sLjfNwO
	 bJSw76RSuBMQqV6aczIGoR8Jw7lBaN5xjphkn2ghmbCICsnWENUFuK0vqQKr6zN0Ta4RA
	 FmJ75ZZGlwtTC4bTaM6/Atjm3zYWIRb/zWGhp6eP9Nc/AxMXHIoNn0wwnjOPJBaWUnHOw
	 cBsF5dljiDenng5muFYzLW4tjlIKb2gkV3ic0rchiY1TWzFy3SF8KwvddbDSleU/hTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="PcfRn/MG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jhAxx2BA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A173B60A382C
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A173B60A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PcfRn/MG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jhAxx2BA
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsoae4131368
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJGI2tz0W57vr06M7+SplOiRV5n8FbpcsoZ1wpiNj8c=; b=PcfRn/MGbVAXfuQ7
	zuREWbOF7ZIB8QlcwD/KDbCIEUoeG7p+WT9dU6U0lHPpBw7CHD9KJhgMPjXBnp6h
	RfZTfxM4vQGZM7+3gXb07mWk7JJJMFBiwdTqqjNS5cnBmRMhC18ELfJ3wiMBTGoY
	3yozE2Zy+QVDywzmszrEeOS9MZFS5j6P4ReC2pCgM28DF0eSBqSASDR4S4XRpO+e
	MQPqZsen2+iLuIAkN89uSuL/TIZ+320zVGTahJ3xA05P3hpjzwtk8i4Wh0HTXzzI
	em1LhwF7ZOqA2Ys1U29fiUiBSzr8wO4sCZKvvcLxiftqP7qiVcSk/ldu3jBwb7ca
	JfVhAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q057f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:10:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1e62510cso728487285a.1
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 04:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013034; x=1793617834; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJGI2tz0W57vr06M7+SplOiRV5n8FbpcsoZ1wpiNj8c=;
        b=jhAxx2BAKAp//iIb9XahBlKzFEbUD/H0pEznsugocWoMJQE5kpcwdxJdk7FxH7iBE9
         HICjzraZAGh9ppLVOGivUm3T4FVmja12h5koVj4k6JHLbaq/XG6X/E82paln7OAmiM7p
         ytywG9iyrge8cxhUtVx0OADs0re0iMerhE70zkVcmEFnuZYKswkmGa7SIwz1fQC68P63
         D5bHH6jQ4BO0cD4I7jQhpypeQDTE+ExhsCckucaEUxEjoCbTpMuqT+2pviwXoWj6BXQ1
         xsIYcvoQZztrpSc9rDIOyZwzXf3uFjFySz3UMVD54m4jrSlj4EyqvgMMtKUVHN+yBBNS
         H3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013034; x=1793617834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zJGI2tz0W57vr06M7+SplOiRV5n8FbpcsoZ1wpiNj8c=;
        b=uKm0jT/3livY/Tbv8ugT2nN5WcHYYJ4714mCZmonzZJu9B2/oDU4y6Zvpgi7t4ZS90
         dF4FpKBuUO5O5+mfk66/zUMKkOTwdmh0/d3LKahpG8bk1pahn7JDdQCKzY0vMxlaZ60B
         9G/vBiBuvH7GHJ976ZeYFPrF75+3twzwZ6ocsEZerirzVqekPbAcoEsKyw2iGhOdGFqH
         2tSqlzTVR0xxWp83Ege+DhNTwECvisUl8ilpPXVfCRvp3s3SQy3TpLH9gPTGc5F8Xl79
         EkB2x5FFcS4i59PH7OA4gsaPCEClkLt9hQCggehKs2ipy02zDPZwCAq4G7Iw/5n9GhUa
         cR+A==
X-Forwarded-Encrypted: i=1; AKwUvBwp0LLU12yVumOp82RJ41MJEVRbPNGb/m6FNI8rWH3IcP3V++8F8YydodOmWEaRlHxYsik=@lists.linux.dev
X-Gm-Message-State: AFq9FYKTm5zry+GTzBeF/QgweUWPV/KO/f6BoaaFxT588vXPADCv5AxY
	nj9c0dKgmhoAscw7+wRC5hw9cYaynzKG8L9qY7IaNxq5D0JtmgKn6sdcvnPW3b6bJM+En0/Abli
	aAmhbry2+ruWKVRgbWckFCTaDSBNAmxPWxEptXQWVS8Pi63cUA9ot73E=
X-Gm-Gg: AYBFou2wGh34RW6h3a0MAARzcn/F3S8F/I4ut/t9J35Xl2N/gnVHWEr/Hu2ixhAW4v2
	WR5Is+dL+67QfoaFZl1LQpAg1qDO6Hh4WF5tri8KlHH4p+XwESt2YSVAOOZvj5+EZ1YAT0CWuXY
	+b3L6tfuSV6JPFIEZ6FfdrQkqsKIoJYcQ0b9G2JZujq6cbCBp+1xOB6QnNQyHZ2t9uB5B8KXbh6
	mm7Vi1gVROIRanDdeRk994ny7PRz2CJzhErOrE4BufHxPNai9mPlaoKOsmYcVdMfzjXa+w7l/1q
	LZW+0I95byZQ0JTFhUjQHrtq5HI++ajjXRslx6FjEz8LLxlfMx8Sz6RNsSbe9ikpB6XUljEM8zu
	wSnbDI7wQbmUIK1+8EddH0/RP99hWYdXqCqw0MdDIsPIJd7jWSlyviuvt4XoIzO5mM26z+wbAl8
	m3KO8H9yOygrPe
X-Received: by 2002:a05:620a:6887:b0:93f:567b:6157 with SMTP id af79cd13be357-940ef964f93mr965084385a.46.1793013033595;
        Mon, 26 Oct 2026 04:10:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6887:b0:93f:567b:6157 with SMTP id af79cd13be357-940ef964f93mr965073285a.46.1793013032997;
        Mon, 26 Oct 2026 04:10:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:56 +0200
Subject: [PATCH 07/35] drm: rcar-du: use devm_drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-7-5e3070a3478f@oss.qualcomm.com>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
In-Reply-To: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
To: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linus Walleij <linusw@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Alison Wang <alison.wang@nxp.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Igor Reznichenko <igor@reznichenko.net>,
        Michael Walle <mwalle@kernel.org>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>,
        =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Purism Kernel Team <kernel@puri.sm>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Junjie Cao <junjie.cao@linux.dev>, Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Markuss Broks <markuss.broks@gmail.com>,
        Artur Weber <aweber.kernel@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Yedaya Katsman <yedaya.ka@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1332;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ULsX1dvjGix9WxOeq5OBXyIUsRBnuO1n1CN6kLh7e1o=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGrfNQijBa4aGH9jIv71o3IUXgiKh0bJWRV+IrnWQn/EhK976
 okBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJq3zUIAAoJEIs8ij4CKSjVvlcH/iO8
 jYjv/HmDRrgNDbCzIBY4wlAdtIgGZlU+t9FDDKZ8SP6nhoK2hkukiFUBbwqQnTCMGhwHGeC81oR
 JVXvJKEJI/fcLj0DPMr3YIpCmst/stq61gz+KuqPdk7SI9OuOF0a2H88vkGOOoj35VT0rc6NCdW
 9QKlWwfZvnOEY9n2MuG076KGS2o5KXObwy2hr7i5FtiMbDhT+y9jXBXOVw+qvMBJyB0Utk3l+MX
 pgFkTm36QGi1diysTHh2q2sTPKR2zcgP0IIlrA5zOSzxXb6wCEfiKFWWPkLHZa+EAGdzpIvJYg2
 b9aYDplpVEOCLyE33DWH7DqvtUtQp6mqaFqOu44=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX+zV5iGadbUlv
 qbxjvyqAyc4MN09wAtGDQ5LzDkwrhM9APYz6ts+6NHe/px8QzvbWIuyRS4rfT0A74RyQE4vT5wI
 itTU/rpNAN7HuMZP03+H6ioMv0d/XGE=
X-Proofpoint-ORIG-GUID: E3kq5_23KT3kg39A9F02vPuDUrWdrYRe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXyud/90P++Eak
 wckxDnLXaZ1UuMlN8DyPkux5gRXetc7GcJNwPKsylnHt2OuC1DrZoAcpDsF6Cj6BYJF/8sdl9C3
 aHgiIS6O2CpnO1Bvt91570vSEVFXLs9JGVu5UzRAxQVls1tUrbTaiMD6MlD/GXOdp7/5jez2ii6
 TRIxHhaXrjLNFQbkU3nPgbZ9pfPofoACD459Qba9XrK7IsZTNsKgWJVAsnp21e0DD9NZNlX1jdn
 5M7nyX2LteAUFEw6Izhbh1VCP9D+xxTaUS0zSWmPtJbnz0PiE9rNpNPMosjhIYFnc1V5zwWWFVF
 2Lex9Twqn/iHCbAe2bRXrzZwNanQTRDhrQj9iSWJ4/bTeiYDkAMkushEiRrF8xgV2xIT2hNbiUi
 fXcAHHw2udo9G4E1OlxsvKIvQb1sCjYRUDhNZaQ9muZNv6eIky7ttdo20qXygX3BGloqKAJBD5m
 N9842YQVbUrErTpCM1A==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf352a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=BQQ5wuhf5moQr-eOkAQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: E3kq5_23KT3kg39A9F02vPuDUrWdrYRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The connector type passed to devm_drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
index 3f98eae9b6ac..f28840e3a1ed 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
@@ -67,14 +67,13 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 		if (IS_ERR(panel))
 			return PTR_ERR(panel);
 
-		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
-							 DRM_MODE_CONNECTOR_DPI);
+		bridge = devm_drm_panel_bridge_add(rcdu->dev, panel);
 		drm_panel_put(panel);
 		if (IS_ERR(bridge))
 			return PTR_ERR(no_free_ptr(bridge));
 
 		/*
-		 * The reference taken by devm_drm_panel_bridge_add_typed() is
+		 * The reference taken by devm_drm_panel_bridge_add() is
 		 * released automatically. Take a second one for the __free()
 		 * when this function will return.
 		 */

-- 
2.47.3

