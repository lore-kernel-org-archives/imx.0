Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F6D497B94
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456252; cv=none; b=ky7NS9nj0qebGhGkj3qV4TPymU/xVKPPa/IQbUa75hPqKjOZi2CNpkXZgNrpTxRyUm04shSue4cZWQyCD1DtBmQ1c1tUenFae039OQEVAY5KaJpg8OBu2X4cMa7N3u7TpzcuFJiRB7y6FMxHqAV6k8IzZ4LQHLNG6mXCDT8UXes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456252; c=relaxed/simple;
	bh=l1HC2BErZTeFg9PacGbdvzlNTd3R8UQWG+h9EUzSDPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBb7E/eEB2t9BUtiIkVFcklfvr0UDI5aYgslJ88lacKZTS70CsHsKpnLXraYCr5U80jozCA2B/5IW/c5iZvpP+UvxBfldile356q6I8p1gngRU43BS9tUOLZaEZku8RsIGzRoBZEMBZ9qtZEeWChcT3DuiaYCsPt58lgvzPlvAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhgwfNnN; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhgwfNnN"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3515f9a5d25so4194411eec.0
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456250; x=1792061050; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLXKgERfdgngku3yQUE+LcMSxD8yCQ+a/l+GKCCFjt4=;
        b=MhgwfNnN+pcQloLH3t2wAfdvMmZ+HfR7c1FOS21TfYg66M8RbfRLWzc8VeOi8tGXeF
         MoysF3poH6O/5DStmLtfDw6DDThuaFmO7YRVqisKKIxw61b7RoUZ/X3p+00jVArG4+s+
         gy3Mf9bdpLkvZqQT3PYtrxML04FL/boUCKU0u9MKcbwtMpJBNjkmz4zsj/qMEyD5lmm2
         xhKyAFbhgZsY+yluy16lxeKVTUHhgCOuZvHqlbXLXxQvG5fybU26NTDUIHzYS+5Jhwaz
         ZUXX+C/GEcekrAAJvTDrdQpvhvUAEIWocZVogElXOKOniStU4N6FCjnuVaoTMEf25MHR
         La/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456250; x=1792061050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uLXKgERfdgngku3yQUE+LcMSxD8yCQ+a/l+GKCCFjt4=;
        b=YCYM61SY4g828KQjBIRWD+Ue5mT8WzsgX0Z0K8zDg3If2yhXcFsd9J2kJANLHNlYrC
         3ItAUBM4U1L+m+Pw7VtdjVlWN0gb+MQ/WbB43reVMUYdKzYur9yL5AZ30BlZk4hA88eU
         vRDVWI6jDiu6P1ySvQcIsHaLHCOyvY1T65KY+i60tsgR9WvNjkUSHaRe218/5JuzfO2n
         qccttd53D4I6kn/J/92CT9q1WiseLC4gio85QLvAOZZjpb/SbIHS9GVjvh/sdohWuITn
         Cnf37M7NuHqg7mYnIs0k5NU/xeO1VPhF3QLvEOmCzfkktwSOPYPUOSa9VEamgPOfVsxb
         xJEQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4bObF/X0Ja/yeNml8PER1ZfPmnNRmZJdt86S7cKheMCi5Wz+DlG1PLqJr3YZ8McgoN44=@lists.linux.dev
X-Gm-Message-State: AFq9FYKjs4S+zM2ddJaOCAA+d9vmOJ9FBxupqYEcUn4dmmC8WQyZZ5Rj
	YlF2QKs6cpW0Dpa7nii3xfV6//psspqXXq9nR/72P1evsRgp3JnlTXmG
X-Gm-Gg: AYBFou2bXiZzfO4dRpqlOO41SSrymp7CPkBH/8h0llymPC5VpVc374vkKGPBRQHqVPW
	mP7g33WZTOdwA6SlIgaPK6sbiR7+w9Pz5rYgsopSDN8TV1/7CQFPIU3FCPW6P77dKhX68jLEw/c
	PC3ESYXAO040TwdZq9pSbCewqExBYg1dfKZxr9BRa+w4gmXL2hVddbImNf+cwnWJ46RAxUjry+Z
	GPzfC8hICcXlmnSGxiwQHn2Op3+OJoW49k1oenTQ/gJs7xsAA8dexCC+XVKjT4+TfINghuwhOF4
	BGWTffAfjNxxDOurGRzgnvsckW6jxf1UIO1gd1ZCp0ohm9fTm9v+K3HtOQ0MKyrA9AhZowHqXi5
	j60H0dn+Ia/wRnLiZG89dYCthjRD7rsWHYmigfJs3ZGtPJCpys8fu7mLCwknP4vL0z450bVEjh+
	s1wj3dzuoD11gvFqBlXdtv0+RGtpy8VC6Aln8yF64rt1qu5WuHxVCq8HrsfZdhC72fbh0nIy+AF
	HjYs8hHTqghtpKcZ/1OGTvhCVL4hVn41SYftIyCTEYVoxoenbW08fiJqRfnVasRiIHB9sEbSzMU
	1VfPf4e9ZXR/2w==
X-Received: by 2002:a05:7300:d214:b0:352:2e10:10c3 with SMTP id 5a478bee46e88-3522e10401bmr948755eec.36.1791456249630;
        Thu, 08 Oct 2026 03:44:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:44:09 -0700 (PDT)
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
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
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
Subject: [PATCH 20/24] ASoC: renesas: fsi: Ensure the component is marked as opened on success
Date: Thu,  8 Oct 2026 17:38:27 +0700
Message-ID: <20261008103831.542533-21-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from fsi_pcm_open(). ASoC only marks the component as opened when
.open() returns 0.

This currently has no functional impact, as fsi_soc_component has no
.close() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the component is correctly marked
as opened.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 23b7e63596d3..88618e4b052d 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1811,14 +1811,16 @@ static int fsi_pcm_open(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int ret = 0;
+	int ret;
 
 	snd_soc_set_runtime_hwparams(substream, &fsi_pcm_hardware);
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 static snd_pcm_uframes_t fsi_pointer(struct snd_soc_component *component,
-- 
2.43.0

