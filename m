Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D61737F732
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 04:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123899; cv=none; b=ENESZDnqs+EOBAgt/GGUEHEzY7MzpcXqiN4fQi5lYLaWEG5hAuEyk3rzozd5AlYsvJoWmzvhstVI6J+in2CpZMc3cW0/IV82RxmLNq0+WYtwFdb43fW+8Xn2KBkKvPCN6C2bhCk4DTS+t+QRDGLzYwrFrjeFzg7XBuuLwyetMYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123899; c=relaxed/simple;
	bh=uLjOWXpOgCN4Y4ReFAuUHvuVmI9KZ+NG4nVknG5Mu6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mX8oSPocSAew/PTazJu1Dt/iIRfO4ZRT1gkSI3LfpF7uGh0ec7mmhrAc+u3O8J7SIqtY5oFotngyTouULsuqfh4a6ia1gc7St8vdOrcKwSCuHRU0MjopMkH6vxfkAfajwa1o2sIwHF53f78AlNuhZjne34KcwN5iNap327tpoVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYh5ugYb; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYh5ugYb"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e87c66e556so3196075ad.0
        for <imx@lists.linux.dev>; Thu, 15 Oct 2026 21:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123898; x=1792728698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AfJhOKZbdns69Qk3jxc+qI7b+rXXsiPaDqc4PQO3Hk=;
        b=nYh5ugYbkIZuANSPehNmuIVU4/axuHtk1WcOtF1pB3vrtDZy2uZSxO6CdM6WgU0BlJ
         VI8z7DJSMmtTpL2KtbozuZqSAHNVLqVOKH+OI6+li324cmLYLtRxdldAKWN+usfKWlCf
         peHyKnFnI6IhG5GzE+omxfrVOs6AEUkhCc3baNusq0oLuD1freS257Ujd9niJXx3rrlC
         G2QD094eougoYZqGnOd/ohoU4ORPx8FI2Ic7yrMOKX99hqrgbTGoc5d+FWHE9+cCb4Rg
         YueSZFGLiMQdqcCjcB7DBWaU5rie9wv90b4VX7TFGW8v7wVXY55HX82rf/Vv6vDvqz0C
         CGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123898; x=1792728698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6AfJhOKZbdns69Qk3jxc+qI7b+rXXsiPaDqc4PQO3Hk=;
        b=VYzHW3A25MzcTIglNgYXmMg6pkOCNOOq4+F2GTnQaRkMXQv/W25OGOmoYgNhfplxoZ
         If7a/zs2aBknSzrb3o101mS4fN1pGWcbGZVEeu4fXqBNwT9j2kCv0/d3iJov/2awS0SO
         h/quTzZRT5ei9Zr1eDRan+wQRpQ8OFQJcJiF7Aa7H+q8CRFje4/F4/eXCo4Vpl5nwvvJ
         XmR9wivb0Ls+k2UTW5bUWXARUVje1d4vOctld29g+idIKBknli6UmqtAWO1paXse9vuR
         KBpXJTkVor+Lnj65366PMugsZwzIp17Fw0lj8xlm3wAYATV2YmnKPe39eqpVgEDBfsui
         eyEQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4Ak/EhH9pyfokDOKSlbV+jcqQWx2iXIbj1x0tjlQ5pY+YkyXi8Lxbi6pmY3lK1/u3qkA=@lists.linux.dev
X-Gm-Message-State: AFq9FYLPb8RJFagiNZuZfQmEUAFa9r6pHSCy5Y/WGMzEZogjEiLmep33
	xH7DfUmQkqqQpSjOZAnkxD8cmUiQyR5ktqYuH66GI5Yhgh8K5UFZ4kEh
X-Gm-Gg: AYBFou1g9ojdTXqoNjpiGUSCMBAq5cCrEVk9ucajeaN9QjH+XMmLl4vhXH0nQ3FwbVZ
	2mo2vYa7EbtDHqjwF2vnnOxMpbcVl0MvM8LTvrsK+2ZyXikJdK8UXcPNqPPrIcHGqekjj/1+M6c
	jvQTY/sy22ikLfhTubCW7fjoGjr4+dXs1HE9ZbAJtSQwYvw7AV++mHFHU+wcYzoD7ZhsoSC/oeG
	dbje95Ah4V+UOW1XRcMgficDnp06d2oARwEDUf4qdJ3uRdW9shsVSFX0qGDA/W4QSryBnWrcfl1
	tCgcRND6yv/tXe5an/STBrlG67DU0Z+1v19NA3GOyiFWG1YmX9IuTglAuqIY9iXk3vyJpS6Ggl3
	wWlMtydW8i0bqNW7HTFcWmgEDSRrz+z+7FBYt/MEctMzQZtelYn7BcBiBplTPnEx8hBjswFTzRo
	AcSA2xH86XXft2EUMq4VI4UoWk2472BLbH4Fm8f/kSGyjFXaCpReJJyOsdtUFO9qqzczrwziT7S
	NQHS5vIe5YCs2XqqbIvJUGs7HfwtweQc6lSMpptT+o4NozcSvUaq6k0XCmuiRZB9M6mMilDBJBS
	4LD6J+JmG/Vu5Q==
X-Received: by 2002:a17:902:e54e:b0:2e8:3b2d:c0e1 with SMTP id d9443c01a7336-2e977597291mr13010325ad.41.1792123897928;
        Thu, 15 Oct 2026 21:11:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:11:37 -0700 (PDT)
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
Subject: [PATCH 07/11] ASoC: renesas: msiof: Explain component open return value handling
Date: Fri, 16 Oct 2026 11:09:42 +0700
Message-ID: <20261016040946.521195-8-phucduc.bui@gmail.com>
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

Add a comment explaining why .open() must return 0 on success
to ensure the component is correctly marked as opened and
prevent future changes from reintroducing the issue.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 88618e4b052d..74e2ea002fbb 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1820,6 +1820,11 @@ static int fsi_pcm_open(struct snd_soc_component *component,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure the component is correctly marked as opened.
+	 */
 	return 0;
 }
 
-- 
2.43.0

