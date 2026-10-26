Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013039;
	b=TT5a9N+Nc8CsPzXkOev+fPTQxtLjMHXkKqnKPo1I1Dx8zZNTvJuog86ek2IuxVpdwTh9
	 1SCIn8t8l9SiGZ7TYjaSMeOIdr6oPmQLBONTw/fy2n3fWmPlEJhp2im6OKt4MCqbEECLG
	 E6Ug0MiIXLE8EgzRC+J3YCzgyrrOPu1yO5kd1qO3pA8p99z94HX5JUfHAFhlzfydI6AL0
	 NhVsZtC67OWOV0S05Yw0vfNH4vJEzqzwyqxX2Ve09TcIR5k16SwQs6KQ66XbbZHRxK8iF
	 CHHoUZe6T20CQ92lwcxIuTGuMe2pTFR4uv7xnzd5bOxeGKOU5x9ozeQYeBcGMHJk4Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rfPhrhw7QqfVInWRHaGAOXWVQmPErff7bcKudkQLqU4=;
	b=TodXD22Hi1isLlgIKTkkySn56huNmsou7oU+xq4ThxDOOvIbcc4abTgQRrX80guuQ4Dd
	 wrYdyLbnT3sFRrcw0quto/daT+lJjiZ2WJizGrgEy6XPijeGrLtcRTf8wDXJ+KZfnFPV3
	 Cw7H18iSnng9eTx7U+ufqV9bRap3LTvP7sdO0zYkqWFDg4cblZ6+ci8izRLyjS4g0kVyM
	 pxprexVByNO9ckmMeMuhMquugUmQNAjjusf1Rsojkz9+7udepRfDigcmovHd7RJyPGzxl
	 u9kLL+6HmVhmU3jkaW9MvuHQGcisOyv5Anm8yzpsCoQdFQDbABSEgNBi+ULosul6nZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o3SeSQGl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WogtUX1d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADA260A5BE2
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ADA260A5BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o3SeSQGl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WogtUX1d
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtYXk1547975
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rfPhrhw7QqfVInWRHaGAOXWVQmPErff7bcKudkQLqU4=; b=o3SeSQGlxlD1ZlZu
	j6N6iic85w2ONYT3wC+38Oi7/6GVPFFUa2+aL4sncrS1hprd3DTTHJvg0o/lOrUN
	23PQliQylUfxjXA+2TxQx2QUzEtkRfXJx0yJJixRVeeqaF9l4l2sV8cQ5OUGzNM2
	bB/7Rx4DfJAoOA0KCBTLzr+nmrQ9bRTnbN9ysYrRExwgSp6VIssuPkjH8d7tXj+r
	c0bUzyKYtzgmm2WbJGRobeAtN1PXuE6AqPibFFQZpnBYYl8tD/ETvypPB2dz0OKM
	ys1ABQ9mswzCSZIe2mn0enVHrO39EpJqwP2UGBOsnqaouJ/BRpt9dToAR58j01BZ
	6egJBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgst5eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:10:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so719958685a.3
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 04:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013037; x=1793617837; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rfPhrhw7QqfVInWRHaGAOXWVQmPErff7bcKudkQLqU4=;
        b=WogtUX1dGHj0JY3zYichZb+qmBK7WvOsvK9S+wtb/PhqCWa9N0NsFYR68KsXJJ1vdW
         ojwq+XLJeX+gHHsKq/1IgDvKSBok28mcemuNwf1R8P+Azx9PQNexg60B0Y+rCz8CwY7u
         ixDQBUa1vrrGGW+vb5jWcie+iQpehux6HDrPbyCTHOS0m6KsTCbzSLdmQqzoUSEFaVyC
         WEMY4nn8M0ykfUMEe20/+CrwTZqH2iFwaNYhYHYL4SjLP4OCfKFlmVJR9RXYMQNL6VKx
         jAz+aMCIk3rQ6gIamVswaP5SHG7jOz+dXU45ujuAFlKiMAxDtYboy+Zv8xTvkheqF1cW
         uBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013037; x=1793617837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rfPhrhw7QqfVInWRHaGAOXWVQmPErff7bcKudkQLqU4=;
        b=uy5qqOm4pBx/FJaxBpQXXhUBygo5GaMNiakoKOUyfFQo7xEAC47WjQiXuVKnwaZOXq
         bqJDimH+wt3EFdU8qBh1bDwOwDJxNU9+BdrjM8H5SzH+VVGLX8egvMa4egAifV7pTxZk
         WtNexe/dRqGiwWLVFSA5TE75vWRHofmCscUq/HsWnYkg7weo/cDat+rF8s/hV5j+BjfQ
         iklutYISuFQ6Yobg+fPaWj9zGOCqZBsrFWXQ577eb9HnPtz4cslrllex/ZGYg+fTRwzM
         YkUueI+K47zJjXsmsAWH6QTRunDx7egZ6yhX47/QCstA/NWpLo7clhZAJsE9iC8va1ti
         I0zg==
X-Forwarded-Encrypted: i=1; AKwUvByRw1/lrfNsqo3EhKC38wj/m+agc+xMe4uAWgmfqEvnTeQqj+548l/++lFeun96d/tfOr8=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ6BlX2xC4/iFS9PVPSOGAingGguN9Z32jgPWO3loAKzo8KuNiK
	Oe9H5wz+uYg9vcyBg8IxarwD2Ig0tUUnhIKqaLX1efkEtsaO0vCx2eQptnyo0HQ8zNUkNJuZ5f8
	k9PacJknreshha5V1tlB45H2WajkSyqUQ62FqSXH5TRdr1uYvKdn5Y4M=
X-Gm-Gg: AYBFou0Id6ro6E7v/2FoawBNyafvsRrBgllU9qb7anDcwps+DndRlCiyvXPxsT6ARqX
	Y3u3hgADCyFKgPQ5m8lK1LBejhmWgwYBDm7OTToIbxxQ7ubQW59rIqACPOUyOV1BGoUdRLLDV+N
	Q3EF26ozRjjscwe+27LIFql0ztir5K6ET/v9XutVcDjerjR5esjow1zjpVWll7hPmRH/LMj9y00
	HrB6ybmcNV1wl9CDpReL+UUPVpF3Q8x5yjdWXULIdMZQZD1MDcgAqJx3ngXriMTuLCHXgG44gPt
	EseVDgRNVwQFEfzUjPHpUCXBfRVi+1SWlKkLdhfb78JLuTsB96xI2Klwi6WDy1Rcy2eec7yCpFB
	MITggTyb3ACmtCKjKmKkMKdPNTG812B8edypLpjCYEG0zAObx9EBKik6SV1AuAvCo2NsuFA4k8q
	J9sU8ayZjTqHUC
X-Received: by 2002:a05:620a:4043:b0:93e:c12c:fbbe with SMTP id af79cd13be357-940ef9559b3mr968993085a.75.1793013036562;
        Mon, 26 Oct 2026 04:10:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4043:b0:93e:c12c:fbbe with SMTP id af79cd13be357-940ef9559b3mr968986285a.75.1793013036065;
        Mon, 26 Oct 2026 04:10:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:57 +0200
Subject: [PATCH 08/35] drm: rz-du: use devm_drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-8-5e3070a3478f@oss.qualcomm.com>
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
 bh=L9QBqBm7svfVSs2q4h7czZX0v21Ts82vCTLjVtq1nVg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUJhK2bkP8mANHdq/N3ftOzv7WccIKtt5ZXO
 6tCU0MGEKCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81CQAKCRCLPIo+Aiko
 1fz8CACOTwp8mMz9LdCKLCqOOuK8Qd2qaZB1SvSzCPhwgD9Ian8Zauhug0X+fdkmI4VjKEebyNl
 6eIlHeO20Qt5hfXfqdwz/ezKE4k93aAYep2wG1S2hfEEQ+crBeN/yowHzi8TR+/iO4f//86+EnD
 e0M8eAye5tkII9M0Iwm0aO0L+FqC2IIBirkJUdokHuBjpGeGSEjleYPkCsElUY+37QjY+2bDkGK
 HbDOBsf0Ey9N/Pv62g7KU2qjneW637Tc1H/TcF8lQ2elO1nM3Pcf8J6NxmyOSPxow7TzT8yi0s0
 MAHYZLVEY9W2W9Fg9FwCn6im24F5casNbP6xXhX5rdBCStUL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX2UeTsCfyYZgX
 YPytvtoKFCd+Hu6HXtpdLq+eNYfdbQxhIEfSvE3NwLHBiP9PfXh5wemoTEkYfQ/JAMMebT2bH4h
 O05RPrmuEpi6bseM9qc/k0cBU+L158Q=
X-Proofpoint-GUID: 1juY7J-sT03gN638aQFbLK6w9Gg8cRPy
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf352d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=BQQ5wuhf5moQr-eOkAQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 1juY7J-sT03gN638aQFbLK6w9Gg8cRPy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX7slm2UegoG2d
 0Q4vN/F5r9DZWJEymBrybZH/BoI8J2n3/Wx7wq/mfbQP19HJErx1CEKjeRdqIkaupqM+2/YOdQm
 tc4M9cdjFKRWMVgnMAfN6ErinYkuVIRy2YGbNF75Ox6yYbSHvPdNZJXAVsaM1+loG63GibpoOiv
 I5ePgzRYU3g4ZSUvGMRNvzLgvV150dSTOBDUjJ2DDEsV7dc7VH6rLQ6BSpLgjrAe+J1fbS/+Rbd
 K74nE0MKL5tBOSkOJ4O73b4RHQn5nFyV7w7ynIuMqQ2IvzEs4hjhE9GGY1hmt5N3vae5U3f1Rvp
 tHQfkaS6VO6uNmWARnPXQBW9prJjFTgtKAhJjfI/XZvNIC1nbggZkJ07QPSBBXN9kREiUioUtgC
 lQOBeSC4+QRKhm6VY7VukNS+0RZ71b2yfobejMqpbzwovlwnq2yOCYPyr/6E2DbD6h9STaCp5jU
 tLrZu1fk+52SW0UFbBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The connector type passed to devm_drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index a1b48973aa8e..3ba28496e948 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -112,14 +112,13 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
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

