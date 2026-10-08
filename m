Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8610A497B7E
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456082; cv=none; b=eT6NyKsbAsFYaX9K1iRIIJGCiNnvED2zo/+j1NmGMSDvOHSl8Cf9HxGTGM8lbyUcuE/hg22SaNZKTa4bIPQOXzXlj5bFEwcZzCmWDJT4HOZUDOQaZtY29EGLk15BQSKMGVgk+o6oq/Q3d7otE4Ew7N7CMMc0Hw0EV6d3+hqz5DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456082; c=relaxed/simple;
	bh=jX20kt7q2qTPB7R7+kU+hL/352znpJ6GWnJmAMBJbuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCb1BxjFp9Xltzxsr4rkfwt0rAjXQBaSewbevOb6BevhwcfLHUF3WIuXDjyHIwG5id2PqAoPOcXQmL6pfNkW4pSKGoXXcJz4rU7PpK5tkh1aK/408D3da/WrUyP/TIvJcTL33vnACZ3LbZPkOtFXIEv8AAGdFAypABZ/nsX3j7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHbFBWJW; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHbFBWJW"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3516c82e96cso2575374eec.0
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 03:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456080; x=1792060880; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K47qRPAQ198u1Fkbi+cWvMQCeIpB3dQGzP07geOfbJw=;
        b=jHbFBWJWCQ2pcJ/5pTjV/XxwR9M9lFsyXYYbgqQ7S8GMHLN11c9Cc/+Rgfb5t+cOz9
         vsX46/t0+tfGiLV5dP9DY4whTA5fxMFVm5ZyWm3w8ofrg0LGwcWG+q9v032KKgcyarME
         1NZD1mMT1v7YVc64rhYn0U5UQ/307oTga8gFYDqWNBzHaaVw8A/cbT8B47XzHpMaKoC1
         r9gzgjahAd3+NIOxVs5I1YOrekSekgW7A94RsoVE0U54z7tJfCYgFKh3nJl9OVbCff98
         7/3iFwAP4L6bbAPLNhhOEN2nVtPAzZukHBY9vVTlUQCN/RIhO62NpFpeLsUzaaNdRHLZ
         d9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456080; x=1792060880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K47qRPAQ198u1Fkbi+cWvMQCeIpB3dQGzP07geOfbJw=;
        b=D1JMVKhqyVfTPg3JR5UwbRaDX9Po3IACr5Q6e7MeDGrMK3YePHdLBPS8/8m5Wpm1os
         mK3CIW4L9qc++ExmSmVeZF8ei4qiwvzEbpzDlj3qekP8Y8Wn9ebP+pLTHWLgFwVvhD0z
         NlSYmJ8hiziqZV5ZCUwVkEfMOOH9ry0qrQGO4YAxvJkIAdVl5eVHHAJtgODBl33PyM1x
         LvIw6VtH6bz9ok6VXS30BknibtiYNEPPjchRUJ9UZOOCoesMp58RQg2Zmi0DCs5pBZRt
         7W6vC4+EeaLYLQesMrVMdPWhPksp4O1r43eevnEuknsLaU+49tHwsGCgVa75OzyH7CKH
         fpVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJjAc2roG+MAF0QjSEDpW3odfxIEvRdGFjKVxCre6fmdxwWLIYXHQ3AfqATe5IxWFfwiY=@lists.linux.dev
X-Gm-Message-State: AFq9FYKdSsHeDKDLFzzWJT4l/coPZguM6YCYyW59vV5s6Wt/ApFI70ox
	P/A6b7IpTPvcbVl/0VBpEHyj/mFrloM5GPpD2lqYflwQ2bqnDah/EnlK
X-Gm-Gg: AYBFou0Dq/b8a+0iaLmR5grhxBJqdcnG0xX9Ajmi1llETIehEvFUBcv9g0z//CLe6HQ
	JU0CKxwBx5XYfo4XBiBPchtJseP2YWL/eK7mrQ1p5tKNRLw3wyuMY/HNmncmhlh/7eSSGFyrOE4
	YP41Lb87Q12r/eYsL/MMIOpVrnb+R5EUcrwy1ErE1RuRz9CHPh3tdcssufS4WCrH6DGWBTtpUtf
	lQk0ZOUKNSn9cvyC/rNcH4bM9HBCt2oJUbr5Tbf+dQbyu5HoAObJdyC/2aEFnP6YLDWQ5OZ+cEV
	PEO2rzQUtjV67ki+D2Sdgj+0LQrfOde/PsKP8fah6pNxKEOge0bUII10ISKZl0ujee5ZUX5Wyjr
	gnsjV6oGhcbK4gXlSOU5ynCvJakFtjwwulT/hpXPrgV37APCZjCNe5ZLbw4/mc+hXnfBs6EWzPw
	Wy0hR7umLrOysKIvV3yeOzPNgtfMb7zW0OGK6e7b1++AztygWDaZmQVd0HIZrKeiZhgLVXufjKF
	v14DgIbzhHwGyIDInBSbi/zjC+TkJmpEmnXK7GGUrmXWGmpiHK0d8c/zBT1QU1LLR2qJzrlt50h
	H/Z/TZ6ofCaJ9A==
X-Received: by 2002:a05:7300:6ca1:b0:351:4d2d:af26 with SMTP id 5a478bee46e88-3515d86f0aemr8805338eec.2.1791456079525;
        Thu, 08 Oct 2026 03:41:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:41:18 -0700 (PDT)
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
Subject: [PATCH 09/24] ASoC: atmel: atmel-pcm-pdc: Fix atmel_pcm_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:16 +0700
Message-ID: <20261008103831.542533-10-phucduc.bui@gmail.com>
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
from atmel_pcm_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 92dfa6198623 ("ASoC: atmel-pcm: split into two file")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-pcm-pdc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
index 374f93fa6e0b..552bfa30d4ba 100644
--- a/sound/soc/atmel/atmel-pcm-pdc.c
+++ b/sound/soc/atmel/atmel-pcm-pdc.c
@@ -295,6 +295,8 @@ static int atmel_pcm_open(struct snd_soc_component *component,
 	}
 	runtime->private_data = prtd;
 
+	return 0;
+
  out:
 	return ret;
 }
-- 
2.43.0

