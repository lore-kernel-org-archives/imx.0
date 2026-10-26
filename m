Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013064;
	b=puMmLY/6NTDBRYaF0xx9/bMLkyAu3z1YJgFwM6HY7SI5N8k4ZWjaqJUQUkoq8okZc5Gm
	 ax/Vv75u33hPDmgnAPriKqQKdlHot8Ge9NCEYqBkIVZFc5daNeansbnQzubk3wOZhZ+t0
	 0rYZuckxiCLG8fJ8jygN3PRLCELqIyKKpQ3K+Pf8kjIWEbRtgYjV2jJ8j/R1YbIRE5A6g
	 GrWaeFZdTPW7Sw4X7vrXNBdlrDk9F5+9B1N+1AyGd6zF2TKTffP49Y2c+ZteJy2OVChts
	 Qnl4XVehECRFp/wDMIEd/RFs/PNADRCP83hEDFAraTNRzWC1kv80wzuExgaaJnafFEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vY8BWoJH8w/x7seYGIIKWtBAXqP7TPJ+H06hDuNNvmY=;
	b=gNrVEvbObtGyG+ltJ/eKRABWR7Q2SqDoeV02vV6SDHYsGiYt0ofBMRuGUMoEayvsWfnM
	 0YbqVyQdprqHazLs8C+NZpF75n/rfA9NrQvLAK4EzM1ZllDfw1iaeypY+qN87QCPK3mft
	 8edYfvL96oil3y0YRwdbQTJBs69EO6EUDnrNcDXV1Ru/BoEXksWtamFpY/xwIGJFLG4bX
	 kiQnHa8S7Zs3pp0u/crzDVctX2zzMewCT5qK9Z3e/57G+mOVsfK6gbECxZ85KIaPdmm2n
	 EeZ7rCTTj4SaYZYYBflA24bzsANrRz/OIsFJ35URHHV3+MWp7bxTD2pMUKxWzjv5W3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CoNVTt/w";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PuwONRil;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC5E606E731
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBC5E606E731
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CoNVTt/w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PuwONRil
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt0xX3631949
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vY8BWoJH8w/x7seYGIIKWtBAXqP7TPJ+H06hDuNNvmY=; b=CoNVTt/wg0dZFClx
	IKMDZ7tlMz+/NZn73DytzEzpH8rMCz2JqFK+bpL6iVSbKYS64sMCiau/NPeFLMQc
	qaN2SPZosMEXZQQ1v9n13dzA/0NLEdG124wtfe+rFuOoePloJRl0awLDq2OQOs+W
	SO7D9J49wPSnd3jrDGRH1LCsmpURaI4vpnbP1t74IR4R+dsCcHJAw4wd3rfhhZQs
	kR5Tm9g0mkTjSEDP82haOZuYqFwIWpAGnTjYpWJYlLGsc4GudFJFYaJv2hop32FN
	Mm26/TxHtuMTR6+s8OgmAPhPN92oZAkirFyg/Yy4tebL2tM0kdZ/Cq1BGjqSqUsj
	wZZ7cg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf07n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:11:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2373e9b4so291036385a.1
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 04:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013062; x=1793617862; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vY8BWoJH8w/x7seYGIIKWtBAXqP7TPJ+H06hDuNNvmY=;
        b=PuwONRilzqFfWKANewhWqbLp0a8UEUi6QphBDIgmOenux6gueuYnxP6YUMWdSSlVQb
         tuAurtfYJmiqy6m0JNAEj3Atg1lJa9jhYu3eqFnQhstRfXl9DwizQwb7aO5nvxsS7dMm
         ujXxIJf0cV2Jx3NrdDUBAk4u+90SGOQ98h2qnOJiTmEbv1/O3j2h9dK1mlBwYT7/iC+8
         YbbmEhPyt5GihWG7gqLa+3kdJI2XfglUFY+DolXxuZS4POgupZFVS9XpGl6diZF65C0S
         8Ctq77fWeu13440LIrRd6hOdTaWD3nE0ySrXalMqXdIAhGM8qzC9bszAWBHblaHYYA3U
         L93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013062; x=1793617862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vY8BWoJH8w/x7seYGIIKWtBAXqP7TPJ+H06hDuNNvmY=;
        b=iPS/t4Zab0mzjxovAQSWMDDz/V7ZIFdG47AmANYWDMUsU81TeOutH6eOidqG70ZZqw
         KE6hMqHTwRgynOeBFTqW8ZUNAnIjionk6+GaObJv/34a6qzuhnUWX1l67x7muU/9Uedl
         ajca3Neidz9KwHLwD4TFNhFtXGxWyDcX3mL//FajnpbPZmI8ClchHxlbBRp1AIYtlzFx
         3nD25mHBM5ulHxg6Y4V9/Cenn9XJFoaoWdgIk9DzjmEaQbuUB8wvw3T01ouI1QadQ4mQ
         em9dMQFCABvG5/zKzP77pp9S0CTYoIKKe6mqdrHqGAZNA9jliMNv23NuQUxa9NgPKuJs
         fNsg==
X-Forwarded-Encrypted: i=1; AKwUvByfRoQSScIACa1mXomvntsobThiO5rc5RwgHoENBBSRGsau+Gjxz9s5pdswyXu4/MW+sR8=@lists.linux.dev
X-Gm-Message-State: AFq9FYIPC7ZfWKzrJcNeA5ucnaZ4hCb1c3ZV1PCDDmD6FKVdleiZWe9J
	L/de7nrx/9ODczZD91b9B2fn/NxdVyReMTTx+JV1K8ce587OjOUeA59joXOQoi9EVS/HMLctUy0
	P7Opk3ARqkF93VXXB4L8bPgtGVDCOBH3wF1kKmpDImYNcxUv0s6AG21g=
X-Gm-Gg: AYBFou3/PUHvvF4CKANwrYDwq3wXCQcPhJ/UiIdZzLqpYl2vB6Flc7mLIaNjpQfhHDs
	KDkyXVk4PdstzpwSYvOL7sbOHd33UohCcGUZ+quFpfOpUWV8k4VYwrLn9w7COb2iChiln5G8Xom
	r1bNU1uxw+b3x2KrEvkNy0zAspy7ATzbKj8c6vQOkGK7OtrC/ukE8TfMFTobLHaXWRdfUtclw0p
	0WFhEKRem/v0FduFE/WGpbUXne0fjM5E5DZh7T/TEtmnfWW3wqDNNGgJbfAxFok9rVJ1s7qFvjJ
	WsZ7g6oobAqemm/Hic3+q4zEZ52ohIADNdrgX5UGJ4rU4dOso8gZu1JIwv9VUjaKib7n/pO+UR4
	wsXyhxVjNjKvg9P7lkQMk8hCOLw2z/b74E3s8qSSsCBsE/IGqOSjtZEk70qCwRIA6DIJxwvQWa/
	jBU+BoNR2INFWJ
X-Received: by 2002:a05:620a:1a12:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-940ef9add84mr1002520985a.66.1793013062106;
        Mon, 26 Oct 2026 04:11:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a12:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-940ef9add84mr1002510785a.66.1793013061497;
        Mon, 26 Oct 2026 04:11:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:06 +0200
Subject: [PATCH 17/35] drm/fsl-dcu: set the panel orientation on the
 connector
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
Message-Id: <20261026-drm-panel-funcs-v1-17-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NybjcCZxaVBV8YlLKaTAyHmm87V6T4TYtZ0TLbzplQY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUOmRe8CEbGjT64KtPnEJZg/5EMluF4tX1Lg
 9OIb9ldBJ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DgAKCRCLPIo+Aiko
 1QpUB/9uR3l3GfVIvTKbA10ZF19l1tvhKCRzqc+3iCVH6xmO7vqg1/9o/l9+GRVdBZJb7Qt+ZoV
 ryAW6z5syuqvIF6XU/Z1zs3gzoaUULDp0z1E5cxM8sHDD2KSmahajUh8mhN5hQpY/NdAmWWRybN
 HhPwxvxRuXM6fIyMbV0HOFGjniWA2/TJ/A48YxNlva6uqAIq1y1+Oj2SbU1jrQCnlvCiX1xkb1B
 xP7jH7YQUa+wkP9/hVqiOMclVILAluZqPYKKB2nJJuKsiQaDPiYAjazAxr+x+vVIC0RJVQaLdl/
 BiAVwbiKmq7eT5KFJTtY7a4PdKMB5tGgv5ni4kck/fYLVSrD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX5Qam5YEwNDF7
 5tYfjmFdgZnorF+ybCfnmeAHI69+8oP8KhvyQ4b60aTacJzjut+sZ3sqxgVj8I9A4ZiQdoGZ37n
 juk6XPpfVoZqqhWMfX2HAb8yraWEASM=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf3546 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=vjBfRQYTh69vIXlwGnYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 8r4mwHoaKXTRNHQQ7A84eAg1Bm1F0LY1
X-Proofpoint-ORIG-GUID: 8r4mwHoaKXTRNHQQ7A84eAg1Bm1F0LY1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX927wdvE04vmd
 OKwLgP7vpW57gZHqbMBSS84jSnqurTJ7LuFGOjUxFIZTiIPADmPr12b0PFPfsPxFekgzxGxqzlH
 U5MWsS7241RaTaMUni2LDMPRVSNSo3F1ig/1khegnZvFiJyf0X7RS4g4+aEuZJEQ9vtcqGH4UXS
 v+GIKRA5LPcmeIDFidHuPYiRyEdypRKc7aEG9KgSnBfNjeS9JzcuzBqTXKz0y2dsqOsriEWxJQz
 C7jOS78ixBqLqKI1PkSS6bvKeThPlo5eGBkSvZ9zROr1Eo1ud13LDvplK/mW/Z51VrCCoDBlKWv
 rafgAd2h2mMHqxoRr7WMD3WNeWNQ73my0pFjdX+96FozaNo1BMrSGH0Sjc8mHXgIBakWuNbUWnK
 IwoXN7tTXnWHAfrbklsw4wn+VtGFYlH+h7l4OVGVngihb0vmcIBHLAeK7gA9Gr38sZMtKRxUeKy
 Q0MTm4tpZsISg8p5fzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The panel is used directly, without the panel bridge, so nothing sets
its orientation on the connector apart from the workaround in the
get_modes() of some panel drivers, which runs too late.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index c64264541fe2..6d42376a57a2 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -96,6 +96,11 @@ static int fsl_dcu_attach_panel(struct fsl_dcu_drm_device *fsl_dev,
 		return ret;
 
 	drm_connector_helper_add(connector, &connector_helper_funcs);
+
+	ret = drm_connector_set_orientation_from_panel(connector, panel);
+	if (ret < 0)
+		goto err_cleanup;
+
 	ret = drm_connector_register(connector);
 	if (ret < 0)
 		goto err_cleanup;

-- 
2.47.3

