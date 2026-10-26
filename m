Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013061;
	b=hZfxoywxv33dIQ5iZ64qjbTnO47Y+HnRpaFlBhes3Y9QqGrfNIINtRKc/cE9/XRGDYkf
	 T9POpxJ/4PjAUeWwR+juczDRlRvD+fBNGNF930P0YXiGh0jNqY78Ai8teRS5k14Yme/fC
	 dw7Kia5Cn3fqbanfqHSgaPed0UOeJaFHWaFP9OLZkdhk/NKQti3m0am6beE0LLTPXZJma
	 OS9o3/WciCS5QzMuU94iA0a+H9GWBK9tbBUSPoAUWzoR4wtsNfscvXWsISTg0aLpD4Say
	 zHB5IeLzAG0BMZ5gDJc74A4gH9+7yDj6AMDbvMfgIk5265XoHLWADeb45P6WmNhoedg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rebvWxCr9+Ge0kDc28vUG6xfscS8hdlfWlfBhz5l458=;
	b=odrjMSJ6Nrqx5ui1t6kqt1KA9E5sUijvfYLpr5DbRjmIbWTWCAgDMzYUT3NeaXrCtQGo
	 WyTJnr2H9asj2ZAq0i8pk2lVmoP4iCHS5aW3iyxmcj/EmCeOY2pu7uzsyRwg+GSgGyZwi
	 gpRzJS+uqjY9L/ZtjNrlXT4RsM5JZGh2Z3DIj7/JCCaeaNSFVxtnqYgPZQrebFqobw9Qa
	 v5ook+8smAdaDlm3r5AkEOdHAHPmmDbtrbVIgocwuvB9wRuk8RBnneldUqX1q0rKL0i1r
	 451L+Tz0G+MorLx+K/SJdpHWzWNHTH5lNG5AGUegeHjM9Oi8aGIdILq4bQpfdPmuHsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CoB+I2+S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ilm9OMO0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305B3606E72F
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 305B3606E72F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CoB+I2+S;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ilm9OMO0
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMIk2541984
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rebvWxCr9+Ge0kDc28vUG6xfscS8hdlfWlfBhz5l458=; b=CoB+I2+SWv35Qtor
	L8GMhL+b7WlxecdNbWGNx+yPxRVOLK747fIkTb4GgJSaAtEkXbxeXhiDg1sCKBD9
	4ovFGGB5v7fFJ7Q/SWsjoy7VwfWCJQJDO8jP3dOuUhGRuAk+Hv8gQGqenkbDF6/X
	u209LROl5Vi9P3ypaj5N97DDDNR6gqlGWsxlK2Yzi9v64uvLwZ9Lw5SULLUWxqRP
	9uuo8DNb0WntR3VxigvtFclO+9Mp9sOhuBXQ5iS4Xy4diS7cD2p7uiZQZ6rcZ29D
	XZAQ/dcvi5uXNTIQcvr2BXZRVZZE7h+SkoM1YIbFfl3dhV+aJKIm7l33YVTtUjDu
	+X4QjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjda5n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:11:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so640572885a.2
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 04:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013059; x=1793617859; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rebvWxCr9+Ge0kDc28vUG6xfscS8hdlfWlfBhz5l458=;
        b=ilm9OMO0D4XHvE6CEfMx27miFb9LG8ARtL1D2ZqJEP5BaN7k00JXQLVZaEA9rtqd1R
         RWFXY2jbjn7ePI0bEyYJLse8OUKf0YsEqLI4Bw/sTQUxBqMZpku22ita8SjNt4LzjP8p
         /4MyOhCz5+mD4mDphaxnGzCGwr7Fx036rkCPqabCQthTbixGV1nHMwbrVco7NT9jc9el
         HYIhpDsaB5OsISfHx1uSrmUV55TvJDz4UADV4rZ3LLID2pNjPLFbWdUUrkdAbVx5+nBP
         klgcgOF/dbNO26Imq5ePhZN05w0TuM382PmBbctZ247NmZwoGImgPeiSevxnCVyfRPQW
         X3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013059; x=1793617859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rebvWxCr9+Ge0kDc28vUG6xfscS8hdlfWlfBhz5l458=;
        b=sj6Tlqur9/XQDd83X/Niad3ZM5yKAkuT4vUTqCsVfEvH4fcto/46byisivVCncSfKT
         lb6g51LUVg3w82TJ0DsboppAEAN+04MoGDHJli2Vza5fHe/b1lbHDl7c8aHle9s6wfbY
         4pMw/N5DYI4riASywjGak1smHkg8tTpRaN0GK2A2CJJIXMuto+1QJQqE4iARF3zEGpI+
         3JfHg14jbyVRIi+jedwM1AA6CISdAGNKCBiWsx67oNReoVTx93z5CBEddPeI3gdekwk5
         C0aLEl/CwoBgUWhfnzjk2QS09s04JC0QQX6vokjaoEvOOLw3geZpjiXyA698WbW5PPP6
         hGjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYDGuMxTp5f4C57w7sRdFNfcDS9l/IoIE2jpfXok7P+9rmGhO/8roN4R8KOMA8rckZ1Dc=@lists.linux.dev
X-Gm-Message-State: AFq9FYLRMsUAMPnVT/KdqIRy8IMGRgbRVvApVQ7IjSBMH2tMYmhJOipc
	oWZ1Uu/OTMNgf+paNgAwFsxrROqgorqiDk1zr8AToje/Y21DdNx4wRw0WwCGFbOcjehEngpgqyd
	CoakqK1u3wivvQfaVwwfVjVw6kPEzrsKUATGmkCaaZcM9k4BvmW6OE6Y=
X-Gm-Gg: AYBFou31BKzbztkHK3UYA8VpuFtycALmqX6TohayakCkVmad3CtXbNbIRA0/iHLVqXd
	XbbSWMs0Grd5y2Lo/ZJ4hf8ycdGqjn8drwp10MmUpRyD6kWO88OlQwVAsrsR/iFNiLmL2LH44JL
	BWDycaylOX0qJfTJT9iQG5BsDRsXE+vfd8+V1K9F/5mZfkzmksMMjnogOoPzoQ9yUm2+XlMI0SA
	tNO3v+n0Nj0ayBuphDqe3SPdlioQDNnGqdSmYKnWVQDFnRCDVsfAnX4ybvXIkfNIpxhly5BC1kQ
	okOUvNc2wt6eTrf4glwpr7k/zdH2fEz7rv1bUhUobNNg9ve21QwY6JWRmTk35Od+VoTS/hz2GHH
	+zzHKMphRzIkoTP/EOs+rWpRLSEl+UJKrMZMzWdXEnZpSizeF4SoC0sP3fShcqKAqi81ZFeJ6wk
	SJUXjPDAmAYCpw
X-Received: by 2002:a05:620a:4720:b0:93f:5519:5e87 with SMTP id af79cd13be357-940ef7ac1b0mr958739185a.4.1793013059054;
        Mon, 26 Oct 2026 04:10:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4720:b0:93f:5519:5e87 with SMTP id af79cd13be357-940ef7ac1b0mr958725885a.4.1793013058439;
        Mon, 26 Oct 2026 04:10:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:05 +0200
Subject: [PATCH 16/35] drm/exynos: dpi: set the panel orientation on the
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
Message-Id: <20261026-drm-panel-funcs-v1-16-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=928;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CZFt1bBeZJSZQXRLfeILapG6+I5U/Cgs+hD3WY/o4/o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUN6YdtgUzCeo5T63KQnD/ShNUM3twfrzjxa
 JKBXHlhMg+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DQAKCRCLPIo+Aiko
 1RaJB/9FjTGyNUxqB20GbVEDkLZ3czC9tui0A5a81YkHH5yOQeYmEHwdjPjus3nLIDjcc38vLCJ
 1HNPw79T//9xux606CATnWJ3HkM/CcQQG4ErEaZ5jcYplsMFqFCRWPJQF+wkiVXllMb4VnaRZmc
 LMeYEvSlnozCScMtCAgma9qOqczJpeMKvBe7CJ/jfyecwQjCui3sVY7Co3VjjyAYdqgltGgnclm
 6XlCriXjWT2SPOezJDZ/vrH3cMoicwlexf5eF1V6V/UZueqvLExaKnhhJ7KziQqNDUDWoO2rV8u
 euxMxnZ6TNLYBs2ynsod8Yf1sYhlhfEoUc4CeK3326Xx80Wy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 0VNr8tWb224k-Yf0BOpmCYz5WGyK8I4I
X-Proofpoint-GUID: 0VNr8tWb224k-Yf0BOpmCYz5WGyK8I4I
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf3544 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=-iJ8zVrSboFU4qp5kIsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXz590DzMDED9D
 UiE2zrYrV8qkiENH6GtIx4lcpmDfgrd9HTaW3a3cmhh6/t+0lXXPAwkCQSwJe65ZzzlEAX9SQKZ
 2pdcmqVRQLz/zkXqXCpISvBzOgyk1Lg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX0BV0OH0CfJgs
 c9z9iSS7829qB9QWrNqeX7nV4arhNnW1hCT62HfmcTRX5GEOYMSmxuhCFpAtm+Zcx4H9sJhFCBO
 mkKy3P6+Khhle+gK84+0FFwbsqEhWURXPdsMB5nELDUoFV2KcI3BSrRhlcfEcgRI4Zm1mYZTYmf
 X+94v4C5dKB56ACwxTiPhhg/wWxADiZ11kUFz3tdjKeVDXBZTLjyED8kzbp3kkOZAY5sVi/JgSH
 KL3V7MaYfOublP4E7X1DUi6Ycn843tGfphH2P4/DP13ipMIu4pJG1E9/17pbzCr0X5yc1EdrjQY
 pu3cOt5URwGGFxOk0hpO60f6oTvPDWwrR9l49dSAIcVMWN0s+ZkA4auGAjIIXKEK13vZ0dXZncR
 SpMK5nT1JkLzAt+TMJ9kQp7QHCNMZ9De8e0mjukaiSLbktTkFTNbMomr/wssQos1byQFqrKPyxV
 a9DIKZRbRBCKMVg5QMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The panel is used directly, without the panel bridge, so nothing sets
its orientation on the connector apart from the workaround in the
get_modes() of some panel drivers, which runs too late.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 74d3a2bebb74..05014c2e7d92 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -109,6 +109,7 @@ static int exynos_dpi_create_connector(struct drm_encoder *encoder)
 	}
 
 	drm_connector_helper_add(connector, &exynos_dpi_connector_helper_funcs);
+	drm_connector_set_orientation_from_panel(connector, ctx->panel);
 	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;

-- 
2.47.3

