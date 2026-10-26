Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013077;
	b=kDMGL/lIDKNa/qwCphzdFdV/kmcOn2dBqYSz7sEfYqnJIIrLsbKlJF6wCbIJ7Bfwd0Jp
	 fHgkgx189ZnjDIsQLQV9iRRk2/XrdvyimRbn0f2K69Q1jxqEYf80aKEJv7/hUFRxxKG3+
	 yCQD/xlm/Ll3q0MbW2kQKPjo0MdxPky0duY4ZL1m7F4W71q4HyL+1H78SRjYv5Z5d77km
	 YjB+tfSBKZTWBr4EILIhGKv/PM/du9zknnCPTDAD8z2tj6/lWOws5MSyB55+9EHWi1Lo+
	 fCeqVzvjxhkJJ656d+L4uK3dDf68VozDSxY7BRvAosQxMGZ67lj6srvQPpgMp8Hmprg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bd/tkiqVzenDqQaerpQa4vrKpCXNrWIRtIeqf1xIoFo=;
	b=adsWtcSvApjWqphEx5gneuml51/D5fdZ8kDKAudAUZEjWgUA0S+f+MSN3LwvWZB21TEn
	 gzhQFaIG20ZOVZ5fYLaACEhjkndzIqCRrdGGAe/fuNutJCdlgQEWvkdhhsuVG1Kb1DZsu
	 r6Z4k46/s2tm9zSg1GSbH1mmsLKSolR95XQQv4uwCwdGZ+AYOhMkNtHGHBNCJMCwVkIAn
	 eSQlabqilIDLVndpXebgfhUIf8eYMRHC6cDStUPc9Uj3B2kM3oL+jlgXI6h/g3P10gGS0
	 GPs/uJVIQ5OrJ1ErxixhprWxmLA7F4Owar94GYQ2h2nhFhlDcLlYXWKJxWmEpKUncUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JLAEoqAs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cXlGjOJo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93C760A5BC3
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D93C760A5BC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JLAEoqAs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cXlGjOJo
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt4PV4132054
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bd/tkiqVzenDqQaerpQa4vrKpCXNrWIRtIeqf1xIoFo=; b=JLAEoqAsBNZR9IHk
	1SGGZMbCjUNPTfrQtsT/HSOCaL1PUEcOFnFZfdHkPORatQTjahNgegUlZcYTwhFX
	mQLlbeqOyqCAtopa7A0Wzzec7z4R5S5MLhWq1uE0iMeluxfeoOmx44SdYlyT7HFk
	aDXQcNxz/yw8kZU0BxQHF627Gx7tvpL+BHrm9w86M1cb59CHF1eoZv9QuXCxSZ0g
	Z1cZAIhNXxYv9dALtya0CEcwn6pC85u0l0sWgl0q6NXg9nb1jinMmFWlAEggKDJw
	97OJ3b5Rn9ApFQxYF2HT81n99CzrrGMXGXqEpfQH4H8Esa7IHYJTWutWxOwVlz2x
	ztdeXQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q05cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:11:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f6f4fe531so518270885a.0
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 04:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013075; x=1793617875; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bd/tkiqVzenDqQaerpQa4vrKpCXNrWIRtIeqf1xIoFo=;
        b=cXlGjOJoHNU/v5vm208fRa+aipOtXeQ+vmgU2L+DbsyU20fNDw9Ye/EIY+xM914gqc
         H4jeCTqWbY65sG3nLEnk9CKx44enVCGnIX8Xv0ElUJ9FLI5CsBxRQY2COXdfeTcZtlad
         xdJVkpWYJmH483kgFn8bzKrAqh9FTn559xDy8FVqq12FgGMho+EGrN3ja9+ECTMFbU2h
         2d7ToZni16Ny/Kpp2j8lK7U+nRUEtw0MhELQV2MHEiMhSUC6+jUxxn0otzQTeWG3U269
         +KvtEBY3Cj47S5YgVqxYwd69FYWuZzY7nDPNwza9DRRvj86tWrg1Vub68AzhiuJ70YG3
         mqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013075; x=1793617875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bd/tkiqVzenDqQaerpQa4vrKpCXNrWIRtIeqf1xIoFo=;
        b=D0dQcB4T0y1MQt5KdZ+FjqFKoJPKixvzyDgwwr9+Ain9QExViRuKILZR+ClxAnPMJt
         QrVW+f047S51CO4W276SctjqD4NqeI5caeUcVCPLGnhnFbVq9OeVOrsCYMI2Gl2gKLOd
         Xj7yUlB98Poe4gvBW83d/FF+tj2hjWF40H9EL1kYkC0FPhpvCXLlZF9iqpfpgJD6y8PS
         vtfKD/5V2JoC9J026GFmXENsyqQnVJ31ZpLoLJ4rYHVsAtpx3t27Y02fGYv6BE3b/aIv
         B1uDx+kxwDXccgcmfOm7WLHlOOozuJZa8bk/3a3a2E3c7pCtQNd06lxbVY6FO+n3hz+J
         S3Kw==
X-Forwarded-Encrypted: i=1; AKwUvBy3Mw43+i4/kDbnuQd53pVFjDfkza5q6+SthgdfIiYY2BTqeUpMspXd7nVWNHpLARvBGLk=@lists.linux.dev
X-Gm-Message-State: AFq9FYL7+wUuBeAwRxdOLWHwzzGPETJE7PPRtn/IOFnTjh7lJIkov+jA
	SmHKlql7cIFE+gmWiZ5CUSp1TyVHqoDGFfoO+4K/cI8h0krWbrhqN1cERNsK010ACmzCJErN12k
	hT0ybz4lMQBnZjfcPnPIC124/KzzQZ2ZOGvhYS9aXJOSHbepaef8FM94=
X-Gm-Gg: AYBFou1U0ZMfRHz4AuTUncIYjWkChoJz9CM9JPR8FBlKZb2UYYzNANZYzhWmWm7FjF4
	Ut+hQvIVpXfCLLBSPB3egfbe/1aDfWCZ2KaDIH+U6pvbiy/b5s0fK3PiXN36xgerGVR3kTa7v0G
	EOSMYVC+U4xPHR1EeAgCqWk9/ARz8LhV0v8y8cN+4TlMCzbEJ8SfqV8b4eny8Vc0gBl65wXSpzV
	ge2gZxr3ANVWnLsKUydq9EOpIvv0t9YUrI1io2l+z8G7LWFIOBVSu4oLIEAGaKxYpNdA9ogCIBV
	Gc/32vAC1IJ0PkT1/e3yrusf8Jdo9qzLG8EBB4iGVPZnOgi3M8tcvjwGkybTOuSC9qsoi0bH56P
	XSU/3Wn0KIE7gmXEzxABW/PDUhrwgVSUHqx9hxiywp1712+ZQMj/T2BgwRe8nU5kbGImF2jqP5r
	X/1fzbIkgl2kSD
X-Received: by 2002:a05:620a:29ca:b0:93c:5958:9de9 with SMTP id af79cd13be357-940ef929fadmr939353385a.33.1793013074916;
        Mon, 26 Oct 2026 04:11:14 -0700 (PDT)
X-Received: by 2002:a05:620a:29ca:b0:93c:5958:9de9 with SMTP id af79cd13be357-940ef929fadmr939340485a.33.1793013074187;
        Mon, 26 Oct 2026 04:11:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:10 +0200
Subject: [PATCH 21/35] drm/tegra: sor: set the panel orientation on the
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
Message-Id: <20261026-drm-panel-funcs-v1-21-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/outNjSURWZgfU/axTPqoMDdzePU4xE3WfSUxwhB5XY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUQf2X4xVHMMwWYkcC9NEE9wb2mDewMQuyAE
 0As6tLwmSiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81EAAKCRCLPIo+Aiko
 1arhB/9sqDRp4peKgSFVx7h0COLlGN3vaVAt3LtxYz7eCenBFXiKoOGrHw1rqEMCCEB/y+a6Yza
 tFckli8pctkchrV2Y0HQpeHAgIwi93PSI4jWe5dDSuQtgc4JfIgs2aD3mnvYGM3FcCOdzaYadsT
 Dl9LbEYK3sUeV5a5oAoD9mfKi9P2/f7AFlaS27WJXO1cVoo6RbGZRLPdB20DofGt6iTaVyh/4Lc
 QehhgfHVuwNnAdQA86i1CC/W+8tdzn59tANbLgwFBFxhNwMsDQu8MN2Uu+lmWAS8uMShM2/SC3r
 3hbyl3OhTmzeUEP62yWCU07EgJaZLJc+iI/EhvxZkYQNxBTH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX3jeBuR2BgI0H
 zh5kG9iRGEd30X0ylYpVzk3hEE+M5RHRgFjrg9uj7++SVQoUvOFqag+sSgqxnsOWmkuGy0L3Lue
 031kLheMq8Ola8pN5wNSKj48TFC+vp0=
X-Proofpoint-ORIG-GUID: xGm_d6jPBs0fg5peNlF8Gr0kYaJfrS9s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX7Jt+IpVHVdmO
 v8xiGIzIpkxLSPuHue1haMt1CHd+eAkxIqar80ceXbwjG4cRCwJLkrLJkD1qcoSs2SlHV5p3ScF
 wVOnvIEbg6BRCmEuaarfq+Gg9vxmagW3uUfrDTohHb9+HEUWYmPRmuKNqEnhnqRWpVjieTTh5dJ
 V5G0sHlLGgF7lL1y7trGt3YGFE1e+VHOk7hkINaSH3QrN7VLgMRQB/qfzmqyBeQaL5EjcZbmYus
 SycAeIQhznftn0UPcV9Frc9M2tpAoN/XMHHSB8kKb1oO5gqcxRB0sKUCrTwZ8tG1yB/WsW0bA/r
 lqofnlxTDPMNkcwzLSfrPKqVjsh/VMxXMSvrXlMsaHtDgGoAn5KxSaZSZMC4Na/iUA2YWtFAcDS
 0Kq8pOePNjycqC5fJ6OP9QcBJl5r2vv7kicHjqamenSfIdUObAuStuDB7h+HvTSOsItAwxMJokL
 LFlAfPgRmjqjNz3FWRA==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf3554 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=1e1h5Y4J_Snmv77hf4sA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: xGm_d6jPBs0fg5peNlF8Gr0kYaJfrS9s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The panel is used directly, without the panel bridge, so nothing sets
its orientation on the connector apart from the workaround in the
get_modes() of some panel drivers, which runs too late.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/tegra/sor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index e384cbd0cbf7..8e419918671c 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3112,6 +3112,8 @@ static int tegra_sor_init(struct host1x_client *client)
 	drm_connector_helper_add(&sor->output.connector,
 				 &tegra_sor_connector_helper_funcs);
 	sor->output.connector.dpms = DRM_MODE_DPMS_OFF;
+	drm_connector_set_orientation_from_panel(&sor->output.connector,
+						 sor->output.panel);
 
 	drm_encoder_init(drm, &sor->output.encoder,
 			 &tegra_sor_encoder_funcs_cleanup, encoder, NULL);

-- 
2.47.3

