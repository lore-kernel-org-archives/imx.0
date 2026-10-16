Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C5437F006
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 04:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123838; cv=none; b=Ij8ZxbWp0bnCiiZeVPcEj/7gOGygUUVn0SXwwLQWjrBVZmcUPDgQzfgd/STMfOwj8C/Z6eahoq9hwt8dQwSd6iYW448ziW3N2wpPuwLi/BFZgwDqubChrp+2w+ejKKkn/Q/mh+MOpqwmcy9+SCnOtx/Ypge1znHOrTmeK+1Unv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123838; c=relaxed/simple;
	bh=6DbU/lmMa56vZUldhssy3WWvEn6fSDga+TC7sPaI04Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BB2Lf8FddwC9mrZH9uNbJsmtpwlCgqiDIOqmMupUVWwtyP8g6DPE3el+/ioCWRmXXT5LR/0roDRCnUTGo0fwGfTJSosj1TWJs6D8jsoCSsIJEwKtkNSly/L5l4DkjwGP6fz0E+M5W30fJoaM7IUJQb4AaqgQqja7AVNPNriaqqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F19Tzzx7; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F19Tzzx7"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso26853665ad.1
        for <imx@lists.linux.dev>; Thu, 15 Oct 2026 21:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123836; x=1792728636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QFH69Gbmd4pLwYRTdAmCw0agJokE4nomqHT+KuDYM2c=;
        b=F19Tzzx7M3+OPUNywggy3cW7tRfa1qn35pcYH4e1U7fD73ISYoaURLa680lcbF69NB
         fEaaE8GGA9SQjRPnvfILR26SSSbVELJSjIr/TmwYLcij0BX4q/+6lSURindl8xoWa132
         L8dENCrw6KIr63XKEnxgnUupgwBi0TlsWQlXiifQiva44YBC87JYx2qbc8ag6lvbEKul
         mKyF9rwQsu4NsbVcIi9Q9yX27yXt2E6Sd3SAtF65BsTbQtLlLsAtOLbPOQHMXrGQ1xoF
         QBcO2HvVe1ZbyskZBQqzwAWjqQm+zNTnNH/aOA5aOH+fS6yyJQdMuMTZAedqe7sV3pv9
         laGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123836; x=1792728636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QFH69Gbmd4pLwYRTdAmCw0agJokE4nomqHT+KuDYM2c=;
        b=jJwVi++N8cD9aKkbX+xuIEU47cLZVJ9Z0DP89QF8mkYg+kvIa+QXkfewi4POgHFRFQ
         OBRckmAzhKrgDxEPqGrnebQoczyRbiYYZyzeMSgfHvyATwPhcQw9er4VhDY1wKQ7QOiE
         g8G3q7ll6titgfgn3MpFD+xQB/ARJPzvkvARQI8DzjRxlyLHa8SOY7bl9gV2kkMmdBCd
         Uon51KprQE7q+bRDVaYwgDm5R0KQ6WI/fFCsrgTZvKHojVuvqA4uBQw3F6MMQlbYKhA6
         SDc2t1+UGSKha84Esj7EN1ssjee45Va7Ld+xRHKJslMlNtmNtaSGFvzz9tTrk/iEcKLj
         dhXg==
X-Forwarded-Encrypted: i=1; AKwUvBxqCH1crQY3tN1ATgLawg+hgPouGjVTjGBYo2xjY2M3u6qDDm5UXEivjKB9HTeVgJZwr+U=@lists.linux.dev
X-Gm-Message-State: AFq9FYJPVHtwtbn6ZPVBQpQGmIX6ipYR86CchXonyIBUcsGhIP4dnhe2
	L8ZSBIo8XAOEFMqUxHHDCtcCSf2RSekVeB/c5HZNhZFCLm0jTpHwvY0x+oKQ3w==
X-Gm-Gg: AYBFou0eIe6VvAQckV8zXxTmYJ3qiQvoJ/+MO4Z1iGRsKMKbvBP80u1pQUNlKABljZN
	zeShEDIzKTy3+iT02D1oggrJLYXb+mrVIpUzCA3gsTfPyy719l8sZ4evRm2Oe/mySn768Pp5SuL
	dfxRcAjl+r/RzoaleSd/VM/Fg7bjMGHoa32OrdZYh4K3pfRNpIQ4aig77ymFbWrzf8cw8CMPpwx
	gCQYwAisAlAQua9Q+q8y1AAZNShtVLG+CSm/Oc138ig+xT0Rf082ewZVVc7Zojzy5Ake8TRRotC
	NV3glev8ErO3OzBaVGA3bKPt9qL9eHWZyDuQY3B+iCVXvl1OBzzqkjaGWLtw/gQI6NV8rcnF8qL
	abgVcIE5W9/fc7GoW4FwGUCRM4RDKebrRMyVup7ttcslCQaBuKLnCpfCebr7FQpj7ohPCVTOsLu
	yLuuoBoUdmC6uHkjJS25FU1Werh1n7wLkUMovHO8i2J67HtfrHbVq01sVI+qLHfkHhzHzg14Qsk
	4TRFS9PdJD8LwLeVgPnP8C3c0ZqL2+0XFZNCwF22ORoxJ4VICi0tpZpZA42xBzBveAzoU00mXrw
	cjsO8wCRmf6u6+F0NRUBldU4
X-Received: by 2002:a17:902:db0b:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2e8427efd9dmr210035865ad.5.1792123836136;
        Thu, 15 Oct 2026 21:10:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:10:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 02/11] ASoC: apple: Explain DAI startup return value handling
Date: Fri, 16 Oct 2026 11:09:37 +0700
Message-ID: <20261016040946.521195-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040946.521195-1-phucduc.bui@gmail.com>
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add a comment explaining why .startup() must return 0 on success
to ensure the DAI is correctly marked as started and prevent
future changes from reintroducing the issue.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/apple/mca.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 3585432ad49b..26022a42a95e 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -535,6 +535,11 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
 	return 0;
 }
 
-- 
2.43.0

