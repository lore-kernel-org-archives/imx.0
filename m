Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013066;
	b=yUim2pt4GgIIrWAXX3zstTqWTFN1quzQhj4V5N0bLnkaosnpP/nQ+hs8ThhEwwpBPHEG
	 jkSAB/FzTZ8Ecb/3pWT7E03bu5YDSWWHK6vCSTBc7oRdqBt4MtgXWPcYSgDz59L2+pshM
	 IuEr9MQfmM/LnNCRC0SmGmp+02xviMKa9+Ebpdicl9TiwM2ut8tCTXGVJbwc/X8rYTnSH
	 6GLLQFqmhHZYQmjgVUSHmL6LBC1LmxvGkq4KJ/I2xsrwVANoIdtebrpZFoKm6BQdSXcWs
	 nL7nTKxCzvmXjy9EYrnx0XoB5tJmRM70q6c4SdFuGLUe5rkjBSC8ygWY9CQG3lpcktA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013066;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z+AIXvczawfI8EmCH7mB903AvReMzPtUT6kwOSKhzOs=;
	b=jGmsQ+exvTfLZ4EtYKfZJmM/5HWtaZQDNj3Iuy0bBL3AgrdOQXK7jeZzZa2rOmLaFlUW
	 dK+8RCPr7Zl3kx8+dytV1UdXeX8oazhFY0fg41mqDeuQvxkeaXZjRG/1aFkc0HW861py0
	 YKemQEICGP7ceFYcua4FCmuYwCR6ibNfX51GLIfKDmUWbFttxIingmkWzmfFyQAfLyPmW
	 hReAxsBh2kBQ0KwRuCHJQuZIbK0gy3AupACQE67wER0rhTeMO35FiCUmsYNYhZ+JmVGqs
	 5JKg9ErFt1R6De+CZxYVehXeJIImFOPJcqlwWDkEHrw5HuWUen5DRRwQx8EJRit9UcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SoOl5FT4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jOXe2scl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE8860A3818
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE8860A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SoOl5FT4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jOXe2scl
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtJpK3085733
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+AIXvczawfI8EmCH7mB903AvReMzPtUT6kwOSKhzOs=; b=SoOl5FT4oUwWlrup
	w602dzJ/8d0kluDERn7rgovsGk3r3RrwLNwQY1CGhhoo1cP0kQrBjgHAValXUwzg
	/nXzV3W953+C71g7MRN0LcfE4CEo9jT1GuCfnk06b89a/woNyI++7gScIFEAXtXe
	iBU40U15wQItKd263vXug6XGe1F/e01tDeKIxRGvjOqR35y9cpdgYQXUUb8fqkuu
	xg0spNtF1KCFop80bJfrQH13wlV56QhqN8bw39wHLMVAyJMVJ5Jb1zvjAjpmDZL3
	A+U9NqRS2GAIdMQak8y8608vMdKzlSj/UtHQP2JtpbLO9fpjLmkf+VaC3vtMr2xG
	JLbPEA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3p2et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:11:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so274686285a.1
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 04:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013065; x=1793617865; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+AIXvczawfI8EmCH7mB903AvReMzPtUT6kwOSKhzOs=;
        b=jOXe2sclt0WqIPkOFkz7Nclw6+ELnqbb5nTaDZWltEFfF33hX07yJztjgudM9G+HSh
         xGLYAc+VYlztlbbNrFw2Kl9jYwe208lGzLUewXZbuIhf+YNIEZN5ho6JFTAEOTmT6ihd
         yFgleXyj/moG8CTqryBJuimMsWa2DzeH5UcqM7uKoO08CAfQTKD9HPu6j6zpEFHB/B2F
         YSO5qFgCMF0UtFx+0gQiCQvrjYoJ0cdaSccz1PbpKSraUtoVHIfhihM7jmxaDRWVeJBz
         rLxDNKYHbgVConGuIEcoRXOpgdem5GtL/rsRkaC8l5EY94IIWS2CFRYGnuq5Rts+XxqO
         4N2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013065; x=1793617865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+AIXvczawfI8EmCH7mB903AvReMzPtUT6kwOSKhzOs=;
        b=s12WNq0lcf/j/39DRW+zyvxM2+0CEmL2DIbPFdVruOF6UrD7g9ggFHvdqkOdE3nnEj
         1rCXSfx46A9rlOis6yksZlbMzdQi0Ba/Ch3pscpCIjvFNV26Q1XANBY17se1Aay9JLfd
         csxVeZ4Ujv8WgOSGcJrZDZaY2HoYhmE/SrKY0mZne69nIuRkcZPY6KiGIS7FWEdyKOLl
         l5eOiZuoPr2GlE4fAHiaYX5piNJcSJO8hHZamFWG0nHVLRFwoz9o4UJzQwcNpjvQKyp5
         oN5C+6EkyK7I+BSHEn3aa+RHghNTdC4mO5cgvPEfCrcI/mB/lC3LYU5ejzrzgClitNXZ
         wyQw==
X-Forwarded-Encrypted: i=1; AKwUvBwP/ZUSDNR/W8+9+zHKsAU0HfrQjkcRMlZvxtmugCtY9gjTS6bktG21ZLZgW0SA/ZHYLrM=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ2sjzzTx4KgxFFYvzx7kkt+tHJRhKUj09AQ0MVx+ZmgvIxAxUT
	rxTRdiviqZt3Q9/fhUmhydROF4inawKPZOU3xget0heuzkpzqjYRXbJJy4fqczGlLHJU5lAECCN
	KXWdglP2m2j9H4+IdXDqsIgK9KrHfTltURIqtqph8TGbPWe6910jolts=
X-Gm-Gg: AYBFou2Ykjtykj/VS9GohMUVZzc5WmjK5r3ZUlDhYvNBClx4VvCqdsyUVrlmRa/kCrX
	Xt7FxuHlG2ptp2qKHRVU51HSuNx2pkimILOnOJw/k1JFGrjhUxctQj+cfP9bjq/ebrMagA8EhPL
	/P1rn2v3hlqhW7je5teVNpXSgHomxcTKmQmVIdrMvPVPPBxPoU0AK/AzUQtWWncvrKL6qoiC+DH
	adihBlUDLFT2LlefP3sQQApbL8Ci4EIXdz576LI0CcZaS1RzJFx81j1G5RJySfI5aRm+W5yk4Pb
	JIUlIAB91MX+knITyz0Gs1VXeWJwVEdhF1kCQy5b0ihdFR0ycrN+pRbXc44A28K9J+5LJi7XMt/
	cSDbeKKUjAw4MCNLHFSAWI4Xfy4lYKa6CikndSJ0hGTXNtNMAxoA8TuL51E2b1hp5L1H/A7w+xW
	RR6UEVRtbgYqhA
X-Received: by 2002:a05:620a:4016:b0:93c:8e3f:3036 with SMTP id af79cd13be357-940ef795b3fmr912289185a.4.1793013064652;
        Mon, 26 Oct 2026 04:11:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4016:b0:93c:8e3f:3036 with SMTP id af79cd13be357-940ef795b3fmr912276285a.4.1793013064036;
        Mon, 26 Oct 2026 04:11:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:07 +0200
Subject: [PATCH 18/35] drm/logicvc: set the panel orientation on the
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
Message-Id: <20261026-drm-panel-funcs-v1-18-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qdajy+ZxizCGYRHwcySOH98TyzKssLnXiyy5l4MYQ6w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUOSPb5SkROiJ1qgWHeJ/0zI3xpF33LRg7Kl
 3E+JMtrfDKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DgAKCRCLPIo+Aiko
 1fCrB/sG4pFH+B9sQNL86lviJf0md4fWW8kPrNEAXeSTrNauPGWoN+5qU86gqZnym81fcvJGHWt
 eidB4GCk2J5yvG2doNP8Mgu5fQwLl91HF7cy1j/D0y3dqSMl3DZ4Bx6bni/p1jmv25RYm5RDwWV
 9pUznhEgK6pJdKm5YVNoOIlduKYbWWVGMEvzwSvXdNTYFH8RiG70sb4ThrUeLCmKUSF38QGdbdg
 SqZrAkA4nt1QYH9Y9EVqohUn/NIGzsKGvBK8yURwP9QQvtHIFXvTtWwnoT+jm71gG/gkc8aAvk3
 5dwraj1xDfN8EgWs5GT3ujM5ENWatL+090SyEKJp6JNnP1PC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: pCjGDtQeQR3VO3rA7vMULbNgHv-Pk2DC
X-Proofpoint-ORIG-GUID: pCjGDtQeQR3VO3rA7vMULbNgHv-Pk2DC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXxgOY6cCo3oR3
 320XfhPoTSa0WCYlm76t4P3tA9gGjGzS4/LLmjH7Tm9K1WCj80Fk6BS9rP/GF/wf21Lc33gxwDB
 qog/ylCq3Kml0CEav6quPzWBk6Vzh+w=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf3549 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=1mv1z9nBhO4L486rGt0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX5qSH8gj/rVrG
 CS8XslH9Mok7T2HNiCpyxBJUaP7jkN20Asat4kkChsl/O4jb4oB8FCLm8dWCVW/7olLsRwKgx3B
 q+2tYUI5nFxoAoWOPejD+PzeIRIDZ4+ktlgMfriAW1Mb5rIQEFKZJHdvTqlj66J/f7192RKp/0M
 M/80y2k2gjFyMxdvjVAPlOcVQjy7jUxxoFzCl8Do8EXoKwT2XUzUZGs6NvW0+T/yo+IRju26fI3
 bAQ8u5yzJwyvHr1TqeRfbiIHrhka160DeDdCkCa63cWnMM2QcewCYoVZ7IpJyy3ZRRXXPgWGLDk
 //0gBgSCuF+xLNplrgS+uTIsObyWp4MMhlrvs6pPrvbOaGnm2Fgu4v0L0L/9otZn5WuLSlyNg0c
 NEpoDSUSi6qHf18jITaxr+wpnF+kvpmyzmHZxz9nyokewGaJ83C2cFnbGKTyrWWvtVdYjyoim33
 dk85wyS11E+PM70dLtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The panel is used directly, without the panel bridge, so nothing sets
its orientation on the connector apart from the workaround in the
get_modes() of some panel drivers, which runs too late.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/logicvc/logicvc_interface.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/logicvc/logicvc_interface.c b/drivers/gpu/drm/logicvc/logicvc_interface.c
index 81f760dc07f8..bcbb837c9675 100644
--- a/drivers/gpu/drm/logicvc/logicvc_interface.c
+++ b/drivers/gpu/drm/logicvc/logicvc_interface.c
@@ -194,6 +194,13 @@ int logicvc_interface_init(struct logicvc_drm *logicvc)
 		drm_connector_helper_add(&interface->drm_connector,
 					 &logicvc_connector_helper_funcs);
 
+		ret = drm_connector_set_orientation_from_panel(&interface->drm_connector,
+							       interface->drm_panel);
+		if (ret) {
+			drm_err(drm_dev, "Failed to set panel orientation\n");
+			goto error_encoder;
+		}
+
 		ret = drm_connector_attach_encoder(&interface->drm_connector,
 						   &interface->drm_encoder);
 		if (ret) {

-- 
2.47.3

