Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013027;
	b=CBHPiDAQJNwvISz8PmYwiHIvxvQqcVWFxp2dwsfIZa2OJORNtLeJ5bIam/h4y2usLBId
	 HWr9Co6BfEnZR8hS8MtlPFsWMu4wG3/yNV4mBygT/jU94szA2BMdaUaGqG1IxMVe4HC9x
	 ipG79Wp97AIp4MAtLIeDpjSxf2eH6zvOnhHbzIfP4krGbr49XebboObuBEho9jmreq2uz
	 ECaZbPBXi7w+klqihPqKkBis/fRrkC3K6TghdEervdllqsy3ra2156RdgJHumHGj9nIqj
	 C8uFDE2X1dIEkJBvgnUtLF8jz8AV+BoqLi4QoA9g0LAq8+kMv8O/GkCeZVuuUH53msA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013027;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SpKV/JNuWWy0JhJSp7qItiPmfiD7gnGBifLSgJFmDEc=;
	b=Rc34IlHIAaTBN8MYq7X9d5zaypZrjTFB505kPCBJFy6hnPZHquTuxE3DSwweI0rbvOsl
	 5mSybiah4qSRo0N+7Ff8HT2AIDyJFd7oEiKJdvelYglUUile2jNcWaiZCyC5AUL0sTzbt
	 l+h/5cG2L5/eHWEtp8IKmjimiheNZ9er1TJD7Q/tijxya1OpBW0OLbq4nvsQgCrOSlWP9
	 VYhbruudpfFr/DRB5Tyd0QRWiZWqBNvEC8NZnOG8/mCqi1/kXgzv4nqBAtOmAro2F9UIx
	 K5syo1Q98Ox8WTGWxghYPZF5JOOVtQH8IorTKfIKh/zqDEvKjHTb/tMN46rwv50SgaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1IVgT0j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E32r2hI9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AE460A261E
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40AE460A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1IVgT0j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E32r2hI9
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt1AJ4131942
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SpKV/JNuWWy0JhJSp7qItiPmfiD7gnGBifLSgJFmDEc=; b=I1IVgT0jmhAC2asb
	J2XIZ6qxrePL3+97AuF+S4wz3Lt1dXjnZnF0T8sPuCfcUhoomUFYogeVOEyDrRjq
	+DJ31F/WW9Bj+SGuYuX/2kwO11o+3AK0FPpsD2WcFjdHo9/oElGoan0t6iKjoiIz
	nn3W8Zy4qp2I4p5sCEnh9f1dVeL/50uzJwn/LiQc1i8g6YO861aLZXFv4gWBXtNK
	acuYl5CXhJjRLGL+pAn/xd/9MbV+xu5JL4VrmXhd/ltSPAEYR+dVj95wmuXULgbN
	eA2r14pxbl+bggXOXXMG74BnntY+l+9tKi6SSQxT4o8HI5QHK8bFLjTLnBzGbGrJ
	Hd55bA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q056c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:10:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53664602c7fso65331341cf.1
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 04:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013025; x=1793617825; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpKV/JNuWWy0JhJSp7qItiPmfiD7gnGBifLSgJFmDEc=;
        b=E32r2hI94RSnEMgMeW+u0KzippuO/w36RSkdHR+mbbrXJDoR6de9b6Lx6eeIRdzD8o
         7ob/jS25eXItXdh5jrVkPx/tC5I3INJEbw+/Fp9uqHDS03M8Jf5TirBIy7JLOa6UPppt
         X28Js5Lfd/X8g8/X0dbjBhnQWIei3nYijftc4+oPS8UEIFQbKwxCeRsvbDGIhS9DbBkg
         YlKFpTxv8Eaj+O/G7bWCkDBIdsewhA/wcAn0ORHLeah1ov6mGW1wSKfCIMwYtw4tMO3m
         oqh9HlwFFqLFW1L1oFJFrXKZeqRO1IsCrGhRqFEz5+kzyrmoRTRIbRUoSsH2S8tfjWrV
         2DPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013025; x=1793617825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SpKV/JNuWWy0JhJSp7qItiPmfiD7gnGBifLSgJFmDEc=;
        b=DEPUlaZWxV3s0wIYMTNtOU/h105Zf+XC5RJPyqJjtffoYtjdmJDSBtlKdDc4f8odkN
         8+SqXAUbH4Yki1BaJDyYx+1S2JM3gQVWn4An1CNwbzvsN56wFOdIV0i79oxCoPtkSC31
         OHzC0BZgUhj4xKYeUVtLe2LZWx4VCPyp1T7fe2lVAVgR6qsG4mpJ8k7hOcaKJ2vh/Yb0
         XtseAGNJvWTsTqxvs1ZyURXehfSOU315s31Fam3G0YMRfjekFeFREYaqgQZ8qM6cUcFy
         4GfRWaOJZrhmcjm6XT4Swk6FneSXVR/BdS7aK95bNGd4tqFSnJzc7Dhp0ZtYU96fT1aP
         xWHA==
X-Forwarded-Encrypted: i=1; AKwUvBxtmegK46RN9D37zVKqviwrsk+vPLqzsO9MiWZhjDlxJHgTjCsj8YxHVHm9ibW2UphgYzI=@lists.linux.dev
X-Gm-Message-State: AFq9FYKeQgZ650SZY5qFawHpfEzunXMOufiYqlPjlsQ91bUb8q/RkC/h
	A3eQNmJ3FOnpc9zt4jGPhG+8xi9+pSnFm+gqbKl63WXihzyIpiF645A3wOGGPjc7vWN0U2u0OWq
	uYSW35R2nzy0VWAdzHNA9DGVxAQ83GbN8XVT7TOh4fiQ6+EfTtBv7YB8=
X-Gm-Gg: AYBFou28ks71q17CkT7PvKJ25DbKD22u3XO+npoE1+YBTxcy8ARnQ1iEHJYdEKtrr4Q
	9jqS648q2Bz4+/Nz+skh4JXgysLgEvkQBEo7xkq34vEIUSXcyKEsLxtaRFb/H+0IMwwLrohnivN
	C8Ks2OhbuE0Gm+KfTbqsDTfv6SzdmwjiAra7Lt8eSqOU6ZZ61vmdg3w36xIuku5VvDL3SulKHT+
	AFEUYFIWPAQIftOqO9vnjhzSKL5fB4sLUWUUyIrjh4d3Koj8zO+X2nTFzsEP+bRKushrV8AWbuo
	vIkeDY+1p7/lh38ZWEY1EWzUzgXgpv+/ABXCQM+dDu3EWXRr6FfWP9Hnr7o7hiGkgOsyvJb2R7Z
	zDj/61pewZ9/WmQWCdlz2Ug3w5ZhW7fEQyKp5HKmDcLa+kUJTg6XSDj2VnzSgot/yk0nCpsQXSL
	cVrmz2FNq2FSi4
X-Received: by 2002:a05:620a:448a:b0:93a:3d67:391f with SMTP id af79cd13be357-940ef7d5658mr870028685a.7.1793013025182;
        Mon, 26 Oct 2026 04:10:25 -0700 (PDT)
X-Received: by 2002:a05:620a:448a:b0:93a:3d67:391f with SMTP id af79cd13be357-940ef7d5658mr870018485a.7.1793013024566;
        Mon, 26 Oct 2026 04:10:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:52 +0200
Subject: [PATCH 03/35] drm/tidss: get the panel type from the embedded
 bridge
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
Message-Id: <20261026-drm-panel-funcs-v1-3-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ahWXP0kp+S5t7qf5z3TmyzjNxmZan19MSz4+hCT4HOY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUGItgb6kKK4AjO3W9Om73g2vCXma6yznbKl
 LFUKHSAbf+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81BgAKCRCLPIo+Aiko
 1c1kB/9LbGiOdDtx2eRR0gizf/fYpmreaM6z8w6EdAOFy1t/Abha1FUFd3caC3ERdnTesJb3RMt
 MQXRJn836BfxLcfr9grvPR645KCe339m9p6BgSfw+vPkemOuMfeMue4u5SDVupVid25yf4z7/0O
 /TXoov8P6bhXWyVeULl+m3JETg3qSoN99E9vQSJYSVTlWET+ZjFIjiHJfBHNNzKnVHYftfAHQsr
 VRe9z3PgswquJGQe/caiFzqlKOR6D3WWeU8ZHiOdVVf46Rm8u/Cm4seRvZ88SAHSwh4bHqD3nZD
 uzSrdXcMs4kpU2bLoFGLD29eYswEr61gzU/IKo39B93AULEn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXwfuS1DE4IIRn
 7GD4Di8dgZQG0dtZlNY2SqIG7SOkkvWffxjIFFyxbhFWNrJ6SsqQkrNjFYAPKgaMurnTt/A7X7G
 9j0Uq5OBhpDJlpM6c9yWtSFk9/b2/UI=
X-Proofpoint-ORIG-GUID: cmDm9qX0jM50Y6MYNAhH3X-Pp7xAf8TE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX/J8J3YyVIgPL
 +JY/AVi1ouh5VeZSgZ927toTDIbSdbjWW3pATXB8jwLsXqXr8j0cVLS6LePV6IfgU/+QKcLzI1x
 WoUC/SoExkUuiNMlARc0oWgywq8z0C5cxNvgtQwrWeMavDFr5xLrBE9dcZ9FgRWCfJ3JR6oTh5E
 zeNgvEvJsnA+ikrZ3IJj1kDdyu8Sef0IVZLWXyC+1Gz90BZVTFOchnL3wcE/LQv38JqbgHnn0W4
 +hUWs9Y2JONfqln3T6doGvdFbtWHfnIfsdUw74MDsRz3fb5hBPG+wCOEkkb1yEq+p3MPNHpOSeC
 mXZSfXoxwl2iW6jDDGmB+SO+GE+UaJbhGOSP0A8Y4mu3wLrJYOTIq/EjMiMWewmYCy+vehKf+hz
 PNgXIug8PQp863Eg8AAotMndKT/xP+MTmty1p3aG2JgMGFpoHrpzqFFEF9ZH/GOlinn8jocaG+l
 Czb2VbYq/ejo1oEb3rQ==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf3522 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=PT7dRZsv_P8SEcnFsy0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: cmDm9qX0jM50Y6MYNAhH3X-Pp7xAf8TE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The connector type of a panel is also available as the type of the bridge
embedded into it. Use that one, so that drm_panel.connector_type can go
away.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/tidss/tidss_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 70c14c3be10d..b98a48085db1 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -181,11 +181,11 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 				goto put_panel;
 			}
 
-			if (panel->connector_type != conn_type) {
+			if (panel->bridge.type != conn_type) {
 				dev_err(dev,
 					"%s: Panel %s has incompatible connector type for vp%d (%d != %d)\n",
 					 __func__, dev_name(panel->dev), i,
-					 panel->connector_type, conn_type);
+					 panel->bridge.type, conn_type);
 				ret = -EINVAL;
 				goto put_panel;
 			}

-- 
2.47.3

