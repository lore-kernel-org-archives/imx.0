Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013093;
	b=B85Da//nxBbTjNaVOXNtBMbirZvfG3wWLdpG1WRgPnRPNh9adVoKEH4WfvuoFeVPmno6
	 lwzhuZF/RyjwrTDAWQTR52n+R7UG4BhjEKXUovb8/1T5oiP+pHRpTkIEZZAHgs+5XH9su
	 IzjKP5KQ3Nkb9xw54mCT6253SAKBZWu+v3NTpaGvS3kSgabT1xxiohsNBfneXGZo5ySUD
	 VO0Mv3BnP2OlH2GNxGP2yJLAxg2bxoE/hosuCFNBsM68WIOzm1xe+xau/JD5WMhPfhZzI
	 BwsnBVk6SRfdJGmmsTgUygycKidd6tyvX1+Q9ENrw/YMoJTWJszBoUFlsPrrjgfllhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013093;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4O9H3HrRsFsbm+GWGewBaANCzC7cmfTIgsKp8aEhS6o=;
	b=crbalo0VzVjDyoDDOle43K+mnKZdTGMTkoHOUtOQt2Cdz6wl7cfIg2aGlHBJDu+MEA5u
	 HO5Q5lpbEb5skGVs4lhAwPZkD3e4NZBEXlqCaF8xbfbnXu99VTqzefPasU+UNf7zsHp2f
	 xT89oiCxdO8GGbyzHGVT7hROyhYv9/ijGAvRfbXVDM9nw4FKgLJzV0smQA63UdUmcxR18
	 l/OJlGzGyXG3FAorI+k/3OLP9v6fG+OYIr93WhItEqG/lflO1kOHMqUxh6ttDXSTeMsyS
	 IlbGX4W2knD4x831g4TqBT6CzVuOE6JxD9RBqOmoSbl5vORfdzZaiPutXL111Y6OBcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5M+Dq9Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NTsPk4ez;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F187E60A2626
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F187E60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5M+Dq9Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NTsPk4ez
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAso0I2168546
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4O9H3HrRsFsbm+GWGewBaANCzC7cmfTIgsKp8aEhS6o=; b=N5M+Dq9QVP1joRjl
	WOUq4psI4+CY8GNnh5ovkeh0EjwtPJFHVRKK/tD7tqJ2vyokaIeaSa2GtYnfEhYE
	wtmD/fSJz9EG/DdBBzW5imhl5QJa3jQjaT0PAR019W4Z/LuC4Q0TUV+hdRayDe+a
	Y6v46RQN+6Xmx285U3kQqjYiYN4J7RfcCQqcLXBOdyYbdLeDZvzDZZXLYXfuOeFy
	HLGIdcEsylbH3Z0NZ/SwEPINqy+TSHFn92GL89WZ4GMEp1R66RRvPHJa/V0dv0mS
	JJza3RTtU/0W6vzvRM2jmm1Mqf8GyvduwIU9KMoS9XKkQGaE3lyRE5VQUfylk6/K
	ZXUf1w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60fyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 11:11:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so600247285a.1
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 04:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013091; x=1793617891; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4O9H3HrRsFsbm+GWGewBaANCzC7cmfTIgsKp8aEhS6o=;
        b=NTsPk4ezv7qP41pdSQAUkGhGS2r5l8aSnC31lbDYFjiVa0cv6vqf+iVEJzg2idoG5Q
         qs4BE07yfXAe/zDQioOBTDs5OZfL0+hPdE62ITmGho5C8puDJENGcJO1Z8L7RFAasvSJ
         s1IUgP6Kh8b8TveugiyWJyFH7Vbp+/qGcmY9fS28GCz2O3ELXuLTOFKs4txq2TVKi1b+
         FbQweEGLqT63PDyQGYRfImsp5hRGLUbOB5z9s7hP/r5UN2KpRr6g9xH3uwMWpcgUebku
         8Jx/zW4LXj3bXEQ5k8mF7sbTt9OGb0wG2wVa+xVh20HVGSLbUfAPIKE21R+VmTbLuQvR
         MhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013091; x=1793617891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4O9H3HrRsFsbm+GWGewBaANCzC7cmfTIgsKp8aEhS6o=;
        b=PncqoLUZfYMGroPnAI0sdTgc7OQvvTteBNDDmXowf7anuF34dxBCUwu15dq27gsJuh
         a3px16Rvla+MXq4inKkdp4JL3Acq2VhweYtwhzGg3QqzYOOqMWpCps0YrBlRR4JePg5x
         AvUItcAGTpQadjs6t4foAPOddAijjm9dIqJBS6RbQMwUCwXvkMdfFDEhS+hgPdD+45ta
         kSwjDZvIbM7ucnmZ1u34YeNwIojrSQTiQ/u4tqnzD/2O4haLcadgYaGQEGxiJ0QDTi5Q
         WhUKsjYbhJ7kuwEQxWNYSjFHD0n5iAipBvFNLdbXWVOj6E8BGjA1XDVkKfIhygaQ7bwm
         55Jw==
X-Forwarded-Encrypted: i=1; AKwUvBwR3Rr4YjGis4GLJjBv7MXg3HFIZW7OyHdv1Dah/sSIcUiv41cWaDXzOOHtKri6SCUJeHk=@lists.linux.dev
X-Gm-Message-State: AFq9FYLjLAynDUcL+bg8lWEqnSe9K24r4ffvNJgHvIP5v7SV20Xpk5ab
	9GLZlS4pJ4Ay2MuH6IDkBQ7u37cNDgIPUvKEF0NgsqgpO8Ai0WTpEK4ODkq5VEgSnyvgAaP3Ke8
	fdxGqz5OCrJUq6ZvbvESWFR60ejCTTVN6TmLw5xGhrLUd2pHO2T0orwk=
X-Gm-Gg: AYBFou0s1nlwnnVzA1S0R63QwgVxoZiAz1BlGdwke0E18J9iPzxKSGd8Va10JAO/Uxk
	6UquDA6MR886ZwVakJA9+bs2w93/jJbb4+4sZrDF8CaT1QWqBgRQU0sJa7Q2UFdmKa4sdgKZ3XL
	4QYqmW4WI1yBE3v3Dfh6owofRR6/PN6m0zmu+wIGaXIoUNKr+vh9mBBbL1YqMkvb4kK0V7w2cJK
	k0ljZ7zVlWpBQJ4CgZM/a53acKVYk4ZuCTZygrH5StBC9Lok6KIee2pDeyuVwLiHDyGrYRBhJUT
	UEC8X7UKXZ6XzHf58qIcGJBSh4n8mbNxRrLrDVnjZzka2cVIpvbbThC7Rrg7ai1t9U+IMoD/fMV
	pAtZ7vkwv4yWRCtdJYZtQ5fOfCwP7sSp2f/96HKaOmB1sPrqH7N29o7EFBLdVuF9/AOzSGbu98/
	Yxbk7iBUbOJ/fk
X-Received: by 2002:a05:620a:40c9:b0:93e:58a1:3da6 with SMTP id af79cd13be357-940ef988008mr907343085a.60.1793013090712;
        Mon, 26 Oct 2026 04:11:30 -0700 (PDT)
X-Received: by 2002:a05:620a:40c9:b0:93e:58a1:3da6 with SMTP id af79cd13be357-940ef988008mr907336285a.60.1793013090085;
        Mon, 26 Oct 2026 04:11:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:15 +0200
Subject: [PATCH 26/35] drm/bridge: add the connector_init callback
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
Message-Id: <20261026-drm-panel-funcs-v1-26-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4134;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+p5RUZhLB9ONjVanI2ibjcGEHsUQQIR/tz46EaICKxU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Z9U+G8B/d3ZcYmPZx/LdvE79ePBTwP3d9ZBOfGxZiob
 L7Xtq64k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT+SnP/j/poEUE35Pj9Vxs
 8m7ui3yZtjG8/NGacaK4509uhDp3jP3Jkya/lr/Xy97wVJjhpaTk+ltHUj5ce/RYOOGja2Le/0w
 huVK3mh/HnnXXPdPd+EKhL/NlOPdxQ+Wnxqkbfh48GFq9oly17vgj78WlB2dt9jghmuy33vKJRo
 9q3zaJkKNLPzDwi7+vuldfqBWeeTv1mgT7vDnGB++02zYkxLvn2bIbxiv/thC1dFNxmyRydQOj7
 8qjMxu/KfntywvzMbnqIRZQEfPuwaRjuU1vqtszs2vWKlbZcv61EZU+eE27pG6iqKdCrIjbye4U
 fv6u54bK5ysLQkM/fnEy+HdcJ3yZ1uZtVmclFr37dqMGAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 4aN4_7e9g2y-Y51ZfmbL878lESnJ0YY8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX41yoaIsJ9UQG
 sXdgOv4OfmswEbXcEHCxbv9xvMKMDqMSv8mNzcnYJvQLIXDvJsaL+3eGIhPoRj1immgjoOD3E/7
 yix6ipzDiHxajQjryb25sFcWhB3xT5Hj38kSXotzqGCwmogKFRCDoUCm3KxW4AAP6CH0YeOJvXp
 z78E/uJq7MH6hMDsT26Tct7X3nWcl6NLJDyjEdwrhiI2MGMW9MT/ZWwQM/0HpRUlMuRlwVOnIHG
 f5N7uIUMRVQvaVdFGJBWqAw0dyayIvpMc9gHiTBl11rdHGNyMSPLmTqhr6vFU7d7NnHrIyqiCau
 JQZ0Vh37wPQ+ZH3FRqjTr1CnuPht7Hog17fLoMRZxkb+BAOPkyf+51wvVpEq/fuBmc1SQjwe2Sx
 wyY6E2hbcj+yCCsVInyo68hP+O4zxSAyzvJjw1qxon28F5CqkP2f0d3lsYhyUXeSCgYZVlsheap
 b2R2LneblQf/82G50fw==
X-Proofpoint-ORIG-GUID: 4aN4_7e9g2y-Y51ZfmbL878lESnJ0YY8
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf3564 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=0bT5yVRSAMwfGHIoJaMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX7UapPLJdD3Y4
 ykBWqzlWjynQlIPpodvXUAegPxdPqV6Aw2SHPCesMfU41wIMQVTPGtRCcCGj5Db9cT57bP4QOIi
 6k/fZMGCPi0VgC4b/vUospz4QEwRThE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

A bridge has no way to take part in setting up the connector created for
its chain. Whatever a bridge needs on the connector ends up special-cased
in the code creating it: drm_bridge_connector looks for a panel bridge in
order to set the panel orientation and checks the dedicated
drm_bridge.support_hdcp flag to attach the content protection property,
the msm DP driver attaches the DP subconnector property after creating
the bridge connector. A DP bridge which is not a part of the display
driver cannot get the DP properties attached at all.

Add an optional callback for that and a function calling it for the
whole chain. The function is separate from drm_bridge_connector, so that
the drivers creating the connector on their own can use it too.

Only the panel orientation is going to be converted for now,
support_hdcp and the DP properties are left for later.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_bridge.c | 31 +++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     | 23 +++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e7f9e6d58927..10c8388594a3 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -846,6 +846,37 @@ void drm_bridge_chain_mode_set(struct drm_bridge *first_bridge,
 }
 EXPORT_SYMBOL(drm_bridge_chain_mode_set);
 
+/**
+ * drm_bridge_chain_connector_init - let the bridges set up a connector
+ * @encoder: encoder the connector has been created for
+ * @connector: the connector
+ *
+ * Calls &drm_bridge_funcs.connector_init for all the bridges in the encoder
+ * chain, starting from the first bridge to the last. It should be called by
+ * the code creating a connector for the chain, after the connector has been
+ * initialized and before it is registered.
+ *
+ * RETURNS:
+ * 0 on success, a negative error code on failure
+ */
+int drm_bridge_chain_connector_init(struct drm_encoder *encoder,
+				    struct drm_connector *connector)
+{
+	drm_for_each_bridge_in_chain(encoder, bridge) {
+		int ret;
+
+		if (!bridge->funcs->connector_init)
+			continue;
+
+		ret = bridge->funcs->connector_init(bridge, connector);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_bridge_chain_connector_init);
+
 /**
  * drm_atomic_bridge_chain_disable - disables all bridges in the encoder chain
  * @bridge: bridge control structure
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1981d24a700d..470b9c6cb12a 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -881,6 +881,27 @@ struct drm_bridge_funcs {
 				    struct drm_connector *connector,
 				    bool enable, int direction);
 
+	/**
+	 * @connector_init:
+	 *
+	 * Called when a connector is created for the encoder chain containing
+	 * this bridge, before the connector is registered. This lets the bridge
+	 * set up the parts of the connector it knows about, e.g. attach
+	 * properties.
+	 *
+	 * The callback is invoked through drm_bridge_chain_connector_init(),
+	 * it is not tied to the bridge being the last one in the chain or to
+	 * the &drm_bridge.ops of the bridge. The bridge chain is locked while
+	 * it runs, so it must not attach or detach bridges.
+	 *
+	 * This callback is optional.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*connector_init)(struct drm_bridge *bridge,
+			      struct drm_connector *connector);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -1484,6 +1505,8 @@ enum drm_mode_status
 drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
 			    const struct drm_display_info *info,
 			    const struct drm_display_mode *mode);
+int drm_bridge_chain_connector_init(struct drm_encoder *encoder,
+				    struct drm_connector *connector);
 void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 			       const struct drm_display_mode *mode,
 			       const struct drm_display_mode *adjusted_mode);

-- 
2.47.3

