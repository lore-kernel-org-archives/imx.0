Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246C431DDBB
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 04:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123850; cv=none; b=NO2dDlGSXybx4LTER6HZcuoDlbl9ukm1gEebjed36m8XsTYYOs9stX0J90bOWTsPTQ/sSCyhdvk9nMyYoDHvb1fOCj4EksSTxd/bX+D/mH7Y0QsC6aLVBOuK/yK2ELKsz66TPkJTEwaMeQKgcA5H0NiXCu4Giae8K0Myy/s8VoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123850; c=relaxed/simple;
	bh=vdLtUhxLS4lGvufa56SD+uGcYjQygq5MJ/eIX5HtXec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmVchzIdga+9ls8tlXksfKFsmFbGeY7ZCiNYq+9k3aE8Ea9pdC9gFR9tG2FdCs6BN0kOPW3ABTBHTnM331QUu8kZnx7i4bpV+SQy3lHzmtCF0JeW0YOEhiaEl9PBAs1oAOgrh/SB5doMEwBxDpnL2BmKjEmBEiTGBQZK/Wg0cwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYLwKIfx; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYLwKIfx"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e608cd460eso33151795ad.3
        for <imx@lists.linux.dev>; Thu, 15 Oct 2026 21:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123848; x=1792728648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRXMnaMYG3V2xMcW/3gwqdrm84/mm5oGaOhlRKzj2Og=;
        b=aYLwKIfxqapsXKFgI5Op7n5zqUCVjSYELfsE2cSxjOsM1fdRkFe2HVck5shfu5GtaQ
         CZ5ZdWo/0N4mj3/397WV0/3fLB/mCb8UEHal7OsVpaVacJshV6FLIDynT3qvPhmd12A2
         eJ+8maEEaXbOqP3xiJKBDFmA2W3uU/lLjLwudk5b+TDa1nHrgeYH9w6Ud64wtxd6JQxP
         bR+rxKLcX5TSrqaom/rS4Tzwll13j+HvlSO2H7R9LBzYv0/KZt7d/YNgSl30KYNIOPY9
         1ysgcY6yyZVvdnAQ0AqEuKE4lwhkrSp/UuSU0M4xC1v5ao8qtnGcwAy+Ko+n/NgfWMzX
         1BhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123848; x=1792728648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cRXMnaMYG3V2xMcW/3gwqdrm84/mm5oGaOhlRKzj2Og=;
        b=uZ0F6z6fvzrqGg0k0oHEVQcfLhZ1guz53X0ptHCCx76WSFpmq5EtteckfIwLTEFuze
         7Utt5F3uStnsdummbf3P6dSth++2ekCRPnOM+BSL4EdKmMtI0Tm/kkY46qjoW+mERqCH
         ToHfpNMRzactcfO3aUnY9mYDrgc0gFzmp+1gK4w8s3k/k6wW1hk7NS61t/Uz+DUDZWHB
         cuixO9ZzhTvtMu4ydyMCYXgGzGOOJZBl7KZ0tv+8q2dGbC326RUSJ2Z9qj8n9SkCs/Z7
         3c7aI9dJO3IGBYD5Qf4ak2h5QRko1356q+xh39kUPRE7wgwye3hK0poEnBPdxTeW0x5W
         b4rQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9cvLb+dNUc7wh8/OXFfYlfvKLQrCZp8BQAWUIPx1VyPEoXiti1+9qD9nAFwQN9vmnH+U=@lists.linux.dev
X-Gm-Message-State: AFq9FYI73EOLm+kPLcgOaTdVshstkxDBYRJKD7lmS7XsdDtxnn3RGJex
	aCHDmS5Kt/mEobHEWJ4z8is0pmPPiWehmMzHoXrTcz/kfdynbTKPpvqd
X-Gm-Gg: AYBFou1JrJoLlpnW3gXFacOs9x3nez6c7Vf4hg2vCBXqusKLVdCJGjv4f0Blp4Zeudg
	UEyy36LVRr/9m77HegiqGtio36epK6B2el9AZ8HR9GChrDOrmkEd2x8s6wvk6VNBs+woe9m+KiS
	uxx78Te0voRxNpe0/kAsOHuH3k2V/3p8jY2MFuU4EIcQd53W/jAgMjRmzX5p3kE0z4gJjl7+1X8
	MywGqvSj4pwUUjHAAILBSqpun6KP2puhi9s4qS8CxqMC/XoaG9ZR81jQR8MMd+2WUSF5m5lqAb5
	hqLreTemH8nONWQU7bQpfJcgpMDe2thkdMHci/WHj1lgSF7NrwleJWDrl9fLJqCkwN4Z9Dmci5x
	vbWOUhDs5fctWW1j5lEXRSSj8eZND7csmIAgMoxkSifcy5hbJoqYsJW9JXuyAKeGdZhqwyZZbuu
	sDeFYuIKp1gQJaVqghBoMP0XO4xqE3OAjqYKs/KTVn/NQo8NepNxFa64Noe5i/m90OCnNo4R3fU
	em9NWpqvu7oOBwNg8SLPljVpYuN1da4j+xbsmZVA5fr/IKR7Oddy6pdve8BW/oGthfvz8AJsHOs
	+TsuFitdgCZwsQ==
X-Received: by 2002:a17:903:181:b0:2e9:842d:3c34 with SMTP id d9443c01a7336-2e9842d3dd5mr10658595ad.13.1792123848458;
        Thu, 15 Oct 2026 21:10:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:10:48 -0700 (PDT)
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
Subject: [PATCH 03/11] ASoC: atmel: Explain component open return value handling
Date: Fri, 16 Oct 2026 11:09:38 +0700
Message-ID: <20261016040946.521195-4-phucduc.bui@gmail.com>
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
to ensure proper rollback handling and prevent future changes
from reintroducing the issue.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-pcm-pdc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
index 552bfa30d4ba..4cedf2ad934d 100644
--- a/sound/soc/atmel/atmel-pcm-pdc.c
+++ b/sound/soc/atmel/atmel-pcm-pdc.c
@@ -295,6 +295,11 @@ static int atmel_pcm_open(struct snd_soc_component *component,
 	}
 	runtime->private_data = prtd;
 
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 
  out:
-- 
2.43.0

