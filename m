Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013031;
	b=t6RvxFb0HgBm0l9vaEKWUAg20soKasr3pVGgXpVC7uioVYmy8eTR2qxfQJbqiyohSrL5
	 bnOXBm350wdc8wuXprlxPpwdqyYh6yHpCJd4nhuXPgPEOd2j+fm75SoIZy6NKUAQRHuSr
	 klPmE5utCoAwNURRD2UxJA3gkKDAdn4HPP+NQjCI+gNXO9KvypFRxPaPFdKuE8bkytMom
	 ZaPR0apinuINfNQS90pqbhnAN6xRvho27J3aC6as0xsmDVNbvUEF5xuNVdFPLM+3iKLqD
	 VFL2UKZptVs/i5MGg44dxOi3KZg0boSWgx3PWR0nMuzHWeVsE2e0WPG6Jzhx1A/U5AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zgBVubvBrzvafXQTnrX5uUX3XOFZecFzhwSw3E4Y+cA=;
	b=Cxmdn3u5Vh2jBC4jI5HC15TjG0AMXQy/kEuOQsb5WbTOU+uRMJtBBMqpsmWxuW/ohk8y
	 /mbUkzUeMtdoiU9kVdi5CNrMCLuZrRiGDoetIhVvef3LbChSj9U8b3GaXqUL4OWCtNYf7
	 vbiBa59hbWzV7/g1Y22o7w7BJjQq2ex/bzYjsZJ72mSFTheq9/ZMwA5ygTgwc0fDAX4W8
	 DbOK5DUJbRpdwvA1E+Ra6AtTlsch6bSmHcDVuSBx1H4FkQj2ckixYATz0fsVpNc4UCC8p
	 vqnnycjaNT9qXM3Wp1SgpLgtSDgtL9/4KZsQ9tEpxVE5y2Ai0nwME4uW4e/PM2souGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hTKcX/hv";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJxm7xYU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5009060A263F
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5009060A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hTKcX/hv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJxm7xYU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt8r74126455
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zgBVubvBrzvafXQTnrX5uUX3XOFZecFzhwSw3E4Y+cA=; b=hTKcX/hvAbobszuB
	YPUN9EjI8lUgXGaC8M5LNILHs8TL1bq/LJVtMRCzussCz6i0U9wHqU9G99Dspll/
	x8WMfGaAUJ+nWN1dgVbMVSKshSw86xJkj4Zu+nZ7O9ZQkUmHFJpt0V1046Lwv9MT
	PKC0YSQQXkLvGehjQeXA+e8FiYRcHYLguWQD0Vg+5TVWr+8zy6AqSUPCCZxWrdoe
	9S/cpu9OQXeZKF/06S3n/R38aAD23938C1PbH9EVO3Vg4CQ0grzV60XtgWjHpCxc
	GX8dXl/enh24KBXe8QUvPpW/P36r89+zz8lLLksRgSNP2ZSIVniDzsSJCxMCPsFj
	iJXK4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpt3m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:10:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so719917585a.3
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 04:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013029; x=1793617829; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgBVubvBrzvafXQTnrX5uUX3XOFZecFzhwSw3E4Y+cA=;
        b=PJxm7xYUtxqjDTZzNhBXa9NO/SWLuG6V7TqqzasRVP0Ossv0FFmaQ5NWFsarH39aOg
         aM/1gY8EA+EyNRFeNLOzgu1TmhNsHVhHuf6LTCn7awa6eS53bOX4MCk0F9LeRkqIjBiQ
         2o+tEmInz4Iod49vrSUGyQ6xIXQcenoJInWyUtJxtGfrTUiWCZgBIsc6VPyzvdUIYN1w
         1UdkD97YA7SBYZxlNacPAXa8/mGxejvEQw2RxbbsigMDrGnjxnQRBP6/1LikYH0mE8Pl
         eOeU/3nOpChemfdCF1IA676+VOGGE4rG7mIsRUzda+HxojxPu030g9UFJJr0kbVjBu5u
         SVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013029; x=1793617829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgBVubvBrzvafXQTnrX5uUX3XOFZecFzhwSw3E4Y+cA=;
        b=wOP8DZiPKqzfl8Wo9vKsXjj7bs/QDSKyMzlsYO4aPSzQ6+RQdXxnyhBAb2Kx6Xwjfw
         pM9809XLkaCpU5Ld1nWTeV3Hb3XSiFujuWpqU0wmyS+abIUq7MwVN2AcPVt4hnQPLHPl
         Z6I1a6soT+9cahhJ4AZyfeszGqFNeCLTi7tmpCvEjHTzW9XPf2pBZ2plC8xkrCc6nyh0
         NjmviXhjXsBILeEO/OILQgTvdIoJw3e3XSyQ2YLQgpFrhm2Oz0mYhpuoQ5tlInbmvCq7
         Sea81qEHvlFK+2/Xasp90GNneAf0xRn6FsWXMgiFnoH2hBxq/ZI9AnCz6SymFqn0MdQV
         gCNg==
X-Forwarded-Encrypted: i=1; AKwUvBw14L5YZg22ub/qXsKJvqhzZPr+wYegiQAugi+j4yJbH91MgUJL9kEVhGhE2KypAz8w5ew=@lists.linux.dev
X-Gm-Message-State: AFq9FYIU7wGYq/MYHJZrCudXKiDQD2LVLXXPVxTuZqNkyWN53kDA6G55
	EzrpCgiCH6g2aCgoVlyfjoNh2oHY234i+E/jVPUx+56jcPbF5OGnYUOHEUj5aMJ4TPyq+b4crpx
	aHK4zVBoBVXRQIj2mbwJ4w9rhLM5Q5NdsOLswcQZR9gE7Bq1Za8FGanY=
X-Gm-Gg: AYBFou0YllZ6eys8ReiFGIKP4TKc12Lad8xOwftbtUg549oSv4sCg37XdMQ+zrm1Lmr
	+c7lLkEIgOI2jkFRLvuMgAUOKl+8RHdAPdUdFtS7xRLh8uc+pdQQ7awaQ0kKIW9oeg7pLSOqmFx
	qLh3aj3PCGxbGs6H7X+CgMaNK2h6Kb5JAPmMc5joD0X1csfx1fUxL79vDBxg+bsyUUYtQscXEe7
	XbRQEUxUxoRd/7eCyGHptrpxICaK8Grhat710M2iZvNi8DADyVb5s9oeMt3MaUTdwxyvu6MrPat
	+wGKeLEDrW6AnSLYJn4glAn427hdINHpSySjBUs5Vm6NjUTnqAJseR2d8nCEYryQGF8Mf0zSdiW
	s2inpH7brb1v1oK7BCSFCaKI/lk6PxI8Qrp15KN00nRgWCuatLMTI603Mwc7ikSQ1NDr52ibUnC
	uB6VJURIkPODEc
X-Received: by 2002:a05:620a:4592:b0:93e:bcbf:4ad with SMTP id af79cd13be357-940ef8d9147mr1045518685a.33.1793013029400;
        Mon, 26 Oct 2026 04:10:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4592:b0:93e:bcbf:4ad with SMTP id af79cd13be357-940ef8d9147mr1045514085a.33.1793013028876;
        Mon, 26 Oct 2026 04:10:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:54 +0200
Subject: [PATCH 05/35] drm/ingenic: use devm_drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-5-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=962;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0G8nvH2jwU/GqDia9mSTmMZmW83QA7NQZAEK4aHji8w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUH2B0PTBBD/iZT/eW87recaBbgn603e/96W
 SBJrH/4oE+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81BwAKCRCLPIo+Aiko
 1TlMB/9HDdJGY26OzszCnJMG+XIe/mi8sSBQe6BKmfM4Dw0zRYxgcUYli+4d3Hd6z0vkmnD6VUg
 hY8k0uPIGIIJpP+tw2mKYqi7npQmbDSd/aG+qrXxjyvMN15Hj2bBFWgP5+Pb4cEGV6LptqgIo65
 y9uTDV0sHCs/SDhG8Na8tMtdh8ITqGd4b9JqIfNe+TTXNFankh4Tiw1FmGbhsuX4UXzzM7sqfyH
 GqWf9cLMnBQt6Mc7ZHhjQo4/d9l92enY+C6SZV/H6Td099rou9ZQUCRwCmOfMhNu+JAYD9bABvS
 t/uho+3UG78+0A6eAwfm6Ygm/yasQ0BrHli33I9wzRKFpmJ5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX6A0citCm6Y7B
 ykrEyb+10CM9mOPf8fV9V9fJ9P7XajLkVaP2lMB5xHTZLyg0BwTzGzXNUFQO/i2bwMhD5vQFk6e
 UBhlSWgPgiNIDxcaOGS2I2waSCDrK0U=
X-Proofpoint-GUID: mVuR7Ptp1TQ_TXih-uOB9juVvXoYkKha
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX2u3Rf7VE+b2a
 oVeKfXBF6Y/S6y2NKcs4+8qHItBmNjkjo1fK5Fh+BgFeuYkGeGRAJTHoXQMEJV5qNeGV4e9WiR0
 20Q/o3Or5yknddTqOYMHsvsC7aqooIdkwaHNgkQwFjEwpJR58vTMqJqWmGRrI8emENqs8rjCIh4
 OsXRvBcgY0+UO4uV/x0XH70Sb3V9/OonXwhAT4bssJkyc5I8e6KThaULvtN6ur5iWeErT3MWTf2
 lMutGMVOsqqXNKieaZz211bsKpzpnAikzpVUnTXAv34VjG2OxKhi7piDvZ3n9mvLM3UcB7vuBFt
 A17/76LUmKGjSqaQ/EA3HDv1RiwPLr+PFLeukM8NCSUAju9TYtgv4Kzr7QtytVjEaQ4noVYx/tn
 UkfhFwzPd+/Pp8t1V2rc7IXXwLm/r3onSxzd2ugeDPjzF1ofFSML97Ok23f+hByKYCpXvOcUIis
 7l0PBLVq8bGXauNTpRw==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf3526 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=nww9MsHrn8xYauqU-SgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: mVuR7Ptp1TQ_TXih-uOB9juVvXoYkKha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The connector type passed to devm_drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 625ec76cf04d..cafadcd2b765 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1298,8 +1298,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		}
 
 		if (panel) {
-			bridge = devm_drm_panel_bridge_add_typed(dev, panel,
-								 DRM_MODE_CONNECTOR_DPI);
+			bridge = devm_drm_panel_bridge_add(dev, panel);
 			drm_panel_put(panel);
 		}
 

-- 
2.47.3

